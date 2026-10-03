// Open-sourced by BaoLT

// Equipment stat aggregation: collects flat and percentage bonuses
// from all equipped items including inlaid gems.
//
// Gem prop_type mapping (item_template.prop_type for type=503):
//
//	1 = Lực (Strength)      → PropStrength (20)
//	2 = Xảo (Agility)       → PropAgility (21)
//	3 = Mệnh (Stamina/HP)   → PropMaxHP (1)
//	4 = Trí (Intelligence)  → PropIntelligence (22)
//	5 = Thần (Spirit)       → PropSpirit (23)
package item

import (
	"context"
	"strconv"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"

	"go.uber.org/zap"
)

func (s *Service) AggregateEquipmentStats(ctx context.Context, charID int64) character.EquipmentStatBonuses {
	bonuses := character.NewEquipmentStatBonuses()

	if s == nil {
		return bonuses
	}

	if s.itemRepo != nil {
		equipment, err := s.GetEquipment(ctx, charID)
		if err != nil {
			s.logger.Warn("AggregateEquipmentStats: failed to get equipment",
				zap.Int64("character_id", charID),
				zap.Error(err))
		} else if len(equipment) > 0 {
			activeList := s.BuildEquipActiveList(ctx, charID)
			for _, eq := range equipment {
				s.aggregateEquipBaseStats(eq, &bonuses)
				s.aggregateGemStats(eq, &bonuses)
				s.aggregateActiveSetStats(eq, activeList, &bonuses)
			}
			s.aggregateMakerSetStats(ctx, charID, &bonuses)
		}
	}

	if s.charBonusProvider != nil {
		extra := s.charBonusProvider.AggregateCharacterStatBonuses(ctx, charID)
		mergeEquipmentStatBonuses(&bonuses, extra)
	}

	for _, provider := range s.extraBonusProviders {
		if provider == nil {
			continue
		}
		extra := provider.AggregateCharacterStatBonuses(ctx, charID)
		mergeEquipmentStatBonuses(&bonuses, extra)
	}

	return bonuses
}

func mergeEquipmentStatBonuses(dst *character.EquipmentStatBonuses, src character.EquipmentStatBonuses) {
	if dst == nil {
		return
	}
	for propType, value := range src.Flat {
		dst.AddFlat(propType, value)
	}
	for propType, value := range src.Percent {
		dst.AddPercent(propType, value)
	}
	for propType, value := range src.Float {
		dst.AddFloat(propType, value)
	}
	for rawPropID, value := range src.FinalAdds {
		dst.AddFinal(rawPropID, value)
	}
}

var equipStarMultipliers = [11]float64{1, 1.1, 1.21, 1.33, 1.46, 1.61, 1.77, 1.94, 2.14, 2.36, 2.6}

func equipStarMultiplier(starLevel int) float64 {
	if starLevel <= 0 {
		return 1
	}
	if starLevel >= len(equipStarMultipliers) {
		return equipStarMultipliers[len(equipStarMultipliers)-1]
	}
	return equipStarMultipliers[starLevel]
}

func (s *Service) aggregateEquipBaseStats(eq *domainitem.Item, bonuses *character.EquipmentStatBonuses) {
	tpl := s.GetEquipmentTemplate(eq.TemplateID)
	starMult := equipStarMultiplier(eq.StarLevel)

	mainProp1 := equipPropertyInt(eq.Properties, "mainProp1")
	mainPropNum1 := equipPropertyInt(eq.Properties, "mainPropNum1")
	if mainProp1 <= 0 && tpl != nil {
		mainProp1 = int(tpl.MainProp1)
		mainPropNum1 = int(tpl.MainPropNum1)
	}
	addEquipmentPropBonus(bonuses, mainProp1, int(float64(mainPropNum1)*starMult))

	bindNum1 := equipPropertyInt(eq.Properties, "bindMainPropNum1")
	if bindNum1 > 0 && mainProp1 > 0 {
		addEquipmentPropBonus(bonuses, mainProp1, bindNum1)
	}

	mainProp2 := equipPropertyInt(eq.Properties, "mainProp2")
	mainPropNum2 := equipPropertyInt(eq.Properties, "mainPropNum2")
	if mainProp2 <= 0 && tpl != nil {
		mainProp2 = int(tpl.MainProp2)
		mainPropNum2 = int(tpl.MainPropNum2)
	}
	addEquipmentPropBonus(bonuses, mainProp2, int(float64(mainPropNum2)*starMult))

	bindNum2 := equipPropertyInt(eq.Properties, "bindMainPropNum2")
	if bindNum2 > 0 && mainProp2 > 0 {
		addEquipmentPropBonus(bonuses, mainProp2, bindNum2)
	}

	prop1 := equipPropertyInt(eq.Properties, "prop1")
	propNum1 := equipPropertyInt(eq.Properties, "propNum1")
	if prop1 <= 0 && tpl != nil {
		prop1 = int(tpl.Prop1)
		propNum1 = int(tpl.PropNum1)
	}
	addEquipmentPropBonus(bonuses, prop1, propNum1)

	prop2 := equipPropertyInt(eq.Properties, "prop2")
	propNum2 := equipPropertyInt(eq.Properties, "propNum2")
	if prop2 <= 0 && tpl != nil {
		prop2 = int(tpl.Prop2)
		propNum2 = int(tpl.PropNum2)
	}
	addEquipmentPropBonus(bonuses, prop2, propNum2)
}

