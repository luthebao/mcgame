// Open-sourced by BaoLT

package pet

import (
	"context"
	"encoding/json"
	"testing"

	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type petEquipmentItemRepo struct {
	items map[int64]*domainitem.Item
}

func (r *petEquipmentItemRepo) FindByID(ctx context.Context, id int64) (*domainitem.Item, error) {
	item, ok := r.items[id]
	if !ok {
		return nil, pkgerrors.ErrItemNotFound
	}
	cloned := *item
	cloned.Properties = clonePetMap(item.Properties)
	return &cloned, nil
}

func (r *petEquipmentItemRepo) FindByCharacterID(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	items := make([]*domainitem.Item, 0)
	for _, item := range r.items {
		if item.CharacterID != charID {
			continue
		}
		cloned := *item
		cloned.Properties = clonePetMap(item.Properties)
		items = append(items, &cloned)
	}
	return items, nil
}

func (r *petEquipmentItemRepo) FindByCharacterAndSlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) ([]*domainitem.Item, error) {
	items := make([]*domainitem.Item, 0)
	for _, item := range r.items {
		if item.CharacterID != charID || item.SlotType != slotType {
			continue
		}
		cloned := *item
		cloned.Properties = clonePetMap(item.Properties)
		items = append(items, &cloned)
	}
	return items, nil
}

func (r *petEquipmentItemRepo) FindBySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, slotIndex int) (*domainitem.Item, error) {
	for _, item := range r.items {
		if item.CharacterID == charID && item.SlotType == slotType && item.SlotIndex == slotIndex {
			cloned := *item
			cloned.Properties = clonePetMap(item.Properties)
			return &cloned, nil
		}
	}
	return nil, pkgerrors.ErrItemNotFound
}

func (r *petEquipmentItemRepo) FindEquipped(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	return r.FindByCharacterAndSlotType(ctx, charID, domainitem.SlotTypeEquipped)
}

func (r *petEquipmentItemRepo) Create(ctx context.Context, item *domainitem.Item) error {
	cloned := *item
	cloned.Properties = clonePetMap(item.Properties)
	r.items[item.ID] = &cloned
	return nil
}

func (r *petEquipmentItemRepo) Update(ctx context.Context, item *domainitem.Item) error {
	cloned := *item
	cloned.Properties = clonePetMap(item.Properties)
	r.items[item.ID] = &cloned
	return nil
}

func (r *petEquipmentItemRepo) Delete(ctx context.Context, id int64) error {
	delete(r.items, id)
	return nil
}

func (r *petEquipmentItemRepo) DeleteByCharacterID(ctx context.Context, charID int64) error {
	for id, item := range r.items {
		if item.CharacterID == charID {
			delete(r.items, id)
		}
	}
	return nil
}

func (r *petEquipmentItemRepo) MoveItem(ctx context.Context, id int64, slotType domainitem.SlotType, slotIndex int) error {
	for _, item := range r.items {
		if item.ID == id {
			item.SlotType = slotType
			item.SlotIndex = slotIndex
			return nil
		}
	}
	return pkgerrors.ErrItemNotFound
}

func (r *petEquipmentItemRepo) UpdateStack(ctx context.Context, id int64, stackCount int) error {
	item, ok := r.items[id]
	if !ok {
		return pkgerrors.ErrItemNotFound
	}
	item.StackCount = stackCount
	return nil
}

func (r *petEquipmentItemRepo) FindFirstEmptySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, maxSlots int) (int, error) {
	occupied := make(map[int]bool)
	for _, item := range r.items {
		if item.CharacterID == charID && item.SlotType == slotType && item.SlotIndex >= 0 {
			occupied[item.SlotIndex] = true
		}
	}
	for slot := 0; slot < maxSlots; slot++ {
		if !occupied[slot] {
			return slot, nil
		}
	}
	return -1, pkgerrors.ErrInventoryFull
}

func (r *petEquipmentItemRepo) CountBySlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) (int, error) {
	count := 0
	for _, item := range r.items {
		if item.CharacterID == charID && item.SlotType == slotType {
			count++
		}
	}
	return count, nil
}

