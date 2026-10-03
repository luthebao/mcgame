// Open-sourced by BaoLT

// Awakening ("Giác Tỉnh") feature-pool state — the awakenPointDict economy plus the
// awakenAdd pity counter for the level-up gacha. Persisted under
// character_feature_states feature_key='awakening' as
// {"point":<pool>, "pointUsed":<int>, "pointDict":{"<skillCode>":<level>}, "awakenAdd":<int>}.
//
// SCOPE: the allocation economy and the points pool live here. awakenLevel stays in
// character_progression (statfeature.applyAwakeningBonus reads progression.AwakenLevel
// for the combat bonus AND the login read-path emits it from there, so it must remain
// single-source in progression — the gacha in gacha.go writes both stores). On first
// write the pool is initialized from progression.AwakenPoints / AwakenPointsUsed so
// existing column values carry over, after which this feature row is authoritative for
// the economy and the statfeature login read-path overrides
// awakenPoint/awakenPointUsed/awakenPointDict. awakenAdd is persisted for in-session
// continuity; the login read-path emits it as 0 (the client resets it on every reply).
package awaken

import (
	"strconv"
	"strings"
)

const (
	statePointKey     = "point"
	statePointUsedKey = "pointUsed"
	statePointDictKey = "pointDict"
	stateAwakenAddKey = "awakenAdd"
)

type State struct {
	Point     int
	PointUsed int
	PointDict map[string]int
	AwakenAdd int
}

func defaultState() *State {
	return &State{PointDict: map[string]int{}}
}

func stateFromMap(raw map[string]interface{}) *State {
	s := defaultState()
	if len(raw) == 0 {
		return s
	}
	if v, ok := intFrom(raw[statePointKey]); ok {
		s.Point = v
	}
	if v, ok := intFrom(raw[statePointUsedKey]); ok {
		s.PointUsed = v
	}
	if dict, ok := raw[statePointDictKey].(map[string]interface{}); ok {
		for k, v := range dict {
			if n, ok := intFrom(v); ok && n != 0 {
				s.PointDict[k] = n
			}
		}
	}
	if v, ok := intFrom(raw[stateAwakenAddKey]); ok {
		s.AwakenAdd = v
	}
	return s
}

func (s *State) toPersist() map[string]interface{} {
	return map[string]interface{}{
		statePointKey:     s.Point,
		statePointUsedKey: s.PointUsed,
		statePointDictKey: s.dictWire(),
		stateAwakenAddKey: s.AwakenAdd,
	}
}

func (s *State) dictWire() map[string]interface{} {
	out := make(map[string]interface{}, len(s.PointDict))
	for k, v := range s.PointDict {
		out[k] = v
	}
	return out
}

func (s *State) wire() map[string]interface{} {
	return map[string]interface{}{
		"awakenPoint":     s.Point,
		"awakenPointUsed": s.PointUsed,
		"awakenDict":      s.dictWire(),
	}
}

func skillCode(skillCodeName string) string {
	parts := strings.Split(skillCodeName, "|")
	if len(parts) == 0 {
		return skillCodeName
	}
	return parts[0]
}

func intFrom(v interface{}) (int, bool) {
	switch typed := v.(type) {
	case int:
		return typed, true
	case int32:
		return int(typed), true
	case int64:
		return int(typed), true
	case float32:
		return int(typed), true
	case float64:
		return int(typed), true
	case string:
		n, err := strconv.Atoi(typed)
		if err != nil {
			return 0, false
		}
		return n, true
	}
	return 0, false
}
