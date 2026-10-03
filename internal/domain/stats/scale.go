// Open-sourced by BaoLT

// Per-mille scale helpers. Rate props range [0, 1000] where 1000 = 100%.
package stats

import "math/rand"

const (
	PerMille            int64 = 1000
	BaseCritDmgPercent  int64 = 150
)

func ClampPM(v int64) int64 {
	if v < 0 {
		return 0
	}
	if v > PerMille {
		return PerMille
	}
	return v
}

func RollPerMille(rng *rand.Rand, threshold int64) bool {
	return int64(rng.Intn(int(PerMille))) < ClampPM(threshold)
}

func MulPM(base, factorPM int64) int64 {
	return base * factorPM / PerMille
}
