// Open-sourced by BaoLT

// PostgreSQL achievement repository persists per-character progress rows.
// All queries dispatch through schema-qualified player.* functions.
package postgres

import (
	"context"
	"errors"
	"fmt"
	"time"

	domainachievement "mcgame-server/internal/domain/achievement"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/jackc/pgx/v5"
)

type AchievementRepository struct {
	db *Database
}

func NewAchievementRepository(db *Database) *AchievementRepository {
	return &AchievementRepository{db: db}
}

func (r *AchievementRepository) GetProgressByCharacter(ctx context.Context, characterID int64) ([]*domainachievement.Progress, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.list_character_achievements($1)", characterID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to query character achievements")
	}
	defer rows.Close()

	progressRows := make([]*domainachievement.Progress, 0)
	for rows.Next() {
		progress, scanErr := scanAchievementProgress(rows)
		if scanErr != nil {
			return nil, scanErr
		}
		progressRows = append(progressRows, progress)
	}

	if err := rows.Err(); err != nil {
		return nil, pkgerrors.Wrap(err, "failed to iterate character achievements")
	}

	return progressRows, nil
}

func (r *AchievementRepository) UpsertProgress(ctx context.Context, progress *domainachievement.Progress) (*domainachievement.Progress, error) {
	if progress == nil {
		return nil, pkgerrors.ErrInvalidInput
	}

	row := r.db.pool.QueryRow(ctx,
		"select * from player.upsert_character_achievement($1, $2, $3, $4, $5, $6, $7, $8)",
		progress.CharacterID,
		progress.AchievementID,
		progress.Progress,
		progress.Target,
		progress.IsCompleted,
		progress.IsClaimed,
		progress.CompletedAt,
		progress.ClaimedAt,
	)

	return scanAchievementProgress(row)
}

func (r *AchievementRepository) MarkCompleted(ctx context.Context, characterID, achievementID int64, completedAt time.Time) (*domainachievement.Progress, error) {
	row := r.db.pool.QueryRow(ctx,
		"select * from player.mark_character_achievement_completed($1, $2, $3)",
		characterID,
		achievementID,
		completedAt,
	)

	return scanAchievementProgress(row)
}

func (r *AchievementRepository) MarkClaimed(ctx context.Context, characterID, achievementID int64, claimedAt time.Time) (*domainachievement.Progress, error) {
	row := r.db.pool.QueryRow(ctx,
		"select * from player.mark_character_achievement_claimed($1, $2, $3)",
		characterID,
		achievementID,
		claimedAt,
	)

	return scanAchievementProgress(row)
}

func (r *AchievementRepository) ListClaimedCounts(ctx context.Context, characterID int64) (map[int64]int, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.list_claimed_character_achievements($1)", characterID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to list claimed achievements")
	}
	defer rows.Close()

	claimed := make(map[int64]int)
	for rows.Next() {
		var achievementID int64
		var count int
		if err := rows.Scan(&achievementID, &count); err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan claimed achievement")
		}
		claimed[achievementID] = count
	}

	if err := rows.Err(); err != nil {
		return nil, pkgerrors.Wrap(err, "failed to iterate claimed achievements")
	}

	return claimed, nil
}

type achievementProgressScanner interface {
	Scan(dest ...interface{}) error
}

func scanAchievementProgress(scanner achievementProgressScanner) (*domainachievement.Progress, error) {
	progress := &domainachievement.Progress{}
	var completedAt *time.Time
	var claimedAt *time.Time

	err := scanner.Scan(
		&progress.ID,
		&progress.CharacterID,
		&progress.AchievementID,
		&progress.Progress,
		&progress.Target,
		&progress.IsCompleted,
		&progress.IsClaimed,
		&completedAt,
		&claimedAt,
	)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, fmt.Errorf("achievement progress not found")
		}
		return nil, pkgerrors.Wrap(err, "failed to scan achievement progress")
	}

	progress.CompletedAt = completedAt
	progress.ClaimedAt = claimedAt
	return progress, nil
}
