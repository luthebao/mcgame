// Open-sourced by BaoLT

// Equipment bind attribute change handlers implement the changeBind preview-confirm flow.
// Re-rolls bindMainPropNum1 and bindMainPropNum2 on locked equipment.
package item

import (
	"math/rand"
	"strconv"

	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const changeBindMoneyCost int64 = 30000

type pendingChangeBind struct {
	equipmentID int64
	newBindNum1 int
	newBindNum2 int
}

func changeBindRollValue(maxVal int) int {
	if maxVal <= 0 {
		return 0
	}
	return rand.Intn(maxVal) + 1
}

func (h *Handler) getPendingChangeBind(characterID int64) (*pendingChangeBind, bool) {
	h.pendingChangeBindsMu.Lock()
	defer h.pendingChangeBindsMu.Unlock()

	pending, ok := h.pendingChangeBinds[characterID]
	if !ok {
		return nil, false
	}

	copy := *pending
	return &copy, true
}

func (h *Handler) setPendingChangeBind(characterID int64, pending *pendingChangeBind) {
	h.pendingChangeBindsMu.Lock()
	defer h.pendingChangeBindsMu.Unlock()

	if pending == nil {
		delete(h.pendingChangeBinds, characterID)
		return
	}

	copy := *pending
	h.pendingChangeBinds[characterID] = &copy
}

func (h *Handler) clearPendingChangeBind(characterID int64) {
	h.setPendingChangeBind(characterID, nil)
}

func (h *Handler) ChangeBind(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
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
	if !charHasMoney(char, changeBindMoneyCost) {
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

	requiredMaterialTID := int(equipTpl.RequireItem2)
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

	currentBind1 := changeSoulPropertyInt(equipment.Properties["bindMainPropNum1"])
	currentBind2 := changeSoulPropertyInt(equipment.Properties["bindMainPropNum2"])

	bindMax := int(equipTpl.BindPropNum)
	newBind1 := changeBindRollValue(bindMax)
	newBind2 := changeBindRollValue(bindMax)

	consumedItem, deleted, consumeErr := h.itemService.ConsumeItemStack(ctx.Context, characterID, materialItem.ID, 1)
	if consumeErr != nil {
		return rtmp.ErrorToResponse(consumeErr), nil
	}
	if deleted {
		ctx.Connection.SendCallback("onDelCharactorSlot", float64(consumedItem.ID), float64(consumedItem.CalculateSID()))
	} else {
		ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(consumedItem))
	}

	charDeductMoney(char, changeBindMoneyCost)
	if err := h.charService.Update(ctx.Context, char); err != nil {
		return rtmp.ErrorToResponse(err), nil
	}
	ctx.Connection.SendCallback("onUPP", charMoneyUpdatePayload(char))

	h.setPendingChangeBind(characterID, &pendingChangeBind{
		equipmentID: equipmentID,
		newBindNum1: newBind1,
		newBindNum2: newBind2,
	})

	remainingStack := 0
	if !deleted {
		remainingStack = consumedItem.StackCount
	}

	h.logger.Info("ChangeBind: preview generated",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int64("equipment_id", equipmentID),
		zap.Int("old_bind1", currentBind1),
		zap.Int("old_bind2", currentBind2),
		zap.Int("new_bind1", newBind1),
		zap.Int("new_bind2", newBind2))

	return map[string]interface{}{
		"f":         true,
		"ii":        float64(materialItem.ID),
		"n":         float64(remainingStack),
		"b1":        currentBind1,
		"b11":       newBind1,
		"b2":        currentBind2,
		"b12":       newBind2,
		"mainProp1": int(equipTpl.MainProp1),
		"mainProp2": int(equipTpl.MainProp2),
	}, nil
}

func (h *Handler) SureChangeBind(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
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

	pending, ok := h.getPendingChangeBind(characterID)
	if !ok {
		return map[string]interface{}{"f": "false"}, nil
	}

	h.clearPendingChangeBind(characterID)

	if decision <= 0 {
		h.logger.Info("SureChangeBind: rejected",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", characterID),
			zap.Int64("equipment_id", pending.equipmentID))
		return map[string]interface{}{"f": "false"}, nil
	}

	updatedEquipment, updateErr := h.itemService.UpdateEquipmentBindProps(ctx.Context, pending.equipmentID, pending.newBindNum1, pending.newBindNum2)
	if updateErr != nil {
		return map[string]interface{}{"f": "false"}, nil
	}

	ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(updatedEquipment))
	if updatedEquipment.IsEquipped() {
		ctx.Connection.SendCallback("onEquipActiveList", h.itemService.BuildEquipActiveList(ctx.Context, characterID))
		if ch, chErr := h.charService.GetByID(ctx.Context, characterID); chErr == nil && ch != nil {
			ctx.Connection.SendCallback("onInitViewProp", h.getCharacterViewProps(ctx.Context, ch))
		}
	}

	h.logger.Info("SureChangeBind: accepted",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int64("equipment_id", pending.equipmentID),
		zap.Int("bind_num1", pending.newBindNum1),
		zap.Int("bind_num2", pending.newBindNum2))

	return map[string]interface{}{
		"f":  "sure",
		"b1": pending.newBindNum1,
		"b2": pending.newBindNum2,
	}, nil
}
