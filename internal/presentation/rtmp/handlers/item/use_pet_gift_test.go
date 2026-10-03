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

type itemGiftTestPetService struct {
	templateIDs []int
	pets        []*domainpet.Pet
}

func (s *itemGiftTestPetService) ContractPets(ctx context.Context, charID int64, templateIDs []int) ([]*domainpet.Pet, error) {
	s.templateIDs = append([]int(nil), templateIDs...)
	return s.pets, nil
}

func (s *itemGiftTestPetService) ContractPetsWithQuality(ctx context.Context, charID int64, templateIDs []int, quality int) ([]*domainpet.Pet, error) {
	return s.ContractPets(ctx, charID, templateIDs)
}

func TestItemHandler_UseItem_SinglePetGiftDoesNotQueueMultiSelect(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 10}
	giftItem := &domainitem.Item{
		ID:          301,
		CharacterID: char.ID,
		TemplateID:  5002,
		ItemType:    domainitem.ItemTypeConsumable,
		SlotType:    domainitem.SlotTypeBag,
		SlotIndex:   0,
		StackCount:  1,
	}

	handler, ctx := buildItemTestHandler(t, char, giftItem)
	loadItemHandlerGiftTemplate(t, handler, models.ItemTemplateTemplate{
		ID:          5002,
		Name:        "Tui Qua Kim Nguu",
		Type:        550,
		UseType:     1,
		Description: "Mo chon nhan pet Kim Nguu pham chat 1.5",
	})
	loadItemHandlerCreatureTemplate(t, handler, models.CreatureTemplate{
		ID:   702,
		Name: "Kim Nguu",
	})

	petService := &itemGiftTestPetService{
		pets: []*domainpet.Pet{{
			ID:          9002,
			CharacterID: char.ID,
			TemplateID:  702,
			Name:        "Kim Nguu",
			Property:    map[string]interface{}{"state": 3},
		}},
	}
	handler.itemService.SetPetService(petService)

	resp, err := handler.UseItem(ctx, []interface{}{float64(1), float64(-1), float64(giftItem.ID)})
	if err != nil {
		t.Fatalf("UseItem() error = %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if success, _ := result["success"].(bool); !success {
		t.Fatalf("expected success=true, got %#v", result["success"])
	}
	if len(petService.templateIDs) != 1 || petService.templateIDs[0] != 702 {
		t.Fatalf("ContractPets() templateIDs = %v, want [702]", petService.templateIDs)
	}

	handler.pendingGiftBoxesMu.Lock()
	_, hasPendingGiftBox := handler.pendingGiftBoxes[char.ID]
	handler.pendingGiftBoxesMu.Unlock()
	if hasPendingGiftBox {
		t.Fatalf("expected no pending gift box for single-pet gift")
	}

	if _, err := handler.itemService.GetItemByID(ctx.Context, char.ID, giftItem.ID); !pkgerrors.Is(err, pkgerrors.ErrItemNotFound) {
		t.Fatalf("expected gift item to be consumed, got %v", err)
	}
}

func loadItemHandlerGiftTemplate(t *testing.T, handler *Handler, template models.ItemTemplateTemplate) {
	t.Helper()

	raw, err := json.Marshal(template)
	if err != nil {
		t.Fatalf("marshal item template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableItemTemplate, []json.RawMessage{raw}); err != nil {
		t.Fatalf("load item template: %v", err)
	}
}

func loadItemHandlerCreatureTemplate(t *testing.T, handler *Handler, template models.CreatureTemplate) {
	t.Helper()

	raw, err := json.Marshal(template)
	if err != nil {
		t.Fatalf("marshal creature template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableCreature, []json.RawMessage{raw}); err != nil {
		t.Fatalf("load creature template: %v", err)
	}
}
