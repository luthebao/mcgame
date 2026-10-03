// Open-sourced by BaoLT

// mysTreObjResolve handler: dismantles mystery-bag items selected by the client.
// Wire contract: client sends [mysItemDic] with a null responder (push-based).
// Push order: updateRuneChipBag (if chips changed), onAddMoney for runeExp delta,
// onAddMoney for decoSilver delta, updateMysTreBag (updated bag), then _result [undefined].
//
// Yield rate: 1 runeExp + 1 decoSilver per item-unit consumed.
// OPEN QUESTION: no server-side yield/rate table exists yet for mystery-item dismantling.
// These conservative constants (resolveRuneExpPerItem / resolveDecoSilverPerItem) are a
// documented placeholder and must be updated once the actual game-data table is confirmed.
//
// Atomicity: the mystery bag is consumed and persisted FIRST via mysService.Save,
// then the character currency credit is persisted SECOND via chars.Save. If chars.Save
// fails after the bag is consumed, the player loses the dismantled items with no currency
// credit — a known non-atomic forward-LOSS window. This consume-before-credit ordering is
// deliberate (never reverse to credit-first) so a crash can only ever LOSE items, never
// DUPLICATE currency on retry. True atomicity is deferred to a future single-transaction
// PG function.
//
// Security guards applied in order:
//  1. Authentication: CharacterID must be present.
//  2. Input cap: mysItemDic must have <= maxResolveDictSize entries.
//  3. Per-entry: slot/mid/num parse as integers; num > 0.
//  4. Ownership: owned quantity in the bag >= requested num for every entry.
//  5. Currency mutation only after all validation passes (fail-fast).
//  6. Raw errors are never echoed; only a generic sentinel reaches the client.
package mysterytreasure

