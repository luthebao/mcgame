// Open-sourced by BaoLT

package utils

import (
	"strconv"

	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"
)

type ExpCallbackSender interface {
	SendCallback(method string, args ...interface{}) error
	AddExpSkill(amount int64) int64
}

func SendExpAndLevelUpCallbacks(sender ExpCallbackSender, char *domainchar.Character, expGained int64, leveledUp bool) {
	SendExpAndLevelUpCallbacksWithEquipment(sender, char, expGained, leveledUp, nil)
}

func SendExpAndLevelUpCallbacksWithEquipment(sender ExpCallbackSender, char *domainchar.Character, expGained int64, leveledUp bool, bonuses *domainchar.EquipmentStatBonuses) {
	sender.AddExpSkill(expGained)

	var uppData map[string]interface{}
	if bonuses != nil {
		uppData = domainchar.BuildUPPPayloadWithEquipment(char, *bonuses)
	} else {
		uppData = domainchar.BuildUPPPayload(char)
	}
	uppData["expSkill"] = char.Experience
	for _, key := range []string{
		"bagSlotNum", "bankSlotNum", "petMaxNum",
		"honor", "chival", "pop",
		"expRe", "expBattle",
	} {
		delete(uppData, key)
	}
	_ = sender.SendCallback("onUPP", uppData)

	if leveledUp {
		_ = sender.SendCallback("onPlayerLevelUp", map[string]interface{}{
			"id":         strconv.FormatInt(char.ID, 10),
			"exp":        char.CumulativeExpCapped(),
			"lp":         strconv.Itoa(char.AttrPoints),
			"maxMovePnt": 110,
			"maxAct":     1160,
			"maxVigor":   110,
			"level":      char.Level,
		})
		_ = sender.SendCallback("lvUp", map[string]interface{}{}, 1, nil)
	}
}

var _ ExpCallbackSender = (*rtmp.Connection)(nil)
