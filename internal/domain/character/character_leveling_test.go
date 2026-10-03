// Open-sourced by BaoLT

package character

import (
	"testing"

	"github.com/google/uuid"
)

func TestExperienceForLevel_UsesPlayerLevelExpDelta(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)

	if got := char.ExperienceForLevel(2); got != 73 {
		t.Fatalf("ExperienceForLevel(2) = %d, want 73", got)
	}

	if got := char.ExperienceForLevel(3); got != 285 {
		t.Fatalf("ExperienceForLevel(3) = %d, want 285", got)
	}
}

func TestGainExperience_ExactThresholdHit(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)

	leveled := char.GainExperience(73)
	if !leveled {
		t.Fatalf("expected level up")
	}
	if char.Level != 2 {
		t.Fatalf("level = %d, want 2", char.Level)
	}
	if char.Experience != 0 {
		t.Fatalf("experience = %d, want 0", char.Experience)
	}
}

func TestGainExperience_JustBelowThreshold(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)

	leveled := char.GainExperience(72)
	if leveled {
		t.Fatalf("expected no level up")
	}
	if char.Level != 1 {
		t.Fatalf("level = %d, want 1", char.Level)
	}
	if char.Experience != 72 {
		t.Fatalf("experience = %d, want 72", char.Experience)
	}
}

func TestGainExperience_ThresholdOverflowResidual(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)

	leveled := char.GainExperience(83)
	if !leveled {
		t.Fatalf("expected level up")
	}
	if char.Level != 2 {
		t.Fatalf("level = %d, want 2", char.Level)
	}
	if char.Experience != 10 {
		t.Fatalf("experience = %d, want 10", char.Experience)
	}
}

func TestGainExperience_MultiLevelJump(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)

	leveled := char.GainExperience(378)
	if !leveled {
		t.Fatalf("expected level up")
	}
	if char.Level != 3 {
		t.Fatalf("level = %d, want 3", char.Level)
	}
	if char.Experience != 20 {
		t.Fatalf("experience = %d, want 20", char.Experience)
	}
}

func TestGainExperience_AutoLevelCapNoop(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.Level = AutoLevelCap
	char.Experience = 50

	leveled := char.GainExperience(100)
	if leveled {
		t.Fatalf("expected no level up")
	}
	if char.Level != AutoLevelCap {
		t.Fatalf("level = %d, want %d", char.Level, AutoLevelCap)
	}
	if char.Experience != 150 {
		t.Fatalf("experience = %d, want 150", char.Experience)
	}
}

func TestGainExperience_ZeroProcessesPendingExp(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.Experience = 73

	leveled := char.GainExperience(0)
	if !leveled {
		t.Fatalf("expected level up")
	}
	if char.Level != 2 {
		t.Fatalf("level = %d, want 2", char.Level)
	}
	if char.Experience != 0 {
		t.Fatalf("experience = %d, want 0", char.Experience)
	}
}

func TestGainExperience_StopsAtAutoLevelCap(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)

	leveled := char.GainExperience(999999999)
	if !leveled {
		t.Fatalf("expected level up")
	}
	if char.Level != AutoLevelCap {
		t.Fatalf("level = %d, want %d", char.Level, AutoLevelCap)
	}
}

func TestManualLevelUp_Success(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.Level = AutoLevelCap
	char.Experience = char.ExperienceForLevel(AutoLevelCap + 1)

	leveled := char.ManualLevelUp()
	if !leveled {
		t.Fatalf("expected level up")
	}
	if char.Level != AutoLevelCap+1 {
		t.Fatalf("level = %d, want %d", char.Level, AutoLevelCap+1)
	}
	if char.Experience != 0 {
		t.Fatalf("experience = %d, want 0", char.Experience)
	}
}

func TestManualLevelUp_InsufficientExp(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.Level = AutoLevelCap
	char.Experience = 0

	leveled := char.ManualLevelUp()
	if leveled {
		t.Fatalf("expected no level up")
	}
	if char.Level != AutoLevelCap {
		t.Fatalf("level = %d, want %d", char.Level, AutoLevelCap)
	}
}

func TestManualLevelUp_AtMaxLevel(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.Level = MaxLevel
	char.Experience = 999999999

	leveled := char.ManualLevelUp()
	if leveled {
		t.Fatalf("expected no level up at max level")
	}
	if char.Level != MaxLevel {
		t.Fatalf("level = %d, want %d", char.Level, MaxLevel)
	}
}

func TestManualLevelUp_OneLevelOnly(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.Level = AutoLevelCap
	needed := char.ExperienceForLevel(AutoLevelCap + 1)
	char.Experience = needed + 999999

	leveled := char.ManualLevelUp()
	if !leveled {
		t.Fatalf("expected level up")
	}
	if char.Level != AutoLevelCap+1 {
		t.Fatalf("level = %d, want %d", char.Level, AutoLevelCap+1)
	}
	if char.Experience != 999999 {
		t.Fatalf("experience = %d, want 999999", char.Experience)
	}
}

func TestRaiseLevelTo_Success(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)

	raised := char.RaiseLevelTo(5)
	if !raised {
		t.Fatalf("expected level raise")
	}
	if char.Level != 5 {
		t.Fatalf("level = %d, want 5", char.Level)
	}
	if char.Experience != 0 {
		t.Fatalf("experience = %d, want 0", char.Experience)
	}
	if char.AttrPoints != 20 {
		t.Fatalf("attr points = %d, want 20", char.AttrPoints)
	}
	if char.Strength != 14 || char.Agility != 14 || char.Stamina != 14 || char.Intelligence != 14 || char.Spirit != 14 {
		t.Fatalf("expected base attributes to increase to 14, got str=%d agi=%d sta=%d int=%d spi=%d", char.Strength, char.Agility, char.Stamina, char.Intelligence, char.Spirit)
	}
	if char.MaxHP != 115 {
		t.Fatalf("max hp = %d, want 115", char.MaxHP)
	}
	if char.MaxMP != 114 {
		t.Fatalf("max mp = %d, want 114", char.MaxMP)
	}
}

