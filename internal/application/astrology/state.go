// Open-sourced by BaoLT

// State encode/decode helpers for the astrology feature-state JSONB blob.
// The blob is persisted under feature_key="magic_array" in character_stat_features.
package astrology

func defaultState() *AstrologicState {
	return &AstrologicState{
		StarsCollected:  []int{},
		StarsToPick:     []int{},
		PickCount:       0,
		RefreshCount:    0,
		BuyPickCount:    0,
		FormulasClaimed: []int{},
	}
}

func decodeState(raw map[string]interface{}) *AstrologicState {
	state := defaultState()
	if raw == nil {
		return state
	}
	if v, ok := raw["pickCount"]; ok {
		if n, ok := toInt(v); ok {
			state.PickCount = n
		}
	}
	if v, ok := raw["refreshCount"]; ok {
		if n, ok := toInt(v); ok {
			state.RefreshCount = n
		}
	}
	if v, ok := raw["buyPickCount"]; ok {
		if n, ok := toInt(v); ok {
			state.BuyPickCount = n
		}
	}
	if v, ok := raw["starsCollected"]; ok {
		state.StarsCollected = toIntSlice(v)
	}
	if v, ok := raw["starsToPick"]; ok {
		state.StarsToPick = toIntSlice(v)
	}
	if v, ok := raw["formulasClaimed"]; ok {
		state.FormulasClaimed = toIntSlice(v)
	}
	return state
}

func encodeState(state *AstrologicState) map[string]interface{} {
	collected := make([]interface{}, len(state.StarsCollected))
	for i, v := range state.StarsCollected {
		collected[i] = float64(v)
	}
	toPick := make([]interface{}, len(state.StarsToPick))
	for i, v := range state.StarsToPick {
		toPick[i] = float64(v)
	}
	claimed := make([]interface{}, len(state.FormulasClaimed))
	for i, v := range state.FormulasClaimed {
		claimed[i] = float64(v)
	}
	return map[string]interface{}{
		"pickCount":       float64(state.PickCount),
		"refreshCount":    float64(state.RefreshCount),
		"buyPickCount":    float64(state.BuyPickCount),
		"starsCollected":  collected,
		"starsToPick":     toPick,
		"formulasClaimed": claimed,
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

func toIntSlice(v interface{}) []int {
	arr, ok := v.([]interface{})
	if !ok {
		return []int{}
	}
	out := make([]int, 0, len(arr))
	for _, elem := range arr {
		if n, ok := toInt(elem); ok {
			out = append(out, n)
		}
	}
	return out
}
