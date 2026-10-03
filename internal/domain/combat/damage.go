// Open-sourced by BaoLT

// Damage calculation utilities for combat system.
// Implements dodge, defense penetration, damage enhancement/reduction, critical hits.
// Supports counter-attack checks, EXP/money rewards, turn ordering, and target selection.
// Element advantage cycle (Wuxing): Metal(1)->Wood(4)->Earth(5)->Water(2)->Fire(3)->Metal(1).
package combat

import (
	"math"
	"math/rand"

	"mcgame-server/internal/domain/skill"
)

const (
	RowFront  = 0
	RowMiddle = 1
	RowBack   = 2

	FrontRowDamageBonus    = 1.1
	BackRowDamageReduction = 0.9
	MeleeBackRowPenalty    = 0.7
	RangedFrontRowPenalty  = 0.9

	MaxDodgeChance       = 0.5
	MaxCritChance        = 0.5
	MaxReduceHurtPercent = 0.75
	MaxResiDefyPercent   = 0.8
	MaxComboChance       = 0.25
	MaxCounterChance     = 0.30
	ComboDamageMulti     = 0.6
	CounterDamageMulti   = 0.5
	BaseCriticalDamage   = 150
)

type DamageResult struct {
	Damage           int
	IsCritical       bool
	IsMiss           bool
	IsBlocked        bool
	IsCounter        bool
	IsCombo          bool
	CounterDamage    int
	PositionModifier float64
}

func criticalDamageBonus(totalOrBonus int) int {
	if totalOrBonus >= BaseCriticalDamage {
		return totalOrBonus - BaseCriticalDamage
	}
	return totalOrBonus
}

func criticalDamageMultiplier(totalOrBonus int) float64 {
	return float64(BaseCriticalDamage) / 100.0 * (1.0 + float64(criticalDamageBonus(totalOrBonus))/100.0)
}

func CalculateDamage(attacker, defender *Participant, sk *skill.SkillTemplate) *DamageResult {
	result := &DamageResult{}

	dodgeChance := float64(defender.Dodge-attacker.Hit) / 100.0
	dodgeChance = clampFloat(dodgeChance, 0, MaxDodgeChance)

	if rand.Float64() < dodgeChance {
		result.IsMiss = true
		result.Damage = 0
		return result
	}

	isMagic := sk.SkillType == skill.SkillTypeMagic

	var baseDamage float64
	var defense float64
	if isMagic {
		baseDamage = float64(attacker.MagicAttack) * sk.Multiplier
		defense = float64(defender.MagicDefense)
	} else {
		baseDamage = float64(attacker.Attack) * sk.Multiplier
		defense = float64(defender.Defense)
	}
	baseDamage += float64(sk.BaseDamage)

	levelBonus := 1.0 + float64(attacker.Level)*0.02
	baseDamage *= levelBonus

	var penetration float64
	if isMagic {
		penetration = float64(attacker.PraMagDef) / 100.0
	} else {
		penetration = float64(attacker.PraDef) / 100.0
	}
	resiDefy := clampFloat(float64(defender.ResiDefy)/100.0, 0, MaxResiDefyPercent)
	effectivePen := penetration * (1.0 - resiDefy)

	effectiveDef := defense * (1.0 - effectivePen)
	if effectiveDef < 0 {
		effectiveDef = 0
	}

	c := 300.0 + float64(attacker.Level)*5.0
	reduction := c / (c + effectiveDef)
	damage := baseDamage * reduction

	if isMagic {
		enhPct := float64(attacker.EnhMagicHurt) / 100.0
		damage *= (1.0 + enhPct)
	} else {
		enhPct := float64(attacker.EnhPhyHurt) / 100.0
		damage *= (1.0 + enhPct)
	}

	if isMagic {
		redPct := clampFloat(float64(defender.ReduceHurt2)/100.0, 0, MaxReduceHurtPercent)
		damage *= (1.0 - redPct)
	} else {
		redPct := clampFloat(float64(defender.ReduceHurt1)/100.0, 0, MaxReduceHurtPercent)
		damage *= (1.0 - redPct)
	}

	critChance := float64(attacker.Critical) / 100.0
	critResist := float64(defender.ResiCritical) / 100.0
	effectiveCritChance := clampFloat(critChance-critResist, 0, MaxCritChance)

	if rand.Float64() < effectiveCritChance {
		result.IsCritical = true
		critMultiplier := criticalDamageMultiplier(attacker.CriticalDmg)
		damage *= critMultiplier
	}

	if damage < 1 {
		damage = 1
	}

	elemMod := getElementModifier(attacker.Element, defender.Element)
	damage *= elemMod

	variance := 0.9 + rand.Float64()*0.2
	damage *= variance

	result.Damage = int(math.Round(damage))
	return result
}

