// Open-sourced by BaoLT

// VIP-tier discount table for the VIP shop. The percent values are the single
// place to tune the curve; the surrounding service must not branch on pmLevel
// itself, only call discountPercent / applyDiscount.
package shop

var vipShopDiscountByLevel = [10]int{
	0,
	2, 4, 8, 12, 18,
	25, 33, 42, 50,
}

func discountPercent(pmLevel int) int {
	if pmLevel < 1 || pmLevel >= len(vipShopDiscountByLevel) {
		return 0
	}
	return vipShopDiscountByLevel[pmLevel]
}

func applyDiscount(baseGold int64, pmLevel int) int64 {
	if baseGold <= 0 {
		return 0
	}
	final := baseGold * int64(100-discountPercent(pmLevel)) / 100
	if final < 1 {
		return 1
	}
	return final
}
