// Open-sourced by BaoLT

// Special item RPC handlers: rename card, sex change card, good card, wedding/red bags, intimacy items.
package item

import (
	"strconv"
	"strings"
	"unicode/utf8"

	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const (
	renameCardTemplateID    = 2126
	sexChangeCardTemplateID = 2844
	goodCardTemplateID      = 122
)

func (h *Handler) ChangeNameByCard(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	newName, ok := args[0].(string)
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	newName = strings.TrimSpace(newName)

	nameLen := utf8.RuneCountInString(newName)
	if nameLen < 2 || nameLen > 12 {
		ctx.Connection.SendCallback("onSystemSay", "Tên phải từ 2 đến 12 ký tự.")
		return nil, nil
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	consumed, err := h.itemService.ConsumeItemsByTemplateID(ctx.Context, characterID, renameCardTemplateID, 1)
	if err != nil {
		h.logger.Error("ChangeNameByCard: failed to consume card", zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}
	if !consumed {
		ctx.Connection.SendCallback("onSystemSay", "Bạn không có Thẻ Đổi Tên.")
		return nil, nil
	}

	char.Name = newName
	if err := h.charService.Update(ctx.Context, char); err != nil {
		h.logger.Error("ChangeNameByCard: failed to update character", zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}

	ctx.Connection.SendCallback("onUPP", map[string]interface{}{
		"name": newName,
	})

	h.logger.Info("ChangeNameByCard: name changed",
		zap.Int64("character_id", characterID),
		zap.String("new_name", newName))

	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) ChangeCharSex(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	consumed, err := h.itemService.ConsumeItemsByTemplateID(ctx.Context, characterID, sexChangeCardTemplateID, 1)
	if err != nil {
		h.logger.Error("ChangeCharSex: failed to consume card", zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}
	if !consumed {
		ctx.Connection.SendCallback("onSystemSay", "Bạn không có Thẻ Đổi Giới Tính.")
		return nil, nil
	}

	if char.Gender == 0 {
		char.Gender = 1
	} else {
		char.Gender = 0
	}

	if err := h.charService.Update(ctx.Context, char); err != nil {
		h.logger.Error("ChangeCharSex: failed to update character", zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}

	ctx.Connection.SendCallback("onUPP", map[string]interface{}{
		"gender": char.Gender,
	})

	h.logger.Info("ChangeCharSex: gender changed",
		zap.Int64("character_id", characterID),
		zap.Int("new_gender", char.Gender))

	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) UseGoodCard(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	consumed, err := h.itemService.ConsumeItemsByTemplateID(ctx.Context, characterID, goodCardTemplateID, 1)
	if err != nil {
		h.logger.Error("UseGoodCard: failed to consume card", zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}
	if !consumed {
		ctx.Connection.SendCallback("onSystemSay", "Bạn không có Thẻ May Mắn.")
		return nil, nil
	}

	ctx.Connection.SendCallback("onSystemSay", "Đã sử dụng Thẻ May Mắn.")

	h.logger.Info("UseGoodCard: card used",
		zap.Int64("character_id", characterID))

	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) UseWeddingBag(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	slotID, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	it, err := h.itemService.GetItemByID(ctx.Context, characterID, slotID)
	if err != nil {
		return rtmp.ErrorToResponse(pkgerrors.ErrItemNotFound), nil
	}

	oldSID := it.CalculateSID()
	usedItem, result, err := h.itemService.UseItem(ctx.Context, char, it.ID, nil)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	if err := h.charService.Update(ctx.Context, char); err != nil {
		h.logger.Error("UseWeddingBag: failed to update character", zap.Error(err))
	}

	if usedItem.StackCount <= 0 {
		ctx.Connection.SendCallback("onDelCharactorSlot", float64(usedItem.ID), float64(oldSID))
	} else {
		ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(usedItem))
	}

	h.sendEffectCallbacks(ctx, result, char)

	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) UseRedBag(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	slotID, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	it, err := h.itemService.GetItemByID(ctx.Context, characterID, slotID)
	if err != nil {
		return rtmp.ErrorToResponse(pkgerrors.ErrItemNotFound), nil
	}

	oldSID := it.CalculateSID()
	usedItem, result, err := h.itemService.UseItem(ctx.Context, char, it.ID, nil)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	if err := h.charService.Update(ctx.Context, char); err != nil {
		h.logger.Error("UseRedBag: failed to update character", zap.Error(err))
	}

	if usedItem.StackCount <= 0 {
		ctx.Connection.SendCallback("onDelCharactorSlot", float64(usedItem.ID), float64(oldSID))
	} else {
		ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(usedItem))
	}

	h.sendEffectCallbacks(ctx, result, char)

	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) UseIntimacyItem(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 3 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	_, ok := args[0].(string)
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	quantityRaw, ok := parseFlexibleInt64(args[1])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	quantity := int(quantityRaw)

	itemIDRaw, ok := parseFlexibleInt64(args[2])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	itemID := int(itemIDRaw)

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	consumed, err := h.itemService.ConsumeItemsByTemplateID(ctx.Context, characterID, itemID, quantity)
	if err != nil {
		h.logger.Error("UseIntimacyItem: failed to consume items", zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}
	if !consumed {
		ctx.Connection.SendCallback("onSystemSay", "Không đủ vật phẩm.")
		return nil, nil
	}

	ctx.Connection.SendCallback("onSystemSay", "Đã sử dụng vật phẩm thân mật.")

	h.logger.Info("UseIntimacyItem: items consumed",
		zap.Int64("character_id", characterID),
		zap.Int("template_id", itemID),
		zap.Int("quantity", quantity))

	return map[string]interface{}{"success": true}, nil
}
