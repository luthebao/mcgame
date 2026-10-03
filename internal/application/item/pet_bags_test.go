// Open-sourced by BaoLT

package item

import (
	"context"
	"encoding/json"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type petBagTestPetService struct {
	templateIDs        []int
	pets               []*domainpet.Pet
	err                error
	hasCapacity        bool
	capacityConfigured bool
}

func (s *petBagTestPetService) ContractPets(ctx context.Context, charID int64, templateIDs []int) ([]*domainpet.Pet, error) {
	s.templateIDs = append([]int(nil), templateIDs...)
	if s.err != nil {
		return nil, s.err
	}
	if len(s.pets) > 0 {
		return s.pets, nil
	}

	pets := make([]*domainpet.Pet, 0, len(templateIDs))
	for _, templateID := range templateIDs {
		pets = append(pets, &domainpet.Pet{
			ID:          int64(templateID),
			CharacterID: charID,
			TemplateID:  templateID,
			Name:        "Pet",
			Property:    map[string]interface{}{"state": 3},
		})
	}
	return pets, nil
}

func (s *petBagTestPetService) ContractPetsWithQuality(ctx context.Context, charID int64, templateIDs []int, quality int) ([]*domainpet.Pet, error) {
	return s.ContractPets(ctx, charID, templateIDs)
}

func (s *petBagTestPetService) HasPetCapacity(ctx context.Context, charID int64, incomingPets int) (bool, error) {
	if !s.capacityConfigured {
		return true, nil
	}
	return s.hasCapacity, nil
}

func TestUseItem_PetBagContractsSinglePetFromDescription(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	manager := gamedata.NewManager(nil, logger)
	loadItemTemplate(t, manager, models.ItemTemplateTemplate{
		ID:          5001,
		Name:        "Túi Quà Kim Ngưu",
		Type:        550,
		UseType:     1,
		Description: "Chứa pet Kim Ngưu Bảo Bảo phẩm chất 1.5",
	})
	loadCreatureTemplate(t, manager, models.CreatureTemplate{ID: 701, Name: "Kim Ngưu"})

	svc.SetGameDataManager(manager)
	petService := &petBagTestPetService{
		pets: []*domainpet.Pet{{
			ID:          9001,
			CharacterID: 1,
			TemplateID:  701,
			Name:        "Kim Ngưu",
			Property:    map[string]interface{}{"state": 3},
		}},
	}
	svc.SetPetService(petService)

	item := &domainitem.Item{
		ID:          11,
		CharacterID: 1,
		TemplateID:  5001,
		ItemType:    domainitem.ItemTypeConsumable,
		SlotType:    domainitem.SlotTypeBag,
		SlotIndex:   0,
		StackCount:  1,
	}
	repo.items[item.ID] = item

	usedItem, result, err := svc.UseItem(context.Background(), &domainchar.Character{ID: 1, Level: 10}, item.ID, nil)
	if err != nil {
		t.Fatalf("UseItem() error = %v", err)
	}
	if usedItem.StackCount != 0 {
		t.Fatalf("UseItem() remaining stack = %d, want 0", usedItem.StackCount)
	}
	if _, ok := repo.items[item.ID]; ok {
		t.Fatalf("expected item %d to be removed after use", item.ID)
	}
	if len(petService.templateIDs) != 1 || petService.templateIDs[0] != 701 {
		t.Fatalf("ContractPets() templateIDs = %v, want [701]", petService.templateIDs)
	}

	pets, ok := result["pets"].([]map[string]interface{})
	if !ok {
		t.Fatalf("expected pets result, got %T", result["pets"])
	}
	if len(pets) != 1 {
		t.Fatalf("expected 1 pet dto, got %d", len(pets))
	}
}

func TestUseItem_SinglePetGiftBoxReturnsInventoryFullWhenPetSlotsFull(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	manager := gamedata.NewManager(nil, logger)
	loadItemTemplate(t, manager, models.ItemTemplateTemplate{
		ID:          5002,
		Name:        "Tui Qua Kim Nguu",
		Type:        550,
		UseType:     1,
		Description: "Mo chon nhan pet Kim Nguu pham chat 1.5",
	})
	loadCreatureTemplate(t, manager, models.CreatureTemplate{ID: 702, Name: "Kim Nguu"})

	svc.SetGameDataManager(manager)
	petService := &petBagTestPetService{
		capacityConfigured: true,
		hasCapacity:        false,
	}
	svc.SetPetService(petService)

	item := &domainitem.Item{
		ID:          15,
		CharacterID: 1,
		TemplateID:  5002,
		ItemType:    domainitem.ItemTypeConsumable,
		SlotType:    domainitem.SlotTypeBag,
		SlotIndex:   0,
		StackCount:  1,
	}
	repo.items[item.ID] = item

	_, _, err := svc.UseItem(context.Background(), &domainchar.Character{ID: 1, Level: 10}, item.ID, nil)
	if !pkgerrors.Is(err, pkgerrors.ErrInventoryFull) {
		t.Fatalf("UseItem() error = %v, want %v", err, pkgerrors.ErrInventoryFull)
	}
	if len(petService.templateIDs) != 0 {
		t.Fatalf("expected no contracted pets, got %v", petService.templateIDs)
	}
	if stored, ok := repo.items[item.ID]; !ok || stored.StackCount != 1 {
		t.Fatalf("expected gift item to remain unchanged, got %#v", stored)
	}
}

func TestUseItem_SinglePetGiftBoxAutoContractsAfterPetServiceWiring(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	manager := gamedata.NewManager(nil, logger)
	loadItemTemplate(t, manager, models.ItemTemplateTemplate{
		ID:          5002,
		Name:        "Tui Qua Kim Nguu",
		Type:        550,
		UseType:     1,
		Description: "Mo chon nhan pet Kim Nguu pham chat 1.5",
	})
	loadCreatureTemplate(t, manager, models.CreatureTemplate{ID: 702, Name: "Kim Nguu"})

	svc.SetGameDataManager(manager)
	petService := &petBagTestPetService{
		pets: []*domainpet.Pet{{
			ID:          9002,
			CharacterID: 1,
			TemplateID:  702,
			Name:        "Kim Nguu",
			Property:    map[string]interface{}{"state": 3},
		}},
	}
	svc.SetPetService(petService)

	item := &domainitem.Item{
		ID:          14,
		CharacterID: 1,
		TemplateID:  5002,
		ItemType:    domainitem.ItemTypeConsumable,
		SlotType:    domainitem.SlotTypeBag,
		SlotIndex:   0,
		StackCount:  1,
	}
	repo.items[item.ID] = item

	usedItem, result, err := svc.UseItem(context.Background(), &domainchar.Character{ID: 1, Level: 10}, item.ID, nil)
	if err != nil {
		t.Fatalf("UseItem() error = %v", err)
	}
	if usedItem.StackCount != 0 {
		t.Fatalf("UseItem() remaining stack = %d, want 0", usedItem.StackCount)
	}
	if _, ok := repo.items[item.ID]; ok {
		t.Fatalf("expected item %d to be removed after use", item.ID)
	}
	if len(petService.templateIDs) != 1 || petService.templateIDs[0] != 702 {
		t.Fatalf("ContractPets() templateIDs = %v, want [702]", petService.templateIDs)
	}
	if _, ok := result["gift_box"]; ok {
		t.Fatalf("expected single-pet gift to auto-contract, got gift_box result")
	}

	pets, ok := result["pets"].([]map[string]interface{})
	if !ok {
		t.Fatalf("expected pets result, got %T", result["pets"])
	}
	if len(pets) != 1 {
		t.Fatalf("expected 1 pet dto, got %d", len(pets))
	}
}

func TestUseItem_AwardBackedPetGiftPrefersAwardHandler(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	manager := gamedata.NewManager(nil, logger)
	loadItemTemplate(t, manager, models.ItemTemplateTemplate{
		ID:          6132,
		Name:        "Tui Qua Moltres",
		Type:        550,
		UseType:     1,
		Description: "Mo chon nhan 1 Moltres pham chat 1.5 va co co hoi 1 Thien Dia Linh Thach",
	})
	loadCreatureTemplate(t, manager, models.CreatureTemplate{ID: 2221, Name: "Moltres"})
	loadAwardTemplate(t, manager, models.ItemAwardTemplate{
		ID:      1,
		ItemID:  6132,
		AwardID: 2221,
		Type:    12,
		Count:   1,
		Rate:    100,
		Quality: 3,
	})

	svc.SetGameDataManager(manager)
	petService := &awardEffectTestPetService{}
	svc.SetPetService(petService)

	item := &domainitem.Item{
		ID:          16,
		CharacterID: 1,
		TemplateID:  6132,
		ItemType:    domainitem.ItemTypeConsumable,
		SlotType:    domainitem.SlotTypeBag,
		SlotIndex:   0,
		StackCount:  1,
	}
	repo.items[item.ID] = item

	usedItem, result, err := svc.UseItem(context.Background(), &domainchar.Character{ID: 1, Level: 10}, item.ID, nil)
	if err != nil {
		t.Fatalf("UseItem() error = %v", err)
	}
	if usedItem.StackCount != 0 {
		t.Fatalf("UseItem() remaining stack = %d, want 0", usedItem.StackCount)
	}
	if _, ok := repo.items[item.ID]; ok {
		t.Fatalf("expected item %d to be removed after use", item.ID)
	}
	if len(petService.templateIDs) != 1 || petService.templateIDs[0] != 2221 {
		t.Fatalf("ContractPetsWithAwardQuality() templateIDs = %v, want [2221]", petService.templateIDs)
	}
	if petService.quality != 0 {
		t.Fatalf("expected description quality 0, got %d", petService.quality)
	}
	if petService.awardQuality != 3 {
		t.Fatalf("ContractPetsWithAwardQuality() quality = %v, want 3", petService.awardQuality)
	}
	if _, ok := result["gift_box"]; ok {
		t.Fatalf("expected award-backed pet gift to bypass gift_box result")
	}

	pets, ok := result["pets"].([]map[string]interface{})
	if !ok {
		t.Fatalf("expected pets result, got %T", result["pets"])
	}
	if len(pets) != 1 {
		t.Fatalf("expected 1 pet dto, got %d", len(pets))
	}
}

func TestUseItem_AwardBackedPetGiftReturnsInventoryFullWhenPetSlotsFull(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	manager := gamedata.NewManager(nil, logger)
	loadItemTemplate(t, manager, models.ItemTemplateTemplate{
		ID:          6132,
		Name:        "Tui Qua Moltres",
		Type:        550,
		UseType:     1,
		Description: "Mo nhan Moltres",
	})
	loadAwardTemplate(t, manager, models.ItemAwardTemplate{
		ID:      4,
		ItemID:  6132,
		AwardID: 2221,
		Type:    12,
		Count:   1,
		Rate:    100,
		Quality: 3,
	})

	svc.SetGameDataManager(manager)
	petService := &awardEffectTestPetService{
		capacityConfigured: true,
		hasCapacity:        false,
	}
	svc.SetPetService(petService)

	item := &domainitem.Item{
		ID:          17,
		CharacterID: 1,
		TemplateID:  6132,
		ItemType:    domainitem.ItemTypeConsumable,
		SlotType:    domainitem.SlotTypeBag,
		SlotIndex:   0,
		StackCount:  1,
	}
	repo.items[item.ID] = item

	_, _, err := svc.UseItem(context.Background(), &domainchar.Character{ID: 1, Level: 10}, item.ID, nil)
	if !pkgerrors.Is(err, pkgerrors.ErrInventoryFull) {
		t.Fatalf("UseItem() error = %v, want %v", err, pkgerrors.ErrInventoryFull)
	}
	if petService.contractCalls != 0 {
		t.Fatalf("expected no contract calls, got %d", petService.contractCalls)
	}
	if stored, ok := repo.items[item.ID]; !ok || stored.StackCount != 1 {
		t.Fatalf("expected gift item to remain unchanged, got %#v", stored)
	}
}

func TestUseItem_AwardBackedItemBoxReturnsInventoryFullWithoutPartialGrants(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	manager := gamedata.NewManager(nil, logger)
	loadItemTemplate(t, manager, models.ItemTemplateTemplate{
		ID:      7000,
		Name:    "Hop Qua Trang Bi",
		Type:    550,
		UseType: 1,
	})
	loadAwardTemplate(t, manager, models.ItemAwardTemplate{
		ID:      5,
		ItemID:  7000,
		AwardID: 3001,
		Type:    19,
		Count:   1,
		Rate:    100,
		Payload: map[string]interface{}{models.AwardPayloadGuaranteedKey: true},
	})
	loadAwardTemplate(t, manager, models.ItemAwardTemplate{
		ID:      6,
		ItemID:  7000,
		AwardID: 3002,
		Type:    19,
		Count:   1,
		Rate:    100,
		Payload: map[string]interface{}{models.AwardPayloadGuaranteedKey: true},
	})

	svc.SetGameDataManager(manager)

	for slot := 0; slot < 208; slot++ {
		repo.items[int64(slot+1)] = &domainitem.Item{
			ID:          int64(slot + 1),
			CharacterID: 1,
			TemplateID:  8000 + slot,
			ItemType:    domainitem.ItemTypeConsumable,
			SlotType:    domainitem.SlotTypeBag,
			SlotIndex:   slot,
			StackCount:  1,
		}
	}

	boxItem := &domainitem.Item{
		ID:          5000,
		CharacterID: 1,
		TemplateID:  7000,
		ItemType:    domainitem.ItemTypeConsumable,
		SlotType:    domainitem.SlotTypeBag,
		SlotIndex:   208,
		StackCount:  1,
	}
	repo.items[boxItem.ID] = boxItem
	repo.nextID = 6000

	_, _, err := svc.UseItem(context.Background(), &domainchar.Character{ID: 1, Level: 10}, boxItem.ID, nil)
	if !pkgerrors.Is(err, pkgerrors.ErrInventoryFull) {
		t.Fatalf("UseItem() error = %v, want %v", err, pkgerrors.ErrInventoryFull)
	}
	if _, ok := repo.items[boxItem.ID]; !ok {
		t.Fatalf("expected reward box to remain in inventory")
	}
	for _, it := range repo.items {
		if it.TemplateID == 3001 || it.TemplateID == 3002 {
			t.Fatalf("expected no granted reward items, found template %d", it.TemplateID)
		}
	}
}

func TestUseItem_PetBagContractsMultiplePetCounts(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	manager := gamedata.NewManager(nil, logger)
	loadItemTemplate(t, manager, models.ItemTemplateTemplate{
		ID:          6808,
		Name:        "Túi Pet Thần Thú",
		Type:        550,
		UseType:     1,
		Description: "Trong túi có 3 pet Jery, 3 pet Khổng Tước xanh dương",
	})
	loadCreatureTemplate(t, manager, models.CreatureTemplate{ID: 801, Name: "Jery"})
	loadCreatureTemplate(t, manager, models.CreatureTemplate{ID: 802, Name: "Khổng Tước"})

	svc.SetGameDataManager(manager)
	petService := &petBagTestPetService{}
	svc.SetPetService(petService)

	item := &domainitem.Item{
		ID:          12,
		CharacterID: 1,
		TemplateID:  6808,
		ItemType:    domainitem.ItemTypeConsumable,
		SlotType:    domainitem.SlotTypeBag,
		SlotIndex:   0,
		StackCount:  1,
	}
	repo.items[item.ID] = item

	_, _, err := svc.UseItem(context.Background(), &domainchar.Character{ID: 1, Level: 80}, item.ID, nil)
	if err != nil {
		t.Fatalf("UseItem() error = %v", err)
	}

	if len(petService.templateIDs) != 6 {
		t.Fatalf("expected 6 contracted pets, got %v", petService.templateIDs)
	}
	counts := map[int]int{}
	for _, templateID := range petService.templateIDs {
		counts[templateID]++
	}
	if counts[801] != 3 || counts[802] != 3 {
		t.Fatalf("expected 3 Jery and 3 Khổng Tước, got %v", counts)
	}
}

func TestUseItem_ChoiceBagReturnsGiftBoxData(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	manager := gamedata.NewManager(nil, logger)
	loadItemTemplate(t, manager, models.ItemTemplateTemplate{
		ID:          2841,
		Name:        "Túi Pet Tím",
		Type:        550,
		UseType:     1,
		Description: "Chứa 3 pet 1.9 gồm Thỏ Baby, Momo, Nhím Xanh. Có thể chọn nhận 1 trong 3",
	})
	loadCreatureTemplate(t, manager, models.CreatureTemplate{ID: 901, Name: "Thỏ Baby"})
	loadCreatureTemplate(t, manager, models.CreatureTemplate{ID: 902, Name: "Momo"})
	loadCreatureTemplate(t, manager, models.CreatureTemplate{ID: 903, Name: "Nhím Xanh"})

	svc.SetGameDataManager(manager)
	svc.SetPetService(&petBagTestPetService{})

	bagItem := &domainitem.Item{
		ID:          13,
		CharacterID: 1,
		TemplateID:  2841,
		ItemType:    domainitem.ItemTypeConsumable,
		SlotType:    domainitem.SlotTypeBag,
		SlotIndex:   0,
		StackCount:  1,
	}
	repo.items[bagItem.ID] = bagItem

	_, result, err := svc.UseItem(context.Background(), &domainchar.Character{ID: 1, Level: 80}, bagItem.ID, nil)
	if err != nil {
		t.Fatalf("UseItem() error = %v, want nil", err)
	}
	if _, ok := repo.items[bagItem.ID]; !ok {
		t.Fatalf("expected choice bag to remain in inventory (not consumed)")
	}
	giftBox, ok := result["gift_box"]
	if !ok {
		t.Fatalf("expected gift_box in result, got %v", result)
	}
	data, ok := giftBox.(*GiftBoxData)
	if !ok {
		t.Fatalf("expected *GiftBoxData, got %T", giftBox)
	}
	if len(data.Choices) != 3 {
		t.Fatalf("expected 3 choices, got %d", len(data.Choices))
	}
}

func loadItemTemplate(t *testing.T, manager *gamedata.Manager, template models.ItemTemplateTemplate) {
	t.Helper()
	raw, err := json.Marshal(template)
	if err != nil {
		t.Fatalf("marshal item template: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableItemTemplate, []json.RawMessage{raw}); err != nil {
		t.Fatalf("load item template: %v", err)
	}
}

func loadCreatureTemplate(t *testing.T, manager *gamedata.Manager, template models.CreatureTemplate) {
	t.Helper()
	raw, err := json.Marshal(template)
	if err != nil {
		t.Fatalf("marshal creature template: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableCreature, []json.RawMessage{raw}); err != nil {
		t.Fatalf("load creature template: %v", err)
	}
}
