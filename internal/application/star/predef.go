// Open-sourced by BaoLT

// Star subsystem constants derived from GamePredef.as (lines 2096–2150).
// STAR_ADDITION_BASIC_SUCCESS probabilities are indexed by colorTier (0=white, …, 4=orange).
// STAR_ADDITION_ADD_SUCCESS is a flat bonus per tier added on top of the quantity-multiplied basic rate.
// STAR_ADDITION_BASIC_MONEY is keyed by star type (1–12).
// STAR_SPEED_UP_ITEM_IDS is keyed by star type (1–12), values 3316–3327.
// ItemTypeStarAdd = 551, ItemTypeStarSpeed = 552.
// colorTier is derived from slot.Addition vs STAR_ADDITION_COLOR = [1,2,3,4,5].
// Client rate formula (StarAdditionPanel.as:651-700):
//   rate = min(BASIC_SUCCESS[tier]*quantity + ADD_SUCCESS[tier], 1.0)
//   money = round(BASIC_MONEY[starType] * 20 * rate * addition).
package star

const (
	ItemTypeStarAdd   = 551
	ItemTypeStarSpeed = 552
)

const (
	StarAdditionMoneyMultiplier = 20
	StarAdditionMaxQuantity     = 9999
)

var starAdditionSuccessRates = [5]float64{1, 0.045, 0.0225, 0.01125, 0.005625}

var starAdditionAddSuccess = [5]float64{0, 0.015, 0.0075, 0.00375, 0.001875}

var starAdditionColorThresholds = [5]float64{1, 2, 3, 4, 5}

var starAdditionBasicMoney = map[int]int64{
	1:  300,
	2:  4500,
	3:  18000,
	4:  1200,
	5:  36000,
	6:  18000,
	7:  36000,
	8:  36000,
	9:  4500,
	10: 1200,
	11: 18000,
	12: 9000,
}

var starSpeedUpItemIDs = map[int]int{
	1:  3316,
	2:  3317,
	3:  3318,
	4:  3319,
	5:  3320,
	6:  3321,
	7:  3322,
	8:  3323,
	9:  3324,
	10: 3325,
	11: 3326,
	12: 3327,
}

func colorTierFromAddition(addition float64) int {
	for i, threshold := range starAdditionColorThresholds {
		if addition <= threshold {
			return i
		}
	}
	return len(starAdditionColorThresholds) - 1
}

func computeAdditionRate(tier, quantity int) float64 {
	if tier < 0 {
		tier = 0
	}
	if tier >= len(starAdditionSuccessRates) {
		tier = len(starAdditionSuccessRates) - 1
	}
	if quantity < 0 {
		quantity = 0
	}
	rate := starAdditionSuccessRates[tier]*float64(quantity) + starAdditionAddSuccess[tier]
	if rate > 1 {
		rate = 1
	}
	if rate < 0 {
		rate = 0
	}
	return rate
}
