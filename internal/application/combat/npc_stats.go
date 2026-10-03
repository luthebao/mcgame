// Open-sourced by BaoLT

// NPC and creature stat calculation for battle encounters.
package combat

import (
	"strconv"

	"mcgame-server/internal/domain/combat"
	domainelement "mcgame-server/internal/domain/element"
	"mcgame-server/internal/domain/stats"
	"mcgame-server/internal/gamedata/models"
)

type NPCTemplateData struct {
	ID           int
	Name         string
	Level        int
	ResCode      int
	IconCode     int
	ColorCode    int
	BossFlag     int
	WithCloud    int
	Life         int
	MaxMP        int
	Attack       int
	Defense      int
	MagicAttack  int
	MagicDefense int
	Speed        int
	Hit          int
	Dodge        int
	Critical     int
	Element      int
	Exp          int
	ExpMulti     float64
}

func NormalizeEncounterTemplateForPlayer(template NPCTemplateData, playerLevel int) NPCTemplateData {
	if template.BossFlag > 0 {
		return template
	}
	effectiveLevel := clampEncounterLevel(template.Level, playerLevel)
	if effectiveLevel <= 0 {
		return template
	}
	if effectiveLevel >= template.Level {
		template.Level = effectiveLevel
		return template
	}
	return scaleTemplateToLevel(template, effectiveLevel)
}

func clampEncounterLevel(level int, playerLevel int) int {
	if level <= 0 {
		level = 1
	}
	if playerLevel <= 0 {
		return level
	}
	maxLevel := playerLevel + 5
	if level > maxLevel {
		return maxLevel
	}
	return level
}

func scaleTemplateToLevel(template NPCTemplateData, level int) NPCTemplateData {
	if template.Level <= 0 || level <= 0 || level >= template.Level {
		template.Level = level
		return template
	}

	ratio := float64(level) / float64(template.Level)
	scaled := template
	scaled.Level = level
	scaled.Life = maxInt(100+level*20, scaleTemplateStat(template.Life, ratio))
	scaled.Attack = maxInt(20+level*3, scaleTemplateStat(template.Attack, ratio))
	scaled.Defense = maxInt(10+level*2, scaleTemplateStat(template.Defense, ratio))
	scaled.MagicAttack = maxInt(15+level*2, scaleTemplateStat(template.MagicAttack, ratio))
	scaled.MagicDefense = maxInt(10+level, scaleTemplateStat(template.MagicDefense, ratio))
	scaled.Speed = maxInt(100+level, 100+scaleTemplateStat(maxInt(0, template.Speed-100), ratio))
	scaled.Hit = maxInt(100, 100+scaleTemplateStat(maxInt(0, template.Hit-100), ratio))
	if template.Dodge > 0 {
		scaled.Dodge = maxInt(1, scaleTemplateStat(template.Dodge, ratio))
	}
	if template.Critical > 0 {
		scaled.Critical = maxInt(1, scaleTemplateStat(template.Critical, ratio))
	}
	return scaled
}

func scaleTemplateStat(value int, ratio float64) int {
	if value <= 0 {
		return 0
	}
	scaled := int(float64(value) * ratio)
	if scaled < 1 {
		return 1
	}
	return scaled
}

func maxInt(a, b int) int {
	if a > b {
		return a
	}
	return b
}

