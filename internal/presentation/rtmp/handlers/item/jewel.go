// Open-sourced by BaoLT

// Jewel upgrade handlers: combine N jewels for a chance to produce the next-tier jewel.
// Uses nextJewelTid from the item template to determine the upgraded jewel template.
package item

import (
	"math/rand"
	"strconv"

	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) JewelUpdateOne(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 3 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	numRaw, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	num := int(numRaw)

	itemID, ok := parseFlexibleInt64(args[1])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	tempBagFlag := false
	if v, ok := args[2].(bool); ok {
		tempBagFlag = v
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	var it *domainitem.Item
	if tempBagFlag {
		it, err = h.itemService.GetItemInSlot(ctx.Context, characterID, domainitem.SlotTypeTempBag, int(itemID))
	} else {
		it, err = h.itemService.GetItemByID(ctx.Context, characterID, itemID)
	}
	if err != nil {
		h.logger.Warn("JewelUpdateOne: item not found",
			zap.Int64("char_id", characterID),
			zap.Int64("item_id", itemID),
			zap.Bool("temp_bag", tempBagFlag),
			zap.Error(err))
		return map[string]interface{}{"flag": false}, nil
	}

	tpl := h.gameData.GetItem(it.TemplateID)
	if tpl == nil || int(tpl.Type) != 503 {
		h.logger.Warn("JewelUpdateOne: not a jewel item",
			zap.Int64("item_id", it.ID),
			zap.Int("template_id", it.TemplateID))
		return map[string]interface{}{"flag": false}, nil
	}

	nextTid := int(tpl.NextJewelTid)
	if nextTid <= 0 {
		h.logger.Warn("JewelUpdateOne: no next jewel tier",
			zap.Int64("item_id", it.ID),
			zap.Int("template_id", it.TemplateID))
		return map[string]interface{}{"flag": false}, nil
	}

	nextTpl := h.gameData.GetItem(nextTid)
	if nextTpl == nil {
		h.logger.Warn("JewelUpdateOne: next jewel template not found",
			zap.Int("next_tid", nextTid))
		return map[string]interface{}{"flag": false}, nil
	}

	if num < 2 || num > 5 || it.StackCount < num {
		return map[string]interface{}{"flag": false}, nil
	}

	basicRate := 20.0
	rate := float64(num) * basicRate

	remaining := it.StackCount - num
	oldSID := it.CalculateSID()

	if remaining <= 0 {
		_, err = h.itemService.DropItem(ctx.Context, characterID, it.ID)
		if err != nil {
			h.logger.Error("JewelUpdateOne: failed to delete item", zap.Error(err))
			return map[string]interface{}{"flag": false}, nil
		}
	} else {
		err = h.itemService.UpdateStack(ctx.Context, it.ID, remaining)
		if err != nil {
			h.logger.Error("JewelUpdateOne: failed to update stack", zap.Error(err))
			return map[string]interface{}{"flag": false}, nil
		}
		it.StackCount = remaining
	}

	success := rand.Float64()*100 < rate
	finalNum := 0

	if success {
		finalNum = 1
		newItem, err := h.itemService.AddItemWithBindAndColor(ctx.Context, characterID, nextTid, it.ItemType, 1, it.IsBound, 0)
		if err != nil {
			h.logger.Error("JewelUpdateOne: failed to add product", zap.Error(err))
		} else {
			if remaining <= 0 {
				ctx.Connection.SendCallback("onDelCharactorSlot", float64(it.ID), float64(oldSID))
			} else {
				ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(it))
			}
			ctx.Connection.SendCallback("onAddItem", map[string]interface{}{
				"t":  29,
				"i":  nextTid,
				"n":  nextTpl.Name,
				"c":  int(nextTpl.Color),
				"q":  int(nextTpl.Color),
				"tt": int(nextTpl.Kind),
				"s":  "",
			})
			ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(newItem))
		}
	} else {
		if remaining <= 0 {
			ctx.Connection.SendCallback("onDelCharactorSlot", float64(it.ID), float64(oldSID))
		} else {
			ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(it))
		}
	}

	slotID := it.ID
	if tempBagFlag {
		slotID = itemID
	}

	h.logger.Info("JewelUpdateOne completed",
		zap.Int64("char_id", characterID),
		zap.Int64("item_id", it.ID),
		zap.Int("num", num),
		zap.Bool("success", success),
		zap.Int("remaining", remaining),
		zap.Int("next_tid", nextTid))

	if success {
		h.checkBagCapacityWarning(ctx, characterID)
	}

	return map[string]interface{}{
		"slotId":   float64(slotID),
		"num":      float64(remaining),
		"flag":     success,
		"finalNum": float64(finalNum),
	}, nil
}

