// Open-sourced by BaoLT

// Postgres implementation of scheduleboss.StateRepo.
// All queries are dispatched through schema-qualified player.* functions
// captured in supabase/migrations/*_scheduleboss_functions.sql.
package postgres

import (
	"context"
	"encoding/json"
	"errors"
	"time"

	"github.com/jackc/pgx/v5"

	"mcgame-server/internal/domain/scheduleboss"
)

var _ scheduleboss.StateRepo = (*ScheduleBossStateRepository)(nil)

type ScheduleBossStateRepository struct {
	db *Database
}

func NewScheduleBossStateRepository(db *Database) *ScheduleBossStateRepository {
	return &ScheduleBossStateRepository{db: db}
}

type scheduleBossMissingRow struct {
	NID         int       `json:"nid"`
	ChannelID   int       `json:"channel_id"`
	IsAlive     bool      `json:"is_alive"`
	NextSpawnAt time.Time `json:"next_spawn_at"`
}

func (r *ScheduleBossStateRepository) Upsert(ctx context.Context, s scheduleboss.BossState) error {
	_, err := r.db.Pool().Exec(ctx,
		"select player.upsert_schedule_boss_state($1, $2, $3, $4, $5, $6, $7)",
		s.NID, s.ChannelID, s.IsAlive, s.LastKilledAt, s.LastKillerID, s.NextSpawnAt, s.SpawnCount,
	)
	return err
}

func (r *ScheduleBossStateRepository) Get(ctx context.Context, nid, channelID int) (*scheduleboss.BossState, error) {
	row := r.db.Pool().QueryRow(ctx, "select * from player.get_schedule_boss_state($1, $2)", nid, channelID)
	var s scheduleboss.BossState
	err := row.Scan(&s.NID, &s.ChannelID, &s.IsAlive, &s.LastKilledAt, &s.LastKillerID, &s.NextSpawnAt, &s.SpawnCount, &s.UpdatedAt)
	if errors.Is(err, pgx.ErrNoRows) {
		return nil, nil
	}
	if err != nil {
		return nil, err
	}
	return &s, nil
}

func (r *ScheduleBossStateRepository) FetchDueSpawns(ctx context.Context, now time.Time) ([]scheduleboss.BossState, error) {
	rows, err := r.db.Pool().Query(ctx, "select * from player.fetch_due_schedule_boss_spawns($1)", now)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	out := make([]scheduleboss.BossState, 0)
	for rows.Next() {
		var s scheduleboss.BossState
		if err := rows.Scan(&s.NID, &s.ChannelID, &s.IsAlive, &s.LastKilledAt, &s.LastKillerID, &s.NextSpawnAt, &s.SpawnCount, &s.UpdatedAt); err != nil {
			return nil, err
		}
		out = append(out, s)
	}
	return out, rows.Err()
}

func (r *ScheduleBossStateRepository) MarkAlive(ctx context.Context, nid, channelID int, now time.Time) (bool, error) {
	var changed bool
	err := r.db.Pool().QueryRow(ctx,
		"select player.mark_schedule_boss_alive($1, $2, $3)",
		nid, channelID, now,
	).Scan(&changed)
	if err != nil {
		return false, err
	}
	return changed, nil
}

func (r *ScheduleBossStateRepository) MarkKilled(ctx context.Context, nid, channelID int, killerID int64, nextSpawnAt time.Time, now time.Time) (bool, error) {
	var changed bool
	err := r.db.Pool().QueryRow(ctx,
		"select player.mark_schedule_boss_killed($1, $2, $3, $4, $5)",
		nid, channelID, killerID, nextSpawnAt, now,
	).Scan(&changed)
	if err != nil {
		return false, err
	}
	return changed, nil
}

func (r *ScheduleBossStateRepository) ListExistingKeys(ctx context.Context) (map[scheduleboss.BossKey]struct{}, error) {
	rows, err := r.db.Pool().Query(ctx, "select * from player.list_schedule_boss_keys()")
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	out := make(map[scheduleboss.BossKey]struct{})
	for rows.Next() {
		var k scheduleboss.BossKey
		if err := rows.Scan(&k.NID, &k.ChannelID); err != nil {
			return nil, err
		}
		out[k] = struct{}{}
	}
	return out, rows.Err()
}

func (r *ScheduleBossStateRepository) InsertMissing(ctx context.Context, rows []scheduleboss.BossState) error {
	if len(rows) == 0 {
		return nil
	}
	payload := make([]scheduleBossMissingRow, len(rows))
	for i, row := range rows {
		payload[i] = scheduleBossMissingRow{
			NID:         row.NID,
			ChannelID:   row.ChannelID,
			IsAlive:     row.IsAlive,
			NextSpawnAt: row.NextSpawnAt,
		}
	}
	payloadJSON, err := json.Marshal(payload)
	if err != nil {
		return err
	}
	_, err = r.db.Pool().Exec(ctx,
		"select player.insert_missing_schedule_boss_states($1::jsonb)",
		payloadJSON,
	)
	return err
}

func (r *ScheduleBossStateRepository) ListAliveByChannel(ctx context.Context, channelID int) ([]scheduleboss.BossState, error) {
	rows, err := r.db.Pool().Query(ctx, "select * from player.list_alive_schedule_bosses($1)", channelID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	out := make([]scheduleboss.BossState, 0)
	for rows.Next() {
		var s scheduleboss.BossState
		if err := rows.Scan(&s.NID, &s.ChannelID, &s.IsAlive, &s.LastKilledAt, &s.LastKillerID, &s.NextSpawnAt, &s.SpawnCount, &s.UpdatedAt); err != nil {
			return nil, err
		}
		out = append(out, s)
	}
	return out, rows.Err()
}
