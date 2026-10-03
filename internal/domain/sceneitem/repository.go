// Open-sourced by BaoLT

// Repository interface for scene item persistence.
// Handles dropped item storage with expiration cleanup.
// Supports querying items by map and owner.
package sceneitem

import (
	"context"
)

type Repository interface {
	FindByID(ctx context.Context, id int64) (*SceneItem, error)
	FindByMapID(ctx context.Context, mapID int) ([]*SceneItem, error)
	FindByOwner(ctx context.Context, ownerID int64) ([]*SceneItem, error)
	Create(ctx context.Context, item *SceneItem) error
	Delete(ctx context.Context, id int64) error
	DeleteExpired(ctx context.Context) (int64, error)
	DeleteByMapID(ctx context.Context, mapID int) (int64, error)
}
