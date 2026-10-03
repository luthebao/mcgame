// Open-sourced by BaoLT

// PostgreSQL implementation of persisted marriage data.
package postgres

import (
	"context"
	"errors"
	"time"

	domainmarriage "mcgame-server/internal/domain/marriage"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/jackc/pgx/v5"
)

type MarriageRepository struct {
	db *Database
}

func NewMarriageRepository(db *Database) *MarriageRepository {
	return &MarriageRepository{db: db}
}

func (r *MarriageRepository) FindByPartner(ctx context.Context, characterID int64) (*domainmarriage.MarriageRecord, error) {
	record := &domainmarriage.MarriageRecord{}
	err := r.db.pool.QueryRow(ctx, "select * from player.find_marriage_by_partner($1)", characterID).Scan(
		&record.ID,
		&record.Partner1ID,
		&record.Partner2ID,
		&record.RingType,
		&record.Intimacy,
		&record.MarriedAt,
	)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to find marriage by partner")
	}

	return record, nil
}

func (r *MarriageRepository) Create(ctx context.Context, record *domainmarriage.MarriageRecord) error {
	err := r.db.pool.QueryRow(
		ctx,
		"select * from player.create_marriage($1, $2, $3, $4, $5)",
		record.Partner1ID,
		record.Partner2ID,
		record.RingType,
		record.Intimacy,
		time.Now(),
	).Scan(&record.ID, &record.MarriedAt)
	if err != nil {
		return pkgerrors.Wrap(err, "failed to create marriage")
	}

	return nil
}

func (r *MarriageRepository) ListRanks(ctx context.Context, offset, limit int) ([]*domainmarriage.CoupleRank, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.list_marriage_ranks($1, $2)", offset, limit)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to list couple ranks")
	}
	defer rows.Close()

	result := make([]*domainmarriage.CoupleRank, 0)
	for rows.Next() {
		rank := &domainmarriage.CoupleRank{}
		if err := rows.Scan(
			&rank.ID,
			&rank.Partner1ID,
			&rank.Partner1Name,
			&rank.Partner2ID,
			&rank.Partner2Name,
			&rank.RingType,
			&rank.Intimacy,
			&rank.MarriedAt,
		); err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan couple rank")
		}
		result = append(result, rank)
	}

	return result, nil
}