func TestEquipPetItemMovesItemToPetSlotAndAppliesBonuses(t *testing.T) {
	petRepo := &openSkillPetRepo{
		pets: map[int64]*domainpet.Pet{
			2484410: {
				ID:              2484410,
				CharacterID:     1,
				TemplateID:      1001,
				Level:           20,
				AptStrength:     10,
				AptAgility:      10,
				AptStamina:      10,
				AptIntelligence: 10,
				AptEnergy:       10,
				GrowRate:        1,
				Property:        map[string]interface{}{},
				CreatureData: map[string]interface{}{
					"classIds": 3,
					"qLevel":   1,
				},
			},
		},
	}
	itemRepo := &petEquipmentItemRepo{
		items: map[int64]*domainitem.Item{
			9001: {
				ID:          9001,
				CharacterID: 1,
				TemplateID:  5001,
				ItemType:    domainitem.ItemTypeEquipment,
				SlotType:    domainitem.SlotTypeBag,
				SlotIndex:   5,
				StackCount:  1,
			},
		},
	}

	service := NewService(petRepo, zap.NewNop())
	service.SetItemRepository(itemRepo)
	service.SetGameDataManager(newPetEquipmentGameData(t))

	result, err := service.EquipPetItem(context.Background(), 1, 2484410, 9001)
	if err != nil {
		t.Fatalf("EquipPetItem() error = %v", err)
	}
	if result.Slot != 1 {
		t.Fatalf("EquipPetItem() slot = %d, want 1", result.Slot)
	}
	if len(result.Moves) != 1 {
		t.Fatalf("EquipPetItem() moves = %d, want 1", len(result.Moves))
	}
	if result.Moves[0].FromSID != 2106 || result.Moves[0].ToSID != 1001 {
		t.Fatalf("EquipPetItem() move = %#v, want from 2106 to 1001", result.Moves[0])
	}

	storedPet := petRepo.pets[2484410]
	if got := storedPet.EquipmentItemID(1); got != 9001 {
		t.Fatalf("stored pet equ1 = %d, want 9001", got)
	}
	if group, ok := storedPet.EquipmentGroup(); !ok || group != 0 {
		t.Fatalf("stored pet equipGroup = %d, %v; want 0, true", group, ok)
	}
	if finalStrength, ok := storedPet.Property["finalStrength"].(int); !ok || finalStrength != 5 {
		t.Fatalf("stored finalStrength = %v, want 5", storedPet.Property["finalStrength"])
	}
	if finalDefence, ok := storedPet.Property["finalDefence"].(int); !ok || finalDefence != 7 {
		t.Fatalf("stored finalDefence = %v, want 7", storedPet.Property["finalDefence"])
	}
	if finalSpeed, ok := storedPet.Property["finalSpeed"].(int); !ok || finalSpeed != 109 {
		t.Fatalf("stored finalSpeed = %v, want 109", storedPet.Property["finalSpeed"])
	}

	storedItem := itemRepo.items[9001]
	if storedItem.SlotType != domainitem.SlotTypePetEquipped || storedItem.SlotIndex != 0 {
		t.Fatalf("stored item slot = (%d,%d), want (%d,0)", storedItem.SlotType, storedItem.SlotIndex, domainitem.SlotTypePetEquipped)
	}
}

func TestEquipPetItemReplacesExistingEquipmentIntoFreedBagSlot(t *testing.T) {
	petRepo := &openSkillPetRepo{
		pets: map[int64]*domainpet.Pet{
			2484410: {
				ID:              2484410,
				CharacterID:     1,
				TemplateID:      1001,
				Level:           20,
				AptStrength:     10,
				AptAgility:      10,
				AptStamina:      10,
				AptIntelligence: 10,
				AptEnergy:       10,
				GrowRate:        1,
				Property: map[string]interface{}{
					"equ1":       int64(9000),
					"equipGroup": 0,
				},
				CreatureData: map[string]interface{}{
					"classIds": 3,
					"qLevel":   1,
				},
			},
		},
	}
	itemRepo := &petEquipmentItemRepo{
		items: map[int64]*domainitem.Item{
			9000: {
				ID:          9000,
				CharacterID: 1,
				TemplateID:  5002,
				ItemType:    domainitem.ItemTypeEquipment,
				SlotType:    domainitem.SlotTypePetEquipped,
				SlotIndex:   0,
				StackCount:  1,
			},
			9001: {
				ID:          9001,
				CharacterID: 1,
				TemplateID:  5001,
				ItemType:    domainitem.ItemTypeEquipment,
				SlotType:    domainitem.SlotTypeBag,
				SlotIndex:   5,
				StackCount:  1,
			},
		},
	}

	service := NewService(petRepo, zap.NewNop())
	service.SetItemRepository(itemRepo)
	service.SetGameDataManager(newPetEquipmentGameData(t))

	result, err := service.EquipPetItem(context.Background(), 1, 2484410, 9001)
	if err != nil {
		t.Fatalf("EquipPetItem() error = %v", err)
	}
	if result.OldItemID != 9000 {
		t.Fatalf("EquipPetItem() oldItemID = %d, want 9000", result.OldItemID)
	}
	if len(result.Moves) != 2 {
		t.Fatalf("EquipPetItem() moves = %d, want 2", len(result.Moves))
	}

	newItem := itemRepo.items[9001]
	if newItem.SlotType != domainitem.SlotTypePetEquipped || newItem.SlotIndex != 0 {
		t.Fatalf("new item slot = (%d,%d), want (%d,0)", newItem.SlotType, newItem.SlotIndex, domainitem.SlotTypePetEquipped)
	}

	oldItem := itemRepo.items[9000]
	if oldItem.SlotType != domainitem.SlotTypeBag || oldItem.SlotIndex != 5 {
		t.Fatalf("old item slot = (%d,%d), want (%d,5)", oldItem.SlotType, oldItem.SlotIndex, domainitem.SlotTypeBag)
	}
}

