// Open-sourced by BaoLT

// Send Combine purchase handler: validates selection, deducts currency, grants items, and tracks buy counts.
package activity

import (
	"strconv"
	"strings"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const (
	sendCombineMsgLimitReached      = "Reached purchase limit for this package"
	sendCombineMsgNotEnoughCurrency = "Not enough currency"
	sendCombineMsgInventoryIssue    = "Bag is full or reward cannot be added"
	sendCombineMsgInvalidData       = "Invalid send combine configuration"
)

func (h *Handler) BuySendCombine(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "BuySendCombine")
	if err != nil {
		return nil, err
	}
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	if h.itemService == nil || h.characterRepo == nil {
		return nil, pkgerrors.ErrSystemError
	}

	activityID, ok := parseSendCombineActivityID(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidInput
	}

	activity, exists := getSendCombineActivityByID(activityID)
	if !exists {
		return nil, pkgerrors.ErrInvalidInput
	}

	currentBuyNum := h.getSendCombineBuyCount(characterID, activityID)
	if currentBuyNum >= activity.Limit {
		h.sendSendCombineNotice(ctx, "onRedMsg", sendCombineMsgLimitReached)
		return currentBuyNum, nil
	}

	selectedAwards := selectSendCombineAwards(activity, parseSendCombineSelectFlags(args))
	if len(selectedAwards) == 0 {
		h.sendSendCombineNotice(ctx, "onRedMsg", sendCombineMsgInvalidData)
		return currentBuyNum, nil
	}

	totalCost := sendCombineDiscountTotal(selectedAwards)
	character, err := h.characterRepo.FindByID(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	currencyKey, currencyTotal, currencyTotalFloat, err := applySendCombineCost(character, activity.Currency, totalCost)
	if err != nil {
		h.sendSendCombineNotice(ctx, "onRedMsg", sendCombineMsgNotEnoughCurrency)
		return currentBuyNum, nil
	}

	addedItems := make([]interface{}, 0, len(selectedAwards))
	for _, award := range selectedAwards {
		templateID, parseErr := strconv.Atoi(award.ItemID)
		if parseErr != nil || templateID <= 0 {
			h.logger.Warn("BuySendCombine: invalid award template id",
				zap.Uint32("conn_id", ctx.ConnID),
				zap.Int64("character_id", characterID),
				zap.String("activity_id", activityID),
				zap.String("item_id", award.ItemID))
			h.sendSendCombineNotice(ctx, "onRedMsg", sendCombineMsgInvalidData)
			return currentBuyNum, nil
		}

		itemType := h.resolveSendCombineItemType(templateID, award.ItemType)
		isBound := award.Binded == 1
		addedItem, addErr := h.itemService.AddItemWithBind(ctx.Context, characterID, templateID, itemType, award.StackNum, isBound)
		if addErr != nil {
			h.logger.Warn("BuySendCombine: failed to add reward item",
				zap.Uint32("conn_id", ctx.ConnID),
				zap.Int64("character_id", characterID),
				zap.String("activity_id", activityID),
				zap.Int("template_id", templateID),
				zap.Error(addErr))
			h.sendSendCombineNotice(ctx, "onRedMsg", sendCombineMsgInventoryIssue)
			return currentBuyNum, nil
		}

		addedItems = append(addedItems, addedItem)
	}

	if err := h.characterRepo.Update(ctx.Context, character); err != nil {
		return nil, err
	}

	newBuyNum := h.incrementSendCombineBuyCount(characterID, activityID)

	if ctx.Connection != nil {
		for _, added := range addedItems {
			_ = ctx.Connection.SendCallback("onAddItem", added)
			_ = ctx.Connection.SendCallback("onAddCharactorSlot", added)
		}
		_ = ctx.Connection.SendCallback("onAddMoney", float64(characterID), currencyKey, float64(-totalCost), currencyTotalFloat)
		_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{currencyKey: currencyTotal})
		rtmputils.CheckBagCapacityWarning(ctx.Context, ctx.Connection, h.itemService, characterID)
	}

	h.logger.Info("BuySendCombine: purchase completed",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.String("activity_id", activityID),
		zap.Int("buy_num", newBuyNum),
		zap.Int64("total_cost", totalCost),
		zap.String("currency", activity.Currency),
		zap.Int("award_count", len(selectedAwards)))

	return newBuyNum, nil
}

func (h *Handler) resolveSendCombineItemType(templateID int, awardItemType int) domainitem.ItemType {
	if h.gameData != nil {
		if h.gameData.GetEquipment(templateID) != nil {
			return domainitem.ItemTypeEquipment
		}
		if itemTemplate := h.gameData.GetItem(templateID); itemTemplate != nil {
			itemKind := int(itemTemplate.Kind)
			if itemKind == 1 {
				return domainitem.ItemTypeEquipment
			}
			if itemKind == 6 || itemKind == 14 {
				return domainitem.ItemTypeMaterial
			}
		}
	}

	if awardItemType == 19 {
		return domainitem.ItemTypeEquipment
	}

	return domainitem.ItemTypeConsumable
}

