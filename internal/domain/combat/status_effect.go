// Open-sourced by BaoLT

// Status effect system for battle participants.
// Defines effect types, their behaviors, and tick processing.
// Matches client-side status effect constants from Battle.as.
package combat

import (
	"math/rand"
)

type StatusEffectType int

const (
	StatusNormal    StatusEffectType = 0
	StatusDefence   StatusEffectType = 1
	StatusDizzy     StatusEffectType = 10
	StatusConfusion StatusEffectType = 20
	StatusSleep     StatusEffectType = 30
	StatusPoison    StatusEffectType = 40
	StatusFire      StatusEffectType = 50
	StatusIce       StatusEffectType = 60
	StatusLight     StatusEffectType = 70
	StatusSilence   StatusEffectType = 80
	StatusRebellion StatusEffectType = 90
	StatusStone     StatusEffectType = 100
)

type StatusEffect struct {
	Type       StatusEffectType
	Duration   int
	Power      int
	SourceID   string
	StackCount int
}

func NewStatusEffect(effectType StatusEffectType, duration int, power int, sourceID string) *StatusEffect {
	return &StatusEffect{
		Type:       effectType,
		Duration:   duration,
		Power:      power,
		SourceID:   sourceID,
		StackCount: 1,
	}
}

func (e *StatusEffect) Tick() bool {
	e.Duration--
	return e.Duration <= 0
}

func (e *StatusEffect) IsExpired() bool {
	return e.Duration <= 0
}

func (e *StatusEffect) CanAct() bool {
	switch e.Type {
	case StatusDizzy, StatusSleep, StatusStone:
		return false
	default:
		return true
	}
}

func (e *StatusEffect) CanUseSkill() bool {
	switch e.Type {
	case StatusDizzy, StatusSleep, StatusStone, StatusSilence:
		return false
	default:
		return true
	}
}

func (e *StatusEffect) GetDamageOverTime(maxHP int) int {
	switch e.Type {
	case StatusPoison:
		return maxHP * 5 / 100
	case StatusFire:
		return e.Power
	default:
		return 0
	}
}

func (e *StatusEffect) GetSpeedModifier() float64 {
	switch e.Type {
	case StatusIce:
		return 0.5
	default:
		return 1.0
	}
}

func (e *StatusEffect) GetAccuracyModifier() float64 {
	switch e.Type {
	case StatusLight:
		return 0.7
	default:
		return 1.0
	}
}

func (e *StatusEffect) ToDTO() map[string]interface{} {
	return map[string]interface{}{
		"type":     int(e.Type),
		"duration": e.Duration,
		"power":    e.Power,
		"stacks":   e.StackCount,
	}
}

type StatusEffectManager struct {
	effects map[string][]*StatusEffect
}

func NewStatusEffectManager() *StatusEffectManager {
	return &StatusEffectManager{
		effects: make(map[string][]*StatusEffect),
	}
}

func (m *StatusEffectManager) AddEffect(participantID string, effect *StatusEffect) {
	existing := m.effects[participantID]

	for _, e := range existing {
		if e.Type == effect.Type {
			if effect.Duration > e.Duration {
				e.Duration = effect.Duration
			}
			if effect.Power > e.Power {
				e.Power = effect.Power
			}
			e.StackCount++
			return
		}
	}

	m.effects[participantID] = append(existing, effect)
}

func (m *StatusEffectManager) RemoveEffect(participantID string, effectType StatusEffectType) {
	existing := m.effects[participantID]
	filtered := make([]*StatusEffect, 0)

	for _, e := range existing {
		if e.Type != effectType {
			filtered = append(filtered, e)
		}
	}

	m.effects[participantID] = filtered
}

func (m *StatusEffectManager) ClearEffects(participantID string) {
	delete(m.effects, participantID)
}

func (m *StatusEffectManager) GetEffects(participantID string) []*StatusEffect {
	return m.effects[participantID]
}

func (m *StatusEffectManager) HasEffect(participantID string, effectType StatusEffectType) bool {
	for _, e := range m.effects[participantID] {
		if e.Type == effectType {
			return true
		}
	}
	return false
}

func (m *StatusEffectManager) CanAct(participantID string) bool {
	for _, e := range m.effects[participantID] {
		if !e.CanAct() {
			return false
		}
	}
	return true
}

func (m *StatusEffectManager) CanUseSkill(participantID string) bool {
	for _, e := range m.effects[participantID] {
		if !e.CanUseSkill() {
			return false
		}
	}
	return true
}

