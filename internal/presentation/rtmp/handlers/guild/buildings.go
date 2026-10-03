// Open-sourced by BaoLT

package guild

import (
	"sort"
	"strconv"

	"mcgame-server/internal/infrastructure/rtmp"
)

const (
	guildMapID            = 49
	guildTransportTargetX = 1800
	guildTransportTargetY = 1360
)

func (h *Handler) CreateGuildBuildings(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	if h.guildService == nil || h.gameData == nil {
		return []interface{}{}, nil
	}

	guildItem, _, err := h.guildService.GetGuildByMemberForClient(ctx.Context, characterID)
	if err != nil {
		return nil, guildError(err)
	}
	if guildItem == nil {
		return []interface{}{}, nil
	}
	mapID, _ := ctx.Connection.GetSceneInfo()
	if mapID != guildMapID {
		return []interface{}{}, nil
	}

	positions := h.gameData.GetExtendPositionsByMapID(guildMapID)
	sort.Slice(positions, func(i, j int) bool {
		return positions[i].ID < positions[j].ID
	})

	occupied := h.guildBuildingAssignments(guildItem.Level)
	result := make([]interface{}, 0, len(positions))
	for _, pos := range positions {
		if pos == nil {
			continue
		}

		if tid, ok := occupied[int(pos.ID)]; ok {
			result = append(result, map[string]interface{}{
				"targetId":   nil,
				"posX":       strconv.Itoa(int(pos.PosX)),
				"layer":      "1",
				"tid":        strconv.Itoa(tid),
				"buildState": "",
				"posY":       strconv.Itoa(int(pos.PosY)),
				"posDir":     strconv.Itoa(int(pos.PosDir)),
				"permission": "",
				"cid":        nil,
				"time":       guildItem.CreatedAt.Format("2006-01-02 15:04:05"),
				"extendId":   strconv.Itoa(int(pos.ID)),
				"id":         strconv.Itoa(160 + int(pos.ID)),
				"mid":        strconv.Itoa(guildMapID),
				"gid":        strconv.FormatInt(guildItem.ID, 10),
			})
			continue
		}

		result = append(result, map[string]interface{}{
			"posX":      strconv.Itoa(int(pos.PosX)),
			"layer":     "0",
			"tid":       strconv.Itoa(int(pos.Tid)),
			"id":        strconv.Itoa(int(pos.ID)),
			"mid":       strconv.Itoa(int(pos.Mid)),
			"posY":      strconv.Itoa(int(pos.PosY)),
			"posDir":    strconv.Itoa(int(pos.PosDir)),
			"buildType": strconv.Itoa(int(pos.BuildType)),
		})
	}

	if err := ctx.Connection.SendCallback("onCreateGuildBuildings", result); err != nil {
		return nil, err
	}

	return result, nil
}

func (h *Handler) guildBuildingAssignments(guildLevel int) map[int]int {
	hallByLevel := map[int]int{
		1: 2,
		2: 6,
		3: 7,
		4: 11,
		5: 12,
	}
	houseByLevel := map[int]int{
		1: 3,
		2: 8,
		3: 9,
		4: 13,
		5: 14,
	}

	level := guildLevel
	if level < 1 {
		level = 1
	}
	if level > 6 {
		level = 6
	}

	hallTid := 16
	if value, ok := hallByLevel[level]; ok {
		hallTid = value
	}
	houseTid := 17
	if value, ok := houseByLevel[level]; ok {
		houseTid = value
	}
	warehouseTid := 15
	if level <= 1 {
		warehouseTid = 5
	}
	academyTid := 18
	if level <= 1 {
		academyTid = 4
	}

	return map[int]int{
		4:  houseTid,
		5:  warehouseTid,
		9:  houseTid,
		10: hallTid,
		11: academyTid,
	}
}
