// Open-sourced by BaoLT

// Unit tests for boss daily domain state and config.
package activity

import "testing"

func TestNewBossDailyState_Defaults(t *testing.T) {
	state := NewBossDailyState()
	if state.Day != "" {
		t.Fatalf("Day = %q, want empty", state.Day)
	}
	if state.UsedCount != 0 {
		t.Fatalf("UsedCount = %d, want 0", state.UsedCount)
	}
	if len(state.PerBoss) != 0 {
		t.Fatalf("PerBoss len = %d, want 0", len(state.PerBoss))
	}
	if len(state.DoneForDay) != 0 {
		t.Fatalf("DoneForDay len = %d, want 0", len(state.DoneForDay))
	}
}

func TestIsNewDay_SameDay_ReturnsFalse(t *testing.T) {
	state := &BossDailyState{Day: "3|13|1"}
	if state.IsNewDay("3|13|1") {
		t.Fatal("IsNewDay same day = true, want false")
	}
}

func TestIsNewDay_DifferentDay_ReturnsTrue(t *testing.T) {
	state := &BossDailyState{Day: "3|12|0"}
	if !state.IsNewDay("3|13|1") {
		t.Fatal("IsNewDay different day = false, want true")
	}
}

func TestIsNewDay_EmptyDay_ReturnsTrue(t *testing.T) {
	state := NewBossDailyState()
	if !state.IsNewDay("3|13|1") {
		t.Fatal("IsNewDay empty day = false, want true")
	}
}

func TestReset_ClearsDailyState(t *testing.T) {
	state := &BossDailyState{
		Day:       "3|12|0",
		UsedCount: 5,
		Now:       1000,
		PerBoss: map[string]interface{}{
			"2204": map[string]interface{}{"d": "3|12|0", "n": 2},
			"2265": map[string]interface{}{"t": int64(1000)},
		},
		DoneForDay: map[string]interface{}{
			"2204": 2204,
		},
	}

	state.Reset("3|13|1", 2000)

	if state.Day != "3|13|1" {
		t.Fatalf("Day = %q, want %q", state.Day, "3|13|1")
	}
	if state.UsedCount != 0 {
		t.Fatalf("UsedCount = %d, want 0", state.UsedCount)
	}
	if state.Now != 2000 {
		t.Fatalf("Now = %d, want 2000", state.Now)
	}
	if len(state.DoneForDay) != 0 {
		t.Fatalf("DoneForDay len = %d, want 0", len(state.DoneForDay))
	}
}

func TestReset_PreservesType2Cooldowns(t *testing.T) {
	state := &BossDailyState{
		PerBoss: map[string]interface{}{
			"2204": map[string]interface{}{"d": "3|12|0", "n": 2},
			"2265": map[string]interface{}{"t": int64(1000)},
		},
	}

	state.Reset("3|13|1", 2000)

	entry2204 := state.PerBoss["2204"].(map[string]interface{})
	if n, ok := entry2204["n"]; !ok || n.(int) != 0 {
		t.Fatalf("type-1 boss n after reset = %v, want 0", entry2204["n"])
	}
	if _, ok := entry2204["d"]; ok {
		t.Fatal("type-1 boss should not have 'd' after reset")
	}

	entry2265 := state.PerBoss["2265"].(map[string]interface{})
	if tVal, ok := entry2265["t"]; !ok || tVal.(int64) != 1000 {
		t.Fatalf("type-2 boss t after reset = %v, want 1000", entry2265["t"])
	}
}

func TestToMap(t *testing.T) {
	state := &BossDailyState{
		Day:       "3|13|1",
		UsedCount: 3,
		Now:       2000,
		PerBoss:   map[string]interface{}{"2204": map[string]interface{}{"n": 1}},
		DoneForDay: map[string]interface{}{"2204": 2204},
	}

	m := state.ToMap()
	if m["d"] != "3|13|1" {
		t.Fatalf("d = %v, want 3|13|1", m["d"])
	}
	if m["n"] != 3 {
		t.Fatalf("n = %v, want 3", m["n"])
	}
	if m["now"] != int64(2000) {
		t.Fatalf("now = %v, want 2000", m["now"])
	}
	if m["data"] == nil {
		t.Fatal("data is nil")
	}
	if m["dfd"] == nil {
		t.Fatal("dfd is nil")
	}
}

func TestFromMap_NilInput(t *testing.T) {
	state := FromMap(nil)
	if state.Day != "" {
		t.Fatalf("Day = %q, want empty", state.Day)
	}
	if state.UsedCount != 0 {
		t.Fatalf("UsedCount = %d, want 0", state.UsedCount)
	}
	if len(state.PerBoss) != 0 {
		t.Fatalf("PerBoss len = %d, want 0", len(state.PerBoss))
	}
}