func CalculateCreatureStats(creature *models.CreatureTemplate, level int) NPCTemplateData {
	profile := stats.Profile{
		SeedHP:          50,
		SeedMP:          20,
		SeedHit:         100,
		SeedSpeed:       100,
		GrowthScale:     max(1.0, creature.GrowBase),
		Strength:        creature.AttStrength,
		AptStrength:     creature.AptStrength,
		Agility:         creature.AttAgility,
		AptAgility:      creature.AptAgility,
		Stamina:         creature.AttStamina,
		AptStamina:      creature.AptStamina,
		Intelligence:    creature.AttIntelligence,
		AptIntelligence: creature.AptIntelligence,
		Energy:          creature.AttEnergy,
		AptEnergy:       creature.AptEnergy,
		PropHit:         creature.PropHit,
		PropDodge:       creature.PropDodge,
		PropSpeed:       creature.PropSpeed,
		PropCritical:    creature.PropCritical,
	}
	result := stats.BuildBaseStats(profile)

	hpMult := stats.CreatureHPLevelMultiplier(level)
	dmgMult := stats.CreatureDamageLevelMultiplier(level)
	result.MaxHP = int(float64(result.MaxHP) * hpMult)
	result.MaxMP = int(float64(result.MaxMP) * hpMult)
	result.Attack = int(float64(result.Attack) * dmgMult)
	result.Defense = int(float64(result.Defense) * dmgMult)
	result.MagicAttack = int(float64(result.MagicAttack) * dmgMult)
	result.MagicDefense = int(float64(result.MagicDefense) * dmgMult)

	result.MaxHP = stats.ApplyLifePercent(result.MaxHP, creature.Life)

	return NPCTemplateData{
		ID:           int(creature.ID),
		Name:         creature.Name,
		Level:        level,
		ResCode:      int(creature.ResCode),
		IconCode:     int(creature.IconCode),
		ColorCode:    int(creature.ColorCode),
		Life:         result.MaxHP,
		MaxMP:        result.MaxMP,
		Attack:       result.Attack,
		Defense:      result.Defense,
		MagicAttack:  result.MagicAttack,
		MagicDefense: result.MagicDefense,
		Speed:        result.Speed,
		Hit:          result.Hit,
		Dodge:        result.Dodge,
		Critical:     result.Critical,
		Element:      domainelement.NormalizeClientElementValue(creature.Element),
	}
}

func applyTemplateStats(enemy *combat.Participant, t NPCTemplateData) {
	enemy.Element = domainelement.NormalizeClientElementID(t.Element)
	if t.Life > 0 {
		enemy.MaxHP = t.Life
	} else {
		enemy.MaxHP = 100 + enemy.Level*20
	}
	enemy.CurrentHP = enemy.MaxHP
	if t.MaxMP > 0 {
		enemy.MaxMP = t.MaxMP
	} else {
		enemy.MaxMP = 50 + enemy.Level*10
	}
	enemy.CurrentMP = enemy.MaxMP
	if t.Attack > 0 {
		enemy.Attack = t.Attack
	} else {
		enemy.Attack = 20 + enemy.Level*3
	}
	if t.Defense > 0 {
		enemy.Defense = t.Defense
	} else {
		enemy.Defense = 10 + enemy.Level*2
	}
	if t.MagicAttack > 0 {
		enemy.MagicAttack = t.MagicAttack
	} else {
		enemy.MagicAttack = 15 + enemy.Level*2
	}
	if t.MagicDefense > 0 {
		enemy.MagicDefense = t.MagicDefense
	} else {
		enemy.MagicDefense = 10 + enemy.Level
	}
	if t.Speed > 0 {
		enemy.Speed = t.Speed
	} else {
		enemy.Speed = 100 + enemy.Level
	}
	if t.Hit > 0 {
		enemy.Hit = t.Hit
	} else {
		enemy.Hit = 100
	}
	if t.Dodge > 0 {
		enemy.Dodge = t.Dodge
	} else {
		enemy.Dodge = 5
	}
	if t.Critical > 0 {
		enemy.Critical = t.Critical
	} else {
		enemy.Critical = 5
	}
	enemy.CriticalDmg = 150
	if t.Exp > 0 {
		expMulti := t.ExpMulti
		if expMulti <= 0 {
			expMulti = 1.0
		}
		enemy.ExpReward = int(float64(t.Exp) * expMulti)
	}
}

func creatureDataInt(v interface{}) int {
	switch val := v.(type) {
	case float64:
		return int(val)
	case int:
		return val
	case int64:
		return int(val)
	case string:
		n, _ := strconv.Atoi(val)
		return n
	}
	return 0
}
