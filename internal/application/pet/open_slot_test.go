// Open-sourced by BaoLT

package pet

import (
	"context"
	"testing"

	"mcgame-server/internal/domain/character"
	domainpet "mcgame-server/internal/domain/pet"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

type openSlotCharacterRepo struct {
	characters map[int64]*character.Character
	updateErr  error
}

func (r *openSlotCharacterRepo) FindByID(ctx context.Context, id int64) (*character.Character, error) {
	if char, ok := r.characters[id]; ok {
		copyChar := *char
		return &copyChar, nil
	}
	return nil, nil
}

func (r *openSlotCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*character.Character, error) {
	return nil, nil
}

func (r *openSlotCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*character.Character, error) {
	return nil, nil
}

func (r *openSlotCharacterRepo) FindByName(ctx context.Context, name string) (*character.Character, error) {
	return nil, nil
}

func (r *openSlotCharacterRepo) Create(ctx context.Context, char *character.Character) error {
	return nil
}

func (r *openSlotCharacterRepo) Update(ctx context.Context, char *character.Character) error {
	if r.updateErr != nil {
		return r.updateErr
	}
	copyChar := *char
	r.characters[char.ID] = &copyChar
	return nil
}

func (r *openSlotCharacterRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (r *openSlotCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}

func (r *openSlotCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos character.Position) error {
	return nil
}

func (r *openSlotCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

func TestOpenPetSlotPrefersGoldBind(t *testing.T) {
	repo := &openSlotCharacterRepo{
		characters: map[int64]*character.Character{
			1: {ID: 1, PetMaxNum: 6, GoldBind: 25, Gold: 100},
		},
	}
	service := NewService(nil, zap.NewNop())
	service.SetCharacterRepository(repo)

	newSlots, cost, currencyType, remaining, err := service.OpenPetSlot(context.Background(), 1)
	if err != nil {
		t.Fatalf("OpenPetSlot() error = %v", err)
	}
	if newSlots != 7 {
		t.Fatalf("OpenPetSlot() newSlots = %d, want 7", newSlots)
	}
	if cost != 20 {
		t.Fatalf("OpenPetSlot() cost = %d, want 20", cost)
	}
	if currencyType != "goldBind" {
		t.Fatalf("OpenPetSlot() currencyType = %q, want goldBind", currencyType)
	}
	if remaining != 5 {
		t.Fatalf("OpenPetSlot() remaining = %d, want 5", remaining)
	}

	stored := repo.characters[1]
	if stored.PetMaxNum != 7 {
		t.Fatalf("stored PetMaxNum = %d, want 7", stored.PetMaxNum)
	}
	if stored.GoldBind != 5 {
		t.Fatalf("stored GoldBind = %d, want 5", stored.GoldBind)
	}
	if stored.Gold != 100 {
		t.Fatalf("stored Gold = %d, want 100", stored.Gold)
	}
}

func TestOpenPetSlotFallsBackToGold(t *testing.T) {
	repo := &openSlotCharacterRepo{
		characters: map[int64]*character.Character{
			1: {ID: 1, PetMaxNum: 6, GoldBind: 5, Gold: 50},
		},
	}
	service := NewService(nil, zap.NewNop())
	service.SetCharacterRepository(repo)

	newSlots, cost, currencyType, remaining, err := service.OpenPetSlot(context.Background(), 1)
	if err != nil {
		t.Fatalf("OpenPetSlot() error = %v", err)
	}
	if newSlots != 7 {
		t.Fatalf("OpenPetSlot() newSlots = %d, want 7", newSlots)
	}
	if cost != 20 {
		t.Fatalf("OpenPetSlot() cost = %d, want 20", cost)
	}
	if currencyType != "gold" {
		t.Fatalf("OpenPetSlot() currencyType = %q, want gold", currencyType)
	}
	if remaining != 30 {
		t.Fatalf("OpenPetSlot() remaining = %d, want 30", remaining)
	}

	stored := repo.characters[1]
	if stored.GoldBind != 5 {
		t.Fatalf("stored GoldBind = %d, want 5", stored.GoldBind)
	}
	if stored.Gold != 30 {
		t.Fatalf("stored Gold = %d, want 30", stored.Gold)
	}
}

func TestOpenPetSlotStopsAtMaxPets(t *testing.T) {
	repo := &openSlotCharacterRepo{
		characters: map[int64]*character.Character{
			1: {ID: 1, PetMaxNum: domainpet.MaxPets, GoldBind: 100, Gold: 100},
		},
	}
	service := NewService(nil, zap.NewNop())
	service.SetCharacterRepository(repo)

	newSlots, cost, currencyType, remaining, err := service.OpenPetSlot(context.Background(), 1)
	if err != pkgerrors.ErrInventoryFull {
		t.Fatalf("OpenPetSlot() error = %v, want %v", err, pkgerrors.ErrInventoryFull)
	}
	if newSlots != domainpet.MaxPets {
		t.Fatalf("OpenPetSlot() newSlots = %d, want %d", newSlots, domainpet.MaxPets)
	}
	if cost != 0 {
		t.Fatalf("OpenPetSlot() cost = %d, want 0", cost)
	}
	if currencyType != "" {
		t.Fatalf("OpenPetSlot() currencyType = %q, want empty", currencyType)
	}
	if remaining != 0 {
		t.Fatalf("OpenPetSlot() remaining = %d, want 0", remaining)
	}
}
