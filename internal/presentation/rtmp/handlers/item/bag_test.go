// Open-sourced by BaoLT

package item

import (
	"context"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	pkgerrors "mcgame-server/pkg/errors"
)

type sharedItemTestRepo struct {
	*itemTestRepo
}

func newSharedItemTestRepo(items ...*domainitem.Item) *sharedItemTestRepo {
	return &sharedItemTestRepo{itemTestRepo: newItemTestRepo(items...)}
}

func (r *sharedItemTestRepo) FindByID(ctx context.Context, id int64) (*domainitem.Item, error) {
	if it, ok := r.items[id]; ok {
		return it, nil
	}
	return nil, pkgerrors.ErrItemNotFound
}

func (r *sharedItemTestRepo) FindByCharacterID(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	result := make([]*domainitem.Item, 0)
	for _, it := range r.items {
		if it.CharacterID == charID {
			result = append(result, it)
		}
	}
	return result, nil
}

func (r *sharedItemTestRepo) FindByCharacterAndSlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) ([]*domainitem.Item, error) {
	result := make([]*domainitem.Item, 0)
	for _, it := range r.items {
		if it.CharacterID == charID && it.SlotType == slotType {
			result = append(result, it)
		}
	}
	return result, nil
}

func (r *sharedItemTestRepo) FindBySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, slotIndex int) (*domainitem.Item, error) {
	for _, it := range r.items {
		if it.CharacterID == charID && it.SlotType == slotType && it.SlotIndex == slotIndex {
			return it, nil
		}
	}
	return nil, pkgerrors.ErrItemNotFound
}

func TestMoveItem_MergeStackDoesNotDoubleCountCachedDestination(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	repo := newSharedItemTestRepo(
		&domainitem.Item{
			ID:          3,
			CharacterID: 1,
			TemplateID:  158,
			ItemType:    domainitem.ItemTypeConsumable,
			SlotType:    domainitem.SlotTypeBag,
			SlotIndex:   21,
			StackCount:  13,
			IsBound:     true,
			Properties:  map[string]interface{}{},
		},
		&domainitem.Item{
			ID:          13,
			CharacterID: 1,
			TemplateID:  158,
			ItemType:    domainitem.ItemTypeConsumable,
			SlotType:    domainitem.SlotTypeBag,
			SlotIndex:   22,
			StackCount:  1,
			IsBound:     true,
			Properties:  map[string]interface{}{},
		},
	)
	handler, ctx := buildItemTestHandlerWithRepo(t, char, repo)

	resp, err := handler.MoveItem(ctx, []interface{}{float64(2123), float64(2122)})
	if err != nil {
		t.Fatalf("MoveItem() error = %v", err)
	}
	if success, ok := resp.(map[string]interface{}); !ok || success["success"] != true {
		t.Fatalf("MoveItem() response = %#v, want success", resp)
	}

	dest, err := repo.FindByID(context.Background(), 3)
	if err != nil {
		t.Fatalf("FindByID(dest) error = %v", err)
	}
	if dest.StackCount != 14 {
		t.Fatalf("destination stack = %d, want 14", dest.StackCount)
	}

	if _, err := repo.FindByID(context.Background(), 13); !pkgerrors.Is(err, pkgerrors.ErrItemNotFound) {
		t.Fatalf("FindByID(source) error = %v, want ErrItemNotFound", err)
	}
}
