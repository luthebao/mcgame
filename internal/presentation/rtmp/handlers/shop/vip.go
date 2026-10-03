// Open-sourced by BaoLT

package shop

import (
	"errors"
	"fmt"
	appshop "mcgame-server/internal/application/shop"
	"mcgame-server/internal/infrastructure/rtmp"
	"strconv"

	"go.uber.org/zap"
)

func (h *Handler) GetVipShopConfig(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("GetVipShopConfig called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))

	charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		h.logger.Warn("GetVipShopConfig: invalid character id", zap.String("character_id", ctx.CharacterID), zap.Error(err))
		return vipShopConfigFailure(), nil
	}

	result, err := h.shopService.GetVIPShopConfig(ctx.Context, charID)
	if err != nil {
		h.logger.Error("GetVipShopConfig failed", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
		_ = ctx.Connection.SendCallback("onRedMsg", vipConfigErrorMessage(err))
		return vipShopConfigFailure(), nil
	}

	return vipShopConfigPayload(result), nil
}

func (h *Handler) GetVipShopCharConfig(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("GetVipShopCharConfig called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))

	charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		h.logger.Warn("GetVipShopCharConfig: invalid character id", zap.String("character_id", ctx.CharacterID), zap.Error(err))
		return vipShopConfigFailure(), nil
	}

	result, err := h.shopService.RefreshVIPShopConfig(ctx.Context, charID)
	if err != nil {
		h.logger.Warn("GetVipShopCharConfig failed", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
		_ = ctx.Connection.SendCallback("onRedMsg", vipRefreshErrorMessage(err))
		return vipShopConfigFailure(), nil
	}

	if result.SyncGold {
		_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{"gold": result.Gold})
	}

	return vipShopConfigPayload(result), nil
}

func vipConfigErrorMessage(err error) string {
	if errors.Is(err, appshop.ErrVIPShopMembershipRequired) {
		return "Bạn cần là thành viên VIP để vào shop VIP."
	}
	return "Shop VIP hiện không khả dụng."
}

func vipRefreshErrorMessage(err error) string {
	switch {
	case errors.Is(err, appshop.ErrVIPShopMembershipRequired):
		return "Bạn cần là thành viên VIP để làm mới shop VIP."
	case errors.Is(err, appshop.ErrVIPShopRefreshCapReached):
		return "Bạn đã làm mới shop VIP đủ số lần hôm nay."
	case errors.Is(err, appshop.ErrVIPShopInsufficientGold):
		return "Không đủ vàng để làm mới shop VIP."
	default:
		return "Làm mới shop VIP thất bại."
	}
}

func vipBuyErrorMessage(err error) string {
	switch {
	case errors.Is(err, appshop.ErrVIPShopMembershipRequired):
		return "Bạn cần là thành viên VIP để mua vật phẩm shop VIP."
	case errors.Is(err, appshop.ErrVIPShopSlotNotAvailable):
		return "Vật phẩm không còn trong shop VIP."
	case errors.Is(err, appshop.ErrVIPShopSlotAlreadyPurchased):
		return "Vật phẩm này đã được mua."
	case errors.Is(err, appshop.ErrVIPShopInsufficientGold):
		return "Không đủ vàng để mua vật phẩm."
	default:
		return "Mua vật phẩm shop VIP thất bại."
	}
}

func (h *Handler) BuyVipShopItem(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("BuyVipShopItem called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))

	if len(args) < 2 {
		return vipShopBuyFailure(), nil
	}

	charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		h.logger.Warn("BuyVipShopItem: invalid character id", zap.String("character_id", ctx.CharacterID), zap.Error(err))
		return vipShopBuyFailure(), nil
	}

	shopSlotID := parseIntVal(args[0])
	amount := parseIntVal(args[1])
	if amount <= 0 {
		amount = 1
	}

	result, err := h.shopService.BuyVIPShopItem(ctx.Context, charID, shopSlotID, amount)
	if err != nil {
		h.logger.Warn("BuyVipShopItem failed", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
		_ = ctx.Connection.SendCallback("onRedMsg", vipBuyErrorMessage(err))
		return vipShopBuyFailure(), nil
	}

	if result.Purchase != nil {
		currencyName := getCurrencyName(result.Purchase.CurrencyType)
		_ = ctx.Connection.SendCallback("onBlueMsg", fmt.Sprintf("Mua thành công x%d. Tiêu tốn %d %s.", amount, result.Purchase.Cost, currencyName))
		_ = ctx.Connection.SendCallback("onAddItem", result.Purchase.ItemData)
		sendPurchaseSlotUpdates(ctx, result.Purchase)

		currencyKey := getCurrencyKey(result.Purchase.CurrencyType)
		if currencyKey != "" {
			_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{currencyKey: result.Purchase.NewMoney})
		}
	}

	h.checkQuestUpdates(ctx, charID)

	return vipShopBuyPayload(result), nil
}

func vipShopConfigPayload(result *appshop.VIPShopConfigResult) map[string]interface{} {
	if result == nil {
		return vipShopConfigFailure()
	}

	return map[string]interface{}{
		"flag":        result.Flag,
		"vipShop":     result.VIPShop,
		"reflashTime": result.ReflashTime,
		"shopDynamic": result.ShopDynamic,
	}
}

func vipShopBuyPayload(result *appshop.VIPShopPurchaseResult) map[string]interface{} {
	if result == nil {
		return vipShopBuyFailure()
	}

	return map[string]interface{}{
		"flag":        result.Flag,
		"shopDynamic": result.ShopDynamic,
	}
}

func vipShopConfigFailure() map[string]interface{} {
	return map[string]interface{}{
		"flag":        false,
		"vipShop":     []interface{}{},
		"reflashTime": 0,
		"shopDynamic": []interface{}{},
	}
}

func vipShopBuyFailure() map[string]interface{} {
	return map[string]interface{}{
		"flag":        false,
		"shopDynamic": []interface{}{},
	}
}
