// Open-sourced by BaoLT

// Postgres implementation of scheduleboss.ConfigRepo.
// Queries dispatch through data.list_active_schedule_bosses
// (see supabase/migrations/*_scheduleboss_functions.sql).
package postgres

import (
	"context"

	"mcgame-server/internal/domain/scheduleboss"
)

var _ scheduleboss.ConfigRepo = (*ScheduleBossConfigRepository)(nil)

type ScheduleBossConfigRepository struct {
	db *Database
}

func NewScheduleBossConfigRepository(db *Database) *ScheduleBossConfigRepository {
	return &ScheduleBossConfigRepository{db: db}
}

func (r *ScheduleBossConfigRepository) List(ctx context.Context) ([]scheduleboss.BossConfig, error) {
	rows, err := r.db.Pool().Query(ctx, "select * from data.list_active_schedule_bosses()")
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	out := make([]scheduleboss.BossConfig, 0)
	for rows.Next() {
		var c scheduleboss.BossConfig
		if err := rows.Scan(&c.NID, &c.Name, &c.MapID, &c.Level, &c.Kind, &c.Tier, &c.ChannelScope, &c.Description, &c.IsActive); err != nil {
			return nil, err
		}
		out = append(out, c)
	}
	return out, rows.Err()
}
