// Open-sourced by BaoLT

package cache

import (
	"context"
	"testing"

	"mcgame-server/internal/domain/item"

	"go.uber.org/zap/zaptest"
)

func TestNewWarmInventoryLoader(t *testing.T) {
	loader := NewWarmInventoryLoader(nil, &mockItemRepo{}, zaptest.NewLogger(t))

	if loader == nil {
		t.Fatal("NewWarmInventoryLoader returned nil")
	}

	if loader.itemRepo == nil {
		t.Error("itemRepo should not be nil")
	}
}

func TestWarmInventoryLoader_GetItems_NilRedis(t *testing.T) {
	itemRepo := newMockItemRepo()

	testItem := &item.Item{
		CharacterID: 12345,
		TemplateID:  1001,
		StackCount:  1,
		SlotIndex:   0,
		SlotType:    1,
	}

	itemRepo.Create(context.Background(), testItem)

	loader := NewWarmInventoryLoader(nil, itemRepo, zaptest.NewLogger(t))

	items, err := loader.GetItems(context.Background(), 12345)
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	if len(items) != 1 {
		t.Errorf("expected 1 item, got %d", len(items))
	}

	if items[testItem.ID] == nil {
		t.Errorf("expected item with ID %d", testItem.ID)
	}
}

func TestWarmInventoryLoader_GetItems_Empty(t *testing.T) {
	loader := NewWarmInventoryLoader(nil, &mockItemRepo{}, zaptest.NewLogger(t))

	items, err := loader.GetItems(context.Background(), 12345)
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	if len(items) != 0 {
		t.Errorf("expected 0 items, got %d", len(items))
	}
}

func TestWarmInventoryLoader_UpdateItem_NilRedis(t *testing.T) {
	loader := NewWarmInventoryLoader(nil, &mockItemRepo{}, zaptest.NewLogger(t))

	err := loader.UpdateItem(context.Background(), 12345, 100, item.SlotTypeBag, 0)
	if err != nil {
		t.Errorf("expected no error with nil Redis, got %v", err)
	}
}

func TestWarmInventoryLoader_UpdateGold_NilRedis(t *testing.T) {
	loader := NewWarmInventoryLoader(nil, &mockItemRepo{}, zaptest.NewLogger(t))

	err := loader.UpdateGold(context.Background(), 12345, 1000, 500)
	if err != nil {
		t.Errorf("expected no error with nil Redis, got %v", err)
	}
}

func TestWarmInventoryLoader_InitializeFromItems_NilRedis(t *testing.T) {
	loader := NewWarmInventoryLoader(nil, &mockItemRepo{}, zaptest.NewLogger(t))

	items := map[int64]*item.Item{
		100: {
			ID:          100,
			CharacterID: 12345,
			TemplateID:  1001,
			SlotIndex:   0,
			SlotType:    1,
		},
	}

	err := loader.InitializeFromItems(context.Background(), 12345, items, 1000, 500)
	if err != nil {
		t.Errorf("expected no error with nil Redis, got %v", err)
	}
}

func TestWarmInventoryLoader_DeleteFromRedis_NilRedis(t *testing.T) {
	loader := NewWarmInventoryLoader(nil, &mockItemRepo{}, zaptest.NewLogger(t))

	err := loader.DeleteFromRedis(context.Background(), 12345)
	if err != nil {
		t.Errorf("expected no error with nil Redis, got %v", err)
	}
}

func TestNewWarmInventory_UsesDomainSlotCapacities(t *testing.T) {
	warm := newWarmInventory()

	if got := len(warm.BagSlots); got != item.DefaultBagSlots {
		t.Fatalf("expected bag slots=%d, got %d", item.DefaultBagSlots, got)
	}
	if got := len(warm.EquipSlots); got != int(item.EquipSlotMax) {
		t.Fatalf("expected equip slots=%d, got %d", int(item.EquipSlotMax), got)
	}
	if got := len(warm.QuestBagSlots); got != item.DefaultQuestBagSlots {
		t.Fatalf("expected quest bag slots=%d, got %d", item.DefaultQuestBagSlots, got)
	}
	if got := len(warm.PetItemBagSlots); got != item.DefaultPetItemBagSlots {
		t.Fatalf("expected pet item bag slots=%d, got %d", item.DefaultPetItemBagSlots, got)
	}
}

func TestWarmSlotCapacity(t *testing.T) {
	cases := []struct {
		name       string
		slotType   item.SlotType
		expected   int
		exists     bool
	}{
		{name: "bag", slotType: item.SlotTypeBag, expected: item.DefaultBagSlots, exists: true},
		{name: "equipped", slotType: item.SlotTypeEquipped, expected: int(item.EquipSlotMax), exists: true},
		{name: "quest", slotType: item.SlotTypeQuestBag, expected: item.DefaultQuestBagSlots, exists: true},
		{name: "pet", slotType: item.SlotTypePetItemBag, expected: item.DefaultPetItemBagSlots, exists: true},
		{name: "unknown", slotType: item.SlotTypeBank, expected: 0, exists: false},
	}

	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			got, ok := warmSlotCapacity(tc.slotType)
			if ok != tc.exists {
				t.Fatalf("expected exists=%v, got %v", tc.exists, ok)
			}
			if got != tc.expected {
				t.Fatalf("expected capacity=%d, got %d", tc.expected, got)
			}
		})
	}
}

func TestWarmSlotFieldName(t *testing.T) {
	cases := []struct {
		name      string
		slotType  item.SlotType
		expected  string
		exists    bool
	}{
		{name: "bag", slotType: item.SlotTypeBag, expected: "bag_slots", exists: true},
		{name: "equipped", slotType: item.SlotTypeEquipped, expected: "equip", exists: true},
		{name: "quest", slotType: item.SlotTypeQuestBag, expected: "quest_bag_slots", exists: true},
		{name: "pet", slotType: item.SlotTypePetItemBag, expected: "pet_item_bag_slots", exists: true},
		{name: "unknown", slotType: item.SlotTypeBank, expected: "", exists: false},
	}

	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			got, ok := warmSlotFieldName(tc.slotType)
			if ok != tc.exists {
				t.Fatalf("expected exists=%v, got %v", tc.exists, ok)
			}
			if got != tc.expected {
				t.Fatalf("expected field=%q, got %q", tc.expected, got)
			}
		})
	}
}

func TestCollectWarmItemIDs(t *testing.T) {
	warm := &WarmInventory{
		BagSlots:        []int64{11, 0, -1},
		EquipSlots:      []int64{22},
		QuestBagSlots:   []int64{0, 33},
		PetItemBagSlots: []int64{33, 44},
	}

	ids := collectWarmItemIDs(warm)
	if len(ids) != 4 {
		t.Fatalf("expected 4 unique positive ids, got %d", len(ids))
	}

	for _, id := range []int64{11, 22, 33, 44} {
		if !ids[id] {
			t.Fatalf("expected id %d to be collected", id)
		}
	}
}

