// Open-sourced by BaoLT

// Shop purchase, sell, exchange, and money-change handlers.
package shop

import (
	"fmt"
	appshop "mcgame-server/internal/application/shop"
	"mcgame-server/internal/infrastructure/rtmp"
	"strconv"

	"go.uber.org/zap"
)

func (h *Handler) BuyAmountItemClient(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("BuyAmountItemClient called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	if len(args) < 2 {
		return nil, nil
	}

	shopSlotID := parseIntVal(args[0])
	amount := parseIntVal(args[1])
	charID, _ := strconv.ParseInt(ctx.CharacterID, 10, 64)

	res, err := h.shopService.BuyItem(ctx.Context, charID, shopSlotID, amount)
	if err != nil {
		errorMsg := fmt.Sprintf("Mua thất bại: %s", err.Error())
		_ = ctx.Connection.SendCallback("onRedMsg", errorMsg)
		return nil, nil
	}

	currencyName := getCurrencyName(res.CurrencyType)
	msg := fmt.Sprintf("Mua thành công x%d! Mất %d %s.", amount, res.Cost, currencyName)
	_ = ctx.Connection.SendCallback("onBlueMsg", msg)

	currencyKey := getCurrencyKey(res.CurrencyType)
	_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{currencyKey: res.NewMoney})
	_ = ctx.Connection.SendCallback("onAddItem", res.ItemData)
	sendPurchaseSlotUpdates(ctx, res)

	h.checkQuestUpdates(ctx, charID)

	return true, nil
}

func (h *Handler) BuyItemClient(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("BuyItemClient called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	if len(args) < 2 {
		return nil, nil
	}

	shopSlotID := parseIntVal(args[0])
	amount := parseIntVal(args[1])
	charID, _ := strconv.ParseInt(ctx.CharacterID, 10, 64)

	res, err := h.shopService.BuyItem(ctx.Context, charID, shopSlotID, amount)
	if err != nil {
		errorMsg := fmt.Sprintf("Mua thất bại: %s", err.Error())
		_ = ctx.Connection.SendCallback("onRedMsg", errorMsg)
		return nil, nil
	}

	currencyName := getCurrencyName(res.CurrencyType)
	msg := fmt.Sprintf("Mua thành công x%d! Mất %d %s.", amount, res.Cost, currencyName)
	_ = ctx.Connection.SendCallback("onBlueMsg", msg)
	_ = ctx.Connection.SendCallback("onAddItem", res.ItemData)
	sendPurchaseSlotUpdates(ctx, res)

	currencyKey := getCurrencyKey(res.CurrencyType)
	_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{currencyKey: res.NewMoney})

	h.checkQuestUpdates(ctx, charID)

	return nil, nil
}

func (h *Handler) BuySystemItemClient(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("BuySystemItemClient called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	if len(args) < 2 {
		return nil, nil
	}

	shopSlotID := parseIntVal(args[0])
	amount := parseIntVal(args[1])
	charID, _ := strconv.ParseInt(ctx.CharacterID, 10, 64)

	res, err := h.shopService.BuySystemItem(ctx.Context, charID, shopSlotID, amount)
	if err != nil {
		errorMsg := fmt.Sprintf("Mua thất bại: %s", err.Error())
		_ = ctx.Connection.SendCallback("onRedMsg", errorMsg)
		return nil, nil
	}

	currencyName := getCurrencyName(res.CurrencyType)
	msg := fmt.Sprintf("Mua thành công x%d! Mất %d %s.", amount, res.Cost, currencyName)
	_ = ctx.Connection.SendCallback("onBlueMsg", msg)
	_ = ctx.Connection.SendCallback("onAddItem", res.ItemData)
	sendPurchaseSlotUpdates(ctx, res)

	currencyKey := getCurrencyKey(res.CurrencyType)
	_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{currencyKey: res.NewMoney})

	h.checkQuestUpdates(ctx, charID)

	return nil, nil
}

func (h *Handler) SellItem(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("SellItem called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	if len(args) < 1 {
		return nil, nil
	}

	inventoryItemID := int64(parseIntVal(args[0]))
	charID, _ := strconv.ParseInt(ctx.CharacterID, 10, 64)

	res, err := h.shopService.SellItem(ctx.Context, charID, inventoryItemID)
	if err != nil {
		return nil, err
	}

	_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{"money": res.NewMoney})

	return true, nil
}

