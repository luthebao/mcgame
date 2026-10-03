// Open-sourced by BaoLT

package item

import (
	"context"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"
)

type defaultEffectHandler struct{}

func (h *defaultEffectHandler) CanHandle(tpl *models.ItemTemplateTemplate) bool {
	return true
}

func (h *defaultEffectHandler) Apply(ctx context.Context, uctx *UseContext, char *character.Character, it *domainitem.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error) {
	itemType := int(tpl.Type)
	if itemType == 550 || itemType == 508 || itemType == 509 {
		return nil, pkgerrors.ErrCannotUseItem
	}
	return NewEffectResult(), nil
}
