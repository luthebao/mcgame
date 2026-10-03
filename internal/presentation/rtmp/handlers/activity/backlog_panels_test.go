// Open-sourced by BaoLT

package activity

import (
	"testing"
	"time"

	"github.com/google/uuid"
	domainchar "mcgame-server/internal/domain/character"
)

func TestLegacyStartedActList_ReturnsAllClientSlots(t *testing.T) {
	result := legacyStartedActList()

	if len(result) != legacyStartedActivityCount {
		t.Fatalf("len(result) = %d, want %d", len(result), legacyStartedActivityCount)
	}

	first := result[0].(map[string]interface{})
	last := result[len(result)-1].(map[string]interface{})
	if got := first["id"]; got != 0 {
		t.Fatalf("first id = %v, want 0", got)
	}
	if got := last["id"]; got != legacyStartedActivityCount-1 {
		t.Fatalf("last id = %v, want %d", got, legacyStartedActivityCount-1)
	}
}

func TestLegacyAutoTaskPayload_HasExpectedStarterKeys(t *testing.T) {
	payload := legacyAutoTaskPayload(legacyActivityState{day: "4|14|6"})

	for _, key := range []string{"day", "num", "data", "queue", "finish"} {
		if _, exists := payload[key]; !exists {
			t.Fatalf("payload missing %s", key)
		}
	}
}

func TestLegacyCrossContentionPayload_ContainsPVEAndPVP(t *testing.T) {
	payload := legacyCrossContentionPayload(legacyActivityState{day: "4|14|6"})

	if _, ok := payload["PVE"].(map[string]interface{}); !ok {
		t.Fatalf("PVE type = %T, want map[string]interface{}", payload["PVE"])
	}
	if _, ok := payload["PVP"].(map[string]interface{}); !ok {
		t.Fatalf("PVP type = %T, want map[string]interface{}", payload["PVP"])
	}
}

func TestLegacyActivityDayStamp_UsesMonthDayYearTail(t *testing.T) {
	now := time.Date(2026, time.April, 14, 0, 0, 0, 0, time.UTC)

	if got := legacyActivityDayStamp(now); got != "4|14|6" {
		t.Fatalf("legacyActivityDayStamp() = %s, want 4|14|6", got)
	}
}

func TestLegacyWorldCupGoldPointUsesCharacterValue(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.GoldWorldCup = 77

	response := func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		if state.char == nil {
			return legacyStarterResponse{response: 0}
		}
		return legacyStarterResponse{response: state.char.GoldWorldCup}
	}(legacyActivityState{char: char}, nil)

	if response.response != 77 {
		t.Fatalf("response = %v, want 77", response.response)
	}
}
