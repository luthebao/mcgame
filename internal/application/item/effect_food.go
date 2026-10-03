// Open-sourced by BaoLT

package item

import (
	"context"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
)

type foodEffectHandler struct{}

func (h *foodEffectHandler) CanHandle(tpl *models.ItemTemplateTemplate) bool {
	return int(tpl.Type) == 502
}

func (h *foodEffectHandler) Apply(ctx context.Context, uctx *UseContext, char *character.Character, it *domainitem.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error) {
	result := NewEffectResult()

	hpAmount := int(tpl.I1)
	mpAmount := int(tpl.I2)

	if hpAmount > 0 {
		maxHP := char.MaxHP
		if uctx != nil && uctx.EffectiveMaxHP > maxHP {
			maxHP = uctx.EffectiveMaxHP
		}
		missing := maxHP - char.CurrentHP
		if hpAmount > missing {
			hpAmount = missing
		}
		if hpAmount > 0 {
			char.CurrentHP += hpAmount
			result.HPHealed = hpAmount
		}
	}

	if mpAmount > 0 {
		maxMP := char.MaxMP
		if uctx != nil && uctx.EffectiveMaxMP > maxMP {
			maxMP = uctx.EffectiveMaxMP
		}
		missing := maxMP - char.CurrentMP
		if mpAmount > missing {
			mpAmount = missing
		}
		if mpAmount > 0 {
			char.CurrentMP += mpAmount
			result.MPRestored = mpAmount
		}
	}

	return result, nil
}
