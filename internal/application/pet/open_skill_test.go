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

type openSkillCharacterRepo struct {
	characters map[int64]*character.Character
	updateErr  error
}

func (r *openSkillCharacterRepo) FindByID(ctx context.Context, id int64) (*character.Character, error) {
	if char, ok := r.characters[id]; ok {
		copyChar := *char
		return &copyChar, nil
	}
	return nil, nil
}

func (r *openSkillCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*character.Character, error) {
	return nil, nil
}

func (r *openSkillCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*character.Character, error) {
	return nil, nil
}

func (r *openSkillCharacterRepo) FindByName(ctx context.Context, name string) (*character.Character, error) {
	return nil, nil
}

func (r *openSkillCharacterRepo) Create(ctx context.Context, char *character.Character) error {
	return nil
}

func (r *openSkillCharacterRepo) Update(ctx context.Context, char *character.Character) error {
	if r.updateErr != nil {
		return r.updateErr
	}
	copyChar := *char
	r.characters[char.ID] = &copyChar
	return nil
}

func (r *openSkillCharacterRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (r *openSkillCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}

func (r *openSkillCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos character.Position) error {
	return nil
}

func (r *openSkillCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

type openSkillPetRepo struct {
	pets    map[int64]*domainpet.Pet
	saveErr error
}

func (r *openSkillPetRepo) Save(ctx context.Context, pet *domainpet.Pet) error {
	if r.saveErr != nil {
		return r.saveErr
	}
	copyPet := *pet
	copyPet.Property = clonePetMap(pet.Property)
	copyPet.CreatureData = clonePetMap(pet.CreatureData)
	r.pets[pet.ID] = &copyPet
	return nil
}

func (r *openSkillPetRepo) FindByID(ctx context.Context, id int64) (*domainpet.Pet, error) {
	if pet, ok := r.pets[id]; ok {
		copyPet := *pet
		copyPet.Property = clonePetMap(pet.Property)
		copyPet.CreatureData = clonePetMap(pet.CreatureData)
		return &copyPet, nil
	}
	return nil, pkgerrors.ErrNotFound
}

func (r *openSkillPetRepo) FindByCharacterID(ctx context.Context, characterID int64) ([]*domainpet.Pet, error) {
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

func (r *openSkillPetRepo) FindFollowingPet(ctx context.Context, characterID int64) (*domainpet.Pet, error) {
	return nil, nil
}

func (r *openSkillPetRepo) Delete(ctx context.Context, id int64) error {
	delete(r.pets, id)
	return nil
}

func (r *openSkillPetRepo) Count(ctx context.Context, characterID int64) (int, error) {
	count := 0
	for _, pet := range r.pets {
		if pet.CharacterID == characterID {
			count++
		}
	}
	return count, nil
}

func (r *openSkillPetRepo) UpdateFollowState(ctx context.Context, petID int64, isFollowing bool) error {
	return nil
}

func (r *openSkillPetRepo) ClearFollowing(ctx context.Context, characterID int64) error {
	return nil
}

func clonePetMap(source map[string]interface{}) map[string]interface{} {
	if source == nil {
		return nil
	}
	cloned := make(map[string]interface{}, len(source))
	for key, value := range source {
		cloned[key] = value
	}
	return cloned
}

func TestOpenPetSkillOpensLockedSlotWithGoldBind(t *testing.T) {
	charRepo := &openSkillCharacterRepo{
		characters: map[int64]*character.Character{
			1: {ID: 1, GoldBind: 50, Gold: 90},
		},
	}
	petRepo := &openSkillPetRepo{
		pets: map[int64]*domainpet.Pet{
			2484410: {
				ID:          2484410,
				CharacterID: 1,
				TemplateID:  1001,
				Property: map[string]interface{}{
					"skill6": -1,
				},
				CreatureData: map[string]interface{}{
					"qLevel": "1",
				},
			},
		},
	}

	service := NewService(petRepo, zap.NewNop())
	service.SetCharacterRepository(charRepo)

	result, err := service.OpenPetSkill(context.Background(), 1, 2484410, 6)
	if err != nil {
		t.Fatalf("OpenPetSkill() error = %v", err)
	}
	if result.SlotKey != "skill6" {
		t.Fatalf("OpenPetSkill() slotKey = %q, want skill6", result.SlotKey)
	}
	if result.Cost != 10 {
		t.Fatalf("OpenPetSkill() cost = %d, want 10", result.Cost)
	}
	if result.CurrencyType != "goldBind" {
		t.Fatalf("OpenPetSkill() currencyType = %q, want goldBind", result.CurrencyType)
	}
	if result.Remaining != 40 {
		t.Fatalf("OpenPetSkill() remaining = %d, want 40", result.Remaining)
	}

	storedPet := petRepo.pets[2484410]
	if petSkillSlotValue(storedPet, 1) != 0 {
		t.Fatalf("stored skill1 = %d, want 0", petSkillSlotValue(storedPet, 1))
	}
	if petSkillSlotValue(storedPet, 5) != 0 {
		t.Fatalf("stored skill5 = %d, want 0", petSkillSlotValue(storedPet, 5))
	}
	if petSkillSlotValue(storedPet, 6) != 0 {
		t.Fatalf("stored skill6 = %d, want 0", petSkillSlotValue(storedPet, 6))
	}

	storedChar := charRepo.characters[1]
	if storedChar.GoldBind != 40 {
		t.Fatalf("stored GoldBind = %d, want 40", storedChar.GoldBind)
	}
	if storedChar.Gold != 90 {
		t.Fatalf("stored Gold = %d, want 90", storedChar.Gold)
	}
}

func TestOpenPetSkillUsesQualityMultiplierAndFallsBackToGold(t *testing.T) {
	charRepo := &openSkillCharacterRepo{
		characters: map[int64]*character.Character{
			1: {ID: 1, GoldBind: 20, Gold: 100},
		},
	}
	petRepo := &openSkillPetRepo{
		pets: map[int64]*domainpet.Pet{
			100: {
				ID:          100,
				CharacterID: 1,
				TemplateID:  1002,
				Property: map[string]interface{}{
					"skill7": -1,
				},
				CreatureData: map[string]interface{}{
					"qLevel": "2",
				},
			},
		},
	}

	service := NewService(petRepo, zap.NewNop())
	service.SetCharacterRepository(charRepo)

	result, err := service.OpenPetSkill(context.Background(), 1, 100, 7)
	if err != nil {
		t.Fatalf("OpenPetSkill() error = %v", err)
	}
	if result.Cost != 60 {
		t.Fatalf("OpenPetSkill() cost = %d, want 60", result.Cost)
	}
	if result.CurrencyType != "gold" {
		t.Fatalf("OpenPetSkill() currencyType = %q, want gold", result.CurrencyType)
	}
	if result.Remaining != 40 {
		t.Fatalf("OpenPetSkill() remaining = %d, want 40", result.Remaining)
	}

	storedChar := charRepo.characters[1]
	if storedChar.GoldBind != 20 {
		t.Fatalf("stored GoldBind = %d, want 20", storedChar.GoldBind)
	}
	if storedChar.Gold != 40 {
		t.Fatalf("stored Gold = %d, want 40", storedChar.Gold)
	}
	if petSkillSlotValue(petRepo.pets[100], 7) != 0 {
		t.Fatalf("stored skill7 = %d, want 0", petSkillSlotValue(petRepo.pets[100], 7))
	}
}

func TestOpenPetSkillRejectsAlreadyOpenedSlot(t *testing.T) {
	charRepo := &openSkillCharacterRepo{
		characters: map[int64]*character.Character{
			1: {ID: 1, GoldBind: 50, Gold: 50},
		},
	}
	petRepo := &openSkillPetRepo{
		pets: map[int64]*domainpet.Pet{
			100: {
				ID:          100,
				CharacterID: 1,
				Property: map[string]interface{}{
					"skill6": 0,
				},
			},
		},
	}

	service := NewService(petRepo, zap.NewNop())
	service.SetCharacterRepository(charRepo)

	_, err := service.OpenPetSkill(context.Background(), 1, 100, 6)
	if err != pkgerrors.ErrInvalidInput {
		t.Fatalf("OpenPetSkill() error = %v, want %v", err, pkgerrors.ErrInvalidInput)
	}
}
