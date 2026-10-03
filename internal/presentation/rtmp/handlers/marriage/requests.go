// Open-sourced by BaoLT

package marriage

import (
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) MarriageSeeking(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if ctx.CharacterID == "" {
		h.logger.Warn("MarriageSeeking: no character ID in session",
			zap.Uint32("conn_id", ctx.ConnID))
		return nil, pkgerrors.ErrUnauthorized
	}

	if len(args) < 2 {
		h.logger.Warn("MarriageSeeking: missing parameters",
			zap.Uint32("conn_id", ctx.ConnID))
		return nil, pkgerrors.ErrInvalidArgs
	}

	introduce, _ := args[0].(string)
	flag, err := parseIntArg(args[1])
	if err != nil {
		flag = 0
	}

	h.logger.Info("MarriageSeeking: registering marriage seeking",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.String("introduce", introduce),
		zap.Int("flag", flag))

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	if err := h.service.UpdateSeeking(ctx.Context, characterID, introduce, flag); err != nil {
		h.logger.Error("MarriageSeeking: failed to update seeking",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	if err := h.refreshPanel(ctx, characterID); err != nil {
		h.logger.Error("MarriageSeeking: failed to refresh panel",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
		return nil, err
	}

	return nil, nil
}

func (h *Handler) MarriageRequest(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if ctx.CharacterID == "" {
		h.logger.Warn("MarriageRequest: no character ID in session",
			zap.Uint32("conn_id", ctx.ConnID))
		return nil, pkgerrors.ErrUnauthorized
	}

	if len(args) < 3 {
		h.logger.Warn("MarriageRequest: missing parameters",
			zap.Uint32("conn_id", ctx.ConnID))
		return nil, pkgerrors.ErrInvalidArgs
	}

	targetCID, err := parseInt64Arg(args[0])
	if err != nil {
		return nil, err
	}
	targetName, _ := args[1].(string)
	introduce, _ := args[2].(string)

	h.logger.Info("MarriageRequest: sending marriage request",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Int64("target_cid", targetCID),
		zap.String("target_name", targetName),
		zap.String("introduce", introduce))

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	if err := h.service.CreateRequest(ctx.Context, characterID, targetCID, targetName, introduce); err != nil {
		h.logger.Error("MarriageRequest: failed to create request",
			zap.Int64("character_id", characterID),
			zap.Int64("target_cid", targetCID),
			zap.Error(err))
		return nil, err
	}

	if err := h.refreshPanel(ctx, characterID); err != nil {
		h.logger.Error("MarriageRequest: failed to refresh panel",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
		return nil, err
	}

	return nil, nil
}

func (h *Handler) MarriageReqFeedback(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if ctx.CharacterID == "" {
		h.logger.Warn("MarriageReqFeedback: no character ID in session",
			zap.Uint32("conn_id", ctx.ConnID))
		return nil, pkgerrors.ErrUnauthorized
	}

	if len(args) < 2 {
		h.logger.Warn("MarriageReqFeedback: missing parameters",
			zap.Uint32("conn_id", ctx.ConnID))
		return nil, pkgerrors.ErrInvalidArgs
	}

	requestID, err := parseInt64Arg(args[0])
	if err != nil {
		return nil, err
	}
	response, err := parseIntArg(args[1])
	if err != nil {
		return nil, err
	}
	if response != 1 && response != 2 {
		h.logger.Warn("MarriageReqFeedback: invalid response",
			zap.Int("response", response))
		return nil, pkgerrors.ErrInvalidInput
	}

	responseText := "refuse"
	if response == 1 {
		responseText = "accept"
	}

	h.logger.Info("MarriageReqFeedback: responding to marriage request",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Int64("request_id", requestID),
		zap.String("response", responseText))

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	if err := h.service.RespondRequest(ctx.Context, characterID, requestID, response); err != nil {
		h.logger.Error("MarriageReqFeedback: failed to respond",
			zap.Int64("character_id", characterID),
			zap.Int64("request_id", requestID),
			zap.Error(err))
		return nil, err
	}

	if err := h.refreshPanel(ctx, characterID); err != nil {
		h.logger.Error("MarriageReqFeedback: failed to refresh panel",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
		return nil, err
	}

	return nil, nil
}

func (h *Handler) CancelMarriageSekInfo(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		h.logger.Warn("CancelMarriageSekInfo: invalid character ID",
			zap.String("char_id", ctx.CharacterID),
			zap.Error(err))
		return nil, err
	}

	h.logger.Info("CancelMarriageSekInfo: canceling marriage seeking",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	if err := h.service.CancelSeeking(ctx.Context, characterID); err != nil {
		h.logger.Error("CancelMarriageSekInfo: failed to cancel seeking",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	if err := h.refreshPanel(ctx, characterID); err != nil {
		h.logger.Error("CancelMarriageSekInfo: failed to refresh panel",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
		return nil, err
	}

	return nil, nil
}
