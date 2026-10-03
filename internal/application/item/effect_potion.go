// Open-sourced by BaoLT

// Potion effect handler heals HP or MP based on template I1/I2 fields
// or falls back to the hardcoded potion lookup table.
package item

import (
	"context"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
)

type potionEffectHandler struct{}

func (h *potionEffectHandler) CanHandle(tpl *models.ItemTemplateTemplate) bool {
	if int(tpl.UseType) == 3 {
		return true
	}
	_, _, ok := GetPotionHealAmount(int(tpl.ID))
	return ok
}

func (h *potionEffectHandler) Apply(ctx context.Context, uctx *UseContext, char *character.Character, it *domainitem.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error) {
	result := NewEffectResult()

	hpAmount := int(tpl.I1)
	mpAmount := int(tpl.I2)

	if hpAmount == 0 && mpAmount == 0 {
		if amount, kind, ok := GetPotionHealAmount(int(tpl.ID)); ok {
			switch kind {
			case PotionHealHP:
				hpAmount = amount
			case PotionHealMP:
				mpAmount = amount
			}
		}
	}

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
