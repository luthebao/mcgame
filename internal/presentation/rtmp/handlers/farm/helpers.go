// Open-sourced by BaoLT

// Farm helpers normalize AMF0 payloads and farm-specific npc ids.
package farm

import (
	"strconv"

	appfarm "mcgame-server/internal/application/farm"
)

func IsFarmMap(mapID int) bool {
	return mapID == 57 || mapID == 58
}

func FindFirstIntArg(args []interface{}) (int, bool) {
	for _, arg := range args {
		switch v := arg.(type) {
		case float64:
			return int(v), true
		case float32:
			return int(v), true
		case int:
			return v, true
		case int32:
			return int(v), true
		case int64:
			return int(v), true
		case string:
			if parsed, err := strconv.Atoi(v); err == nil {
				return parsed, true
			}
		}
	}

	return 0, false
}

func FindIntInMap(value interface{}, keys ...string) (int, bool) {
	switch v := value.(type) {
	case map[string]interface{}:
		for _, key := range keys {
			if raw, ok := v[key]; ok {
				if parsed, found := parseIntValue(raw); found {
					return parsed, true
				}
			}
		}
	case map[interface{}]interface{}:
		for _, key := range keys {
			if raw, ok := v[key]; ok {
				if parsed, found := parseIntValue(raw); found {
					return parsed, true
				}
			}
		}
	}

	return 0, false
}

func NormalizePlotNPCID(farmService *appfarm.Service, npcID int) int {
	if farmService == nil {
		return npcID
	}
	if farmService.IsPlotTemplateID(npcID) {
		return npcID
	}

	plotNPCID := npcID - visualNPCOffset
	if plotNPCID > 0 && farmService.IsPlotTemplateID(plotNPCID) {
		return plotNPCID
	}

	return npcID
}

func parseIntValue(value interface{}) (int, bool) {
	switch v := value.(type) {
	case float64:
		return int(v), true
	case float32:
		return int(v), true
	case int:
		return v, true
	case int32:
		return int(v), true
	case int64:
		return int(v), true
	case uint:
		return int(v), true
	case uint32:
		return int(v), true
	case uint64:
		return int(v), true
	case string:
		if parsed, err := strconv.Atoi(v); err == nil {
			return parsed, true
		}
	}

	return 0, false
}

func parseInt64Value(value interface{}) (int64, bool) {
	switch v := value.(type) {
	case float64:
		return int64(v), true
	case float32:
		return int64(v), true
	case int:
		return int64(v), true
	case int32:
		return int64(v), true
	case int64:
		return v, true
	case uint:
		return int64(v), true
	case uint32:
		return int64(v), true
	case uint64:
		return int64(v), true
	case string:
		if parsed, err := strconv.ParseInt(v, 10, 64); err == nil {
			return parsed, true
		}
	}

	return 0, false
}
