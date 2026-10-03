// Open-sourced by BaoLT

package item

import (
	"fmt"
	"strconv"

	appitem "mcgame-server/internal/application/item"
	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) UseItem(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("UseItem handler called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int("args_count", len(args)),
		zap.Any("args", args))

	if len(args) < 3 {
		return nil, nil
	}

	targetTypeRaw, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, nil
	}
	targetType := int(targetTypeRaw)

	targetID, ok := parseFlexibleInt64(args[1])
	if !ok {
		return nil, nil
	}

	slotID, ok := parseFlexibleInt64(args[2])
	if !ok {
		h.logger.Warn("UseItem: invalid slot ID",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Any("args", args),
			zap.Any("slot_id", args[2]))
		return nil, nil
	}

	h.logger.Info("UseItem: parsed args",
		zap.Int("target_type", targetType),
		zap.Int64("target_id", targetID),
		zap.Int64("slot_id", slotID))

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		h.logger.Error("UseItem: failed to parse characterID", zap.Error(err))
		return nil, pkgerrors.ErrUnauthorized
	}

	h.logger.Info("UseItem: fetching character", zap.Int64("character_id", characterID))

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		h.logger.Error("UseItem: failed to get character", zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}

	it, err := h.itemService.GetItemByID(ctx.Context, characterID, slotID)
	if err != nil {
		slotType, slotIndex := domainitem.ParseSID(int(slotID))
		it, err = h.itemService.GetItemInSlot(ctx.Context, characterID, slotType, slotIndex)
		if err != nil {
			h.logger.Warn("UseItem: item not found",
				zap.Int64("slot_id", slotID),
				zap.Error(err))
			return rtmp.ErrorToResponse(pkgerrors.ErrItemNotFound), nil
		}
	}

	h.logger.Info("UseItem: calling service.UseItem",
		zap.Int64("character_id", characterID),
		zap.Int64("item_id", it.ID),
		zap.Int("template_id", it.TemplateID),
		zap.String("char_name", char.Name))

	if h.questService != nil {
		if _, ok := h.questService.LoopBossItemQuest(it.TemplateID); ok {
			return h.useLoopBossOrderItem(ctx, characterID, char, it)
		}
	}

	oldSID := it.CalculateSID()

	pendingBookUse, earlyResponse, handled := h.prepareBookUse(ctx, characterID, it)
	if handled {
		return earlyResponse, nil
	}

	uctx := &appitem.UseContext{
		TargetType: targetType,
		TargetID:   targetID,
	}
	if targetID > 0 && h.gameData != nil {
		if tpl := h.gameData.GetItem(it.TemplateID); tpl != nil && int(tpl.Type) == 507 {
			uctx.PetID = targetID
		}
	}
	usedItem, result, err := h.itemService.UseItem(ctx.Context, char, it.ID, uctx)
	if err != nil {
		h.rollbackBookUse(ctx.Context, characterID, pendingBookUse)
		if pkgerrors.Is(err, pkgerrors.ErrInsufficientLevel) {
			ctx.Connection.SendCallback("onSystemMidMsgOrNote", "Cấp độ không đủ!")
			return nil, nil
		}
		return rtmp.ErrorToResponse(err), nil
	}

	if err := h.charService.Update(ctx.Context, char); err != nil {
		h.logger.Error("Failed to update character after item use", zap.Error(err))
	}

	h.finalizeBookUse(ctx, char, result, pendingBookUse)

	if equipped, _ := result["equipped"].(bool); equipped {
		targetSID := usedItem.CalculateSID()
		ctx.Connection.SendCallback("onMoveItem", float64(oldSID), float64(targetSID), float64(it.ID))

		if displaced, ok := result["displaced"].(*domainitem.Item); ok && displaced != nil {
			sourceSID := 1 + usedItem.SlotIndex
			ctx.Connection.SendCallback("onMoveItem", float64(sourceSID), float64(displaced.CalculateSID()), float64(displaced.ID))
		}

		h.sendCharacterElementUpdate(ctx, char)
		h.sendStatUpdate(ctx, char)
		ctx.Connection.SendCallback("onEquipActiveList", h.itemService.BuildEquipActiveList(ctx.Context, characterID))
		h.sendEquipAppearanceCallbacks(ctx, char, usedItem)

		h.logger.Info("Item auto-equipped via use",
			zap.Int64("character_id", characterID),
			zap.Int64("item_id", usedItem.ID))
	} else {
		if giftBox, ok := result["gift_box"].(*appitem.GiftBoxData); ok && giftBox != nil {
			packItemList := map[string]interface{}{}
			for i, choice := range giftBox.Choices {
				packItemList[fmt.Sprintf("%d", i)] = map[string]interface{}{
					"ti": choice.TableType,
					"ii": choice.ID,
					"n":  choice.StackNum,
					"q":  choice.Quality,
				}
			}
			data := map[string]interface{}{
				"packItemList": packItemList,
				"packGetNum":   giftBox.GetNum,
			}
			slotSID := int(usedItem.CalculateSID())
			ctx.Connection.SendCallback("itemMultitoSel", data, slotSID)

			h.pendingGiftBoxesMu.Lock()
			h.pendingGiftBoxes[characterID] = &pendingGiftBox{
				ItemID:  usedItem.ID,
				SlotSID: slotSID,
				Choices: giftBox.Choices,
				GetNum:  giftBox.GetNum,
			}
			h.pendingGiftBoxesMu.Unlock()
			return map[string]interface{}{"success": true}, nil
		}

		if _, ok := result["hp_healed"]; ok || result["mp_restored"] != nil {
			ctx.Connection.SendCallback("onUPP", map[string]interface{}{
				"money":     char.Money,
				"currentHp": char.CurrentHP,
				"currentMp": char.CurrentMP,
			})
		}

		if usedItem.StackCount <= 0 {
			ctx.Connection.SendCallback("onDelCharactorSlot", float64(usedItem.ID), float64(oldSID))
		} else {
			ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(usedItem))
		}

		h.sendEffectCallbacks(ctx, result, char)
	}

	h.logger.Info("Item used successfully",
		zap.Int64("character_id", characterID),
		zap.Int64("item_id", usedItem.ID),
		zap.Int("template_id", usedItem.TemplateID))

	return map[string]interface{}{
		"success": true,
		"itemId":  usedItem.ID,
		"effects": []interface{}{},
	}, nil
}

