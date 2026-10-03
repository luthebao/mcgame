// Open-sourced by BaoLT

// Scene movement, teleport, and mobility handlers.
package scene

import (
	"context"
	"errors"
	"strconv"
	"time"

	"mcgame-server/internal/domain/character"
	domaingroup "mcgame-server/internal/domain/group"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const (
	minimumFlyingLevel  = 50
	flyingEquipSlot     = 13
	flyingEquipPosition = 14
)

func (h *Handler) UpdatePosition(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	var x int
	var y int
	switch v := args[0].(type) {
	case float64:
		x = rtmputils.SafeFloat64ToInt(v)
	case int:
		x = v
	}
	switch v := args[1].(type) {
	case float64:
		y = rtmputils.SafeFloat64ToInt(v)
	case int:
		y = v
	}

	var dir int
	if len(args) >= 5 {
		switch v := args[4].(type) {
		case float64:
			dir = rtmputils.SafeFloat64ToInt(v)
		case int:
			dir = v
		}
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	if h.groupService != nil {
		if err := h.checkGroupMovementRestriction(ctx.Context, characterID); err != nil {
			_ = ctx.Connection.SendCallback("onMidNote", "Đã ở trong nhóm phải nghe lời nhóm trưởng")
			return map[string]interface{}{
				"success": false,
				"error":   "Cannot move while in group (must follow leader)",
			}, nil
		}
	}

	currentMapID, _ := ctx.Connection.GetSceneInfo()
	if currentMapID == 0 {
		char, err := h.charService.GetByID(ctx.Context, characterID)
		if err != nil {
			return nil, err
		}
		currentMapID = char.MapID
	}

	pos := character.Position{MapID: currentMapID, X: x, Y: y, Direction: dir}
	if err := h.charService.UpdatePosition(ctx.Context, characterID, pos); err != nil {
		return nil, err
	}
	h.syncGroupMemberPositions(ctx.Context, characterID, pos)
	_ = rtmputils.UpsertSocialPresence(ctx.Context, h.presenceStore, characterID, "", currentMapID, x, y, ctx.Connection.GetChannelID())

	posUpdate := map[string]interface{}{
		"callByUdcp": true,
		"id":         characterID,
		"x":          x,
		"y":          y,
		"route":      [][]int{{x, y}},
	}
	h.attachGroupMovementState(ctx.Context, characterID, posUpdate)
	h.sceneManager.BroadcastToScene(ctx.Connection.GetChannelID(), currentMapID, ctx.ConnID, "onCR", posUpdate)

	return nil, nil
}

func (h *Handler) UpdatePositionRun(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	data, ok := args[0].(map[string]interface{})
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	var x int
	var y int
	var route interface{}
	if xVal, exists := data["x"]; exists {
		switch v := xVal.(type) {
		case float64:
			x = rtmputils.SafeFloat64ToInt(v)
		case int:
			x = v
		}
	}
	if yVal, exists := data["y"]; exists {
		switch v := yVal.(type) {
		case float64:
			y = rtmputils.SafeFloat64ToInt(v)
		case int:
			y = v
		}
	}
	if routeVal, exists := data["route"]; exists {
		route = routeVal
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	if ctx.Connection.IsInBattle() {
		return map[string]interface{}{
			"success": false,
			"error":   "Cannot move while in battle",
		}, nil
	}

	if h.groupService != nil {
		if err := h.checkGroupMovementRestriction(ctx.Context, characterID); err != nil {
			_ = ctx.Connection.SendCallback("onMidNote", "Đã ở trong nhóm phải nghe lời nhóm trưởng")
			return map[string]interface{}{
				"success": false,
				"error":   "Cannot move while in group (must follow leader)",
			}, nil
		}
	}

	currentMapID, _ := ctx.Connection.GetSceneInfo()
	if currentMapID == 0 {
		char, err := h.charService.GetByID(ctx.Context, characterID)
		if err != nil {
			return nil, err
		}
		currentMapID = char.MapID
	}

	pos := character.Position{MapID: currentMapID, X: x, Y: y, Direction: 0}
	if err := h.charService.UpdatePosition(ctx.Context, characterID, pos); err != nil {
		return nil, err
	}
	h.syncGroupMemberPositions(ctx.Context, characterID, pos)
	_ = rtmputils.UpsertSocialPresence(ctx.Context, h.presenceStore, characterID, "", currentMapID, x, y, ctx.Connection.GetChannelID())

	posUpdate := map[string]interface{}{"id": characterID, "x": x, "y": y}
	if route != nil {
		posUpdate["route"] = route
	} else {
		posUpdate["route"] = [][]int{{x, y}}
	}
	h.attachGroupMovementState(ctx.Context, characterID, posUpdate)
	h.sceneManager.BroadcastToScene(ctx.Connection.GetChannelID(), currentMapID, ctx.ConnID, "onCR", posUpdate)

	return nil, nil
}

func (h *Handler) ToMovable(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
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

	targetMapID := oldRoomID
	targetX, targetY := h.sceneService.GetSafePoint(oldRoomID)

	if len(args) >= 3 {
		switch v := args[0].(type) {
		case float64:
			targetMapID = int(v)
		case int:
			targetMapID = v
		default:
			return nil, pkgerrors.ErrInvalidArgs
		}
		switch v := args[1].(type) {
		case float64:
			targetX = int(v)
		case int:
			targetX = v
		default:
			return nil, pkgerrors.ErrInvalidArgs
		}
		switch v := args[2].(type) {
		case float64:
			targetY = int(v)
		case int:
			targetY = v
		default:
			return nil, pkgerrors.ErrInvalidArgs
		}
	} else if len(args) != 0 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	if !h.sceneService.ValidateTeleport(targetMapID, targetX, targetY) {
		return nil, pkgerrors.ErrInvalidTeleport
	}

	isRoomChange := oldRoomID != targetMapID

	h.logger.Info("ToMovable teleport",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("char_id", characterID),
		zap.Int("old_room_id", oldRoomID),
		zap.Int("target_room_id", targetMapID),
		zap.Int("target_x", targetX),
		zap.Int("target_y", targetY),
		zap.Bool("room_change", isRoomChange))

	if isRoomChange {
		channelID := ctx.Connection.GetChannelID()
		h.sceneManager.BroadcastToScene(channelID, oldRoomID, ctx.ConnID, "onCharLeaveScene", characterID)
		ctx.Connection.SetSceneInfo(targetMapID, characterID)
		h.sceneManager.MoveToScene(channelID, oldRoomID, targetMapID, ctx.Connection)

		pos := character.Position{MapID: targetMapID, X: targetX, Y: targetY, Direction: 0}
		if err := h.charService.UpdatePosition(ctx.Context, characterID, pos); err != nil {
			h.logger.Error("Failed to update position in database", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
		}
		_ = rtmputils.UpsertSocialPresence(ctx.Context, h.presenceStore, characterID, "", targetMapID, targetX, targetY, channelID)

		if err := h.sendSceneResetCallbacks(ctx.Connection); err != nil {
			h.logger.Error("Failed to send scene reset callbacks", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
		}

		ctx.Connection.ResetSceneEntryRateLimits()

		if err := ctx.Connection.SendCallback("onSceneEnter", targetMapID, targetX, targetY, -1); err != nil {
			h.logger.Error("Failed to send onSceneEnter callback", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
		}

		h.scenePopulationDeps().PushOnCreateChars(ctx.Context, ctx.Connection, channelID, targetMapID, characterID)

		char, err := h.charService.GetByID(ctx.Context, characterID)
		if err == nil {
			char.MapID = targetMapID
			char.PosX = targetX
			char.PosY = targetY
			playerData := h.sceneService.GetCharacterForClient(char)
			h.sceneManager.BroadcastToScene(channelID, targetMapID, ctx.ConnID, "onScenePlayerEntered", playerData)
		}

		h.groupTransportDeps().FollowLeaderToMap(ctx.Context, characterID, oldRoomID, targetMapID, targetX, targetY)
	} else {
		pos := character.Position{MapID: targetMapID, X: targetX, Y: targetY, Direction: 0}
		if err := h.charService.UpdatePosition(ctx.Context, characterID, pos); err != nil {
			return rtmp.ErrorToResponse(err), nil
		}
		_ = rtmputils.UpsertSocialPresence(ctx.Context, h.presenceStore, characterID, "", targetMapID, targetX, targetY, ctx.Connection.GetChannelID())

		posUpdate := map[string]interface{}{"cid": characterID, "posX": targetX, "posY": targetY}
		h.sceneManager.BroadcastToScene(ctx.Connection.GetChannelID(), targetMapID, ctx.ConnID, "onCharTeleport", posUpdate)
	}

	return map[string]interface{}{
		"success":    true,
		"mapId":      targetMapID,
		"posX":       targetX,
		"posY":       targetY,
		"sceneReady": true,
	}, nil
}

func (h *Handler) ToSafe(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	currentRoomID, _ := ctx.Connection.GetSceneInfo()
	if currentRoomID == 0 {
		char, err := h.charService.GetByID(ctx.Context, characterID)
		if err != nil {
			return rtmp.ErrorToResponse(err), nil
		}
		currentRoomID = char.MapID
	}

	safeX, safeY := h.sceneService.GetSafePoint(currentRoomID)

	pos := character.Position{MapID: currentRoomID, X: safeX, Y: safeY, Direction: 0}
	if err := h.charService.UpdatePosition(ctx.Context, characterID, pos); err != nil {
		return rtmp.ErrorToResponse(err), nil
	}
	_ = rtmputils.UpsertSocialPresence(ctx.Context, h.presenceStore, characterID, "", currentRoomID, safeX, safeY, ctx.Connection.GetChannelID())

	char, charErr := h.charService.GetByID(ctx.Context, characterID)
	if charErr == nil && char.CurrentHP <= 0 {
		char.CurrentHP = char.MaxHP / 2
		char.CurrentMP = char.MaxMP / 2
		if char.CurrentHP < 1 {
			char.CurrentHP = 1
		}
		if err := h.charService.Save(ctx.Context, char); err != nil {
			h.logger.Warn("Failed to save character after toSafe revive", zap.Error(err))
		}
		ctx.Connection.SendCallback("onUPP", map[string]interface{}{
			"currentHp": char.CurrentHP,
			"currentMp": char.CurrentMP,
		})
	}

	posUpdate := map[string]interface{}{"cid": characterID, "posX": safeX, "posY": safeY}
	h.sceneManager.BroadcastToScene(ctx.Connection.GetChannelID(), currentRoomID, ctx.ConnID, "onCharTeleport", posUpdate)

	h.logger.Info("Teleport to safe zone",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int("room_id", currentRoomID),
		zap.Int("x", safeX),
		zap.Int("y", safeY))

	return map[string]interface{}{
		"success":    true,
		"mapId":      currentRoomID,
		"posX":       safeX,
		"posY":       safeY,
		"sceneReady": true,
	}, nil
}

func (h *Handler) CheckNetDelay(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	return time.Now().UnixMilli(), nil
}

func (h *Handler) validateBeginFlying(ctx context.Context, characterID int64) error {
	char, err := h.charService.GetByID(ctx, characterID)
	if err != nil {
		return err
	}

	if char.Level < minimumFlyingLevel {
		return pkgerrors.ErrInsufficientLevel
	}

	if h.itemService == nil {
		return pkgerrors.ErrCannotEquip
	}

	equippedItems, err := h.itemService.GetEquipment(ctx, characterID)
	if err != nil {
		return err
	}

	for _, equippedItem := range equippedItems {
		if equippedItem == nil || equippedItem.SlotType != domainitem.SlotTypeEquipped {
			continue
		}
		if equippedItem.SlotIndex == flyingEquipSlot {
			return nil
		}
		if tpl := h.itemService.GetEquipmentTemplate(equippedItem.TemplateID); tpl != nil && int(tpl.Position) == flyingEquipPosition {
			return nil
		}
	}

	return pkgerrors.ErrItemNotFound
}

func (h *Handler) BeginFlying(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("BeginFlying called", zap.Uint32("conn_id", ctx.ConnID))

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	if err := h.validateBeginFlying(ctx.Context, characterID); err != nil {
		if pkgerrors.Is(err, pkgerrors.ErrInsufficientLevel) || pkgerrors.Is(err, pkgerrors.ErrItemNotFound) || pkgerrors.Is(err, pkgerrors.ErrCannotEquip) {
			h.logger.Info("BeginFlying denied",
				zap.Uint32("conn_id", ctx.ConnID),
				zap.Int64("character_id", characterID),
				zap.Error(err))
			_ = ctx.Connection.SendCallback("onMidNote", "Cần trang bị phi hành và đạt cấp 50 mới có thể bay")
			return nil, nil
		}
		return rtmp.ErrorToResponse(err), nil
	}

	res, err := h.sceneService.BeginFlying(ctx.Context, characterID)
	if err != nil {
		h.logger.Error("Failed to begin flying",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	callbackData := map[string]interface{}{
		"id": res.CharacterID,
	}

	currentMapID, _ := ctx.Connection.GetSceneInfo()
	if currentMapID > 0 {
		h.sceneManager.BroadcastToScene(ctx.Connection.GetChannelID(), currentMapID, ctx.ConnID, "onBeginFlying", callbackData)
	}

	if err := ctx.Connection.SendCallback("onBeginFlying", callbackData); err != nil {
		h.logger.Error("Failed to send onBeginFlying callback",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	return nil, nil
}

func (h *Handler) StopFlying(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("StopFlying called", zap.Uint32("conn_id", ctx.ConnID))

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	res, err := h.sceneService.StopFlying(ctx.Context, characterID)
	if err != nil {
		h.logger.Error("Failed to stop flying",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	callbackData := map[string]interface{}{
		"id": res.CharacterID,
	}

	currentMapID, _ := ctx.Connection.GetSceneInfo()
	if currentMapID > 0 {
		h.sceneManager.BroadcastToScene(ctx.Connection.GetChannelID(), currentMapID, ctx.ConnID, "onStopFlying", callbackData)
	}

	if err := ctx.Connection.SendCallback("onStopFlying", callbackData); err != nil {
		h.logger.Error("Failed to send onStopFlying callback",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	return nil, nil
}

func (h *Handler) checkGroupMovementRestriction(ctx context.Context, characterID int64) error {
	if h.groupService == nil {
		return nil
	}

	inGroup, err := h.groupService.IsInGroup(ctx, characterID)
	if err != nil {
		h.logger.Warn("Failed to check group membership",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil
	}

	if !inGroup {
		return nil
	}

	isLeader, err := h.groupService.IsGroupLeader(ctx, characterID)
	if err != nil {
		h.logger.Warn("Failed to check group leader status",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil
	}

	if isLeader {
		return nil
	}

	isAFK, err := h.groupService.IsMemberAFK(ctx, characterID)
	if err != nil {
		h.logger.Warn("Failed to check member AFK status",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil
	}

	if isAFK {
		return nil
	}

	return errors.New("player is in group and must follow leader")
}

func (h *Handler) attachGroupMovementState(ctx context.Context, characterID int64, payload map[string]interface{}) {
	if h.groupService == nil || payload == nil {
		return
	}

	groupInfo, err := h.groupService.GetGroupByMember(ctx, characterID)
	if err != nil || groupInfo == nil || groupInfo.LeaderID != characterID || len(groupInfo.Members) == 0 {
		return
	}

	payload["mList"] = buildGroupMovementList(groupInfo)
}

func (h *Handler) syncGroupMemberPositions(ctx context.Context, leaderID int64, pos character.Position) {
	if h.groupService == nil || h.charService == nil {
		return
	}

	groupInfo, err := h.groupService.GetGroupByMember(ctx, leaderID)
	if err != nil || groupInfo == nil || groupInfo.LeaderID != leaderID {
		return
	}

	for _, member := range groupInfo.Members {
		if member.CharID == leaderID || member.AFK {
			continue
		}
		char, charErr := h.charService.GetByID(ctx, member.CharID)
		if charErr != nil || char == nil || char.MapID != pos.MapID {
			continue
		}
		if err := h.charService.UpdatePosition(ctx, member.CharID, pos); err != nil {
			h.logger.Warn("Failed to sync group member position",
				zap.Int64("leader_id", leaderID),
				zap.Int64("member_id", member.CharID),
				zap.Error(err))
		}
	}
}

func buildGroupMovementList(groupInfo *domaingroup.Group) map[string]interface{} {
	if groupInfo == nil || len(groupInfo.Members) == 0 {
		return nil
	}

	head := map[string]interface{}{"obj": groupInfo.Members[0].CharID}
	current := head
	for _, member := range groupInfo.Members[1:] {
		next := map[string]interface{}{"obj": member.CharID}
		current["next"] = next
		current = next
	}

	return map[string]interface{}{
		"head": head,
		"len":  len(groupInfo.Members),
	}
}

func (h *Handler) sendInitialCharacterAttributes(ctx *rtmp.RPCContext, characterID int64) error {
	attrs, err := h.getViewPropsWithEquipment(ctx, characterID)
	if err != nil {
		h.logger.Warn("Failed to get character attributes",
			zap.Int64("character_id", characterID),
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
		return err
	}

	if len(attrs) == 0 {
		h.logger.Warn("Character attributes are empty",
			zap.Int64("character_id", characterID),
			zap.Uint32("conn_id", ctx.ConnID))
		return errors.New("empty character attributes")
	}

	if err := ctx.Connection.SendCallback("onInitViewProp", attrs); err != nil {
		h.logger.Error("Failed to send onInitViewProp callback",
			zap.Int64("character_id", characterID),
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
		return err
	}

	h.logger.Debug("Initial character attributes sent successfully",
		zap.Int64("character_id", characterID),
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int("attribute_count", len(attrs)))

	return nil
}
