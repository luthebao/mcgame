// Open-sourced by BaoLT

package mount

import (
	"encoding/json"
	"testing"

	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

func newTestService(t *testing.T) *Service {
	t.Helper()
	mgr := gamedata.NewManager(nil, zap.NewNop())

	rows := []string{
		`{"id":1,"level":0,"exp":100,"type":1}`,
		`{"id":2,"level":1,"exp":270,"type":1}`,
		`{"id":3,"level":2,"exp":525,"type":1}`,
		`{"id":19,"level":18,"exp":74540,"type":1}`,
		`{"id":20,"level":19,"exp":90000,"type":1}`,
		`{"id":21,"level":0,"dress_id":1,"mount_lev_limit":5,"item_num":2,"exp":50,"add_rate":4,"type":2}`,
		`{"id":22,"level":1,"dress_id":1,"mount_lev_limit":9,"item_num":5,"exp":40,"add_rate":3,"type":2}`,
		`{"id":23,"level":2,"dress_id":2,"mount_lev_limit":13,"item_num":8,"exp":30,"add_rate":2,"type":2}`,
		`{"id":26,"level":5,"dress_id":3,"mount_lev_limit":25,"item_num":5,"exp":40,"add_rate":3,"type":2}`,
	}
	raw := make([]json.RawMessage, 0, len(rows))
	for _, r := range rows {
		raw = append(raw, json.RawMessage(r))
	}
	if err := mgr.GetCache().LoadTable(models.TableMount, raw); err != nil {
		t.Fatalf("LoadTable(TBL_MOUNT) error = %v", err)
	}
	return &Service{gameData: mgr, logger: zap.NewNop()}
}

func TestMountState_RoundTrip(t *testing.T) {
	s := &MountState{
		Lv: 19, Exp: 74546, UpLv: 12, AddRate: 5, AddRateDay: "6|1|1",
		UseDress: -1, GetDate: 1477836257080,
		ExtraDresses: map[string]int64{"99": 1700000000000},
	}
	got := mountStateFromMap(s.ToMap())
	if got.Lv != 19 || got.Exp != 74546 || got.UpLv != 12 || got.AddRate != 5 {
		t.Fatalf("scalar round-trip mismatch: %+v", got)
	}
	if got.AddRateDay != "6|1|1" || got.UseDress != -1 || got.GetDate != 1477836257080 {
		t.Fatalf("field round-trip mismatch: %+v", got)
	}
	if got.ExtraDresses["99"] != 1700000000000 {
		t.Fatalf("extraDresses round-trip = %v, want 1700000000000", got.ExtraDresses["99"])
	}
}

func TestFeedCount_MapsWireModeToItemCount(t *testing.T) {
	// MountPanel.feedMount sends 1 for a single feed and 2 for the x10 batch
	// ("if (_arg_1 != 1) { count = 10 }"). Anything that is not 1 must become 10.
	cases := []struct{ mode, want int }{
		{1, 1},   // single feed
		{2, 10},  // x10 batch (client sends literal 2)
		{10, 10}, // defensive: an explicit 10 still means batch
		{0, 10},  // malformed -> batch (handler defaults parse failures to 1 upstream)
	}
	for _, c := range cases {
		if got := feedCount(c.mode); got != c.want {
			t.Errorf("feedCount(%d) = %d, want %d", c.mode, got, c.want)
		}
	}
}

func TestComputeLevel_CumulativeThresholds(t *testing.T) {
	svc := newTestService(t)
	cases := []struct {
		exp, upLv, want int
	}{
		{50, 5, 0},     // below first threshold
		{100, 5, 1},    // exactly first threshold
		{525, 5, 3},    // third threshold passed
		{74546, 5, 19}, // real player's exp -> lv 19 (cap 25 at upLv5)
		{74546, 0, 5},  // capped by mount_lev_limit=5 at upLv0
	}
	for _, c := range cases {
		if got := svc.computeLevel(c.exp, c.upLv); got != c.want {
			t.Errorf("computeLevel(%d, upLv=%d) = %d, want %d", c.exp, c.upLv, got, c.want)
		}
	}
}

func TestMountInfoJSON_Shape(t *testing.T) {
	svc := newTestService(t)
	state := &MountState{
		Lv: 19, Exp: 74546, UpLv: 2, AddRate: 5, AddRateDay: "6|1|1",
		UseDress: -1, GetDate: 1477836257080, ExtraDresses: map[string]int64{},
	}
	var m map[string]any
	if err := json.Unmarshal([]byte(svc.mountInfoJSON(state)), &m); err != nil {
		t.Fatalf("mountInfoJSON not valid JSON: %v", err)
	}
	if m["lv"] != float64(19) || m["exp"] != float64(74546) || m["upLv"] != float64(2) {
		t.Fatalf("scalar fields wrong: %v", m)
	}
	if m["addRate"] != float64(5) || m["useDress"] != float64(-1) || m["addRateDay"] != "6|1|1" {
		t.Fatalf("addRate/useDress/addRateDay wrong: %v", m)
	}
	dress, ok := m["dressData"].(map[string]any)
	if !ok {
		t.Fatalf("dressData = %v, want object", m["dressData"])
	}
	// upLv=2 -> dresses from type=2 rows 0,1,2 = {1,1,2} = {1,2}
	if _, has := dress["1"]; !has {
		t.Fatalf("dressData missing dress 1: %v", dress)
	}
	if _, has := dress["2"]; !has {
		t.Fatalf("dressData missing dress 2: %v", dress)
	}
	if _, has := dress["3"]; has {
		t.Fatalf("dressData has dress 3 (only owned through upLv=2): %v", dress)
	}
}
