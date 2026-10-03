// Open-sourced by BaoLT

// Equipment handlers for equip/unequip and inventory initialization.
package item

import (
	"context"
	"fmt"
	"strconv"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainmw "mcgame-server/internal/domain/magicweapon"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) syncHPMPAfterEquipChange(ctx context.Context, conn *rtmp.Connection, char *character.Character) {
	if h.itemService == nil || h.charService == nil {
		return
	}
	bonuses := h.itemService.AggregateEquipmentStats(ctx, char.ID)
	computed := *char
	computed.RecalculateStats()
	computed.ApplyEquipmentBonuses(bonuses)

	if char.SyncToEffectiveMax(computed.MaxHP, computed.MaxMP) {
		if err := h.charService.Update(ctx, char); err != nil {
			h.logger.Error("Failed to persist HP/MP sync after equip change", zap.Error(err))
		}
		conn.SendCallback("onUPP", map[string]interface{}{
			"currentHp": char.CurrentHP,
			"currentMp": char.CurrentMP,
		})
	}
}

func (h *Handler) GetInitSlot(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	items, err := h.itemService.GetAllItems(ctx.Context, characterID)
	if err != nil {
		h.logger.Error("Failed to get items", zap.Error(err))
		items = []*domainitem.Item{}
	}

	result := make(map[string]interface{})
	hasBagItems := false
	hasEquipItems := false

	for _, it := range items {
		dto := h.itemDTO(it)
		idStr := fmt.Sprintf("%d", it.ID)
		result[idStr] = dto

		if it.SlotType == domainitem.SlotTypeBag {
			hasBagItems = true
		}
		if it.SlotType == domainitem.SlotTypeEquipped {
			hasEquipItems = true
		}
	}

	var itemIDs []int64
	for _, it := range items {
		itemIDs = append(itemIDs, it.ID)
	}

	h.logger.Info("GetInitSlot called",
		zap.Int64("character_id", characterID),
		zap.Int("item_count", len(result)),
		zap.Int("bag_item_count", len(itemIDs)),
		zap.Int64s("item_ids_sample", itemIDs),
		zap.Bool("has_bag_items", hasBagItems),
		zap.Bool("has_equip_items", hasEquipItems))

	return result, nil
}

func (h *Handler) EquipOn(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	itemID, ok := parseFlexibleInt64(args[0])
	if !ok {
		h.logger.Warn("EquipOn: invalid itemID type", zap.Any("type", args[0]))
		return nil, pkgerrors.ErrInvalidArgs
	}

	slotID := -1
	if len(args) >= 2 {
		slotIDRaw, ok := parseFlexibleInt64(args[1])
		if ok {
			slotID = int(slotIDRaw)
		}
	}
	if itemID == 0 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	itBefore, _ := h.itemService.GetItemByID(ctx.Context, characterID, itemID)
	var oldSid int
	if itBefore != nil {
		oldSid = itBefore.CalculateSID()
	}

	displaced, err := h.itemService.EquipItem(ctx.Context, characterID, itemID, domainitem.EquipSlot(slotID))
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	char, _ := h.charService.GetByID(ctx.Context, characterID)
	itAfter, _ := h.itemService.GetItemByID(ctx.Context, characterID, itemID)

	if itAfter != nil {
		ctx.Connection.SendCallback("onMoveItem", float64(oldSid), float64(itAfter.CalculateSID()), float64(itemID))
	}

	if displaced != nil {
		ctx.Connection.SendCallback("onMoveItem", float64(1+slotID), float64(displaced.CalculateSID()), float64(displaced.ID))
		h.checkBagCapacityWarning(ctx, characterID)
	}

	if itAfter != nil && domainmw.IsMainPosition(itAfter.SlotIndex) && h.mwSkillGranter != nil {
		if err := h.mwSkillGranter.GrantOnEquip(ctx.Context, characterID, itAfter); err != nil {
			h.logger.Warn("MW grant skills on equip failed", zap.Error(err))
		}
		if h.mwSkillUpdatePusher != nil {
			h.mwSkillUpdatePusher(ctx.Context, ctx.Connection, characterID)
		}
	}

	if char != nil {
		h.syncHPMPAfterEquipChange(ctx.Context, ctx.Connection, char)
		h.sendCharacterElementUpdate(ctx, char)
		h.sendStatUpdate(ctx, char)
		ctx.Connection.SendCallback("onEquipActiveList", h.itemService.BuildEquipActiveList(ctx.Context, characterID))
		h.sendEquipAppearanceCallbacks(ctx, char, itAfter)
	}

	h.logger.Info("Item equipped",
		zap.Int64("character_id", characterID),
		zap.Int64("item_id", itemID),
		zap.Int("slot_id", slotID))

	equipment, _ := h.itemService.GetEquipment(ctx.Context, characterID)
	equipDTOs := h.itemDTOList(equipment)

	return map[string]interface{}{
		"success":    true,
		"equipItems": equipDTOs,
	}, nil
}

