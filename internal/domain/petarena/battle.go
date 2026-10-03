// Open-sourced by BaoLT

// Battle simulation for pet arena combat.
// Implements turn-based combat with speed-based initiative.
// Uses Elo rating system for matchmaking balance.
package petarena

import (
	"math"
	"math/rand"
	"time"

	"github.com/google/uuid"
	"mcgame-server/internal/domain/pet"
)

type BattleRound struct {
	Round          int
	AttackerAction string
	DefenderAction string
	AttackerDamage int
	DefenderDamage int
	AttackerHP     int
	DefenderHP     int
	IsCritical     bool
	SkillUsed      int
}

func (r *BattleRound) ToDTO() map[string]interface{} {
	return map[string]interface{}{
		"round":          r.Round,
		"attackerAction": r.AttackerAction,
		"defenderAction": r.DefenderAction,
		"attackerDamage": r.AttackerDamage,
		"defenderDamage": r.DefenderDamage,
		"attackerHP":     r.AttackerHP,
		"defenderHP":     r.DefenderHP,
		"isCritical":     r.IsCritical,
		"skillUsed":      r.SkillUsed,
	}
}

type BattleResult struct {
	WinnerID          uuid.UUID
	AttackerWon       bool
	Rounds            []BattleRound
	AttackerRatingChange int
	DefenderRatingChange int
	TotalDamageDealt  int
	TotalDamageTaken  int
}

type BattleSimulator struct {
	rng *rand.Rand
}

func NewBattleSimulator() *BattleSimulator {
	return &BattleSimulator{
		rng: rand.New(rand.NewSource(time.Now().UnixNano())),
	}
}

func (s *BattleSimulator) SimulateBattle(attacker, defender *pet.Pet, attackerRating, defenderRating int) *BattleResult {
	attackerStats := attacker.GetCombatStats()
	defenderStats := defender.GetCombatStats()

	attackerHP := attacker.MaxHP
	defenderHP := defender.MaxHP

	rounds := []BattleRound{}
	maxRounds := 20

	totalDamageDealt := 0
	totalDamageTaken := 0

	for round := 1; round <= maxRounds && attackerHP > 0 && defenderHP > 0; round++ {
		roundResult := BattleRound{
			Round: round,
		}

		attackerFirst := attackerStats["speed"] >= defenderStats["speed"]
		if attackerStats["speed"] == defenderStats["speed"] {
			attackerFirst = s.rng.Intn(2) == 0
		}

		if attackerFirst {
			damage, action, isCrit := s.calculateDamage(attackerStats, defenderStats, attacker)
			defenderHP -= damage
			roundResult.AttackerDamage = damage
			roundResult.AttackerAction = action
			roundResult.IsCritical = isCrit
			totalDamageDealt += damage

			if defenderHP > 0 {
				damage, action, _ := s.calculateDamage(defenderStats, attackerStats, defender)
				attackerHP -= damage
				roundResult.DefenderDamage = damage
				roundResult.DefenderAction = action
				totalDamageTaken += damage
			} else {
				roundResult.DefenderAction = "defeated"
			}
		} else {
			damage, action, _ := s.calculateDamage(defenderStats, attackerStats, defender)
			attackerHP -= damage
			roundResult.DefenderDamage = damage
			roundResult.DefenderAction = action
			totalDamageTaken += damage

			if attackerHP > 0 {
				damage, action, isCrit := s.calculateDamage(attackerStats, defenderStats, attacker)
				defenderHP -= damage
				roundResult.AttackerDamage = damage
				roundResult.AttackerAction = action
				roundResult.IsCritical = isCrit
				totalDamageDealt += damage
			} else {
				roundResult.AttackerAction = "defeated"
			}
		}

		roundResult.AttackerHP = max(attackerHP, 0)
		roundResult.DefenderHP = max(defenderHP, 0)
		rounds = append(rounds, roundResult)
	}

	attackerWon := defenderHP <= 0 || (attackerHP > 0 && attackerHP >= defenderHP)

	ratingChange := s.calculateRatingChange(attackerRating, defenderRating, attackerWon)

	result := &BattleResult{
		AttackerWon:          attackerWon,
		Rounds:               rounds,
		AttackerRatingChange: ratingChange,
		DefenderRatingChange: ratingChange,
		TotalDamageDealt:     totalDamageDealt,
		TotalDamageTaken:     totalDamageTaken,
	}

	return result
}

func (s *BattleSimulator) calculateDamage(attacker, defender map[string]int, pet *pet.Pet) (int, string, bool) {
	hitChance := float64(attacker["hit"]) / float64(attacker["hit"]+defender["dodge"]) * 100
	if s.rng.Float64()*100 > hitChance {
		return 0, "miss", false
	}

	attack := attacker["attack"]
	defense := defender["defense"]

	useMagic := s.rng.Intn(2) == 0
	if useMagic {
		attack = attacker["magicAttack"]
		defense = defender["magicDefense"]
	}

	damage := attack - defense/2
	if damage < 1 {
		damage = 1
	}

	variance := 0.8 + s.rng.Float64()*0.4
	damage = int(float64(damage) * variance)

	isCritical := s.rng.Intn(100) < attacker["critical"]
	if isCritical {
		damage = int(float64(damage) * 1.5)
	}

	action := "attack"
	if useMagic {
		action = "magicAttack"
	}

	return damage, action, isCritical
}

func (s *BattleSimulator) calculateRatingChange(attackerRating, defenderRating int, attackerWon bool) int {
	config := DefaultArenaConfig()

	expectedScore := 1.0 / (1.0 + math.Pow(10, float64(defenderRating-attackerRating)/400))

	actualScore := 0.0
	if attackerWon {
		actualScore = 1.0
	}

	ratingChange := int(float64(config.RatingKFactor) * (actualScore - expectedScore))

	if ratingChange == 0 {
		if attackerWon {
			ratingChange = 1
		} else {
			ratingChange = -1
		}
	}

	return int(math.Abs(float64(ratingChange)))
}

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}
