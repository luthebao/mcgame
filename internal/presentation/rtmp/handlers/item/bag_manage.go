// Open-sourced by BaoLT

// Bag management handlers for dropping, sorting, and binding items.
package item

import (
	"strconv"

	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) DropItem(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	itemID, ok := parseFlexibleInt64(args[0])
	if !ok {
		h.logger.Warn("DropItem: invalid itemID type", zap.Any("type", args[0]))
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	var passHash string
	if len(args) >= 2 {
		var ok bool
		passHash, ok = args[1].(string)
		if !ok || passHash == "" {
			h.logger.Warn("DropItem: missing secondary password", zap.Int64("character_id", characterID))
			return rtmp.ErrorToResponse(pkgerrors.ErrUnauthorized), nil
		}

		if err := rtmputils.VerifySecondaryPassword(ctx.Context, h.accountRepo, ctx.AccountID, passHash); err != nil {
			h.logger.Warn("DropItem: secondary password verification failed", zap.Int64("character_id", characterID), zap.Error(err))
			if notifyErr := rtmputils.NotifySecondaryPasswordFailure(ctx.Connection); notifyErr != nil {
				h.logger.Error("DropItem: failed to notify client about secondary password failure", zap.Error(notifyErr))
			}
			return rtmp.ErrorToResponse(pkgerrors.ErrUnauthorized), nil
		}
	}

	it, err := h.itemService.GetItemByID(ctx.Context, characterID, itemID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}
	fromSid := it.CalculateSID()

	_, err = h.itemService.DropItem(ctx.Context, characterID, itemID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Item dropped",
		zap.Int64("character_id", characterID),
		zap.Int("from_sid", fromSid),
		zap.Int64("item_id", itemID))

	if passHash != "" {
		if err := rtmputils.CacheSecondaryPassword(ctx.Connection, passHash); err != nil {
			h.logger.Error("DropItem: failed to sync client password", zap.Error(err))
		}
	}

	ctx.Connection.SendCallback("onDelCharactorSlot", float64(itemID), fromSid)

	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) BagSort(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	itemsBefore, err := h.itemService.GetAllItems(ctx.Context, characterID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	oldSIDs := make(map[int64]int)
	for _, it := range itemsBefore {
		if it.SlotType == domainitem.SlotTypeBag {
			oldSIDs[it.ID] = it.CalculateSID()
		}
	}

	itemsAfter, err := h.itemService.SortBag(ctx.Context, characterID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	newIDs := make(map[int64]struct{}, len(itemsAfter))
	var changes []map[string]interface{}
	for _, it := range itemsAfter {
		newIDs[it.ID] = struct{}{}
		if oldSID, ok := oldSIDs[it.ID]; ok {
			newSID := it.CalculateSID()
			changes = append(changes, map[string]interface{}{
				"oldId":    oldSID,
				"newId":    newSID,
				"stackNum": it.StackCount,
			})
		}
	}

	for itemID, oldSID := range oldSIDs {
		if _, ok := newIDs[itemID]; ok {
			continue
		}
		ctx.Connection.SendCallback("onDelCharactorSlot", float64(itemID), oldSID)
	}

	ctx.Connection.SendCallback("onItemSort", changes)

	h.logger.Info("Bag sorted",
		zap.Int64("character_id", characterID),
		zap.Int("total_items", len(changes)))

	return map[string]interface{}{
		"success": true,
	}, nil
}

func (h *Handler) BindItem(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	itemID, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	it, err := h.itemService.GetItemByID(ctx.Context, characterID, itemID)
	if err != nil {
		h.logger.Error("BindItem: item not found", zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}

	if err := h.itemService.BindItem(ctx.Context, characterID, itemID); err != nil {
		h.logger.Error("BindItem: failed", zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}

	it, err = h.itemService.GetItemByID(ctx.Context, characterID, itemID)
	if err != nil {
		h.logger.Error("BindItem: failed to reload item", zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}

	dto := h.itemDTO(it)
	if it.ItemType == domainitem.ItemTypeEquipment {
		ctx.Connection.SendCallback("onChangeEquiptInst", dto)
	} else {
		ctx.Connection.SendCallback("onCreateItemInstance", dto)
	}
	ctx.Connection.SendCallback("onAddCharactorSlot", dto)

	return map[string]interface{}{"success": true}, nil
}
