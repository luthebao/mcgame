// Open-sourced by BaoLT

// Dress book bonuses project activated TBL_DRESS prop rows into the shared
// character stat bonus pipeline.
package dress

import (
	"context"
	"math"
	"strconv"

	domainchar "mcgame-server/internal/domain/character"

	"go.uber.org/zap"
)

func (s *Service) AggregateCharacterStatBonuses(ctx context.Context, charID int64) domainchar.EquipmentStatBonuses {
	bonuses := domainchar.NewEquipmentStatBonuses()
	if s == nil || s.gameData == nil {
		return bonuses
	}

	_, info, _, err := s.loadChar(ctx, charID)
	if err != nil || info == nil {
		if err != nil && s.logger != nil {
			s.logger.Warn("dress: aggregate failed", zap.Int64("character_id", charID), zap.Error(err))
		}
		return bonuses
	}

	for rawDressID, state := range info.Book {
		if state < 1 {
			continue
		}
		dressID, err := strconv.Atoi(rawDressID)
		if err != nil || dressID <= 0 {
			continue
		}
		tpl := s.gameData.GetDress(dressID)
		if tpl == nil {
			continue
		}
		applyDressPropBonus(&bonuses, int(tpl.Prop1), tpl.PropNum1)
		applyDressPropBonus(&bonuses, int(tpl.Prop2), tpl.PropNum2)
		applyDressPropBonus(&bonuses, int(tpl.Prop3), tpl.PropNum3)
		applyDressPropBonus(&bonuses, int(tpl.Prop4), tpl.PropNum4)
	}

	return bonuses
}

func applyDressPropBonus(bonuses *domainchar.EquipmentStatBonuses, propID int, rawValue float64) {
	if bonuses == nil || propID <= 0 || rawValue == 0 {
		return
	}

	statProp := domainchar.NormalizeCharacterPropType(propID)
	if statProp == 0 {
		return
	}

	value := domainchar.NormalizeRatePropValue(statProp, rawValue)
	if domainchar.UsesFloatBonus(statProp) {
		bonuses.AddFloat(statProp, value)
		return
	}

	bonuses.AddFlat(statProp, int(math.Round(value)))
}
