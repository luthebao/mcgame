// Open-sourced by BaoLT

package stats_test

import (
	"testing"

	"mcgame-server/internal/domain/stats"
)

func TestBuildBaseStats_CharacterProfileUsesCoefficients(t *testing.T) {
	profile := stats.Profile{
		SeedHP:       120,
		SeedMP:       60,
		SeedHit:      100,
		SeedSpeed:    100,
		GrowthScale:  1,
		Strength:     15,
		Agility:      10,
		Stamina:      15,
		Intelligence: 5,
		Energy:       5,
		AptStrength:  12,
		AptAgility:   8,
		AptStamina:   10,
		AptIntelligence: 6,
		AptEnergy:    4,
	}

	got := stats.BuildBaseStats(profile)

	if got.MaxHP <= profile.SeedHP {
		t.Fatalf("MaxHP = %d, want greater than seed %d", got.MaxHP, profile.SeedHP)
	}
	if got.MagicDefense <= 0 {
		t.Fatalf("MagicDefense = %d, want positive", got.MagicDefense)
	}
	if got.MaxMP <= profile.SeedMP {
		t.Fatalf("MaxMP = %d, want greater than seed %d", got.MaxMP, profile.SeedMP)
	}
	if got.Attack <= 0 {
		t.Fatalf("Attack = %d, want positive", got.Attack)
	}
}

func TestBuildBaseStats_CreatureProfileAppliesPropOverrides(t *testing.T) {
	profile := stats.Profile{
		SeedHP:       300,
		SeedHit:      100,
		SeedSpeed:    100,
		GrowthScale:  1.2,
		Strength:     8,
		Agility:      6,
		Stamina:      9,
		Intelligence: 4,
		Energy:       3,
		PropHit:      17,
		PropSpeed:    9,
	}

	got := stats.BuildBaseStats(profile)

	if got.Hit < 117 {
		t.Fatalf("Hit = %d, want at least 117 (seed 100 + prop 17)", got.Hit)
	}
	if got.Speed < 109 {
		t.Fatalf("Speed = %d, want at least 109 (seed 100 + prop 9)", got.Speed)
	}
}

func TestBuildBaseStats_ZeroGrowthScaleUsesDefault(t *testing.T) {
	p1 := stats.Profile{
		SeedHP:      100,
		SeedHit:     100,
		SeedSpeed:   100,
		GrowthScale: 0,
		Stamina:     10,
	}
	p2 := stats.Profile{
		SeedHP:      100,
		SeedHit:     100,
		SeedSpeed:   100,
		GrowthScale: stats.DefaultGrowthScale,
		Stamina:     10,
	}

	r1 := stats.BuildBaseStats(p1)
	r2 := stats.BuildBaseStats(p2)

	if r1.MaxHP != r2.MaxHP {
		t.Fatalf("zero GrowthScale should default to %v: r1.MaxHP=%d r2.MaxHP=%d", stats.DefaultGrowthScale, r1.MaxHP, r2.MaxHP)
	}
}

func TestBuildBaseStats_FixedSP(t *testing.T) {
	profile := stats.Profile{
		SeedHP:      0,
		SeedHit:     100,
		SeedSpeed:   100,
		GrowthScale: 1,
		Stamina:     10,
	}

	got := stats.BuildBaseStats(profile)

	expectedHP := int(10 * 8.50)
	if got.MaxHP != expectedHP {
		t.Fatalf("MaxHP from stamina: got %d, want %d (stamina=10 * 8.50)", got.MaxHP, expectedHP)
	}

	if got.MaxSP != stats.FixedMaxSP {
		t.Fatalf("MaxSP = %d, want fixed %d", got.MaxSP, stats.FixedMaxSP)
	}
}

func TestBuildBaseStats_AgilityCoefficients(t *testing.T) {
	profile := stats.Profile{
		SeedHit:     0,
		SeedSpeed:   0,
		GrowthScale: 1,
		Agility:     10,
	}

	got := stats.BuildBaseStats(profile)

	expectedSpeed := int(10 * 1.70)
	if got.Speed != expectedSpeed {
		t.Fatalf("Speed from agility: got %d, want %d (agility=10 * 1.70)", got.Speed, expectedSpeed)
	}

	agi := 10.0
	expectedDodge := int(agi * 0.11)
	if got.Dodge != expectedDodge {
		t.Fatalf("Dodge from agility: got %d, want %d (agility=10 * 0.11)", got.Dodge, expectedDodge)
	}
}

func TestBuildBaseStats_EnergyAffectsMPAndMagicStats(t *testing.T) {
	profile := stats.Profile{
		SeedHit:     100,
		SeedSpeed:   100,
		GrowthScale: 1,
		Energy:      10,
	}

	got := stats.BuildBaseStats(profile)

	eng := 10.0
	expectedMP := int(eng * 5.75)
	if got.MaxMP != expectedMP {
		t.Fatalf("MaxMP from energy: got %d, want %d (energy=10 * 5.75)", got.MaxMP, expectedMP)
	}

	if got.MagicAttack <= 0 {
		t.Fatalf("MagicAttack from energy should be positive, got %d", got.MagicAttack)
	}

	if got.MagicDefense <= 0 {
		t.Fatalf("MagicDefense from energy should be positive, got %d", got.MagicDefense)
	}
}

func TestBuildBaseStats_AptitudeUsesPerMilleMultiplier(t *testing.T) {
	profile := stats.Profile{
		SeedHit:     100,
		SeedSpeed:   100,
		GrowthScale: 1,
		Strength:    20,
		Stamina:     20,
		AptStrength: 250,
		AptStamina:  250,
	}

	got := stats.BuildBaseStats(profile)

	strength := 20.0
	agility := 0.0
	stamina := 20.0

	effectiveStrength := strength + strength*250.0/1000.0
	expectedAttack := int(effectiveStrength*1.9 + agility*0.5)
	if got.Attack != expectedAttack {
		t.Fatalf("Attack = %d, want %d (effectiveStrength * 1.9 + agility * 0.5)", got.Attack, expectedAttack)
	}

	expectedHP := int((stamina + stamina*250.0/1000.0) * stats.CoeffHPFromStamina)
	if got.MaxHP != expectedHP {
		t.Fatalf("MaxHP = %d, want %d (stamina=20 + 20*250/1000, then *8.50)", got.MaxHP, expectedHP)
	}
}

func TestBuildBaseStats_AttackAndMagicAttackRebalance(t *testing.T) {
	profile := stats.Profile{
		SeedHit:      100,
		SeedSpeed:    100,
		GrowthScale:  1,
		Strength:     20,
		Agility:      10,
		Intelligence: 8,
		Energy:       8,
	}

	got := stats.BuildBaseStats(profile)

	expectedAttack := int(20.0*1.9 + 10.0*0.5)
	if got.Attack != expectedAttack {
		t.Fatalf("Attack = %d, want %d (strength*1.9 + agility*0.5)", got.Attack, expectedAttack)
	}

	intelligence := 8.0
	energy := 8.0
	expectedMagicAttack := int(intelligence*2.0 + energy*0.6)
	if got.MagicAttack != expectedMagicAttack {
		t.Fatalf("MagicAttack = %d, want %d (intelligence*2.0 + energy*0.6)", got.MagicAttack, expectedMagicAttack)
	}

	if got.Attack <= got.MagicAttack {
		t.Fatalf("Attack = %d, MagicAttack = %d, want Attack > MagicAttack for this physical profile", got.Attack, got.MagicAttack)
	}
}
