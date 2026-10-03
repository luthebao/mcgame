// Open-sourced by BaoLT

package item

import (
	"strconv"

	domainpet "mcgame-server/internal/domain/pet"
)

type itemCallbackSender interface {
	SendCallback(method string, args ...interface{}) error
}

func sendUpdatedPetCallbacks(sender itemCallbackSender, pets []*domainpet.Pet) {
	if sender == nil {
		return
	}
	for _, pet := range pets {
		if pet == nil {
			continue
		}
		_ = sender.SendCallback("onUpdatePet", float64(pet.ID), "life", strconv.Itoa(pet.Life))
	}
}
