// Open-sourced by BaoLT

// Legacy scale converters used only at DB-read / AMF-payload boundaries.
package stats

import "math"

func FromPercent(v float64) int64 {
	return int64(math.Round(v * 10))
}

func FromMyriad(v float64) int64 {
	return int64(math.Round(v / 10))
}

func FromCritDmgBonus(bonus int) int64 {
	return int64(bonus) * 10
}

func ToPercent(v int64) float64 {
	return float64(v) / 10.0
}

func ToMyriad(v int64) float64 {
	return float64(v) * 10.0
}
