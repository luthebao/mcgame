// Open-sourced by BaoLT

// State encode/decode helpers for the mystery_treasure feature-state JSONB blob.
// Persisted under feature_key="mystery_treasure" in character_stat_features.
//
// Persisted fields:
//   - Bag        : mysBag, map of slot-index string to {mid, num} (mystery item id + qty).
//   - LearnedRec : identity map of learned recipe id -> id.
//   - SkilLvl    : make-skill level. SkiPt: accumulated skill points.
//   - Scores     : furnace score-type (string key) to owned count; 16 types.
//   - ActiveObj  : unlocked-tab map {kind(1-11): kind}; flipped on first craft of a kind.
//   - AddTimes   : purchased daily craft-slots {N, T:"month0idx|day"} (AS3 0-based month).
//   - MakeLimit  : remaining daily craft cap {N, T:"month0idx|day"}.
//   - MysBook    : crafted codex, map of kind string -> set of crafted mysId (mysId:mysId).
//
// AddTimes.T / MakeLimit.T encode the daily-reset date as "<month0idx>|<day>" exactly as the
// Flash client builds it (now.getMonth()+"|"+now.getDate()); a mismatch with today resets N.
package mysterytreasure

type MysteryTreasureState struct {
	Bag        map[string]BagSlot
	LearnedRec map[string]int
	SkilLvl    int
	SkiPt      int
	Scores     map[string]int
	ActiveObj  map[string]int
	AddTimes   DailyCounter
	MakeLimit  DailyCounter
	MysBook    map[string]map[string]int
}

type BagSlot struct {
	Mid int
	Num int
}

type DailyCounter struct {
	N int
	T string
}

func DefaultState() *MysteryTreasureState {
	return &MysteryTreasureState{
		Bag:        map[string]BagSlot{},
		LearnedRec: map[string]int{},
		SkilLvl:    1,
		SkiPt:      0,
		Scores:     map[string]int{},
		ActiveObj:  map[string]int{},
		AddTimes:   DailyCounter{N: 0, T: "0|0"},
		MakeLimit:  DailyCounter{N: 0, T: "0|0"},
		MysBook:    map[string]map[string]int{},
	}
}

func decodeState(raw map[string]interface{}) *MysteryTreasureState {
	st := DefaultState()
	if raw == nil {
		return st
	}
	if n, ok := toInt(raw["skiLvl"]); ok {
		st.SkilLvl = n
	}
	if n, ok := toInt(raw["skiPt"]); ok {
		st.SkiPt = n
	}
	if m, ok := raw["learnedRec"].(map[string]interface{}); ok {
		for k, val := range m {
			if n, ok := toInt(val); ok {
				st.LearnedRec[k] = n
			}
		}
	}
	if m, ok := raw["bag"].(map[string]interface{}); ok {
		for k, val := range m {
			if slot, ok := parseBagSlot(val); ok {
				st.Bag[k] = slot
			}
		}
	}
	if m, ok := raw["scores"].(map[string]interface{}); ok {
		for k, val := range m {
			if n, ok := toInt(val); ok {
				st.Scores[k] = n
			}
		}
	}
	if m, ok := raw["activeObj"].(map[string]interface{}); ok {
		for k, val := range m {
			if n, ok := toInt(val); ok {
				st.ActiveObj[k] = n
			}
		}
	}
	if dc, ok := parseDailyCounter(raw["addTimes"]); ok {
		st.AddTimes = dc
	}
	if dc, ok := parseDailyCounter(raw["makeLimitTimes"]); ok {
		st.MakeLimit = dc
	}
	if m, ok := raw["mysBook"].(map[string]interface{}); ok {
		for kind, val := range m {
			inner, ok := val.(map[string]interface{})
			if !ok {
				continue
			}
			set := make(map[string]int, len(inner))
			for mysID, idVal := range inner {
				if n, ok := toInt(idVal); ok {
					set[mysID] = n
				}
			}
			st.MysBook[kind] = set
		}
	}
	return st
}

func encodeState(st *MysteryTreasureState) map[string]interface{} {
	rec := make(map[string]interface{}, len(st.LearnedRec))
	for k, v := range st.LearnedRec {
		rec[k] = float64(v)
	}
	scores := make(map[string]interface{}, len(st.Scores))
	for k, v := range st.Scores {
		scores[k] = float64(v)
	}
	active := make(map[string]interface{}, len(st.ActiveObj))
	for k, v := range st.ActiveObj {
		active[k] = float64(v)
	}
	book := make(map[string]interface{}, len(st.MysBook))
	for kind, set := range st.MysBook {
		inner := make(map[string]interface{}, len(set))
		for mysID, v := range set {
			inner[mysID] = float64(v)
		}
		book[kind] = inner
	}
	return map[string]interface{}{
		"skiLvl":         float64(st.SkilLvl),
		"skiPt":          float64(st.SkiPt),
		"learnedRec":     rec,
		"bag":            BagToWire(st.Bag),
		"scores":         scores,
		"activeObj":      active,
		"addTimes":       dailyCounterToWire(st.AddTimes),
		"makeLimitTimes": dailyCounterToWire(st.MakeLimit),
		"mysBook":        book,
	}
}

func parseBagSlot(v interface{}) (BagSlot, bool) {
	m, ok := v.(map[string]interface{})
	if !ok {
		return BagSlot{}, false
	}
	var slot BagSlot
	if n, ok := toInt(m["mid"]); ok {
		slot.Mid = n
	}
	if n, ok := toInt(m["num"]); ok {
		slot.Num = n
	}
	return slot, true
}

func parseDailyCounter(v interface{}) (DailyCounter, bool) {
	m, ok := v.(map[string]interface{})
	if !ok {
		return DailyCounter{}, false
	}
	dc := DailyCounter{T: "0|0"}
	if n, ok := toInt(m["n"]); ok {
		dc.N = n
	}
	if t, ok := m["t"].(string); ok && t != "" {
		dc.T = t
	}
	return dc, true
}

func dailyCounterToWire(dc DailyCounter) map[string]interface{} {
	t := dc.T
	if t == "" {
		t = "0|0"
	}
	return map[string]interface{}{
		"n": float64(dc.N),
		"t": t,
	}
}

func toInt(v interface{}) (int, bool) {
	switch x := v.(type) {
	case float64:
		return int(x), true
	case int:
		return x, true
	case int64:
		return int(x), true
	}
	return 0, false
}
