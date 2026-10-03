// Open-sourced by BaoLT

// Formula evaluation for the astrology panel.
// staticFormulas[i] is the set of star sids that must all be collected
// to trigger formula-i. staticAwardIDs[i] is the npPnt award for formula i.
// Each formula fires at most once per cycle (tracked via FormulasClaimed).
package astrology

import "strconv"

var staticFormulas = [][]int{
	nil,
	{3, 4},
	{10, 5, 2},
}

var staticAwardIDs = []int{0, 90, 140}

func evaluateFormulas(collected []int, claimed []int) *FormulaAward {
	claimedSet := make(map[int]bool, len(claimed))
	for _, aid := range claimed {
		claimedSet[aid] = true
	}
	collectedSet := make(map[int]bool, len(collected))
	for _, s := range collected {
		collectedSet[s] = true
	}
	for i, formula := range staticFormulas {
		if len(formula) == 0 {
			continue
		}
		if i >= len(staticAwardIDs) {
			continue
		}
		aid := staticAwardIDs[i]
		if aid <= 0 {
			continue
		}
		if claimedSet[aid] {
			continue
		}
		allMatch := true
		for _, required := range formula {
			if !collectedSet[required] {
				allMatch = false
				break
			}
		}
		if allMatch {
			fidStr := strconv.Itoa(i)
			return &FormulaAward{
				Aid:     aid,
				Fid:     fidStr,
				Formula: formula,
				Mult:    1,
				Stars:   formula,
			}
		}
	}
	return nil
}
