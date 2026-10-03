// Open-sourced by BaoLT

package item

import (
	"sort"

	gamedatamodels "mcgame-server/internal/gamedata/models"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

const (
	radarTemplateID      = 1397
	radarMonthTemplateID = 1484
	radarWeekTemplateID  = 1615
)

var radarTemplateIDs = []int{radarTemplateID, radarMonthTemplateID, radarWeekTemplateID}

func (h *Handler) UseRadar(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	npcName, ok := firstStringArg(args)
	if !ok {
		return nil, nil
	}

	characterID, err := currentItemCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	if h.gameData == nil {
		_ = ctx.Connection.SendCallback("onNpcPos", nil)
		return nil, nil
	}

	candidates := h.gameData.GetNPCsByName(npcName)
	if len(candidates) == 0 {
		_ = ctx.Connection.SendCallback("onNpcPos", nil)
		return nil, nil
	}

	currentMapID, _ := ctx.Connection.GetSceneInfo()
	chosen := pickRadarNPC(candidates, currentMapID)
	if chosen == nil {
		_ = ctx.Connection.SendCallback("onNpcPos", nil)
		return nil, nil
	}

	consumedItem, templateID, err := h.consumePreferredItem(ctx, characterID, radarTemplateIDs)
	if err != nil {
		return nil, err
	}
	if consumedItem == nil {
		_ = ctx.Connection.SendCallback("onNpcPos", nil)
		return nil, nil
	}

	h.sendConsumedItemCallback(ctx, consumedItem)

	payload := []map[string]interface{}{
		{
			"name":     chosen.Name,
			"posMapId": int(chosen.PosMapID),
			"posX":     int(chosen.PosX),
			"posY":     int(chosen.PosY),
		},
	}
	_ = ctx.Connection.SendCallback("onNpcPos", payload)

	h.logger.Info("UseRadar completed",
		zap.Int64("character_id", characterID),
		zap.String("npc_name", chosen.Name),
		zap.Int("npc_map_id", int(chosen.PosMapID)),
		zap.Int("template_id", templateID))

	return nil, nil
}

func pickRadarNPC(candidates []*gamedatamodels.NpcTemplate, currentMapID int) *gamedatamodels.NpcTemplate {
	if len(candidates) == 0 {
		return nil
	}
	sorted := make([]*gamedatamodels.NpcTemplate, len(candidates))
	copy(sorted, candidates)
	sort.Slice(sorted, func(i, j int) bool { return sorted[i].ID < sorted[j].ID })
	if currentMapID > 0 {
		for _, npc := range sorted {
			if int(npc.PosMapID) == currentMapID {
				return npc
			}
		}
	}
	return sorted[0]
}
