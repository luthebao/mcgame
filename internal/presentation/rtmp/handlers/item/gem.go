// Open-sourced by BaoLT

package item

import (
	"math"
	"strconv"

	appitem "mcgame-server/internal/application/item"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const jewelItemType = 503
const jewelRemovalCostRate = 0.2

func (h *Handler) GetJewelData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
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
		return map[string]interface{}{"holeNum": 0}, nil
	}

	return appitem.BuildJewelDataResponse(it.Properties), nil
}

func (h *Handler) JewelSet(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		return 0, pkgerrors.ErrInvalidArgs
	}

	equSlotID, ok := parseFlexibleInt64(args[0])
	if !ok {
		return 0, pkgerrors.ErrInvalidArgs
	}

	jewelMap, ok := args[1].(map[string]interface{})
	if !ok {
		return 0, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return 0, pkgerrors.ErrUnauthorized
	}

	equipItem, err := h.itemService.GetItemByID(ctx.Context, characterID, equSlotID)
	if err != nil || equipItem == nil || !equipItem.IsEquipment() {
		return 0, nil
	}

	successCount := 0
	gemsToSet := make(map[int]int)

	for slotKey, entry := range jewelMap {
		slotIndex, err := strconv.Atoi(slotKey)
		if err != nil || slotIndex < 1 || slotIndex > appitem.MaxHoles {
			continue
		}

		entryMap, ok := entry.(map[string]interface{})
		if !ok {
			continue
		}

		gemRefID, ok := parseFlexibleInt64(entryMap["idx"])
		if !ok {
			continue
		}

		tempBagFlag := false
		if v, ok := entryMap["tempBagFlag"].(bool); ok {
			tempBagFlag = v
		}

		gemVal := appitem.GetHoleGemTemplateID(equipItem.Properties, slotIndex)
		if gemVal != 0 {
			continue
		}

		var gemItem *domainitem.Item
		if tempBagFlag {
			gemItem, err = h.itemService.GetItemInSlot(ctx.Context, characterID, domainitem.SlotTypeTempBag, int(gemRefID))
		} else {
			gemItem, err = h.itemService.GetItemByID(ctx.Context, characterID, gemRefID)
		}
		if err != nil || gemItem == nil {
			continue
		}

		gemTpl := h.gameData.GetItem(gemItem.TemplateID)
		if gemTpl == nil || int(gemTpl.Type) != jewelItemType {
			continue
		}

		oldSID := gemItem.CalculateSID()
		consumedItem, deleted, consumeErr := h.itemService.ConsumeItemStack(ctx.Context, characterID, gemItem.ID, 1)
		if consumeErr != nil {
			h.logger.Error("JewelSet: failed to consume gem",
				zap.Int64("gem_id", gemItem.ID),
				zap.Error(consumeErr))
			continue
		}

		if deleted {
			ctx.Connection.SendCallback("onDelCharactorSlot", float64(consumedItem.ID), float64(oldSID))
		} else {
			ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(consumedItem))
		}

		gemsToSet[slotIndex] = gemItem.TemplateID
		successCount++
	}

	if successCount > 0 {
		updatedEquip, setErr := h.itemService.BulkSetHoleGems(ctx.Context, characterID, equipItem.ID, gemsToSet)
		if setErr != nil {
			h.logger.Error("JewelSet: failed to persist equipment properties", zap.Error(setErr))
		} else {
			equipItem = updatedEquip
		}
		ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(equipItem))
	}

	return successCount, nil
}

func (h *Handler) JewelDel(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		return false, pkgerrors.ErrInvalidArgs
	}

	equSlotID, ok := parseFlexibleInt64(args[0])
	if !ok {
		return false, pkgerrors.ErrInvalidArgs
	}

	slotIndex, ok := parseFlexibleInt64(args[1])
	if !ok || slotIndex < 1 || slotIndex > int64(appitem.MaxHoles) {
		return false, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return false, pkgerrors.ErrUnauthorized
	}

	equipItem, err := h.itemService.GetItemByID(ctx.Context, characterID, equSlotID)
	if err != nil || equipItem == nil || !equipItem.IsEquipment() {
		return false, nil
	}

	gemTemplateID := appitem.GetHoleGemTemplateID(equipItem.Properties, int(slotIndex))
	if gemTemplateID <= 0 {
		return false, nil
	}

	gemTpl := h.gameData.GetItem(gemTemplateID)
	if gemTpl == nil {
		return false, nil
	}

	removalCost := int64(math.Round(float64(gemTpl.Gold) * jewelRemovalCostRate))

	if removalCost > 0 {
		char, err := h.charService.GetByID(ctx.Context, characterID)
		if err != nil || char == nil {
			return false, nil
		}

		if !charHasMoney(char, removalCost) {
			return false, nil
		}

		charDeductMoney(char, removalCost)
		if err := h.charService.Update(ctx.Context, char); err != nil {
			h.logger.Error("JewelDel: failed to update character money", zap.Error(err))
			return false, nil
		}
		ctx.Connection.SendCallback("onUPP", charMoneyUpdatePayload(char))
	}

	updatedEquip, err := h.itemService.SetHoleGem(ctx.Context, characterID, equipItem.ID, int(slotIndex), 0)
	if err != nil {
		h.logger.Error("JewelDel: failed to clear gem slot", zap.Error(err))
		return false, nil
	}

	returnedGem, err := h.itemService.AddItemWithBindAndColor(ctx.Context, characterID, gemTemplateID, domainitem.ItemTypeMaterial, 1, equipItem.IsBound, 0)
	if err != nil {
		h.logger.Error("JewelDel: failed to return gem to inventory", zap.Error(err))
	} else {
		ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(returnedGem))
	}

	ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(updatedEquip))

	h.checkBagCapacityWarning(ctx, characterID)

	return true, nil
}
