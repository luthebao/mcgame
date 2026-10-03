// Open-sourced by BaoLT

package quest

import (
	"strconv"

	domainpet "mcgame-server/internal/domain/pet"
)

type questPetRewardSender interface {
	SendCallback(method string, args ...interface{}) error
}

func sendQuestPetRewardCallbacks(sender questPetRewardSender, pet *domainpet.Pet, leveledUp bool) {
	if sender == nil || pet == nil {
		return
	}

	_ = sender.SendCallback("onUpdatePet", float64(pet.ID), "exp", strconv.FormatInt(pet.ClientExperience(), 10))
	if leveledUp {
		_ = sender.SendCallback("onUpdatePet", float64(pet.ID), "level", strconv.Itoa(pet.Level))
	}

	petDTO := pet.ToDTO()
	data, ok := petDTO["data"].(map[string]interface{})
	if !ok {
		return
	}
	prop, ok := data["property"]
	if !ok {
		return
	}

	_ = sender.SendCallback("onRefreshPetProp", map[string]interface{}{
		"id": pet.ID,
		"s":  prop,
	})
}
