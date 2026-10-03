// Open-sourced by BaoLT

// Mystery Treasure deferred write-path handlers (DecoratePanel page 4):
//   - onGetMysAddTimes      [] (Responder)      -> onAddLimitMakeTimes {n, t:"month0idx|day"}
//   - addLimitMakeTimes     [] (Responder)      -> updateLimitMakeTimes {n}: buy a daily slot
//   - makeMysTre            [recipeId,slotMap,stackMap] (null responder) -> craft, no push
//   - onGetMakeLimitTimes   [] (Responder)      -> updateLimitMakeTimes {n,t}: real cap
//   - onGetMysBookData      [] (Responder)      -> updateMysTreBook {kind:{mysId:mysId}}
//
// Gold for addLimitMakeTimes is charged consume-then-credit: char.Gold is deducted and saved
// FIRST, then the addTimes/makeLimit state is mutated and saved. A crash between the two only
// ever costs the player gold (never grants a free slot). char.Gold is an int64 mutated directly
// (DeductCurrency(1,..) is ArenaPoint, not gold — id collision), matching the project rule.
//
// today is "<month0idx>|<day>" built from server UTC, mirroring the client's
// now.getMonth()+"|"+now.getDate() so the daily-reset comparison agrees.
package mysterytreasure

import (
	"strconv"
	"time"

	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func todayKey() string {
	now := time.Now().UTC()
	return strconv.Itoa(int(now.Month())-1) + "|" + strconv.Itoa(now.Day())
}

func (h *Handler) GetMysAddTimes(ctx *rtmp.RPCContext, _ []interface{}) (interface{}, error) {
	h.logger.Info("onGetMysAddTimes called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, pkgerrors.ErrUnauthorized
	}

	st, err := h.mysService.LoadRefreshed(ctx.Context, charID, todayKey())
	if err != nil {
		h.logger.Error("onGetMysAddTimes: load failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, pkgerrors.ErrSystemError
	}

	return map[string]interface{}{
		"n": float64(st.AddTimes.N),
		"t": st.AddTimes.T,
	}, nil
}

func (h *Handler) AddLimitMakeTimes(ctx *rtmp.RPCContext, _ []interface{}) (interface{}, error) {
	h.logger.Info("addLimitMakeTimes called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, pkgerrors.ErrUnauthorized
	}
	if h.chars == nil {
		h.logger.Error("addLimitMakeTimes: character accessor not configured", zap.Int64("char_id", charID))
		return nil, pkgerrors.ErrSystemError
	}

	today := todayKey()
	st, err := h.mysService.Load(ctx.Context, charID)
	if err != nil {
		h.logger.Error("addLimitMakeTimes: load failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, pkgerrors.ErrSystemError
	}

	cost, allowed := h.mysService.PurchaseAddTime(st, today)
	if !allowed {
		h.logger.Info("addLimitMakeTimes: max tier reached", zap.Int64("char_id", charID))
		return map[string]interface{}{"n": float64(st.MakeLimit.N), "t": st.MakeLimit.T}, nil
	}

	char, charErr := h.chars.GetByID(ctx.Context, charID)
	if charErr != nil || char == nil {
		h.logger.Error("addLimitMakeTimes: load character failed", zap.Int64("char_id", charID))
		return nil, pkgerrors.ErrSystemError
	}
	if char.Gold < int64(cost) {
		h.logger.Info("addLimitMakeTimes: insufficient gold",
			zap.Int64("char_id", charID), zap.Int64("gold", char.Gold), zap.Int("cost", cost))
		return nil, pkgerrors.ErrInsufficientFunds
	}

	char.Gold -= int64(cost)
	if saveErr := h.chars.Save(ctx.Context, char); saveErr != nil {
		h.logger.Error("addLimitMakeTimes: save character (gold deduct) failed",
			zap.Int64("char_id", charID), zap.Error(saveErr))
		return nil, pkgerrors.ErrSystemError
	}

	if saveErr := h.mysService.Save(ctx.Context, charID, st); saveErr != nil {
		h.logger.Error("addLimitMakeTimes: gold deducted but state save failed",
			zap.Int64("char_id", charID), zap.Int("cost", cost), zap.Error(saveErr))
		return nil, pkgerrors.ErrSystemError
	}

	h.logger.Info("addLimitMakeTimes: purchased",
		zap.Int64("char_id", charID), zap.Int("cost", cost),
		zap.Int("addTimes", st.AddTimes.N), zap.Int("makeLimit", st.MakeLimit.N))

	return map[string]interface{}{
		"n": float64(st.MakeLimit.N),
		"t": st.MakeLimit.T,
	}, nil
}

func (h *Handler) MakeMysTre(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("makeMysTre called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	if len(args) < 3 {
		h.logger.Warn("makeMysTre: wrong arg count", zap.Int64("char_id", charID), zap.Int("count", len(args)))
		return nil, nil
	}

	recipeID, ok := parseIntVal(args[0])
	if !ok || recipeID <= 0 {
		h.logger.Warn("makeMysTre: invalid recipeId", zap.Int64("char_id", charID))
		return nil, nil
	}

	slotMap := parseSlotMap(args[1])
	stackMap := parseStackMap(args[2])
	if len(slotMap) == 0 {
		h.logger.Warn("makeMysTre: empty slot map", zap.Int64("char_id", charID))
		return nil, nil
	}

	res, err := h.mysService.MakeMysTre(ctx.Context, charID, recipeID, slotMap, stackMap, todayKey())
	if err != nil {
		h.logger.Warn("makeMysTre: craft rejected",
			zap.Int64("char_id", charID), zap.Int("recipe", recipeID), zap.Error(err))
		return nil, nil
	}

	h.logger.Info("makeMysTre: crafted",
		zap.Int64("char_id", charID), zap.Int("recipe", recipeID),
		zap.Int("mysId", res.MysID), zap.Int("kind", res.Kind),
		zap.Int("makeLeft", res.MakeLeft), zap.Bool("bookFirst", res.BookFirst))

	return nil, nil
}

func (h *Handler) GetMakeLimitTimes(ctx *rtmp.RPCContext, _ []interface{}) (interface{}, error) {
	h.logger.Info("onGetMakeLimitTimes called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, pkgerrors.ErrUnauthorized
	}

	st, err := h.mysService.LoadRefreshed(ctx.Context, charID, todayKey())
	if err != nil {
		h.logger.Error("onGetMakeLimitTimes: load failed", zap.Int64("char_id", charID), zap.Error(err))
		return map[string]interface{}{"n": float64(0), "t": "0|0"}, nil
	}

	return map[string]interface{}{
		"n": float64(st.MakeLimit.N),
		"t": st.MakeLimit.T,
	}, nil
}

func parseSlotMap(v interface{}) map[int]int64 {
	out := map[int]int64{}
	m, ok := v.(map[string]interface{})
	if !ok {
		return out
	}
	for k, entry := range m {
		slot, err := strconv.Atoi(k)
		if err != nil || slot < 1 || slot > 6 {
			continue
		}
		obj, ok := entry.(map[string]interface{})
		if !ok {
			continue
		}
		idx, ok := parseIntVal(obj["idx"])
		if !ok || idx <= 0 {
			continue
		}
		out[slot] = int64(idx)
	}
	return out
}

func parseStackMap(v interface{}) map[int]int {
	out := map[int]int{}
	m, ok := v.(map[string]interface{})
	if !ok {
		return out
	}
	for k, val := range m {
		slot, err := strconv.Atoi(k)
		if err != nil || slot < 1 || slot > 6 {
			continue
		}
		if n, ok := parseIntVal(val); ok {
			out[slot] = n
		}
	}
	return out
}
