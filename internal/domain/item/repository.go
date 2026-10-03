// Open-sourced by BaoLT

// Repository interface for item persistence operations.
// Handles CRUD and slot-based queries for inventory management.
// Supports finding empty slots and counting items by container type.
package item

import (
	"context"
)

type Repository interface {
	FindByID(ctx context.Context, id int64) (*Item, error)
	FindByCharacterID(ctx context.Context, charID int64) ([]*Item, error)
	FindByCharacterAndSlotType(ctx context.Context, charID int64, slotType SlotType) ([]*Item, error)
	FindBySlot(ctx context.Context, charID int64, slotType SlotType, slotIndex int) (*Item, error)
	FindEquipped(ctx context.Context, charID int64) ([]*Item, error)
	Create(ctx context.Context, item *Item) error
	Update(ctx context.Context, item *Item) error
	Delete(ctx context.Context, id int64) error
	DeleteByCharacterID(ctx context.Context, charID int64) error
	MoveItem(ctx context.Context, id int64, slotType SlotType, slotIndex int) error
	UpdateStack(ctx context.Context, id int64, stackCount int) error
	FindFirstEmptySlot(ctx context.Context, charID int64, slotType SlotType, maxSlots int) (int, error)
	CountBySlotType(ctx context.Context, charID int64, slotType SlotType) (int, error)
}
