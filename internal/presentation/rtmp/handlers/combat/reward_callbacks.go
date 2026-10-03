// Open-sourced by BaoLT

package combat

import (
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata"
)

type battleRewardCallbackSender interface {
	SendCallback(method string, args ...interface{}) error
}

func sendBattleRewardItemCallbacks(sender battleRewardCallbackSender, rewardDTO map[string]interface{}, gameData *gamedata.Manager) {
	if sender == nil || rewardDTO == nil {
		return
	}

	if items, ok := rewardDTO["items"].([]map[string]interface{}); ok {
		for _, itemReward := range items {
			if notice := buildBattleRewardItemNotice(itemReward, gameData); len(notice) > 0 {
				_ = sender.SendCallback("onAddItem", notice)
			}
			if itemData, ok := itemReward["item"].(map[string]interface{}); ok {
				_ = sender.SendCallback("onAddCharactorSlot", itemData)
			}
		}
	}

	if currencies, ok := rewardDTO["currencies"].([]map[string]interface{}); ok {
		for _, currencyReward := range currencies {
			sendBattleRewardCurrencyCallback(sender, currencyReward)
		}
	}
}

func sendBattleRewardCurrencyCallback(sender battleRewardCallbackSender, currencyReward map[string]interface{}) {
	clientKey, _ := currencyReward["clientKey"].(string)
	if clientKey == "" {
		return
	}
	characterID := battleRewardInt64(currencyReward["characterId"])
	delta := battleRewardInt64(currencyReward["delta"])
	total := battleRewardInt64(currencyReward["total"])
	if delta <= 0 {
		return
	}
	isExp, _ := currencyReward["isExp"].(bool)
	if isExp {
		_ = sender.SendCallback("onAddExp", float64(characterID), float64(delta), float64(total))
		return
	}
	_ = sender.SendCallback(
		"onAddMoney",
		float64(characterID),
		clientKey,
		float64(delta),
		float64(total),
	)
}

func battleRewardInt64(value interface{}) int64 {
	switch typed := value.(type) {
	case int:
		return int64(typed)
	case int32:
		return int64(typed)
	case int64:
		return typed
	case float32:
		return int64(typed)
	case float64:
		return int64(typed)
	}
	return 0
}

func buildBattleRewardItemNotice(itemReward map[string]interface{}, gameData *gamedata.Manager) map[string]interface{} {
	if gameData == nil || itemReward == nil {
		return nil
	}

	templateID := battleRewardInt(itemReward["templateId"])
	tableType := battleRewardInt(itemReward["type"])
	count := battleRewardInt(itemReward["count"])
	if templateID <= 0 || tableType <= 0 {
		return nil
	}
	if count <= 0 {
		count = 1
	}

	itemData, _ := itemReward["item"].(map[string]interface{})

	if tableType == 19 {
		equipTpl := gameData.GetEquipment(templateID)
		if equipTpl == nil {
			return nil
		}

		colorCode := battleRewardInt(itemData["colorCode"])
		if colorCode <= 0 {
			colorCode = domainitem.EquipmentColorCodeFromDisplayColor(battleRewardInt(itemData["color"]))
		}

		return map[string]interface{}{
			"i":  templateID,
			"q":  count,
			"s":  "",
			"c":  domainitem.PopupNoticeColor(domainitem.ItemTypeEquipment, colorCode),
			"t":  tableType,
			"n":  domainitem.FormatEquipmentDisplayNameWithCurrent(equipTpl.Name, itemData["preNameType"], colorCode),
			"tt": int(equipTpl.Kind),
		}
	}

	itemTpl := gameData.GetItem(templateID)
	if itemTpl == nil {
		return nil
	}

	noticeColor := battleRewardInt(itemData["color"])
	if noticeColor == 0 {
		noticeColor = domainitem.PopupNoticeColor(domainitem.ItemTypeConsumable, battleRewardInt(itemData["colorCode"]))
	}

	return map[string]interface{}{
		"i":  templateID,
		"q":  count,
		"s":  "",
		"c":  noticeColor,
		"t":  tableType,
		"n":  itemTpl.Name,
		"tt": int(itemTpl.Kind),
	}
}

func battleRewardInt(value interface{}) int {
	switch typed := value.(type) {
	case int:
		return typed
	case int8:
		return int(typed)
	case int16:
		return int(typed)
	case int32:
		return int(typed)
	case int64:
		return int(typed)
	case float32:
		return int(typed)
	case float64:
		return int(typed)
	default:
		return 0
	}
}
