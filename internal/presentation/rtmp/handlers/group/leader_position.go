// Open-sourced by BaoLT

package group

import (
	"strconv"

	"mcgame-server/internal/infrastructure/rtmp"
)

func (h *Handler) GetCharLeaderClient(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	queriedCharID, ok := parseCharLeaderClientArg(args)
	if !ok {
		if cid, err := currentCharacterID(ctx); err == nil {
			queriedCharID = cid
		}
	}
	if queriedCharID <= 0 {
		return false, nil
	}

	groupInfo, err := h.groupService.GetGroupByMember(ctx.Context, queriedCharID)
	if err != nil || groupInfo == nil {
		return false, nil
	}

	if groupInfo.LeaderID != queriedCharID {
		return false, nil
	}

	leaderChar, err := h.charService.GetByID(ctx.Context, queriedCharID)
	if err != nil {
		return false, nil
	}

	mapID := leaderChar.MapID
	x := leaderChar.PosX
	y := leaderChar.PosY
	line := 0
	if conn := h.lookupConnection(queriedCharID); conn != nil {
		line = conn.GetChannelID()
		if roomID, _ := conn.GetSceneInfo(); roomID > 0 {
			mapID = roomID
		}
	}

	return map[string]interface{}{
		"cid":      queriedCharID,
		"leaderId": queriedCharID,
		"name":     leaderChar.Name,
		"map":      mapID,
		"mid":      strconv.Itoa(mapID),
		"posMapId": strconv.Itoa(mapID),
		"x":        x,
		"y":        y,
		"line":     line,
	}, nil
}

func parseCharLeaderClientArg(args []interface{}) (int64, bool) {
	if len(args) == 0 {
		return 0, false
	}
	switch v := args[0].(type) {
	case float64:
		return int64(v), true
	case int:
		return int64(v), true
	case int64:
		return v, true
	case string:
		id, err := strconv.ParseInt(v, 10, 64)
		if err != nil {
			return 0, false
		}
		return id, true
	}
	return 0, false
}
