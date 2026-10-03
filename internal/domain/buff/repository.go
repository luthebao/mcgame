// Open-sourced by BaoLT

// Repository contract for character buff persistence.
package buff

import (
	"context"
	"time"
)

type Repository interface {
	ListByCharacter(ctx context.Context, characterID int64) ([]*Buff, error)
	GetByID(ctx context.Context, id int64) (*Buff, error)
	Upsert(ctx context.Context, buff *Buff) (*Buff, error)
	Delete(ctx context.Context, id int64) error
	DeleteExpired(ctx context.Context, characterID int64, now time.Time) (int64, error)
}
