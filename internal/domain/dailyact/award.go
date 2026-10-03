// Open-sourced by BaoLT

package dailyact

type AwardTier struct {
	Tier      int16
	Threshold int
	ItemID    int64
	Quantity  int
	Bound     bool
	IconGIID  int64
	Note      string
}

const (
	TierMin int16 = 0
	TierMax int16 = 4
)

func ValidTier(tier int16) bool {
	return tier >= TierMin && tier <= TierMax
}
