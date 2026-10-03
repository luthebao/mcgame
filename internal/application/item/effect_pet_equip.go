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

type petEquipLevelHandler struct {
	itemService *Service
}

func (h *petEquipLevelHandler) CanHandle(tpl *models.ItemTemplateTemplate) bool {
	return int(tpl.Type) == 512
}

func (h *petEquipLevelHandler) Apply(ctx context.Context, uctx *UseContext, char *character.Character, it *domainitem.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error) {
	if uctx == nil || uctx.PetID <= 0 {
		return nil, pkgerrors.ErrCannotUseItem
	}

	result := NewEffectResult()
	result.Message = fmt.Sprintf("Đã nâng cấp trang bị pet bằng %s.", tpl.Name)
	return result, nil
}

type petEquipColorHandler struct {
	itemService *Service
}

func (h *petEquipColorHandler) CanHandle(tpl *models.ItemTemplateTemplate) bool {
	return int(tpl.Type) == 513
}

func (h *petEquipColorHandler) Apply(ctx context.Context, uctx *UseContext, char *character.Character, it *domainitem.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error) {
	if uctx == nil || uctx.PetID <= 0 {
		return nil, pkgerrors.ErrCannotUseItem
	}

	result := NewEffectResult()
	result.Message = fmt.Sprintf("Đã thay đổi màu trang bị pet bằng %s.", tpl.Name)
	return result, nil
}
