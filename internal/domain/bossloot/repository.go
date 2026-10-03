// Open-sourced by BaoLT

// Repository contracts for boss loot.
// ConfigRepo is read-only and resolves at server boot.
// MappingRepo translates daily_boss_id values to canonical schedule_boss.nid.
package bossloot

import "context"

type ConfigRepo interface {
	List(ctx context.Context) ([]LootEntry, error)
}

type MappingRepo interface {
	LookupScheduleNIDByDailyID(ctx context.Context, dailyBossID int) (int, string, bool, error)
}
