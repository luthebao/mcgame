// Open-sourced by BaoLT

// Postgres implementation of bossloot.ConfigRepo and bossloot.MappingRepo.
// Queries dispatch through data.list_active_boss_loot() and data.lookup_schedule_boss_by_daily_id()
// (see supabase/migrations/*_boss_loot_functions.sql).
package postgres

import (
	"context"
	"errors"

	"github.com/jackc/pgx/v5"

	"mcgame-server/internal/domain/bossloot"
)

var (
	_ bossloot.ConfigRepo  = (*BossLootConfigRepository)(nil)
	_ bossloot.MappingRepo = (*BossLootConfigRepository)(nil)
)

type BossLootConfigRepository struct {
	db *Database
}

func NewBossLootConfigRepository(db *Database) *BossLootConfigRepository {
	return &BossLootConfigRepository{db: db}
}

func (r *BossLootConfigRepository) List(ctx context.Context) ([]bossloot.LootEntry, error) {
	rows, err := r.db.Pool().Query(ctx, "select * from data.list_active_boss_loot()")
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	out := make([]bossloot.LootEntry, 0)
	for rows.Next() {
		var (
			e            bossloot.LootEntry
			tierFilter   *string
			sourceFilter *string
			qid          *int
		)
		if err := rows.Scan(
			&e.ID,
			&e.BossNID,
			&e.ItemID,
			&e.Quality,
			&e.Rate,
			&e.QtyMin,
			&e.QtyMax,
			&e.Bound,
			&e.Type,
			&tierFilter,
			&sourceFilter,
			&qid,
		); err != nil {
			return nil, err
		}
		if tierFilter != nil {
			e.TierFilter = *tierFilter
		}
		if sourceFilter != nil {
			e.SourceFilter = *sourceFilter
		}
		if qid != nil {
			e.Qid = *qid
		}
		out = append(out, e)
	}
	return out, rows.Err()
}

func (r *BossLootConfigRepository) LookupScheduleNIDByDailyID(ctx context.Context, dailyBossID int) (int, string, bool, error) {
	var (
		nid  int
		tier string
	)
	err := r.db.Pool().QueryRow(ctx, "select nid, tier from data.lookup_schedule_boss_by_daily_id($1)", dailyBossID).Scan(&nid, &tier)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return 0, "", false, nil
		}
		return 0, "", false, err
	}
	if nid == 0 {
		return 0, "", false, nil
	}
	return nid, tier, true, nil
}
