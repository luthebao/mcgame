// Open-sourced by BaoLT

package star

import "strconv"

func defaultState() StarsState {
	out := make(StarsState, StarTypeMax)
	for t := StarTypeMin; t <= StarTypeMax; t++ {
		out[t] = &StarSlot{Type: t, Addition: 1.0}
	}
	return out
}

func decodeState(state map[string]interface{}) StarsState {
	out := defaultState()
	if state == nil {
		return out
	}
	for key, raw := range state {
		t, err := strconv.Atoi(key)
		if err != nil || !validStarType(t) {
			continue
		}
		obj, ok := raw.(map[string]interface{})
		if !ok {
			continue
		}
		slot := out[t]
		slot.Tid = intFrom(obj["tid"])
		slot.Level = intFrom(obj["level"])
		slot.Addition = float64From(obj["addition"])
		if slot.Addition <= 0 {
			slot.Addition = 1.0
		}
		slot.FinishDate = int64From(obj["finishDate"])
	}
	return out
}

func encodeState(state StarsState) map[string]interface{} {
	out := make(map[string]interface{}, len(state))
	for t, slot := range state {
		if slot == nil {
			continue
		}
		out[strconv.Itoa(t)] = map[string]interface{}{
			"tid":        slot.Tid,
			"level":      slot.Level,
			"addition":   slot.Addition,
			"finishDate": slot.FinishDate,
		}
	}
	return out
}

func StateToWire(state StarsState) map[string]interface{} {
	return encodeState(state)
}

func intFrom(v interface{}) int {
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

func int64From(v interface{}) int64 {
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

func float64From(v interface{}) float64 {
	switch n := v.(type) {
	case float64:
		return n
	case int:
		return float64(n)
	case int64:
		return float64(n)
	}
	return 0
}
