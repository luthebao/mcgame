// Open-sourced by BaoLT

// Functional character stat bonus aggregation and application.
// Keeps feature-local prop ids separate from semantic server stat keys.
package character

import "math"

const (
	PropMaxHP = 1001 + iota
	PropMaxMP
	PropMaxSP
	PropAttack
	PropMagicAttack
	PropDefense
	PropMagicDef
	PropHit
	PropDodge
	PropCounter
	PropSpeed
	PropCombo
	PropCritical
	PropDefy
	PropStrength
	PropAgility
	PropStamina
	PropIntelligence
	PropSpirit
	PropRebornRate
	PropResiCritical
	PropDebuffHit
	PropDebuffResist
	PropResiDefy
	PropFinalPhysReduce
	PropFinalMagicReduce
	PropFinalPhysBonus
	PropFinalMagicBonus
	PropCriticalDamage
	PropBreakReborn
	PropResiDizzy
	PropResiConfusion
	PropResiSleep
	PropResiPoison
	PropResiLight
	PropResiRage
	PropDizzy
	PropConfusion
	PropSleep
	PropPoison
	PropLight
	PropRage
)

const (
	ActivePropAttack      = 1
	ActivePropMagicAttack = 2
	ActivePropCritical    = 3
	ActivePropDefy        = 4
	ActivePropReduceHurt1 = 5
	ActivePropReduceHurt2 = 6
	ActivePropReduceAll   = 7
	ActivePropHP          = 8
)

type EquipmentStatBonuses struct {
	Flat      map[int]int
	Percent   map[int]int
	Float     map[int]float64
	FinalAdds map[int]float64
}

func NewEquipmentStatBonuses() EquipmentStatBonuses {
	return EquipmentStatBonuses{
		Flat:      make(map[int]int),
		Percent:   make(map[int]int),
		Float:     make(map[int]float64),
		FinalAdds: make(map[int]float64),
	}
}

func (b *EquipmentStatBonuses) AddFlat(propType, value int) {
	if propType <= 0 || value == 0 {
		return
	}
	b.Flat[propType] += value
}

func (b *EquipmentStatBonuses) AddPercent(propType, value int) {
	if propType <= 0 || value == 0 {
		return
	}
	b.Percent[propType] += value
}

func (b *EquipmentStatBonuses) AddFloat(propType int, value float64) {
	if propType <= 0 || value == 0 {
		return
	}
	b.Float[propType] += value
}

func (b *EquipmentStatBonuses) AddFinal(rawPropID int, value float64) {
	if rawPropID <= 0 || value == 0 || IsSemanticPropKey(rawPropID) {
		return
	}
	b.FinalAdds[rawPropID] += value
}

func IsSemanticPropKey(propType int) bool {
	return propType >= PropMaxHP
}

func EquipmentPropToStat(propType int) int {
	switch propType {
	case 1:
		return PropMaxHP
	case 2:
		return PropMaxMP
	case 3:
		return PropMaxSP
	case 4:
		return PropAttack
	case 5:
		return PropMagicAttack
	case 6:
		return PropDefense
	case 7:
		return PropMagicDef
	case 8:
		return PropHit
	case 9:
		return PropDodge
	case 10:
		return PropCounter
	case 11:
		return PropSpeed
	case 12:
		return PropCombo
	case 13:
		return PropCritical
	case 14:
		return PropDefy
	case 20:
		return PropStrength
	case 21:
		return PropStamina
	case 22:
		return PropIntelligence
	case 23:
		return PropSpirit
	case 24:
		return PropMaxHP
	case 25:
		return PropMaxMP
	case 26:
		return PropRebornRate
	case 27:
		return PropResiCritical
	case 28:
		return PropDebuffResist
	case 29:
		return PropResiDefy
	default:
		return 0
	}
}

func EquipmentPropUsesPercent(propType int) bool {
	switch propType {
	case 24, 25:
		return true
	default:
		return false
	}
}

