// Open-sourced by BaoLT

// Equipment tier upgrade handler: changeLevel replaces equipment with its next-tier version.
package item

import (
	"math"
	"strconv"

	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const changeLevelMoneyMultiplier int64 = 10

type changeLevelRequest struct {
	equipmentID int64
	materials   map[int]craftMaterialRef
}

func parseChangeLevelRequest(arg interface{}) (*changeLevelRequest, bool) {
	data, ok := arg.(map[string]interface{})
	if !ok {
		return nil, false
	}

	eRaw, ok := data["e"]
	if !ok {
		return nil, false
	}
	equipID, ok := parseFlexibleInt64Value(eRaw)
	if !ok || equipID <= 0 {
		return nil, false
	}

	refs := make(map[int]craftMaterialRef)
	for slot := 1; slot <= 3; slot++ {
		key := "i" + strconv.Itoa(slot)
		matRaw, exists := data[key]
		if !exists {
			continue
		}
		matMap, ok := matRaw.(map[string]interface{})
		if !ok {
			continue
		}
		idxRaw, ok := matMap["idx"]
		if !ok {
			continue
		}
		idx, ok := parseFlexibleInt64Value(idxRaw)
		if !ok {
			continue
		}
		ref := craftMaterialRef{idx: idx}
		if v, ok := matMap["flag"].(bool); ok {
			ref.tempBagFlag = v
		}
		refs[slot] = ref
	}

	if len(refs) == 0 {
		return nil, false
	}

	return &changeLevelRequest{
		equipmentID: equipID,
		materials:   refs,
	}, true
}

func parseFlexibleInt64Value(v interface{}) (int64, bool) {
	switch typed := v.(type) {
	case float64:
		if math.IsNaN(typed) || math.IsInf(typed, 0) {
			return 0, false
		}
		return int64(typed), true
	case int64:
		return typed, true
	case int:
		return int64(typed), true
	case string:
		n, err := strconv.ParseInt(typed, 10, 64)
		if err != nil {
			return 0, false
		}
		return n, true
	default:
		return 0, false
	}
}

func changeLevelMaterialColorCode(it *domainitem.Item) int {
	if it == nil || it.Properties == nil {
		return 0
	}

	quality := craftDisplayInt(it.Properties["q"])
	if quality <= 0 {
		quality = craftDisplayInt(it.Properties["quality"])
	}
	if quality > 0 {
		return int(math.Ceil(float64(quality) / 5))
	}

	tier := domainitem.NormalizeEquipmentColorCode(it.ColorCode)
	if tier > 0 {
		return tier
	}

	tier = domainitem.NormalizeEquipmentColorCode(craftDisplayInt(it.Properties["color"]))
	if tier > 0 {
		return tier
	}

	return 0
}

func changeLevelEquipmentDisplayColor(it *domainitem.Item) int {
	if it == nil {
		return 0
	}

	if it.Properties != nil {
		if color := craftDisplayInt(it.Properties["color"]); color >= 0 {
			return color
		}
	}

	return domainitem.EquipmentDisplayColorFromColorCode(it.ColorCode)
}

func (h *Handler) ChangeLevel(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	request, ok := parseChangeLevelRequest(args[0])
	if !ok {
		h.logger.Warn("ChangeLevel: invalid args", zap.Any("args", args))
		return nil, pkgerrors.ErrInvalidArgs
	}

	equipment, err := h.itemService.GetItemByID(ctx.Context, characterID, request.equipmentID)
	if err != nil || equipment == nil {
		h.logger.Warn("ChangeLevel: equipment not found",
			zap.Int64("char_id", characterID),
			zap.Int64("equipment_id", request.equipmentID))
		return map[string]interface{}{"f": false}, nil
	}

	if equipment.ItemType != domainitem.ItemTypeEquipment {
		h.logger.Warn("ChangeLevel: item is not equipment",
			zap.Int64("char_id", characterID),
			zap.Int64("item_id", request.equipmentID))
		return map[string]interface{}{"f": false}, nil
	}

	equipTemplate := h.gameData.GetEquipment(equipment.TemplateID)
	if equipTemplate == nil {
		h.logger.Warn("ChangeLevel: equipment template not found",
			zap.Int64("char_id", characterID),
			zap.Int("template_id", equipment.TemplateID))
		return map[string]interface{}{"f": false}, nil
	}

	nextEquTid := int(equipTemplate.NextEquTid)
	if nextEquTid <= 0 {
		h.logger.Warn("ChangeLevel: equipment has no next tier",
			zap.Int64("char_id", characterID),
			zap.Int("template_id", equipment.TemplateID))
		return map[string]interface{}{"f": false}, nil
	}

	nextTemplate := h.gameData.GetEquipment(nextEquTid)
	if nextTemplate == nil {
		h.logger.Warn("ChangeLevel: next tier template not found",
			zap.Int64("char_id", characterID),
			zap.Int("next_template_id", nextEquTid))
		return map[string]interface{}{"f": false}, nil
	}

	requirements := buildCraftRequirements(nextTemplate)
	if len(requirements) == 0 {
		h.logger.Warn("ChangeLevel: next tier has no material requirements",
			zap.Int64("char_id", characterID),
			zap.Int("next_template_id", nextEquTid))
		return map[string]interface{}{"f": false}, nil
	}

	selections := make([]craftMaterialSelection, 0, len(requirements))
	for _, requirement := range requirements {
		ref, ok := request.materials[requirement.slot]
		if !ok {
			h.logger.Warn("ChangeLevel: missing required material slot",
				zap.Int64("char_id", characterID),
				zap.Int("slot", requirement.slot),
				zap.Int("required_template", requirement.templateID))
			return map[string]interface{}{"f": false}, nil
		}

		it, err := h.getCraftMaterialItem(ctx, characterID, ref)
		if err != nil || it == nil {
			h.logger.Warn("ChangeLevel: material not found",
				zap.Int64("char_id", characterID),
				zap.Int("slot", requirement.slot),
				zap.Int64("ref_idx", ref.idx),
				zap.Bool("temp_bag", ref.tempBagFlag))
			return map[string]interface{}{"f": false}, nil
		}

		if it.TemplateID != requirement.templateID {
			h.logger.Warn("ChangeLevel: material template mismatch",
				zap.Int64("char_id", characterID),
				zap.Int("slot", requirement.slot),
				zap.Int("required", requirement.templateID),
				zap.Int("actual", it.TemplateID))
			return map[string]interface{}{"f": false}, nil
		}

		if it.StackCount < requirement.requiredNum {
			h.logger.Warn("ChangeLevel: insufficient material stack",
				zap.Int64("char_id", characterID),
				zap.Int("slot", requirement.slot),
				zap.Int("required", requirement.requiredNum),
				zap.Int("actual", it.StackCount))
			return map[string]interface{}{"f": false}, nil
		}

		selections = append(selections, craftMaterialSelection{
			requirement: requirement,
			item:        it,
		})
	}

	materialColor := -1
	for _, selection := range selections {
		color := changeLevelMaterialColorCode(selection.item)
		if materialColor == -1 {
			materialColor = color
		} else if color != materialColor {
			h.logger.Warn("ChangeLevel: material colors do not match",
				zap.Int64("char_id", characterID))
			return map[string]interface{}{"f": false}, nil
		}
	}

	equipColor := changeLevelEquipmentDisplayColor(equipment)
	if equipColor == 4 && materialColor < equipColor {
		h.logger.Warn("ChangeLevel: orange equipment requires same-tier materials",
			zap.Int64("char_id", characterID),
			zap.Int("equip_color", equipColor),
			zap.Int("material_color", materialColor))
		return map[string]interface{}{"f": false}, nil
	}

	reqLevel := int64(nextTemplate.ReqLevel)
	cost := reqLevel * reqLevel * changeLevelMoneyMultiplier

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil || char == nil {
		return map[string]interface{}{"f": false}, nil
	}

	if !charHasMoney(char, cost) {
		h.logger.Warn("ChangeLevel: insufficient money",
			zap.Int64("char_id", characterID),
			zap.Int64("cost", cost))
		return map[string]interface{}{"f": false}, nil
	}

	oldEquipmentID := equipment.ID
	oldEquipmentSID := equipment.CalculateSID()
	oldWasEquipped := equipment.IsEquipped()
	oldIsBound := equipment.IsBound
	oldSlotType := equipment.SlotType
	oldSlotIndex := equipment.SlotIndex

	for _, selection := range selections {
		consumedItem, deleted, consumeErr := h.itemService.ConsumeItemStack(ctx.Context, characterID, selection.item.ID, selection.requirement.requiredNum)
		if consumeErr != nil {
			h.logger.Error("ChangeLevel: failed to consume material",
				zap.Int64("char_id", characterID),
				zap.Int64("material_id", selection.item.ID),
				zap.Error(consumeErr))
			return map[string]interface{}{"f": false}, nil
		}
		if deleted {
			ctx.Connection.SendCallback("onDelCharactorSlot", float64(consumedItem.ID), float64(consumedItem.CalculateSID()))
		} else {
			ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(consumedItem))
		}
	}

	_, err = h.itemService.DropItem(ctx.Context, characterID, oldEquipmentID)
	if err != nil {
		h.logger.Error("ChangeLevel: failed to delete old equipment",
			zap.Int64("char_id", characterID),
			zap.Int64("equipment_id", oldEquipmentID),
			zap.Error(err))
		return map[string]interface{}{"f": false}, nil
	}
	ctx.Connection.SendCallback("onDelCharactorSlot", float64(oldEquipmentID), float64(oldEquipmentSID))

	charDeductMoney(char, cost)
	if err := h.charService.Update(ctx.Context, char); err != nil {
		h.logger.Error("ChangeLevel: failed to deduct money",
			zap.Int64("char_id", characterID),
			zap.Error(err))
		return map[string]interface{}{"f": false}, nil
	}
	ctx.Connection.SendCallback("onUPP", charMoneyUpdatePayload(char))

	resultColorCode := materialColor
	if resultColorCode <= 0 {
		resultColorCode = domainitem.NormalizeEquipmentColorCode(int(nextTemplate.Color))
	}

	newEquipment, err := h.itemService.AddItemWithBindAndColorAtSlot(
		ctx.Context, characterID, nextEquTid,
		domainitem.ItemTypeEquipment, 1, oldIsBound, resultColorCode, oldSlotType, oldSlotIndex,
	)
	if err != nil {
		h.logger.Error("ChangeLevel: failed to create upgraded equipment",
			zap.Int64("char_id", characterID),
			zap.Int("next_template_id", nextEquTid),
			zap.Error(err))
		return map[string]interface{}{"f": false}, nil
	}

	updatedEquipment, updateErr := h.itemService.AssignRandomEquipmentElement(ctx.Context, newEquipment.ID)
	if updateErr != nil {
		h.logger.Warn("ChangeLevel: failed to assign random element",
			zap.Int64("char_id", characterID),
			zap.Int64("item_id", newEquipment.ID),
			zap.Error(updateErr))
	} else {
		newEquipment = updatedEquipment
	}

	ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(newEquipment))

	if oldWasEquipped {
		if updatedChar, charErr := h.charService.GetByID(ctx.Context, characterID); charErr == nil && updatedChar != nil {
			h.syncHPMPAfterEquipChange(ctx.Context, ctx.Connection, updatedChar)
			h.sendCharacterElementUpdate(ctx, updatedChar)
			h.sendStatUpdate(ctx, updatedChar)
			ctx.Connection.SendCallback("onEquipActiveList", h.itemService.BuildEquipActiveList(ctx.Context, characterID))
			h.sendEquipAppearanceCallbacks(ctx, updatedChar, newEquipment)
		}
	}

	h.broadcastOrangeEquipmentNotice(char.Name, newEquipment)

	h.logger.Info("ChangeLevel: equipment upgraded",
		zap.Int64("char_id", characterID),
		zap.Int64("old_equipment_id", oldEquipmentID),
		zap.Int64("new_equipment_id", newEquipment.ID),
		zap.Int("old_template", equipment.TemplateID),
		zap.Int("new_template", nextEquTid),
		zap.Int("material_color", materialColor),
		zap.Int64("cost", cost))

	return map[string]interface{}{
		"f":   true,
		"e":   float64(oldEquipmentID),
		"i":   float64(newEquipment.ID),
		"n":   h.itemDTO(newEquipment),
		"sid": float64(oldEquipmentSID),
	}, nil
}
