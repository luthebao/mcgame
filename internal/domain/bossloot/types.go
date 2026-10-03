// Open-sourced by BaoLT

// Domain types for the unified boss-loot system.
// Shared by scheduled boss kills (kind=ground|flying) and daily boss kills
// (kind=daily_only or via daily_boss_id mapping on a paired schedule_boss row).
// Read-only registry — rows seeded into data.data_tbl_boss_loot.
package bossloot

type Source string

const (
	SourceSchedule Source = "schedule"
	SourceDaily    Source = "daily"
)

const (
	RewardTypeBasicCurrency = 30
	RewardTypeExperience    = 31
	RewardTypeGameCurrency  = 35
)

func IsCurrencyRewardType(t int) bool {
	switch t {
	case RewardTypeBasicCurrency, RewardTypeExperience, RewardTypeGameCurrency:
		return true
	}
	return false
}

type LootEntry struct {
	ID           int64
	BossNID      int
	ItemID       int
	Quality      int
	Rate         int
	QtyMin       int
	QtyMax       int
	Bound        bool
	Type         int
	TierFilter   string
	SourceFilter string
	Qid          int
}

func (e LootEntry) MatchesSource(source Source) bool {
	if e.SourceFilter == "" {
		return true
	}
	return Source(e.SourceFilter) == source
}

func (e LootEntry) MatchesTier(tier string) bool {
	if e.TierFilter == "" {
		return true
	}
	return e.TierFilter == tier
}
