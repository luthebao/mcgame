// Open-sourced by BaoLT

package utils

import "math"

func SafeFloat64ToInt(v float64) int {
	if math.IsNaN(v) || math.IsInf(v, 0) {
		return 0
	}
	return int(v)
}
