// Open-sourced by BaoLT

// Astrology RPC handlers for the 12-cung zodiac pick panel.
// Registers getAstrologicData, refreshStars, pickStar.
// Outbound callbacks: onGetAstrologicData, onAstrologicStarsRefresh, onPickStar, onAddMoney.
//
// Wire shapes (catalog_in.md):
//
//	onGetAstrologicData:      [{award, award_record, buyPickCount, formula, pickCount, refreshCount, starsNow, starsToPick}]
//	onAstrologicStarsRefresh: [refreshTimes, [sid, sid, sid]]
//	onPickStar:               [{buyTimes, leftTimes, newStars, refreshTimes, result, sid}]
//
// award_record: always [] — no backing store for formula claim history (OQ: astrology-award-record).
// See docs/memory/astrology-system.md for open questions.
package astrology

import (
	"strconv"

	appastrology "mcgame-server/internal/application/astrology"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	service *appastrology.Service
	logger  *zap.Logger
}

func NewHandler(service *appastrology.Service, logger *zap.Logger) *Handler {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Handler{service: service, logger: logger}
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("getAstrologicData", h.GetAstrologicData)
	dispatcher.Register("refreshStars", h.RefreshStars)
	dispatcher.Register("pickStar", h.PickStar)
}

func (h *Handler) GetAstrologicData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("GetAstrologicData called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	charID, ok := parseCharID(ctx)
	if !ok {
		return false, nil
	}

	state, err := h.service.GetAstrologicData(ctx.Context, charID)
	if err != nil {
		h.logger.Warn("astrology: getAstrologicData failed",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("char_id", charID),
			zap.Error(err))
		return false, nil
	}

	payload := buildGetAstrologicDataPayload(state)
	_ = ctx.Connection.SendCallback("onGetAstrologicData", payload)
	return nil, nil
}

func (h *Handler) RefreshStars(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("RefreshStars called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	charID, ok := parseCharID(ctx)
	if !ok {
		return false, nil
	}

	result, err := h.service.RefreshStars(ctx.Context, charID)
	if err != nil {
		h.logger.Warn("astrology: refreshStars failed",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("char_id", charID),
			zap.Error(err))
		return false, nil
	}

	starsToPick := intsToInterface(result.StarsToPick)
	_ = ctx.Connection.SendCallback("onAstrologicStarsRefresh", float64(result.RefreshTimes), starsToPick)
	return nil, nil
}

func (h *Handler) PickStar(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("PickStar called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	charID, ok := parseCharID(ctx)
	if !ok {
		return false, nil
	}

	if len(args) < 1 {
		h.logger.Warn("astrology: pickStar missing selectIndex",
			zap.Uint32("conn_id", ctx.ConnID))
		return false, nil
	}
	sidArg, ok2 := parseIntArg(args[0])
	if !ok2 {
		h.logger.Warn("astrology: pickStar invalid sid arg",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Any("arg", args[0]))
		return false, nil
	}

	pickResult, err := h.service.PickStar(ctx.Context, charID, sidArg)
	if err != nil {
		h.logger.Warn("astrology: pickStar failed",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("char_id", charID),
			zap.Int("sid_arg", sidArg),
			zap.Error(err))
		return false, nil
	}

	if pickResult.FormulaAward != nil {
		_ = ctx.Connection.SendCallback("onAddMoney",
			float64(charID),
			"npPnt",
			float64(pickResult.FormulaAward.Aid),
			float64(pickResult.NpPntBalance-appastrology.NpPntPerPick),
		)
	}

	_ = ctx.Connection.SendCallback("onAddMoney",
		float64(charID),
		"npPnt",
		float64(appastrology.NpPntPerPick),
		float64(pickResult.NpPntBalance),
	)

	payload := buildPickStarPayload(pickResult)
	_ = ctx.Connection.SendCallback("onPickStar", payload)
	return nil, nil
}

func buildGetAstrologicDataPayload(state *appastrology.AstrologicState) map[string]interface{} {
	starsNow := make([]interface{}, 0, len(state.StarsCollected))
	for _, sid := range state.StarsCollected {
		starsNow = append(starsNow, float64(sid))
	}

	starsToPick := make([]interface{}, 0, len(state.StarsToPick))
	for _, sid := range state.StarsToPick {
		starsToPick = append(starsToPick, float64(sid))
	}

	formulaWire := buildFormulaWire()
	awardRecord := buildAwardRecord()
	award := []interface{}{
		float64(90), float64(90), float64(140), float64(140), float64(195), float64(195),
	}

	return map[string]interface{}{
		"award":        award,
		"award_record": awardRecord,
		"buyPickCount": float64(state.BuyPickCount),
		"formula":      formulaWire,
		"pickCount":    float64(state.PickCount),
		"refreshCount": float64(state.RefreshCount),
		"starsNow":     starsNow,
		"starsToPick":  starsToPick,
	}
}

func buildFormulaWire() []interface{} {
	return []interface{}{
		nil,
		[]interface{}{float64(3), float64(4)},
		[]interface{}{float64(10), float64(5), float64(2)},
	}
}

func buildAwardRecord() []interface{} {
	return []interface{}{}
}

func buildPickStarPayload(result *appastrology.PickResult) map[string]interface{} {
	newStars := intsToInterface(result.NewStars)
	payload := map[string]interface{}{
		"buyTimes":     float64(result.BuyTimes),
		"leftTimes":    float64(result.LeftTimes),
		"newStars":     newStars,
		"refreshTimes": float64(result.RefreshTimes),
		"sid":          float64(result.Sid),
	}
	if result.FormulaAward != nil {
		fa := result.FormulaAward
		formulaSlice := intsToInterface(fa.Formula)
		starsSlice := intsToInterface(fa.Stars)
		payload["result"] = map[string]interface{}{
			"aid":     float64(fa.Aid),
			"fid":     fa.Fid,
			"formula": formulaSlice,
			"mult":    float64(fa.Mult),
			"stars":   starsSlice,
		}
	}
	return payload
}

func intsToInterface(vals []int) []interface{} {
	out := make([]interface{}, len(vals))
	for i, v := range vals {
		out[i] = float64(v)
	}
	return out
}

func parseCharID(ctx *rtmp.RPCContext) (int64, bool) {
	if ctx == nil || ctx.CharacterID == "" {
		return 0, false
	}
	id, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return 0, false
	}
	return id, true
}

func parseIntArg(v interface{}) (int, bool) {
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
