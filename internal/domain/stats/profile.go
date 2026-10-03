// Open-sourced by BaoLT

package stats

import "math"

const (
	CoeffHPFromStamina          = 8.50
	CoeffMPFromIntelligence     = 4.07
	CoeffMPFromEnergy           = 5.75
	FixedMaxSP                  = 150
	CoeffAttackFromStrength     = 1.90
	CoeffAttackFromAgility      = 0.50
	CoeffMagicAttackFromInt     = 2.00
	CoeffMagicAttackFromEnergy  = 0.60
	CoeffDefenseFromStamina     = 2.57
	CoeffDefenseFromAgility     = 0.85
	CoeffMagicDefenseFromInt    = 2.71
	CoeffMagicDefenseFromEnergy = 4.60
	CoeffHitFromStrength        = 0.08
	CoeffHitFromAgility         = 0.05
	CoeffDodgeFromAgility       = 0.11
	CoeffSpeedFromAgility       = 1.70
	CoeffCriticalFromAgility    = 0.10
	DefaultGrowthScale          = 0.8

	CreatureHPLevelExponent     = 3
	CreatureHPLevelDivisor      = 1000.0
	CreatureDamageLevelExponent = 1
	CreatureDamageLevelDivisor  = 10.0
)

func CreatureHPLevelMultiplier(level int) float64 {
	if level <= 0 {
		return 1.0
	}
	m := math.Pow(float64(level), CreatureHPLevelExponent) / CreatureHPLevelDivisor
	if m < 1.0 {
		return 1.0
	}
	return m
}

func CreatureDamageLevelMultiplier(level int) float64 {
	if level <= 0 {
		return 1.0
	}
	m := math.Pow(float64(level), CreatureDamageLevelExponent) / CreatureDamageLevelDivisor
	if m < 1.0 {
		return 1.0
	}
	return m
}

type Profile struct {
	SeedHP, SeedMP     int
	SeedHit, SeedSpeed int

	Strength, Agility, Stamina, Intelligence, Energy                float64
	AptStrength, AptAgility, AptStamina, AptIntelligence, AptEnergy float64

	GrowthScale float64

	PropHit, PropDodge, PropSpeed, PropCritical float64
}

type Result struct {
	MaxHP, MaxMP, MaxSP         int
	Attack, Defense             int
	MagicAttack, MagicDefense   int
	Hit, Dodge, Speed, Critical int
}

func BuildBaseStats(p Profile) Result {
	scale := p.GrowthScale
	if scale <= 0 {
		scale = DefaultGrowthScale
	}

	effStr := (p.Strength + p.Strength*p.AptStrength/1000.0) * scale
	effAgi := (p.Agility + p.Agility*p.AptAgility/1000.0) * scale
	effStam := (p.Stamina + p.Stamina*p.AptStamina/1000.0) * scale
	effInt := (p.Intelligence + p.Intelligence*p.AptIntelligence/1000.0) * scale
	effEng := (p.Energy + p.Energy*p.AptEnergy/1000.0) * scale

	maxHP := p.SeedHP + int(effStam*CoeffHPFromStamina)
	maxMP := p.SeedMP + int(effInt*CoeffMPFromIntelligence) + int(effEng*CoeffMPFromEnergy)
	maxSP := FixedMaxSP

	attack := int(effStr*CoeffAttackFromStrength) + int(effAgi*CoeffAttackFromAgility)
	defense := int(effStam*CoeffDefenseFromStamina) + int(effAgi*CoeffDefenseFromAgility)
	magicAttack := int(effInt*CoeffMagicAttackFromInt) + int(effEng*CoeffMagicAttackFromEnergy)
	magicDefense := int(effInt*CoeffMagicDefenseFromInt) + int(effEng*CoeffMagicDefenseFromEnergy)

	hit := p.SeedHit + int(effStr*CoeffHitFromStrength) + int(effAgi*CoeffHitFromAgility) + int(p.PropHit)
	dodge := int(effAgi*CoeffDodgeFromAgility) + int(p.PropDodge)
	speed := p.SeedSpeed + int(effAgi*CoeffSpeedFromAgility) + int(p.PropSpeed)
	critical := int(effAgi*CoeffCriticalFromAgility) + int(p.PropCritical)

	return Result{
		MaxHP:        maxHP,
		MaxMP:        maxMP,
		MaxSP:        maxSP,
		Attack:       attack,
		Defense:      defense,
		MagicAttack:  magicAttack,
		MagicDefense: magicDefense,
		Hit:          hit,
		Dodge:        dodge,
		Speed:        speed,
		Critical:     critical,
	}
}

func ApplyLifePercent(maxHP int, lifePercent float64) int {
	if maxHP <= 0 {
		return maxHP
	}
	if lifePercent <= 0 {
		return maxHP
	}
	scaled := int(float64(maxHP) * lifePercent / 10000.0)
	if scaled < 1 {
		return 1
	}
	return scaled
}
