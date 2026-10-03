// Open-sourced by BaoLT

// Buff effect handler consumes UseType==2 items and returns a usage message.
package item

import (
	"context"
	"fmt"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
)

type buffEffectHandler struct{}

func (h *buffEffectHandler) CanHandle(tpl *models.ItemTemplateTemplate) bool {
	return int(tpl.UseType) == 2
}

func (h *buffEffectHandler) Apply(ctx context.Context, uctx *UseContext, char *character.Character, it *domainitem.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error) {
	result := NewEffectResult()
	result.Message = fmt.Sprintf("Đã sử dụng %s", tpl.Name)
	return result, nil
}
