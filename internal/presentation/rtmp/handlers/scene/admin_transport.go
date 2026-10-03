// Open-sourced by BaoLT

// Admin-triggered teleport that mirrors the ToMovable room-change broadcast flow.
package scene

import (
	"context"
	"strconv"
	"time"

	"mcgame-server/internal/domain/character"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"

	"go.uber.org/zap"
)

func (h *Handler) TransportPlayer(charID int64, mapID, x, y int) bool {
	if h == nil || h.lookupConnFn == nil || h.sceneManager == nil {
		return false
	}

	conn := h.lookupConnFn(strconv.FormatInt(charID, 10))
	if conn == nil {
		return false
	}

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	channelID := conn.GetChannelID()
	oldMapID, _ := conn.GetSceneInfo()

	if oldMapID == mapID && oldMapID > 0 {
		pos := character.Position{MapID: mapID, X: x, Y: y, Direction: 0}
		if err := h.charService.UpdatePosition(ctx, charID, pos); err != nil {
			h.logger.Error("admin transport: failed to update position",
				zap.Int64("character_id", charID),
				zap.Error(err))
		}
		_ = rtmputils.UpsertSocialPresence(ctx, h.presenceStore, charID, "", mapID, x, y, channelID)

		posUpdate := map[string]interface{}{"cid": charID, "posX": x, "posY": y}
		h.sceneManager.BroadcastToScene(channelID, mapID, conn.ID, "onCharTeleport", posUpdate)
		_ = conn.SendCallback("onCharTeleport", posUpdate)
		return true
	}

	if oldMapID > 0 {
		h.sceneManager.BroadcastToScene(channelID, oldMapID, conn.ID, "onCharLeaveScene", charID)
		conn.SetSceneInfo(mapID, charID)
		h.sceneManager.MoveToScene(channelID, oldMapID, mapID, conn)
	} else {
		conn.SetSceneInfo(mapID, charID)
		h.sceneManager.AddToScene(channelID, mapID, conn)
	}

	pos := character.Position{MapID: mapID, X: x, Y: y, Direction: 0}
	if err := h.charService.UpdatePosition(ctx, charID, pos); err != nil {
		h.logger.Error("admin transport: failed to update position",
			zap.Int64("character_id", charID),
			zap.Error(err))
	}
	_ = rtmputils.UpsertSocialPresence(ctx, h.presenceStore, charID, "", mapID, x, y, channelID)

	conn.ResetSceneEntryRateLimits()

	if err := h.sendSceneResetCallbacks(conn); err != nil {
		h.logger.Error("admin transport: failed to send scene reset callbacks",
			zap.Int64("character_id", charID),
			zap.Error(err))
	}

	if err := conn.SendCallback("onSceneEnter", mapID, x, y, -1); err != nil {
		h.logger.Error("admin transport: failed to send onSceneEnter",
			zap.Int64("character_id", charID),
			zap.Error(err))
	}

	h.scenePopulationDeps().PushOnCreateChars(ctx, conn, channelID, mapID, charID)

	if char, err := h.charService.GetByID(ctx, charID); err == nil && char != nil {
		char.MapID = mapID
		char.PosX = x
		char.PosY = y
		playerData := h.sceneService.GetCharacterForClient(char)
		h.attachShowPetObject(ctx, charID, playerData)
		h.sceneManager.BroadcastToScene(channelID, mapID, conn.ID, "onScenePlayerEntered", playerData)
	} else if err != nil {
		h.logger.Warn("admin transport: failed to load character for broadcast",
			zap.Int64("character_id", charID),
			zap.Error(err))
	}

	h.groupTransportDeps().FollowLeaderToMap(ctx, charID, oldMapID, mapID, x, y)

	return true
}
