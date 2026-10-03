// Open-sourced by BaoLT

// Equipment element change handlers implement the changeElement preview-confirm flow.
package item

import (
	"math/rand"
	"strconv"

	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const changeElementMoneyCost int64 = 30000

type pendingChangeElement struct {
	equipmentID int64
	newElement  int
}

func changeElementRoll(currentElement int) int {
	for {
		e := rand.Intn(6) + 1
		if e != currentElement {
			return e
		}
	}
}

func (h *Handler) getPendingChangeElement(characterID int64) (*pendingChangeElement, bool) {
	h.pendingChangeElementsMu.Lock()
	defer h.pendingChangeElementsMu.Unlock()

	pending, ok := h.pendingChangeElements[characterID]
	if !ok {
		return nil, false
	}

	copy := *pending
	return &copy, true
}

func (h *Handler) setPendingChangeElement(characterID int64, pending *pendingChangeElement) {
	h.pendingChangeElementsMu.Lock()
	defer h.pendingChangeElementsMu.Unlock()

	if pending == nil {
		delete(h.pendingChangeElements, characterID)
		return
	}

	copy := *pending
	h.pendingChangeElements[characterID] = &copy
}

func (h *Handler) clearPendingChangeElement(characterID int64) {
	h.setPendingChangeElement(characterID, nil)
}

func (h *Handler) ChangeElement(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 3 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	equipmentID, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	materialIdx, ok := parseFlexibleInt64(args[1])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	tempBagFlag, _ := parseFlexibleBool(args[2])

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	fail := map[string]interface{}{"f": false}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil || char == nil {
		return fail, nil
	}
	if !charHasMoney(char, changeElementMoneyCost) {
		return fail, nil
	}

	equipment, err := h.itemService.GetItemByID(ctx.Context, characterID, equipmentID)
	if err != nil || equipment == nil || equipment.ItemType != domainitem.ItemTypeEquipment {
		return fail, nil
	}

	equipTpl := h.itemService.GetEquipmentTemplate(equipment.TemplateID)
	if equipTpl == nil {
		return fail, nil
	}

	requiredMaterialTID := int(equipTpl.RequireItem1)
	if requiredMaterialTID <= 0 {
		return fail, nil
	}

	materialRef := craftMaterialRef{idx: materialIdx, tempBagFlag: tempBagFlag}
	materialItem, err := h.getCraftMaterialItem(ctx, characterID, materialRef)
	if err != nil || materialItem == nil {
		return fail, nil
	}
	if materialItem.TemplateID != requiredMaterialTID {
		return fail, nil
	}

	currentElement := changeSoulPropertyInt(equipment.Properties["element"])
	newElement := changeElementRoll(currentElement)

	consumedItem, deleted, consumeErr := h.itemService.ConsumeItemStack(ctx.Context, characterID, materialItem.ID, 1)
	if consumeErr != nil {
		return rtmp.ErrorToResponse(consumeErr), nil
	}
	if deleted {
		ctx.Connection.SendCallback("onDelCharactorSlot", float64(consumedItem.ID), float64(consumedItem.CalculateSID()))
	} else {
		ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(consumedItem))
	}

	charDeductMoney(char, changeElementMoneyCost)
	if err := h.charService.Update(ctx.Context, char); err != nil {
		return rtmp.ErrorToResponse(err), nil
	}
	ctx.Connection.SendCallback("onUPP", charMoneyUpdatePayload(char))

	h.setPendingChangeElement(characterID, &pendingChangeElement{
		equipmentID: equipmentID,
		newElement:  newElement,
	})

	remainingStack := 0
	if !deleted {
		remainingStack = consumedItem.StackCount
	}

	h.logger.Info("ChangeElement: preview generated",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int64("equipment_id", equipmentID),
		zap.Int("current_element", currentElement),
		zap.Int("new_element", newElement))

	return map[string]interface{}{
		"f":  true,
		"ii": float64(materialItem.ID),
		"n":  float64(remainingStack),
		"e":  newElement,
		"b":  currentElement,
		"ei": newElement,
	}, nil
}

func (h *Handler) SureChangeElement(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	decision, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	pending, ok := h.getPendingChangeElement(characterID)
	if !ok {
		return map[string]interface{}{"f": "false"}, nil
	}

	h.clearPendingChangeElement(characterID)

	if decision <= 0 {
		h.logger.Info("SureChangeElement: rejected",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", characterID),
			zap.Int64("equipment_id", pending.equipmentID))
		return map[string]interface{}{"f": "false"}, nil
	}

	updatedEquipment, updateErr := h.itemService.UpdateEquipmentElement(ctx.Context, pending.equipmentID, pending.newElement)
	if updateErr != nil {
		return map[string]interface{}{"f": "false"}, nil
	}

	ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(updatedEquipment))

	if updatedEquipment.IsEquipped() {
		if updatedChar, charErr := h.charService.GetByID(ctx.Context, characterID); charErr == nil && updatedChar != nil {
			h.itemService.ApplyCharacterElementState(ctx.Context, updatedChar)
			h.sendCharacterElementUpdate(ctx, updatedChar)
			ctx.Connection.SendCallback("onInitViewProp", h.getCharacterViewProps(ctx.Context, updatedChar))
		}
		ctx.Connection.SendCallback("onEquipActiveList", h.itemService.BuildEquipActiveList(ctx.Context, characterID))
	}

	h.logger.Info("SureChangeElement: accepted",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int64("equipment_id", pending.equipmentID),
		zap.Int("new_element", pending.newElement))

	return map[string]interface{}{
		"f": "true",
		"e": pending.newElement,
	}, nil
}
