// Open-sourced by BaoLT

// Box effect handler grants a reward item from template I1 (template ID)
// and I2 (count, defaults to 1).
package item

import (
	"context"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
)

type boxEffectHandler struct {
	itemService *Service
}

func (h *boxEffectHandler) CanHandle(tpl *models.ItemTemplateTemplate) bool {
	return int(tpl.UseType) == 1 && int(tpl.I1) > 0
}

func (h *boxEffectHandler) Apply(ctx context.Context, uctx *UseContext, char *character.Character, it *domainitem.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error) {
	result := NewEffectResult()

	templateID := int(tpl.I1)
	count := int(tpl.I2)
	if count <= 0 {
		count = 1
	}

	granted := &GrantedItemResult{
		TemplateID: templateID,
		Count:      count,
		IsBound:    it.IsBound,
	}

	if h.itemService != nil {
		added, err := h.itemService.AddItem(ctx, char.ID, templateID, domainitem.ItemTypeConsumable, count)
		if err != nil {
			return nil, err
		}
		granted.Item = added
	}

	result.GrantedItems = append(result.GrantedItems, granted)
	return result, nil
}