func CalculateCounterDamage(defender, attacker *Participant) *DamageResult {
	sk := &skill.SkillTemplate{
		ID:         1001,
		Name:       "Counter",
		SkillType:  skill.SkillTypePhysical,
		TargetType: skill.TargetTypeSingle,
		BaseDamage: 5,
		Multiplier: CounterDamageMulti,
		Range:      1,
	}
	return CalculateDamage(defender, attacker, sk)
}

func CheckCombo(attacker *Participant) bool {
	comboChance := clampFloat(float64(attacker.Combo)/100.0, 0, MaxComboChance)
	return rand.Float64() < comboChance
}

func CheckCounter(defender *Participant) bool {
	counterChance := clampFloat(float64(defender.Counter)/100.0, 0, MaxCounterChance)
	return rand.Float64() < counterChance
}

func CalculateHealing(caster *Participant, sk *skill.SkillTemplate) int {
	if sk.SkillType != skill.SkillTypeHeal {
		return 0
	}

	baseHeal := float64(sk.BaseDamage)
	bonus := float64(caster.MagicAttack) * sk.Multiplier
	heal := baseHeal + bonus

	levelBonus := 1.0 + float64(caster.Level)*0.01
	heal *= levelBonus

	variance := 0.9 + rand.Float64()*0.2
	heal *= variance

	return int(heal)
}

func CalculateExpReward(playerLevel int, enemies []*Participant) int64 {
	var totalExp int64

	for _, enemy := range enemies {
		if enemy.IsNPC && !enemy.IsAlive {
			baseExp := int64(enemy.Level * 10)
			if enemy.ExpReward > 0 {
				baseExp = int64(enemy.ExpReward)
			}

			levelDiff := enemy.Level - playerLevel
			var modifier float64
			if levelDiff > 0 {
				modifier = 1.0 + float64(levelDiff)*0.05
				if modifier > 1.5 {
					modifier = 1.5
				}
			} else if levelDiff < 0 {
				modifier = 1.0 + float64(levelDiff)*0.1
				if modifier < 0.1 {
					modifier = 0.1
				}
			} else {
				modifier = 1.0
			}

			totalExp += int64(float64(baseExp) * modifier)
		}
	}

	return totalExp
}

func CalculateMoneyReward(enemies []*Participant) int64 {
	var totalMoney int64

	for _, enemy := range enemies {
		if enemy.IsNPC && !enemy.IsAlive {
			totalMoney += int64(enemy.Level * 5)
		}
	}

	return totalMoney
}

func GetTurnOrder(participants []*Participant) []*Participant {
	alive := make([]*Participant, 0)
	for _, p := range participants {
		if p.IsAlive {
			alive = append(alive, p)
		}
	}

	for i := 0; i < len(alive)-1; i++ {
		for j := i + 1; j < len(alive); j++ {
			if alive[j].Speed > alive[i].Speed {
				alive[i], alive[j] = alive[j], alive[i]
			}
		}
	}

	return alive
}