func parseSendCombineActivityID(value interface{}) (string, bool) {
	switch raw := value.(type) {
	case string:
		if raw == "" {
			return "", false
		}
		return raw, true
	case float64:
		return strconv.Itoa(int(raw)), true
	case int:
		return strconv.Itoa(raw), true
	case int64:
		return strconv.Itoa(int(raw)), true
	default:
		return "", false
	}
}

func parseSendCombineSelectFlags(args []interface{}) map[int]bool {
	flags := map[int]bool{
		1: false,
		2: false,
		3: false,
	}

	if len(args) > 1 {
		flags[1] = parseBoolArg(args[1])
	}
	if len(args) > 2 {
		flags[2] = parseBoolArg(args[2])
	}
	if len(args) > 3 {
		flags[3] = parseBoolArg(args[3])
	}

	return flags
}

func parseBoolArg(value interface{}) bool {
	switch raw := value.(type) {
	case bool:
		return raw
	case string:
		normalized := strings.ToLower(strings.TrimSpace(raw))
		return normalized == "true" || normalized == "1" || normalized == "yes"
	case float64:
		return raw != 0
	case int:
		return raw != 0
	case int64:
		return raw != 0
	default:
		return false
	}
}

func selectSendCombineAwards(activity sendCombineActivity, flags map[int]bool) []sendCombineAward {
	selected := make([]sendCombineAward, 0, len(activity.Award))
	for index, award := range activity.Award {
		if index == 0 {
			selected = append(selected, award)
			continue
		}

		if strings.EqualFold(award.Checkable, "false") {
			if flags[index] {
				selected = append(selected, award)
			}
			continue
		}

		selected = append(selected, award)
	}

	return selected
}

func sendCombineDiscountTotal(awards []sendCombineAward) int64 {
	var total int64
	for _, award := range awards {
		total += int64(award.Discount)
	}
	return total
}

func applySendCombineCost(characterState *domainchar.Character, currency string, cost int64) (string, interface{}, float64, error) {
	if cost <= 0 {
		return "", nil, 0, pkgerrors.ErrInvalidInput
	}

	switch strings.ToLower(strings.TrimSpace(currency)) {
	case "gold":
		if characterState.Gold < cost {
			return "", nil, 0, pkgerrors.ErrInsufficientFunds
		}
		characterState.Gold -= cost
		return "gold", characterState.Gold, float64(characterState.Gold), nil
	case "point":
		if int64(characterState.Honor) < cost {
			return "", nil, 0, pkgerrors.ErrInsufficientFunds
		}
		characterState.Honor -= int(cost)
		return "honor", characterState.Honor, float64(characterState.Honor), nil
	case "integral":
		if int64(characterState.ShopGold) < cost {
			return "", nil, 0, pkgerrors.ErrInsufficientFunds
		}
		characterState.ShopGold -= int(cost)
		return "shopGold", characterState.ShopGold, float64(characterState.ShopGold), nil
	default:
		return "", nil, 0, pkgerrors.ErrInvalidInput
	}
}

func (h *Handler) getSendCombineBuyCounts(characterID int64) map[string]int {
	h.sendCombineMu.Lock()
	defer h.sendCombineMu.Unlock()

	current := h.sendCombineBuy[characterID]
	if len(current) == 0 {
		return map[string]int{}
	}

	result := make(map[string]int, len(current))
	for activityID, buyNum := range current {
		result[activityID] = buyNum
	}

	return result
}

func (h *Handler) getSendCombineBuyCount(characterID int64, activityID string) int {
	h.sendCombineMu.Lock()
	defer h.sendCombineMu.Unlock()

	perCharacter := h.sendCombineBuy[characterID]
	if perCharacter == nil {
		return 0
	}

	return perCharacter[activityID]
}

func (h *Handler) incrementSendCombineBuyCount(characterID int64, activityID string) int {
	h.sendCombineMu.Lock()
	defer h.sendCombineMu.Unlock()

	perCharacter := h.sendCombineBuy[characterID]
	if perCharacter == nil {
		perCharacter = make(map[string]int)
		h.sendCombineBuy[characterID] = perCharacter
	}

	perCharacter[activityID]++
	return perCharacter[activityID]
}

func (h *Handler) sendSendCombineNotice(ctx *rtmp.RPCContext, callbackName string, message string) {
	if ctx.Connection == nil {
		return
	}
	_ = ctx.Connection.SendCallback(callbackName, message)
}
