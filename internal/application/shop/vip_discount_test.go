// Open-sourced by BaoLT

package shop

import "testing"

func TestDiscountPercent_AggressiveTopTierTable(t *testing.T) {
	cases := map[int]int{
		0: 0,
		1: 2,
		2: 4,
		3: 8,
		4: 12,
		5: 18,
		6: 25,
		7: 33,
		8: 42,
		9: 50,
	}
	for level, want := range cases {
		if got := discountPercent(level); got != want {
			t.Errorf("discountPercent(%d) = %d, want %d", level, got, want)
		}
	}
}

func TestDiscountPercent_OutOfRangeReturnsZero(t *testing.T) {
	for _, level := range []int{-5, -1, 10, 99, 1_000_000} {
		if got := discountPercent(level); got != 0 {
			t.Errorf("discountPercent(%d) = %d, want 0", level, got)
		}
	}
}

func TestApplyDiscount(t *testing.T) {
	cases := []struct {
		name     string
		base     int64
		pmLevel  int
		expected int64
	}{
		{"non-vip pays full price", 1000, 0, 1000},
		{"vip1 pays 98%", 1000, 1, 980},
		{"vip5 pays 82%", 1000, 5, 820},
		{"vip9 pays 50%", 1000, 9, 500},
		{"vip9 floors odd amounts", 999, 9, 499},
		{"min 1 gold even on huge discount", 1, 9, 1},
		{"zero base stays zero", 0, 9, 0},
	}
	for _, c := range cases {
		t.Run(c.name, func(t *testing.T) {
			if got := applyDiscount(c.base, c.pmLevel); got != c.expected {
				t.Errorf("applyDiscount(%d, vip%d) = %d, want %d", c.base, c.pmLevel, got, c.expected)
			}
		})
	}
}
