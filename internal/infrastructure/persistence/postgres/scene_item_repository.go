// Open-sourced by BaoLT

// PostgreSQL implementation of scene item repository.
// Handles dropped items with expiration, ownership, and pickup mechanics.
// Supports static items and dynamic drops from combat or player actions.
package postgres

import (
	"context"
	"errors"
	"time"

	"github.com/jackc/pgx/v5"
	"mcgame-server/internal/domain/sceneitem"
	pkgerrors "mcgame-server/pkg/errors"
)

type SceneItemRepository struct {
	db *Database
}

func NewSceneItemRepository(db *Database) *SceneItemRepository {
	return &SceneItemRepository{db: db}
}

func (r *SceneItemRepository) FindByID(ctx context.Context, id int64) (*sceneitem.SceneItem, error) {
	item := &sceneitem.SceneItem{}
	var ownerID *int64
	var expiresAt *time.Time

	err := r.db.pool.QueryRow(ctx, "select * from player.get_scene_item_by_id($1)", id).Scan(
		&item.ID, &item.TemplateID, &item.MapID, &item.PosX, &item.PosY, &item.StackCount,
		&ownerID, &item.DroppedAt, &expiresAt, &item.IsStatic,
	)

	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrSceneItemNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to find scene item by ID")
	}

	item.OwnerID = ownerID
	item.ExpiresAt = expiresAt

	return item, nil
}

func (r *SceneItemRepository) FindByMapID(ctx context.Context, mapID int) ([]*sceneitem.SceneItem, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_scene_items_by_map($1, $2)", mapID, time.Now())
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to find scene items by map ID")
	}
	defer rows.Close()

	var items []*sceneitem.SceneItem
	for rows.Next() {
		item := &sceneitem.SceneItem{}
		var ownerID *int64
		var expiresAt *time.Time

		err := rows.Scan(
			&item.ID, &item.TemplateID, &item.MapID, &item.PosX, &item.PosY, &item.StackCount,
			&ownerID, &item.DroppedAt, &expiresAt, &item.IsStatic,
		)
		if err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan scene item row")
		}

		item.OwnerID = ownerID
		item.ExpiresAt = expiresAt
		items = append(items, item)
	}

	return items, nil
}

func (r *SceneItemRepository) FindByOwner(ctx context.Context, ownerID int64) ([]*sceneitem.SceneItem, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_scene_items_by_owner($1, $2)", ownerID, time.Now())
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to find scene items by owner")
	}
	defer rows.Close()

	var items []*sceneitem.SceneItem
	for rows.Next() {
		item := &sceneitem.SceneItem{}
		var ownerPtr *int64
		var expiresAt *time.Time

		err := rows.Scan(
			&item.ID, &item.TemplateID, &item.MapID, &item.PosX, &item.PosY, &item.StackCount,
			&ownerPtr, &item.DroppedAt, &expiresAt, &item.IsStatic,
		)
		if err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan scene item row")
		}

		item.OwnerID = ownerPtr
		item.ExpiresAt = expiresAt
		items = append(items, item)
	}

	return items, nil
}

func (r *SceneItemRepository) Create(ctx context.Context, item *sceneitem.SceneItem) error {
	err := r.db.pool.QueryRow(ctx, "select player.create_scene_item($1, $2, $3, $4, $5, $6, $7, $8, $9)",
		item.TemplateID, item.MapID, item.PosX, item.PosY, item.StackCount,
		item.OwnerID, item.DroppedAt, item.ExpiresAt, item.IsStatic,
	).Scan(&item.ID)

	if err != nil {
		return pkgerrors.Wrap(err, "failed to create scene item")
	}

	return nil
}

func (r *SceneItemRepository) Delete(ctx context.Context, id int64) error {
	var deleted bool
	if err := r.db.pool.QueryRow(ctx, "select player.delete_scene_item($1)", id).Scan(&deleted); err != nil {
		return pkgerrors.Wrap(err, "failed to delete scene item")
	}

	if !deleted {
		return pkgerrors.ErrSceneItemNotFound
	}

	return nil
}

func (r *SceneItemRepository) DeleteExpired(ctx context.Context) (int64, error) {
	var count int64
	if err := r.db.pool.QueryRow(ctx, "select player.delete_expired_scene_items($1)", time.Now()).Scan(&count); err != nil {
		return 0, pkgerrors.Wrap(err, "failed to delete expired scene items")
	}

	return count, nil
}

func (r *SceneItemRepository) DeleteByMapID(ctx context.Context, mapID int) (int64, error) {
	var count int64
	if err := r.db.pool.QueryRow(ctx, "select player.delete_scene_items_by_map($1)", mapID).Scan(&count); err != nil {
		return 0, pkgerrors.Wrap(err, "failed to delete scene items by map ID")
	}

	return count, nil
}
