// Open-sourced by BaoLT

package group

import (
	"sort"
	"strings"

	appgroup "mcgame-server/internal/application/group"
	domaingroup "mcgame-server/internal/domain/group"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) GetRoomList(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	rooms, blocked, err := h.groupService.ListRooms(ctx.Context, charID)
	if err != nil {
		return nil, err
	}

	payload, err := h.buildRoomListPayload(ctx, rooms, blocked)
	if err != nil {
		return nil, err
	}

	if err := h.sendCallback(ctx.Connection, "onGetRoomList", payload); err != nil {
		h.logger.Warn("Failed to send onGetRoomList callback", zap.Error(err))
	}

	return payload, nil
}

func (h *Handler) ApplyToRoom(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	roomID, err := parseInt64Arg(args[0])
	if err != nil {
		return nil, err
	}

	charID, currentChar, err := h.currentCharacter(ctx)
	if err != nil {
		return nil, err
	}

	room, application, err := h.groupService.ApplyToRoom(ctx.Context, charID, currentChar["level"].(int), roomID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	if err := h.sendCallback(ctx.Connection, "onApplyToRoom"); err != nil {
		h.logger.Warn("Failed to send onApplyToRoom callback", zap.Error(err))
	}

	leaderPayload, err := h.roomParticipantDTO(ctx.Context, application.CharacterID)
	if err == nil {
		applyPayload := map[string]interface{}{
			"f":        true,
			"d":        leaderPayload,
			"leaderId": room.LeaderID,
		}
		_ = h.sendCallbackToCharacter(room.LeaderID, "onApplyListChange", applyPayload)
	}

	return nil, nil
}

func (h *Handler) GetMyRoom(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	room, ok, err := h.groupService.GetMyRoom(ctx.Context, charID)
	if err != nil {
		return nil, err
	}

	payload := map[string]interface{}{
		"f": ok,
	}
	if ok {
		roomData, buildErr := h.buildMyRoomData(ctx, room)
		if buildErr != nil {
			return nil, buildErr
		}
		payload["d"] = roomData
	}

	if err := h.sendCallback(ctx.Connection, "onGetMyRoom", payload); err != nil {
		h.logger.Warn("Failed to send onGetMyRoom callback", zap.Error(err))
	}

	return payload, nil
}

func (h *Handler) CreateRoom(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	requestData, ok := args[0].(map[string]interface{})
	if !ok {
		return nil, pkgerrors.ErrInvalidInput
	}

	charID, currentChar, err := h.currentCharacter(ctx)
	if err != nil {
		return nil, err
	}

	request, err := buildCreateRoomRequest(requestData, currentChar["level"].(int))
	if err != nil {
		return nil, err
	}

	room, err := h.groupService.CreateRoom(ctx.Context, charID, request)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	if err := h.sendCallback(ctx.Connection, "onCreateRoom", int(room.ID)); err != nil {
		h.logger.Warn("Failed to send onCreateRoom callback", zap.Error(err))
	}

	return nil, nil
}

func (h *Handler) AcceptRoomApply(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	applicantID, err := parseInt64Arg(args[0])
	if err != nil {
		return nil, err
	}

	leaderID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	result, err := h.groupService.AcceptRoomApply(ctx.Context, leaderID, applicantID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	applicantPayload, buildErr := h.roomParticipantDTO(ctx.Context, applicantID)
	if buildErr != nil {
		applicantPayload = map[string]interface{}{"cid": applicantID}
	}
	if result.RemovedOnly {
		_ = h.sendCallbackToCharacter(leaderID, "onApplyListChange", map[string]interface{}{
			"f": false,
			"d": applicantPayload,
		})
		return nil, nil
	}

	if result.Accepted && result.Group != nil {
		h.broadcastGroupJoined(ctx.Context, result.Group)
		for _, member := range result.Group.Members {
			_ = h.sendCallbackToCharacter(member.CharID, "onAcceptRoomApply", int(applicantID))
		}
	}

	return nil, nil
}

func (h *Handler) KickRoomMember(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	targetID, err := parseInt64Arg(args[0])
	if err != nil {
		return nil, err
	}

	leaderID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	beforeRoom, err := h.groupService.GetGroupByMember(ctx.Context, leaderID)
	if err != nil {
		return nil, err
	}

	updatedRoom, oldGroup, err := h.groupService.KickRoomMember(ctx.Context, leaderID, targetID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	targetPayload, buildErr := h.roomParticipantDTO(ctx.Context, targetID)
	if buildErr != nil {
		targetPayload = map[string]interface{}{"cid": targetID}
	}

	recipients := roomMemberIDs(beforeRoom)
	for _, memberID := range recipients {
		_ = h.sendCallbackToCharacter(memberID, "onKickRoomMember", targetPayload)
	}

	if updatedRoom == nil && oldGroup != nil {
		h.broadcastGroupDismiss(ctx.Context, oldGroup)
	} else if updatedRoom != nil {
		h.broadcastGroupJoined(ctx.Context, updatedRoom)
	}

	return nil, nil
}

func (h *Handler) LeaveRoom(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	memberID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	beforeRoom, err := h.groupService.GetGroupByMember(ctx.Context, memberID)
	if err != nil {
		return nil, err
	}

	updatedRoom, oldGroup, err := h.groupService.LeaveRoom(ctx.Context, memberID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	memberPayload, buildErr := h.roomParticipantDTO(ctx.Context, memberID)
	if buildErr != nil {
		memberPayload = map[string]interface{}{"cid": memberID}
	}
	if updatedRoom != nil {
		memberPayload["leaderId"] = updatedRoom.LeaderID
	}

	recipients := roomMemberIDs(beforeRoom)
	for _, recipientID := range recipients {
		_ = h.sendCallbackToCharacter(recipientID, "onMemberLeave", memberPayload)
	}

	if updatedRoom == nil && oldGroup != nil {
		h.broadcastGroupDismiss(ctx.Context, oldGroup)
	} else if updatedRoom != nil {
		h.broadcastGroupJoined(ctx.Context, updatedRoom)
	}

	return nil, nil
}

func (h *Handler) SetRoomHost(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	newLeaderID, err := parseInt64Arg(args[0])
	if err != nil {
		return nil, err
	}

	leaderID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	oldLeaderChar, err := h.charService.GetByID(ctx.Context, leaderID)
	if err != nil {
		return nil, err
	}
	newLeaderChar, err := h.charService.GetByID(ctx.Context, newLeaderID)
	if err != nil {
		return nil, err
	}

	currentRoom, _ := h.groupService.GetGroupByMember(ctx.Context, leaderID)
	wasAFK := false
	if currentRoom != nil {
		for _, member := range currentRoom.Members {
			if member.CharID == newLeaderID {
				wasAFK = member.AFK
				break
			}
		}
	}

	updatedRoom, err := h.groupService.SetRoomHost(ctx.Context, leaderID, newLeaderID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.broadcastGroupJoined(ctx.Context, updatedRoom)
	h.broadcastGroupGiveLeader(ctx.Context, updatedRoom, leaderID, oldLeaderChar.Name, newLeaderID, newLeaderChar.Name, wasAFK)
	for _, member := range updatedRoom.Members {
		_ = h.sendCallbackToCharacter(member.CharID, "onSetRoomHost", int(newLeaderID))
	}

	return nil, nil
}

func (h *Handler) SetRoomConfig(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	configData, ok := args[0].(map[string]interface{})
	if !ok {
		return nil, pkgerrors.ErrInvalidInput
	}

	leaderID, currentChar, err := h.currentCharacter(ctx)
	if err != nil {
		return nil, err
	}

	request, err := buildSetRoomConfigRequest(configData, currentChar["level"].(int))
	if err != nil {
		return nil, err
	}

	room, payload, err := h.groupService.SetRoomConfig(ctx.Context, leaderID, request)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	for _, member := range room.Members {
		_ = h.sendCallbackToCharacter(member.CharID, "onSetRoomConfig", payload)
	}

	return nil, nil
}

func (h *Handler) RoomChat(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	message, ok := args[0].(string)
	if !ok {
		return nil, pkgerrors.ErrInvalidInput
	}
	message = strings.TrimSpace(message)
	if message == "" {
		return nil, nil
	}

	charID, currentChar, err := h.currentCharacter(ctx)
	if err != nil {
		return nil, err
	}

	room, err := h.groupService.SendRoomChat(ctx.Context, charID, message)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	payload := []interface{}{charID, currentChar["name"], message}
	for _, member := range room.Members {
		_ = h.sendCallbackToCharacter(member.CharID, "onRoomSay", payload)
	}

	return nil, nil
}

func buildCreateRoomRequest(data map[string]interface{}, actorLevel int) (appgroup.CreateRoomRequest, error) {
	minLevel, err := parseIntArgFromMap(data, "minLevel")
	if err != nil {
		return appgroup.CreateRoomRequest{}, err
	}
	maxLevel, err := parseIntArgFromMap(data, "maxLevel")
	if err != nil {
		return appgroup.CreateRoomRequest{}, err
	}
	fid, err := parseIntArgFromMap(data, "fid")
	if err != nil {
		return appgroup.CreateRoomRequest{}, err
	}
	roomType, err := parseIntArgFromMap(data, "type")
	if err != nil {
		return appgroup.CreateRoomRequest{}, err
	}
	hour, err := parseIntArgFromMap(data, "hour")
	if err != nil {
		return appgroup.CreateRoomRequest{}, err
	}
	minute, err := parseIntArgFromMap(data, "minute")
	if err != nil {
		return appgroup.CreateRoomRequest{}, err
	}
	return appgroup.CreateRoomRequest{
		MinLevel:   minLevel,
		MaxLevel:   maxLevel,
		FID:        fid,
		Type:       roomType,
		Hour:       hour,
		Minute:     minute,
		ActorLevel: actorLevel,
	}, nil
}

func buildSetRoomConfigRequest(data map[string]interface{}, actorLevel int) (appgroup.SetRoomConfigRequest, error) {
	request := appgroup.SetRoomConfigRequest{ActorLevel: actorLevel}
	if minLevel, err := parseOptionalIntArgFromMap(data, "minLevel"); err != nil {
		return request, err
	} else if minLevel != nil {
		request.MinLevel = *minLevel
	}
	if maxLevel, err := parseOptionalIntArgFromMap(data, "maxLevel"); err != nil {
		return request, err
	} else if maxLevel != nil {
		request.MaxLevel = *maxLevel
	}
	if fid, err := parseOptionalIntArgFromMap(data, "fid"); err != nil {
		return request, err
	} else {
		request.FID = fid
	}
	if roomType, err := parseOptionalIntArgFromMap(data, "type"); err != nil {
		return request, err
	} else {
		request.Type = roomType
	}
	if timeValue, ok := data["time"]; ok {
		timeMap, ok := timeValue.(map[string]interface{})
		if !ok {
			return request, pkgerrors.ErrInvalidInput
		}
		hour, err := parseIntArgFromMap(timeMap, "hour")
		if err != nil {
			return request, err
		}
		minute, err := parseIntArgFromMap(timeMap, "minute")
		if err != nil {
			return request, err
		}
		request.Hour = &hour
		request.Minute = &minute
	}
	return request, nil
}

func parseIntArgFromMap(data map[string]interface{}, key string) (int, error) {
	value, ok := data[key]
	if !ok {
		return 0, pkgerrors.ErrInvalidArgs
	}
	parsed, err := parseInt64Arg(value)
	if err != nil {
		return 0, err
	}
	return int(parsed), nil
}

func parseOptionalIntArgFromMap(data map[string]interface{}, key string) (*int, error) {
	value, ok := data[key]
	if !ok {
		return nil, nil
	}
	parsed, err := parseInt64Arg(value)
	if err != nil {
		return nil, err
	}
	intValue := int(parsed)
	return &intValue, nil
}

func (h *Handler) buildRoomListPayload(ctx *rtmp.RPCContext, rooms []*domaingroup.Group, blocked bool) (map[string]interface{}, error) {
	roomList := make([]interface{}, 0, len(rooms))
	for _, room := range rooms {
		leaderChar, err := h.charService.GetByID(ctx.Context, room.LeaderID)
		if err != nil {
			return nil, err
		}
		roomList = append(roomList, map[string]interface{}{
			"roomNo":     room.ID,
			"cid":        room.LeaderID,
			"leaderName": leaderChar.Name,
			"minLevel":   room.MinLevel,
			"maxLevel":   room.MaxLevel,
			"fid":        room.RoomFID,
			"type":       room.RoomType,
			"time":       room.ScheduledAt.UnixMilli(),
			"memberNum":  len(room.Members),
		})
	}
	return map[string]interface{}{
		"st": blocked,
		"d":  roomList,
	}, nil
}

func (h *Handler) buildMyRoomData(ctx *rtmp.RPCContext, room *domaingroup.Group) (map[string]interface{}, error) {
	memberList := make([]map[string]interface{}, 0, len(room.Members))
	for _, member := range room.Members {
		memberDTO, err := h.roomParticipantDTO(ctx.Context, member.CharID)
		if err != nil {
			return nil, err
		}
		memberList = append(memberList, memberDTO)
	}

	sort.Slice(memberList, func(i, j int) bool {
		return memberList[i]["cid"].(int64) < memberList[j]["cid"].(int64)
	})

	applyList := make([]map[string]interface{}, 0, len(room.Applications))
	for _, application := range room.Applications {
		participant, err := h.roomParticipantDTO(ctx.Context, application.CharacterID)
		if err != nil {
			return nil, err
		}
		applyList = append(applyList, participant)
	}

	return map[string]interface{}{
		"cid":       room.LeaderID,
		"fid":       room.RoomFID,
		"time":      room.ScheduledAt.UnixMilli(),
		"minLevel":  room.MinLevel,
		"maxLevel":  room.MaxLevel,
		"members":   memberList,
		"applyList": applyList,
	}, nil
}

func roomMemberIDs(room *domaingroup.Group) []int64 {
	if room == nil {
		return nil
	}
	ids := make([]int64, 0, len(room.Members))
	for _, member := range room.Members {
		ids = append(ids, member.CharID)
	}
	return ids
}
