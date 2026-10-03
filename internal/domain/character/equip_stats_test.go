// Open-sourced by BaoLT

package character

import "testing"

func TestEquipmentPropToStat_UsesClientEquipmentMap(t *testing.T) {
	if got := EquipmentPropToStat(21); got != PropStamina {
		t.Fatalf("EquipmentPropToStat(21) = %d, want PropStamina", got)
	}
	if got := EquipmentPropToStat(14); got != PropDefy {
		t.Fatalf("EquipmentPropToStat(14) = %d, want PropDefy", got)
	}
}

func TestApplyEquipmentBonuses_RecalculatesAttributesAndFinalRates(t *testing.T) {
	char := &Character{
		Strength:     20,
		Agility:      15,
		Stamina:      18,
		Intelligence: 12,
		Spirit:       10,
	}
	char.RecalculateStats()
	baseHP := char.MaxHP

	bonuses := NewEquipmentStatBonuses()
	bonuses.AddFlat(PropStamina, 5)
	bonuses.AddFloat(PropDefy, 4)
	bonuses.AddFloat(PropFinalPhysBonus, 7.5)
	char.ApplyEquipmentBonuses(bonuses)

	if char.Stamina != 23 {
		t.Fatalf("Stamina = %d, want 23", char.Stamina)
	}
	if char.MaxHP <= baseHP {
		t.Fatalf("MaxHP = %d, want greater than %d", char.MaxHP, baseHP)
	}
	if char.FinalDefy != 4 {
		t.Fatalf("FinalDefy = %v, want 4", char.FinalDefy)
	}
	if char.FinalEnhPhyHurt != 7.5 {
		t.Fatalf("FinalEnhPhyHurt = %v, want 7.5", char.FinalEnhPhyHurt)
	}
}

func TestBuildViewPropertiesWithEquipment_UsesComputedFinalFields(t *testing.T) {
	char := &Character{
		Strength:     20,
		Agility:      15,
		Stamina:      18,
		Intelligence: 12,
		Spirit:       10,
	}

	bonuses := NewEquipmentStatBonuses()
	bonuses.AddFlat(PropStamina, 5)
	bonuses.AddFloat(PropFinalPhysReduce, 6.5)
	bonuses.AddFloat(PropFinalPhysBonus, 8.5)
	bonuses.AddFloat(PropCriticalDamage, 25)

	props := BuildViewPropertiesWithEquipment(char, bonuses)

	if got := props["finalPraDef"]; got != 6.5 {
		t.Fatalf("finalPraDef = %v, want 6.5", got)
	}
	if got := props["finalEnhPhyHurt"]; got != 8.5 {
		t.Fatalf("finalEnhPhyHurt = %v, want 8.5", got)
	}
	if got := props["finalStamina"]; got != 23 {
		t.Fatalf("finalStamina = %v, want 23", got)
	}
	if got := props["finalCriticalDamage"]; got != 25.0 {
		t.Fatalf("finalCriticalDamage = %v, want 25", got)
	}
}

func TestApplyEquipmentBonuses_FinalAddsWriteDirectlyToFinalFields(t *testing.T) {
	char := &Character{}
	char.RecalculateStats()
	baseCritDmg := char.FinalCriticalDamage
	baseDefy := char.FinalDefy
	baseResiCrit := char.FinalResiCritical
	baseReborn := char.FinalRebornRate
	baseResiDefy := char.FinalResiDefy

	bonuses := NewEquipmentStatBonuses()
	bonuses.AddFinal(13, 0.4)
	bonuses.AddFinal(14, 1.5)
	bonuses.AddFinal(31, 0.32)
	bonuses.AddFinal(34, 2.4)
	bonuses.AddFinal(61, 1.5)
	char.ApplyEquipmentBonuses(bonuses)

	if got := char.FinalCriticalDamage - baseCritDmg; got != 0.4 {
		t.Fatalf("FinalCriticalDamage delta = %v, want 0.4", got)
	}
	if got := char.FinalDefy - baseDefy; got != 1.5 {
		t.Fatalf("FinalDefy delta = %v, want 1.5", got)
	}
	if got := char.FinalResiCritical - baseResiCrit; got != 0.32 {
		t.Fatalf("FinalResiCritical delta = %v, want 0.32", got)
	}
	if got := char.FinalRebornRate - baseReborn; got != 2 {
		t.Fatalf("FinalRebornRate delta = %d, want 2 (round(2.4))", got)
	}
	if got := char.FinalResiDefy - baseResiDefy; got != 1.5 {
		t.Fatalf("FinalResiDefy delta = %v, want 1.5", got)
	}
}

func TestApplyEquipmentBonuses_AppliesDirectBonusesBeforePercentages(t *testing.T) {
	char := &Character{
		Level:    1,
		Strength: 10,
		Stamina:  10,
	}
	char.RecalculateStats()

	bonuses := NewEquipmentStatBonuses()
	bonuses.AddFlat(PropStamina, 5)
	bonuses.AddFlat(PropMaxHP, 30)
	bonuses.AddFlat(PropAttack, 10)
	bonuses.AddPercent(PropMaxHP, 10)
	bonuses.AddPercent(PropAttack, 10)

	char.ApplyEquipmentBonuses(bonuses)

	if got := char.MaxHP; got != 167 {
		t.Fatalf("MaxHP = %d, want 167", got)
	}
	if got := char.Attack; got != 27 {
		t.Fatalf("Attack = %d, want 27", got)
	}
}
