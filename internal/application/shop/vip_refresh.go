// Open-sourced by BaoLT

// Refresh-budget policy for the VIP shop personal refresh button. The shape
// (free first / paid middle / hard cap) lives here and the rest of the package
// treats nextRefresh as the single source of truth.
package shop

const (
	vipShopRefreshDailyMax  = 5
	vipShopRefreshPaidPrice = 20
)

type RefreshDecision struct {
	Allowed bool
	Cost    int64
}

func nextRefresh(usedToday int) RefreshDecision {
	switch {
	case usedToday < 0:
		return RefreshDecision{}
	case usedToday == 0:
		return RefreshDecision{Allowed: true, Cost: 0}
	case usedToday < vipShopRefreshDailyMax:
		return RefreshDecision{Allowed: true, Cost: vipShopRefreshPaidPrice}
	default:
		return RefreshDecision{}
	}
}
