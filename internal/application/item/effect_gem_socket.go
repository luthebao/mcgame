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

type gemSocketHandler struct {
	itemService *Service
}

func (h *gemSocketHandler) CanHandle(tpl *models.ItemTemplateTemplate) bool {
	return int(tpl.Type) == 503
}

func (h *gemSocketHandler) Apply(ctx context.Context, uctx *UseContext, char *character.Character, it *domainitem.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error) {
	if uctx == nil || uctx.TargetID <= 0 {
		return nil, pkgerrors.ErrCannotUseItem
	}

	targetItem, err := h.itemService.GetItemByID(ctx, char.ID, uctx.TargetID)
	if err != nil {
		return nil, pkgerrors.ErrItemNotFound
	}

	if !targetItem.IsEquipment() {
		return nil, pkgerrors.ErrCannotUseItem
	}

	result := NewEffectResult()
	result.Message = fmt.Sprintf("Đã gắn %s.", tpl.Name)
	return result, nil
}
