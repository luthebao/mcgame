// Open-sourced by BaoLT

// praBuff RPC action implementations.
package prabuff

import (
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) GetMagicArrayData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return map[string]interface{}{}, nil
	}
	praType, ok := intArg(args, 0)
	if !ok {
		return map[string]interface{}{}, nil
	}
	data, err := h.service.GetMagicArrayData(ctx.Context, charID, praType)
	if err != nil {
		h.logger.Warn("getMagicArrayData failed", zap.Int64("char_id", charID), zap.Error(err))
		return map[string]interface{}{}, nil
	}
	return data, nil
}

func (h *Handler) AddPracticeExp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	praType, ok := intArg(args, 0)
	if !ok {
		return nil, nil
	}
	isGold := boolArg(args, 1)
	data, err := h.service.AddPracticeExp(ctx.Context, charID, praType, isGold)
	if err != nil {
		h.logger.Warn("addPracticeExp failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	if ctx.Connection != nil {
		if sendErr := ctx.Connection.SendCallback("updatePraView", data); sendErr != nil {
			h.logger.Warn("addPracticeExp: push updatePraView failed", zap.Int64("char_id", charID), zap.Error(sendErr))
		}
	}
	return nil, nil
}
