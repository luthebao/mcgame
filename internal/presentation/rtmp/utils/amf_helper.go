// Open-sourced by BaoLT

package utils

import (
	"strconv"

	amf0 "github.com/yutopp/go-amf0"
)

func NormalizeAMFMap(raw interface{}) map[string]interface{} {
	switch typed := raw.(type) {
	case map[string]interface{}:
		return typed
	case amf0.ECMAArray:
		return map[string]interface{}(typed)
	default:
		return nil
	}
}

func ParseStatString(value interface{}) int {
	if value == nil {
		return 0
	}
	switch typed := value.(type) {
	case string:
		if typed == "" {
			return 0
		}
		parsed, err := strconv.Atoi(typed)
		if err != nil || parsed < 0 {
			return 0
		}
		return parsed
	case float64:
		if typed < 0 {
			return 0
		}
		return int(typed)
	default:
		return 0
	}
}
