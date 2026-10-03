// Open-sourced by BaoLT

// Fairy responder-result RPC actions: initCharFairy, fairyGrowUp, fairyRaise,
// addFairyExp, onSkill, upFairySkill.
package fairy

import (
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) InitCharFairy(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return map[string]interface{}{}, nil
	}
	roster, err := h.service.Roster(ctx.Context, charID)
	if err != nil {
		h.logger.Error("initCharFairy failed", zap.Int64("char_id", charID), zap.Error(err))
		return map[string]interface{}{}, nil
	}
	return roster, nil
}

func (h *Handler) GrowUp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return map[string]interface{}{"f": false, "code": "out"}, nil
	}
	fairyID, ok1 := int64Arg(args, 0)
	growType, ok2 := intArg(args, 1)
	if !ok1 || !ok2 {
		return map[string]interface{}{"f": false, "code": "out"}, nil
	}
	res, err := h.service.GrowUp(ctx.Context, charID, fairyID, growType)
	if err != nil {
		code := "out"
		if res != nil {
			code = res.Code
		}
		h.logger.Warn("fairyGrowUp failed", zap.Int64("char_id", charID), zap.Error(err))
		return map[string]interface{}{"f": false, "code": code}, nil
	}
	return map[string]interface{}{"f": true, "exp": res.Exp, "cri": res.Cri, "gnum": res.Gnum}, nil
}

func (h *Handler) Raise(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return map[string]interface{}{"f": false, "code": "item"}, nil
	}
	fairyID, ok1 := int64Arg(args, 0)
	itemSlotID, ok2 := int64Arg(args, 1)
	qty, _ := intArg(args, 2)
	if !ok1 || !ok2 {
		return map[string]interface{}{"f": false, "code": "item"}, nil
	}
	res, err := h.service.Raise(ctx.Context, charID, fairyID, itemSlotID, qty)
	if err != nil {
		code := "item"
		if res != nil {
			code = res.Code
		}
		h.logger.Warn("fairyRaise failed", zap.Int64("char_id", charID), zap.Error(err))
		return map[string]interface{}{"f": false, "code": code}, nil
	}
	return map[string]interface{}{"f": true, "num": res.Num}, nil
}

func (h *Handler) AddExp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return map[string]interface{}{"f": false, "code": "item"}, nil
	}
	fairyID, ok1 := int64Arg(args, 0)
	slotIDs := int64SliceArg(args, 1)
	qty, _ := intArg(args, 2)
	if !ok1 || len(slotIDs) == 0 {
		return map[string]interface{}{"f": false, "code": "item"}, nil
	}
	res, err := h.service.AddExp(ctx.Context, charID, fairyID, slotIDs, qty)
	if err != nil {
		code := "item"
		if res != nil {
			code = res.Code
		}
		h.logger.Warn("addFairyExp failed", zap.Int64("char_id", charID), zap.Error(err))
		return map[string]interface{}{"f": false, "code": code}, nil
	}
	return map[string]interface{}{"f": true, "num": res.Num, "en": res.En}, nil
}

func (h *Handler) OnSkill(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return map[string]interface{}{"flag": false, "sindex": 2}, nil
	}
	fairyID, ok1 := int64Arg(args, 0)
	skillBookSlotID, ok2 := int64Arg(args, 1)
	if !ok1 || !ok2 {
		return map[string]interface{}{"flag": false, "sindex": 2}, nil
	}
	res, err := h.service.OnSkill(ctx.Context, charID, fairyID, skillBookSlotID)
	if err != nil {
		sindex := 2
		if res != nil {
			sindex = res.Code
		}
		h.logger.Warn("onSkill failed", zap.Int64("char_id", charID), zap.Error(err))
		return map[string]interface{}{"flag": false, "sindex": sindex}, nil
	}
	return skillWire(res), nil
}

func (h *Handler) UpSkill(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return map[string]interface{}{"flag": false, "sindex": 2}, nil
	}
	fairyID, ok1 := int64Arg(args, 0)
	skillIndex, ok2 := intArg(args, 1)
	if !ok1 || !ok2 {
		return map[string]interface{}{"flag": false, "sindex": 2}, nil
	}
	res, err := h.service.UpSkill(ctx.Context, charID, fairyID, skillIndex)
	if err != nil {
		sindex := 2
		if res != nil {
			sindex = res.Code
		}
		h.logger.Warn("upFairySkill failed", zap.Int64("char_id", charID), zap.Error(err))
		return map[string]interface{}{"flag": false, "sindex": sindex}, nil
	}
	return skillWire(res), nil
}
