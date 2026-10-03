// Open-sourced by BaoLT

// PostgreSQL implementation of the daily act repository.
// Backed by player.character_daily_act (per-character daily state)
// and data.daily_act_award_rewards (tier reward catalogue).
// Reads/writes via schema-qualified Postgres functions only.
package postgres

import (
	"context"
	"encoding/json"
	"errors"
	"time"

	"mcgame-server/internal/domain/dailyact"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/jackc/pgx/v5"
)

type DailyActRepository struct {
	db *Database
}

func NewDailyActRepository(db *Database) *DailyActRepository {
	return &DailyActRepository{db: db}
}

func (r *DailyActRepository) Get(ctx context.Context, characterID int64, day time.Time) (*dailyact.DailyActRecord, error) {
	const sql = `
		select character_id, day, vitality_points, award_claimed, awarded_tier,
		       awarded_at, task_counts, first_login_at, online_seconds_offline, updated_at
		from player.get_character_daily_act($1, $2)
	`

	var (
		rec        dailyact.DailyActRecord
		taskCounts []byte
	)

	err := r.db.pool.QueryRow(ctx, sql, characterID, day).Scan(
		&rec.CharacterID,
		&rec.Day,
		&rec.VitalityPoints,
		&rec.AwardClaimed,
		&rec.AwardedTier,
		&rec.AwardedAt,
		&taskCounts,
		&rec.FirstLoginAt,
		&rec.OnlineSecondsOffline,
		&rec.UpdatedAt,
	)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return &dailyact.DailyActRecord{
				CharacterID: characterID,
				Day:         day,
				TaskCounts:  map[string]int{},
			}, nil
		}
		return nil, pkgerrors.Wrap(err, "get_character_daily_act failed")
	}

	if err := json.Unmarshal(taskCounts, &rec.TaskCounts); err != nil {
		return nil, pkgerrors.Wrap(err, "unmarshal task_counts failed")
	}

	return &rec, nil
}

func (r *DailyActRepository) TouchLogin(ctx context.Context, characterID int64, day time.Time, now time.Time) (bool, time.Time, error) {
	const sql = `select is_first_today, first_login_at from player.touch_character_daily_act_login($1, $2, $3)`

	var (
		firstToday bool
		firstAt    time.Time
	)

	if err := r.db.pool.QueryRow(ctx, sql, characterID, day, now).Scan(&firstToday, &firstAt); err != nil {
		return false, time.Time{}, pkgerrors.Wrap(err, "touch_character_daily_act_login failed")
	}

	return firstToday, firstAt, nil
}

func (r *DailyActRepository) IncrementTask(ctx context.Context, characterID int64, day time.Time, taskID string, countDelta int, actDelta int) (int, int, bool, error) {
	const sql = `select new_count, vitality_points, award_claimed from player.increment_character_daily_act_task($1, $2, $3, $4, $5)`

	var (
		newCount     int
		vitalityPts  int
		awardClaimed bool
	)

	if err := r.db.pool.QueryRow(ctx, sql, characterID, day, taskID, countDelta, actDelta).Scan(&newCount, &vitalityPts, &awardClaimed); err != nil {
		return 0, 0, false, pkgerrors.Wrap(err, "increment_character_daily_act_task failed")
	}

	return newCount, vitalityPts, awardClaimed, nil
}

func (r *DailyActRepository) ClaimAward(ctx context.Context, characterID int64, day time.Time, tier int16) (bool, int, error) {
	const sql = `select success, vitality_points from player.claim_character_daily_act_award($1, $2, $3)`

	var (
		success bool
		points  int
	)

	if err := r.db.pool.QueryRow(ctx, sql, characterID, day, tier).Scan(&success, &points); err != nil {
		return false, 0, pkgerrors.Wrap(err, "claim_character_daily_act_award failed")
	}

	return success, points, nil
}

func (r *DailyActRepository) RevertAward(ctx context.Context, characterID int64, day time.Time, tier int16) (bool, error) {
	const sql = `select player.revert_character_daily_act_award($1, $2, $3)`
	var ok bool
	if err := r.db.pool.QueryRow(ctx, sql, characterID, day, tier).Scan(&ok); err != nil {
		return false, pkgerrors.Wrap(err, "revert_character_daily_act_award")
	}
	return ok, nil
}

type DailyActAwardRepository struct {
	db *Database
}

func NewDailyActAwardRepository(db *Database) *DailyActAwardRepository {
	return &DailyActAwardRepository{db: db}
}

func (r *DailyActAwardRepository) List(ctx context.Context) ([]*dailyact.AwardTier, error) {
	const sql = `select tier, threshold, item_id, quantity, bound, icon_giid, coalesce(note, '') from data.list_daily_act_award_rewards()`

	rows, err := r.db.pool.Query(ctx, sql)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "list_daily_act_award_rewards failed")
	}
	defer rows.Close()

	var out []*dailyact.AwardTier
	for rows.Next() {
		var t dailyact.AwardTier
		if err := rows.Scan(&t.Tier, &t.Threshold, &t.ItemID, &t.Quantity, &t.Bound, &t.IconGIID, &t.Note); err != nil {
			return nil, pkgerrors.Wrap(err, "scan award tier failed")
		}
		out = append(out, &t)
	}
	if err := rows.Err(); err != nil {
		return nil, pkgerrors.Wrap(err, "iterate award tiers failed")
	}

	return out, nil
}