func (h *Handler) UseMultiItem(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("UseMultiItem called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	if len(args) < 4 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	targetType := int(args[0].(float64))
	petID := int64(args[1].(float64))
	slotID := int64(args[2].(float64))
	num := int(args[3].(float64))

	char, err := h.charService.GetByID(ctx.Context, charID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	result, err := h.itemService.UseMultiItem(ctx.Context, char, slotID, num, targetType, petID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	if err := h.charService.Update(ctx.Context, char); err != nil {
		h.logger.Error("Failed to update character after multi-item use", zap.Error(err))
	}

	if _, hasHP := result["hp_healed"]; hasHP {
		ctx.Connection.SendCallback("onUPP", map[string]interface{}{
			"currentHp": char.CurrentHP,
			"currentMp": char.CurrentMP,
		})
	} else if _, hasMP := result["mp_restored"]; hasMP {
		ctx.Connection.SendCallback("onUPP", map[string]interface{}{
			"currentHp": char.CurrentHP,
			"currentMp": char.CurrentMP,
		})
	}

	if remaining, ok := result["remaining"].(int); ok && remaining <= 0 {
		if itemID, ok := result["item_id"].(int64); ok {
			ctx.Connection.SendCallback("onDelCharactorSlot", float64(itemID), slotID)
		}
	}

	h.logger.Info("Multi item used",
		zap.Int64("character_id", charID),
		zap.Int64("slot_id", slotID),
		zap.Int("count", num),
		zap.Int("target_type", targetType))

	return map[string]interface{}{
		"success": true,
		"count":   num,
		"result":  result,
	}, nil
}

func (h *Handler) ItemToTarget(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("ItemToTarget called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	slotID := int64(args[0].(float64))

	result, err := h.itemService.UseItemOnTarget(ctx.Context, charID, slotID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Item used on target",
		zap.Int64("character_id", charID),
		zap.Int64("slot_id", slotID))

	return map[string]interface{}{
		"success": true,
		"result":  result,
	}, nil
}

func (h *Handler) UseItemGold(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	var newMapID int
	var templateID int
	argObj, ok := args[0].(map[string]interface{})
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	if mid, exists := argObj["mid"]; exists {
		switch v := mid.(type) {
		case float64:
			newMapID = int(v)
		case int:
			newMapID = v
		}
	}

	if tid, exists := argObj["tid"]; exists {
		switch v := tid.(type) {
		case float64:
			templateID = int(v)
		case int:
			templateID = v
		}
	}

	if newMapID <= 0 {
		return map[string]interface{}{"success": true}, nil
	}

	isGroupTransport := isGroupTransportItem(templateID)
	priority := transportRegularPriority
	cost := transportRegularGoldCost
	if isGroupTransport {
		priority = transportSeniorPriority
		cost = transportSeniorGoldCost
	}

	return h.chargeAndTransport(ctx, characterID, newMapID, priority, cost, isGroupTransport)
}

var groupTransportTemplateIDs = map[int]struct{}{
	itemTransportSenior:          {},
	itemTransportSeniorWeek:      {},
	itemTransportSeniorHalfMonth: {},
	itemTransportSeniorMonth:     {},
	itemTransportSeniorWeekTrue:  {},
	itemTransportSeniorHalfDay:   {},
	itemTransportSeniorDay:       {},
}

func isGroupTransportItem(templateID int) bool {
	_, ok := groupTransportTemplateIDs[templateID]
	return ok
}

func (h *Handler) sendEffectCallbacks(ctx *rtmp.RPCContext, result map[string]interface{}, char *character.Character) {
	if result == nil {
		return
	}

	if msg, ok := result["message"].(string); ok && msg != "" {
		ctx.Connection.SendCallback("onSystemMidMsgOrNote", msg)
	}
	if grantedItems, ok := result["granted_items"].([]*appitem.GrantedItemResult); ok {
		for _, gi := range grantedItems {
			if gi.Item != nil {
				ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(gi.Item))
			}
		}
	}
	if pets, ok := result["pets"].([]map[string]interface{}); ok {
		for _, petDTO := range pets {
			ctx.Connection.SendCallback("onAddPet", petDTO)
		}
	}
	if updatedPets, ok := result["updated_pets"].([]*domainpet.Pet); ok && len(updatedPets) > 0 {
		sendUpdatedPetCallbacks(ctx.Connection, updatedPets)
	}
	if tempItems, ok := result["temp_bag_items"].([]*appitem.TempBagItemData); ok && len(tempItems) > 0 {
		items := make([]map[string]interface{}, 0, len(tempItems))
		for _, ti := range tempItems {
			items = append(items, map[string]interface{}{
				"itemType": ti.ItemType,
				"itemId":   ti.ItemID,
				"stackNum": ti.StackNum,
				"quality":  ti.Quality,
				"binded":   ti.Binded,
			})
		}
		ctx.Connection.SendCallback("warnTemporaryBag", items)
	}
	h.sendStructuredRewardCallbacks(ctx, result, char)
}

func (h *Handler) SelMultiItemByIdx(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		return -1, pkgerrors.ErrInvalidArgs
	}

	selectedIdx, ok := parseFlexibleInt64(args[1])
	if !ok {
		return -1, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return -1, pkgerrors.ErrUnauthorized
	}

	h.pendingGiftBoxesMu.Lock()
	pending, hasPending := h.pendingGiftBoxes[characterID]
	h.pendingGiftBoxesMu.Unlock()
	if !hasPending || pending == nil {
		return -1, nil
	}
	if int(selectedIdx) < 0 || int(selectedIdx) >= len(pending.Choices) {
		return -1, nil
	}

	choice := pending.Choices[int(selectedIdx)]

	if choice.TableType == 12 {
		petSvc := h.itemService.GetPetService()
		var pets []*domainpet.Pet
		var contractErr error
		if choice.Quality > 0 {
			pets, contractErr = petSvc.ContractPetsWithQuality(ctx.Context, characterID, []int{choice.ID}, choice.Quality)
		} else {
			pets, contractErr = petSvc.ContractPets(ctx.Context, characterID, []int{choice.ID})
		}
		if contractErr != nil || len(pets) == 0 {
			return -1, nil
		}
		ctx.Connection.SendCallback("onAddPet", pets[0].ToDTO())
	} else {
		newItem, addErr := h.itemService.AddItem(ctx.Context, characterID, choice.ID, domainitem.ItemTypeConsumable, choice.StackNum)
		if addErr != nil {
			return -1, nil
		}
		ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(newItem))
	}

	pending.GetNum--
	pending.Choices = append(pending.Choices[:int(selectedIdx)], pending.Choices[int(selectedIdx)+1:]...)

	if pending.GetNum <= 0 || len(pending.Choices) == 0 {
		h.itemService.ConsumeItemByID(ctx.Context, characterID, pending.ItemID)
		ctx.Connection.SendCallback("onDelCharactorSlot", pending.ItemID, pending.SlotSID)
		h.pendingGiftBoxesMu.Lock()
		delete(h.pendingGiftBoxes, characterID)
		h.pendingGiftBoxesMu.Unlock()
		return 0, nil
	}
	return pending.GetNum, nil
}
