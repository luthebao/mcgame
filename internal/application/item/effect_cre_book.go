// Open-sourced by BaoLT

package item

import (
	"context"
	"fmt"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"
)

type creBookEffectHandler struct {
	itemService *Service
}

func (h *creBookEffectHandler) CanHandle(tpl *models.ItemTemplateTemplate) bool {
	return int(tpl.Type) == 506
}

func (h *creBookEffectHandler) Apply(ctx context.Context, uctx *UseContext, char *character.Character, it *domainitem.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error) {
	creatureID := int(tpl.I1)
	if creatureID <= 0 {
		return nil, pkgerrors.ErrCannotUseItem
	}

	result := NewEffectResult()

	if h.itemService != nil && h.itemService.petService != nil {
		pets, err := h.itemService.petService.ContractPets(ctx, char.ID, []int{creatureID})
		if err != nil {
			return nil, err
		}
		result.Pets = append(result.Pets, pets...)
		result.Message = fmt.Sprintf("Đã triệu hồi pet từ %s.", tpl.Name)
	}

	return result, nil
}
