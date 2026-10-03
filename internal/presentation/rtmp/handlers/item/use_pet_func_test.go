// Open-sourced by BaoLT

package item

import (
	"context"
	"encoding/json"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"
)

type petFuncHandlerPetService struct {
	pets  map[int64]*domainpet.Pet
	saved []*domainpet.Pet
}

func (s *petFuncHandlerPetService) ContractPets(_ context.Context, _ int64, _ []int) ([]*domainpet.Pet, error) {
	return nil, nil
}

func (s *petFuncHandlerPetService) ContractPetsWithQuality(_ context.Context, _ int64, _ []int, _ int) ([]*domainpet.Pet, error) {
	return nil, nil
}

func (s *petFuncHandlerPetService) GetPetDetail(_ context.Context, charID int64, petID int64) (*domainpet.Pet, error) {
	p, ok := s.pets[petID]
	if !ok || p.CharacterID != charID {
		return nil, pkgerrors.ErrNotFound
	}
	cp := *p
	return &cp, nil
}

func (s *petFuncHandlerPetService) Save(_ context.Context, pet *domainpet.Pet) error {
	cp := *pet
	s.pets[pet.ID] = &cp
	s.saved = append(s.saved, &cp)
	return nil
}

func loadPetFuncTemplate(t *testing.T, handler *Handler, tpl models.ItemTemplateTemplate) {
	t.Helper()
	raw, err := json.Marshal(tpl)
	if err != nil {
		t.Fatalf("marshal pet func template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableItemTemplate, []json.RawMessage{raw}); err != nil {
		t.Fatalf("load pet func template: %v", err)
	}
}

func TestItemHandler_UseItem_PetFuncItem_PopulatesPetIDAndRestoresLife(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 10}
	petFuncItem := &domainitem.Item{
		ID:          201,
		CharacterID: char.ID,
		TemplateID:  7001,
		ItemType:    domainitem.ItemTypeConsumable,
		SlotType:    domainitem.SlotTypeBag,
		SlotIndex:   0,
		StackCount:  1,
	}

	handler, ctx := buildItemTestHandler(t, char, petFuncItem)
	loadPetFuncTemplate(t, handler, models.ItemTemplateTemplate{
		ID: 7001, Type: 507, Name: "Đơn Hồi Thọ Pet", N1: 3000,
	})

	petID := int64(55)
	petSvc := &petFuncHandlerPetService{
		pets: map[int64]*domainpet.Pet{
			petID: {ID: petID, CharacterID: char.ID, Life: 4000},
		},
	}
	handler.itemService.SetPetService(petSvc)

	resp, err := handler.UseItem(ctx, []interface{}{float64(2), float64(petID), float64(petFuncItem.ID)})
	if err != nil {
		t.Fatalf("UseItem() error = %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T: %v", resp, resp)
	}
	if success, _ := result["success"].(bool); !success {
		t.Fatalf("expected success=true, got %#v", result)
	}

	if len(petSvc.saved) == 0 {
		t.Fatal("expected pet to be saved, confirming PetID was propagated and life was restored")
	}
	if petSvc.saved[0].Life != 7000 {
		t.Fatalf("expected Life=7000 (4000+3000), got %d", petSvc.saved[0].Life)
	}
}

func TestItemHandler_UseItem_PetFuncItem_NoPetID_ReturnsNonSuccess(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 10}
	petFuncItem := &domainitem.Item{
		ID:          202,
		CharacterID: char.ID,
		TemplateID:  7001,
		ItemType:    domainitem.ItemTypeConsumable,
		SlotType:    domainitem.SlotTypeBag,
		SlotIndex:   0,
		StackCount:  1,
	}

	handler, ctx := buildItemTestHandler(t, char, petFuncItem)
	loadPetFuncTemplate(t, handler, models.ItemTemplateTemplate{
		ID: 7001, Type: 507, Name: "Đơn Hồi Thọ Pet", N1: 3000,
	})

	petSvc := &petFuncHandlerPetService{
		pets: map[int64]*domainpet.Pet{},
	}
	handler.itemService.SetPetService(petSvc)

	resp, err := handler.UseItem(ctx, []interface{}{float64(0), float64(0), float64(petFuncItem.ID)})
	if err != nil {
		t.Fatalf("UseItem() should not return error at handler level, got %v", err)
	}

	if result, ok := resp.(map[string]interface{}); ok {
		if success, _ := result["success"].(bool); success {
			t.Fatal("expected no success=true when petID=0 for petfunc item")
		}
	}
}

func TestItemHandler_UseItem_PetFuncItem_LifeCapAt10000(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 10}
	petFuncItem := &domainitem.Item{
		ID:          203,
		CharacterID: char.ID,
		TemplateID:  7001,
		ItemType:    domainitem.ItemTypeConsumable,
		SlotType:    domainitem.SlotTypeBag,
		SlotIndex:   0,
		StackCount:  1,
	}

	handler, ctx := buildItemTestHandler(t, char, petFuncItem)
	loadPetFuncTemplate(t, handler, models.ItemTemplateTemplate{
		ID: 7001, Type: 507, Name: "Đơn Hồi Thọ Pet", N1: 9999,
	})

	petID := int64(77)
	petSvc := &petFuncHandlerPetService{
		pets: map[int64]*domainpet.Pet{
			petID: {ID: petID, CharacterID: char.ID, Life: 8000},
		},
	}
	handler.itemService.SetPetService(petSvc)

	resp, err := handler.UseItem(ctx, []interface{}{float64(2), float64(petID), float64(petFuncItem.ID)})
	if err != nil {
		t.Fatalf("UseItem() error = %v", err)
	}
	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if success, _ := result["success"].(bool); !success {
		t.Fatalf("expected success=true, got %#v", result)
	}
	if len(petSvc.saved) == 0 {
		t.Fatal("expected pet to be saved")
	}
	if petSvc.saved[0].Life != 10000 {
		t.Fatalf("expected Life capped at 10000, got %d", petSvc.saved[0].Life)
	}
}
