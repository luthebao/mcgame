// Open-sourced by BaoLT

// Stone Seal RPC action implementations.
package stoneseal

import (
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) GetData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return getDataResp(nil), nil
	}
	data, err := h.service.GetData(ctx.Context, charID)
	if err != nil {
		h.logger.Error("stoneSealGetData failed", zap.Int64("char_id", charID), zap.Error(err))
		return getDataResp(nil), nil
	}
	return getDataResp(data), nil
}

func (h *Handler) SetStone(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return failResp(), nil
	}
	equipSid, ok1 := intArg(args, 0)
	sealIndex, ok2 := intArg(args, 1)
	stoneItemID, ok3 := int64Arg(args, 2)
	if !ok1 || !ok2 || !ok3 {
		return failResp(), nil
	}
	data, err := h.service.SetStone(ctx.Context, charID, equipSid, sealIndex, stoneItemID)
	if err != nil {
		h.logger.Warn("stoneSealSetStone failed", zap.Int64("char_id", charID), zap.Error(err))
		return failResp(), nil
	}
	return okResp(data), nil
}

func (h *Handler) RemoveStone(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return failResp(), nil
	}
	equipSid, ok1 := intArg(args, 0)
	sealIndex, ok2 := intArg(args, 1)
	if !ok1 || !ok2 {
		return failResp(), nil
	}
	data, err := h.service.RemoveStone(ctx.Context, charID, equipSid, sealIndex)
	if err != nil {
		h.logger.Warn("stoneSealRemoveStone failed", zap.Int64("char_id", charID), zap.Error(err))
		return failResp(), nil
	}
	return okResp(data), nil
}

func (h *Handler) RemoveAllStone(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return failResp(), nil
	}
	equipSid, ok1 := intArg(args, 0)
	if !ok1 {
		return failResp(), nil
	}
	data, err := h.service.RemoveAllStone(ctx.Context, charID, equipSid)
	if err != nil {
		h.logger.Warn("stoneSealRemoveAllStone failed", zap.Int64("char_id", charID), zap.Error(err))
		return failResp(), nil
	}
	return okResp(data), nil
}

func (h *Handler) SwapStone(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return failResp(), nil
	}
	equipSid, ok1 := intArg(args, 0)
	idx1, ok2 := intArg(args, 1)
	idx2, ok3 := intArg(args, 2)
	if !ok1 || !ok2 || !ok3 {
		return failResp(), nil
	}
	data, err := h.service.SwapStone(ctx.Context, charID, equipSid, idx1, idx2)
	if err != nil {
		h.logger.Warn("stoneSealSwapStone failed", zap.Int64("char_id", charID), zap.Error(err))
		return failResp(), nil
	}
	return okResp(data), nil
}

func (h *Handler) Bore(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return failResp(), nil
	}
	equipSid, ok1 := intArg(args, 0)
	sealIndex, ok2 := intArg(args, 1)
	payMode, ok3 := intArg(args, 2)
	materialItemID, _ := int64Arg(args, 3)
	if !ok1 || !ok2 || !ok3 {
		return failResp(), nil
	}
	data, err := h.service.Bore(ctx.Context, charID, equipSid, sealIndex, payMode, materialItemID)
	if err != nil {
		h.logger.Warn("stoneSealBore failed", zap.Int64("char_id", charID), zap.Error(err))
		return failResp(), nil
	}
	return okResp(data), nil
}

func (h *Handler) Succinct(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return failResp(), nil
	}
	equipSid, ok1 := intArg(args, 0)
	payMode, ok2 := intArg(args, 1)
	if !ok1 || !ok2 {
		return failResp(), nil
	}
	data, err := h.service.Succinct(ctx.Context, charID, equipSid, payMode)
	if err != nil {
		h.logger.Warn("stoneSealSuccinct failed", zap.Int64("char_id", charID), zap.Error(err))
		return failResp(), nil
	}
	return okResp(data), nil
}