func (h *Handler) EquipOff(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	firstArg, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	itByID, findErr := h.itemService.GetItemByID(ctx.Context, characterID, firstArg)
	var targetSlot domainitem.EquipSlot
	if findErr == nil && itByID != nil && itByID.SlotType == domainitem.SlotTypeEquipped {
		targetSlot = domainitem.EquipSlot(itByID.SlotIndex)
	} else if firstArg >= 1 && firstArg <= 22 {
		targetSlot = domainitem.EquipSlot(firstArg - 1)
	} else {
		_, slotIdx := domainitem.ParseSID(int(firstArg))
		targetSlot = domainitem.EquipSlot(slotIdx)
	}

	it, _ := h.itemService.GetItemInSlot(ctx.Context, characterID, domainitem.SlotTypeEquipped, int(targetSlot))

	var oldSid int = -1
	var unequipID int64 = -1
	if it != nil {
		oldSid = it.CalculateSID()
		unequipID = it.ID
	} else {
		oldSid = 1 + int(targetSlot)
	}

	unequipped, err := h.itemService.UnequipItem(ctx.Context, characterID, targetSlot)
	if err != nil {
		h.logger.Error("Failed to unequip item", zap.Error(err))
		return nil, err
	}
	if unequipID == -1 {
		unequipID = unequipped.ID
	}

	if it != nil && domainmw.IsMainPosition(int(targetSlot)) && h.mwSkillGranter != nil {
		if err := h.mwSkillGranter.RevokeOnUnequip(ctx.Context, characterID, it); err != nil {
			h.logger.Warn("MW revoke skills on unequip failed", zap.Error(err))
		}
		if h.mwSkillUpdatePusher != nil {
			h.mwSkillUpdatePusher(ctx.Context, ctx.Connection, characterID)
		}
	}

	if len(args) >= 2 {
		if toSid, ok := args[1].(float64); ok && int(toSid) != -1 {
			_, toIndex := domainitem.ParseSID(int(toSid))
			err = h.itemService.MoveItem(ctx.Context, characterID, unequipped.ID, domainitem.SlotTypeBag, toIndex)
			if err == nil {
				unequipped.SlotIndex = toIndex
			}
		}
	}
	char, _ := h.charService.GetByID(ctx.Context, characterID)
	ctx.Connection.SendCallback("onMoveItem", float64(oldSid), float64(unequipped.CalculateSID()), float64(unequipID))

	if char != nil {
		h.syncHPMPAfterEquipChange(ctx.Context, ctx.Connection, char)
		h.sendCharacterElementUpdate(ctx, char)
		h.sendStatUpdate(ctx, char)
		ctx.Connection.SendCallback("onEquipActiveList", h.itemService.BuildEquipActiveList(ctx.Context, characterID))
		h.sendUnequipAppearanceCallbacks(ctx, char, unequipped)
		ctx.Connection.SendCallback("stoneSealOnEquipChange")
	}

	h.logger.Info("Item unequipped",
		zap.Int64("character_id", characterID),
		zap.Int("equip_slot", int(targetSlot)),
		zap.Int("bag_slot", unequipped.SlotIndex))

	h.checkBagCapacityWarning(ctx, characterID)

	return nil, nil
}
