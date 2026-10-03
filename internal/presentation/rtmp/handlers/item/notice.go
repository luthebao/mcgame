// Open-sourced by BaoLT

// Item notice helpers send client-compatible global system messages for rare equipment results.
package item

import (
	"fmt"

	"go.uber.org/zap"
	domainitem "mcgame-server/internal/domain/item"
)

func isOrangeEquipmentItem(it *domainitem.Item) bool {
	if it == nil || !it.IsEquipment() {
		return false
	}

	if domainitem.NormalizeEquipmentColorCode(it.ColorCode) == 5 {
		return true
	}

	if it.Properties != nil {
		if quality := craftDisplayInt(it.Properties["q"]); domainitem.EquipmentColorCodeFromQuality(quality) == 5 {
			return true
		}
		if quality := craftDisplayInt(it.Properties["quality"]); domainitem.EquipmentColorCodeFromQuality(quality) == 5 {
			return true
		}
	}

	return false
}

func (h *Handler) orangeEquipmentNoticeName(it *domainitem.Item) string {
	if h == nil || h.itemService == nil || it == nil {
		return ""
	}

	tpl := h.itemService.GetEquipmentTemplate(it.TemplateID)
	if tpl == nil || tpl.Name == "" {
		return ""
	}

	if it.Properties != nil {
		if quality := craftDisplayInt(it.Properties["q"]); quality > 0 {
			return domainitem.FormatEquipmentDisplayNameFromQuality(tpl.Name, quality)
		}
		if quality := craftDisplayInt(it.Properties["quality"]); quality > 0 {
			return domainitem.FormatEquipmentDisplayNameFromQuality(tpl.Name, quality)
		}
	}

	return domainitem.FormatEquipmentDisplayName(tpl.Name, it.ColorCode)
}

func (h *Handler) broadcastOrangeEquipmentNotice(characterName string, it *domainitem.Item) {
	if h == nil || h.broadcastToAllFn == nil || characterName == "" || !isOrangeEquipmentItem(it) {
		return
	}

	itemName := h.orangeEquipmentNoticeName(it)
	if itemName == "" {
		return
	}

	message := fmt.Sprintf("Chúc mừng %s đã nhận được %s!", characterName, itemName)
	h.broadcastToAllFn("onSystemSay", message)
	if h.logger != nil {
		h.logger.Info("broadcasted orange equipment notice",
			zap.String("character_name", characterName),
			zap.String("item_name", itemName),
			zap.Int64("item_id", it.ID),
			zap.Int("template_id", it.TemplateID))
	}
}
