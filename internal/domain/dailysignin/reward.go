// Open-sourced by BaoLT

// Reward catalogue entries. inc=1 daily reward (single ascending), inc=2
// surprise-day pool (weighted random), inc=4 crit-bonus pool (weighted
// random rolled with crit_percent/100 probability per sign-in).
package dailysignin

const (
	IncDaily       = 1
	IncSurpriseDay = 2
	IncCritBonus   = 4
)

type Reward struct {
	RewardID int
	Inc      int
	ItemID   int
	Quantity int
	Weight   int
	Note     string
}
