// Open-sourced by BaoLT

// Heiyaoshi action RPCs: point activation and GM-gated state reset.
package heiyaoshi

import (
	"errors"

	appheiyaoshi "mcgame-server/internal/application/heiyaoshi"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) LightHeiyaoshiPoint(ctx *rtmp.RPCContext, args []any) (any, error) {
	h.logger.Info("LightHeiyaoshiPoint called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	if len(args) < 2 {
		return errResponse("missing parameters"), nil
	}
	figureIdx, ok := toInt(args[0])
	if !ok {
		return errResponse("invalid figure index"), nil
	}
	pointID, ok := toInt(args[1])
	if !ok {
		return errResponse("invalid point id"), nil
	}
	charID, ok := characterIDFromCtx(ctx)
	if !ok {
		return errResponse("invalid character id"), nil
	}

	result, err := h.service.ActivatePoint(ctx.Context, charID, figureIdx, pointID, false)
	if err != nil {
		if errors.Is(err, appheiyaoshi.ErrInsufficientStone) {
			if point, ok := appheiyaoshi.LookupPoint(figureIdx, pointID); ok && point.Gold > 0 {
				_ = ctx.Connection.SendCallback("goldBuyHeiyaoshi", point.Gold, pointID)
				return successResponse(map[string]any{
					"figure":      figureIdx,
					"pointId":     pointID,
					"goldFallback": true,
					"goldCost":    point.Gold,
				}), nil
			}
		}
		h.logger.Warn("LightHeiyaoshiPoint failed",
			zap.Int64("character_id", charID),
			zap.Int("figure_idx", figureIdx),
			zap.Int("point_id", pointID),
			zap.Error(err))
		notifyActivateError(ctx, err)
		return mapActivateError(err), nil
	}

	h.pushActivationCallbacks(ctx, result)
	h.pushDeltas(ctx, result.WalletDeltas)
	h.pushStatRefresh(ctx, charID)
	h.pushViewProps(ctx, charID)

	return successResponse(map[string]any{
		"figure":          result.Figure,
		"pointId":         result.PointID,
		"figureCompleted": result.FigureCompleted,
	}), nil
}

func (h *Handler) ActivateHeiyaoshiPoint(ctx *rtmp.RPCContext, args []any) (any, error) {
	h.logger.Info("ActivateHeiyaoshiPoint called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	if len(args) < 2 {
		return errResponse("missing parameters"), nil
	}
	typeNum, ok := toInt(args[0])
	if !ok {
		return errResponse("invalid type num"), nil
	}
	pointID, ok := toInt(args[1])
	if !ok {
		return errResponse("invalid point id"), nil
	}
	charID, ok := characterIDFromCtx(ctx)
	if !ok {
		return errResponse("invalid character id"), nil
	}
	useGold := typeNum == 2

	result, err := h.service.ActivateAtCurrentFigure(ctx.Context, charID, pointID, useGold)
	if err != nil {
		h.logger.Warn("ActivateHeiyaoshiPoint failed",
			zap.Int64("character_id", charID),
			zap.Int("type_num", typeNum),
			zap.Int("point_id", pointID),
			zap.Error(err))
		notifyActivateError(ctx, err)
		return mapActivateError(err), nil
	}

	h.pushActivationCallbacks(ctx, result)
	h.pushDeltas(ctx, result.WalletDeltas)
	h.pushStatRefresh(ctx, charID)
	h.pushViewProps(ctx, charID)

	return successResponse(map[string]any{
		"figure":          result.Figure,
		"pointId":         result.PointID,
		"figureCompleted": result.FigureCompleted,
		"usedGold":        result.UsedGold,
	}), nil
}

func (h *Handler) ResetHeiyaoshi(ctx *rtmp.RPCContext, args []any) (any, error) {
	h.logger.Info("ResetHeiyaoshi called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	if len(args) < 1 {
		return errResponse("missing target character id"), nil
	}
	targetID, ok := toInt64(args[0])
	if !ok {
		return errResponse("invalid target character id"), nil
	}
	requesterID, ok := characterIDFromCtx(ctx)
	if !ok {
		return errResponse("invalid character id"), nil
	}

	panel, err := h.service.Reset(ctx.Context, requesterID, targetID)
	if err != nil {
		if errors.Is(err, appheiyaoshi.ErrPermissionDenied) {
			return errResponse("permission denied"), nil
		}
		h.logger.Error("ResetHeiyaoshi failed",
			zap.Int64("requester_id", requesterID),
			zap.Int64("target_id", targetID),
			zap.Error(err))
		return errResponse(genericFailureMessage), nil
	}

	return successResponse(map[string]any{"panel": panelToWire(panel)}), nil
}

func (h *Handler) pushActivationCallbacks(ctx *rtmp.RPCContext, result *appheiyaoshi.ActivateResult) {
	if ctx == nil || ctx.Connection == nil || result == nil {
		return
	}
	_ = ctx.Connection.SendCallback("gotoLightHeiyaoshiPoint", result.PointID)

	if len(result.NewAreas) > 0 {
		_ = ctx.Connection.SendCallback("gotoLightHeiyaoshiArea", areasToWire(result.NewAreas), buffToWire(result.State.Buff))
	}
	if len(result.NewLines) > 0 {
		_ = ctx.Connection.SendCallback("gotoLightHeiyaoshiLine", linesToWire(result.NewLines), result.State.LastActFigure)
	}
	if result.FigureCompleted {
		_ = ctx.Connection.SendCallback("gotoLightHeiyaoshiAllJihuo", result.State.Encode())
	}
}

func (h *Handler) pushDeltas(ctx *rtmp.RPCContext, deltas []appheiyaoshi.ResourceDelta) {
	if ctx == nil || ctx.Connection == nil || len(deltas) == 0 {
		return
	}
	payload := make(map[string]any, len(deltas))
	for _, d := range deltas {
		if d.Field == "" {
			continue
		}
		payload[d.Field] = d.NewTotal
	}
	if len(payload) == 0 {
		return
	}
	_ = ctx.Connection.SendCallback("onUPP", payload)
}

func mapActivateError(err error) map[string]any {
	switch {
	case errors.Is(err, appheiyaoshi.ErrInvalidPoint):
		return errResponse("invalid point id")
	case errors.Is(err, appheiyaoshi.ErrInvalidFigure):
		return errResponse("invalid figure")
	case errors.Is(err, appheiyaoshi.ErrFigureMismatch):
		return errResponse("figure does not match current player progress")
	case errors.Is(err, appheiyaoshi.ErrPointAlreadyActive):
		return errResponse("point already active")
	case errors.Is(err, appheiyaoshi.ErrPointNotAdjacent):
		return errResponse("point not adjacent")
	case errors.Is(err, appheiyaoshi.ErrInsufficientStone):
		return errResponse("not enough heiyaoshi stones")
	case errors.Is(err, appheiyaoshi.ErrInsufficientGold):
		return errResponse("not enough gold")
	case errors.Is(err, appheiyaoshi.ErrCharacterNotFound):
		return errResponse("character not found")
	default:
		return errResponse(genericFailureMessage)
	}
}
