// Open-sourced by BaoLT

package scene

import (
	"context"
	"strconv"

	domainchar "mcgame-server/internal/domain/character"
	domaingroup "mcgame-server/internal/domain/group"
	"mcgame-server/internal/infrastructure/rtmp"
)

const (
	clientCharStateNormal = 1
	clientCharStateBattle = 5
)

func (h *Handler) buildScenePlayerData(ctx context.Context, currentConn *rtmp.Connection, char *domainchar.Character) map[string]interface{} {
	playerData := h.sceneService.GetCharacterForClient(char)
	h.attachShowPetObject(ctx, char.ID, playerData)
	h.enrichScenePlayerData(ctx, currentConn, char.ID, playerData)
	return playerData
}

func (h *Handler) enrichScenePlayerData(ctx context.Context, currentConn *rtmp.Connection, characterID int64, playerData map[string]interface{}) {
	conn := h.resolveCharacterConnection(characterID, currentConn)
	inBattle := conn != nil && conn.IsInBattle()
	playerData["inBattle"] = inBattle
	if inBattle {
		playerData["state"] = clientCharStateBattle
	} else {
		playerData["state"] = clientCharStateNormal
	}

	if h.groupService == nil {
		return
	}

	groupInfo, err := h.groupService.GetGroupByMember(ctx, characterID)
	if err != nil || groupInfo == nil {
		return
	}

	playerData["inGroup"] = true
	for _, member := range groupInfo.Members {
		if member.CharID != characterID {
			continue
		}
		playerData["isLeader"] = member.IsLeader
		playerData["groupAfk"] = member.AFK
		break
	}

	if mList := buildGroupMemberList(groupInfo); mList != nil {
		playerData["mList"] = mList
	}
}

func (h *Handler) resolveCharacterConnection(characterID int64, currentConn *rtmp.Connection) *rtmp.Connection {
	if currentConn != nil && currentConn.GetCharacterID() == characterID {
		return currentConn
	}
	if h.rtmpServer == nil {
		return nil
	}
	return h.rtmpServer.GetConnectionByCharacterID(strconv.FormatInt(characterID, 10))
}

func (h *Handler) buildGroupMovementList(ctx context.Context, characterID int64) map[string]interface{} {
	if h.groupService == nil {
		return nil
	}
	groupInfo, err := h.groupService.GetGroupByMember(ctx, characterID)
	if err != nil || groupInfo == nil {
		return nil
	}
	return buildGroupMemberList(groupInfo)
}

func buildGroupMemberList(groupInfo *domaingroup.Group) map[string]interface{} {
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

	return map[string]interface{}{"head": head}
}
