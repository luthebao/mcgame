// Open-sourced by BaoLT

// Pet stat feature aggregation applies equipped talent and stone state to the pet stat sheet.
package statfeature

import (
	"context"

	domainpet "mcgame-server/internal/domain/pet"
	domainfeature "mcgame-server/internal/domain/statfeature"

	"go.uber.org/zap"
)

func (s *Service) AggregatePetBonuses(ctx context.Context, petID int64) (domainpet.EquipmentStatBonuses, domainpet.SkillStatBonuses) {
	equipmentBonuses := domainpet.NewEquipmentStatBonuses()
	skillBonuses := domainpet.NewSkillStatBonuses()

	if s == nil || s.repo == nil || s.gameDataManager == nil {
		return equipmentBonuses, skillBonuses
	}

	featureStates, err := s.loadPetState(ctx, petID)
	if err != nil {
		if s.logger != nil {
			s.logger.Warn("Failed to aggregate pet stat feature bonuses",
				zap.Int64("pet_id", petID),
				zap.Error(err))
		}
		return equipmentBonuses, skillBonuses
	}

	s.applyPetTalentBonuses(&skillBonuses, featureStates[domainfeature.FeaturePetTalent])
	s.applyPetStoneBonuses(&skillBonuses, featureStates[domainfeature.FeaturePetStone])

	return equipmentBonuses, skillBonuses
}

func (s *Service) applyPetTalentBonuses(bonuses *domainpet.SkillStatBonuses, state map[string]interface{}) {
	if bonuses == nil || len(state) == 0 || s.gameDataManager == nil {
		return
	}
	for _, id := range extractEquippedTemplateIDs(state) {
		template := s.gameDataManager.GetPetTalent(id)
		if template == nil {
			continue
		}
		applyPetSkillBonus(bonuses, int(template.PropType), template.PropVal)
	}
}

func (s *Service) applyPetStoneBonuses(bonuses *domainpet.SkillStatBonuses, state map[string]interface{}) {
	if bonuses == nil || len(state) == 0 || s.gameDataManager == nil {
		return
	}
	for _, id := range extractEquippedTemplateIDs(state) {
		template := s.gameDataManager.GetPetStone(id)
		if template == nil {
			continue
		}
		applyPetSkillBonus(bonuses, int(template.PropType), template.PropNum)
	}
}

func extractEquippedTemplateIDs(state map[string]interface{}) []int {
	if len(state) == 0 {
		return nil
	}

	dedup := make(map[int]struct{})
	addID := func(id int) {
		if id > 0 {
			dedup[id] = struct{}{}
		}
	}

	wanted := map[string]struct{}{
		"id":          {},
		"tid":         {},
		"templateId":  {},
		"template_id": {},
		"stoneId":     {},
		"stone_id":    {},
		"talentId":    {},
		"talent_id":   {},
	}

	for _, key := range []string{"slots", "pan", "equipped", "selected"} {
		for _, id := range collectNamedIDs(state[key], wanted) {
			addID(id)
		}
		for _, id := range collectMapValueIDs(state[key]) {
			addID(id)
		}
	}

	for _, key := range []string{"ids", "stoneIds", "stone_ids", "talentIds", "talent_ids"} {
		for _, id := range collectNamedIDs(map[string]interface{}{key: state[key]}, map[string]struct{}{key: struct{}{}}) {
			addID(id)
		}
	}

	for _, key := range []string{"id", "tid", "templateId", "template_id"} {
		if id, ok := intValue(state[key]); ok {
			addID(id)
		}
	}

	result := make([]int, 0, len(dedup))
	for id := range dedup {
		result = append(result, id)
	}

	return result
}

func applyPetSkillBonus(bonuses *domainpet.SkillStatBonuses, propID int, rawValue float64) {
	if bonuses == nil || propID <= 0 || rawValue == 0 {
		return
	}

	value := normalizeRawPropValue(propID, rawValue)
	switch propID {
	case 1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 25, 34:
		bonuses.AddDirect(propID, value)
	}
}
