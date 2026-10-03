// Open-sourced by BaoLT

// Repository interface for character persistence.
// Defines CRUD operations and specialized queries for character data.
// Uses int64 IDs compatible with BIGSERIAL database columns.
package character

import (
	"context"

	"github.com/google/uuid"
)

type Repository interface {
	FindByID(ctx context.Context, id int64) (*Character, error)
	FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*Character, error)
	FindByMapID(ctx context.Context, mapID int) ([]*Character, error)
	FindByName(ctx context.Context, name string) (*Character, error)
	Create(ctx context.Context, character *Character) error
	Update(ctx context.Context, character *Character) error
	Delete(ctx context.Context, id int64) error
	ExistsByName(ctx context.Context, name string) (bool, error)
	UpdatePosition(ctx context.Context, id int64, pos Position) error
	UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error
}