func TestFromMap_FullState(t *testing.T) {
	m := map[string]interface{}{
		"d":   "3|13|1",
		"n":   float64(5),
		"now": float64(2000),
		"data": map[string]interface{}{
			"2204": map[string]interface{}{"d": "3|13|1", "n": float64(2)},
		},
		"dfd": map[string]interface{}{
			"2204": float64(2204),
		},
	}

	state := FromMap(m)
	if state.Day != "3|13|1" {
		t.Fatalf("Day = %q, want 3|13|1", state.Day)
	}
	if state.UsedCount != 5 {
		t.Fatalf("UsedCount = %d, want 5", state.UsedCount)
	}
	if state.Now != 2000 {
		t.Fatalf("Now = %d, want 2000", state.Now)
	}
	if len(state.PerBoss) != 1 {
		t.Fatalf("PerBoss len = %d, want 1", len(state.PerBoss))
	}
	if len(state.DoneForDay) != 1 {
		t.Fatalf("DoneForDay len = %d, want 1", len(state.DoneForDay))
	}
}

func TestBossDailyCycleDay(t *testing.T) {
	result := BossDailyCycleDay(3, 13, 1)
	if result != "3|13|1" {
		t.Fatalf("BossDailyCycleDay(3,13,1) = %q, want %q", result, "3|13|1")
	}
}

func TestGetBossConfig_Type1Normal(t *testing.T) {
	cfg := GetBossConfig(2204)
	if cfg == nil {
		t.Fatal("GetBossConfig(2204) = nil, want config")
	}
	if cfg.Type != 1 {
		t.Fatalf("Type = %d, want 1", cfg.Type)
	}
	if cfg.IsSuper != 0 {
		t.Fatalf("IsSuper = %d, want 0", cfg.IsSuper)
	}
	if cfg.Num != 2 {
		t.Fatalf("Num = %d, want 2", cfg.Num)
	}
	if cfg.S != 1.0 {
		t.Fatalf("S = %f, want 1.0", cfg.S)
	}
}

func TestGetBossConfig_Type1Super(t *testing.T) {
	cfg := GetBossConfig(2262)
	if cfg == nil {
		t.Fatal("GetBossConfig(2262) = nil, want config")
	}
	if cfg.IsSuper != 1 {
		t.Fatalf("IsSuper = %d, want 1", cfg.IsSuper)
	}
}

func TestGetBossConfig_Type2Cooldown(t *testing.T) {
	cfg := GetBossConfig(2265)
	if cfg == nil {
		t.Fatal("GetBossConfig(2265) = nil, want config")
	}
	if cfg.Type != 2 {
		t.Fatalf("Type = %d, want 2", cfg.Type)
	}
	if cfg.Step != 259200000 {
		t.Fatalf("Step = %d, want 259200000", cfg.Step)
	}
}

func TestGetBossConfig_SpecialScale(t *testing.T) {
	cfg := GetBossConfig(2263)
	if cfg == nil {
		t.Fatal("GetBossConfig(2263) = nil")
	}
	if cfg.S != 0.7 {
		t.Fatalf("S = %f, want 0.7", cfg.S)
	}
}

func TestGetBossConfig_InvalidID(t *testing.T) {
	cfg := GetBossConfig(9999)
	if cfg != nil {
		t.Fatal("GetBossConfig(9999) should be nil")
	}
}

func TestIsWildBoss_WildEntry(t *testing.T) {
	if !IsWildBoss(2262) {
		t.Fatal("IsWildBoss(2262) = false, want true")
	}
	if !IsWildBoss(2468) {
		t.Fatal("IsWildBoss(2468) = false, want true")
	}
}

func TestIsWildBoss_NormalEntry(t *testing.T) {
	if IsWildBoss(2204) {
		t.Fatal("IsWildBoss(2204) = true, want false")
	}
}

func TestBossConfig_Count(t *testing.T) {
	if len(BossDailyConfigs) == 0 {
		t.Fatal("BossDailyConfigs is empty")
	}
	allIDs := []int{
		2204, 2205, 2206, 2207, 2208, 2209, 2210, 2211, 2212, 2213,
		2214, 2215, 2216, 2217, 2218, 2219, 2220, 2221, 2222, 2223,
		2224, 2225, 2226, 2227, 2228, 2229, 2230, 2231, 2232, 2233,
		2234, 2235, 2236, 2237, 2238, 2239, 2240, 2241, 2242, 2243,
		2244, 2245, 2246, 2247, 2248, 2249, 2250, 2251, 2252, 2253,
		2254, 2255, 2256, 2257, 2258, 2259, 2260, 2261, 2262, 2263,
		2264, 2265, 2266, 2267, 2268, 2269, 2270, 2271, 2272, 2273,
		2274, 2275, 2455, 2456, 2457, 2458, 2468, 2567, 2568,
	}
	for _, id := range allIDs {
		if GetBossConfig(id) == nil {
			t.Errorf("missing boss config for ID %d", id)
		}
	}
}

func TestFromMap_IntVariants(t *testing.T) {
	m := map[string]interface{}{
		"n":   3,
		"now": int64(5000),
	}
	state := FromMap(m)
	if state.UsedCount != 3 {
		t.Fatalf("UsedCount = %d, want 3", state.UsedCount)
	}
	if state.Now != 5000 {
		t.Fatalf("Now = %d, want 5000", state.Now)
	}
}
