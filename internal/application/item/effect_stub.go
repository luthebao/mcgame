// Open-sourced by BaoLT

package item

import (
	"context"
	"fmt"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
)

type stubEffectHandler struct {
	typeName string
}

func (h *stubEffectHandler) CanHandle(tpl *models.ItemTemplateTemplate) bool {
	return true
}

func (h *stubEffectHandler) Apply(ctx context.Context, uctx *UseContext, char *character.Character, it *domainitem.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error) {
	return nil, fmt.Errorf("loại vật phẩm %s chưa được hỗ trợ", h.typeName)
}
