// Open-sourced by BaoLT

// Pet growth-rate / color helpers mirroring Flash basic.colorByGrowRate.
// Flash source: docs/client/logic/Basic.as:127
// and com/qeedoo/game/predef/GamePredef.as:1459 (PET_GROWRATE_NUM).
package pet

// PetGrowRateBands is the same table the client uses to bucket a pet's growRate
// into a discrete color tier 0..4 (white, green, blue, purple, orange).
var PetGrowRateBands = [5]float64{1.1, 1.3, 1.6, 2.0, 2.5}

// ColorByGrowRate returns the color tier (0..4) for a given growRate.
// Returns the first index where rate <= PetGrowRateBands[idx], else 4.
func ColorByGrowRate(rate float64) int {
	for idx, threshold := range PetGrowRateBands {
		if rate <= threshold {
			return idx
		}
	}
	return 4
}

// PetQuestQualityThreshold computes the minimum color tier required for a
// kind=3 TBL_QUEST_REQUIRE row given its `q` field. The Flash client divides q
// by 10 before calling colorByGrowRate (QuestPanel.as:1210).
func PetQuestQualityThreshold(q int) int {
	rate := float64(q) / 10.0
	return ColorByGrowRate(rate)
}

// PetGrowRateMeetsQuestQuality returns true when a pet's growRate qualifies for
// a quest requirement row whose `q` field is the supplied threshold value.
func PetGrowRateMeetsQuestQuality(growRate float64, q int) bool {
	return ColorByGrowRate(growRate) >= PetQuestQualityThreshold(q)
}
