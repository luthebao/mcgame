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

type targetItemHandler struct {
	itemService *Service
}

func (h *targetItemHandler) CanHandle(tpl *models.ItemTemplateTemplate) bool {
	return int(tpl.Type) == 520
}

func (h *targetItemHandler) Apply(ctx context.Context, uctx *UseContext, char *character.Character, it *domainitem.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error) {
	if uctx == nil || uctx.TargetID <= 0 {
		return nil, pkgerrors.ErrCannotUseItem
	}

	result := NewEffectResult()
	result.Message = fmt.Sprintf("Đã sử dụng %s.", tpl.Name)
	return result, nil
}
