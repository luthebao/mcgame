// Open-sourced by BaoLT

package shop

import "testing"

func TestNextRefresh_PolicyTable(t *testing.T) {
	cases := []struct {
		used    int
		allowed bool
		cost    int64
	}{
		{0, true, 0},
		{1, true, 20},
		{2, true, 20},
		{3, true, 20},
		{4, true, 20},
		{5, false, 0},
		{6, false, 0},
		{99, false, 0},
	}
	for _, c := range cases {
		got := nextRefresh(c.used)
		if got.Allowed != c.allowed || got.Cost != c.cost {
			t.Errorf("nextRefresh(%d) = {Allowed:%v, Cost:%d}, want {Allowed:%v, Cost:%d}",
				c.used, got.Allowed, got.Cost, c.allowed, c.cost)
		}
	}
}

func TestVipShopRefreshDailyMax_MatchesPolicy(t *testing.T) {
	if vipShopRefreshDailyMax != 5 {
		t.Errorf("vipShopRefreshDailyMax = %d, want 5 (matches the cap inside nextRefresh)", vipShopRefreshDailyMax)
	}
	if d := nextRefresh(vipShopRefreshDailyMax); d.Allowed {
		t.Errorf("nextRefresh(vipShopRefreshDailyMax) returned Allowed=true; cap and policy must agree")
	}
}
