// Open-sourced by BaoLT

// War sprite action RPCs: panel fetch, four upgrade flows, and aggregated buff list.
package warsprite

import (
	"errors"

	domainwsp "mcgame-server/internal/domain/warsprite"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) GetSpWarData(ctx *rtmp.RPCContext, args []any) (any, error) {
	charID, ok := characterIDFromCtx(ctx)
	if !ok {
		return domainwsp.Default().ToClientPayload(), nil
	}
	state, err := h.service.GetState(ctx.Context, charID)
	if err != nil {
		h.logger.Error("getSpWarData: load failed", zap.Int64("character_id", charID), zap.Error(err))
		return domainwsp.Default().ToClientPayload(), nil
	}
	return state.ToClientPayload(), nil
}

func (h *Handler) AddWarSprite(ctx *rtmp.RPCContext, args []any) (any, error) {
	return h.handleUpgrade(ctx, args, domainwsp.KindWarSprite, false)
}

func (h *Handler) AddWarSpriteGold(ctx *rtmp.RPCContext, args []any) (any, error) {
	return h.handleUpgrade(ctx, args, domainwsp.KindWarSprite, true)
}

func (h *Handler) AddBattleSprite(ctx *rtmp.RPCContext, args []any) (any, error) {
	return h.handleUpgrade(ctx, args, domainwsp.KindBattleSprite, false)
}

func (h *Handler) AddBattleSpriteGold(ctx *rtmp.RPCContext, args []any) (any, error) {
	return h.handleUpgrade(ctx, args, domainwsp.KindBattleSprite, true)
}

func (h *Handler) GetWSPBuffList(ctx *rtmp.RPCContext, args []any) (any, error) {
	charID, ok := characterIDFromCtx(ctx)
	if !ok {
		return map[string]any{}, nil
	}
	totals, err := h.service.AggregateBonuses(ctx.Context, charID)
	if err != nil {
		h.logger.Error("getWSPBuffList: aggregate failed", zap.Int64("character_id", charID), zap.Error(err))
		return map[string]any{}, nil
	}
	return buffToWire(totals), nil
}

func (h *Handler) handleUpgrade(ctx *rtmp.RPCContext, args []any, kind int, useGold bool) (any, error) {
	charID, ok := characterIDFromCtx(ctx)
	if !ok {
		return errResponse("invalid character id"), nil
	}
	index, err := parseIndex(args)
	if err != nil {
		notifyUpgradeError(ctx, err)
		return errResponse("invalid index"), nil
	}

	result, err := h.service.Upgrade(ctx.Context, charID, kind, index, useGold)
	if err != nil {
		h.logger.Warn("warsprite upgrade failed",
			zap.Int64("character_id", charID),
			zap.Int("kind", kind),
			zap.Int("index", index),
			zap.Bool("use_gold", useGold),
			zap.Error(err))
		notifyUpgradeError(ctx, err)
		return mapUpgradeError(err), nil
	}

	h.pushPanel(ctx, result.State.ToClientPayload())
	h.pushWalletDelta(ctx, result.WalletDelta)
	h.pushStatRefreshFor(ctx, result.Character)

	return successResponse(map[string]any{
		"kind":     kind,
		"index":    index,
		"newId":    result.NewID,
		"usedGold": useGold,
		"maxed":    result.NextIsMaxed,
	}), nil
}

func mapUpgradeError(err error) map[string]any {
	switch {
	case errors.Is(err, domainwsp.ErrInvalidIndex):
		return errResponse("invalid index")
	case errors.Is(err, domainwsp.ErrInvalidKind):
		return errResponse("invalid kind")
	case errors.Is(err, domainwsp.ErrMaxLevel):
		return errResponse("max level")
	case errors.Is(err, domainwsp.ErrInsufficientStone):
		return errResponse("insufficient stone")
	case errors.Is(err, domainwsp.ErrInsufficientGold):
		return errResponse("insufficient gold")
	case errors.Is(err, domainwsp.ErrTemplateNotFound):
		return errResponse("template not found")
	case errors.Is(err, domainwsp.ErrCharacterNotFound):
		return errResponse("character not found")
	default:
		return errResponse("operation failed")
	}
}
