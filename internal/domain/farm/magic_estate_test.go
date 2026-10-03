// Open-sourced by BaoLT

package farm

import (
	"testing"
	"time"
)

func TestEnsureMagicEstateProfileDefaults(t *testing.T) {
	profile := NewMagicEstateProfile(35644, 160)

	if profile.Actpoint != 1750 {
		t.Fatalf("Actpoint = %d, expected 1750", profile.Actpoint)
	}
	if profile.MaxActpoint != 1750 {
		t.Fatalf("MaxActpoint = %d, expected 1750", profile.MaxActpoint)
	}
	if profile.MovePnt != 900 {
		t.Fatalf("MovePnt = %d, expected 900", profile.MovePnt)
	}
	if profile.MaxMovePnt != 900 {
		t.Fatalf("MaxMovePnt = %d, expected 900", profile.MaxMovePnt)
	}
	if profile.FarmNum != 2 {
		t.Fatalf("FarmNum = %d, expected 2", profile.FarmNum)
	}
}

func TestMagicEstateNormalizeRemovesExpiredCooldownSlots(t *testing.T) {
	now := time.Date(2026, 4, 9, 15, 0, 0, 0, time.UTC)
	profile := &MagicEstateProfile{
		Slots: map[int]*MagicEstateSlot{
			1: {
				SlotID:         1,
				MineralID:      1,
				Num:            100,
				MaxNum:         100,
				CooldownEndsAt: now.Add(-time.Minute).UnixMilli(),
				HavestFlag:     true,
			},
			2: {
				SlotID:         2,
				MineralID:      2,
				Num:            100,
				MaxNum:         100,
				CooldownEndsAt: now.Add(time.Minute).UnixMilli(),
				HavestFlag:     true,
			},
		},
	}

	profile.Normalize(20, now)

	if _, ok := profile.Slots[1]; ok {
		t.Fatalf("expected expired slot to be removed")
	}
	if _, ok := profile.Slots[2]; !ok {
		t.Fatalf("expected active cooldown slot to remain")
	}
}