import (
	"fmt"

	appmystre "mcgame-server/internal/application/mysterytreasure"
	apprune "mcgame-server/internal/application/rune"
	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const (
	maxResolveDictSize       = 200
	resolveRuneExpPerItem    = 1
	resolveDecoSilverPerItem = 1
)

type resolveEntry struct {
	slot    int
	slotKey string
	mid     int
	num     int
}

func (h *Handler) ObjResolve(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("mysTreObjResolve called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	if ctx.CharacterID == "" {
		return nil, pkgerrors.ErrUnauthorized
	}

	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, pkgerrors.ErrUnauthorized
	}

	if len(args) < 1 {
		h.logger.Warn("mysTreObjResolve: missing mysItemDic arg",
			zap.Int64("char_id", charID))
		return nil, pkgerrors.ErrInvalidArgs
	}

	rawDict, ok := args[0].(map[string]interface{})
	if !ok {
		h.logger.Warn("mysTreObjResolve: mysItemDic is not an object",
			zap.Int64("char_id", charID))
		return nil, pkgerrors.ErrInvalidArgs
	}

	if len(rawDict) > maxResolveDictSize {
		h.logger.Warn("mysTreObjResolve: mysItemDic exceeds max size",
			zap.Int64("char_id", charID),
			zap.Int("size", len(rawDict)))
		return nil, pkgerrors.ErrInvalidArgs
	}

	entries, err := h.parseAndValidateDict(rawDict, charID)
	if err != nil {
		return nil, pkgerrors.ErrInvalidArgs
	}

	if len(entries) == 0 {
		h.logger.Info("mysTreObjResolve: empty valid entry list, no-op",
			zap.Int64("char_id", charID))
		return nil, nil
	}

	st, loadErr := h.mysService.Load(ctx.Context, charID)
	if loadErr != nil {
		h.logger.Error("mysTreObjResolve: load mystery state failed",
			zap.Int64("char_id", charID),
			zap.Error(loadErr))
		return nil, pkgerrors.ErrSystemError
	}

	if err := h.validateOwnership(st, entries); err != nil {
		h.logger.Warn("mysTreObjResolve: ownership validation failed",
			zap.Int64("char_id", charID),
			zap.Error(err))
		return nil, pkgerrors.ErrInvalidArgs
	}

	var totalUnits int
	for _, e := range entries {
		totalUnits += e.num
	}

	runeExpDelta := totalUnits * resolveRuneExpPerItem
	decoSilverDelta := totalUnits * resolveDecoSilverPerItem

	if h.chars == nil {
		h.logger.Error("mysTreObjResolve: character accessor not configured",
			zap.Int64("char_id", charID))
		return nil, pkgerrors.ErrSystemError
	}

	char, charErr := h.chars.GetByID(ctx.Context, charID)
	if charErr != nil || char == nil {
		h.logger.Error("mysTreObjResolve: load character failed",
			zap.Int64("char_id", charID))
		return nil, pkgerrors.ErrSystemError
	}

	consumeItems(st, entries)

	if saveErr := h.mysService.Save(ctx.Context, charID, st); saveErr != nil {
		h.logger.Error("mysTreObjResolve: save mystery state failed",
			zap.Int64("char_id", charID),
			zap.Error(saveErr))
		return nil, pkgerrors.ErrSystemError
	}

	if addErr := char.AddCurrency(domainchar.CurrencyRuneExp, runeExpDelta); addErr != nil {
		h.logger.Error("mysTreObjResolve: AddCurrency RuneExp failed",
			zap.Int64("char_id", charID),
			zap.Error(addErr))
		return nil, pkgerrors.ErrSystemError
	}

	if addErr := char.AddCurrency(domainchar.CurrencyDecoSilver, decoSilverDelta); addErr != nil {
		h.logger.Error("mysTreObjResolve: AddCurrency DecoSilver failed",
			zap.Int64("char_id", charID),
			zap.Error(addErr))
		return nil, pkgerrors.ErrSystemError
	}

	runeExpAfter := char.RuneExp
	decoSilverAfter := char.DecoSilver

	if saveErr := h.chars.Save(ctx.Context, char); saveErr != nil {
		h.logger.Error("mysTreObjResolve: save character failed",
			zap.Int64("char_id", charID),
			zap.Error(saveErr))
		return nil, pkgerrors.ErrSystemError
	}

	if ctx.Connection != nil {
		h.pushResolveCallbacks(ctx, charID, runeExpDelta, int64(runeExpAfter), decoSilverDelta, int64(decoSilverAfter), st)
	}

	h.logger.Info("mysTreObjResolve: success",
		zap.Int64("char_id", charID),
		zap.Int("units_consumed", totalUnits),
		zap.Int("rune_exp_delta", runeExpDelta),
		zap.Int("deco_silver_delta", decoSilverDelta))

	return nil, nil
}

func (h *Handler) parseAndValidateDict(rawDict map[string]interface{}, charID int64) ([]resolveEntry, error) {
	entries := make([]resolveEntry, 0, len(rawDict))
	for slotStr, rawVal := range rawDict {
		slotInt, err := parseIntFromInterface(slotStr)
		if err != nil || slotInt < 0 {
			h.logger.Warn("mysTreObjResolve: invalid slot key",
				zap.Int64("char_id", charID),
				zap.String("slot", slotStr))
			return nil, fmt.Errorf("invalid slot key %q", slotStr)
		}

		entry, ok := rawVal.(map[string]interface{})
		if !ok {
			h.logger.Warn("mysTreObjResolve: slot entry is not an object",
				zap.Int64("char_id", charID),
				zap.String("slot", slotStr))
			return nil, fmt.Errorf("slot %q value is not an object", slotStr)
		}

		mid, midOk := parseIntVal(entry["mid"])
		num, numOk := parseIntVal(entry["num"])
		if !midOk || !numOk {
			h.logger.Warn("mysTreObjResolve: non-integer mid/num",
				zap.Int64("char_id", charID),
				zap.String("slot", slotStr))
			return nil, fmt.Errorf("slot %q: non-integer mid or num", slotStr)
		}
		if mid <= 0 || num <= 0 {
			h.logger.Warn("mysTreObjResolve: non-positive mid/num",
				zap.Int64("char_id", charID),
				zap.String("slot", slotStr),
				zap.Int("mid", mid),
				zap.Int("num", num))
			return nil, fmt.Errorf("slot %q: mid=%d num=%d must be positive", slotStr, mid, num)
		}
		entries = append(entries, resolveEntry{slot: slotInt, slotKey: slotStr, mid: mid, num: num})
	}
	return entries, nil
}

