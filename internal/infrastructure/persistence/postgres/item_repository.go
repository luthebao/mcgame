// Open-sourced by BaoLT

// PostgreSQL implementation of item repository.
// Handles inventory CRUD with slot management and JSON properties.
// Supports bag, equipped, and bank storage types.
package postgres

import (
	"context"
	"encoding/json"
	"errors"
	"time"

	"mcgame-server/internal/domain/item"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/jackc/pgx/v5"
)

type ItemRepository struct {
	db *Database
}

func NewItemRepository(db *Database) *ItemRepository {
	return &ItemRepository{db: db}
}

func (r *ItemRepository) FindByID(ctx context.Context, id int64) (*item.Item, error) {
	it := &item.Item{}
	var propertiesJSON []byte
	err := r.db.pool.QueryRow(ctx, "select * from player.get_character_item_by_id($1)", id).Scan(
		&it.ID, &it.CharacterID, &it.TemplateID, &it.ItemType, &it.SlotType, &it.SlotIndex,
		&it.StackCount, &it.IsBound, &it.Durability, &it.MaxDurability, &it.EnchantLevel,
		&it.StarLevel, &it.ColorCode, &propertiesJSON, &it.CreatedAt, &it.UpdatedAt,
	)

	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrItemNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to find item by ID")
	}

	if len(propertiesJSON) > 0 {
		if err := json.Unmarshal(propertiesJSON, &it.Properties); err != nil {
			it.Properties = make(map[string]interface{})
		}
	} else {
		it.Properties = make(map[string]interface{})
	}

	return it, nil
}

func (r *ItemRepository) FindByCharacterID(ctx context.Context, charID int64) ([]*item.Item, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_character_items_by_character($1)", charID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to find items by character ID")
	}
	defer rows.Close()

	return r.scanItems(rows)
}

func (r *ItemRepository) FindByCharacterAndSlotType(ctx context.Context, charID int64, slotType item.SlotType) ([]*item.Item, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_character_items_by_slot_type($1, $2)", charID, slotType)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to find items by slot type")
	}
	defer rows.Close()

	return r.scanItems(rows)
}

func (r *ItemRepository) FindBySlot(ctx context.Context, charID int64, slotType item.SlotType, slotIndex int) (*item.Item, error) {
	it := &item.Item{}
	var propertiesJSON []byte
	err := r.db.pool.QueryRow(ctx, "select * from player.get_character_item_by_slot($1, $2, $3)", charID, slotType, slotIndex).Scan(
		&it.ID, &it.CharacterID, &it.TemplateID, &it.ItemType, &it.SlotType, &it.SlotIndex,
		&it.StackCount, &it.IsBound, &it.Durability, &it.MaxDurability, &it.EnchantLevel,
		&it.StarLevel, &it.ColorCode, &propertiesJSON, &it.CreatedAt, &it.UpdatedAt,
	)

	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrItemNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to find item by slot")
	}

	if len(propertiesJSON) > 0 {
		if err := json.Unmarshal(propertiesJSON, &it.Properties); err != nil {
			it.Properties = make(map[string]interface{})
		}
	} else {
		it.Properties = make(map[string]interface{})
	}

	return it, nil
}

func (r *ItemRepository) FindEquipped(ctx context.Context, charID int64) ([]*item.Item, error) {
	return r.FindByCharacterAndSlotType(ctx, charID, item.SlotTypeEquipped)
}

func (r *ItemRepository) Create(ctx context.Context, it *item.Item) error {
	propertiesJSON, err := json.Marshal(it.Properties)
	if err != nil {
		propertiesJSON = []byte("{}")
	}

	now := time.Now()
	it.CreatedAt = now
	it.UpdatedAt = now

	err = r.db.pool.QueryRow(ctx,
		"select player.create_character_item($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13::jsonb, $14, $15)",
		it.CharacterID, it.TemplateID, it.ItemType, it.SlotType, it.SlotIndex,
		it.StackCount, it.IsBound, it.Durability, it.MaxDurability, it.EnchantLevel,
		it.StarLevel, it.ColorCode, propertiesJSON, it.CreatedAt, it.UpdatedAt,
	).Scan(&it.ID)

	if err != nil {
		return pkgerrors.Wrap(err, "failed to create item")
	}

	return nil
}

