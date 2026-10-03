// Open-sourced by BaoLT

package item

import (
	"testing"

	gamedatamodels "mcgame-server/internal/gamedata/models"
)

func TestIsGroupTransportItem(t *testing.T) {
	cases := []struct {
		templateID int
		want       bool
	}{
		{2947, true},
		{2948, true},
		{2949, true},
		{2950, true},
		{3722, true},
		{4941, true},
		{4942, true},
		{1036, false},
		{1363, false},
		{2946, false},
		{1515, false},
		{0, false},
		{-1, false},
	}
	for _, c := range cases {
		if got := isGroupTransportItem(c.templateID); got != c.want {
			t.Errorf("isGroupTransportItem(%d) = %v, want %v", c.templateID, got, c.want)
		}
	}
}

func TestTransportPriorityListsIncludeAllSeniors(t *testing.T) {
	for tid := range groupTransportTemplateIDs {
		if !contains(transportRegularPriority, tid) {
			t.Errorf("transportRegularPriority missing senior fallback id %d", tid)
		}
		if !contains(transportSeniorPriority, tid) {
			t.Errorf("transportSeniorPriority missing senior id %d", tid)
		}
	}
}

func TestTransportRegularPriorityPrefersRegularBeforeSenior(t *testing.T) {
	regularIDs := map[int]struct{}{1036: {}, 1363: {}, 2946: {}, 1515: {}}
	seenSenior := false
	for _, id := range transportRegularPriority {
		if _, ok := groupTransportTemplateIDs[id]; ok {
			seenSenior = true
			continue
		}
		if _, ok := regularIDs[id]; !ok {
			t.Fatalf("transportRegularPriority contains unknown id %d", id)
		}
		if seenSenior {
			t.Fatalf("regular id %d appears after a senior id; regulars must come first", id)
		}
	}
}

func TestPickRadarNPCPrefersSameMap(t *testing.T) {
	npcs := []*gamedatamodels.NpcTemplate{
		{ID: 1, Name: "Quan Khẩu", PosMapID: 100, PosX: 10, PosY: 20, Fd: 1},
		{ID: 2, Name: "Quan Khẩu", PosMapID: 200, PosX: 30, PosY: 40, Fd: 1},
	}

	got := pickRadarNPC(npcs, 200)
	if got == nil || got.ID != 2 {
		t.Fatalf("pickRadarNPC same-map preference: got %+v, want id=2", got)
	}

	got = pickRadarNPC(npcs, 999)
	if got == nil || got.ID != 1 {
		t.Fatalf("pickRadarNPC fallback to first: got %+v, want id=1", got)
	}

	if pickRadarNPC(nil, 100) != nil {
		t.Fatalf("pickRadarNPC(nil) should return nil")
	}
}

func contains(haystack []int, needle int) bool {
	for _, h := range haystack {
		if h == needle {
			return true
		}
	}
	return false
}
