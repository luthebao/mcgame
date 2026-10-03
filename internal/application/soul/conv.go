// Open-sourced by BaoLT

// Flexible scalar coercions for soul feature-state round-tripping. JSONB decodes
// numbers as float64, so persisted slot fields come back loosely typed.
package soul

import "strconv"

func formatInt(v int) string {
	return strconv.Itoa(v)
}

func parseInt(s string) int {
	n, _ := strconv.Atoi(s)
	return n
}

func intFrom(v any) int {
	switch n := v.(type) {
	case int:
		return n
	case int64:
		return int(n)
	case float64:
		return int(n)
	case string:
		return parseInt(n)
	}
	return 0
}

func int64From(v any) int64 {
	switch n := v.(type) {
	case int64:
		return n
	case int:
		return int64(n)
	case float64:
		return int64(n)
	case string:
		i, _ := strconv.ParseInt(n, 10, 64)
		return i
	}
	return 0
}

func boolFrom(v any) bool {
	switch b := v.(type) {
	case bool:
		return b
	case float64:
		return b != 0
	case int:
		return b != 0
	}
	return false
}
