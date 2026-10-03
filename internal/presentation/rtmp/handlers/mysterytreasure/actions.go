// Open-sourced by BaoLT

// Mystery Treasure RPC action implementations.
// All handlers reply via _result (Responder pattern).
// onGetChipBagData delegates to the rune service to avoid duplicating the chip-bag store.
// getMysTreBuffByKind validates kind in [1,64] and returns a documented-empty buff list.
// updateMysTreBagPush is a shared helper for outbound bag pushes.
package mysterytreasure

import (
	"strconv"

	appmystre "mcgame-server/internal/application/mysterytreasure"
	apprune "mcgame-server/internal/application/rune"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const (
	minBuffKind = 1
	maxBuffKind = 64
)

func charIDFromCtx(ctx *rtmp.RPCContext) (int64, bool) {
	if ctx == nil || ctx.CharacterID == "" {
		return 0, false
	}
	id, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return 0, false
	}
	return id, true
}

func (h *Handler) GetMysBookData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("onGetMysBookData called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, pkgerrors.ErrUnauthorized
	}

	st, err := h.mysService.Load(ctx.Context, charID)
	if err != nil {
		h.logger.Error("onGetMysBookData: load failed", zap.Int64("char_id", charID), zap.Error(err))
		return map[string]interface{}{}, nil
	}

	return appmystre.MysBookToWire(st.MysBook), nil
}

func (h *Handler) GetMysMakeData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("onGetMysMakeData called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, pkgerrors.ErrUnauthorized
	}

	st, err := h.mysService.Load(ctx.Context, charID)
	if err != nil {
		h.logger.Error("onGetMysMakeData: load state failed",
			zap.Int64("char_id", charID),
			zap.Error(err))
		st = appmystre.DefaultState()
	}

	learnedRec := make(map[string]interface{}, len(st.LearnedRec))
	for k, v := range st.LearnedRec {
		learnedRec[k] = float64(v)
	}

	return map[string]interface{}{
		"learnedRec": learnedRec,
		"skiLvl":     float64(st.SkilLvl),
		"skiPt":      float64(st.SkiPt),
	}, nil
}

func (h *Handler) GetMysBagData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("onGetMysBagData called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, pkgerrors.ErrUnauthorized
	}

	st, err := h.mysService.Load(ctx.Context, charID)
	if err != nil {
		h.logger.Error("onGetMysBagData: load state failed",
			zap.Int64("char_id", charID),
			zap.Error(err))
		return appmystre.BagToWire(map[string]appmystre.BagSlot{}), nil
	}

	return appmystre.BagToWire(st.Bag), nil
}

func (h *Handler) GetChipBagData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("onGetChipBagData called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, pkgerrors.ErrUnauthorized
	}

	if h.runeService == nil {
		return apprune.ChipBagToWire(map[string]apprune.ChipSlot{}), nil
	}

	chipBag, err := h.runeService.GetChipBag(ctx.Context, charID)
	if err != nil {
		h.logger.Error("onGetChipBagData: load chip bag failed",
			zap.Int64("char_id", charID),
			zap.Error(err))
		return apprune.ChipBagToWire(map[string]apprune.ChipSlot{}), nil
	}

	return apprune.ChipBagToWire(chipBag), nil
}

func (h *Handler) GetMysTreBuffByKind(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("getMysTreBuffByKind called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	if ctx.CharacterID == "" {
		return nil, pkgerrors.ErrUnauthorized
	}

	if len(args) != 1 {
		h.logger.Warn("getMysTreBuffByKind: wrong arg count",
			zap.Int("count", len(args)))
		return nil, pkgerrors.ErrInvalidArgs
	}

	kindFloat, ok := args[0].(float64)
	if !ok {
		h.logger.Warn("getMysTreBuffByKind: non-numeric kind arg")
		return nil, pkgerrors.ErrInvalidArgs
	}

	kind := int(kindFloat)
	if kind < minBuffKind || kind > maxBuffKind {
		h.logger.Warn("getMysTreBuffByKind: kind out of range",
			zap.Int("kind", kind))
		return nil, pkgerrors.ErrInvalidArgs
	}

	return map[string]interface{}{}, nil
}

func (h *Handler) GetMysTreBuffSimpleData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("getMysTreBuffSimpleData called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	if ctx.CharacterID == "" {
		return nil, pkgerrors.ErrUnauthorized
	}

	return map[string]interface{}{}, nil
}

func SendUpdateMysTreBag(conn *rtmp.Connection, bag map[string]appmystre.BagSlot, logger *zap.Logger) {
	if conn == nil {
		return
	}
	wire := appmystre.BagToWire(bag)
	if err := conn.SendCallback("updateMysTreBag", wire); err != nil {
		if logger != nil {
			logger.Warn("updateMysTreBag: push failed", zap.Error(err))
		}
	}
}
