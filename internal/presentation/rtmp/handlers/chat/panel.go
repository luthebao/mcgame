// Open-sourced by BaoLT

package chat

import (
	"strconv"

	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) CreateChatPanel(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	return h.openChatPanel(ctx, args, "")
}

func (h *Handler) GetChatPanel(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	fallbackName := ""
	if len(args) >= 2 {
		if name, ok := args[1].(string); ok {
			fallbackName = name
		}
	}
	return h.openChatPanel(ctx, args, fallbackName)
}

func (h *Handler) openChatPanel(ctx *rtmp.RPCContext, args []interface{}, fallbackName string) (interface{}, error) {
	h.logger.Info("openChatPanel called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	targetID, ok := parseInt64Arg(args[0])
	if !ok {
		h.logger.Warn("openChatPanel: invalid target ID type", zap.Any("target_id", args[0]))
		return nil, pkgerrors.ErrInvalidInput
	}

	initiatorID, err := currentCharacterID(ctx)
	if err != nil {
		h.logger.Warn("openChatPanel: invalid character ID", zap.String("character_id", ctx.CharacterID), zap.Error(err))
		return nil, err
	}

	if targetID == initiatorID {
		return nil, pkgerrors.ErrInvalidInput
	}

	response := map[string]interface{}{
		"id":   targetID,
		"name": fallbackName,
	}

	targetChar, err := h.charService.GetByID(ctx.Context, targetID)
	if err != nil {
		if fallbackName == "" {
			h.logger.Warn("openChatPanel: target character not found", zap.Int64("target_id", targetID), zap.Error(err))
			return nil, err
		}
		h.logger.Debug("openChatPanel: using fallback name for unknown target",
			zap.Int64("target_id", targetID),
			zap.String("fallback_name", fallbackName),
			zap.Error(err))
	} else {
		response["name"] = targetChar.Name
		response["classId"] = targetChar.ClassID
		response["exp"] = targetChar.CumulativeExp()
		if iconCodeStr := h.charService.GetIconCodeByClassAndGender(targetChar.ClassID, targetChar.Gender); iconCodeStr != "" {
			if iconCode, parseErr := strconv.ParseInt(iconCodeStr, 10, 64); parseErr == nil {
				response["iconCode"] = iconCode
			}
		}
	}

	if !h.rtmpServer.IsCharacterOnline(strconv.FormatInt(targetID, 10)) {
		h.logger.Debug("openChatPanel: target player is offline", zap.Int64("target_id", targetID))
	}

	return response, nil
}

func (h *Handler) ChatGM(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 3 {
		h.logger.Warn("ChatGM: insufficient arguments", zap.Uint32("conn_id", ctx.ConnID), zap.Int("arg_count", len(args)))
		return nil, pkgerrors.ErrInvalidArgs
	}

	message, ok := args[0].(string)
	if !ok {
		h.logger.Warn("ChatGM: invalid message type", zap.Any("message", args[0]))
		return nil, pkgerrors.ErrInvalidInput
	}

	playerID, ok := parseInt64Arg(args[1])
	if !ok {
		h.logger.Warn("ChatGM: invalid player ID type", zap.Any("player_id", args[1]))
		return nil, pkgerrors.ErrInvalidInput
	}

	gmName, ok := args[2].(string)
	if !ok {
		h.logger.Warn("ChatGM: invalid GM name type", zap.Any("gm_name", args[2]))
		return nil, pkgerrors.ErrInvalidInput
	}

	char, err := h.charService.GetByID(ctx.Context, playerID)
	if err != nil {
		h.logger.Warn("ChatGM: character not found", zap.Int64("player_id", playerID), zap.Error(err))
		return nil, err
	}

	h.logger.Info("GM Chat message",
		zap.Int64("player_id", playerID),
		zap.String("player_name", char.Name),
		zap.String("gm_name", gmName),
		zap.String("message", message))

	responseData := map[string]interface{}{
		"success": true,
		"message": "Your message has been sent to GM",
	}

	if err := ctx.Connection.SendCallback("onChatGM", responseData); err != nil {
		h.logger.Warn("Failed to send onChatGM callback", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
	}

	return nil, nil
}
