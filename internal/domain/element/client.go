// Open-sourced by BaoLT

// Client element helpers keep server payloads aligned with the Flash element enum.
package element

const (
	ClientElementNeutral = 0
	ClientElementLight   = 1
	ClientElementDark    = 2
	ClientElementWind    = 3
	ClientElementEarth   = 4
	ClientElementWater   = 5
	ClientElementFire    = 6
)

func NormalizeClientElementID(value int) int {
	if value < ClientElementNeutral || value > ClientElementFire {
		return ClientElementNeutral
	}

	return value
}

func NormalizeClientElementValue(value float64) int {
	return NormalizeClientElementID(int(value))
}
