// Open-sourced by BaoLT

package star

import (
	"encoding/json"
	"strconv"
)

func StarFlagLoginJSON(state StarsState, warMap map[string]interface{}) string {
	stars := make(map[string]interface{}, len(state))
	for t, slot := range state {
		if slot == nil {
			continue
		}
		stars[strconv.Itoa(t)] = map[string]interface{}{
			"tid":        strconv.Itoa(slot.Tid),
			"finishDate": slot.FinishDate,
			"addition":   slot.Addition,
		}
	}
	if warMap == nil {
		warMap = map[string]interface{}{}
	}
	obj := map[string]interface{}{
		"stars":  stars,
		"warMap": warMap,
	}
	b, err := json.Marshal(obj)
	if err != nil {
		return "{}"
	}
	return string(b)
}
