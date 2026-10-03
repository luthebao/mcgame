// Open-sourced by BaoLT

// Repository contracts for daily sign-in persistence. Get returns a fresh
// zero Record when no row exists. Apply merges a single sign-in (or a
// pure crit/consume bump when day=0) and returns the post-state along with
// per-field "did this call change anything" flags so callers can gate
// reward grants on the winning request when two sessions race. ListRewards
// reads the data.daily_signin_rewards catalogue, optionally filtered by inc.
package dailysignin

import "context"

type ApplyInput struct {
	CharacterID     int64
	Year            int
	Month           int
	Day             int
	CritDelta       int
	ConsumeDelta    int64
	SetAwardClaimed bool
	ResetCrit       bool
}

type ApplyResult struct {
	Record      *Record
	DaySet      bool
	AwardSet    bool
	CritChanged bool
}

type Repository interface {
	Get(ctx context.Context, characterID int64, year, month int) (*Record, error)
	Apply(ctx context.Context, in ApplyInput) (*ApplyResult, error)
}

type RewardCatalog interface {
	List(ctx context.Context, inc *int) ([]*Reward, error)
}

type LuckyTier struct {
	Year       int
	Month      int
	WeekIndex  int
	Threshold  int64
	GoldAmount int64
	Note       string
}

type LuckyTierCatalog interface {
	ListForMonth(ctx context.Context, year, month int) ([]LuckyTier, error)
	GetTier(ctx context.Context, year, month, weekIndex int) (LuckyTier, error)
}