func (h *Handler) validateOwnership(st *appmystre.MysteryTreasureState, entries []resolveEntry) error {
	for _, e := range entries {
		bagSlot, exists := st.Bag[e.slotKey]
		if !exists {
			return fmt.Errorf("slot %d not found in bag", e.slot)
		}
		if bagSlot.Mid != e.mid {
			return fmt.Errorf("slot %d: mid mismatch (bag=%d req=%d)", e.slot, bagSlot.Mid, e.mid)
		}
		if bagSlot.Num < e.num {
			return fmt.Errorf("slot %d: insufficient quantity (have=%d want=%d)", e.slot, bagSlot.Num, e.num)
		}
	}
	return nil
}

func consumeItems(st *appmystre.MysteryTreasureState, entries []resolveEntry) {
	for _, e := range entries {
		bagSlot := st.Bag[e.slotKey]
		bagSlot.Num -= e.num
		if bagSlot.Num <= 0 {
			delete(st.Bag, e.slotKey)
		} else {
			st.Bag[e.slotKey] = bagSlot
		}
	}
}

func (h *Handler) pushResolveCallbacks(
	ctx *rtmp.RPCContext,
	charID int64,
	runeExpDelta int,
	runeExpTotal int64,
	decoSilverDelta int,
	decoSilverTotal int64,
	st *appmystre.MysteryTreasureState,
) {
	conn := ctx.Connection
	if conn == nil {
		return
	}

	if h.runeService != nil {
		chipBag, err := h.runeService.GetChipBag(ctx.Context, charID)
		if err == nil {
			wire := apprune.ChipBagToWire(chipBag)
			if sendErr := conn.SendCallback("updateRuneChipBag", wire); sendErr != nil {
				h.logger.Warn("mysTreObjResolve: updateRuneChipBag push failed",
					zap.Int64("char_id", charID),
					zap.Error(sendErr))
			}
		}
	}

	if runeExpDelta > 0 {
		if sendErr := conn.SendCallback("onAddMoney",
			float64(charID),
			"runeExp",
			float64(runeExpDelta),
			float64(runeExpTotal),
		); sendErr != nil {
			h.logger.Warn("mysTreObjResolve: onAddMoney runeExp push failed",
				zap.Int64("char_id", charID),
				zap.Error(sendErr))
		}
	}

	if decoSilverDelta > 0 {
		if sendErr := conn.SendCallback("onAddMoney",
			float64(charID),
			"decoSilver",
			float64(decoSilverDelta),
			float64(decoSilverTotal),
		); sendErr != nil {
			h.logger.Warn("mysTreObjResolve: onAddMoney decoSilver push failed",
				zap.Int64("char_id", charID),
				zap.Error(sendErr))
		}
	}

	SendUpdateMysTreBag(conn, st.Bag, h.logger)
}

func parseIntFromInterface(s string) (int, error) {
	n := 0
	if len(s) == 0 {
		return 0, fmt.Errorf("empty string")
	}
	if len(s) > 10 {
		return 0, fmt.Errorf("slot key too long")
	}
	for _, c := range s {
		if c < '0' || c > '9' {
			return 0, fmt.Errorf("non-digit character %q", c)
		}
		n = n*10 + int(c-'0')
	}
	return n, nil
}

func parseIntVal(v interface{}) (int, bool) {
	switch x := v.(type) {
	case float64:
		return int(x), true
	case int:
		return x, true
	case int64:
		return int(x), true
	}
	return 0, false
}
