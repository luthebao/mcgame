// Open-sourced by BaoLT

// Scene login and room transition handlers.
package scene

import (
	"context"
	"fmt"
	"strconv"
	"time"

	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) SceneLogin(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Scene login - joining room",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character", char.Name),
		zap.Int64("char_id", characterID),
		zap.Int("room_id", char.MapID),
		zap.Int("pos_x", char.PosX),
		zap.Int("pos_y", char.PosY))

	channelID := ctx.Connection.GetChannelID()
	ctx.Connection.SetSceneInfo(char.MapID, characterID)
	h.sceneManager.AddToScene(channelID, char.MapID, ctx.Connection)
	_ = rtmputils.UpsertSocialPresenceFromCharacter(ctx.Context, h.presenceStore, char, channelID)

	mapIDStr := strconv.Itoa(char.MapID)
	if err := h.sendCallback(ctx.Connection, "onSceneLogin", mapIDStr, mapIDStr); err != nil {
		h.logger.Error("Failed to send onSceneLogin callback", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
	}

	playerData := h.sceneService.GetCharacterForClient(char)
	h.attachShowPetObject(ctx.Context, characterID, playerData)

	mountOff := buildMountOffObject(characterID, playerData)
	if err := h.sendCallback(ctx.Connection, "onMountOff", mountOff); err != nil {
		h.logger.Error("Failed to send onMountOff callback", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
	}

	if err := h.sendCallback(ctx.Connection, "onClearWbView", true); err != nil {
		h.logger.Error("Failed to send onClearWbView callback", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
	}

	if err := h.sendCallback(ctx.Connection, "onCreateCharactor", playerData); err != nil {
		h.logger.Error("Failed to send onCreateCharactor callback", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
	}

	h.sceneManager.BroadcastToScene(channelID, char.MapID, ctx.ConnID, "onScenePlayerEntered", playerData)

	if h.activityHandler != nil {
		h.activityHandler.SendNextOnlineReward(ctx.Connection, characterID)
	} else {
		h.logger.Warn("ActivityHandler not set in SceneHandler, online reward skipped")
	}

	h.sendPetStateCallbacks(ctx.Connection, characterID)

	return nil, nil
}

func buildMountOffObject(characterID int64, playerData map[string]interface{}) map[string]interface{} {
	wp := "0"
	if v, ok := playerData["wp"]; ok {
		switch typed := v.(type) {
		case string:
			wp = typed
		case int64:
			wp = strconv.FormatInt(typed, 10)
		}
	}

	ee := "0"
	if v, ok := playerData["ee"]; ok {
		switch typed := v.(type) {
		case string:
			ee = typed
		}
	}

	ef := false
	if v, ok := playerData["ef"]; ok {
		if b, ok := v.(bool); ok {
			ef = b
		}
	}

	en := 0
	if v, ok := playerData["en"]; ok {
		switch typed := v.(type) {
		case int:
			en = typed
		case float64:
			en = int(typed)
		}
	}

	star := "0"
	if v, ok := playerData["star"]; ok {
		switch typed := v.(type) {
		case int:
			star = strconv.Itoa(typed)
		case string:
			star = typed
		}
	}

	return map[string]interface{}{
		"cid":       characterID,
		"wp":        wp,
		"ee":        ee,
		"ef":        ef,
		"en":        en,
		"star":      star,
		"isMountOn": false,
	}
}

func (h *Handler) sendPetStateCallbacks(conn *rtmp.Connection, characterID int64) {
	if h.petService == nil {
		return
	}

	bgCtx := context.Background()
	pets, err := h.petService.GetPetList(bgCtx, characterID)
	if err != nil || len(pets) == 0 {
		return
	}

	go func() {
		time.Sleep(300 * time.Millisecond)
		for _, p := range pets {
			state := p.ClientState()
			if sendErr := conn.SendCallback("onUpdatePet", float64(p.ID), "state", fmt.Sprintf("%d", state)); sendErr != nil {
				return
			}
		}
	}()
}

func (h *Handler) SceneChange(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	var gateID int
	switch v := args[0].(type) {
	case float64:
		gateID = int(v)
	case int:
		gateID = v
	default:
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	oldRoomID, _ := ctx.Connection.GetSceneInfo()
	if oldRoomID == 0 {
		char, err := h.charService.GetByID(ctx.Context, characterID)
		if err != nil {
			return rtmp.ErrorToResponse(err), nil
		}
		oldRoomID = char.MapID
	}

	dest, err := h.sceneService.GetTeleportDestination(gateID)
	if err != nil || dest == nil {
		h.logger.Warn("Failed to get teleport destination", zap.Int("gate_id", gateID), zap.Error(err))
		return nil, pkgerrors.ErrInvalidArgs
	}

	newRoomID := dest.MapID

	h.logger.Info("Scene change - room transition starting",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("char_id", characterID),
		zap.Int("gate_id", gateID),
		zap.Int("old_room_id", oldRoomID),
		zap.Int("new_room_id", newRoomID),
		zap.Int("dest_x", dest.X),
		zap.Int("dest_y", dest.Y),
		zap.Int("old_room_players", h.sceneManager.GetScenePlayerCount(ctx.Connection.GetChannelID(), oldRoomID)))

	channelID := ctx.Connection.GetChannelID()
	h.sceneManager.BroadcastToScene(channelID, oldRoomID, ctx.ConnID, "onCharLeaveScene", characterID)
	ctx.Connection.SetSceneInfo(newRoomID, characterID)
	h.sceneManager.MoveToScene(channelID, oldRoomID, newRoomID, ctx.Connection)

	pos := character.Position{MapID: newRoomID, X: dest.X, Y: dest.Y, Direction: 0}
	if err := h.charService.UpdatePosition(ctx.Context, characterID, pos); err != nil {
		h.logger.Error("Failed to update position in database", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
	}
	_ = rtmputils.UpsertSocialPresence(ctx.Context, h.presenceStore, characterID, "", newRoomID, dest.X, dest.Y, channelID)

	if err := h.sendSceneResetCallbacks(ctx.Connection); err != nil {
		h.logger.Error("Failed to send scene reset callbacks", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
	}

	ctx.Connection.ResetSceneEntryRateLimits()

	if err := ctx.Connection.SendCallback("onSceneEnter", newRoomID, dest.X, dest.Y, -1); err != nil {
		h.logger.Error("Failed to send onSceneEnter callback", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
	}

	h.scenePopulationDeps().PushOnCreateChars(ctx.Context, ctx.Connection, channelID, newRoomID, characterID)

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		h.logger.Error("Failed to get character for broadcast", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
	} else {
		char.MapID = newRoomID
		char.PosX = dest.X
		char.PosY = dest.Y
		_ = rtmputils.UpsertSocialPresenceFromCharacter(ctx.Context, h.presenceStore, char, channelID)
		playerData := h.sceneService.GetCharacterForClient(char)
		h.attachShowPetObject(ctx.Context, characterID, playerData)
		h.sceneManager.BroadcastToScene(channelID, newRoomID, ctx.ConnID, "onScenePlayerEntered", playerData)
	}

	h.groupTransportDeps().FollowLeaderToMap(ctx.Context, characterID, oldRoomID, newRoomID, dest.X, dest.Y)

	h.logger.Info("Scene change - room transition completed",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("char_id", characterID),
		zap.Int("new_room_id", newRoomID),
		zap.Int("new_room_players", h.sceneManager.GetScenePlayerCount(channelID, newRoomID)))

	return nil, nil
}

func (h *Handler) CreateChars(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	currentRoomID, _ := ctx.Connection.GetSceneInfo()
	newMapID := char.MapID

	if currentRoomID != 0 && currentRoomID != newMapID {
		h.logger.Info("CreateChars detected room change",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("char_id", characterID),
			zap.Int("old_room_id", currentRoomID),
			zap.Int("new_room_id", newMapID))

		channelID := ctx.Connection.GetChannelID()
		h.sceneManager.BroadcastToScene(channelID, currentRoomID, ctx.ConnID, "onCharLeaveScene", characterID)
		ctx.Connection.SetSceneInfo(newMapID, characterID)
		h.sceneManager.MoveToScene(channelID, currentRoomID, newMapID, ctx.Connection)

		playerData := h.sceneService.GetCharacterForClient(char)
		h.sceneManager.BroadcastToScene(channelID, newMapID, ctx.ConnID, "onScenePlayerEntered", playerData)
	} else if currentRoomID == 0 {
		ctx.Connection.SetSceneInfo(newMapID, characterID)
		h.sceneManager.AddToScene(ctx.Connection.GetChannelID(), newMapID, ctx.Connection)
		h.logger.Info("CreateChars initial room setup",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("char_id", characterID),
			zap.Int("room_id", newMapID))
	}

	nearbyChars, err := h.sceneService.GetNearbyCharacters(ctx.Context, newMapID, characterID)
	if err != nil {
		h.logger.Error("Failed to get nearby characters", zap.Error(err))
		if sendErr := ctx.Connection.SendCallback("onCreateChars", map[string]interface{}{}); sendErr != nil {
			h.logger.Error("Failed to send onCreateChars callback", zap.Error(sendErr))
		}
		return nil, nil
	}

	channelCharIDs := h.sceneManager.GetSceneCharacterIDs(ctx.Connection.GetChannelID(), newMapID)
	result := make(map[string]interface{}, len(nearbyChars)+1)

	selfData := h.sceneService.GetCharacterForClient(char)
	h.attachShowPetObject(ctx.Context, char.ID, selfData)
	result[strconv.FormatInt(char.ID, 10)] = selfData

	for _, c := range nearbyChars {
		if _, inChannel := channelCharIDs[c.ID]; inChannel {
			playerData := h.sceneService.GetCharacterForClient(c)
			h.attachShowPetObject(ctx.Context, c.ID, playerData)
			result[strconv.FormatInt(c.ID, 10)] = playerData
		}
	}

	if err := ctx.Connection.SendCallback("onCreateChars", result); err != nil {
		h.logger.Error("Failed to send onCreateChars callback", zap.Error(err))
	}

	return nil, nil
}

func (h *Handler) groupTransportDeps() *rtmputils.GroupTransportDeps {
	if h == nil {
		return nil
	}
	return &rtmputils.GroupTransportDeps{
		Logger:            h.logger,
		GroupService:      h.groupService,
		CharService:       h.charService,
		SceneService:      h.sceneService,
		SceneManager:      h.sceneManager,
		PresenceStore:     h.presenceStore,
		LookupConn:        h.lookupConnFn,
		AttachSceneMeta:   h.attachShowPetObject,
		RefreshGroupState: h.groupStateRefresher,
	}
}

func (h *Handler) scenePopulationDeps() *rtmputils.ScenePopulationDeps {
	if h == nil {
		return nil
	}
	return &rtmputils.ScenePopulationDeps{
		CharService:     h.charService,
		SceneService:    h.sceneService,
		SceneManager:    h.sceneManager,
		AttachSceneMeta: h.attachShowPetObject,
	}
}
