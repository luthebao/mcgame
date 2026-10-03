// Open-sourced by BaoLT

// Pet Stone RPC action implementations.
package petstone

import (
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) Init(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return emptyBag(), nil
	}
	bag, err := h.service.Init(ctx.Context, charID)
	if err != nil {
		h.logger.Error("initPetStonePanel failed", zap.Int64("char_id", charID), zap.Error(err))
		return emptyBag(), nil
	}
	return bag, nil
}

func (h *Handler) Compose(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return emptyBag(), nil
	}
	sid, ok1 := intArg(args, 0)
	qty, ok2 := intArg(args, 1)
	if !ok1 || !ok2 {
		return emptyBag(), nil
	}
	bag, err := h.service.Compose(ctx.Context, charID, sid, qty)
	if err != nil {
		h.logger.Warn("composePetStone failed", zap.Int64("char_id", charID), zap.Error(err))
		return emptyBag(), nil
	}
	return bag, nil
}

func (h *Handler) Absorb(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return emptyBag(), nil
	}
	sidList, ok1 := intListArg(args, 0)
	if !ok1 {
		return emptyBag(), nil
	}
	bag, err := h.service.Absorb(ctx.Context, charID, sidList)
	if err != nil {
		h.logger.Warn("absorbPetStone failed", zap.Int64("char_id", charID), zap.Error(err))
		return emptyBag(), nil
	}
	return bag, nil
}

func (h *Handler) Resolve(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return emptyBag(), nil
	}
	sid, ok1 := intArg(args, 0)
	qty, ok2 := intArg(args, 1)
	if !ok1 || !ok2 {
		return emptyBag(), nil
	}
	bag, err := h.service.Resolve(ctx.Context, charID, sid, qty)
	if err != nil {
		h.logger.Warn("resolvePetStone failed", zap.Int64("char_id", charID), zap.Error(err))
		return emptyBag(), nil
	}
	return bag, nil
}

func (h *Handler) Set(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return setResp(nil), nil
	}
	equGiid, ok1 := int64Arg(args, 0)
	slotIndex, ok2 := intArg(args, 1)
	stoneSid, ok3 := intArg(args, 2)
	if !ok1 || !ok2 || !ok3 {
		return setResp(nil), nil
	}
	res, err := h.service.Set(ctx.Context, charID, equGiid, slotIndex, stoneSid)
	if err != nil {
		h.logger.Warn("petStoneSet failed", zap.Int64("char_id", charID), zap.Error(err))
		return setResp(nil), nil
	}
	return setResp(res), nil
}

func (h *Handler) Remove(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return setResp(nil), nil
	}
	equGiid, ok1 := int64Arg(args, 0)
	slotIndex, ok2 := intArg(args, 1)
	if !ok1 || !ok2 {
		return setResp(nil), nil
	}
	res, err := h.service.Remove(ctx.Context, charID, equGiid, slotIndex)
	if err != nil {
		h.logger.Warn("removePetStone failed", zap.Int64("char_id", charID), zap.Error(err))
		return setResp(nil), nil
	}
	return setResp(res), nil
}

func (h *Handler) GetByEid(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return -1, nil
	}
	equGiid, ok1 := int64Arg(args, 0)
	if !ok1 {
		return -1, nil
	}
	res, err := h.service.GetByEid(ctx.Context, charID, equGiid)
	if err != nil {
		h.logger.Warn("getPetStoneByEid failed", zap.Int64("char_id", charID), zap.Error(err))
		return -1, nil
	}
	return res, nil
}

func (h *Handler) ChangeEnergy(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return energyResp(nil), nil
	}
	energyBagSid, ok1 := intArg(args, 0)
	skillType, ok2 := intArg(args, 2)
	if !ok1 || !ok2 {
		return energyResp(nil), nil
	}
	res, err := h.service.ChangeEnergy(ctx.Context, charID, energyBagSid, skillType)
	if err != nil {
		h.logger.Warn("changePetStoneEnergy failed", zap.Int64("char_id", charID), zap.Error(err))
		return energyResp(nil), nil
	}
	return energyResp(res), nil
}
