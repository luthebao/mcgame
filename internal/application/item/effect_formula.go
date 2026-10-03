// Open-sourced by BaoLT

package item

import (
	"context"
	"fmt"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
)

type formulaHandler struct{}

func (h *formulaHandler) CanHandle(tpl *models.ItemTemplateTemplate) bool {
	return int(tpl.Type) == 516
}

func (h *formulaHandler) Apply(ctx context.Context, uctx *UseContext, char *character.Character, it *domainitem.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error) {
	result := NewEffectResult()
	result.Message = fmt.Sprintf("Đã học công thức từ %s.", tpl.Name)
	return result, nil
}