func CommonFeaturePropToStat(propType int) int {
	switch propType {
	case 1:
		return PropMaxHP
	case 2:
		return PropMaxMP
	case 3:
		return PropMaxSP
	case 4:
		return PropAttack
	case 5:
		return PropMagicAttack
	case 6:
		return PropDefense
	case 7:
		return PropMagicDef
	case 8:
		return PropHit
	case 9:
		return PropDodge
	case 10:
		return PropCounter
	case 11:
		return PropSpeed
	case 12:
		return PropCombo
	case 13:
		return PropCritical
	case 14:
		return PropDefy
	case 17:
		return PropResiDizzy
	case 18:
		return PropResiConfusion
	case 19:
		return PropResiSleep
	case 20:
		return PropResiPoison
	case 23:
		return PropResiLight
	case 30:
		return PropResiRage
	case 31:
		return PropResiCritical
	case 32:
		return PropDebuffHit
	case 34:
		return PropRebornRate
	case 43:
		return PropResiDizzy
	case 44:
		return PropResiConfusion
	case 45:
		return PropResiSleep
	case 46:
		return PropResiPoison
	case 49:
		return PropResiLight
	case 50:
		return PropResiRage
	case 51:
		return PropResiCritical
	case 52:
		return PropConfusion
	case 53:
		return PropDizzy
	case 54:
		return PropPoison
	case 55:
		return PropRage
	case 56:
		return PropSleep
	case 57:
		return PropLight
	case 58:
		return PropDebuffResist
	case 59:
		return PropFinalPhysReduce
	case 60:
		return PropFinalMagicReduce
	case 61:
		return PropResiDefy
	case 62:
		return PropFinalPhysBonus
	case 63:
		return PropFinalMagicBonus
	case 71:
		return PropCriticalDamage
	case 72:
		return PropBreakReborn
	default:
		return 0
	}
}

func IsPercentScalableProp(propType int) bool {
	switch propType {
	case PropMaxHP, PropMaxMP, PropMaxSP, PropAttack, PropMagicAttack, PropDefense, PropMagicDef, PropSpeed:
		return true
	default:
		return false
	}
}

func ActivePropToStatPropType(activeProp int) int {
	switch activeProp {
	case ActivePropAttack:
		return PropAttack
	case ActivePropMagicAttack:
		return PropMagicAttack
	case ActivePropCritical:
		return PropCritical
	case ActivePropDefy:
		return PropDefy
	case ActivePropReduceHurt1:
		return PropFinalPhysReduce
	case ActivePropReduceHurt2:
		return PropFinalMagicReduce
	case ActivePropReduceAll:
		return PropFinalPhysReduce
	case ActivePropHP:
		return PropMaxHP
	default:
		return 0
	}
}

func ApplyActivePropBonus(bonuses *EquipmentStatBonuses, activeProp, value int) {
	if bonuses == nil || value == 0 {
		return
	}

	switch activeProp {
	case ActivePropAttack:
		bonuses.AddPercent(PropAttack, value)
	case ActivePropMagicAttack:
		bonuses.AddPercent(PropMagicAttack, value)
	case ActivePropHP:
		bonuses.AddPercent(PropMaxHP, value)
	case ActivePropCritical:
		bonuses.AddFlat(PropCritical, value)
	case ActivePropDefy:
		bonuses.AddFloat(PropDefy, float64(value))
	case ActivePropReduceHurt1:
		bonuses.AddFloat(PropFinalPhysReduce, float64(value))
	case ActivePropReduceHurt2:
		bonuses.AddFloat(PropFinalMagicReduce, float64(value))
	case ActivePropReduceAll:
		bonuses.AddFloat(PropFinalPhysReduce, float64(value))
		bonuses.AddFloat(PropFinalMagicReduce, float64(value))
	}
}

func NormalizeCharacterPropType(propType int) int {
	if IsSemanticPropKey(propType) {
		return propType
	}
	return CommonFeaturePropToStat(propType)
}

