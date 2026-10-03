// Open-sourced by BaoLT

package item

import (
	"context"
	"testing"

	apppet "mcgame-server/internal/application/pet"
	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"

	"github.com/yutopp/go-amf0"
	"go.uber.org/zap/zaptest"
)

type recoverCallbackCall struct {
	method string
	args   []interface{}
}

type recoverCallbackRecorder struct {
	calls []recoverCallbackCall
}

func (r *recoverCallbackRecorder) SendCallback(method string, args ...interface{}) error {
	copiedArgs := make([]interface{}, len(args))
	copy(copiedArgs, args)
	r.calls = append(r.calls, recoverCallbackCall{
		method: method,
		args:   copiedArgs,
	})
	return nil
}

type recoverPetTestRepo struct {
	pets      map[int64]*domainpet.Pet
	saveCount int
}

func newRecoverPetTestRepo(pets ...*domainpet.Pet) *recoverPetTestRepo {
	repo := &recoverPetTestRepo{pets: make(map[int64]*domainpet.Pet)}
	for _, pet := range pets {
		repo.pets[pet.ID] = pet
	}
	return repo
}

func (r *recoverPetTestRepo) Save(ctx context.Context, pet *domainpet.Pet) error {
	r.pets[pet.ID] = pet
	r.saveCount++
	return nil
}

func (r *recoverPetTestRepo) FindByID(ctx context.Context, id int64) (*domainpet.Pet, error) {
	return r.pets[id], nil
}

func (r *recoverPetTestRepo) FindByCharacterID(ctx context.Context, characterID int64) ([]*domainpet.Pet, error) {
	pets := make([]*domainpet.Pet, 0)
	for _, pet := range r.pets {
		if pet.CharacterID == characterID {
			pets = append(pets, pet)
		}
	}
	return pets, nil
}

func (r *recoverPetTestRepo) FindFollowingPet(ctx context.Context, characterID int64) (*domainpet.Pet, error) {
	for _, pet := range r.pets {
		if pet.CharacterID == characterID && pet.IsFollowing {
			return pet, nil
		}
	}
	return nil, nil
}

func (r *recoverPetTestRepo) Delete(ctx context.Context, id int64) error {
	delete(r.pets, id)
	return nil
}

func (r *recoverPetTestRepo) Count(ctx context.Context, characterID int64) (int, error) {
	count := 0
	for _, pet := range r.pets {
		if pet.CharacterID == characterID {
			count++
		}
	}
	return count, nil
}

func (r *recoverPetTestRepo) UpdateFollowState(ctx context.Context, petID int64, isFollowing bool) error {
	if pet, ok := r.pets[petID]; ok {
		pet.IsFollowing = isFollowing
	}
	return nil
}

func (r *recoverPetTestRepo) ClearFollowing(ctx context.Context, characterID int64) error {
	for _, pet := range r.pets {
		if pet.CharacterID == characterID {
			pet.IsFollowing = false
		}
	}
	return nil
}

func attachRecoverPetService(t *testing.T, handler *Handler, pet *domainpet.Pet) *recoverPetTestRepo {
	t.Helper()

	repo := newRecoverPetTestRepo(pet)
	petService := apppet.NewService(repo, zaptest.NewLogger(t))
	handler.SetPetService(petService)
	return repo
}

func TestFullMpRecoverByItem_UsesActivePetAndAutoScansBag(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1, CurrentHP: 50, CurrentMP: 25}
	itemRepo := newItemTestRepo(&domainitem.Item{
		ID:          500,
		CharacterID: char.ID,
		TemplateID:  158,
		ItemType:    domainitem.ItemTypeConsumable,
		SlotType:    domainitem.SlotTypeBag,
		SlotIndex:   0,
		StackCount:  1,
		IsBound:     true,
	})
	handler, ctx := buildItemTestHandlerWithRepo(t, char, itemRepo)
	pet := &domainpet.Pet{
		ID:          99,
		CharacterID: char.ID,
		Name:        "companion",
		Level:       1,
		CurrentHP:   30,
		CurrentMP:   0,
		IsFollowing: true,
	}
	petRepo := attachRecoverPetService(t, handler, pet)

	if _, err := handler.FullMpRecoverByItem(ctx, []interface{}{float64(2), float64(1)}); err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	if pet.CurrentMP != pet.MaxMP {
		t.Fatalf("expected pet MP %d, got %d", pet.MaxMP, pet.CurrentMP)
	}
	if char.CurrentMP != 25 {
		t.Fatalf("expected character MP unchanged, got %d", char.CurrentMP)
	}
	if _, exists := itemRepo.items[500]; exists {
		t.Fatal("expected consumed MP potion to be deleted")
	}
	if petRepo.saveCount != 1 {
		t.Fatalf("expected pet save count 1, got %d", petRepo.saveCount)
	}
}

