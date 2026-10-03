// Open-sourced by BaoLT

// Trị An loop-boss order-item use path: recognizing an order item by
// template id, summoning its paired boss via the quest service's in-memory
// registry, and pushing onBossOn without consuming the item (re-use
// re-summons, matching the client's original UX).
package item

import (
	appquest "mcgame-server/internal/application/quest"
	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) useLoopBossOrderItem(ctx *rtmp.RPCContext, characterID int64, char *character.Character, it *domainitem.Item) (interface{}, error) {
	mapID, _ := ctx.Connection.GetSceneInfo()
	if mapID == 0 {
		mapID = char.MapID
	}

	summon, err := h.questService.SummonLoopBoss(ctx.Context, characterID, it.TemplateID, mapID, char.PosX, char.PosY)
	if err != nil {
		h.logger.Warn("useLoopBossOrderItem: SummonLoopBoss rejected",
			zap.Int64("character_id", characterID), zap.Int("template_id", it.TemplateID), zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}

	var npcTpl *models.NpcTemplate
	if h.gameData != nil {
		npcTpl = h.gameData.GetNPC(summon.NpcID)
	}
	if err := ctx.Connection.SendCallback("onBossOn", buildLoopBossOnPayload(summon, npcTpl)); err != nil {
		h.logger.Error("Failed to send onBossOn callback for loop boss summon", zap.Error(err))
	}

	return map[string]interface{}{
		"success": true,
		"itemId":  it.ID,
		"effects": []interface{}{},
	}, nil
}

func buildLoopBossOnPayload(summon *appquest.LoopBossSummon, tpl *models.NpcTemplate) map[string]interface{} {
	payload := map[string]interface{}{
		"id":   summon.NpcID,
		"nid":  summon.NpcID,
		"v":    -1,
		"posX": summon.X,
		"posY": summon.Y,
	}
	if tpl != nil {
		payload["name"] = tpl.Name
		payload["resCode"] = int64(tpl.ResCode)
		payload["v"] = int(tpl.V)
	}
	return payload
}