func (h *Handler) ExchangeItem(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("ExchangeItem called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	if len(args) < 2 {
		return nil, nil
	}

	creditID, _ := args[0].(string)
	amount := parseIntVal(args[1])
	charID, _ := strconv.ParseInt(ctx.CharacterID, 10, 64)

	res, err := h.shopService.ExchangeItem(ctx.Context, charID, creditID, amount)
	if err != nil {
		return nil, err
	}

	_ = ctx.Connection.SendCallback("onAddItem", res.ItemData)
	_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{"cbM": res.NewPoints})

	return 1, nil
}

func (h *Handler) RepairAll(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("RepairAll called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	repairType := 2
	if len(args) > 0 {
		repairType = parseIntVal(args[0])
	}

	charID, _ := strconv.ParseInt(ctx.CharacterID, 10, 64)
	res, err := h.shopService.RepairItems(ctx.Context, charID, repairType)
	if err != nil {
		return nil, err
	}

	_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{"money": res.NewMoney})
	return nil, nil
}

func (h *Handler) ChangeMoneyType(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("ChangeMoneyType called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	if len(args) < 1 {
		return nil, nil
	}

	moneyType := parseIntVal(args[0])
	charID, _ := strconv.ParseInt(ctx.CharacterID, 10, 64)

	res, err := h.shopService.ChangeMoneyType(ctx.Context, charID, moneyType)
	if err != nil {
		return nil, err
	}

	return map[string]interface{}{
		"flag": res.Flag,
		"num":  res.Num,
	}, nil
}

func (h *Handler) BuySystemItemMulti(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("BuySystemItemMulti called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	if len(args) < 1 {
		return nil, nil
	}

	charID, _ := strconv.ParseInt(ctx.CharacterID, 10, 64)
	var purchases []appshop.PurchaseRequest

	addPurchase := func(list *[]appshop.PurchaseRequest, shopSlotIDVal interface{}, amountVal interface{}) {
		shopSlotID := parseIntVal(shopSlotIDVal)
		amount := parseIntVal(amountVal)
		if shopSlotID > 0 && amount > 0 {
			*list = append(*list, appshop.PurchaseRequest{ShopSlotID: shopSlotID, Amount: amount})
		}
	}

	if purchaseMap, ok := args[0].(map[string]interface{}); ok {
		for key, value := range purchaseMap {
			addPurchase(&purchases, key, value)
		}
	} else if list, ok := args[0].([]interface{}); ok {
		for _, item := range list {
			if purchaseMap, ok := item.(map[string]interface{}); ok {
				if value, ok := purchaseMap["shopSlotId"]; ok {
					if amount, ok := purchaseMap["amount"]; ok {
						addPurchase(&purchases, value, amount)
						continue
					}
				}
				if value, ok := purchaseMap["id"]; ok {
					if amount, ok := purchaseMap["count"]; ok {
						addPurchase(&purchases, value, amount)
						continue
					}
				}
				for key, value := range purchaseMap {
					addPurchase(&purchases, key, value)
				}
				continue
			}
			if pair, ok := item.([]interface{}); ok && len(pair) >= 2 {
				addPurchase(&purchases, pair[0], pair[1])
			}
		}
	}

	if len(purchases) == 0 {
		h.logger.Warn("BuySystemItemMulti: no valid purchases found", zap.Uint32("conn_id", ctx.ConnID))
		return map[string]interface{}{"success": false, "items": []interface{}{}}, nil
	}

	res, err := h.shopService.BuySystemItemMulti(ctx.Context, charID, purchases)
	if err != nil {
		h.logger.Error("BuySystemItemMulti failed", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
		return map[string]interface{}{"success": false, "items": []interface{}{}}, nil
	}

	for _, itemData := range res.Items {
		_ = ctx.Connection.SendCallback("onAddItem", itemData)
	}
	for _, itemDTO := range res.AddedItemDTOs {
		_ = ctx.Connection.SendCallback("onAddCharactorSlot", itemDTO)
	}

	currencyKey := getCurrencyKey(res.CurrencyType)
	_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{currencyKey: res.NewMoney})

	h.checkQuestUpdates(ctx, charID)

	return map[string]interface{}{"success": res.Success, "items": res.Items}, nil
}

func parseIntVal(v interface{}) int {
	switch val := v.(type) {
	case float64:
		return int(val)
	case string:
		parsed, _ := strconv.Atoi(val)
		return parsed
	case int:
		return val
	default:
		return 0
	}
}
