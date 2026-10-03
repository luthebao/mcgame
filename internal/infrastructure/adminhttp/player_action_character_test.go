// Open-sourced by BaoLT

package adminhttp

import (
	"testing"

	"github.com/google/uuid"

	"mcgame-server/internal/domain/character"
)

func TestApplyLevelIncrease_UsesCurrentLevelDelta(t *testing.T) {
	char := character.NewCharacter(uuid.New(), "tester", 1, 0)
	char.Experience = 42

	changes := map[string]interface{}{}
	applyLevelIncrease(char, 3, changes)

	if char.Level != 4 {
		t.Fatalf("level = %d, want 4", char.Level)
	}
	if char.Experience != 0 {
		t.Fatalf("experience = %d, want 0", char.Experience)
	}
	if char.AttrPoints != 15 {
		t.Fatalf("attr points = %d, want 15", char.AttrPoints)
	}
	if char.MaxAttrPoints != 15 {
		t.Fatalf("max attr points = %d, want 15", char.MaxAttrPoints)
	}
	if char.Strength != 13 || char.Agility != 13 || char.Stamina != 13 || char.Intelligence != 13 || char.Spirit != 13 {
		t.Fatalf("expected base stats to increase by 3, got str=%d agi=%d sta=%d int=%d spi=%d", char.Strength, char.Agility, char.Stamina, char.Intelligence, char.Spirit)
	}
	if changes["levelDelta"] != 3 {
		t.Fatalf("levelDelta change = %v, want 3", changes["levelDelta"])
	}
	if changes["level"] != 4 {
		t.Fatalf("level change = %v, want 4", changes["level"])
	}
}

func TestApplyLevelIncrease_CapsAtMaxLevel(t *testing.T) {
	char := character.NewCharacter(uuid.New(), "tester", 1, 0)
	char.Level = character.MaxLevel - 1

	changes := map[string]interface{}{}
	applyLevelIncrease(char, 5, changes)

	if char.Level != character.MaxLevel {
		t.Fatalf("level = %d, want %d", char.Level, character.MaxLevel)
	}
	if changes["levelDelta"] != 1 {
		t.Fatalf("levelDelta change = %v, want 1", changes["levelDelta"])
	}
}

func TestApplyExperienceIncrease_UsesGainExperience(t *testing.T) {
	char := character.NewCharacter(uuid.New(), "tester", 1, 0)

	changes := map[string]interface{}{}
	applyExperienceIncrease(char, 83, changes)

	if char.Level != 2 {
		t.Fatalf("level = %d, want 2", char.Level)
	}
	if char.Experience != 10 {
		t.Fatalf("experience = %d, want 10", char.Experience)
	}
	if changes["experienceDelta"] != int64(83) {
		t.Fatalf("experienceDelta change = %v, want 83", changes["experienceDelta"])
	}
	if changes["leveledUp"] != true {
		t.Fatalf("leveledUp change = %v, want true", changes["leveledUp"])
	}
	if changes["level"] != 2 {
		t.Fatalf("level change = %v, want 2", changes["level"])
	}
}
