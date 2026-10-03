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

type petGuardCharacterRepo struct {
	characters map[int64]*character.Character
	updateErr  error
}

func (r *petGuardCharacterRepo) FindByID(ctx context.Context, id int64) (*character.Character, error) {
	if char, ok := r.characters[id]; ok {
		copyChar := *char
		copyChar.PetGuardData = clonePetGuardMap(char.PetGuardData)
		return &copyChar, nil
	}
	return nil, nil
}

func (r *petGuardCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*character.Character, error) {
	return nil, nil
}

func (r *petGuardCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*character.Character, error) {
	return nil, nil
}

func (r *petGuardCharacterRepo) FindByName(ctx context.Context, name string) (*character.Character, error) {
	return nil, nil
}

func (r *petGuardCharacterRepo) Create(ctx context.Context, char *character.Character) error {
	return nil
}

func (r *petGuardCharacterRepo) Update(ctx context.Context, char *character.Character) error {
	if r.updateErr != nil {
		return r.updateErr
	}
	copyChar := *char
	copyChar.PetGuardData = clonePetGuardMap(char.PetGuardData)
	r.characters[char.ID] = &copyChar
	return nil
}

func (r *petGuardCharacterRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (r *petGuardCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}

func (r *petGuardCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos character.Position) error {
	return nil
}

func (r *petGuardCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

type petGuardPetRepo struct {
	pets map[int64]*domainpet.Pet
}

func (r *petGuardPetRepo) Save(ctx context.Context, pet *domainpet.Pet) error {
	copyPet := *pet
	copyPet.Property = clonePetMap(pet.Property)
	copyPet.CreatureData = clonePetMap(pet.CreatureData)
	r.pets[pet.ID] = &copyPet
	return nil
}

func (r *petGuardPetRepo) FindByID(ctx context.Context, id int64) (*domainpet.Pet, error) {
	if pet, ok := r.pets[id]; ok {
		copyPet := *pet
		copyPet.Property = clonePetMap(pet.Property)
		copyPet.CreatureData = clonePetMap(pet.CreatureData)
		return &copyPet, nil
	}
	return nil, pkgerrors.ErrNotFound
}

func (r *petGuardPetRepo) FindByCharacterID(ctx context.Context, characterID int64) ([]*domainpet.Pet, error) {
	result := make([]*domainpet.Pet, 0)
	for _, pet := range r.pets {
		if pet.CharacterID != characterID {
			continue
		}
		copyPet := *pet
		copyPet.Property = clonePetMap(pet.Property)
		copyPet.CreatureData = clonePetMap(pet.CreatureData)
		result = append(result, &copyPet)
	}
	return result, nil
}

func (r *petGuardPetRepo) FindFollowingPet(ctx context.Context, characterID int64) (*domainpet.Pet, error) {
	return nil, nil
}

func (r *petGuardPetRepo) Delete(ctx context.Context, id int64) error {
	delete(r.pets, id)
	return nil
}

func (r *petGuardPetRepo) Count(ctx context.Context, characterID int64) (int, error) {
	count := 0
	for _, pet := range r.pets {
		if pet.CharacterID == characterID {
			count++
		}
	}
	return count, nil
}

func (r *petGuardPetRepo) UpdateFollowState(ctx context.Context, petID int64, isFollowing bool) error {
	return nil
}

func (r *petGuardPetRepo) ClearFollowing(ctx context.Context, characterID int64) error {
	return nil
}

func TestGetPetGuardDataNormalizesEmptyState(t *testing.T) {
	charRepo := &petGuardCharacterRepo{
		characters: map[int64]*character.Character{
			1: {ID: 1},
		},
	}

	service := NewService(nil, zap.NewNop())
	service.SetCharacterRepository(charRepo)

	payload, err := service.GetPetGuardData(context.Background(), 1)
	if err != nil {
		t.Fatalf("GetPetGuardData() error = %v", err)
	}

	lvData := payload["lvData"].(map[string]interface{})
	petData := payload["petData"].(map[string]interface{})
	if got := lvData["0"]; got != 0 {
		t.Fatalf("lvData[0] = %v, want 0", got)
	}
	if got := lvData["4"]; got != 0 {
		t.Fatalf("lvData[4] = %v, want 0", got)
	}
	if got := petData["0"]; got != int64(0) {
		t.Fatalf("petData[0] = %v, want 0", got)
	}
	if got := petData["45"]; got != int64(0) {
		t.Fatalf("petData[45] = %v, want 0", got)
	}
}

func TestMovePetToPetGuardSidAssignsEligiblePet(t *testing.T) {
	charRepo := &petGuardCharacterRepo{
		characters: map[int64]*character.Character{
			1: {ID: 1},
		},
	}
	petRepo := &petGuardPetRepo{
		pets: map[int64]*domainpet.Pet{
			101: {
				ID:          101,
				CharacterID: 1,
				CreatureData: map[string]interface{}{
					"classIds": "10",
					"useLv":    "50",
				},
			},
		},
	}

	service := NewService(petRepo, zap.NewNop())
	service.SetCharacterRepository(charRepo)

	payload, err := service.MovePetToPetGuardSid(context.Background(), 1, 101, 12)
	if err != nil {
		t.Fatalf("MovePetToPetGuardSid() error = %v", err)
	}

	petData := payload["petData"].(map[string]interface{})
	if got := petData["12"]; got != int64(101) {
		t.Fatalf("petData[12] = %v, want 101", got)
	}

	stored := charRepo.characters[1]
	storedPayload := NormalizePetGuardPayload(stored)
	storedPetData := storedPayload["petData"].(map[string]interface{})
	if got := storedPetData["12"]; got != int64(101) {
		t.Fatalf("stored petData[12] = %v, want 101", got)
	}
}

func TestMovePetToPetGuardSidRejectsDuplicatePet(t *testing.T) {
	charRepo := &petGuardCharacterRepo{
		characters: map[int64]*character.Character{
			1: {
				ID: 1,
				PetGuardData: map[string]interface{}{
					"petData": map[string]interface{}{
						"1": 101,
					},
				},
			},
		},
	}
	petRepo := &petGuardPetRepo{
		pets: map[int64]*domainpet.Pet{
			101: {
				ID:          101,
				CharacterID: 1,
				CreatureData: map[string]interface{}{
					"classIds": 10,
					"useLv":    60,
				},
			},
		},
	}

	service := NewService(petRepo, zap.NewNop())
	service.SetCharacterRepository(charRepo)

	_, err := service.MovePetToPetGuardSid(context.Background(), 1, 101, 12)
	if err != pkgerrors.ErrInvalidInput {
		t.Fatalf("MovePetToPetGuardSid() error = %v, want %v", err, pkgerrors.ErrInvalidInput)
	}
}

func TestMovePetToPetGuardSidRejectsIneligiblePet(t *testing.T) {
	charRepo := &petGuardCharacterRepo{
		characters: map[int64]*character.Character{
			1: {ID: 1},
		},
	}
	petRepo := &petGuardPetRepo{
		pets: map[int64]*domainpet.Pet{
			201: {
				ID:          201,
				CharacterID: 1,
				CreatureData: map[string]interface{}{
					"classIds": 9,
					"useLv":    40,
				},
			},
		},
	}

	service := NewService(petRepo, zap.NewNop())
	service.SetCharacterRepository(charRepo)

	_, err := service.MovePetToPetGuardSid(context.Background(), 1, 201, 1)
	if err != pkgerrors.ErrInvalidInput {
		t.Fatalf("MovePetToPetGuardSid() error = %v, want %v", err, pkgerrors.ErrInvalidInput)
	}
}

func TestPutDownPetClearsExistingSlot(t *testing.T) {
	charRepo := &petGuardCharacterRepo{
		characters: map[int64]*character.Character{
			1: {
				ID: 1,
				PetGuardData: map[string]interface{}{
					"petData": map[string]interface{}{
						"21": 301,
					},
				},
			},
		},
	}

	service := NewService(nil, zap.NewNop())
	service.SetCharacterRepository(charRepo)

	payload, err := service.PutDownPet(context.Background(), 1, 21)
	if err != nil {
		t.Fatalf("PutDownPet() error = %v", err)
	}

	petData := payload["petData"].(map[string]interface{})
	if got := petData["21"]; got != int64(0) {
		t.Fatalf("petData[21] = %v, want 0", got)
	}
}

func clonePetGuardMap(source map[string]interface{}) map[string]interface{} {
	if source == nil {
		return nil
	}

	cloned := make(map[string]interface{}, len(source))
	for key, value := range source {
		switch typed := value.(type) {
		case map[string]interface{}:
			nested := make(map[string]interface{}, len(typed))
			for nestedKey, nestedValue := range typed {
				nested[nestedKey] = nestedValue
			}
			cloned[key] = nested
		default:
			cloned[key] = value
		}
	}

	return cloned
}