func SelectRandomTarget(battle *Battle, side Side) *Participant {
	targets := battle.GetAliveParticipants(side)
	if len(targets) == 0 {
		return nil
	}
	return targets[rand.Intn(len(targets))]
}

func SelectWeakestTarget(battle *Battle, side Side) *Participant {
	targets := battle.GetAliveParticipants(side)
	if len(targets) == 0 {
		return nil
	}

	weakest := targets[0]
	for _, t := range targets[1:] {
		if t.CurrentHP < weakest.CurrentHP {
			weakest = t
		}
	}
	return weakest
}

func CalculateDamageWithPosition(attacker, defender *Participant, sk *skill.SkillTemplate, accuracyModifier ...float64) *DamageResult {
	accMod := 1.0
	if len(accuracyModifier) > 0 && accuracyModifier[0] > 0 {
		accMod = accuracyModifier[0]
	}

	result := CalculateDamageWithAccuracy(attacker, defender, sk, accMod)

	if result.IsMiss {
		return result
	}

	posModifier := getPositionModifier(attacker, defender, sk)
	result.PositionModifier = posModifier
	result.Damage = int(float64(result.Damage) * posModifier)

	if result.Damage < 1 {
		result.Damage = 1
	}

	return result
}

func CalculateDamageWithAccuracy(attacker, defender *Participant, sk *skill.SkillTemplate, accuracyModifier float64) *DamageResult {
	result := &DamageResult{}

	dodgeChance := float64(defender.Dodge-attacker.Hit) / 100.0
	if accuracyModifier < 1.0 && accuracyModifier > 0 {
		dodgeChance += (1.0 - accuracyModifier)
	}
	dodgeChance = clampFloat(dodgeChance, 0, MaxDodgeChance)

	if rand.Float64() < dodgeChance {
		result.IsMiss = true
		result.Damage = 0
		return result
	}

	isMagic := sk.SkillType == skill.SkillTypeMagic

	var baseDamage float64
	var defense float64
	if isMagic {
		baseDamage = float64(attacker.MagicAttack) * sk.Multiplier
		defense = float64(defender.MagicDefense)
	} else {
		baseDamage = float64(attacker.Attack) * sk.Multiplier
		defense = float64(defender.Defense)
	}
	baseDamage += float64(sk.BaseDamage)

	levelBonus := 1.0 + float64(attacker.Level)*0.02
	baseDamage *= levelBonus

	var penetration float64
	if isMagic {
		penetration = float64(attacker.PraMagDef) / 100.0
	} else {
		penetration = float64(attacker.PraDef) / 100.0
	}
	resiDefy := clampFloat(float64(defender.ResiDefy)/100.0, 0, MaxResiDefyPercent)
	effectivePen := penetration * (1.0 - resiDefy)

	effectiveDef := defense * (1.0 - effectivePen)
	if effectiveDef < 0 {
		effectiveDef = 0
	}

	c := 300.0 + float64(attacker.Level)*5.0
	reduction := c / (c + effectiveDef)
	damage := baseDamage * reduction

	if isMagic {
		enhPct := float64(attacker.EnhMagicHurt) / 100.0
		damage *= (1.0 + enhPct)
	} else {
		enhPct := float64(attacker.EnhPhyHurt) / 100.0
		damage *= (1.0 + enhPct)
	}

	if isMagic {
		redPct := clampFloat(float64(defender.ReduceHurt2)/100.0, 0, MaxReduceHurtPercent)
		damage *= (1.0 - redPct)
	} else {
		redPct := clampFloat(float64(defender.ReduceHurt1)/100.0, 0, MaxReduceHurtPercent)
		damage *= (1.0 - redPct)
	}

	critChance := float64(attacker.Critical) / 100.0
	critResist := float64(defender.ResiCritical) / 100.0
	effectiveCritChance := clampFloat(critChance-critResist, 0, MaxCritChance)

	if rand.Float64() < effectiveCritChance {
		result.IsCritical = true
		critMultiplier := criticalDamageMultiplier(attacker.CriticalDmg)
		damage *= critMultiplier
	}

	if damage < 1 {
		damage = 1
	}

	elemMod := getElementModifier(attacker.Element, defender.Element)
	damage *= elemMod

	variance := 0.9 + rand.Float64()*0.2
	damage *= variance

	result.Damage = int(math.Round(damage))
	return result
}