func UsesFloatBonus(propType int) bool {
	switch propType {
	case PropDefy, PropResiCritical, PropDebuffHit, PropDebuffResist, PropResiDefy,
		PropFinalPhysReduce, PropFinalMagicReduce, PropFinalPhysBonus, PropFinalMagicBonus,
		PropCriticalDamage, PropBreakReborn, PropResiDizzy, PropResiConfusion, PropResiSleep,
		PropResiPoison, PropResiLight, PropResiRage, PropDizzy, PropConfusion, PropSleep,
		PropPoison, PropLight, PropRage:
		return true
	default:
		return false
	}
}

func NormalizeRatePropValue(propType int, rawValue float64) float64 {
	switch propType {
	case PropDefy, PropResiCritical, PropDebuffHit, PropDebuffResist, PropResiDefy,
		PropFinalPhysReduce, PropFinalMagicReduce, PropFinalPhysBonus, PropFinalMagicBonus,
		PropCriticalDamage, PropBreakReborn, PropResiDizzy, PropResiConfusion, PropResiSleep,
		PropResiPoison, PropResiLight, PropResiRage, PropDizzy, PropConfusion, PropSleep,
		PropPoison, PropLight, PropRage:
		if rawValue > 0 && rawValue < 1 {
			return rawValue * 100
		}
	}
	return rawValue
}

func (c *Character) ApplyEquipmentBonuses(bonuses EquipmentStatBonuses) {
	if len(bonuses.Flat) == 0 && len(bonuses.Percent) == 0 && len(bonuses.Float) == 0 && len(bonuses.FinalAdds) == 0 {
		return
	}

	hasAttrBonus := bonuses.Flat[PropStrength] != 0 ||
		bonuses.Flat[PropAgility] != 0 ||
		bonuses.Flat[PropStamina] != 0 ||
		bonuses.Flat[PropIntelligence] != 0 ||
		bonuses.Flat[PropSpirit] != 0

	if hasAttrBonus {
		c.Strength += bonuses.Flat[PropStrength]
		c.Agility += bonuses.Flat[PropAgility]
		c.Stamina += bonuses.Flat[PropStamina]
		c.Intelligence += bonuses.Flat[PropIntelligence]
		c.Spirit += bonuses.Flat[PropSpirit]
		c.RecalculateStats()
	}

	for propType, value := range bonuses.Flat {
		if propType >= PropStrength && propType <= PropSpirit {
			continue
		}
		c.addFlatBonus(propType, value)
	}

	for propType, value := range bonuses.Float {
		c.addFloatBonus(propType, value)
	}

	for propType, pct := range bonuses.Percent {
		c.applyPercentBonus(propType, pct)
	}

	c.syncFinalFields()
	applyFinalAdds(c, bonuses)
}

func applyFinalAdds(c *Character, bonuses EquipmentStatBonuses) {
	for rawPropID, value := range bonuses.FinalAdds {
		switch rawPropID {
		case 13:
			c.FinalCriticalDamage += value
		case 14:
			c.FinalDefy += value
		case 31:
			c.FinalResiCritical += value
		case 34:
			c.FinalRebornRate += int(math.Round(value))
		case 61:
			c.FinalResiDefy += value
		}
	}
}

func (c *Character) addFlatBonus(propType, value int) {
	switch propType {
	case PropMaxHP:
		c.MaxHP += value
	case PropMaxMP:
		c.MaxMP += value
	case PropMaxSP:
		c.MaxSP += value
	case PropAttack:
		c.Attack += value
	case PropMagicAttack:
		c.MagicAttack += value
	case PropDefense:
		c.Defense += value
	case PropMagicDef:
		c.MagicDefense += value
	case PropHit:
		c.Hit += value
	case PropDodge:
		c.Dodge += value
	case PropCounter:
		c.FinalCounter += value
	case PropSpeed:
		c.Speed += value
	case PropCombo:
		c.FinalCombo += value
	case PropCritical:
		c.Critical += value
	case PropRebornRate:
		c.FinalRebornRate += value
	default:
		if UsesFloatBonus(propType) {
			c.addFloatBonus(propType, float64(value))
		}
	}
}

