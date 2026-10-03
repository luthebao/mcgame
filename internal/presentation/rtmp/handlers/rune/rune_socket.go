// Open-sourced by BaoLT

// Deferred rune RPC handlers: socketing (runeSet/runeRemove -> updateDecoInfo
// responder echoing the full decoInfo blob), up-level (runeUpLvl -> onRuneBagUpdate
// responder), dissolve (runeResolve -> null responder, push onRuneBagUpdate), and
// chip exchange (exchangeRune -> null responder, push updateRuneChipBag +
// onRuneBagUpdate). Arg order matches RuneSlot.as / RuneClickBag.as / RuneChipBag.as.
package rune

import (
	apprune "mcgame-server/internal/application/rune"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) RuneSet(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("runeSet called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	charID, ok := characterIDFromCtx(ctx)
	if !ok || h.service == nil {
		return nil, nil
	}
	bagPos, ok1 := intArgAt(args, 0)
	holePos, ok2 := intArgAt(args, 1)
	bagType, ok3 := intArgAt(args, 2)
	decoPosition, ok4 := intArgAt(args, 3)
	if !ok1 || !ok2 || !ok3 || !ok4 {
		h.logger.Warn("runeSet: bad args", zap.Int64("character_id", charID))
		return nil, nil
	}

	wire, err := h.service.RuneSet(ctx.Context, charID, bagPos, holePos, bagType, decoPosition)
	if err != nil {
		h.logger.Warn("runeSet failed",
			zap.Int64("character_id", charID), zap.Error(err))
		return nil, nil
	}
	h.pushRuneBagAfterMutation(ctx, charID)
	return wire, nil
}

func (h *Handler) RuneRemove(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("runeRemove called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	charID, ok := characterIDFromCtx(ctx)
	if !ok || h.service == nil {
		return nil, nil
	}
	holePos, ok1 := intArgAt(args, 0)
	bagPos, ok2 := intArgAt(args, 1)
	bagType, ok3 := intArgAt(args, 2)
	decoPosition, ok4 := intArgAt(args, 3)
	if !ok1 || !ok2 || !ok3 || !ok4 {
		h.logger.Warn("runeRemove: bad args", zap.Int64("character_id", charID))
		return nil, nil
	}

	wire, err := h.service.RuneRemove(ctx.Context, charID, holePos, bagPos, bagType, decoPosition)
	if err != nil {
		h.logger.Warn("runeRemove failed",
			zap.Int64("character_id", charID), zap.Error(err))
		return nil, nil
	}
	h.pushRuneBagAfterMutation(ctx, charID)
	return wire, nil
}

func (h *Handler) RuneUpLvl(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("runeUpLvl called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	charID, ok := characterIDFromCtx(ctx)
	if !ok || h.service == nil {
		return nil, nil
	}

	result, err := h.service.RuneUpLvl(ctx.Context, charID)
	if err != nil {
		h.logger.Warn("runeUpLvl failed",
			zap.Int64("character_id", charID), zap.Error(err))
		if result != nil {
			return apprune.RuneBagToWire(result.Bag), nil
		}
		return nil, nil
	}
	return apprune.RuneBagToWire(result.Bag), nil
}

func (h *Handler) RuneResolve(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("runeResolve called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	charID, ok := characterIDFromCtx(ctx)
	if !ok || h.service == nil {
		return nil, nil
	}
	runeObj, ok1 := runeObjArgAt(args, 0)
	bagType, ok2 := intArgAt(args, 1)
	if !ok1 || !ok2 {
		h.logger.Warn("runeResolve: bad args", zap.Int64("character_id", charID))
		return nil, nil
	}

	result, err := h.service.RuneResolve(ctx.Context, charID, runeObj, bagType)
	if err != nil {
		h.logger.Warn("runeResolve failed",
			zap.Int64("character_id", charID), zap.Error(err))
		return nil, nil
	}
	if ctx.Connection != nil {
		_ = ctx.Connection.SendCallback("onRuneBagUpdate", apprune.RuneBagToWire(result.Bag))
	}
	return nil, nil
}

func (h *Handler) pushRuneBagAfterMutation(ctx *rtmp.RPCContext, charID int64) {
	if ctx.Connection == nil || h.service == nil {
		return
	}
	bag, err := h.service.GetRuneBag(ctx.Context, charID)
	if err != nil {
		return
	}
	if err := ctx.Connection.SendCallback("onRuneBagUpdate", apprune.RuneBagToWire(bag)); err != nil {
		h.logger.Warn("failed to push onRuneBagUpdate after socket mutation",
			zap.Int64("character_id", charID), zap.Error(err))
	}
}
