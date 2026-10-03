// Open-sourced by BaoLT

// Bag operation handlers for moving, sorting, dropping, and binding items.
package item

import (
	"context"
	"strconv"

	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) MoveItem(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	var fromSlot, toSlot int
	switch v := args[0].(type) {
	case float64:
		fromSlot = int(v)
	case int:
		fromSlot = v
	default:
		return nil, pkgerrors.ErrInvalidArgs
	}
	switch v := args[1].(type) {
	case float64:
		toSlot = int(v)
	case int:
		toSlot = v
	default:
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	fromSlotType, fromSlotIndex := domainitem.ParseSID(fromSlot)
	toSlotType, toSlotIndex := domainitem.ParseSID(toSlot)

	it, err := h.itemService.GetItemInSlot(ctx.Context, characterID, fromSlotType, fromSlotIndex)
	if err != nil {
		h.logger.Sugar().Warnf("MoveItem: source item not found char_id=%d from_sid=%d type=%d index=%d", characterID, fromSlot, fromSlotType, fromSlotIndex)
		return rtmp.ErrorToResponse(pkgerrors.ErrItemNotFound), nil
	}

	existing, _ := h.itemService.GetItemInSlot(ctx.Context, characterID, toSlotType, toSlotIndex)
	var stackedDest *domainitem.Item
	mergedStackCount := 0
	if existing != nil && it.CanStack(existing) {
		destCopy := *existing
		stackedDest = &destCopy
		mergedStackCount = it.StackCount + existing.StackCount
	}

	err = h.itemService.MoveItem(ctx.Context, characterID, it.ID, toSlotType, toSlotIndex)
	if err != nil {
		if pkgerrors.Is(err, pkgerrors.ErrInvalidTempBagItem) {
			if toSlotIndex < 100 {
				ctx.Connection.SendCallback("onMidNote", "Chỉ cần đặt vật phẩm nguyên liện( Bảo Thạch, Lông Vũ, Nguyên Liệu Chế Tạo, Nguyên Liệu Kỹ Năng Sống).")
			} else {
				ctx.Connection.SendCallback("onMidNote", "Chỉ có thể đặt Ma Tâm.")
			}
			return nil, nil
		}
		h.logger.Error("MoveItem: failed", zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Debug("Item moved success", zap.Int("from_sid", fromSlot), zap.Int("to_sid", toSlot))

	if toSlotType == domainitem.SlotTypeTempBag {
		items, _ := h.itemService.GetAllItems(ctx.Context, characterID)
		normalCount := 0
		mxCount := 0
		for _, i := range items {
			if i.SlotType == domainitem.SlotTypeTempBag {
				if i.SlotIndex < 145 {
					normalCount++
				} else {
					mxCount++
				}
			}
		}

		if toSlotIndex < 145 {
			ctx.Connection.SendCallback("onMoveToTBag", fromSlot, toSlotIndex-30, h.itemDTO(it), normalCount)
		} else {
			ctx.Connection.SendCallback("onMoveMXToTBag", fromSlot, toSlotIndex-145, h.itemDTO(it), mxCount)
		}

		if existing != nil {
			existing.SlotType = fromSlotType
			existing.SlotIndex = fromSlotIndex
			ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(existing))
		}
		return map[string]interface{}{"success": true}, nil
	}

	if stackedDest != nil {
		stackedDest.StackCount = mergedStackCount
		stackedDest.SlotType = toSlotType
		stackedDest.SlotIndex = toSlotIndex
		destDTO := h.itemDTO(stackedDest)
		destDTO["sid"] = float64(toSlot)
		ctx.Connection.SendCallback("onAddCharactorSlot", destDTO)
		ctx.Connection.SendCallback("onStackItemInto", float64(fromSlot), float64(toSlot), float64(it.ID), float64(stackedDest.ID), float64(mergedStackCount))
		return map[string]interface{}{"success": true}, nil
	}

	if existing != nil {
		ctx.Connection.SendCallback("onSwapItem", float64(fromSlot), float64(toSlot))
		return map[string]interface{}{"success": true}, nil
	}

	ctx.Connection.SendCallback("onMoveItem", float64(fromSlot), float64(toSlot), float64(it.ID))

	if toSlotType == domainitem.SlotTypeEquipped || fromSlotType == domainitem.SlotTypeEquipped {
		ctx.Connection.SendCallback("onEquipOn")
	}

	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) MoveItemNum(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 3 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	var fromSlot, toSlot, count int
	switch v := args[0].(type) {
	case float64:
		fromSlot = int(v)
	case int:
		fromSlot = v
	default:
		return nil, pkgerrors.ErrInvalidArgs
	}
	switch v := args[1].(type) {
	case float64:
		toSlot = int(v)
	case int:
		toSlot = v
	default:
		return nil, pkgerrors.ErrInvalidArgs
	}
	switch v := args[2].(type) {
	case float64:
		count = int(v)
	case int:
		count = v
	default:
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	fromSlotType, fromSlotIndex := domainitem.ParseSID(fromSlot)
	toSlotType, toSlotIndex := domainitem.ParseSID(toSlot)

	it, err := h.itemService.GetItemInSlot(ctx.Context, characterID, fromSlotType, fromSlotIndex)
	if err != nil {
		h.logger.Warn("MoveItemNum: source item not found",
			zap.Int64("char_id", characterID),
			zap.Int("from_sid", fromSlot),
			zap.Int("from_type", int(fromSlotType)),
			zap.Int("from_index", fromSlotIndex))
		return rtmp.ErrorToResponse(pkgerrors.ErrItemNotFound), nil
	}

	updatedSource, updatedDest, err := h.itemService.MoveItemPartial(ctx.Context, characterID, it.ID, toSlotType, toSlotIndex, count)
	if err != nil {
		if pkgerrors.Is(err, pkgerrors.ErrInvalidTempBagItem) {
			if toSlotIndex < 100 {
				ctx.Connection.SendCallback("onMidNote", "Chỉ cần đặt vật phẩm nguyên liện( Bảo Thạch, Lông Vũ, Nguyên Liệu Chế Tạo, Nguyên Liệu Kỹ Năng Sống).")
			} else {
				ctx.Connection.SendCallback("onMidNote", "Chỉ có thể đặt Ma Tâm.")
			}
			return nil, nil
		}
		h.logger.Error("MoveItemNum: failed", zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Debug("Item stack moved",
		zap.Int64("character_id", characterID),
		zap.Int("from_slot", fromSlot),
		zap.Int("to_sid", toSlot),
		zap.Int("count", count))

	updatedDest.SlotType = toSlotType
	updatedDest.SlotIndex = toSlotIndex
	destDTO := h.itemDTO(updatedDest)
	destDTO["sid"] = float64(toSlot)
	ctx.Connection.SendCallback("onAddCharactorSlot", destDTO)

	if updatedSource.StackCount <= 0 {
		ctx.Connection.SendCallback("onDelCharactorSlot", float64(it.ID), float64(fromSlot))
	} else {
		ctx.Connection.SendCallback("onMoveItemNum", float64(fromSlot), float64(it.ID), float64(updatedSource.StackCount))
	}

	return map[string]interface{}{"success": true}, nil
}

const (
	pageTypeBag   = 1
	pageTypeBank  = 2
	slotsPerPage  = 30
	maxBagTab     = 9
	maxBankTab    = 5
	questTabIndex = 8
	petTabIndex   = 9
)

func (h *Handler) MoveItemToPage(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("MoveItemToPage called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	if len(args) < 3 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	srcSID, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	pageTypeRaw, ok := parseFlexibleInt64(args[1])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	tabRaw, ok := parseFlexibleInt64(args[2])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	pageType := int(pageTypeRaw)
	tabNumber := int(tabRaw)

	fromSlotType, fromSlotIndex := domainitem.ParseSID(int(srcSID))

	it, err := h.itemService.GetItemInSlot(ctx.Context, charID, fromSlotType, fromSlotIndex)
	if err != nil {
		h.logger.Warn("MoveItemToPage: source item not found",
			zap.Int64("char_id", charID),
			zap.Int64("src_sid", srcSID),
			zap.Int("from_type", int(fromSlotType)),
			zap.Int("from_index", fromSlotIndex))
		return rtmp.ErrorToResponse(pkgerrors.ErrItemNotFound), nil
	}

	toSlotType, lo, hi, midNote, resolveErr := h.resolveMoveItemToPageTarget(ctx.Context, charID, it, pageType, tabNumber)
	if resolveErr != nil {
		return rtmp.ErrorToResponse(resolveErr), nil
	}
	if midNote != "" {
		ctx.Connection.SendCallback("onMidNote", midNote)
		return nil, nil
	}

	targetIndex := h.findFirstEmptyIndexInRange(ctx.Context, charID, toSlotType, lo, hi)
	if targetIndex < 0 {
		ctx.Connection.SendCallback("onMidNote", "Trang đã đầy.")
		return nil, nil
	}

	if it.SlotType == toSlotType && it.SlotIndex == targetIndex {
		return map[string]interface{}{"success": true}, nil
	}

	if err := h.itemService.MoveItem(ctx.Context, charID, it.ID, toSlotType, targetIndex); err != nil {
		h.logger.Error("MoveItemToPage: failed", zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Item moved to page",
		zap.Int64("character_id", charID),
		zap.Int64("src_sid", srcSID),
		zap.Int("page_type", pageType),
		zap.Int("tab_number", tabNumber),
		zap.Int("to_slot_type", int(toSlotType)),
		zap.Int("to_slot_index", targetIndex))

	ctx.Connection.SendCallback("onDelCharactorSlot", float64(it.ID), float64(srcSID))

	it.SlotType = toSlotType
	it.SlotIndex = targetIndex
	ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(it))

	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) resolveMoveItemToPageTarget(ctx context.Context, charID int64, it *domainitem.Item, pageType int, tabNumber int) (domainitem.SlotType, int, int, string, error) {
	switch pageType {
	case pageTypeBag:
		if tabNumber < 1 || tabNumber > maxBagTab {
			return 0, 0, 0, "", pkgerrors.ErrInvalidArgs
		}

		switch {
		case tabNumber >= 1 && tabNumber <= 7:
			if unlocked := h.unlockedBagTabs(ctx, charID); tabNumber > unlocked {
				return 0, 0, 0, "Trang túi chưa mở.", nil
			}
			lo := (tabNumber - 1) * slotsPerPage
			return domainitem.SlotTypeBag, lo, lo + slotsPerPage, "", nil
		case tabNumber == questTabIndex:
			if !h.isQuestItem(it) {
				return 0, 0, 0, "Chỉ vật phẩm nhiệm vụ mới đặt được ở đây.", nil
			}
			return domainitem.SlotTypeQuestBag, 0, domainitem.DefaultQuestBagSlots, "", nil
		case tabNumber == petTabIndex:
			if !h.isPetItem(it) {
				return 0, 0, 0, "Chỉ vật phẩm thú cưng mới đặt được ở đây.", nil
			}
			return domainitem.SlotTypePetItemBag, 0, domainitem.DefaultPetItemBagSlots, "", nil
		}
		return 0, 0, 0, "", pkgerrors.ErrInvalidArgs

	case pageTypeBank:
		if tabNumber < 1 || tabNumber > maxBankTab {
			return 0, 0, 0, "", pkgerrors.ErrInvalidArgs
		}
		if unlocked := h.unlockedBankTabs(ctx, charID); tabNumber > unlocked {
			return 0, 0, 0, "Trang ngân hàng chưa mở.", nil
		}
		lo := (tabNumber - 1) * slotsPerPage
		return domainitem.SlotTypeBank, lo, lo + slotsPerPage, "", nil
	}
	return 0, 0, 0, "", pkgerrors.ErrInvalidArgs
}

func (h *Handler) findFirstEmptyIndexInRange(ctx context.Context, charID int64, slotType domainitem.SlotType, lo, hi int) int {
	for idx := lo; idx < hi; idx++ {
		existing, err := h.itemService.GetItemInSlot(ctx, charID, slotType, idx)
		if err != nil || existing == nil {
			return idx
		}
	}
	return -1
}

func (h *Handler) isQuestItem(it *domainitem.Item) bool {
	if it == nil {
		return false
	}
	if it.ItemType == domainitem.ItemTypeQuest {
		return true
	}
	if it.SlotType == domainitem.SlotTypeQuestBag {
		return true
	}
	if h.itemService != nil {
		if tpl := h.itemService.GetItemTemplate(it.TemplateID); tpl != nil {
			if int(tpl.Type) == 508 || int(tpl.Type) == 509 || int(tpl.Type) == 550 {
				return true
			}
		}
	}
	return false
}

func (h *Handler) isPetItem(it *domainitem.Item) bool {
	if it == nil {
		return false
	}
	if it.SlotType == domainitem.SlotTypePetItemBag {
		return true
	}
	if h.itemService != nil {
		if eq := h.itemService.GetEquipmentTemplate(it.TemplateID); eq != nil {
			if int(eq.Kind) == 9 {
				return true
			}
		}
		if tpl := h.itemService.GetItemTemplate(it.TemplateID); tpl != nil {
			switch int(tpl.Type) {
			case 507, 508, 512, 513, 550:
				return true
			}
		}
	}
	return false
}

func (h *Handler) unlockedBagTabs(ctx context.Context, charID int64) int {
	if h.charService == nil {
		return maxBagTab
	}
	char, err := h.charService.GetCharacter(ctx, charID)
	if err != nil || char == nil {
		return maxBagTab
	}
	char.NormalizeSlotFields()
	unlocked := char.BagSlotNum
	if unlocked <= 0 {
		unlocked = 1
	}
	if unlocked > 7 {
		unlocked = 7
	}
	return unlocked
}

func (h *Handler) unlockedBankTabs(ctx context.Context, charID int64) int {
	if h.charService == nil {
		return maxBankTab
	}
	char, err := h.charService.GetCharacter(ctx, charID)
	if err != nil || char == nil {
		return maxBankTab
	}
	char.NormalizeSlotFields()
	unlocked := char.BankSlotNum
	if unlocked <= 0 {
		unlocked = 1
	}
	if unlocked > maxBankTab {
		unlocked = maxBankTab
	}
	return unlocked
}
