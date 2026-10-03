// Open-sourced by BaoLT

// Equipment soul activation change handlers implement the changeSoul preview-confirm flow.
// Mode 1 (full change): re-rolls both attribute type and value, requires confirmation.
// Mode 2 (partial change): keeps attribute type, re-rolls value only, auto-applied.
package item

import (
	"math/rand"
	"strconv"

	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const changeSoulMoneyCost int64 = 50000

var changeSoulMaterialByLevel = [...]struct{ maxLevel, templateID int }{
	{60, 1659},
	{80, 1660},
	{100, 1661},
	{999, 1662},
}

type pendingChangeSoul struct {
	equipmentID   int64
	activeProp    int
	activePropNum int
}

func changeSoulRequiredMaterial(reqLevel int) int {
	for _, entry := range changeSoulMaterialByLevel {
		if reqLevel <= entry.maxLevel {
			return entry.templateID
		}
	}
	return changeSoulMaterialByLevel[len(changeSoulMaterialByLevel)-1].templateID
}

func changeSoulReadCurrentProp(it *domainitem.Item) (int, int) {
	if it == nil || it.Properties == nil {
		return 0, 0
	}
	propType := changeSoulPropertyInt(it.Properties["activeProp"])
	propNum := changeSoulPropertyInt(it.Properties["activePropNum"])
	return propType, propNum
}

func changeSoulPropertyInt(value interface{}) int {
	switch v := value.(type) {
	case int:
		return v
	case int64:
		return int(v)
	case float64:
		return int(v)
	case nil:
		return 0
	default:
		return 0
	}
}

func changeSoulRollPropType() int {
	return rand.Intn(8) + 1
}

func changeSoulRollPropNum(templateMax int) int {
	if templateMax <= 1 {
		return 1
	}
	return rand.Intn(templateMax) + 1
}

func (h *Handler) getPendingChangeSoul(characterID int64) (*pendingChangeSoul, bool) {
	h.pendingChangeSoulsMu.Lock()
	defer h.pendingChangeSoulsMu.Unlock()

	pending, ok := h.pendingChangeSouls[characterID]
	if !ok {
		return nil, false
	}

	copy := *pending
	return &copy, true
}

func (h *Handler) setPendingChangeSoul(characterID int64, pending *pendingChangeSoul) {
	h.pendingChangeSoulsMu.Lock()
	defer h.pendingChangeSoulsMu.Unlock()

	if pending == nil {
		delete(h.pendingChangeSouls, characterID)
		return
	}

	copy := *pending
	h.pendingChangeSouls[characterID] = &copy
}

func (h *Handler) clearPendingChangeSoul(characterID int64) {
	h.setPendingChangeSoul(characterID, nil)
}

func (h *Handler) ChangeSoul(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 3 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	equipmentID, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	materialItemID, ok := parseFlexibleInt64(args[1])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	changeMode, ok := parseFlexibleInt64(args[2])
	if !ok || (changeMode != 1 && changeMode != 2) {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	fail := map[string]interface{}{"f": false}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil || char == nil {
		return fail, nil
	}

	totalCost := changeSoulMoneyCost * changeMode
	if !charHasMoney(char, totalCost) {
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

	requiredMaterialTID := changeSoulRequiredMaterial(int(equipTpl.ReqLevel))

	materialItem, err := h.itemService.GetItemByID(ctx.Context, characterID, materialItemID)
	if err != nil || materialItem == nil {
		return fail, nil
	}
	if materialItem.TemplateID != requiredMaterialTID {
		return fail, nil
	}
	if materialItem.StackCount < int(changeMode) {
		return fail, nil
	}

	currentPropType, currentPropNum := changeSoulReadCurrentProp(equipment)

	templateMaxPropNum := int(equipTpl.ActivePropNum)
	if templateMaxPropNum <= 0 {
		templateMaxPropNum = 10
	}

	consumedItem, deleted, consumeErr := h.itemService.ConsumeItemStack(ctx.Context, characterID, materialItemID, int(changeMode))
	if consumeErr != nil {
		return rtmp.ErrorToResponse(consumeErr), nil
	}
	if deleted {
		ctx.Connection.SendCallback("onDelCharactorSlot", float64(consumedItem.ID), float64(consumedItem.CalculateSID()))
	} else {
		ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(consumedItem))
	}

	charDeductMoney(char, totalCost)
	if err := h.charService.Update(ctx.Context, char); err != nil {
		return rtmp.ErrorToResponse(err), nil
	}
	ctx.Connection.SendCallback("onUPP", charMoneyUpdatePayload(char))

	remainingStack := 0
	if !deleted {
		remainingStack = consumedItem.StackCount
	}

	if changeMode == 2 && currentPropType > 0 {
		return h.changeSoulPartial(ctx, characterID, equipmentID, materialItemID, currentPropType, currentPropNum, templateMaxPropNum, remainingStack)
	}

	return h.changeSoulFull(ctx, characterID, equipmentID, materialItemID, currentPropType, currentPropNum, templateMaxPropNum, remainingStack)
}

func (h *Handler) changeSoulFull(
	ctx *rtmp.RPCContext,
	characterID, equipmentID, materialItemID int64,
	currentPropType, currentPropNum, templateMaxPropNum, remainingStack int,
) (interface{}, error) {
	newPropType := changeSoulRollPropType()
	newPropNum := changeSoulRollPropNum(templateMaxPropNum)

	h.setPendingChangeSoul(characterID, &pendingChangeSoul{
		equipmentID:   equipmentID,
		activeProp:    newPropType,
		activePropNum: newPropNum,
	})

	h.logger.Info("ChangeSoul: full change preview (type 1)",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int64("equipment_id", equipmentID),
		zap.Int("old_prop_type", currentPropType),
		zap.Int("old_prop_num", currentPropNum),
		zap.Int("new_prop_type", newPropType),
		zap.Int("new_prop_num", newPropNum))

	return map[string]interface{}{
		"f":        true,
		"type":     "1",
		"ii":       float64(materialItemID),
		"n":        float64(remainingStack),
		"ap":       currentPropType,
		"apn":      currentPropNum,
		"apro":     newPropType,
		"apropnum": newPropNum,
	}, nil
}

func (h *Handler) changeSoulPartial(
	ctx *rtmp.RPCContext,
	characterID, equipmentID, materialItemID int64,
	currentPropType, currentPropNum, templateMaxPropNum, remainingStack int,
) (interface{}, error) {
	newPropNum := changeSoulRollPropNum(templateMaxPropNum)

	updatedEquipment, updateErr := h.itemService.UpdateEquipmentActiveProp(ctx.Context, equipmentID, currentPropType, newPropNum)
	if updateErr != nil {
		return rtmp.ErrorToResponse(updateErr), nil
	}

	ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(updatedEquipment))
	if updatedEquipment.IsEquipped() {
		ctx.Connection.SendCallback("onEquipActiveList", h.itemService.BuildEquipActiveList(ctx.Context, characterID))
		if ch, chErr := h.charService.GetByID(ctx.Context, characterID); chErr == nil && ch != nil {
			ctx.Connection.SendCallback("onInitViewProp", h.getCharacterViewProps(ctx.Context, ch))
		}
	}

	h.logger.Info("ChangeSoul: partial change applied (type 2)",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int64("equipment_id", equipmentID),
		zap.Int("prop_type", currentPropType),
		zap.Int("old_prop_num", currentPropNum),
		zap.Int("new_prop_num", newPropNum))

	return map[string]interface{}{
		"f":        true,
		"type":     "2",
		"ii":       float64(materialItemID),
		"n":        float64(remainingStack),
		"ap":       currentPropType,
		"apn":      newPropNum,
		"apro":     newPropNum,
		"apropnum": currentPropNum,
		"apropnu":  currentPropNum,
	}, nil
}

func (h *Handler) SureChangeSoul(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
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

	pending, ok := h.getPendingChangeSoul(characterID)
	if !ok {
		return map[string]interface{}{"f": "false"}, nil
	}

	h.clearPendingChangeSoul(characterID)

	if decision <= 0 {
		h.logger.Info("SureChangeSoul: rejected",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", characterID),
			zap.Int64("equipment_id", pending.equipmentID))
		return map[string]interface{}{"f": "false"}, nil
	}

	updatedEquipment, updateErr := h.itemService.UpdateEquipmentActiveProp(ctx.Context, pending.equipmentID, pending.activeProp, pending.activePropNum)
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

	h.logger.Info("SureChangeSoul: accepted",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int64("equipment_id", pending.equipmentID),
		zap.Int("active_prop", pending.activeProp),
		zap.Int("active_prop_num", pending.activePropNum))

	return map[string]interface{}{
		"f":             "true",
		"activeProp":    pending.activeProp,
		"activePropNum": pending.activePropNum,
	}, nil
}
