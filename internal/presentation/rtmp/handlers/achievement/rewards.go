// Open-sourced by BaoLT

package achievement

import (
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"

	"go.uber.org/zap"
)

const (
	achievementRewardMoney = 1
	achievementRewardGold  = 2
	achievementRewardItem  = 3
	achievementRewardTitle = 4

	currencyKindMoney = "money"
	currencyKindGold  = "gold"
)

func (h *Handler) grantStructuredReward(ctx *rtmp.RPCContext, characterID int64, template *models.AchievementTemplate) {
	if template == nil || template.RewardType == nil {
		return
	}
	rewardType := *template.RewardType
	rewardID := 0
	if template.RewardID != nil {
		rewardID = *template.RewardID
	}
	rewardQty := 0
	if template.RewardQty != nil {
		rewardQty = *template.RewardQty
	}
	switch rewardType {
	case achievementRewardMoney:
		h.grantCurrency(ctx, characterID, currencyKindMoney, int64(rewardQty))
	case achievementRewardGold:
		h.grantCurrency(ctx, characterID, currencyKindGold, int64(rewardQty))
	case achievementRewardItem:
		h.grantItem(ctx, characterID, rewardID, rewardQty)
	case achievementRewardTitle:
		h.grantTitleByID(ctx, characterID, rewardID)
	default:
		h.logger.Warn("Unknown achievement reward type",
			zap.Int64("character_id", characterID),
			zap.Int64("achievement_id", template.ID),
			zap.Int("reward_type", rewardType))
	}
}

func (h *Handler) grantCurrency(ctx *rtmp.RPCContext, characterID int64, kind string, amount int64) {
	if h.charService == nil || amount <= 0 {
		return
	}
	char, err := h.charService.GetCharacter(ctx.Context, characterID)
	if err != nil || char == nil {
		h.logger.Warn("Achievement currency reward: character not found",
			zap.Int64("character_id", characterID), zap.Error(err))
		return
	}
	var balance *int64
	switch kind {
	case currencyKindMoney:
		balance = &char.Money
	case currencyKindGold:
		balance = &char.Gold
	default:
		return
	}
	*balance += amount
	if err := h.charService.Update(ctx.Context, char); err != nil {
		h.logger.Warn("Achievement currency reward: update failed",
			zap.Int64("character_id", characterID), zap.Error(err))
		return
	}
	if ctx.Connection != nil {
		_ = ctx.Connection.SendCallback("onAddMoney", float64(characterID), kind, float64(amount), float64(*balance))
	}
}

func (h *Handler) grantItem(ctx *rtmp.RPCContext, characterID int64, templateID int, qty int) {
	if h.itemService == nil || templateID <= 0 || qty <= 0 {
		return
	}
	added, err := h.itemService.AddItemToSlot(ctx.Context, characterID, templateID, domainitem.ItemTypeQuest, qty, false, domainitem.SlotTypeBag)
	if err != nil {
		h.logger.Warn("Achievement item reward: add failed",
			zap.Int64("character_id", characterID),
			zap.Int("item_id", templateID),
			zap.Int("qty", qty),
			zap.Error(err))
		return
	}
	if added == nil || ctx.Connection == nil {
		return
	}
	itemName := ""
	itemKind := 0
	if h.gameDataManager != nil {
		if tpl := h.gameDataManager.GetItem(templateID); tpl != nil {
			itemName = tpl.Name
			itemKind = int(tpl.Kind)
		}
	}
	_ = ctx.Connection.SendCallback("onAddItem", map[string]interface{}{
		"i":  templateID,
		"q":  qty,
		"s":  "",
		"c":  added.ColorCode,
		"t":  28,
		"n":  itemName,
		"tt": itemKind,
	})
	_ = ctx.Connection.SendCallback("onAddCharactorSlot", added.ToDTO())
}

func (h *Handler) grantTitleByID(ctx *rtmp.RPCContext, characterID int64, titleID int) {
	if h.titleService == nil || titleID <= 0 {
		return
	}
	grantResult, err := h.titleService.GrantTitle(ctx.Context, characterID, titleID)
	if err != nil {
		h.logger.Warn("Achievement title reward: grant failed",
			zap.Int64("character_id", characterID),
			zap.Int("title_id", titleID),
			zap.Error(err))
		return
	}
	if !grantResult.Added || ctx.Connection == nil {
		return
	}
	rtmputils.SendTitleGrantedCallback(ctx.Connection, titleID, grantResult.Titles, grantResult.SpecialTitles, grantResult.IsSpecial)
}