func (m *StatusEffectManager) GetSpeedModifier(participantID string) float64 {
	modifier := 1.0
	for _, e := range m.effects[participantID] {
		modifier *= e.GetSpeedModifier()
	}
	return modifier
}

func (m *StatusEffectManager) GetAccuracyModifier(participantID string) float64 {
	modifier := 1.0
	for _, e := range m.effects[participantID] {
		modifier *= e.GetAccuracyModifier()
	}
	return modifier
}

func (m *StatusEffectManager) ProcessTurnStart(participantID string, p *Participant) *TurnStartResult {
	result := &TurnStartResult{
		CanAct:       true,
		CanUseSkills: true,
		DamageTaken:  0,
		WokeUp:       false,
	}

	effects := m.effects[participantID]
	remaining := make([]*StatusEffect, 0)

	for _, e := range effects {
		if !e.CanAct() {
			result.CanAct = false
			result.BlockingEffect = e.Type
		}
		if !e.CanUseSkill() {
			result.CanUseSkills = false
		}

		dot := e.GetDamageOverTime(p.MaxHP)
		if dot > 0 {
			result.DamageTaken += dot
		}

		result.SpeedModifier *= e.GetSpeedModifier()
		result.AccuracyModifier *= e.GetAccuracyModifier()

		if !e.Tick() {
			remaining = append(remaining, e)
		}
	}

	m.effects[participantID] = remaining
	return result
}

func (m *StatusEffectManager) OnDamageTaken(participantID string, damage int) bool {
	effects := m.effects[participantID]
	wokeUp := false

	for _, e := range effects {
		if e.Type == StatusSleep && damage > 0 {
			e.Duration = 0
			wokeUp = true
		}
	}

	if wokeUp {
		m.RemoveEffect(participantID, StatusSleep)
	}

	return wokeUp
}

func (m *StatusEffectManager) GetConfusionTarget(battle *Battle, actorID string, intendedTargetID string) string {
	if !m.HasEffect(actorID, StatusConfusion) {
		return intendedTargetID
	}

	if rand.Float64() < 0.5 {
		actor := battle.GetParticipant(actorID)
		if actor != nil {
			allies := battle.GetAliveParticipants(actor.Side)
			if len(allies) > 0 {
				return allies[rand.Intn(len(allies))].ID
			}
		}
	}

	return intendedTargetID
}

func (m *StatusEffectManager) GetRebellionTarget(battle *Battle, actorID string, intendedTargetID string) string {
	if !m.HasEffect(actorID, StatusRebellion) {
		return intendedTargetID
	}

	allAlive := make([]*Participant, 0)
	for _, p := range battle.Participants {
		if p.IsAlive && p.ID != actorID {
			allAlive = append(allAlive, p)
		}
	}

	if len(allAlive) > 0 {
		return allAlive[rand.Intn(len(allAlive))].ID
	}

	return intendedTargetID
}

func (m *StatusEffectManager) GetAllEffectsDTO() map[string][]map[string]interface{} {
	result := make(map[string][]map[string]interface{})

	for pid, effects := range m.effects {
		dtos := make([]map[string]interface{}, len(effects))
		for i, e := range effects {
			dtos[i] = e.ToDTO()
		}
		result[pid] = dtos
	}

	return result
}

type TurnStartResult struct {
	CanAct           bool
	CanUseSkills     bool
	DamageTaken      int
	WokeUp           bool
	BlockingEffect   StatusEffectType
	SpeedModifier    float64
	AccuracyModifier float64
}

func NewTurnStartResult() *TurnStartResult {
	return &TurnStartResult{
		CanAct:           true,
		CanUseSkills:     true,
		SpeedModifier:    1.0,
		AccuracyModifier: 1.0,
	}
}

func GetStatusEffectName(effectType StatusEffectType) string {
	switch effectType {
	case StatusNormal:
		return "Normal"
	case StatusDefence:
		return "Defending"
	case StatusDizzy:
		return "Stunned"
	case StatusConfusion:
		return "Confused"
	case StatusSleep:
		return "Asleep"
	case StatusPoison:
		return "Poisoned"
	case StatusFire:
		return "Burning"
	case StatusIce:
		return "Frozen"
	case StatusLight:
		return "Blinded"
	case StatusSilence:
		return "Silenced"
	case StatusRebellion:
		return "Berserk"
	case StatusStone:
		return "Petrified"
	default:
		return "Unknown"
	}
}
