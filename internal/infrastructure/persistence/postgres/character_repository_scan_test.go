// Open-sourced by BaoLT

package postgres

import (
	"testing"

	"mcgame-server/internal/domain/character"
)

func TestHydrateCharacterState_RecalculatesDerivedStatsAndClampsVitals(t *testing.T) {
	char := &character.Character{
		Level:                12,
		Strength:             40,
		Agility:              28,
		Stamina:              35,
		Intelligence:         22,
		Spirit:               18,
		AptStrength:          6,
		AptAgility:           4,
		AptStamina:           5,
		AptIntelligence:      3,
		AptEnergy:            2,
		ClassAptStrength:     20,
		ClassAptAgility:      15,
		ClassAptStamina:      25,
		ClassAptIntelligence: 10,
		ClassAptEnergy:       12,
		CurrentHP:            99999,
		CurrentMP:            99999,
		CurrentSP:            99999,
		MaxHP:                1,
		MaxMP:                1,
		MaxSP:                1,
		Attack:               1,
		Defense:              1,
		MagicAttack:          1,
		MagicDefense:         1,
		Hit:                  1,
		Dodge:                1,
		Critical:             1,
		Speed:                1,
	}

	hydrateCharacterState(char, []byte(`{"lvData":{},"petData":{}}`), []byte(`{}`), []byte(`{}`))

	if char.MaxHP <= 1 || char.MaxMP <= 1 || char.MaxSP <= 1 {
		t.Fatalf("expected derived vitals to be recalculated, got hp=%d mp=%d sp=%d", char.MaxHP, char.MaxMP, char.MaxSP)
	}
	if char.Attack <= 1 || char.Defense <= 1 || char.MagicAttack <= 1 || char.MagicDefense <= 1 {
		t.Fatalf("expected derived combat stats to be recalculated, got atk=%d def=%d matk=%d mdef=%d", char.Attack, char.Defense, char.MagicAttack, char.MagicDefense)
	}
	if char.CurrentHP != char.MaxHP {
		t.Fatalf("current hp = %d, want clamped max hp %d", char.CurrentHP, char.MaxHP)
	}
	if char.CurrentMP != char.MaxMP {
		t.Fatalf("current mp = %d, want clamped max mp %d", char.CurrentMP, char.MaxMP)
	}
	if char.CurrentSP != char.MaxSP {
		t.Fatalf("current sp = %d, want clamped max sp %d", char.CurrentSP, char.MaxSP)
	}
}
