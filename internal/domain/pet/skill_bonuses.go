// Open-sourced by BaoLT

package pet

import (
	"fmt"
	"math"
	"strconv"
)

const (
	DefaultPetSkillSlots = 5
	TotalPetSkillSlots   = 15
)

type SkillStatBonuses struct {
	Scaled map[int]float64
	Direct map[int]float64
}

func NewSkillStatBonuses() SkillStatBonuses {
	return SkillStatBonuses{
		Scaled: make(map[int]float64),
		Direct: make(map[int]float64),
	}
}

func (b *SkillStatBonuses) AddScaled(propID int, value float64) {
	if b == nil || propID <= 0 || value == 0 {
		return
	}
	if b.Scaled == nil {
		b.Scaled = make(map[int]float64)
	}
	b.Scaled[propID] += value
}

func (b *SkillStatBonuses) AddDirect(propID int, value float64) {
	if b == nil || propID <= 0 || value == 0 {
		return
	}
	if b.Direct == nil {
		b.Direct = make(map[int]float64)
	}
	b.Direct[propID] += value
}

func (b SkillStatBonuses) IsZero() bool {
	return len(b.Scaled) == 0 && len(b.Direct) == 0
}

func (p *Pet) SetSkillBonuses(bonuses SkillStatBonuses) {
	p.skillBonuses = bonuses
}

func (p *Pet) SkillBonuses() SkillStatBonuses {
	if p == nil {
		return NewSkillStatBonuses()
	}
	return p.skillBonuses
}

func (p *Pet) applySkillBonuses() {
	if p == nil || p.skillBonuses.IsZero() {
		return
	}
	if p.Property == nil {
		p.Property = make(map[string]interface{})
	}

	p.MaxHP = applySkillScaledBonus(p.MaxHP, p.skillBonuses.Direct[1], p.skillBonuses.Scaled[1])
	p.MaxMP = applySkillScaledBonus(p.MaxMP, p.skillBonuses.Direct[2], p.skillBonuses.Scaled[2])

	p.Property["finalHp"] = p.MaxHP
	p.Property["finalMp"] = p.MaxMP
	p.Property["finalAttack"] = applySkillScaledBonus(petCombatStatIntValue(p.Property, "finalAttack"), p.skillBonuses.Direct[4], p.skillBonuses.Scaled[4])
	p.Property["finalMAttack"] = applySkillScaledBonus(petCombatStatIntValue(p.Property, "finalMAttack"), p.skillBonuses.Direct[5], p.skillBonuses.Scaled[5])
	p.Property["finalDefence"] = applySkillScaledBonus(petCombatStatIntValue(p.Property, "finalDefence"), p.skillBonuses.Direct[6], p.skillBonuses.Scaled[6])
	p.Property["finalMDefence"] = applySkillScaledBonus(petCombatStatIntValue(p.Property, "finalMDefence"), p.skillBonuses.Direct[7], p.skillBonuses.Scaled[7])
	p.Property["finalHit"] = applySkillScaledBonus(petCombatStatIntValue(p.Property, "finalHit"), p.skillBonuses.Direct[8], p.skillBonuses.Scaled[8])
	p.Property["finalDodge"] = applySkillScaledBonus(petCombatStatIntValue(p.Property, "finalDodge"), p.skillBonuses.Direct[9], p.skillBonuses.Scaled[9])
	p.Property["finalSpeed"] = applySkillScaledBonus(petCombatStatIntValue(p.Property, "finalSpeed"), p.skillBonuses.Direct[11], p.skillBonuses.Scaled[11])
	p.Property["finalCounter"] = roundedIntValue(petStatNumberValue(p.Property["finalCounter"]) + p.skillBonuses.Direct[10])
	p.Property["finalCombo"] = roundedIntValue(petStatNumberValue(p.Property["finalCombo"]) + p.skillBonuses.Direct[12])
	p.Property["finalCritical"] = roundedIntValue(petStatNumberValue(p.Property["finalCritical"]) + p.skillBonuses.Direct[13])
	p.Property["finalPraDef"] = roundedIntValue(petStatNumberValue(p.Property["finalPraDef"]) + p.skillBonuses.Direct[14])
	p.Property["finalReduceHurt1"] = roundedIntValue(petStatNumberValue(p.Property["finalReduceHurt1"]) + p.skillBonuses.Direct[15])
	p.Property["finalReduceHurt2"] = roundedIntValue(petStatNumberValue(p.Property["finalReduceHurt2"]) + p.skillBonuses.Direct[16])
	p.Property["finalResiDizzy"] = roundedIntValue(petStatNumberValue(p.Property["finalResiDizzy"]) + p.skillBonuses.Direct[17])
	p.Property["finalResiConfusion"] = roundedIntValue(petStatNumberValue(p.Property["finalResiConfusion"]) + p.skillBonuses.Direct[18])
	p.Property["finalResiSleep"] = roundedIntValue(petStatNumberValue(p.Property["finalResiSleep"]) + p.skillBonuses.Direct[19])
	p.Property["finalRebornRate"] = roundedIntValue(petStatNumberValue(p.Property["finalRebornRate"]) + p.skillBonuses.Direct[34])

	if expBonus := p.skillBonuses.Direct[25]; expBonus != 0 {
		p.Property["petBattleExpPct"] = roundedIntValue(expBonus)
	} else {
		delete(p.Property, "petBattleExpPct")
	}
}

