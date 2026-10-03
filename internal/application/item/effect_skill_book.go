// Open-sourced by BaoLT

package item

import (
	"context"
	"fmt"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
)

type skillBookEffectHandler struct{}

func (h *skillBookEffectHandler) CanHandle(tpl *models.ItemTemplateTemplate) bool {
	return int(tpl.Type) == 505
}

func (h *skillBookEffectHandler) Apply(ctx context.Context, uctx *UseContext, char *character.Character, it *domainitem.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error) {
	result := NewEffectResult()

	if int(tpl.I1) > 0 {
		result.Message = fmt.Sprintf("Đã sử dụng %s.", tpl.Name)
		return result, nil
	}

	result.Message = fmt.Sprintf("Đã học kỹ năng từ %s.", tpl.Name)
	return result, nil
}
