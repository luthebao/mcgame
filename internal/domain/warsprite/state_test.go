// Open-sourced by BaoLT

package warsprite

import (
	"reflect"
	"testing"
)

func TestDefault_PopulatesAllSlotsWithRootIDs(t *testing.T) {
	s := Default()

	wantW := map[int]int64{1: 1100, 2: 1200, 3: 1300, 4: 1400, 5: 1500, 6: 1600, 7: 1700, 8: 1800}
	wantB := map[int]int64{1: 2100, 2: 2200, 3: 2300, 4: 2400, 5: 2500, 6: 2600, 7: 2700, 8: 2800}

	if !reflect.DeepEqual(s.WObj, wantW) {
		t.Fatalf("WObj mismatch: got %v, want %v", s.WObj, wantW)
	}
	if !reflect.DeepEqual(s.BObj, wantB) {
		t.Fatalf("BObj mismatch: got %v, want %v", s.BObj, wantB)
	}
}

func TestEncodeDecode_RoundTripPreservesValues(t *testing.T) {
	s := Default()
	if err := s.Set(KindWarSprite, 1, 1105); err != nil {
		t.Fatalf("Set: %v", err)
	}
	if err := s.Set(KindBattleSprite, 4, 2407); err != nil {
		t.Fatalf("Set: %v", err)
	}

	encoded := s.Encode()
	decoded := Decode(encoded)

	if got, _ := decoded.Get(KindWarSprite, 1); got != 1105 {
		t.Fatalf("kind=1 idx=1 round-trip: got %d, want 1105", got)
	}
	if got, _ := decoded.Get(KindBattleSprite, 4); got != 2407 {
		t.Fatalf("kind=2 idx=4 round-trip: got %d, want 2407", got)
	}
	if got, _ := decoded.Get(KindBattleSprite, 8); got != 2800 {
		t.Fatalf("kind=2 idx=8 should remain root: got %d, want 2800", got)
	}
}

func TestDecode_FillsMissingSlotsWithRoots(t *testing.T) {
	blob := map[string]any{
		"wObj": map[string]any{"1": int64(1105)},
		"bObj": map[string]any{},
	}
	decoded := Decode(blob)

	if got, _ := decoded.Get(KindWarSprite, 1); got != 1105 {
		t.Fatalf("preserved slot: got %d, want 1105", got)
	}
	if got, _ := decoded.Get(KindWarSprite, 8); got != 1800 {
		t.Fatalf("missing slot should fall back to root: got %d, want 1800", got)
	}
	if got, _ := decoded.Get(KindBattleSprite, 1); got != 2100 {
		t.Fatalf("missing battle slot should fall back to root: got %d, want 2100", got)
	}
}

func TestGet_RejectsInvalidIndexAndKind(t *testing.T) {
	s := Default()

	for _, idx := range []int{-1, 0, 9, 100} {
		if _, err := s.Get(KindWarSprite, idx); err != ErrInvalidIndex {
			t.Fatalf("Get(idx=%d) want ErrInvalidIndex, got %v", idx, err)
		}
	}
	for _, kind := range []int{0, 3, 99} {
		if _, err := s.Get(kind, 1); err != ErrInvalidKind {
			t.Fatalf("Get(kind=%d) want ErrInvalidKind, got %v", kind, err)
		}
	}
}

func TestSet_RejectsInvalidIndexAndKind(t *testing.T) {
	s := Default()

	if err := s.Set(KindWarSprite, 9, 1234); err != ErrInvalidIndex {
		t.Fatalf("Set(idx=9): want ErrInvalidIndex, got %v", err)
	}
	if err := s.Set(0, 1, 1234); err != ErrInvalidKind {
		t.Fatalf("Set(kind=0): want ErrInvalidKind, got %v", err)
	}
}

func TestActiveTemplateIDs_Returns16Slots(t *testing.T) {
	s := Default()
	ids := s.ActiveTemplateIDs()
	if len(ids) != 16 {
		t.Fatalf("ActiveTemplateIDs len: got %d, want 16", len(ids))
	}
}

func TestRootID_MatchesSeedValues(t *testing.T) {
	cases := []struct {
		spriteType, kind int
		want             int64
	}{
		{1, KindWarSprite, 1100},
		{8, KindWarSprite, 1800},
		{1, KindBattleSprite, 2100},
		{8, KindBattleSprite, 2800},
		{0, KindWarSprite, 0},
		{9, KindWarSprite, 0},
		{1, 99, 0},
	}
	for _, tc := range cases {
		got := RootID(tc.spriteType, tc.kind)
		if got != tc.want {
			t.Fatalf("RootID(type=%d, kind=%d): got %d, want %d", tc.spriteType, tc.kind, got, tc.want)
		}
	}
}

func TestToClientPayload_HasStringKeyedSlots(t *testing.T) {
	s := Default()
	payload := s.ToClientPayload()

	wObj, ok := payload["wObj"].(map[string]any)
	if !ok {
		t.Fatalf("payload[wObj] should be map[string]any, got %T", payload["wObj"])
	}
	if _, ok := wObj["1"]; !ok {
		t.Fatalf("payload[wObj][\"1\"] missing")
	}
	if _, ok := wObj["8"]; !ok {
		t.Fatalf("payload[wObj][\"8\"] missing")
	}
}

func TestDecode_HostileInputsFallBackToDefault(t *testing.T) {
	for _, blob := range []map[string]any{
		nil,
		{},
		{"wObj": "' OR 1=1 --"},
		{"wObj": map[string]any{"abc": "xyz", "-1": "1100"}},
		{"wObj": map[string]any{"9": int64(1100)}},
	} {
		decoded := Decode(blob)
		if id, _ := decoded.Get(KindWarSprite, 1); id != 1100 {
			t.Fatalf("hostile blob %v: kind=1 idx=1 should default to 1100, got %d", blob, id)
		}
	}
}
