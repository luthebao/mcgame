// Open-sourced by BaoLT

// Pet equipment bonuses persist equipped item ids and apply their stat bonuses to the final pet sheet.
package pet

import (
	"fmt"
	"strconv"
)

const (
	TotalPetEquipmentSlots = 8
	MaxPetEquipmentGroups  = 25
)

type EquipmentStatBonuses struct {
	Flat    map[int]int
	Percent map[int]int
	Float   map[int]float64
}

func NewEquipmentStatBonuses() EquipmentStatBonuses {
	return EquipmentStatBonuses{
		Flat:    make(map[int]int),
		Percent: make(map[int]int),
		Float:   make(map[int]float64),
	}
}

func (b *EquipmentStatBonuses) AddFlat(propType, value int) {
	if b == nil || propType <= 0 || value == 0 {
		return
	}
	if b.Flat == nil {
		b.Flat = make(map[int]int)
	}
	b.Flat[propType] += value
}

func (b *EquipmentStatBonuses) AddPercent(propType, value int) {
	if b == nil || propType <= 0 || value == 0 {
		return
	}
	if b.Percent == nil {
		b.Percent = make(map[int]int)
	}
	b.Percent[propType] += value
}

func (b *EquipmentStatBonuses) AddFloat(propType int, value float64) {
	if b == nil || propType <= 0 || value == 0 {
		return
	}
	if b.Float == nil {
		b.Float = make(map[int]float64)
	}
	b.Float[propType] += value
}

func (b EquipmentStatBonuses) IsZero() bool {
	return len(b.Flat) == 0 && len(b.Percent) == 0 && len(b.Float) == 0
}

func (p *Pet) SetEquipmentBonuses(bonuses EquipmentStatBonuses) {
	p.equipmentBonuses = bonuses
}

func (p *Pet) EquipmentBonuses() EquipmentStatBonuses {
	if p == nil {
		return NewEquipmentStatBonuses()
	}
	return p.equipmentBonuses
}

func (p *Pet) applyEquipmentBonuses() {
	if p == nil || p.equipmentBonuses.IsZero() {
		return
	}
	if p.Property == nil {
		p.Property = make(map[string]interface{})
	}

	p.applyEquipmentFlatBonuses(p.equipmentBonuses.Flat)
	p.applyEquipmentFloatBonuses(p.equipmentBonuses.Float)
	p.applyEquipmentPercentBonuses(p.equipmentBonuses.Percent)
}

func (p *Pet) applyEquipmentFlatBonuses(flat map[int]int) {
	if len(flat) == 0 {
		return
	}

	p.MaxHP += flat[1]
	p.MaxMP += flat[2]

	p.Property["finalHp"] = p.MaxHP
	p.Property["finalMp"] = p.MaxMP
	p.Property["finalAttack"] = petCombatStatIntValue(p.Property, "finalAttack") + flat[4]
	p.Property["finalMAttack"] = petCombatStatIntValue(p.Property, "finalMAttack") + flat[5]
	p.Property["finalDefence"] = petCombatStatIntValue(p.Property, "finalDefence") + flat[6]
	p.Property["finalMDefence"] = petCombatStatIntValue(p.Property, "finalMDefence") + flat[7]
	p.Property["finalHit"] = petCombatStatIntValue(p.Property, "finalHit") + flat[8]
	p.Property["finalDodge"] = petCombatStatIntValue(p.Property, "finalDodge") + flat[9]
	p.Property["finalSpeed"] = petCombatStatIntValue(p.Property, "finalSpeed") + flat[11]
	p.Property["finalCombo"] = roundedIntValue(petStatNumberValue(p.Property["finalCombo"]) + float64(flat[12]))
	p.Property["finalCritical"] = roundedIntValue(petStatNumberValue(p.Property["finalCritical"]) + float64(flat[13]))
	p.Property["finalPraDef"] = roundedIntValue(petStatNumberValue(p.Property["finalPraDef"]) + float64(flat[14]))
	p.Property["finalReduceHurt1"] = roundedIntValue(petStatNumberValue(p.Property["finalReduceHurt1"]) + float64(flat[15]))
	p.Property["finalReduceHurt2"] = roundedIntValue(petStatNumberValue(p.Property["finalReduceHurt2"]) + float64(flat[16]))
	p.Property["finalResiDizzy"] = roundedIntValue(petStatNumberValue(p.Property["finalResiDizzy"]) + float64(flat[17]))
	p.Property["finalResiConfusion"] = roundedIntValue(petStatNumberValue(p.Property["finalResiConfusion"]) + float64(flat[18]))
	p.Property["finalResiSleep"] = roundedIntValue(petStatNumberValue(p.Property["finalResiSleep"]) + float64(flat[19]))
	p.Property["finalRebornRate"] = roundedIntValue(petStatNumberValue(p.Property["finalRebornRate"]) + float64(flat[34]))

	if expBonus := flat[25]; expBonus != 0 {
		p.Property["petBattleExpPct"] = expBonus
	} else {
		delete(p.Property, "petBattleExpPct")
	}
}

