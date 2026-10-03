// Open-sourced by BaoLT

package item

import (
	"context"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"
)

type petLifeRestoreService interface {
	GetPetDetail(ctx context.Context, charID int64, petID int64) (*domainpet.Pet, error)
	Save(ctx context.Context, pet *domainpet.Pet) error
}

type petFuncHandler struct {
	itemService *Service
}

func (h *petFuncHandler) CanHandle(tpl *models.ItemTemplateTemplate) bool {
	return int(tpl.Type) == 507
}

func (h *petFuncHandler) Apply(ctx context.Context, uctx *UseContext, char *character.Character, it *domainitem.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error) {
	if uctx == nil || uctx.PetID <= 0 {
		return nil, pkgerrors.ErrCannotUseItem
	}

	var restorer petLifeRestoreService
	if h.itemService != nil && h.itemService.petService != nil {
		if r, ok := h.itemService.petService.(petLifeRestoreService); ok {
			restorer = r
		}
	}
	if restorer == nil {
		return nil, pkgerrors.ErrCannotUseItem
	}

	pet, err := restorer.GetPetDetail(ctx, char.ID, uctx.PetID)
	if err != nil {
		return nil, err
	}

	restoreAmount := int(tpl.N1)
	if restoreAmount <= 0 {
		restoreAmount = domainpet.MaxLife
	}

	pet.Life += restoreAmount
	if pet.Life > domainpet.MaxLife {
		pet.Life = domainpet.MaxLife
	}

	if err := restorer.Save(ctx, pet); err != nil {
		return nil, err
	}

	result := NewEffectResult()
	result.UpdatedPets = []*domainpet.Pet{pet}
	return result, nil
}
