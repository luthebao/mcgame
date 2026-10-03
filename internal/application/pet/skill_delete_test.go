// Open-sourced by BaoLT

package pet

import (
	"context"
	"errors"
	"testing"

	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"

	"go.uber.org/zap"
)

func TestBindPetPersistsBoundState(t *testing.T) {
	petRepo := &openSkillPetRepo{
		pets: map[int64]*domainpet.Pet{
			2484410: {
				ID:              2484410,
				CharacterID:     1,
				TemplateID:      1001,
				Level:           1,
				AptStrength:     10,
				AptAgility:      10,
				AptStamina:      10,
				AptIntelligence: 10,
				AptEnergy:       10,
				GrowRate:        1,
				CreatureData: map[string]interface{}{
					"classIds": 3,
					"qLevel":   3,
					"isBind":   0,
				},
				Property: map[string]interface{}{},
			},
		},
	}

	service := NewService(petRepo, zap.NewNop())
	service.SetGameDataManager(newPetSkillBookGameData(t))

	result, err := service.BindPet(context.Background(), 1, 2484410)
	if err != nil {
		t.Fatalf("BindPet() error = %v", err)
	}
	if !result.IsBound() {
		t.Fatal("BindPet() result is not bound")
	}

	storedPet := petRepo.pets[2484410]
	if !storedPet.IsBound() {
		t.Fatal("stored pet is not bound")
	}
	if binded, ok := storedPet.Property["binded"].(int); !ok || binded != 1 {
		t.Fatalf("stored binded = %#v, want 1", storedPet.Property["binded"])
	}
}

func TestDeletePetSkillConsumesItemAndClearsSlot(t *testing.T) {
	petRepo := &openSkillPetRepo{
		pets: map[int64]*domainpet.Pet{
			2484410: {
				ID:              2484410,
				CharacterID:     1,
				TemplateID:      1001,
				Level:           1,
				AptStrength:     10,
				AptAgility:      10,
				AptStamina:      10,
				AptIntelligence: 10,
				AptEnergy:       10,
				GrowRate:        1,
				CreatureData: map[string]interface{}{
					"classIds": 3,
					"qLevel":   3,
					"isBind":   0,
				},
				Property: map[string]interface{}{
					"binded": 1,
					"skill1": 5527,
				},
			},
		},
	}
	itemRepo := &bookSkillItemRepo{
		items: map[int64]*domainitem.Item{
			133507520: {
				ID:          133507520,
				CharacterID: 1,
				TemplateID:  petSkillDeleteItemTemplateID,
				SlotType:    domainitem.SlotTypeBag,
				SlotIndex:   152,
				StackCount:  338,
			},
		},
	}

	service := NewService(petRepo, zap.NewNop())
	service.SetItemRepository(itemRepo)
	service.SetGameDataManager(newPetSkillBookGameData(t))

	result, err := service.DeletePetSkill(context.Background(), 1, 2484410, 1)
	if err != nil {
		t.Fatalf("DeletePetSkill() error = %v", err)
	}
	if result.Slot != 1 {
		t.Fatalf("DeletePetSkill() slot = %d, want 1", result.Slot)
	}
	if result.SlotKey != "skill1" {
		t.Fatalf("DeletePetSkill() slotKey = %q, want skill1", result.SlotKey)
	}
	if result.RemovedSkillID != 5527 {
		t.Fatalf("DeletePetSkill() removedSkillID = %d, want 5527", result.RemovedSkillID)
	}
	if result.ConsumedItemID != 133507520 {
		t.Fatalf("DeletePetSkill() consumedItemID = %d, want 133507520", result.ConsumedItemID)
	}
	if result.ConsumedItemSID != 2253 {
		t.Fatalf("DeletePetSkill() consumedItemSID = %d, want 2253", result.ConsumedItemSID)
	}
	if result.RemainingStack != 337 {
		t.Fatalf("DeletePetSkill() remainingStack = %d, want 337", result.RemainingStack)
	}
	if result.ItemDeleted {
		t.Fatal("DeletePetSkill() itemDeleted = true, want false")
	}

	storedPet := petRepo.pets[2484410]
	if skillID := petSkillSlotValue(storedPet, 1); skillID != 0 {
		t.Fatalf("stored skill1 = %d, want 0", skillID)
	}
	if finalHP, ok := storedPet.Property["finalHp"].(int); !ok || finalHP != 120 {
		t.Fatalf("stored finalHp = %#v, want 120", storedPet.Property["finalHp"])
	}

	storedItem := itemRepo.items[133507520]
	if storedItem.StackCount != 337 {
		t.Fatalf("stored item stack = %d, want 337", storedItem.StackCount)
	}
}

func TestDeletePetSkillRequiresBoundPet(t *testing.T) {
	petRepo := &openSkillPetRepo{
		pets: map[int64]*domainpet.Pet{
			2484410: {
				ID:              2484410,
				CharacterID:     1,
				TemplateID:      1001,
				Level:           1,
				AptStrength:     10,
				AptAgility:      10,
				AptStamina:      10,
				AptIntelligence: 10,
				AptEnergy:       10,
				GrowRate:        1,
				CreatureData: map[string]interface{}{
					"classIds": 3,
					"qLevel":   3,
					"isBind":   0,
				},
				Property: map[string]interface{}{
					"skill1": 5527,
				},
			},
		},
	}
	itemRepo := &bookSkillItemRepo{
		items: map[int64]*domainitem.Item{
			133507520: {
				ID:          133507520,
				CharacterID: 1,
				TemplateID:  petSkillDeleteItemTemplateID,
				SlotType:    domainitem.SlotTypeBag,
				SlotIndex:   152,
				StackCount:  338,
			},
		},
	}

	service := NewService(petRepo, zap.NewNop())
	service.SetItemRepository(itemRepo)
	service.SetGameDataManager(newPetSkillBookGameData(t))

	_, err := service.DeletePetSkill(context.Background(), 1, 2484410, 1)
	if !errors.Is(err, ErrPetMustBeBoundForSkillDelete) {
		t.Fatalf("DeletePetSkill() error = %v, want ErrPetMustBeBoundForSkillDelete", err)
	}

	storedPet := petRepo.pets[2484410]
	if skillID := petSkillSlotValue(storedPet, 1); skillID != 5527 {
		t.Fatalf("stored skill1 = %d, want 5527", skillID)
	}

	storedItem := itemRepo.items[133507520]
	if storedItem.StackCount != 338 {
		t.Fatalf("stored item stack = %d, want 338", storedItem.StackCount)
	}
}