func (p *Pet) applyEquipmentFloatBonuses(float map[int]float64) {
	if len(float) == 0 {
		return
	}

	for propID, value := range float {
		key := petFloatPropertyKey(propID)
		if key == "" {
			continue
		}
		p.Property[key] = petStatNumberValue(p.Property[key]) + value
	}
}

func (p *Pet) applyEquipmentPercentBonuses(percent map[int]int) {
	if len(percent) == 0 {
		return
	}

	if pct := percent[1]; pct != 0 {
		p.MaxHP = applyPetPct(p.MaxHP, pct)
		p.Property["finalHp"] = p.MaxHP
	}
	if pct := percent[2]; pct != 0 {
		p.MaxMP = applyPetPct(p.MaxMP, pct)
		p.Property["finalMp"] = p.MaxMP
	}
	if pct := percent[4]; pct != 0 {
		p.Property["finalAttack"] = applyPetPct(petCombatStatIntValue(p.Property, "finalAttack"), pct)
	}
	if pct := percent[5]; pct != 0 {
		p.Property["finalMAttack"] = applyPetPct(petCombatStatIntValue(p.Property, "finalMAttack"), pct)
	}
	if pct := percent[6]; pct != 0 {
		p.Property["finalDefence"] = applyPetPct(petCombatStatIntValue(p.Property, "finalDefence"), pct)
	}
	if pct := percent[7]; pct != 0 {
		p.Property["finalMDefence"] = applyPetPct(petCombatStatIntValue(p.Property, "finalMDefence"), pct)
	}
	if pct := percent[11]; pct != 0 {
		p.Property["finalSpeed"] = applyPetPct(petCombatStatIntValue(p.Property, "finalSpeed"), pct)
	}
}

func applyPetPct(base, pct int) int {
	return base + (base * pct / 100)
}

func petFloatPropertyKey(propID int) string {
	switch propID {
	case 14:
		return "finalDefy"
	case 26:
		return "finalCriticalDamage"
	case 27:
		return "finalResiCritical"
	case 28:
		return "finalDebuffSuccRate"
	case 29:
		return "finalResiDefy"
	case 30:
		return "finalEnhPhyHurt"
	case 31:
		return "finalEnhMagicHurt"
	case 32:
		return "finalBreakReborn"
	default:
		return ""
	}
}

func (p *Pet) EquipmentItemID(slot int) int64 {
	if slot < 1 || slot > TotalPetEquipmentSlots {
		return 0
	}
	if p == nil || p.Property == nil {
		return 0
	}

	value, ok := parsePetEquipmentValue(p.Property[petEquipmentSlotKey(slot)])
	if !ok || value <= 0 {
		return 0
	}

	return value
}

func (p *Pet) SetEquipmentItemID(slot int, itemID int64) {
	if p == nil || slot < 1 || slot > TotalPetEquipmentSlots {
		return
	}
	if p.Property == nil {
		p.Property = make(map[string]interface{})
	}
	p.Property[petEquipmentSlotKey(slot)] = itemID
}

func (p *Pet) EquipmentGroup() (int, bool) {
	if p == nil || p.Property == nil {
		return 0, false
	}
	value, ok := parsePetEquipmentGroupValue(p.Property["equipGroup"])
	if !ok || value < 0 || value >= MaxPetEquipmentGroups {
		return 0, false
	}
	return value, true
}

func (p *Pet) SetEquipmentGroup(group int) {
	if p == nil {
		return
	}
	if p.Property == nil {
		p.Property = make(map[string]interface{})
	}
	p.Property["equipGroup"] = group
}

func (p *Pet) HasEquippedItems() bool {
	for slot := 1; slot <= TotalPetEquipmentSlots; slot++ {
		if p.EquipmentItemID(slot) > 0 {
			return true
		}
	}
	return false
}

func petEquipmentSlotKey(slot int) string {
	return fmt.Sprintf("equ%d", slot)
}

func parsePetEquipmentValue(value interface{}) (int64, bool) {
	switch typed := value.(type) {
	case int:
		return int64(typed), true
	case int32:
		return int64(typed), true
	case int64:
		return typed, true
	case float32:
		return int64(typed), true
	case float64:
		return int64(typed), true
	case string:
		if typed == "" {
			return 0, false
		}
		parsed, err := strconv.ParseInt(typed, 10, 64)
		if err != nil {
			return 0, false
		}
		return parsed, true
	default:
		return 0, false
	}
}

func parsePetEquipmentGroupValue(value interface{}) (int, bool) {
	parsed, ok := parsePetEquipmentValue(value)
	if !ok {
		return 0, false
	}
	return int(parsed), true
}
