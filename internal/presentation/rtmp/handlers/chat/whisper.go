// Open-sourced by BaoLT

package chat

import (
	"strconv"
	"strings"
	"time"

	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) P2pWisper(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 3 {
		h.logger.Warn("P2pWisper: insufficient arguments", zap.Uint32("conn_id", ctx.ConnID), zap.Int("arg_count", len(args)))
		return nil, pkgerrors.ErrInvalidArgs
	}

	message, ok := args[0].(string)
	if !ok {
		h.logger.Warn("P2pWisper: invalid message type", zap.Any("message", args[0]))
		return nil, pkgerrors.ErrInvalidInput
	}

	senderID, ok := parseInt64Arg(args[1])
	if !ok {
		h.logger.Warn("P2pWisper: invalid sender ID type", zap.Any("sender_id", args[1]))
		return nil, pkgerrors.ErrInvalidInput
	}

	targetID, ok := parseInt64Arg(args[2])
	if !ok {
		h.logger.Warn("P2pWisper: invalid target ID type", zap.Any("target_id", args[2]))
		return nil, pkgerrors.ErrInvalidInput
	}

	currentCharID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	if senderID != currentCharID {
		h.logger.Warn("P2pWisper: sender ID mismatch", zap.Int64("sender_id", senderID), zap.Int64("current_char_id", currentCharID))
		return nil, pkgerrors.ErrUnauthorized
	}

	senderChar, err := h.charService.GetByID(ctx.Context, senderID)
	if err != nil {
		h.logger.Warn("P2pWisper: sender character not found", zap.Int64("sender_id", senderID), zap.Error(err))
		return nil, err
	}

	targetConn := h.rtmpServer.GetConnectionByCharacterID(strconv.FormatInt(targetID, 10))
	if targetConn == nil {
		h.logger.Debug("P2pWisper: target player is offline", zap.Int64("target_id", targetID))
		responseData := map[string]interface{}{"success": false, "error": "Target player is offline"}
		if err := ctx.Connection.SendCallback("onP2pWisperError", responseData); err != nil {
			h.logger.Warn("Failed to send onP2pWisperError callback", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
		}
		return nil, nil
	}

	targetChar, err := h.charService.GetByID(ctx.Context, targetID)
	if err != nil {
		h.logger.Warn("P2pWisper: target character not found", zap.Int64("target_id", targetID), zap.Error(err))
		return nil, err
	}

	h.logger.Info("P2P Whisper message",
		zap.Int64("sender_id", senderID),
		zap.String("sender_name", senderChar.Name),
		zap.Int64("target_id", targetID),
		zap.String("target_name", targetChar.Name),
		zap.String("message", message))

	if err := targetConn.SendCallback("onP2pWisper", message, senderID, senderChar.Name, true); err != nil {
		h.logger.Warn("Failed to send onP2pWisper callback to target", zap.Int64("target_id", targetID), zap.Error(err))
	}
	return nil, nil
}

func (h *Handler) Wisper(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		h.logger.Warn("Wisper: insufficient arguments", zap.Uint32("conn_id", ctx.ConnID), zap.Int("arg_count", len(args)))
		return nil, pkgerrors.ErrInvalidArgs
	}

	message, targetID, targetChar, err := h.parseWhisperTarget(ctx, args)
	if err != nil {
		return nil, err
	}
	if targetID == 0 {
		h.logger.Warn("Wisper: invalid target ID", zap.Any("args", args))
		return nil, pkgerrors.ErrInvalidInput
	}
	if message == "" {
		return nil, nil
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	targetConn := h.rtmpServer.GetConnectionByCharacterID(strconv.FormatInt(targetID, 10))
	chatData := map[string]interface{}{
		"text":         message,
		"sourceId":     characterID,
		"sourceName":   char.Name,
		"sourceIdType": TBL_CHARACTOR,
		"pmLevel":      char.CurrentPMLevel(time.Now()),
		"targetId":     targetID,
		"targetName":   targetChar.Name,
	}

	h.logger.Info("Whisper message",
		zap.Int64("sender_id", characterID),
		zap.String("sender_name", char.Name),
		zap.Int64("target_id", targetID),
		zap.String("target_name", targetChar.Name),
		zap.String("message", message))

	if targetConn == nil {
		h.logger.Debug("Whisper target is offline", zap.Int64("target_id", targetID))
		_ = ctx.Connection.SendCallback("onBlueMsg", "Người chơi không online")
		return nil, nil
	}

	if err := targetConn.SendCallback("onWisper", chatData); err != nil {
		h.logger.Warn("Failed to send whisper to target", zap.Int64("target_id", targetID), zap.Error(err))
	}
	if characterID != targetID {
		if err := ctx.Connection.SendCallback("onWisper", chatData); err != nil {
			h.logger.Warn("Failed to send whisper confirmation to sender", zap.Error(err))
		}
	}

	return nil, nil
}

func (h *Handler) parseWhisperTarget(ctx *rtmp.RPCContext, args []interface{}) (string, int64, *character.Character, error) {
	var message string
	var targetID int64
	var targetChar *character.Character

	if len(args) >= 3 {
		potentialTargetID, _ := parseInt64Arg(args[0])
		parts := make([]string, 0, len(args)-2)
		for i := 2; i < len(args); i++ {
			if str, ok := args[i].(string); ok {
				parts = append(parts, str)
			}
		}

		cleanFull := strings.TrimSpace(strings.Join(parts, " "))
		resolvedTargetID, resolvedTargetName := h.resolveWhisperTargetByName(ctx, cleanFull)
		if resolvedTargetID > 0 {
			targetID = resolvedTargetID
			message = strings.TrimSpace(strings.TrimPrefix(cleanFull, resolvedTargetName))
		} else {
			if potentialTargetID == 0 {
				return "", 0, nil, pkgerrors.ErrInvalidInput
			}
			targetID = potentialTargetID
			message = cleanFull
		}
	} else {
		message, _ = args[0].(string)
		targetID, _ = parseInt64Arg(args[1])
	}

	if targetID > 0 {
		var err error
		targetChar, err = h.charService.GetByID(ctx.Context, targetID)
		if err != nil {
			h.logger.Warn("Wisper: target character not found", zap.Int64("target_id", targetID), zap.Error(err))
			return "", 0, nil, err
		}
		if message == "" {
			message = strings.TrimSpace(strings.TrimPrefix(strings.TrimSpace(message), targetChar.Name))
		}
	}

	return strings.TrimSpace(message), targetID, targetChar, nil
}

func (h *Handler) resolveWhisperTargetByName(ctx *rtmp.RPCContext, fullText string) (int64, string) {
	words := strings.Split(strings.TrimSpace(fullText), " ")
	for i := len(words); i > 0; i-- {
		candidateName := strings.Join(words[:i], " ")
		targetID, targetName, err := h.charService.GetCharacterIDByName(ctx.Context, candidateName)
		if err == nil && targetID > 0 {
			return targetID, targetName
		}
	}
	return 0, ""
}
