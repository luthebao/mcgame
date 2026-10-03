// Open-sourced by BaoLT

package monsterheart

import (
	"strconv"
)

func intKey(n int) string {
	return strconv.Itoa(n)
}

func parseIntKey(s string) int {
	n, _ := strconv.Atoi(s)
	return n
}

func anyInt(v interface{}) int {
	switch typed := v.(type) {
	case int:
		return typed
	case int32:
		return int(typed)
	case int64:
		return int(typed)
	case float32:
		return int(typed)
	case float64:
		return int(typed)
	}
	return 0
}

func IsValidBox(box int) bool {
	_, ok := validBoxes[box]
	return ok
}

func IsValidHole(hole int) bool {
	_, ok := validHoles[hole]
	return ok
}