func TestFullHpRecoverByItem_UsesActivePetTarget(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1, CurrentHP: 40, CurrentMP: 30}
	itemRepo := newItemTestRepo(&domainitem.Item{
		ID:          501,
		CharacterID: char.ID,
		TemplateID:  1,
		ItemType:    domainitem.ItemTypeConsumable,
		SlotType:    domainitem.SlotTypeBag,
		SlotIndex:   1,
		StackCount:  1,
		IsBound:     true,
	})
	handler, ctx := buildItemTestHandlerWithRepo(t, char, itemRepo)
	pet := &domainpet.Pet{
		ID:          77,
		CharacterID: char.ID,
		Name:        "guardian",
		Level:       1,
		CurrentHP:   0,
		CurrentMP:   20,
		IsFollowing: true,
	}
	petRepo := attachRecoverPetService(t, handler, pet)

	args := []interface{}{
		float64(2),
		float64(1),
		amf0.ECMAArray{
			"0": amf0.ECMAArray{
				"sid":      float64(501),
				"priority": float64(299),
			},
		},
	}
	if _, err := handler.FullHpRecoverByItem(ctx, args); err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	if pet.CurrentHP != pet.MaxHP {
		t.Fatalf("expected pet HP %d, got %d", pet.MaxHP, pet.CurrentHP)
	}
	if char.CurrentHP != 40 {
		t.Fatalf("expected character HP unchanged, got %d", char.CurrentHP)
	}
	if _, exists := itemRepo.items[501]; exists {
		t.Fatal("expected consumed HP potion to be deleted")
	}
	if petRepo.saveCount != 1 {
		t.Fatalf("expected pet save count 1, got %d", petRepo.saveCount)
	}
}

func TestSendRecoverPetCallbacksToSender_SendsPetVitalsUpdates(t *testing.T) {
	pet := &domainpet.Pet{
		ID:          77,
		CharacterID: 1,
		Name:        "guardian",
		Level:       1,
		CurrentHP:   90,
		CurrentMP:   45,
		MaxHP:       120,
		MaxMP:       80,
		Property: map[string]interface{}{
			"finalHp": 120,
			"finalMp": 80,
		},
	}
	recorder := &recoverCallbackRecorder{}

	sendRecoverPetCallbacksToSender(recorder, pet)

	if len(recorder.calls) != 4 {
		t.Fatalf("SendCallback call count = %d, want 4", len(recorder.calls))
	}

	updateActivatePet := recorder.calls[0]
	if updateActivatePet.method != "updateActivatePetObj" {
		t.Fatalf("SendCallback method = %q, want %q", updateActivatePet.method, "updateActivatePetObj")
	}

	currentHPCall := recorder.calls[1]
	if currentHPCall.method != "onUpdatePet" {
		t.Fatalf("SendCallback method = %q, want %q", currentHPCall.method, "onUpdatePet")
	}
	if len(currentHPCall.args) != 3 {
		t.Fatalf("SendCallback arg count = %d, want 3", len(currentHPCall.args))
	}
	if got, ok := currentHPCall.args[0].(float64); !ok || got != 77 {
		t.Fatalf("SendCallback arg[0] = %#v, want float64(77)", currentHPCall.args[0])
	}
	if got, ok := currentHPCall.args[1].(string); !ok || got != "currentHp" {
		t.Fatalf("SendCallback arg[1] = %#v, want %q", currentHPCall.args[1], "currentHp")
	}
	if got, ok := currentHPCall.args[2].(string); !ok || got != "90" {
		t.Fatalf("SendCallback arg[2] = %#v, want %q", currentHPCall.args[2], "90")
	}

	currentMPCall := recorder.calls[2]
	if currentMPCall.method != "onUpdatePet" {
		t.Fatalf("SendCallback method = %q, want %q", currentMPCall.method, "onUpdatePet")
	}
	if len(currentMPCall.args) != 3 {
		t.Fatalf("SendCallback arg count = %d, want 3", len(currentMPCall.args))
	}
	if got, ok := currentMPCall.args[0].(float64); !ok || got != 77 {
		t.Fatalf("SendCallback arg[0] = %#v, want float64(77)", currentMPCall.args[0])
	}
	if got, ok := currentMPCall.args[1].(string); !ok || got != "currentMp" {
		t.Fatalf("SendCallback arg[1] = %#v, want %q", currentMPCall.args[1], "currentMp")
	}
	if got, ok := currentMPCall.args[2].(string); !ok || got != "45" {
		t.Fatalf("SendCallback arg[2] = %#v, want %q", currentMPCall.args[2], "45")
	}

	propRefresh := recorder.calls[3]
	if propRefresh.method != "onRefreshPetProp" {
		t.Fatalf("SendCallback method = %q, want %q", propRefresh.method, "onRefreshPetProp")
	}
	if len(propRefresh.args) != 1 {
		t.Fatalf("SendCallback arg count = %d, want 1", len(propRefresh.args))
	}
	payload, ok := propRefresh.args[0].(map[string]interface{})
	if !ok {
		t.Fatalf("SendCallback arg[0] = %#v, want map payload", propRefresh.args[0])
	}
	if got, ok := payload["id"].(int64); !ok || got != 77 {
		t.Fatalf("prop payload id = %#v, want int64(77)", payload["id"])
	}
	if _, ok := payload["s"].(map[string]interface{}); !ok {
		t.Fatalf("prop payload s = %#v, want stat map", payload["s"])
	}
}
