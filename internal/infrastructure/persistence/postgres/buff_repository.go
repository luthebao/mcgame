// Open-sourced by BaoLT

// PostgreSQL repository for player.character_buffs.
// All queries are dispatched through schema-qualified player.* functions.
package postgres

import (
	"context"
	"errors"
	"time"

	domainbuff "mcgame-server/internal/domain/buff"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/jackc/pgx/v5"
)

type BuffRepository struct {
	db *Database
}

func NewBuffRepository(db *Database) *BuffRepository {
	return &BuffRepository{db: db}
}

func scanBuff(row pgx.Row) (*domainbuff.Buff, error) {
	b := &domainbuff.Buff{}
	var src *string
	var duration, rounds, battles *int
	var stack *int
	if err := row.Scan(&b.ID, &b.CharacterID, &b.BuffID, &b.BuffType, &src, &duration, &b.ExpiresAt, &rounds, &battles, &stack, &b.CreatedAt); err != nil {
		return nil, err
	}
	if src != nil {
		b.Source = *src
	}
	if duration != nil {
		b.DurationTotal = *duration
	}
	b.RoundsLeft = rounds
	b.BattlesLeft = battles
	if stack != nil {
		b.StackCount = *stack
	} else {
		b.StackCount = 1
	}
	return b, nil
}

func (r *BuffRepository) ListByCharacter(ctx context.Context, characterID int64) ([]*domainbuff.Buff, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.list_character_buffs($1)", characterID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to list character buffs")
	}
	defer rows.Close()

	out := make([]*domainbuff.Buff, 0)
	for rows.Next() {
		b, err := scanBuff(rows)
		if err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan character buff")
		}
		out = append(out, b)
	}
	return out, rows.Err()
}

func (r *BuffRepository) GetByID(ctx context.Context, id int64) (*domainbuff.Buff, error) {
	row := r.db.pool.QueryRow(ctx, "select * from player.get_character_buff($1)", id)
	b, err := scanBuff(row)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, nil
		}
		return nil, pkgerrors.Wrap(err, "failed to load character buff")
	}
	return b, nil
}

func (r *BuffRepository) Upsert(ctx context.Context, buff *domainbuff.Buff) (*domainbuff.Buff, error) {
	if buff == nil {
		return nil, errors.New("buff: upsert nil")
	}
	if buff.StackCount <= 0 {
		buff.StackCount = 1
	}
	var srcPtr *string
	if buff.Source != "" {
		s := buff.Source
		srcPtr = &s
	}
	var durationPtr *int
	if buff.DurationTotal > 0 {
		d := buff.DurationTotal
		durationPtr = &d
	}
	var expiresPtr *time.Time
	if buff.ExpiresAt != nil {
		t := *buff.ExpiresAt
		expiresPtr = &t
	}

	row := r.db.pool.QueryRow(ctx,
		"select * from player.upsert_character_buff($1, $2, $3, $4, $5, $6, $7, $8, $9)",
		buff.CharacterID, buff.BuffID, buff.BuffType, srcPtr, durationPtr, expiresPtr, buff.RoundsLeft, buff.BattlesLeft, buff.StackCount,
	)

	b, err := scanBuff(row)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to upsert character buff")
	}
	return b, nil
}

func (r *BuffRepository) Delete(ctx context.Context, id int64) error {
	if _, err := r.db.pool.Exec(ctx, "select player.delete_character_buff($1)", id); err != nil {
		return pkgerrors.Wrap(err, "failed to delete character buff")
	}
	return nil
}

func (r *BuffRepository) DeleteExpired(ctx context.Context, characterID int64, now time.Time) (int64, error) {
	var count int64
	if err := r.db.pool.QueryRow(ctx, "select player.delete_expired_character_buffs($1, $2)", characterID, now).Scan(&count); err != nil {
		return 0, pkgerrors.Wrap(err, "failed to delete expired character buffs")
	}
	return count, nil
}
