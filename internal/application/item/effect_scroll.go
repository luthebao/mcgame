// Open-sourced by BaoLT

package item

import (
	"context"
	"fmt"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
)

type scrollEffectHandler struct{}

func (h *scrollEffectHandler) CanHandle(tpl *models.ItemTemplateTemplate) bool {
	return int(tpl.Type) == 500
}

func (h *scrollEffectHandler) Apply(ctx context.Context, uctx *UseContext, char *character.Character, it *domainitem.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error) {
	result := NewEffectResult()
	result.Message = fmt.Sprintf("Đã sử dụng %s.", tpl.Name)
	return result, nil
}
