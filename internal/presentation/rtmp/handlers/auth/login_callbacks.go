// Open-sourced by BaoLT

// Callback senders for the OnConnectAuth and ChooseCharacter RPC paths.
// Handles sending onLogin, updateAccount, onReadCharData, onChooseCharactor,
// updateUserBar, initLongBuff, initMountTimer, and other post-login callbacks.
package auth

import (
	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) sendSceneConnectCallbacks(ctx *rtmp.RPCContext, username, password string) {
	if ctx == nil || ctx.Connection == nil {
		return
	}

	if ctx.Connection.IsGlobalConnection() {
		if err := ctx.Connection.SendCallback("updateAccount", map[string]interface{}{
			"email":    username,
			"password": password,
		}); err != nil {
			h.logger.Warn("Failed to send updateAccount", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
		}
		return
	}

	if err := ctx.Connection.SendCallback("onLogin", map[string]interface{}{
		"id": "0",
		"lv": "0",
	}); err != nil {
		h.logger.Warn("Failed to send onLogin", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
	}
}

func (h *Handler) sendOnChooseCharactorCallback(ctx *rtmp.RPCContext, char *character.Character) {
	if err := ctx.Connection.SendCallback("onReadCharData", false); err != nil {
		h.logger.Warn("Failed to send onReadCharData", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
	}

	data := h.buildOnChooseCharactorPayload(ctx.Context, char)
	if ctx.Connection != nil {
		if offlineSeconds, ok := payloadOfflineSeconds(data); ok {
			ctx.Connection.SetOfflineSeconds(offlineSeconds)
		}
	}

	if err := ctx.Connection.SendCallback("onChooseCharactor", data); err != nil {
		h.logger.Error("Failed to send onChooseCharactor callback",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
		return
	}

	if err := ctx.Connection.SendCallback("updateUserBar", buildMoneyPreferenceSettings(char)); err != nil {
		h.logger.Error("Failed to send updateUserBar callback",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	h.sendInitLongBuffCallback(ctx, char)
	h.sendLoginStateCallbacks(ctx, data)

	if err := ctx.Connection.SendCallback("initDecoShowTimer", map[string]interface{}{}); err != nil {
		h.logger.Warn("Failed to send initDecoShowTimer", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
	}

	if err := ctx.Connection.SendCallback("initPRSShowTimer", map[string]interface{}{}); err != nil {
		h.logger.Warn("Failed to send initPRSShowTimer", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
	}
}

func (h *Handler) sendInitLongBuffCallback(ctx *rtmp.RPCContext, char *character.Character) {
	if h.buffService == nil || ctx == nil || ctx.Connection == nil || char == nil {
		return
	}
	buffs, err := h.buffService.ListActive(ctx.Context, char.ID)
	if err != nil {
		h.logger.Warn("Failed to load active buffs",
			zap.Int64("character_id", char.ID),
			zap.Error(err))
		return
	}
	payload := h.buffService.BuildInitLongBuffPayload(buffs)
	if err := ctx.Connection.SendCallback("initLongBuff", payload); err != nil {
		h.logger.Warn("Failed to send initLongBuff",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}
}

func (h *Handler) sendLoginStateCallbacks(ctx *rtmp.RPCContext, payload map[string]interface{}) {
	if ctx == nil || ctx.Connection == nil {
		return
	}

	jewelOffRate := 0
	if value, ok := payload["jewelOffRate"]; ok {
		switch typed := value.(type) {
		case int:
			jewelOffRate = typed
		case int64:
			jewelOffRate = int(typed)
		case float64:
			jewelOffRate = int(typed)
		}
	}
	if err := ctx.Connection.SendCallback("updateJewelOffPrice", jewelOffRate); err != nil {
		h.logger.Warn("Failed to send updateJewelOffPrice",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	if err := ctx.Connection.SendCallback("allServerMailsWarning", map[string]interface{}{}); err != nil {
		h.logger.Warn("Failed to send allServerMailsWarning",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	if err := ctx.Connection.SendCallback("initMountTimer", map[string]interface{}{
		"dressData": map[string]interface{}{},
		"useDress":  0,
	}); err != nil {
		h.logger.Warn("Failed to send initMountTimer",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	if warSpriteState, ok := payload["warSpritePanel"].(map[string]interface{}); ok {
		if err := ctx.Connection.SendCallback("updateWSPPanel", warSpriteState); err != nil {
			h.logger.Warn("Failed to send updateWSPPanel",
				zap.Uint32("conn_id", ctx.ConnID),
				zap.Error(err))
		}
	}
}