func (r *ItemRepository) Update(ctx context.Context, it *item.Item) error {
	propertiesJSON, err := json.Marshal(it.Properties)
	if err != nil {
		propertiesJSON = []byte("{}")
	}

	it.UpdatedAt = time.Now()

	var updated bool
	err = r.db.pool.QueryRow(ctx,
		"select player.update_character_item($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13::jsonb, $14)",
		it.ID,
		it.TemplateID, it.ItemType, it.SlotType, it.SlotIndex,
		it.StackCount, it.IsBound, it.Durability, it.MaxDurability,
		it.EnchantLevel, it.StarLevel, it.ColorCode,
		propertiesJSON, it.UpdatedAt,
	).Scan(&updated)

	if err != nil {
		return pkgerrors.Wrap(err, "failed to update item")
	}

	if !updated {
		return pkgerrors.ErrItemNotFound
	}

	return nil
}

func (r *ItemRepository) Delete(ctx context.Context, id int64) error {
	var deleted bool
	if err := r.db.pool.QueryRow(ctx, "select player.delete_character_item($1)", id).Scan(&deleted); err != nil {
		return pkgerrors.Wrap(err, "failed to delete item")
	}

	if !deleted {
		return pkgerrors.ErrItemNotFound
	}

	return nil
}

func (r *ItemRepository) DeleteByCharacterID(ctx context.Context, charID int64) error {
	_, err := r.db.pool.Exec(ctx, "select player.delete_character_items_by_character($1)", charID)
	if err != nil {
		return pkgerrors.Wrap(err, "failed to delete character items")
	}

	return nil
}

func (r *ItemRepository) MoveItem(ctx context.Context, id int64, slotType item.SlotType, slotIndex int) error {
	var moved bool
	if err := r.db.pool.QueryRow(ctx, "select player.move_character_item($1, $2, $3, $4)", id, slotType, slotIndex, time.Now()).Scan(&moved); err != nil {
		return pkgerrors.Wrap(err, "failed to move item")
	}

	if !moved {
		return pkgerrors.ErrItemNotFound
	}

	return nil
}

func (r *ItemRepository) UpdateStack(ctx context.Context, id int64, stackCount int) error {
	var updated bool
	if err := r.db.pool.QueryRow(ctx, "select player.update_character_item_stack($1, $2, $3)", id, stackCount, time.Now()).Scan(&updated); err != nil {
		return pkgerrors.Wrap(err, "failed to update stack")
	}

	if !updated {
		return pkgerrors.ErrItemNotFound
	}

	return nil
}

func (r *ItemRepository) FindFirstEmptySlot(ctx context.Context, charID int64, slotType item.SlotType, maxSlots int) (int, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_character_item_slot_indexes($1, $2)", charID, slotType)
	if err != nil {
		return -1, pkgerrors.Wrap(err, "failed to find occupied slots")
	}
	defer rows.Close()

	occupied := make(map[int]bool)
	for rows.Next() {
		var idx int
		if err := rows.Scan(&idx); err != nil {
			return -1, pkgerrors.Wrap(err, "failed to scan slot index")
		}
		occupied[idx] = true
	}

	for i := 0; i < maxSlots; i++ {
		if !occupied[i] {
			return i, nil
		}
	}

	return -1, pkgerrors.ErrInventoryFull
}

func (r *ItemRepository) CountBySlotType(ctx context.Context, charID int64, slotType item.SlotType) (int, error) {
	var count int
	err := r.db.pool.QueryRow(ctx, "select player.count_character_items_by_slot_type($1, $2)", charID, slotType).Scan(&count)
	if err != nil {
		return 0, pkgerrors.Wrap(err, "failed to count items")
	}

	return count, nil
}

func (r *ItemRepository) scanItems(rows pgx.Rows) ([]*item.Item, error) {
	var items []*item.Item
	for rows.Next() {
		it := &item.Item{}
		var propertiesJSON []byte
		err := rows.Scan(
			&it.ID, &it.CharacterID, &it.TemplateID, &it.ItemType, &it.SlotType, &it.SlotIndex,
			&it.StackCount, &it.IsBound, &it.Durability, &it.MaxDurability, &it.EnchantLevel,
			&it.StarLevel, &it.ColorCode, &propertiesJSON, &it.CreatedAt, &it.UpdatedAt,
		)
		if err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan item row")
		}

		if len(propertiesJSON) > 0 {
			if err := json.Unmarshal(propertiesJSON, &it.Properties); err != nil {
				it.Properties = make(map[string]interface{})
			}
		} else {
			it.Properties = make(map[string]interface{})
		}

		items = append(items, it)
	}

	return items, nil
}
