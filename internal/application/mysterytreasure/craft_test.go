// Open-sourced by BaoLT

package mysterytreasure

import (
	"context"
	"testing"

	"go.uber.org/zap"
)

func TestMakeCapForAddTimes(t *testing.T) {
	if got := MakeCapForAddTimes(0); got != mysBaseDailyMakeCap {
		t.Fatalf("cap(0) = %d, want %d", got, mysBaseDailyMakeCap)
	}
	if got := MakeCapForAddTimes(3); got != mysBaseDailyMakeCap+3 {
		t.Fatalf("cap(3) = %d, want %d", got, mysBaseDailyMakeCap+3)
	}
	if got := MakeCapForAddTimes(-5); got != mysBaseDailyMakeCap {
		t.Fatalf("negative addTimes should clamp to base, got %d", got)
	}
}

func TestAddTimesGoldCost_MirrorsClientTiers(t *testing.T) {
	cases := []struct {
		n        int
		wantCost int
		wantOK   bool
	}{
		{0, 20, true},
		{4, 20, true},
		{5, 30, true},
		{9, 30, true},
		{10, 40, true},
		{24, 60, true},
		{25, 70, true},
		{39, 70, true},
		{40, 0, false},
		{100, 0, false},
	}
	for _, c := range cases {
		cost, ok := AddTimesGoldCost(c.n)
		if cost != c.wantCost || ok != c.wantOK {
			t.Fatalf("AddTimesGoldCost(%d) = (%d,%v), want (%d,%v)", c.n, cost, ok, c.wantCost, c.wantOK)
		}
	}
}

func TestRefreshDailyCounters_ResetsOnNewDay(t *testing.T) {
	st := DefaultState()
	st.AddTimes = DailyCounter{N: 7, T: "4|1"}
	st.MakeLimit = DailyCounter{N: 2, T: "4|1"}

	changed := RefreshDailyCounters(st, "5|2")
	if !changed {
		t.Fatalf("expected change on new day")
	}
	if st.AddTimes.N != 0 || st.AddTimes.T != "5|2" {
		t.Fatalf("addTimes not reset: %+v", st.AddTimes)
	}
	if st.MakeLimit.N != mysBaseDailyMakeCap || st.MakeLimit.T != "5|2" {
		t.Fatalf("make cap not refilled to base: %+v", st.MakeLimit)
	}
}

func TestRefreshDailyCounters_NoChangeSameDay(t *testing.T) {
	st := DefaultState()
	st.AddTimes = DailyCounter{N: 3, T: "5|2"}
	st.MakeLimit = DailyCounter{N: 5, T: "5|2"}

	if RefreshDailyCounters(st, "5|2") {
		t.Fatalf("expected no change on same day")
	}
	if st.MakeLimit.N != 5 {
		t.Fatalf("same-day make cap must not be refilled, got %d", st.MakeLimit.N)
	}
}

func TestPurchaseAddTime_ChargesAndRecomputesCap(t *testing.T) {
	svc := NewService(newFakeRepo(), zap.NewNop())
	st := DefaultState()
	st.AddTimes = DailyCounter{N: 0, T: "5|2"}
	st.MakeLimit = DailyCounter{N: mysBaseDailyMakeCap, T: "5|2"}

	cost, ok := svc.PurchaseAddTime(st, "5|2")
	if !ok || cost != 20 {
		t.Fatalf("first purchase cost = (%d,%v), want (20,true)", cost, ok)
	}
	if st.AddTimes.N != 1 {
		t.Fatalf("addTimes.n should be 1, got %d", st.AddTimes.N)
	}
	if st.MakeLimit.N != mysBaseDailyMakeCap+1 {
		t.Fatalf("make cap should recompute to base+1, got %d", st.MakeLimit.N)
	}
}

func TestPurchaseAddTime_MaxTierRejected(t *testing.T) {
	svc := NewService(newFakeRepo(), zap.NewNop())
	st := DefaultState()
	st.AddTimes = DailyCounter{N: 40, T: "5|2"}

	_, ok := svc.PurchaseAddTime(st, "5|2")
	if ok {
		t.Fatalf("purchase at max tier should be rejected")
	}
	if st.AddTimes.N != 40 {
		t.Fatalf("addTimes.n must be unchanged on rejected purchase, got %d", st.AddTimes.N)
	}
}

func TestLoadRefreshed_PersistsRoll(t *testing.T) {
	repo := newFakeRepo()
	svc := NewService(repo, zap.NewNop())
	ctx := context.Background()

	st := DefaultState()
	st.AddTimes = DailyCounter{N: 9, T: "1|1"}
	st.MakeLimit = DailyCounter{N: 0, T: "1|1"}
	if err := svc.Save(ctx, 1, st); err != nil {
		t.Fatalf("save: %v", err)
	}

	got, err := svc.LoadRefreshed(ctx, 1, "6|15")
	if err != nil {
		t.Fatalf("LoadRefreshed: %v", err)
	}
	if got.MakeLimit.N != mysBaseDailyMakeCap || got.MakeLimit.T != "6|15" {
		t.Fatalf("rolled make cap = %+v", got.MakeLimit)
	}
	reloaded, _ := svc.Load(ctx, 1)
	if reloaded.MakeLimit.T != "6|15" {
		t.Fatalf("roll was not persisted: %+v", reloaded.MakeLimit)
	}
}

func TestStateRoundTrip_NewFields(t *testing.T) {
	st := DefaultState()
	st.ActiveObj["3"] = 3
	st.AddTimes = DailyCounter{N: 4, T: "5|10"}
	st.MakeLimit = DailyCounter{N: 14, T: "5|10"}
	st.MysBook["1"] = map[string]int{"7": 7, "8": 8}
	st.Bag["2"] = BagSlot{Mid: 123, Num: 3}

	decoded := decodeState(encodeState(st))

	if decoded.ActiveObj["3"] != 3 {
		t.Fatalf("activeObj round-trip failed: %+v", decoded.ActiveObj)
	}
	if decoded.AddTimes.N != 4 || decoded.AddTimes.T != "5|10" {
		t.Fatalf("addTimes round-trip failed: %+v", decoded.AddTimes)
	}
	if decoded.MakeLimit.N != 14 || decoded.MakeLimit.T != "5|10" {
		t.Fatalf("makeLimit round-trip failed: %+v", decoded.MakeLimit)
	}
	if decoded.MysBook["1"]["7"] != 7 || decoded.MysBook["1"]["8"] != 8 {
		t.Fatalf("mysBook round-trip failed: %+v", decoded.MysBook)
	}
	if decoded.Bag["2"].Mid != 123 || decoded.Bag["2"].Num != 3 {
		t.Fatalf("bag round-trip failed: %+v", decoded.Bag)
	}
}

func TestDefaultState_NewFieldsPresent(t *testing.T) {
	st := DefaultState()
	if st.ActiveObj == nil || st.MysBook == nil {
		t.Fatalf("default state maps must be non-nil")
	}
	if st.AddTimes.T != "0|0" || st.MakeLimit.T != "0|0" {
		t.Fatalf("default daily counters mismatch: %+v %+v", st.AddTimes, st.MakeLimit)
	}
}
