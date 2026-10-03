// Open-sourced by BaoLT

package item

import (
	"context"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"
)

type starStoneEffectHandler struct {
	itemService *Service
}

func (h *starStoneEffectHandler) CanHandle(tpl *models.ItemTemplateTemplate) bool {
	return int(tpl.Type) == 504
}

func (h *starStoneEffectHandler) Apply(ctx context.Context, uctx *UseContext, char *character.Character, it *domainitem.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error) {
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

	targetItem.StarLevel++

	if err := h.itemService.itemRepo.Update(ctx, targetItem); err != nil {
		return nil, err
	}

	result := NewEffectResult()
	result.Message = "Đã nâng sao trang bị thành công."
	return result, nil
}