func (s *Service) aggregateGemStats(eq *domainitem.Item, bonuses *character.EquipmentStatBonuses) {
	if eq.Properties == nil || s.gameDataRec == nil {
		return
	}
	for slot := 1; slot <= MaxHoles; slot++ {
		gemTplID := GetHoleGemTemplateID(eq.Properties, slot)
		if gemTplID <= 0 {
			continue
		}
		gemTpl := s.gameDataRec.GetItem(gemTplID)
		if gemTpl == nil {
			continue
		}
		statProp := gemPropToStat(int(gemTpl.PropType))
		if statProp <= 0 {
			continue
		}
		bonuses.AddFlat(statProp, int(gemTpl.ProplNum))
	}
}

func (s *Service) aggregateActiveSetStats(eq *domainitem.Item, activeList map[string]interface{}, bonuses *character.EquipmentStatBonuses) {
	tpl := s.GetEquipmentTemplate(eq.TemplateID)

	sid := strconv.Itoa(eq.CalculateSID())
	active, _ := activeList[sid].(bool)
	if !active {
		return
	}

	activeProp := equipPropertyInt(eq.Properties, "activeProp")
	activePropNum := equipPropertyInt(eq.Properties, "activePropNum")
	if activeProp <= 0 && tpl != nil {
		activeProp = int(tpl.ActivePropType)
	}
	if activePropNum <= 0 && tpl != nil {
		activePropNum = int(tpl.ActivePropNum)
	}
	if activeProp <= 0 || activePropNum <= 0 {
		return
	}

	character.ApplyActivePropBonus(bonuses, activeProp, activePropNum)
}

func (s *Service) aggregateMakerSetStats(ctx context.Context, charID int64, bonuses *character.EquipmentStatBonuses) {
	makerSet := s.CalculateMakerSet(ctx, charID)
	if !makerSet.Active || makerSet.QualityType <= 0 {
		return
	}
	hpPct, atkPct, mAtkPct := character.MakerSetBonuses(makerSet.QualityType)
	bonuses.AddPercent(character.PropMaxHP, hpPct)
	bonuses.AddPercent(character.PropAttack, atkPct)
	bonuses.AddPercent(character.PropMagicAttack, mAtkPct)
}

func gemPropToStat(gemProp int) int {
	switch gemProp {
	case 1:
		return character.PropStrength
	case 2:
		return character.PropAgility
	case 3:
		return character.PropMaxHP
	case 4:
		return character.PropIntelligence
	case 5:
		return character.PropSpirit
	default:
		return 0
	}
}

func addEquipmentPropBonus(bonuses *character.EquipmentStatBonuses, rawProp, value int) {
	if bonuses == nil || rawProp <= 0 || value == 0 {
		return
	}

	statProp := character.EquipmentPropToStat(rawProp)
	if statProp == 0 {
		return
	}

	if character.EquipmentPropUsesPercent(rawProp) {
		bonuses.AddPercent(statProp, value)
		return
	}

	if character.UsesFloatBonus(statProp) {
		bonuses.AddFloat(statProp, float64(value))
		return
	}

	bonuses.AddFlat(statProp, value)
}