func getPositionModifier(attacker, defender *Participant, sk *skill.SkillTemplate) float64 {
	modifier := 1.0

	attackerRow := GetRowForSide(attacker.Position, attacker.Side)
	defenderRow := GetRowForSide(defender.Position, defender.Side)

	if attackerRow == RowFront {
		modifier *= FrontRowDamageBonus
	}

	isRanged := sk != nil && sk.Range > 1
	isMelee := !isRanged

	if defenderRow == RowBack {
		if isMelee {
			modifier *= MeleeBackRowPenalty
		} else {
			modifier *= BackRowDamageReduction
		}
	}

	if isRanged && defenderRow == RowFront {
		modifier *= RangedFrontRowPenalty
	}

	return modifier
}

func getRow(position int) int {
	_, y := PositionToGridCoords(position)
	if y == 0 {
		return RowFront
	} else if y >= BattleGridHeight-1 {
		return RowBack
	}
	return RowMiddle
}

func GetRowForSide(position int, side Side) int {
	_, y := PositionToGridCoords(position)

	if side == SidePlayer {
		if y == 0 {
			return RowFront
		} else if y >= BattleGridHeight-1 {
			return RowBack
		}
		return RowMiddle
	}

	if y == BattleGridHeight-1 {
		return RowFront
	} else if y == 0 {
		return RowBack
	}
	return RowMiddle
}

func AssignBattlePositions(battle *Battle) {
	playerPositions := []int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
	enemyPositions := []int{10, 11, 12, 13, 14, 15, 16, 17, 18, 19}

	playerIdx := 0
	enemyIdx := 0

	for _, p := range battle.Participants {
		if p.Side == SidePlayer {
			if playerIdx < len(playerPositions) {
				p.Position = playerPositions[playerIdx]
				playerIdx++
			}
		} else {
			if enemyIdx < len(enemyPositions) {
				p.Position = enemyPositions[enemyIdx]
				enemyIdx++
			}
		}
	}
}

func GetFrontlineParticipants(battle *Battle, side Side) []*Participant {
	result := make([]*Participant, 0)
	for _, p := range battle.Participants {
		if p.Side != side || !p.IsAlive {
			continue
		}
		if GetRowForSide(p.Position, side) == RowFront {
			result = append(result, p)
		}
	}
	return result
}

func SelectFrontlineTarget(battle *Battle, side Side) *Participant {
	frontline := GetFrontlineParticipants(battle, side)
	if len(frontline) > 0 {
		return frontline[rand.Intn(len(frontline))]
	}
	return SelectRandomTarget(battle, side)
}

var elementAdvantage = map[[2]int]float64{
	{1, 4}: 1.25,
	{4, 5}: 1.25,
	{5, 2}: 1.25,
	{2, 3}: 1.25,
	{3, 1}: 1.25,

	{4, 1}: 0.75,
	{5, 4}: 0.75,
	{2, 5}: 0.75,
	{3, 2}: 0.75,
	{1, 3}: 0.75,
}

func getElementModifier(attackerElement, defenderElement int) float64 {
	if attackerElement == defenderElement || attackerElement == 0 || defenderElement == 0 {
		return 1.0
	}
	if mod, ok := elementAdvantage[[2]int{attackerElement, defenderElement}]; ok {
		return mod
	}
	return 1.0
}

func clampFloat(v, min, max float64) float64 {
	if v < min {
		return min
	}
	if v > max {
		return max
	}
	return v
}