func (h *Handler) JewelUpdateAll(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 3 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	numRaw, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	num := int(numRaw)

	itemID, ok := parseFlexibleInt64(args[1])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	tempBagFlag := false
	if v, ok := args[2].(bool); ok {
		tempBagFlag = v
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	var it *domainitem.Item
	if tempBagFlag {
		it, err = h.itemService.GetItemInSlot(ctx.Context, characterID, domainitem.SlotTypeTempBag, int(itemID))
	} else {
		it, err = h.itemService.GetItemByID(ctx.Context, characterID, itemID)
	}
	if err != nil {
		return map[string]interface{}{"flag": false}, nil
	}

	tpl := h.gameData.GetItem(it.TemplateID)
	if tpl == nil || int(tpl.Type) != 503 {
		return map[string]interface{}{"flag": false}, nil
	}

	nextTid := int(tpl.NextJewelTid)
	if nextTid <= 0 {
		return map[string]interface{}{"flag": false}, nil
	}

	nextTpl := h.gameData.GetItem(nextTid)
	if nextTpl == nil {
		return map[string]interface{}{"flag": false}, nil
	}

	if num < 2 || num > 5 || it.StackCount < num {
		return map[string]interface{}{"flag": false}, nil
	}

	basicRate := 20.0
	rate := float64(num) * basicRate

	oldSID := it.CalculateSID()
	totalProduced := 0

	for it.StackCount >= num {
		it.StackCount -= num
		if rand.Float64()*100 < rate {
			totalProduced++
		}
	}

	remaining := it.StackCount

	if remaining <= 0 {
		_, err = h.itemService.DropItem(ctx.Context, characterID, it.ID)
		if err != nil {
			h.logger.Error("JewelUpdateAll: failed to delete item", zap.Error(err))
			return map[string]interface{}{"flag": false}, nil
		}
	} else {
		err = h.itemService.UpdateStack(ctx.Context, it.ID, remaining)
		if err != nil {
			h.logger.Error("JewelUpdateAll: failed to update stack", zap.Error(err))
			return map[string]interface{}{"flag": false}, nil
		}
	}

	if totalProduced > 0 {
		newItem, err := h.itemService.AddItemWithBindAndColor(ctx.Context, characterID, nextTid, it.ItemType, totalProduced, it.IsBound, 0)
		if err != nil {
			h.logger.Error("JewelUpdateAll: failed to add products", zap.Error(err))
		} else {
			if remaining <= 0 {
				ctx.Connection.SendCallback("onDelCharactorSlot", float64(it.ID), float64(oldSID))
			} else {
				ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(it))
			}
			ctx.Connection.SendCallback("onAddItem", map[string]interface{}{
				"t":  29,
				"i":  nextTid,
				"n":  nextTpl.Name,
				"c":  int(nextTpl.Color),
				"q":  int(nextTpl.Color),
				"tt": int(nextTpl.Kind),
				"s":  "",
			})
			ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(newItem))
		}
	} else {
		if remaining <= 0 {
			ctx.Connection.SendCallback("onDelCharactorSlot", float64(it.ID), float64(oldSID))
		} else {
			ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(it))
		}
	}

	slotID := it.ID
	if tempBagFlag {
		slotID = itemID
	}

	h.logger.Info("JewelUpdateAll completed",
		zap.Int64("char_id", characterID),
		zap.Int64("item_id", it.ID),
		zap.Int("num_per_mix", num),
		zap.Int("total_produced", totalProduced),
		zap.Int("remaining", remaining),
		zap.Int("next_tid", nextTid))

	if totalProduced > 0 {
		h.checkBagCapacityWarning(ctx, characterID)
	}

	return map[string]interface{}{
		"slotId":   float64(slotID),
		"num":      float64(remaining),
		"flag":     totalProduced > 0,
		"finalNum": float64(totalProduced),
	}, nil
}
