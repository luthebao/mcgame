// Open-sourced by BaoLT

package pet

import (
	"context"
	"encoding/json"
	"testing"

	"mcgame-server/internal/domain/character"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type contractTestPetRepo struct {
	nextID int64
	pets   map[int64]*domainpet.Pet
}

func (r *contractTestPetRepo) Save(ctx context.Context, pet *domainpet.Pet) error {
	if pet.ID == 0 {
		r.nextID++
		pet.ID = r.nextID
	}
	copyPet := *pet
	copyPet.Property = clonePetMap(pet.Property)
	copyPet.CreatureData = clonePetMap(pet.CreatureData)
	r.pets[pet.ID] = &copyPet
	return nil
}

func (r *contractTestPetRepo) FindByID(ctx context.Context, id int64) (*domainpet.Pet, error) {
	if pet, ok := r.pets[id]; ok {
		copyPet := *pet
		copyPet.Property = clonePetMap(pet.Property)
		copyPet.CreatureData = clonePetMap(pet.CreatureData)
		return &copyPet, nil
	}
	return nil, pkgerrors.ErrNotFound
}

func (r *contractTestPetRepo) FindByCharacterID(ctx context.Context, characterID int64) ([]*domainpet.Pet, error) {
	pets := make([]*domainpet.Pet, 0)
	for _, pet := range r.pets {
		if pet.CharacterID != characterID {
			continue
		}
		copyPet := *pet
		copyPet.Property = clonePetMap(pet.Property)
		copyPet.CreatureData = clonePetMap(pet.CreatureData)
		pets = append(pets, &copyPet)
	}
	return pets, nil
}

func (r *contractTestPetRepo) FindFollowingPet(ctx context.Context, characterID int64) (*domainpet.Pet, error) {
	return nil, pkgerrors.ErrNotFound
}

func (r *contractTestPetRepo) Delete(ctx context.Context, id int64) error {
	delete(r.pets, id)
	return nil
}

func (r *contractTestPetRepo) Count(ctx context.Context, characterID int64) (int, error) {
	count := 0
	for _, pet := range r.pets {
		if pet.CharacterID == characterID {
			count++
		}
	}
	return count, nil
}

func (r *contractTestPetRepo) UpdateFollowState(ctx context.Context, petID int64, isFollowing bool) error {
	return nil
}

func (r *contractTestPetRepo) ClearFollowing(ctx context.Context, characterID int64) error {
	return nil
}

func TestContractPetsRequiresEnoughCapacity(t *testing.T) {
	service := NewService(&openSkillPetRepo{
		pets: map[int64]*domainpet.Pet{
			1: {ID: 1, CharacterID: 99, Property: map[string]interface{}{}},
			2: {ID: 2, CharacterID: 99, Property: map[string]interface{}{}},
		},
	}, zap.NewNop())
	service.SetCharacterRepository(&openSlotCharacterRepo{
		characters: map[int64]*character.Character{
			99: {ID: 99, PetMaxNum: 2},
		},
	})
	service.SetGameDataManager(newContractPetGameData(t,
		models.CreatureTemplate{ID: 1101, Name: "Kim Ngưu"},
		models.CreatureTemplate{ID: 1102, Name: "Momo"},
	))

	_, err := service.ContractPets(context.Background(), 99, []int{1101, 1102})
	if err != pkgerrors.ErrInventoryFull {
		t.Fatalf("ContractPets() error = %v, want %v", err, pkgerrors.ErrInventoryFull)
	}
}

func TestContractPetsCreatesAllPetsWhenCapacityAllows(t *testing.T) {
	repo := &contractTestPetRepo{
		nextID: 0,
		pets:   map[int64]*domainpet.Pet{},
	}
	service := NewService(repo, zap.NewNop())
	service.SetCharacterRepository(&openSlotCharacterRepo{
		characters: map[int64]*character.Character{
			77: {ID: 77, PetMaxNum: 4},
		},
	})
	service.SetGameDataManager(newContractPetGameData(t,
		models.CreatureTemplate{ID: 1201, Name: "Jery"},
		models.CreatureTemplate{ID: 1202, Name: "Khổng Tước"},
	))

	pets, err := service.ContractPets(context.Background(), 77, []int{1201, 1202})
	if err != nil {
		t.Fatalf("ContractPets() error = %v", err)
	}
	if len(pets) != 2 {
		t.Fatalf("ContractPets() pets = %d, want 2", len(pets))
	}
	if len(repo.pets) != 2 {
		t.Fatalf("stored pets = %d, want 2", len(repo.pets))
	}
}

func TestContractPetsWithQuality_OverridesGrowBase(t *testing.T) {
	repo := &contractTestPetRepo{
		nextID: 0,
		pets:   map[int64]*domainpet.Pet{},
	}
	service := NewService(repo, zap.NewNop())
	service.SetCharacterRepository(&openSlotCharacterRepo{
		characters: map[int64]*character.Character{
			55: {ID: 55, PetMaxNum: 3},
		},
	})
	service.SetGameDataManager(newContractPetGameData(t,
		models.CreatureTemplate{ID: 1301, Name: "Momo", GrowBase: 0.8},
	))

	pets, err := service.ContractPetsWithQuality(context.Background(), 55, []int{1301}, 15)
	if err != nil {
		t.Fatalf("ContractPetsWithQuality() error = %v", err)
	}
	if len(pets) != 1 {
		t.Fatalf("ContractPetsWithQuality() pets = %d, want 1", len(pets))
	}
	if pets[0].GrowRate != 1.5 {
		t.Fatalf("GrowRate = %v, want 1.5", pets[0].GrowRate)
	}
	if got := pets[0].CreatureData["growBase"]; got != "1.50" {
		t.Fatalf("CreatureData[growBase] = %#v, want %q", got, "1.50")
	}

	stored, err := repo.FindByID(context.Background(), pets[0].ID)
	if err != nil {
		t.Fatalf("FindByID() error = %v", err)
	}
	if stored.GrowRate != 1.5 {
		t.Fatalf("stored GrowRate = %v, want 1.5", stored.GrowRate)
	}
}

func TestContractPetsWithAwardQuality_UsesRawGrowRate(t *testing.T) {
	repo := &contractTestPetRepo{
		nextID: 0,
		pets:   map[int64]*domainpet.Pet{},
	}
	service := NewService(repo, zap.NewNop())
	service.SetCharacterRepository(&openSlotCharacterRepo{
		characters: map[int64]*character.Character{
			56: {ID: 56, PetMaxNum: 3},
		},
	})
	service.SetGameDataManager(newContractPetGameData(t,
		models.CreatureTemplate{ID: 1401, Name: "Moltres", GrowBase: 0.8},
	))

	pets, err := service.ContractPetsWithAwardQuality(context.Background(), 56, []int{1401}, 3)
	if err != nil {
		t.Fatalf("ContractPetsWithAwardQuality() error = %v", err)
	}
	if len(pets) != 1 {
		t.Fatalf("ContractPetsWithAwardQuality() pets = %d, want 1", len(pets))
	}
	if pets[0].GrowRate != 3 {
		t.Fatalf("GrowRate = %v, want 3", pets[0].GrowRate)
	}
	if got := pets[0].CreatureData["growBase"]; got != "3.00" {
		t.Fatalf("CreatureData[growBase] = %#v, want %q", got, "3.00")
	}

	stored, err := repo.FindByID(context.Background(), pets[0].ID)
	if err != nil {
		t.Fatalf("FindByID() error = %v", err)
	}
	if stored.GrowRate != 3 {
		t.Fatalf("stored GrowRate = %v, want 3", stored.GrowRate)
	}
	if got := stored.CreatureData["growBase"]; got != "3.00" {
		t.Fatalf("stored CreatureData[growBase] = %#v, want %q", got, "3.00")
	}
}

func TestContractPetsSeedsDefaultSkillsFromCreatureTemplate(t *testing.T) {
	repo := &contractTestPetRepo{
		nextID: 0,
		pets:   map[int64]*domainpet.Pet{},
	}
	service := NewService(repo, zap.NewNop())
	service.SetCharacterRepository(&openSlotCharacterRepo{
		characters: map[int64]*character.Character{
			77: {ID: 77, PetMaxNum: 2},
		},
	})
	service.SetGameDataManager(newContractPetGameDataWithSkills(t,
		[]models.CreatureTemplate{
			{ID: 1201, Name: "Jery"},
		},
		[]models.CreatureSkillTemplate{
			{ID: 1, Cid: 1201, Position: 2, Sid: 5002},
			{ID: 2, Cid: 1201, Position: 1, Sid: 5001},
			{ID: 3, Cid: 1201, Position: 3, Sid: 5003},
		},
	))

	pets, err := service.ContractPets(context.Background(), 77, []int{1201})
	if err != nil {
		t.Fatalf("ContractPets() error = %v", err)
	}
	if len(pets) != 1 {
		t.Fatalf("ContractPets() pets = %d, want 1", len(pets))
	}
	if got := petSkillSlotValue(pets[0], 1); got != 5001 {
		t.Fatalf("skill1 = %d, want 5001", got)
	}
	if got := petSkillSlotValue(pets[0], 2); got != 5002 {
		t.Fatalf("skill2 = %d, want 5002", got)
	}
	if got := petSkillSlotValue(pets[0], 3); got != 5003 {
		t.Fatalf("skill3 = %d, want 5003", got)
	}
	if got := petSkillSlotValue(pets[0], 4); got != 0 {
		t.Fatalf("skill4 = %d, want 0", got)
	}
}

func TestContractPetsCapsDefaultSkillsAtFiveSlots(t *testing.T) {
	repo := &contractTestPetRepo{
		nextID: 0,
		pets:   map[int64]*domainpet.Pet{},
	}
	service := NewService(repo, zap.NewNop())
	service.SetCharacterRepository(&openSlotCharacterRepo{
		characters: map[int64]*character.Character{
			78: {ID: 78, PetMaxNum: 2},
		},
	})
	service.SetGameDataManager(newContractPetGameDataWithSkills(t,
		[]models.CreatureTemplate{
			{ID: 1202, Name: "Khong Tuoc"},
		},
		[]models.CreatureSkillTemplate{
			{ID: 1, Cid: 1202, Position: 1, Sid: 6001},
			{ID: 2, Cid: 1202, Position: 2, Sid: 6002},
			{ID: 3, Cid: 1202, Position: 3, Sid: 6003},
			{ID: 4, Cid: 1202, Position: 4, Sid: 6004},
			{ID: 5, Cid: 1202, Position: 5, Sid: 6005},
			{ID: 6, Cid: 1202, Position: 6, Sid: 6006},
			{ID: 7, Cid: 1202, Position: 7, Sid: 6007},
		},
	))

	pets, err := service.ContractPets(context.Background(), 78, []int{1202})
	if err != nil {
		t.Fatalf("ContractPets() error = %v", err)
	}
	if len(pets) != 1 {
		t.Fatalf("ContractPets() pets = %d, want 1", len(pets))
	}
	for slot := 1; slot <= 5; slot++ {
		want := 6000 + slot
		if got := petSkillSlotValue(pets[0], slot); got != want {
			t.Fatalf("skill%d = %d, want %d", slot, got, want)
		}
	}
	if got := petSkillSlotValue(pets[0], 6); got != -1 {
		t.Fatalf("skill6 = %d, want -1", got)
	}
}

func TestContractPetsWithNoCreatureSkillsLeavesSlotsEmpty(t *testing.T) {
	repo := &contractTestPetRepo{
		nextID: 0,
		pets:   map[int64]*domainpet.Pet{},
	}
	service := NewService(repo, zap.NewNop())
	service.SetCharacterRepository(&openSlotCharacterRepo{
		characters: map[int64]*character.Character{
			79: {ID: 79, PetMaxNum: 2},
		},
	})
	service.SetGameDataManager(newContractPetGameDataWithSkills(t,
		[]models.CreatureTemplate{
			{ID: 1203, Name: "Momo"},
		},
		nil,
	))

	pets, err := service.ContractPets(context.Background(), 79, []int{1203})
	if err != nil {
		t.Fatalf("ContractPets() error = %v", err)
	}
	if len(pets) != 1 {
		t.Fatalf("ContractPets() pets = %d, want 1", len(pets))
	}
	for slot := 1; slot <= 5; slot++ {
		if got := petSkillSlotValue(pets[0], slot); got != 0 {
			t.Fatalf("skill%d = %d, want 0", slot, got)
		}
	}
	if got := petSkillSlotValue(pets[0], 6); got != -1 {
		t.Fatalf("skill6 = %d, want -1", got)
	}
}

func newContractPetGameData(t *testing.T, creatures ...models.CreatureTemplate) *gamedata.Manager {
	t.Helper()
	manager := gamedata.NewManager(nil, zap.NewNop())
	rows := make([]json.RawMessage, 0, len(creatures))
	for _, creature := range creatures {
		raw, err := json.Marshal(creature)
		if err != nil {
			t.Fatalf("marshal creature template: %v", err)
		}
		rows = append(rows, raw)
	}
	if err := manager.GetCache().LoadTable(models.TableCreature, rows); err != nil {
		t.Fatalf("load creature table: %v", err)
	}
	return manager
}

func newContractPetGameDataWithSkills(t *testing.T, creatures []models.CreatureTemplate, creatureSkills []models.CreatureSkillTemplate) *gamedata.Manager {
	t.Helper()
	manager := newContractPetGameData(t, creatures...)
	rows := make([]json.RawMessage, 0, len(creatureSkills))
	for _, creatureSkill := range creatureSkills {
		raw, err := json.Marshal(creatureSkill)
		if err != nil {
			t.Fatalf("marshal creature skill template: %v", err)
		}
		rows = append(rows, raw)
	}
	if err := manager.GetCache().LoadTable(models.TableCreatureSkill, rows); err != nil {
		t.Fatalf("load creature skill table: %v", err)
	}
	return manager
}
