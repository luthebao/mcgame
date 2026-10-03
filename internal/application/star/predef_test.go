// Open-sourced by BaoLT

// Rate-formula unit tests mirroring StarAdditionPanel.as:651-700 from the Flash client.
// computeAdditionRate must produce the same numbers as the client preview so the
// success roll on the server agrees with what the player saw in the panel.
package star

import (
	"math"
	"testing"
)

func TestColorTierFromAddition_MatchesClientGetStarColor(t *testing.T) {
	cases := []struct {
		addition float64
		want     int
	}{
		{1.0, 0},
		{1.5, 1},
		{2.0, 1},
		{2.5, 2},
		{3.0, 2},
		{4.0, 3},
		{4.5, 4},
		{5.0, 4},
		{6.0, 4},
	}
	for _, tc := range cases {
		if got := colorTierFromAddition(tc.addition); got != tc.want {
			t.Errorf("colorTierFromAddition(%v) = %d, want %d", tc.addition, got, tc.want)
		}
	}
}

func TestComputeAdditionRate_MatchesClientFormula(t *testing.T) {
	cases := []struct {
		name     string
		tier     int
		quantity int
		want     float64
	}{
		{"tier0_qty1_capped_at_1", 0, 1, 1},
		{"tier1_qty1", 1, 1, 0.045 + 0.015},
		{"tier1_qty10", 1, 10, 0.045*10 + 0.015},
		{"tier1_qty22_capped_at_1", 1, 22, 1},
		{"tier2_qty5", 2, 5, 0.0225*5 + 0.0075},
		{"tier3_qty100", 3, 100, 1},
		{"tier4_qty1", 4, 1, 0.005625 + 0.001875},
		{"tier4_qty178_capped", 4, 178, 1},
		{"tier4_qty0_floor_at_add_success", 4, 0, 0.001875},
	}
	for _, tc := range cases {
		got := computeAdditionRate(tc.tier, tc.quantity)
		if math.Abs(got-tc.want) > 1e-9 {
			t.Errorf("%s: computeAdditionRate(%d, %d) = %v, want %v",
				tc.name, tc.tier, tc.quantity, got, tc.want)
		}
	}
}

func TestComputeAdditionRate_ClampsTierAndQuantity(t *testing.T) {
	if got := computeAdditionRate(-1, 1); got != 1 {
		t.Fatalf("negative tier should clamp to tier 0 (rate 1), got %v", got)
	}
	if got := computeAdditionRate(99, 1); got <= 0 || got > 1 {
		t.Fatalf("out-of-range tier should clamp to last (rate around 0.0075), got %v", got)
	}
	if got := computeAdditionRate(0, -5); got != 0 {
		t.Fatalf("negative quantity should clamp to 0 and yield ADD_SUCCESS[0]=0, got %v", got)
	}
}

func TestStarAdditionMoneyCostMatchesClient(t *testing.T) {
	cases := []struct {
		name     string
		starType int
		quantity int
		addition float64
		want     int64
	}{
		{"tier0_starType1_qty1_addition1", 1, 1, 1.0, int64(math.Round(300 * 20 * 1.0 * 1.0))},
		{"tier1_starType5_qty10_addition1_5", 5, 10, 1.5, int64(math.Round(36000 * 20 * (0.045*10 + 0.015) * 1.5))},
		{"tier4_starType7_qty1000_capped", 7, 1000, 4.5, int64(math.Round(36000 * 20 * 1.0 * 4.5))},
	}
	for _, tc := range cases {
		tier := colorTierFromAddition(tc.addition)
		rate := computeAdditionRate(tier, tc.quantity)
		got := int64(math.Round(float64(starAdditionBasicMoney[tc.starType]) * StarAdditionMoneyMultiplier * rate * tc.addition))
		if got != tc.want {
			t.Errorf("%s: money = %d, want %d (rate=%v, tier=%d)", tc.name, got, tc.want, rate, tier)
		}
	}
}