func (p *Pet) SkillSlotValue(slot int) int {
	if slot < 1 || slot > TotalPetSkillSlots {
		return 0
	}
	if p == nil || p.Property == nil {
		return defaultPetSkillSlotValue(slot)
	}

	value, ok := parsePetSkillSlotValue(p.Property[petSkillSlotKey(slot)])
	if !ok {
		return defaultPetSkillSlotValue(slot)
	}
	if slot <= DefaultPetSkillSlots && value < 0 {
		return 0
	}
	if slot > DefaultPetSkillSlots && value < 0 {
		return -1
	}

	return value
}

func (p *Pet) LearnedSkillSlots() []PetSkill {
	skills := make([]PetSkill, 0, TotalPetSkillSlots)
	for slot := 1; slot <= TotalPetSkillSlots; slot++ {
		skillID := p.SkillSlotValue(slot)
		if skillID <= 0 {
			continue
		}
		skills = append(skills, PetSkill{
			ID:    skillID,
			Level: 1,
			Slot:  slot,
		})
	}

	return skills
}

func petSkillSlotKey(slot int) string {
	return fmt.Sprintf("skill%d", slot)
}

func defaultPetSkillSlotValue(slot int) int {
	if slot <= DefaultPetSkillSlots {
		return 0
	}
	return -1
}

func parsePetSkillSlotValue(value interface{}) (int, bool) {
	switch typed := value.(type) {
	case int:
		return typed, true
	case int32:
		return int(typed), true
	case int64:
		return int(typed), true
	case float64:
		return int(typed), true
	case float32:
		return int(typed), true
	case string:
		if typed == "" {
			return 0, false
		}
		parsed, err := strconv.Atoi(typed)
		if err != nil {
			return 0, false
		}
		return parsed, true
	default:
		return 0, false
	}
}

func applySkillScaledBonus(base int, direct, scaled float64) int {
	value := float64(base) + direct
	value += value * scaled / 100
	return roundedIntValue(value)
}

func roundedIntValue(value float64) int {
	return int(math.Round(value))
}

func petStatNumberValue(value interface{}) float64 {
	switch typed := value.(type) {
	case int:
		return float64(typed)
	case int32:
		return float64(typed)
	case int64:
		return float64(typed)
	case float32:
		return float64(typed)
	case float64:
		return typed
	case string:
		parsed, err := strconv.ParseFloat(typed, 64)
		if err != nil {
			return 0
		}
		return parsed
	default:
		return 0
	}
}

func petCombatStatIntValue(props map[string]interface{}, key string) int {
	if props == nil {
		return 0
	}
	return roundedIntValue(petStatNumberValue(props[key]))
}
