// Open-sourced by BaoLT

package item

import (
	"strconv"

	appitem "mcgame-server/internal/application/item"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) GetHoleNum(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	equSlotID, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	it, err := h.itemService.GetItemByID(ctx.Context, characterID, equSlotID)
	if err != nil || it == nil || !it.IsEquipment() {
		h.logger.Debug("GetHoleNum: invalid equipment",
			zap.Int64("char_id", characterID),
			zap.Int64("item_id", equSlotID),
			zap.Error(err))
		return map[string]interface{}{"holeNum": 0, "flag": false}, nil
	}

	drilledCount := appitem.GetDrilledHoleCount(it.Properties)

	return map[string]interface{}{
		"holeNum": drilledCount,
		"flag":    true,
	}, nil
}

func (h *Handler) HoleDig(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	diamondSlotID, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	equSlotID, ok := parseFlexibleInt64(args[1])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	equipItem, err := h.itemService.GetItemByID(ctx.Context, characterID, equSlotID)
	if err != nil || equipItem == nil || !equipItem.IsEquipment() {
		h.logger.Debug("HoleDig: invalid equipment",
			zap.Int64("char_id", characterID),
			zap.Int64("equip_id", equSlotID),
			zap.Error(err))
		return map[string]interface{}{"flag": false}, nil
	}

	if !equipItem.IsBound {
		return map[string]interface{}{"flag": false}, nil
	}

	equipTpl := h.itemService.GetEquipmentTemplate(equipItem.TemplateID)
	if equipTpl == nil {
		return map[string]interface{}{"flag": false}, nil
	}

	maxCapacity := int(equipTpl.HoleNum)
	if maxCapacity <= 0 {
		maxCapacity = appitem.MaxHoles
	}
	if maxCapacity > appitem.MaxHoles {
		maxCapacity = appitem.MaxHoles
	}

	drilledCount := appitem.GetTotalDrilledSlots(equipItem.Properties)
	if drilledCount >= maxCapacity {
		return map[string]interface{}{"flag": false}, nil
	}

	diamondItem, err := h.itemService.GetItemByID(ctx.Context, characterID, diamondSlotID)
	if err != nil || diamondItem == nil {
		return map[string]interface{}{"flag": false}, nil
	}

	if !h.itemService.IsDiamondItem(diamondItem.TemplateID) {
		return map[string]interface{}{"flag": false}, nil
	}

	nextSlot := appitem.GetNextUndrilledSlot(equipItem.Properties)
	requiredColor := appitem.RequiredDiamondColorForSlot(nextSlot)
	if diamondItem.ColorCode < requiredColor {
		return map[string]interface{}{"flag": false}, nil
	}

	if diamondItem.StackCount < 1 {
		return map[string]interface{}{"flag": false}, nil
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil || char == nil {
		return map[string]interface{}{"flag": false}, nil
	}

	if !charHasMoney(char, appitem.HoleDigCost) {
		return map[string]interface{}{"flag": false}, nil
	}

	consumedItem, deleted, consumeErr := h.itemService.ConsumeItemStack(ctx.Context, characterID, diamondItem.ID, 1)
	if consumeErr != nil {
		h.logger.Error("HoleDig: failed to consume diamond", zap.Error(consumeErr))
		return map[string]interface{}{"flag": false}, nil
	}

	remainingDiamonds := 0
	if !deleted {
		remainingDiamonds = consumedItem.StackCount
		ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(consumedItem))
	} else {
		ctx.Connection.SendCallback("onDelCharactorSlot", float64(consumedItem.ID), float64(consumedItem.CalculateSID()))
	}

	charDeductMoney(char, appitem.HoleDigCost)
	if err := h.charService.Update(ctx.Context, char); err != nil {
		h.logger.Error("HoleDig: failed to update character money", zap.Error(err))
		return map[string]interface{}{"flag": false}, nil
	}

	updatedEquip, drillErr := h.itemService.DrillEquipmentHole(ctx.Context, characterID, equipItem.ID)
	if drillErr != nil {
		h.logger.Error("HoleDig: failed to drill hole", zap.Error(drillErr))
		return map[string]interface{}{"flag": false}, nil
	}

	ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(updatedEquip))
	ctx.Connection.SendCallback("onUPP", charMoneyUpdatePayload(char))

	return map[string]interface{}{
		"equSlotId":     float64(equSlotID),
		"diamondSlotId": float64(diamondSlotID),
		"num":           float64(remainingDiamonds),
		"flag":          true,
	}, nil
}