func TestUnequipPetItemMovesBackToBagAndClearsEquipmentBonus(t *testing.T) {
	petRepo := &openSkillPetRepo{
		pets: map[int64]*domainpet.Pet{
			2484410: {
				ID:              2484410,
				CharacterID:     1,
				TemplateID:      1001,
				Level:           20,
				AptStrength:     10,
				AptAgility:      10,
				AptStamina:      10,
				AptIntelligence: 10,
				AptEnergy:       10,
				GrowRate:        1,
				Property: map[string]interface{}{
					"equ1":       int64(9001),
					"equipGroup": 0,
				},
				CreatureData: map[string]interface{}{
					"classIds": 3,
					"qLevel":   1,
				},
			},
		},
	}
	itemRepo := &petEquipmentItemRepo{
		items: map[int64]*domainitem.Item{
			9001: {
				ID:          9001,
				CharacterID: 1,
				TemplateID:  5001,
				ItemType:    domainitem.ItemTypeEquipment,
				SlotType:    domainitem.SlotTypePetEquipped,
				SlotIndex:   0,
				StackCount:  1,
			},
		},
	}

	service := NewService(petRepo, zap.NewNop())
	service.SetItemRepository(itemRepo)
	service.SetGameDataManager(newPetEquipmentGameData(t))

	result, err := service.UnequipPetItem(context.Background(), 1, 2484410, 9001)
	if err != nil {
		t.Fatalf("UnequipPetItem() error = %v", err)
	}
	if result.Slot != 1 {
		t.Fatalf("UnequipPetItem() slot = %d, want 1", result.Slot)
	}
	if result.Move.FromSID != 1001 || result.Move.ToSID != 2101 {
		t.Fatalf("UnequipPetItem() move = %#v, want from 1001 to 2101", result.Move)
	}

	storedPet := petRepo.pets[2484410]
	if got := storedPet.EquipmentItemID(1); got != 0 {
		t.Fatalf("stored pet equ1 = %d, want 0", got)
	}
	if finalDefence, ok := storedPet.Property["finalDefence"].(int); !ok || finalDefence != 0 {
		t.Fatalf("stored finalDefence = %v, want 0", storedPet.Property["finalDefence"])
	}
	if finalSpeed, ok := storedPet.Property["finalSpeed"].(int); !ok || finalSpeed != 100 {
		t.Fatalf("stored finalSpeed = %v, want 100", storedPet.Property["finalSpeed"])
	}

	storedItem := itemRepo.items[9001]
	if storedItem.SlotType != domainitem.SlotTypeBag || storedItem.SlotIndex != 0 {
		t.Fatalf("stored item slot = (%d,%d), want (%d,0)", storedItem.SlotType, storedItem.SlotIndex, domainitem.SlotTypeBag)
	}
}

func newPetEquipmentGameData(t *testing.T) *gamedata.Manager {
	t.Helper()

	manager := gamedata.NewManager(nil, zap.NewNop())
	cache := manager.GetCache()

	loadTable := func(table string, rows ...string) {
		t.Helper()
		records := make([]json.RawMessage, 0, len(rows))
		for _, row := range rows {
			records = append(records, json.RawMessage(row))
		}
		if err := cache.LoadTable(table, records); err != nil {
			t.Fatalf("LoadTable(%s) error = %v", table, err)
		}
	}

	loadTable(models.TableCreature,
		`{"id":1001,"name":"Test Pet","apt_strength":10,"apt_agility":10,"apt_stamina":10,"apt_intelligence":10,"apt_energy":10,"grow_base":1,"element":1,"q_level":1,"class_ids":3}`,
	)
	loadTable(models.TableEquiptTemplate,
		`{"id":5001,"name":"Pet Fang","kind":9,"position":50,"req_level":1,"req_class":"|3|","req_class_id":"|1001|","main_prop1":20,"main_prop_num1":5,"prop1":6,"prop_num1":7,"prop2":11,"prop_num2":9}`,
		`{"id":5002,"name":"Old Pet Fang","kind":9,"position":50,"req_level":1,"req_class":"|3|","req_class_id":"|1001|","main_prop1":20,"main_prop_num1":3,"prop1":6,"prop_num1":2}`,
	)

	return manager
}
