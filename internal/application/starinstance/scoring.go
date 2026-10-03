// Open-sourced by BaoLT

// Scoring formulas for Tinh Giới Thập Nhị Cung battle results.
package starinstance

func ComputeScore(deaths int, elapsedSec int64) int {
	timePenalty := min(max(int(elapsedSec)/3, 0), 50)
	return max(min(100-deaths*20-timePenalty, 100), 0)
}