func TestRaiseLevelTo_RejectsLowerOrEqualTarget(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.Level = 5
	char.AttrPoints = 20

	raised := char.RaiseLevelTo(5)
	if raised {
		t.Fatalf("expected no level raise")
	}
	if char.Level != 5 {
		t.Fatalf("level = %d, want 5", char.Level)
	}
	if char.AttrPoints != 20 {
		t.Fatalf("attr points = %d, want 20", char.AttrPoints)
	}
}

func TestCumulativeExpCapped_CapsAtNextLevel(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.Level = AutoLevelCap
	char.Experience = 999999999

	capped := char.CumulativeExpCapped()
	nextLevelCumExp := playerLevelCumulativeExp(AutoLevelCap + 1)
	if capped != nextLevelCumExp-1 {
		t.Fatalf("CumulativeExpCapped() = %d, want %d", capped, nextLevelCumExp-1)
	}
}

func TestCumulativeExpCapped_NoCapWhenBelowThreshold(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.Level = 5
	char.Experience = 100

	capped := char.CumulativeExpCapped()
	raw := char.CumulativeExp()
	if capped != raw {
		t.Fatalf("CumulativeExpCapped() = %d, want %d (same as uncapped)", capped, raw)
	}
}

func TestNormalizeAttributePoints_BackfillsDeficitFromZero(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.Level = 5
	char.AttrPoints = 0
	char.MaxAttrPoints = 0
	char.DistributedAttrPoints = 0

	char.NormalizeAttributePoints()

	expectedMax := 4 * AttributePointsPerLevel
	if char.MaxAttrPoints != expectedMax {
		t.Fatalf("MaxAttrPoints = %d, want %d", char.MaxAttrPoints, expectedMax)
	}
	if char.AttrPoints != expectedMax {
		t.Fatalf("AttrPoints = %d, want %d", char.AttrPoints, expectedMax)
	}
	if char.DistributedAttrPoints != 0 {
		t.Fatalf("DistributedAttrPoints = %d, want 0", char.DistributedAttrPoints)
	}
}

func TestNormalizeAttributePoints_PartialDeficitPreservesDistributed(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.Level = 5
	char.AttrPoints = 2
	char.MaxAttrPoints = 10
	char.DistributedAttrPoints = 8

	char.NormalizeAttributePoints()

	expectedMax := 4 * AttributePointsPerLevel
	if char.MaxAttrPoints != expectedMax {
		t.Fatalf("MaxAttrPoints = %d, want %d", char.MaxAttrPoints, expectedMax)
	}
	if char.AttrPoints != 12 {
		t.Fatalf("AttrPoints = %d, want 12", char.AttrPoints)
	}
	if char.DistributedAttrPoints != 8 {
		t.Fatalf("DistributedAttrPoints = %d, want 8", char.DistributedAttrPoints)
	}
}

func TestNormalizeAttributePoints_AlreadyConsistent(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.Level = 5
	char.AttrPoints = 5
	char.MaxAttrPoints = 20
	char.DistributedAttrPoints = 15

	char.NormalizeAttributePoints()

	if char.MaxAttrPoints != 20 {
		t.Fatalf("MaxAttrPoints = %d, want 20", char.MaxAttrPoints)
	}
	if char.AttrPoints != 5 {
		t.Fatalf("AttrPoints = %d, want 5", char.AttrPoints)
	}
}

func TestNormalizeAttributePoints_Level1IsNoop(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.Level = 1
	char.AttrPoints = 0
	char.MaxAttrPoints = 0

	char.NormalizeAttributePoints()

	if char.MaxAttrPoints != 0 {
		t.Fatalf("MaxAttrPoints = %d, want 0", char.MaxAttrPoints)
	}
	if char.AttrPoints != 0 {
		t.Fatalf("AttrPoints = %d, want 0", char.AttrPoints)
	}
}

func TestNormalizeAttributePoints_DoesNotClawBackOverCredit(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.Level = 3
	char.AttrPoints = 50
	char.MaxAttrPoints = 50

	char.NormalizeAttributePoints()

	if char.MaxAttrPoints != 50 {
		t.Fatalf("MaxAttrPoints = %d, want 50 (no claw-back)", char.MaxAttrPoints)
	}
	if char.AttrPoints != 50 {
		t.Fatalf("AttrPoints = %d, want 50 (no claw-back)", char.AttrPoints)
	}
}

func TestNormalizeAttributePoints_Idempotent(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.Level = 7
	char.AttrPoints = 0
	char.MaxAttrPoints = 0
	char.DistributedAttrPoints = 0

	char.NormalizeAttributePoints()
	firstMax := char.MaxAttrPoints
	firstAttr := char.AttrPoints

	char.NormalizeAttributePoints()

	if char.MaxAttrPoints != firstMax {
		t.Fatalf("MaxAttrPoints drifted on second call: %d, want %d", char.MaxAttrPoints, firstMax)
	}
	if char.AttrPoints != firstAttr {
		t.Fatalf("AttrPoints drifted on second call: %d, want %d", char.AttrPoints, firstAttr)
	}
}
