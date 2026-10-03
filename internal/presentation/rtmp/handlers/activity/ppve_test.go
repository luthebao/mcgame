// Open-sourced by BaoLT

// Tests for the PPVE challenge handler helpers and battle result constants.
// ChallengeNextFloor callback-arg assertions are not feasible without wiring a concrete
// *rtmp.Connection (transport + dispatcher + net.Conn); those paths are covered by the
// application-layer tests in internal/application/pet.
package activity

import (
	"testing"

	apppet "mcgame-server/internal/application/pet"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func TestPPVEBattleResultConstants(t *testing.T) {
	if ppveBattleWin != 1 {
		t.Fatalf("ppveBattleWin = %d, want 1 (GamePredef.BATTLE_WIN)", ppveBattleWin)
	}
	if ppveBattleNotEnd != -1 {
		t.Fatalf("ppveBattleNotEnd = %d, want -1 (GamePredef.BATTLE_NOT_END)", ppveBattleNotEnd)
	}
}

func TestBuildPPVERankList_EmptyInput(t *testing.T) {
	out := buildPPVERankList(nil)
	if len(out) != 0 {
		t.Fatalf("len = %d, want 0", len(out))
	}
}

func TestBuildPPVERankList_MapsFields(t *testing.T) {
	entries := []apppet.PPVERankEntry{
		{CID: "10", ClassID: "2", FloorNum: 5, Level: 99, Name: "Hero"},
		{CID: "20", ClassID: "1", FloorNum: 3, Level: 50, Name: "Archer"},
	}
	out := buildPPVERankList(entries)
	if len(out) != 2 {
		t.Fatalf("len = %d, want 2", len(out))
	}
	first, ok := out[0].(map[string]interface{})
	if !ok {
		t.Fatalf("entry 0 type = %T, want map[string]interface{}", out[0])
	}
	checks := map[string]interface{}{
		"cid": "10", "classId": "2", "floorNum": 5, "level": 99, "name": "Hero",
	}
	for k, want := range checks {
		got := first[k]
		if got != want {
			t.Errorf("entry[0][%s] = %v (%T), want %v (%T)", k, got, got, want, want)
		}
	}
}

func TestChallengeNextFloor_NilServiceReturnsNil(t *testing.T) {
	h := NewHandler(nil, zap.NewNop())
	ctx := &rtmp.RPCContext{ConnID: 1, CharacterID: "42"}
	result, err := h.ChallengeNextFloor(ctx, nil)
	if err != nil {
		t.Fatalf("ChallengeNextFloor() error = %v, want nil", err)
	}
	if result != nil {
		t.Fatalf("ChallengeNextFloor() result = %v, want nil", result)
	}
}
