// Open-sourced by BaoLT

// Heiyaoshi typed state representation and JSONB encoding for the player state blob.
package heiyaoshi

import (
	"sort"
	"strconv"
)

type State struct {
	LastActFigure int
	ActPoint      []int
	ActArea       map[int]bool
	ActLine       map[int]bool
	AreaNum       int
	LineNum       int
	Buff          map[int]float64
}

func NewState() *State {
	return &State{
		LastActFigure: MinFigure,
		ActPoint:      []int{},
		ActArea:       make(map[int]bool),
		ActLine:       make(map[int]bool),
		Buff:          make(map[int]float64),
	}
}

func DecodeState(blob map[string]any) *State {
	s := NewState()
	if blob == nil {
		return s
	}
	if v, ok := intFromAny(blob["lastActFigure"]); ok && v >= MinFigure {
		s.LastActFigure = v
	}
	s.ActPoint = decodeIntList(blob["actPoint"])
	s.ActArea = decodeIntBoolMap(blob["actArea"])
	s.ActLine = decodeIntBoolMap(blob["actLine"])
	if v, ok := intFromAny(blob["AreaNum"]); ok {
		s.AreaNum = v
	} else {
		s.AreaNum = len(s.ActArea)
	}
	if v, ok := intFromAny(blob["LineNum"]); ok {
		s.LineNum = v
	} else {
		s.LineNum = len(s.ActLine)
	}
	s.Buff = decodeBuff(blob["Buff"])
	return s
}

func (s *State) Encode() map[string]any {
	if s == nil {
		s = NewState()
	}
	return map[string]any{
		"lastActFigure": s.LastActFigure,
		"actPoint":      encodeIntList(s.ActPoint),
		"actArea":       encodeIntBoolMap(s.ActArea),
		"actLine":       encodeIntBoolMap(s.ActLine),
		"AreaNum":       s.AreaNum,
		"LineNum":       s.LineNum,
		"Buff":          encodeBuff(s.Buff),
	}
}

func (s *State) HasPoint(point int) bool {
	for _, p := range s.ActPoint {
		if p == point {
			return true
		}
	}
	return false
}

func (s *State) AddPoint(point int) {
	s.ActPoint = append(s.ActPoint, point)
}

func (s *State) HasArea(area int) bool {
	return s.ActArea != nil && s.ActArea[area]
}

func (s *State) MarkArea(area int) {
	if s.ActArea == nil {
		s.ActArea = make(map[int]bool)
	}
	s.ActArea[area] = true
	s.AreaNum = len(s.ActArea)
}

func (s *State) HasLine(line int) bool {
	return s.ActLine != nil && s.ActLine[line]
}

func (s *State) MarkLine(line int) {
	if s.ActLine == nil {
		s.ActLine = make(map[int]bool)
	}
	s.ActLine[line] = true
	s.LineNum = len(s.ActLine)
}

func (s *State) ResetCurrentFigure() {
	s.ActPoint = []int{}
	s.ActArea = make(map[int]bool)
	s.ActLine = make(map[int]bool)
	s.AreaNum = 0
	s.LineNum = 0
}

func decodeIntList(value any) []int {
	switch typed := value.(type) {
	case []any:
		out := make([]int, 0, len(typed))
		for _, item := range typed {
			if v, ok := intFromAny(item); ok {
				out = append(out, v)
			}
		}
		return out
	case map[string]any:
		out := make([]int, 0, len(typed))
		for _, item := range typed {
			if v, ok := intFromAny(item); ok {
				out = append(out, v)
			}
		}
		sort.Ints(out)
		return out
	}
	return []int{}
}

func decodeIntBoolMap(value any) map[int]bool {
	out := make(map[int]bool)
	switch typed := value.(type) {
	case map[string]any:
		for key, raw := range typed {
			id, err := strconv.Atoi(key)
			if err != nil {
				continue
			}
			if isTruthy(raw) {
				out[id] = true
			}
		}
	case []any:
		for _, item := range typed {
			if id, ok := intFromAny(item); ok {
				out[id] = true
			}
		}
	}
	return out
}

func decodeBuff(value any) map[int]float64 {
	out := make(map[int]float64)
	bucket, ok := value.(map[string]any)
	if !ok {
		return out
	}
	for key, raw := range bucket {
		propID, err := strconv.Atoi(key)
		if err != nil {
			continue
		}
		if v, ok := floatFromAny(raw); ok {
			out[propID] = v
		}
	}
	return out
}

func encodeIntList(in []int) []any {
	out := make([]any, len(in))
	for i, v := range in {
		out[i] = v
	}
	return out
}

func encodeIntBoolMap(in map[int]bool) map[string]any {
	out := make(map[string]any, len(in))
	for id, active := range in {
		if active {
			out[strconv.Itoa(id)] = 1
		}
	}
	return out
}

func encodeBuff(in map[int]float64) map[string]any {
	out := make(map[string]any, len(in))
	for propID, value := range in {
		if value == float64(int64(value)) {
			out[strconv.Itoa(propID)] = int64(value)
			continue
		}
		out[strconv.Itoa(propID)] = value
	}
	return out
}

func intFromAny(value any) (int, bool) {
	switch typed := value.(type) {
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
		v, err := strconv.Atoi(typed)
		if err != nil {
			return 0, false
		}
		return v, true
	}
	return 0, false
}

func floatFromAny(value any) (float64, bool) {
	switch typed := value.(type) {
	case float64:
		return typed, true
	case float32:
		return float64(typed), true
	case int:
		return float64(typed), true
	case int32:
		return float64(typed), true
	case int64:
		return float64(typed), true
	case string:
		v, err := strconv.ParseFloat(typed, 64)
		if err != nil {
			return 0, false
		}
		return v, true
	}
	return 0, false
}

func isTruthy(value any) bool {
	switch typed := value.(type) {
	case bool:
		return typed
	case int:
		return typed != 0
	case int64:
		return typed != 0
	case float64:
		return typed != 0
	case string:
		return typed != "" && typed != "0" && typed != "false"
	}
	return false
}
