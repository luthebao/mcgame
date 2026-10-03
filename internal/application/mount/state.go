// Open-sourced by BaoLT

// MountState persists the Thú Cưỡi (mount) feature under character_feature_states
// with feature_key='mount'. lv/exp track riding progression (TBL_MOUNT type=1
// cumulative exp thresholds); upLv tracks evolution rank (TBL_MOUNT type=2) which
// unlocks dresses and raises the level cap; addRate is the accumulated lucky points
// for the next evolution attempt. Owned base dresses are derived from upLv; timed
// dresses (shop/renew) live in extraDresses with a ms-epoch expiry (1 = permanent).
package mount

type MountState struct {
	Lv           int
	Exp          int
	UpLv         int
	AddRate      int
	AddRateDay   string
	UseDress     int
	GetDate      int64
	ExtraDresses map[string]int64
}

func defaultMountState() *MountState {
	return &MountState{
		Lv:           0,
		Exp:          0,
		UpLv:         0,
		AddRate:      0,
		AddRateDay:   "0|0|0",
		UseDress:     -1,
		GetDate:      0,
		ExtraDresses: map[string]int64{},
	}
}

func (s *MountState) ToMap() map[string]any {
	extra := make(map[string]any, len(s.ExtraDresses))
	for id, expiry := range s.ExtraDresses {
		extra[id] = expiry
	}
	return map[string]any{
		"lv":           s.Lv,
		"exp":          s.Exp,
		"upLv":         s.UpLv,
		"addRate":      s.AddRate,
		"addRateDay":   s.AddRateDay,
		"useDress":     s.UseDress,
		"getDate":      s.GetDate,
		"extraDresses": extra,
	}
}

func mountStateFromMap(m map[string]any) *MountState {
	state := defaultMountState()
	if m == nil {
		return state
	}
	state.Lv = intFrom(m["lv"])
	state.Exp = intFrom(m["exp"])
	state.UpLv = intFrom(m["upLv"])
	state.AddRate = intFrom(m["addRate"])
	if v, ok := m["useDress"]; ok {
		state.UseDress = intFrom(v)
	}
	state.GetDate = int64From(m["getDate"])
	if v, ok := m["addRateDay"].(string); ok && v != "" {
		state.AddRateDay = v
	}
	if raw, ok := m["extraDresses"].(map[string]any); ok {
		for id, expiry := range raw {
			state.ExtraDresses[id] = int64From(expiry)
		}
	}
	return state
}

func intFrom(v any) int {
	switch n := v.(type) {
	case int:
		return n
	case int64:
		return int(n)
	case float64:
		return int(n)
	}
	return 0
}

func int64From(v any) int64 {
	switch n := v.(type) {
	case int64:
		return n
	case int:
		return int64(n)
	case float64:
		return int64(n)
	}
	return 0
}
