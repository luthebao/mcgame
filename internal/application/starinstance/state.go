// Open-sourced by BaoLT

// WarMapState stores the daily attempts and lifetime score grid for the
// Tinh Giới Thập Nhị Cung (12x12 zodiac instance) feature.
// Persisted under player.character_feature_states with feature_key='star_instance'.
// Scores are percentages (0-100, fractional) matching the client wire format so the
// login starFlag.warMap round-trips losslessly; ComputeScore currently yields whole numbers.
package starinstance

import "strconv"

const (
	WarMapSidMin   = 1
	WarMapSidMax   = 12
	WarMapLevelMin = 1
	WarMapLevelMax = 12
	WarMapMaxSmax  = 10
	WarMapMinSmax  = 5
)

type WarMapState struct {
	Scores     map[int]map[int]float64
	DailyMax   int
	DailyUsed  int
	ResetCycle int
}

func defaultWarMapState(cycle int) *WarMapState {
	scores := make(map[int]map[int]float64, WarMapLevelMax)
	for lvl := WarMapLevelMin; lvl <= WarMapLevelMax; lvl++ {
		scores[lvl] = make(map[int]float64, WarMapSidMax)
		for sid := WarMapSidMin; sid <= WarMapSidMax; sid++ {
			scores[lvl][sid] = 0
		}
	}
	return &WarMapState{
		Scores:     scores,
		DailyMax:   WarMapMinSmax,
		DailyUsed:  0,
		ResetCycle: cycle,
	}
}

func (s *WarMapState) MaybeResetForCycle(currentCycle int) {
	if s.ResetCycle == currentCycle {
		return
	}
	s.DailyUsed = 0
	s.DailyMax = WarMapMinSmax
	s.ResetCycle = currentCycle
}

func (s *WarMapState) ToMap() map[string]any {
	scoresOut := make(map[string]any, len(s.Scores))
	for lvl, sidMap := range s.Scores {
		inner := make(map[string]any, len(sidMap))
		for sid, score := range sidMap {
			inner[strconv.Itoa(sid)] = score
		}
		scoresOut[strconv.Itoa(lvl)] = inner
	}
	return map[string]any{
		"scores":     scoresOut,
		"dailyMax":   s.DailyMax,
		"dailyUsed":  s.DailyUsed,
		"resetCycle": s.ResetCycle,
	}
}

func WarMapStateFromMap(m map[string]any, cycle int) *WarMapState {
	if m == nil {
		return defaultWarMapState(cycle)
	}
	state := defaultWarMapState(cycle)
	state.DailyMax = max(min(intFrom(m["dailyMax"]), WarMapMaxSmax), WarMapMinSmax)
	state.DailyUsed = intFrom(m["dailyUsed"])
	state.ResetCycle = intFrom(m["resetCycle"])

	rawScores, ok := m["scores"].(map[string]any)
	if !ok {
		return state
	}
	for lvlKey, rawSids := range rawScores {
		lvl, err := strconv.Atoi(lvlKey)
		if err != nil || lvl < WarMapLevelMin || lvl > WarMapLevelMax {
			continue
		}
		sidMap, ok := rawSids.(map[string]any)
		if !ok {
			continue
		}
		for sidKey, rawScore := range sidMap {
			sid, err := strconv.Atoi(sidKey)
			if err != nil || sid < WarMapSidMin || sid > WarMapSidMax {
				continue
			}
			state.Scores[lvl][sid] = max(min(floatFrom(rawScore), 100), 0)
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

func floatFrom(v any) float64 {
	switch n := v.(type) {
	case float64:
		return n
	case float32:
		return float64(n)
	case int:
		return float64(n)
	case int64:
		return float64(n)
	}
	return 0
}

func (s *WarMapState) LoginGrid() map[string]any {
	grid := make(map[string]any)
	for lvl, sidMap := range s.Scores {
		inner := make(map[string]any)
		for sid, score := range sidMap {
			if score > 0 {
				inner[strconv.Itoa(sid)] = score
			}
		}
		if len(inner) > 0 {
			grid[strconv.Itoa(lvl)] = inner
		}
	}
	return grid
}
