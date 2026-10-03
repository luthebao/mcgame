// Open-sourced by BaoLT

// Pet Talent RPC action implementations.
package pettalent

import (
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) InitPanelData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return emptyPanel(), nil
	}
	data, err := h.service.InitPanelData(ctx.Context, charID)
	if err != nil {
		h.logger.Error("initTalentPanelData failed", zap.Int64("char_id", charID), zap.Error(err))
		return emptyPanel(), nil
	}
	return data, nil
}

func (h *Handler) UpTalentSlotLv(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return emptyDeltaTal(), nil
	}
	sid, ok1 := intArg(args, 0)
	if !ok1 {
		return emptyDeltaTal(), nil
	}
	useGold := boolArg(args, 1)
	data, err := h.service.UpTalentSlotLv(ctx.Context, charID, sid, useGold)
	if err != nil {
		h.logger.Warn("upTalentSlotLv failed", zap.Int64("char_id", charID), zap.Error(err))
		return emptyDeltaTal(), nil
	}
	return data, nil
}

func (h *Handler) ArrangeBag(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return map[string]interface{}{}, nil
	}
	data, err := h.service.ArrangeBag(ctx.Context, charID)
	if err != nil {
		h.logger.Warn("arrangeTalentBag failed", zap.Int64("char_id", charID), zap.Error(err))
		return map[string]interface{}{}, nil
	}
	return data, nil
}

func (h *Handler) ResetTalentSlot(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	giids, ok1 := stringArg(args, 0)
	csids, ok2 := stringArg(args, 1)
	if !ok1 || !ok2 {
		return nil, nil
	}
	data, err := h.service.ResetTalentSlot(ctx.Context, charID, giids, csids)
	if err != nil {
		h.logger.Warn("resetTalentSlot failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	return data, nil
}

func (h *Handler) BreakTalentStone(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return emptyDelta(), nil
	}
	csid, ok1 := intArg(args, 0)
	giid, ok2 := intArg(args, 1)
	count, ok3 := intArg(args, 2)
	if !ok1 || !ok2 || !ok3 {
		return emptyDelta(), nil
	}
	data, err := h.service.BreakTalentStone(ctx.Context, charID, csid, giid, count)
	if err != nil {
		h.logger.Warn("breakTalentStone failed", zap.Int64("char_id", charID), zap.Error(err))
		return emptyDelta(), nil
	}
	return data, nil
}

func (h *Handler) FillTalentStone(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	fromBagSid, ok1 := intArg(args, 0)
	toSlotSid, ok2 := intArg(args, 1)
	giid, ok3 := intArg(args, 2)
	if !ok1 || !ok2 || !ok3 {
		return nil, nil
	}
	data, err := h.service.FillTalentStone(ctx.Context, charID, fromBagSid, toSlotSid, giid)
	if err != nil {
		h.logger.Warn("fillTalentStone failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	h.push(ctx, "onFillOrTakeTalentStone", data)
	return nil, nil
}

func (h *Handler) TakeOffTalentStone(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	fromSlotSid, ok1 := intArg(args, 0)
	toBagSid, ok2 := intArg(args, 1)
	giid, ok3 := intArg(args, 2)
	if !ok1 || !ok2 || !ok3 {
		return nil, nil
	}
	data, err := h.service.TakeOffTalentStone(ctx.Context, charID, fromSlotSid, toBagSid, giid)
	if err != nil {
		h.logger.Warn("takeOffTalentStone failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	h.push(ctx, "onFillOrTakeTalentStone", data)
	return nil, nil
}

func (h *Handler) MoveStoneBagToBag(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	fromSid, ok1 := intArg(args, 0)
	toSid, ok2 := intArg(args, 1)
	if !ok1 || !ok2 {
		return nil, nil
	}
	data, err := h.service.MoveStoneBagToBag(ctx.Context, charID, fromSid, toSid)
	if err != nil {
		h.logger.Warn("moveStoneBagToBag failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	h.push(ctx, "onMoveStoneBagToBag", data)
	return nil, nil
}

func (h *Handler) UpTalentStone(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	csids, ok1 := stringArg(args, 0)
	giids, ok2 := stringArg(args, 1)
	if !ok1 || !ok2 {
		return nil, nil
	}
	useDirectionItem := boolArg(args, 2)
	data, err := h.service.UpTalentStone(ctx.Context, charID, csids, giids, useDirectionItem)
	if err != nil {
		h.logger.Warn("upTalentStone failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	return data, nil
}

func emptyDeltaTal() map[string]interface{} {
	return map[string]interface{}{}
}
