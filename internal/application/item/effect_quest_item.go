// Open-sourced by BaoLT

package item

import (
	"context"
	"fmt"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"
)

type questItemEffectHandler struct {
	gameData       *gamedata.Manager
	giftBoxHandler *giftBoxEffectHandler
	awardHandler   *awardEffectHandler
	petBagHandler  *petBagEffectHandler
	service        *Service
}

func (h *questItemEffectHandler) CanHandle(tpl *models.ItemTemplateTemplate) bool {
	t := int(tpl.Type)
	return t == 508 || t == 509 || t == 550
}

func (h *questItemEffectHandler) Apply(ctx context.Context, uctx *UseContext, char *character.Character, it *domainitem.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error) {
	if h.awardHandler != nil && h.awardHandler.CanHandle(tpl) {
		return h.awardHandler.Apply(ctx, uctx, char, it, tpl)
	}

	if h.giftBoxHandler != nil && h.giftBoxHandler.CanHandle(tpl) {
		result, err := h.giftBoxHandler.Apply(ctx, uctx, char, it, tpl)
		if err != nil {
			return nil, err
		}

		if result != nil && result.GiftBox != nil {
			autoPets, autoErr := h.tryAutoContractPets(ctx, char, result.GiftBox)
			if autoErr != nil {
				return nil, autoErr
			}
			if autoPets != nil {
				result.ConsumeItem = true
				result.GiftBox = nil
				result.Pets = autoPets
				if len(autoPets) == 1 {
					result.Message = fmt.Sprintf("Bạn nhận được pet %s.", autoPets[0].Name)
				} else {
					result.Message = fmt.Sprintf("Bạn nhận được %d pet.", len(autoPets))
				}
			}
		}

		return result, nil
	}

	if h.petBagHandler != nil && h.petBagHandler.CanHandle(tpl) {
		return h.petBagHandler.Apply(ctx, uctx, char, it, tpl)
	}

	return nil, pkgerrors.ErrCannotUseItem
}

func (h *questItemEffectHandler) tryAutoContractPets(ctx context.Context, char *character.Character, giftBox *GiftBoxData) ([]*domainpet.Pet, error) {
	petService := h.currentPetService()
	if petService == nil {
		return nil, nil
	}

	allPets := true
	for _, choice := range giftBox.Choices {
		if choice.TableType != 12 {
			allPets = false
			break
		}
	}
	if !allPets || len(giftBox.Choices) == 0 {
		return nil, nil
	}

	getNum := giftBox.GetNum
	if getNum <= 0 {
		getNum = 1
	}
	if getNum > len(giftBox.Choices) {
		getNum = len(giftBox.Choices)
	}
	if getNum != len(giftBox.Choices) {
		return nil, nil
	}

	if checker, ok := petService.(petCapacityChecker); ok {
		hasCapacity, err := checker.HasPetCapacity(ctx, char.ID, getNum)
		if err != nil {
			return nil, err
		}
		if !hasCapacity {
			return nil, pkgerrors.ErrInventoryFull
		}
	}

	pets := make([]*domainpet.Pet, 0, getNum)
	for i := 0; i < getNum; i++ {
		choice := giftBox.Choices[i]
		var contracted []*domainpet.Pet
		var contractErr error
		if choice.Quality > 0 {
			contracted, contractErr = petService.ContractPetsWithQuality(ctx, char.ID, []int{choice.ID}, choice.Quality)
		} else {
			contracted, contractErr = petService.ContractPets(ctx, char.ID, []int{choice.ID})
		}
		if contractErr != nil {
			return nil, contractErr
		}
		if len(contracted) == 0 {
			return nil, nil
		}
		pets = append(pets, contracted...)
	}

	return pets, nil
}

func (h *questItemEffectHandler) currentPetService() PetContractService {
	if h.service == nil {
		return nil
	}
	return h.service.petService
}