func (c *Character) addFloatBonus(propType int, value float64) {
	switch propType {
	case PropDefy:
		c.FinalDefy += value
	case PropResiCritical:
		c.FinalResiCritical += value
	case PropDebuffHit:
		c.FinalDebuffSuccRate += value
	case PropDebuffResist:
		c.FinalDebuffSuccRate += value
	case PropFinalPhysReduce:
		c.FinalPraDef += value
	case PropFinalMagicReduce:
		c.FinalPraMagDef += value
	case PropResiDefy:
		c.FinalResiDefy += value
	case PropFinalPhysBonus:
		c.FinalEnhPhyHurt += value
	case PropFinalMagicBonus:
		c.FinalEnhMagicHurt += value
	case PropCriticalDamage:
		c.CriticalDmg += int(math.Round(value))
	case PropBreakReborn:
		c.FinalBreakReborn += value
	case PropResiDizzy:
		c.FinalResiDizzy += value
	case PropResiConfusion:
		c.FinalResiConfusion += value
	case PropResiSleep:
		c.FinalResiSleep += value
	case PropResiPoison:
		c.FinalResiPoison += value
	case PropResiLight:
		c.FinalResiLight += value
	case PropResiRage:
		c.FinalResiRage += value
	case PropDizzy:
		c.FinalDizzy += value
	case PropConfusion:
		c.FinalConfusion += value
	case PropSleep:
		c.FinalSleep += value
	case PropPoison:
		c.FinalPoison += value
	case PropLight:
		c.FinalLight += value
	case PropRage:
		c.FinalRage += value
	}
}

func (c *Character) applyPercentBonus(propType, pct int) {
	if pct == 0 {
		return
	}

	switch propType {
	case PropMaxHP:
		c.MaxHP = applyPct(c.MaxHP, pct)
	case PropMaxMP:
		c.MaxMP = applyPct(c.MaxMP, pct)
	case PropMaxSP:
		c.MaxSP = applyPct(c.MaxSP, pct)
	case PropAttack:
		c.Attack = applyPct(c.Attack, pct)
	case PropMagicAttack:
		c.MagicAttack = applyPct(c.MagicAttack, pct)
	case PropDefense:
		c.Defense = applyPct(c.Defense, pct)
	case PropMagicDef:
		c.MagicDefense = applyPct(c.MagicDefense, pct)
	case PropSpeed:
		c.Speed = applyPct(c.Speed, pct)
	}
}

func (c *Character) syncFinalFields() {
	c.FinalStrength = c.Strength + c.AptStrength
	c.FinalAgility = c.Agility + c.AptAgility
	c.FinalStamina = c.Stamina + c.AptStamina
	c.FinalIntelligence = c.Intelligence + c.AptIntelligence
	c.FinalEnergy = c.Spirit + c.AptEnergy

	c.FinalHp = float64(c.MaxHP)
	c.FinalMp = c.MaxMP
	c.FinalSp = c.MaxSP
	c.FinalAttack = float64(c.Attack)
	c.FinalMAttack = float64(c.MagicAttack)
	c.FinalDefence = float64(c.Defense)
	c.FinalMDefence = float64(c.MagicDefense)
	c.FinalHit = float64(c.Hit)
	c.FinalDodge = float64(c.Dodge)
	c.FinalCritical = float64(c.Critical)
	c.FinalCriticalDamage = float64(CriticalDamageBonus(c.CriticalDmg))
	c.FinalSpeed = float64(c.Speed)
}

func MakerSetBonuses(qualityType int) (hpPct, attackPct, magicAttackPct int) {
	switch qualityType {
	case 10:
		return 10, 2, 2
	case 11:
		return 10, 5, 5
	case 15:
		return 16, 8, 8
	case 16:
		return 30, 15, 15
	case 20:
		return 40, 20, 20
	default:
		return 0, 0, 0
	}
}

func applyPct(base, pct int) int {
	return base + (base * pct / 100)
}
