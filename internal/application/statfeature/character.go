// Open-sourced by BaoLT

// Character stat feature aggregation folds persisted progression systems into the existing character bonus pipeline.
package statfeature

import (
	"context"
	"fmt"
	"math"
	"time"

	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"
	domainwsp "mcgame-server/internal/domain/warsprite"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

func (s *Service) AggregateCharacterStatBonuses(ctx context.Context, charID int64) domainchar.EquipmentStatBonuses {
	bonuses := domainchar.NewEquipmentStatBonuses()
	if s == nil || s.repo == nil || s.gameDataManager == nil {
		return bonuses
	}

	progression, featureStates, activeMount, err := s.loadCharacterState(ctx, charID)
	if err != nil {
		if s.logger != nil {
			s.logger.Warn("Failed to aggregate stat feature bonuses",
				zap.Int64("character_id", charID),
				zap.Error(err))
		}
		return bonuses
	}

	if progression != nil {
		s.applyAwakeningBonus(&bonuses, progression.AwakenLevel)
		s.applySoulBonus(&bonuses, progression.SoulLevel)
	}

	s.applyMountBonus(&bonuses, activeMount)
	s.applyMagicArrayBonus(&bonuses, featureStates[domainfeature.FeatureMagicArray])
	applyPraBuffBonus(&bonuses, featureStates[domainfeature.FeaturePraBuff])
	s.applyStarsBonus(&bonuses, featureStates[domainfeature.FeatureStars])
	s.applyExplorerMedalBonus(&bonuses, featureStates[domainfeature.FeatureExplorerMedal])
	s.applyWarSpriteBonus(&bonuses, featureStates[domainfeature.FeatureWarSprite])
	s.applyMedalBonus(&bonuses, featureStates[domainfeature.FeatureMedal])
	s.applyPRSBonus(&bonuses, featureStates[domainfeature.FeaturePRS])
	s.applyHeiyaoshiBonus(&bonuses, featureStates[domainfeature.FeatureHeiyaoshi])
	s.applyPMDailyBuffBonus(&bonuses, featureStates[domainfeature.FeaturePMDailyBuff])
	applyMagicCrystalBonus(&bonuses, featureStates[domainfeature.FeatureMagicCrystal])

	return bonuses
}

func (s *Service) applyAwakeningBonus(bonuses *domainchar.EquipmentStatBonuses, awakenLevel int) {
	if bonuses == nil || awakenLevel <= 0 || s.gameDataManager == nil {
		return
	}
	template := s.gameDataManager.GetAwakening(awakenLevel)
	if template == nil {
		return
	}
	applyCharacterPropBonus(bonuses, int(template.Prop1), template.PropNum1)
	applyCharacterPropBonus(bonuses, int(template.Prop2), template.PropNum2)
}

func (s *Service) applySoulBonus(bonuses *domainchar.EquipmentStatBonuses, soulLevel int) {
	if bonuses == nil || soulLevel <= 0 || s.gameDataManager == nil {
		return
	}
	template := s.gameDataManager.GetSoul(soulLevel)
	if template == nil {
		return
	}
	propIDs := []float64{
		template.Prop1, template.Prop2, template.Prop3, template.Prop4, template.Prop5,
		template.Prop6, template.Prop7, template.Prop8, template.Prop9, template.Prop10,
	}
	propValues := []float64{
		template.PropNum1, template.PropNum2, template.PropNum3, template.PropNum4, template.PropNum5,
		template.PropNum6, template.PropNum7, template.PropNum8, template.PropNum9, template.PropNum10,
	}
	for index, rawProp := range propIDs {
		applyCharacterPropBonus(bonuses, int(rawProp), propValues[index])
	}
}

func (s *Service) applyMountBonus(bonuses *domainchar.EquipmentStatBonuses, activeMount *domainfeature.ActiveMount) {
	if bonuses == nil || activeMount == nil || !activeMount.IsActive || s.gameDataManager == nil {
		return
	}

	template := s.gameDataManager.GetMount(activeMount.MountID)
	if template == nil || int(template.Level) != activeMount.Level {
		template = s.gameDataManager.FindMountByTypeAndLevel(activeMount.MountID, activeMount.Level)
	}
	if template == nil {
		return
	}

	applyCharacterPropBonus(bonuses, domainchar.PropMaxHP, template.LifeBasic)
	applyCharacterPropBonus(bonuses, domainchar.PropAttack, template.PhyAttackBasic)
	applyCharacterPropBonus(bonuses, domainchar.PropMagicAttack, template.MagAttackBasic)
	applyCharacterPropBonus(bonuses, domainchar.PropDefense, template.PhyDefenseBasic)
	applyCharacterPropBonus(bonuses, domainchar.PropMagicDef, template.MagDefenseBasic)

	if template.LifePer != 0 {
		bonuses.AddPercent(domainchar.PropMaxHP, int(math.Round(template.LifePer)))
	}
	if template.PhyAttackPer != 0 {
		bonuses.AddPercent(domainchar.PropAttack, int(math.Round(template.PhyAttackPer)))
	}
	if template.MagAttackPer != 0 {
		bonuses.AddPercent(domainchar.PropMagicAttack, int(math.Round(template.MagAttackPer)))
	}
	if template.PhyDefensePer != 0 {
		bonuses.AddPercent(domainchar.PropDefense, int(math.Round(template.PhyDefensePer)))
	}
	if template.MagDefensePer != 0 {
		bonuses.AddPercent(domainchar.PropMagicDef, int(math.Round(template.MagDefensePer)))
	}
}

func (s *Service) applyMagicArrayBonus(bonuses *domainchar.EquipmentStatBonuses, state map[string]interface{}) {
	if bonuses == nil || len(state) == 0 || s.gameDataManager == nil {
		return
	}
	starsNow := stateValueAsMap(state, "starsNow")
	for rawType, rawLevel := range starsNow {
		typeIndex, err := strconvAtoi(rawType)
		if err != nil {
			continue
		}
		level, ok := intValue(rawLevel)
		if !ok || level <= 0 {
			continue
		}
		template := s.gameDataManager.FindStarsTemplateByTypeAndLevel(typeIndex+1, level)
		if template == nil {
			continue
		}
		propID := magicArrayPropToID(template.AddProp)
		if propID == 0 {
			continue
		}
		applyCharacterPropBonus(bonuses, propID, template.AddValue)
	}
}

func (s *Service) applyStarsBonus(bonuses *domainchar.EquipmentStatBonuses, state map[string]interface{}) {
	if bonuses == nil || len(state) == 0 || s.gameDataManager == nil {
		return
	}
	for rawType, raw := range state {
		starType, err := strconvAtoi(rawType)
		if err != nil || starType < 1 || starType > 12 {
			continue
		}
		slot, ok := raw.(map[string]interface{})
		if !ok {
			continue
		}
		level, ok := intValue(slot["level"])
		if !ok || level <= 0 {
			continue
		}
		template := s.gameDataManager.FindStarsTemplateByTypeAndLevel(starType, level)
		if template == nil {
			continue
		}
		propID := magicArrayPropToID(template.AddProp)
		if propID == 0 {
			continue
		}
		addition, ok := floatValue(slot["addition"])
		if !ok || addition <= 0 {
			addition = 1.0
		}
		applyCharacterPropBonus(bonuses, propID, template.AddValue*addition)
	}
}

func (s *Service) applyExplorerMedalBonus(bonuses *domainchar.EquipmentStatBonuses, state map[string]interface{}) {
	if bonuses == nil || len(state) == 0 || s.gameDataManager == nil {
		return
	}
	id := parseExplorerMedalID(state)
	if id <= 0 {
		return
	}
	template := s.gameDataManager.GetExplorerMedal(id)
	if template == nil {
		return
	}
	applyExplorerMedalTemplate(bonuses, template)
}

func (s *Service) applyWarSpriteBonus(bonuses *domainchar.EquipmentStatBonuses, state map[string]interface{}) {
	if bonuses == nil || len(state) == 0 || s.gameDataManager == nil {
		return
	}
	totals := domainwsp.AggregateMultiplied(domainwsp.Decode(state), s.gameDataManager.GetWarSprite)
	for propID, total := range totals {
		applyCharacterPropBonus(bonuses, propID, scaleWarSpriteRawValue(propID, float64(total)))
	}
}

func scaleWarSpriteRawValue(propID int, rawValue float64) float64 {
	switch propID {
	case 13, 14, 31, 61:
		return rawValue / 10000
	case 59, 60, 62, 63:
		return rawValue / 100
	default:
		return rawValue
	}
}

func (s *Service) applyMedalBonus(bonuses *domainchar.EquipmentStatBonuses, state map[string]interface{}) {
	if bonuses == nil || len(state) == 0 || s.gameDataManager == nil {
		return
	}
	for _, key := range []string{"id", "templateId", "template_id", "medalId", "medal_id"} {
		id, ok := intValue(state[key])
		if !ok || id <= 0 {
			continue
		}
		template := s.gameDataManager.GetMedal(id)
		if template == nil {
			return
		}
		applyCharacterPropBonus(bonuses, int(template.PropType), template.PropVal)
		return
	}
}

func (s *Service) applyPRSBonus(bonuses *domainchar.EquipmentStatBonuses, state map[string]interface{}) {
	if bonuses == nil || len(state) == 0 || s.gameDataManager == nil {
		return
	}

	for _, key := range []string{"treeId", "tree_id"} {
		if id, ok := intValue(state[key]); ok && id > 0 {
			if template := s.gameDataManager.GetPrsTree(id); template != nil {
				applyPRSPropTemplate(bonuses, template.PT1, template.PN1, template.PT2, template.PN2, template.PT3, template.PN3)
			}
		}
	}

	for _, key := range []string{"showId", "show_id"} {
		if id, ok := intValue(state[key]); ok && id > 0 {
			if template := s.gameDataManager.GetPrsShow(id); template != nil {
				applyPRSPropTemplate(bonuses, template.PT1, template.PN1, template.PT2, template.PN2, template.PT3, template.PN3)
			}
		}
	}
}

func (s *Service) applyHeiyaoshiBonus(bonuses *domainchar.EquipmentStatBonuses, state map[string]interface{}) {
	if bonuses == nil || len(state) == 0 {
		return
	}
	for rawPropID, rawValue := range stateValueAsMap(state, "Buff") {
		propID, err := strconvAtoi(rawPropID)
		if err != nil {
			continue
		}
		value, ok := floatValue(rawValue)
		if !ok {
			continue
		}
		applyHeiyaoshiPropBonus(bonuses, propID, value)
	}
}

var heiyaoshiPercentPointProps = map[int]struct{}{
	14: {}, 31: {}, 34: {}, 61: {},
}

var heiyaoshiFractionProps = map[int]struct{}{
	59: {}, 60: {}, 62: {}, 63: {},
}

func applyHeiyaoshiPropBonus(bonuses *domainchar.EquipmentStatBonuses, propID int, rawValue float64) {
	if bonuses == nil || propID <= 0 || rawValue == 0 {
		return
	}
	if _, ok := heiyaoshiPercentPointProps[propID]; ok {
		bonuses.AddFinal(propID, rawValue)
		return
	}
	statProp := domainchar.NormalizeCharacterPropType(propID)
	if statProp == 0 {
		return
	}
	if domainchar.UsesFloatBonus(statProp) {
		applyValue := rawValue
		if _, ok := heiyaoshiFractionProps[propID]; ok {
			applyValue = rawValue * 100
		}
		bonuses.AddFloat(statProp, applyValue)
		return
	}
	bonuses.AddFlat(statProp, int(math.Round(rawValue)))
}

func (s *Service) applyPMDailyBuffBonus(bonuses *domainchar.EquipmentStatBonuses, state map[string]interface{}) {
	if bonuses == nil || len(state) == 0 || s.gameDataManager == nil {
		return
	}
	day, ok := stringValue(state["day"])
	if !ok || day == "" || day != pmDailyBuffCycleDay(time.Now()) {
		return
	}
	buffID := 0
	for _, key := range []string{"buffId", "buff_id", "id"} {
		parsed, ok := intValue(state[key])
		if ok && parsed > 0 {
			buffID = parsed
			break
		}
	}
	if buffID <= 0 {
		return
	}
	template := s.gameDataManager.GetBuff(buffID)
	if template == nil {
		return
	}
	applyCharacterBuffTemplate(bonuses, template)
}

func applyExplorerMedalTemplate(bonuses *domainchar.EquipmentStatBonuses, template *models.ExplorerMedalTemplate) {
	if bonuses == nil || template == nil {
		return
	}
	propIDs := []float64{
		template.PropType1, template.PropType2, template.PropType3, template.PropType4,
		template.PropType5, template.PropType6, template.PropType7, template.PropType8,
	}
	propValues := []float64{
		template.PropNum1, template.PropNum2, template.PropNum3, template.PropNum4,
		template.PropNum5, template.PropNum6, template.PropNum7, template.PropNum8,
	}
	for index, rawProp := range propIDs {
		applyCharacterPropBonus(bonuses, int(rawProp), propValues[index])
	}
}

func applyPRSPropTemplate(bonuses *domainchar.EquipmentStatBonuses, prop1, num1, prop2, num2, prop3, num3 float64) {
	applyCharacterPropBonus(bonuses, int(prop1), num1)
	applyCharacterPropBonus(bonuses, int(prop2), num2)
	applyCharacterPropBonus(bonuses, int(prop3), num3)
}

func applyCharacterBuffTemplate(bonuses *domainchar.EquipmentStatBonuses, template *models.BuffTemplate) {
	if bonuses == nil || template == nil {
		return
	}
	propIDs := []float64{template.Prop1, template.Prop2, template.Prop3, template.Prop4, template.Prop5, template.Prop6}
	propValues := []float64{template.PropNum1, template.PropNum2, template.PropNum3, template.PropNum4, template.PropNum5, template.PropNum6}
	scaled := int(template.PercentFlag) == 1

	for index, rawPropID := range propIDs {
		propID := int(rawPropID)
		value := propValues[index]
		if propID <= 0 || value == 0 {
			continue
		}
		applyCharacterBuffPropBonus(bonuses, propID, value, scaled)
	}
}

func applyCharacterBuffPropBonus(bonuses *domainchar.EquipmentStatBonuses, propID int, value float64, scaled bool) {
	if bonuses == nil {
		return
	}
	if !scaled {
		applyCharacterPropBonus(bonuses, propID, value)
		return
	}
	applyPercentCharacterPropBonus(bonuses, propID, value)
}

func pmDailyBuffCycleDay(now time.Time) string {
	return fmt.Sprintf("%d|%d|%d", int(now.Month())-1, now.Day(), int(now.Weekday()))
}

// ApplyBuffTemplateBonus is the public entry point used by the buff service to
// project a TBL_BUFF row's prop1..prop6 / propNum1..propNum6 / percentFlag pair
// onto an EquipmentStatBonuses accumulator using the same percent vs flat
// semantics as the rest of the stat-feature aggregator.
func ApplyBuffTemplateBonus(bonuses *domainchar.EquipmentStatBonuses, template *models.BuffTemplate) {
	applyCharacterBuffTemplate(bonuses, template)
}
