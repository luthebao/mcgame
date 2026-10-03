// Open-sourced by BaoLT

// Boss daily domain types for the Beast Handbook panel state.
package activity

import "fmt"

type BossDailyState struct {
	Day        string                 `json:"d"`
	UsedCount  int                    `json:"n"`
	Now        int64                  `json:"now"`
	PerBoss    map[string]interface{} `json:"data"`
	DoneForDay map[string]interface{} `json:"dfd"`
}

func NewBossDailyState() *BossDailyState {
	return &BossDailyState{
		Day:        "",
		UsedCount:  0,
		PerBoss:    map[string]interface{}{},
		DoneForDay: map[string]interface{}{},
	}
}

func (s *BossDailyState) IsNewDay(currentDay string) bool {
	return s.Day != currentDay
}

func (s *BossDailyState) Reset(day string, now int64) {
	s.Day = day
	s.UsedCount = 0
	s.Now = now
	s.DoneForDay = map[string]interface{}{}

	for bossID, entry := range s.PerBoss {
		m, ok := entry.(map[string]interface{})
		if !ok {
			continue
		}
		if _, hasT := m["t"]; hasT {
			s.PerBoss[bossID] = map[string]interface{}{
				"t": m["t"],
			}
		} else {
			s.PerBoss[bossID] = map[string]interface{}{
				"n": 0,
			}
		}
	}
}

func (s *BossDailyState) ToMap() map[string]interface{} {
	return map[string]interface{}{
		"d":    s.Day,
		"n":    s.UsedCount,
		"now":  s.Now,
		"data": s.PerBoss,
		"dfd":  s.DoneForDay,
	}
}

func FromMap(m map[string]interface{}) *BossDailyState {
	if m == nil {
		return NewBossDailyState()
	}
	state := &BossDailyState{
		PerBoss:    map[string]interface{}{},
		DoneForDay: map[string]interface{}{},
	}
	if v, ok := m["d"]; ok {
		state.Day, _ = v.(string)
	}
	if v, ok := m["n"]; ok {
		switch n := v.(type) {
		case float64:
			state.UsedCount = int(n)
		case int:
			state.UsedCount = n
		case int64:
			state.UsedCount = int(n)
		}
	}
	if v, ok := m["now"]; ok {
		switch n := v.(type) {
		case float64:
			state.Now = int64(n)
		case int:
			state.Now = int64(n)
		case int64:
			state.Now = n
		}
	}
	if v, ok := m["data"]; ok {
		if data, ok := v.(map[string]interface{}); ok {
			state.PerBoss = data
		}
	}
	if v, ok := m["dfd"]; ok {
		if dfd, ok := v.(map[string]interface{}); ok {
			state.DoneForDay = dfd
		}
	}
	return state
}

func BossDailyCycleDay(month int, day int, weekday int) string {
	return fmt.Sprintf("%d|%d|%d", month, day, weekday)
}
