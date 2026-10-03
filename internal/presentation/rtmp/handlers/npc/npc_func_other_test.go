// Open-sourced by BaoLT

package npc

import (
	"context"
	"encoding/json"
	"errors"
	"testing"

	appchar "mcgame-server/internal/application/character"
	apppet "mcgame-server/internal/application/pet"
	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/creature"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	infrartmp "mcgame-server/internal/infrastructure/rtmp"

	"github.com/google/uuid"
	"go.uber.org/zap"
	"go.uber.org/zap/zaptest"
)

type npcHealCharacterRepo struct {
	char *domainchar.Character
}

func (r *npcHealCharacterRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	if r.char == nil || r.char.ID != id {
		return nil, errors.New("character not found")
	}
	return r.char, nil
}

func (r *npcHealCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *npcHealCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *npcHealCharacterRepo) FindByName(ctx context.Context, name string) (*domainchar.Character, error) {
	return nil, nil
}

func (r *npcHealCharacterRepo) Create(ctx context.Context, character *domainchar.Character) error {
	r.char = character
	return nil
}

func (r *npcHealCharacterRepo) Update(ctx context.Context, character *domainchar.Character) error {
	r.char = character
	return nil
}

func (r *npcHealCharacterRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (r *npcHealCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}

func (r *npcHealCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos domainchar.Position) error {
	return nil
}

func (r *npcHealCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

type npcHealPetRepo struct {
	pets      map[int64]*domainpet.Pet
	saveCount int
}

func newNPCHealPetRepo(pets ...*domainpet.Pet) *npcHealPetRepo {
	repo := &npcHealPetRepo{pets: make(map[int64]*domainpet.Pet)}
	for _, pet := range pets {
		repo.pets[pet.ID] = pet
	}
	return repo
}

func (r *npcHealPetRepo) Save(ctx context.Context, pet *domainpet.Pet) error {
	r.pets[pet.ID] = pet
	r.saveCount++
	return nil
}

func (r *npcHealPetRepo) FindByID(ctx context.Context, id int64) (*domainpet.Pet, error) {
	return r.pets[id], nil
}

func (r *npcHealPetRepo) FindByCharacterID(ctx context.Context, characterID int64) ([]*domainpet.Pet, error) {
	pets := make([]*domainpet.Pet, 0)
	for _, pet := range r.pets {
		if pet.CharacterID == characterID {
			pets = append(pets, pet)
		}
	}
	return pets, nil
}

func (r *npcHealPetRepo) FindFollowingPet(ctx context.Context, characterID int64) (*domainpet.Pet, error) {
	for _, pet := range r.pets {
		if pet.CharacterID == characterID && pet.IsFollowing {
			return pet, nil
		}
	}
	return nil, nil
}

func (r *npcHealPetRepo) Delete(ctx context.Context, id int64) error {
	delete(r.pets, id)
	return nil
}

func (r *npcHealPetRepo) Count(ctx context.Context, characterID int64) (int, error) {
	count := 0
	for _, pet := range r.pets {
		if pet.CharacterID == characterID {
			count++
		}
	}
	return count, nil
}

func (r *npcHealPetRepo) UpdateFollowState(ctx context.Context, petID int64, isFollowing bool) error {
	if pet, ok := r.pets[petID]; ok {
		pet.IsFollowing = isFollowing
	}
	return nil
}

func (r *npcHealPetRepo) ClearFollowing(ctx context.Context, characterID int64) error {
	for _, pet := range r.pets {
		if pet.CharacterID == characterID {
			pet.IsFollowing = false
		}
	}
	return nil
}

func TestNpcFuncOther_HealAllRestoresActivePetVitals(t *testing.T) {
	gameDataManager := gamedata.NewManager(nil, zap.NewNop())
	npcTemplate := &models.NpcTemplate{
		ID:       430,
		Name:     "Bac Si",
		PosMapID: 2,
		Type:     float64(creature.NPCTypeHeal),
	}
	if err := gameDataManager.GetCache().LoadTable(models.TableNpc, []json.RawMessage{mustNPCJSON(t, npcTemplate)}); err != nil {
		t.Fatalf("failed to load npc template: %v", err)
	}

	char := &domainchar.Character{
		ID:        1,
		Name:      "tester",
		Level:     10,
		CurrentHP: 40,
		CurrentMP: 25,
		MaxHP:     100,
		MaxMP:     80,
		MoneyBind: 10000,
		Money:     10000,
	}
	charRepo := &npcHealCharacterRepo{char: char}
	charService := appchar.NewService(charRepo, zaptest.NewLogger(t))

	pet := &domainpet.Pet{
		ID:          77,
		CharacterID: char.ID,
		Name:        "guardian",
		Level:       1,
		CurrentHP:   30,
		CurrentMP:   15,
		IsFollowing: true,
	}
	petRepo := newNPCHealPetRepo(pet)
	petService := apppet.NewService(petRepo, zaptest.NewLogger(t))

	handler := NewHandler(nil, charService, nil, nil, nil, zap.NewNop())
	handler.SetGameDataManager(gameDataManager)
	handler.SetPetService(petService)

	ctx := &infrartmp.RPCContext{
		Context:     context.Background(),
		CharacterID: "1",
		Connection:  infrartmp.NewConnection(1, nil, nil, zap.NewNop()),
	}

	if _, err := handler.NpcFuncOther(ctx, []interface{}{float64(430), float64(3)}); err != nil {
		t.Fatalf("NpcFuncOther() error = %v, want nil", err)
	}

	if char.CurrentHP != char.MaxHP {
		t.Fatalf("character current HP = %d, want %d", char.CurrentHP, char.MaxHP)
	}
	if char.CurrentMP != char.MaxMP {
		t.Fatalf("character current MP = %d, want %d", char.CurrentMP, char.MaxMP)
	}

	updatedPet, err := petRepo.FindByID(context.Background(), 77)
	if err != nil {
		t.Fatalf("FindByID(77) error = %v", err)
	}
	if updatedPet.CurrentHP != updatedPet.MaxHP {
		t.Fatalf("pet current HP = %d, want %d", updatedPet.CurrentHP, updatedPet.MaxHP)
	}
	if updatedPet.CurrentMP != updatedPet.MaxMP {
		t.Fatalf("pet current MP = %d, want %d", updatedPet.CurrentMP, updatedPet.MaxMP)
	}
	if petRepo.saveCount != 1 {
		t.Fatalf("pet save count = %d, want 1", petRepo.saveCount)
	}
}
