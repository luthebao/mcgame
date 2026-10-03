// Open-sourced by BaoLT

// Shop misc handlers for panel and limit updates.
package shop

import (
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	"strconv"

	"go.uber.org/zap"
)

func (h *Handler) ShopClosePanel(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("ShopClosePanel called", zap.Uint32("conn_id", ctx.ConnID))
	return nil, nil
}

func (h *Handler) UnlockMoney(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("UnlockMoney called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	if len(args) < 1 {
		return false, nil
	}

	passHash, ok := args[0].(string)
	if !ok || passHash == "" {
		return false, nil
	}

	if err := rtmputils.VerifySecondaryPassword(ctx.Context, h.accountRepo, ctx.AccountID, passHash); err != nil {
		h.logger.Warn("UnlockMoney: secondary password verification failed", zap.String("account_id", ctx.AccountID), zap.Error(err))
		if notifyErr := rtmputils.NotifySecondaryPasswordFailure(ctx.Connection); notifyErr != nil {
			h.logger.Error("UnlockMoney: failed to notify client about secondary password failure", zap.Error(notifyErr))
		}
		return false, nil
	}

	if err := rtmputils.CacheSecondaryPassword(ctx.Connection, passHash); err != nil {
		h.logger.Error("UnlockMoney: failed to sync client password", zap.Error(err))
	}

	return true, nil
}

func (h *Handler) UpdateLimit(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("UpdateLimit called", zap.Uint32("conn_id", ctx.ConnID))

	charID, _ := strconv.ParseInt(ctx.CharacterID, 10, 64)
	res, err := h.shopService.GetUpdateLimit(ctx.Context, charID)
	if err != nil {
		return nil, err
	}

	return res, nil
}

func (h *Handler) GetShopAwardStr(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("GetShopAwardStr called", zap.Uint32("conn_id", ctx.ConnID))

	charID, _ := strconv.ParseInt(ctx.CharacterID, 10, 64)
	awardStr, err := h.shopService.GetShopAwardStr(ctx.Context, charID)
	if err != nil {
		return nil, err
	}

	return awardStr, nil
}

func (h *Handler) OpenShopDirect(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("OpenShopDirect called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	if len(args) < 1 {
		return nil, nil
	}

	shopID := 0
	switch v := args[0].(type) {
	case float64:
		shopID = int(v)
	case int:
		shopID = v
	case int64:
		shopID = int(v)
	}
	if shopID <= 0 {
		return nil, nil
	}

	_ = ctx.Connection.SendCallback("onOpenShop", shopID)
	return shopID, nil
}
