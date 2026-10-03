// Open-sourced by BaoLT

// PostgreSQL implementation of the daily sign-in repository.
// Backed by player.character_daily_signins (per-character monthly state)
// and data.daily_signin_rewards (reward catalogue).
// Reads/writes via schema-qualified Postgres functions only.
package postgres

import (
	"context"
	"time"

	"mcgame-server/internal/domain/dailysignin"
	pkgerrors "mcgame-server/pkg/errors"
)

type DailySigninRepository struct {
	db *Database
}

func NewDailySigninRepository(db *Database) *DailySigninRepository {
	return &DailySigninRepository{db: db}
}

func (r *DailySigninRepository) Get(ctx context.Context, characterID int64, year, month int) (*dailysignin.Record, error) {
	rec := &dailysignin.Record{}
	var lastSignedAt *time.Time
	err := r.db.pool.QueryRow(ctx,
		"select * from player.get_character_daily_signin($1, $2, $3)",
		characterID, year, month,
	).Scan(
		&rec.CharacterID,
		&rec.Year,
		&rec.Month,
		&rec.ClaimedDaysBitmap,
		&rec.CritPercent,
		&rec.LuckyAwardClaimed,
		&rec.ConsumeLimitTotal,
		&lastSignedAt,
		&rec.UpdatedAt,
	)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to get character daily signin")
	}
	rec.LastSignedAt = lastSignedAt
	return rec, nil
}

func (r *DailySigninRepository) Apply(ctx context.Context, in dailysignin.ApplyInput) (*dailysignin.ApplyResult, error) {
	rec := &dailysignin.Record{}
	var lastSignedAt *time.Time
	var daySet, awardSet, critChanged bool
	err := r.db.pool.QueryRow(ctx,
		`select (r.row).character_id, (r.row).year, (r.row).month, (r.row).claimed_days_bitmap,
		        (r.row).crit_percent, (r.row).lucky_award_claimed, (r.row).consume_limit_total,
		        (r.row).last_signed_at, (r.row).updated_at,
		        r.day_set, r.award_set, r.crit_changed
		   from player.upsert_character_daily_signin($1, $2, $3, $4, $5, $6, $7, $8) as r`,
		in.CharacterID, in.Year, in.Month, in.Day, in.CritDelta, in.ConsumeDelta, in.SetAwardClaimed, in.ResetCrit,
	).Scan(
		&rec.CharacterID,
		&rec.Year,
		&rec.Month,
		&rec.ClaimedDaysBitmap,
		&rec.CritPercent,
		&rec.LuckyAwardClaimed,
		&rec.ConsumeLimitTotal,
		&lastSignedAt,
		&rec.UpdatedAt,
		&daySet,
		&awardSet,
		&critChanged,
	)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to apply daily signin")
	}
	rec.LastSignedAt = lastSignedAt
	return &dailysignin.ApplyResult{Record: rec, DaySet: daySet, AwardSet: awardSet, CritChanged: critChanged}, nil
}

type DailySigninLuckyTierRepository struct {
	db *Database
}

func NewDailySigninLuckyTierRepository(db *Database) *DailySigninLuckyTierRepository {
	return &DailySigninLuckyTierRepository{db: db}
}

type luckyTierScanner interface {
	Scan(dest ...any) error
}

func scanLuckyTier(s luckyTierScanner) (dailysignin.LuckyTier, error) {
	var (
		y, m, w int16
		thr, gd int64
		note    *string
	)
	if err := s.Scan(&y, &m, &w, &thr, &gd, &note); err != nil {
		return dailysignin.LuckyTier{}, err
	}
	tier := dailysignin.LuckyTier{
		Year:       int(y),
		Month:      int(m),
		WeekIndex:  int(w),
		Threshold:  thr,
		GoldAmount: gd,
	}
	if note != nil {
		tier.Note = *note
	}
	return tier, nil
}

func (r *DailySigninLuckyTierRepository) ListForMonth(ctx context.Context, year, month int) ([]dailysignin.LuckyTier, error) {
	rows, err := r.db.pool.Query(ctx,
		"select * from data.list_daily_signin_lucky_tiers($1::smallint, $2::smallint)",
		year, month,
	)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to list daily signin lucky tiers")
	}
	defer rows.Close()

	out := make([]dailysignin.LuckyTier, 0, 5)
	for rows.Next() {
		tier, scanErr := scanLuckyTier(rows)
		if scanErr != nil {
			return nil, pkgerrors.Wrap(scanErr, "failed to scan daily signin lucky tier")
		}
		out = append(out, tier)
	}
	if err := rows.Err(); err != nil {
		return nil, pkgerrors.Wrap(err, "daily signin lucky tier rows iteration error")
	}
	return out, nil
}

func (r *DailySigninLuckyTierRepository) GetTier(ctx context.Context, year, month, weekIndex int) (dailysignin.LuckyTier, error) {
	tier, err := scanLuckyTier(r.db.pool.QueryRow(ctx,
		"select * from data.get_daily_signin_lucky_tier($1::smallint, $2::smallint, $3::smallint)",
		year, month, weekIndex,
	))
	if err != nil {
		return dailysignin.LuckyTier{}, pkgerrors.Wrap(err, "failed to get daily signin lucky tier")
	}
	return tier, nil
}

type DailySigninRewardRepository struct {
	db *Database
}

func NewDailySigninRewardRepository(db *Database) *DailySigninRewardRepository {
	return &DailySigninRewardRepository{db: db}
}

func (r *DailySigninRewardRepository) List(ctx context.Context, inc *int) ([]*dailysignin.Reward, error) {
	var args []any
	var sql string
	if inc != nil {
		sql = "select * from data.list_daily_signin_rewards($1::smallint)"
		args = append(args, *inc)
	} else {
		sql = "select * from data.list_daily_signin_rewards()"
	}
	rows, err := r.db.pool.Query(ctx, sql, args...)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to list daily signin rewards")
	}
	defer rows.Close()

	out := make([]*dailysignin.Reward, 0, 8)
	for rows.Next() {
		rw := &dailysignin.Reward{}
		var note *string
		var incVal int16
		if scanErr := rows.Scan(&rw.RewardID, &incVal, &rw.ItemID, &rw.Quantity, &rw.Weight, &note); scanErr != nil {
			return nil, pkgerrors.Wrap(scanErr, "failed to scan daily signin reward")
		}
		rw.Inc = int(incVal)
		if note != nil {
			rw.Note = *note
		}
		out = append(out, rw)
	}
	if err := rows.Err(); err != nil {
		return nil, pkgerrors.Wrap(err, "daily signin reward rows iteration error")
	}
	return out, nil
}
