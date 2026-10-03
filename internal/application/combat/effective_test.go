// Open-sourced by BaoLT

// Equivalence tests for Character.Effective() and Pet.Effective() per-mille outputs.
package combat

import (
	"testing"

	"mcgame-server/internal/domain/character"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/domain/stats"
)

func TestCharacterEffective_MatchesCopyCharStatsPath(t *testing.T) {
	c := &character.Character{}
	c.MaxHP = 10_000
	c.MaxMP = 500
	c.Attack = 2000
	c.Defense = 500
	c.MagicAttack = 1500
	c.MagicDefense = 300
	c.Hit = 200
	c.Dodge = 100
	c.Speed = 130
	c.Critical = 50
	c.CriticalDmg = 200
	c.FinalCounter = 10
	c.FinalCombo = 5
	c.FinalPraDef = 20.9
	c.FinalResiDefy = 15.0
	c.FinalResiCritical = 25.0
	c.FinalEnhPhyHurt = 10.0
	c.FinalEnhMagicHurt = 8.0
	c.FinalReduceHurt1 = 12
	c.FinalReduceHurt2 = 6

	es := c.Effective()

	cases := []struct {
		id   stats.PropID
		want int64
		name string
	}{
		{stats.PropHP, 10_000, "HP"},
		{stats.PropMP, 500, "MP"},
		{stats.PropPhysAtk, 2000, "PhysAtk"},
		{stats.PropMagAtk, 1500, "MagAtk"},
		{stats.PropPhysDef, 500, "PhysDef"},
		{stats.PropMagDef, 300, "MagDef"},
		{stats.PropAccuracy, 200, "Accuracy"},
		{stats.PropDodge, 100, "Dodge"},
		{stats.PropSpeed, 130, "Speed"},
		{stats.PropCritRate, 500, "CritRate"},
		{stats.PropCritDmgBonus, 500, "CritDmgBonus"},
		{stats.PropCounter, 100, "Counter"},
		{stats.PropCombo, 50, "Combo"},
		{stats.PropDefy, 200, "Defy"},
		{stats.PropResistDefy, 150, "ResistDefy"},
		{stats.PropResistCrit, 250, "ResistCrit"},
		{stats.PropFinalPhysDmgUp, 1100, "FinalPhysDmgUp"},
		{stats.PropFinalMagDmgUp, 1080, "FinalMagDmgUp"},
		{stats.PropFinalPhysDmgDown, 0, "FinalPhysDmgDown"},
		{stats.PropFinalMagDmgDown, 0, "FinalMagDmgDown"},
		{stats.PropPhysDmgCut, 120, "PhysDmgCut"},
		{stats.PropMagDmgCut, 60, "MagDmgCut"},
	}

	for _, tc := range cases {
		if got := es.Get(tc.id); got != tc.want {
			t.Errorf("%s (PropID %d): got %d, want %d", tc.name, tc.id, got, tc.want)
		}
	}
}

func TestCharacterEffective_DeathSaveProps(t *testing.T) {
	c := &character.Character{}
	c.FinalRebornRate = 50
	c.FinalBreakReborn = 30.0

	es := c.Effective()

	if got := es.Get(stats.PropDeathImmune); got != 500 {
		t.Errorf("PropDeathImmune: got %d, want 500", got)
	}
	if got := es.Get(stats.PropBreakDeathImmune); got != 300 {
		t.Errorf("PropBreakDeathImmune: got %d, want 300", got)
	}
}

func TestCharacterEffective_CritBonusZeroWhenBelowBase(t *testing.T) {
	c := &character.Character{}
	c.CriticalDmg = 100

	es := c.Effective()

	if got := es.Get(stats.PropCritDmgBonus); got != 0 {
		t.Errorf("CritDmgBonus should be 0 when CriticalDmg < 150, got %d", got)
	}
}

func TestCharacterEffective_Float64Truncation(t *testing.T) {
	c := &character.Character{}
	c.FinalPraDef = 14.9
	c.FinalResiDefy = 7.1

	es := c.Effective()

	if got := es.Get(stats.PropDefy); got != 140 {
		t.Errorf("PropDefy (truncation check): got %d, want 140", got)
	}
	if got := es.Get(stats.PropResistDefy); got != 70 {
		t.Errorf("PropResistDefy (truncation check): got %d, want 70", got)
	}
}

func TestPetEffective_BasicProps(t *testing.T) {
	pet := &domainpet.Pet{
		Property: make(map[string]interface{}),
	}
	pet.MaxHP = 3000
	pet.MaxMP = 150
	pet.Property["finalAttack"] = 800
	pet.Property["finalDefence"] = 200
	pet.Property["finalMAttack"] = 600
	pet.Property["finalMDefence"] = 150
	pet.Property["finalSpeed"] = 90
	pet.Property["finalHit"] = 120
	pet.Property["finalDodge"] = 60
	pet.Property["finalCritical"] = 20
	pet.Property["finalCriticalDamage"] = 180
	pet.Property["finalCounter"] = 5
	pet.Property["finalCombo"] = 8
	pet.Property["finalPraDef"] = 3
	pet.Property["finalResiDefy"] = 2
	pet.Property["finalResiCritical"] = 4
	pet.Property["finalEnhPhyHurt"] = 6
	pet.Property["finalEnhMagicHurt"] = 0
	pet.Property["finalReduceHurt1"] = 5
	pet.Property["finalReduceHurt2"] = 0

	es := pet.Effective()

	cases := []struct {
		id   stats.PropID
		want int64
		name string
	}{
		{stats.PropHP, 3000, "HP"},
		{stats.PropMP, 150, "MP"},
		{stats.PropPhysAtk, 800, "PhysAtk"},
		{stats.PropMagAtk, 600, "MagAtk"},
		{stats.PropPhysDef, 200, "PhysDef"},
		{stats.PropMagDef, 150, "MagDef"},
		{stats.PropAccuracy, 120, "Accuracy"},
		{stats.PropDodge, 60, "Dodge"},
		{stats.PropSpeed, 90, "Speed"},
		{stats.PropCritRate, 200, "CritRate"},
		{stats.PropCritDmgBonus, 300, "CritDmgBonus"},
		{stats.PropCounter, 50, "Counter"},
		{stats.PropCombo, 80, "Combo"},
		{stats.PropDefy, 30, "Defy"},
		{stats.PropResistDefy, 20, "ResistDefy"},
		{stats.PropResistCrit, 40, "ResistCrit"},
		{stats.PropFinalPhysDmgUp, 1060, "FinalPhysDmgUp"},
		{stats.PropFinalMagDmgUp, 1000, "FinalMagDmgUp"},
		{stats.PropPhysDmgCut, 50, "PhysDmgCut"},
		{stats.PropMagDmgCut, 0, "MagDmgCut"},
	}

	for _, tc := range cases {
		if got := es.Get(tc.id); got != tc.want {
			t.Errorf("%s (PropID %d): got %d, want %d", tc.name, tc.id, got, tc.want)
		}
	}
}
