// Open-sourced by BaoLT

// Activate / claim handlers for the Dress Panel.
package dress

import (
	"context"
	"errors"
	"fmt"

	appdress "mcgame-server/internal/application/dress"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type dressCallbackSender interface {
	SendCallback(method string, args ...interface{}) error
}

func (h *Handler) CheckSameDay(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, nil
	}
	info, err := h.service.CheckSameDay(context.Background(), charID)
	if err != nil {
		return h.handleServiceError("checkSameDay", charID, err)
	}
	return info, nil
}

func (h *Handler) ActiveDress(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, nil
	}
	if len(args) < 1 {
		return nil, nil
	}
	dressID, ok := toInt64(args[0])
	if !ok {
		return nil, nil
	}
	autoBuy := false
	if len(args) >= 2 {
		autoBuy = toBool(args[1])
	}
	info, spend, err := h.service.ActivateDress(context.Background(), charID, dressID, autoBuy)
	if err != nil {
		return h.handleServiceError("activeDress", charID, err)
	}
	sendSpendNotices(ctx.Connection, spend)
	h.refreshCharacterBonuses(ctx, charID)
	return info, nil
}

func (h *Handler) EnsureBuyActive(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, nil
	}
	if len(args) < 1 {
		return nil, nil
	}
	dressID, ok := toInt64(args[0])
	if !ok {
		return nil, nil
	}
	info, spend, err := h.service.EnsureBuyActive(context.Background(), charID, dressID)
	if err != nil {
		return h.handleServiceError("ensureBuyActive", charID, err)
	}
	sendSpendNotices(ctx.Connection, spend)
	h.refreshCharacterBonuses(ctx, charID)
	return info, nil
}

func (h *Handler) RecieveGoods(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, nil
	}
	if len(args) < 1 {
		return nil, nil
	}
	dressID, ok := toInt64(args[0])
	if !ok {
		return nil, nil
	}
	result, err := h.service.ReceiveGoods(context.Background(), charID, dressID)
	if err != nil {
		return h.handleServiceError("recieveGoods", charID, err)
	}
	if h.itemService == nil {
		h.logger.Error("dress: item service unavailable for recieveGoods")
		return nil, nil
	}
	addedItem, err := h.itemService.AddItemWithBindAndColor(context.Background(), charID, result.TemplateID, domainitem.ItemTypeEquipment, 1, true, result.ColorCode)
	if err != nil {
		if ctx != nil && ctx.Connection != nil {
			if errors.Is(err, pkgerrors.ErrInventoryFull) {
				_ = ctx.Connection.SendCallback("onSystemSay", "Không đủ ô trống.")
			} else {
				_ = ctx.Connection.SendCallback("onSystemSay", "Không thể nhận vật phẩm thời trang.")
			}
		}
		h.logger.Error("dress: recieveGoods add item failed", zap.Int64("character_id", charID), zap.Int64("dress_id", dressID), zap.Error(err))
		return nil, nil
	}
	if ctx != nil && ctx.Connection != nil {
		dto := h.itemService.BuildClientItemDTO(addedItem)
		_ = ctx.Connection.SendCallback("onAddCharactorSlot", dto)
		if tpl := h.itemService.GetEquipmentTemplate(result.TemplateID); tpl != nil && tpl.Name != "" {
			_ = ctx.Connection.SendCallback("onSystemSay", fmt.Sprintf("Nhận được %s", tpl.Name))
		}
	}
	return result.DressInfo, nil
}

func (h *Handler) ExchangeRecipe(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, nil
	}
	if len(args) < 1 {
		return nil, nil
	}
	recipeID, ok := toInt64(args[0])
	if !ok {
		return nil, nil
	}
	info, spend, err := h.service.ExchangeRecipe(context.Background(), charID, recipeID)
	if err != nil {
		return h.handleServiceError("exchangeRecipe", charID, err)
	}
	sendSpendNotices(ctx.Connection, spend)
	return info, nil
}

func (h *Handler) refreshCharacterBonuses(ctx *rtmp.RPCContext, charID int64) {
	if h == nil || ctx == nil || ctx.Connection == nil || h.characters == nil || h.itemService == nil {
		return
	}

	char, err := h.characters.GetCharacter(context.Background(), charID)
	if err != nil || char == nil {
		return
	}

	bonuses := h.itemService.AggregateEquipmentStats(context.Background(), charID)
	rtmputils.SendExpAndLevelUpCallbacksWithEquipment(ctx.Connection, char, 0, false, &bonuses)
}

func sendSpendNotices(sender dressCallbackSender, spend appdress.SpendSummary) {
	if sender == nil {
		return
	}
	if len(spend.CurrencyTotals) > 0 {
		upp := make(map[string]interface{}, len(spend.CurrencyTotals))
		for key, amount := range spend.CurrencyTotals {
			upp[key] = amount
		}
		_ = sender.SendCallback("onUPP", upp)
	}
	if spend.Gold > 0 {
		_ = sender.SendCallback("onSystemSay", fmt.Sprintf("Tiêu hao %d vàng.", spend.Gold))
	}
	if spend.GoldBind > 0 {
		_ = sender.SendCallback("onSystemSay", fmt.Sprintf("Tiêu hao %d vàng khóa.", spend.GoldBind))
	}
	if spend.Money > 0 {
		_ = sender.SendCallback("onSystemSay", fmt.Sprintf("Tiêu hao %d bạc.", spend.Money))
	}
	if spend.MoneyBind > 0 {
		_ = sender.SendCallback("onSystemSay", fmt.Sprintf("Tiêu hao %d bạc khóa.", spend.MoneyBind))
	}
	for _, point := range spend.Points {
		if point.Amount <= 0 || point.Label == "" {
			continue
		}
		_ = sender.SendCallback("onSystemSay", fmt.Sprintf("Tiêu hao %d %s.", point.Amount, point.Label))
	}
}
