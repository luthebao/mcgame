// Open-sourced by BaoLT

// Loop-boss push/cleanup helpers shared by the takeLoop/cancelLoop RPCs
// (loop.go) and the loop-child turn-in path (lifecycle.go's FinishQuest).
// Item-summon (Trị An) pushes happen from the item handler's useItem path;
// this file only covers the map-presence (Trừ Ma) immediate push and the
// shared teardown (onBossOff, summon-registry clear, leftover order-item
// delete) that applies to every paired round regardless of its mode.
package quest

import (
	"slices"

	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) pushLoopBossOnIfMapMode(ctx *rtmp.RPCContext, characterID int64, questID int) {
	if h.questService == nil || h.gameDataManager == nil {
		return
	}
	spec, ok := h.questService.LoopBossSpec(questID)
	if !ok || len(spec.Maps) == 0 {
		return
	}
	mapID, _ := ctx.Connection.GetSceneInfo()
	if !slices.Contains(spec.Maps, mapID) {
		return
	}
	tpl := h.gameDataManager.GetNPC(spec.NpcID)
	if tpl == nil {
		return
	}
	posX, posY := int(tpl.PosX), int(tpl.PosY)
	if posX == 0 && posY == 0 {
		posX, posY = 1000, 1000
	}
	payload := map[string]interface{}{
		"id":      spec.NpcID,
		"nid":     spec.NpcID,
		"name":    tpl.Name,
		"resCode": int64(tpl.ResCode),
		"v":       int(tpl.V),
		"posX":    posX,
		"posY":    posY,
	}
	if err := ctx.Connection.SendCallback("onBossOn", payload); err != nil {
		h.logger.Error("Failed to send onBossOn callback for loop boss", zap.Int64("character_id", characterID), zap.Error(err))
	}
}

func (h *Handler) clearLoopBossForRound(ctx *rtmp.RPCContext, characterID int64, questID int) {
	if h.questService == nil {
		return
	}
	spec, ok := h.questService.LoopBossSpec(questID)
	if !ok {
		return
	}
	h.questService.ClearLoopBossSummon(characterID)
	if err := ctx.Connection.SendCallback("onBossOff", spec.NpcID); err != nil {
		h.logger.Error("Failed to send onBossOff callback for loop boss", zap.Int64("character_id", characterID), zap.Error(err))
	}

	if spec.ItemID <= 0 || h.itemService == nil {
		return
	}
	orderItem, err := h.itemService.GetItemByTemplateID(ctx.Context, characterID, spec.ItemID)
	if err != nil || orderItem == nil {
		return
	}
	sid := orderItem.CalculateSID()
	if err := h.itemService.DeleteItemByTemplateAndSlotType(ctx.Context, characterID, spec.ItemID, domainitem.SlotTypeQuestBag); err != nil {
		h.logger.Warn("Failed to delete leftover loop-boss order item", zap.Int64("character_id", characterID), zap.Error(err))
		return
	}
	if err := ctx.Connection.SendCallback("onDelCharactorSlot", float64(orderItem.ID), float64(sid)); err != nil {
		h.logger.Error("Failed to send onDelCharactorSlot callback for loop-boss order item", zap.Int64("character_id", characterID), zap.Error(err))
	}
}
