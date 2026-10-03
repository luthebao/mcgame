// Open-sourced by BaoLT

// Title activation handlers.
package title

import (
	"context"
	"fmt"
	"strconv"

	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) SetTitle(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	titleID, ok := parseTitleIDArg(h.logger, "SetTitle", ctx.ConnID, args)
	if !ok {
		return map[string]interface{}{"f": false}, nil
	}

	charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		h.logger.Error("Invalid character ID",
			zap.String("character_id", ctx.CharacterID),
			zap.Error(err))
		return map[string]interface{}{"f": false}, nil
	}

	h.logger.Debug("SetTitle called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", charID),
		zap.Int("title_id", titleID))

	result, err := h.titleService.SetActiveTitle(context.Background(), charID, titleID)
	if err != nil {
		h.logger.Error("Failed to set active title",
			zap.Int64("character_id", charID),
			zap.Int("title_id", titleID),
			zap.Error(err))
		return map[string]interface{}{"f": false}, nil
	}

	h.broadcastTitleUpdate(ctx, charID, titleID, "onTitleUpdate", "Title update broadcasted to scene")

	return result, nil
}

func (h *Handler) SetActTitle(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	titleID, ok := parseTitleIDArg(h.logger, "SetActTitle", ctx.ConnID, args)
	if !ok {
		return map[string]interface{}{"f": false}, nil
	}

	charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		h.logger.Error("Invalid character ID",
			zap.String("character_id", ctx.CharacterID),
			zap.Error(err))
		return map[string]interface{}{"f": false}, nil
	}

	h.logger.Debug("SetActTitle called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", charID),
		zap.Int("title_id", titleID))

	result, err := h.titleService.SetActiveSpecialTitle(context.Background(), charID, titleID)
	if err != nil {
		h.logger.Error("Failed to set active special title",
			zap.Int64("character_id", charID),
			zap.Int("title_id", titleID),
			zap.Error(err))
		return map[string]interface{}{"f": false}, nil
	}

	h.broadcastTitleUpdate(ctx, charID, titleID, "onActTitleUpdate", "Special title update broadcasted to scene")

	return result, nil
}

func parseTitleIDArg(logger *zap.Logger, method string, connID uint32, args []interface{}) (int, bool) {
	if len(args) < 1 {
		logger.Warn(method+" called without title ID", zap.Uint32("conn_id", connID))
		return 0, false
	}

	logger.Debug(method+" args received",
		zap.Uint32("conn_id", connID),
		zap.Any("args", args),
		zap.String("arg0_type", fmt.Sprintf("%T", args[0])))

	switch value := args[0].(type) {
	case float64:
		return int(value), true
	case int:
		return value, true
	case int64:
		return int(value), true
	case string:
		parsed, err := strconv.Atoi(value)
		if err != nil {
			logger.Warn(method+" called with unparseable string title ID",
				zap.Uint32("conn_id", connID),
				zap.String("value", value),
				zap.Error(err))
			return 0, false
		}
		return parsed, true
	default:
		logger.Warn(method+" called with invalid title ID type",
			zap.Uint32("conn_id", connID),
			zap.String("type", fmt.Sprintf("%T", args[0])),
			zap.Any("value", args[0]))
		return 0, false
	}
}

func (h *Handler) broadcastTitleUpdate(ctx *rtmp.RPCContext, charID int64, titleID int, callback string, message string) {
	currentMapID, _ := ctx.Connection.GetSceneInfo()
	if currentMapID <= 0 {
		return
	}

	channelID := ctx.Connection.GetChannelID()
	titleUpdate := map[string]interface{}{"cid": charID, "tid": titleID}
	h.sceneManager.BroadcastToScene(channelID, currentMapID, 0, callback, titleUpdate)

	h.logger.Debug(message,
		zap.Int64("character_id", charID),
		zap.Int("map_id", currentMapID),
		zap.Int("title_id", titleID))
}
