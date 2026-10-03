// Open-sourced by BaoLT

package pet

import (
	"context"
	"encoding/json"
	"errors"
	"testing"

	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type bookSkillItemRepo struct {
	items          map[int64]*domainitem.Item
	updateStackErr error
	deleteErr      error
}

func (r *bookSkillItemRepo) FindByID(ctx context.Context, id int64) (*domainitem.Item, error) {
	item, ok := r.items[id]
	if !ok {
		return nil, pkgerrors.ErrItemNotFound
	}
	cloned := *item
	cloned.Properties = clonePetMap(item.Properties)
	return &cloned, nil
}

func (r *bookSkillItemRepo) FindByCharacterID(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	items := make([]*domainitem.Item, 0)
	for _, item := range r.items {
		if item.CharacterID != charID {
			continue
		}
		cloned := *item
		cloned.Properties = clonePetMap(item.Properties)
		items = append(items, &cloned)
	}
	return items, nil
}

func (r *bookSkillItemRepo) FindByCharacterAndSlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) ([]*domainitem.Item, error) {
	items := make([]*domainitem.Item, 0)
	for _, item := range r.items {
		if item.CharacterID != charID || item.SlotType != slotType {
			continue
		}
		cloned := *item
		cloned.Properties = clonePetMap(item.Properties)
		items = append(items, &cloned)
	}
	return items, nil
}

func (r *bookSkillItemRepo) FindBySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, slotIndex int) (*domainitem.Item, error) {
	return nil, pkgerrors.ErrItemNotFound
}

func (r *bookSkillItemRepo) FindEquipped(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	return nil, nil
}

func (r *bookSkillItemRepo) Create(ctx context.Context, item *domainitem.Item) error {
	return nil
}

func (r *bookSkillItemRepo) Update(ctx context.Context, item *domainitem.Item) error {
	return nil
}

func (r *bookSkillItemRepo) Delete(ctx context.Context, id int64) error {
	if r.deleteErr != nil {
		return r.deleteErr
	}
	delete(r.items, id)
	return nil
}

func (r *bookSkillItemRepo) DeleteByCharacterID(ctx context.Context, charID int64) error {
	return nil
}

func (r *bookSkillItemRepo) MoveItem(ctx context.Context, id int64, slotType domainitem.SlotType, slotIndex int) error {
	return nil
}

func (r *bookSkillItemRepo) UpdateStack(ctx context.Context, id int64, stackCount int) error {
	if r.updateStackErr != nil {
		return r.updateStackErr
	}
	item, ok := r.items[id]
	if !ok {
		return pkgerrors.ErrItemNotFound
	}
	item.StackCount = stackCount
	return nil
}

func (r *bookSkillItemRepo) FindFirstEmptySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, maxSlots int) (int, error) {
	return 0, nil
}

func (r *bookSkillItemRepo) CountBySlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) (int, error) {
	return 0, nil
}

func TestLearnSkillFromBookUsesItemInstanceAndAppliesBuff(t *testing.T) {
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
				},
				Property: map[string]interface{}{},
			},
		},
	}
	itemRepo := &bookSkillItemRepo{
		items: map[int64]*domainitem.Item{
			9001: {
				ID:          9001,
				CharacterID: 1,
				TemplateID:  3216,
				StackCount:  2,
			},
		},
	}

	service := NewService(petRepo, zap.NewNop())
	service.SetItemRepository(itemRepo)
	service.SetGameDataManager(newPetSkillBookGameData(t))

	result, err := service.LearnSkillFromBook(context.Background(), 1, 2484410, 9001)
	if err != nil {
		t.Fatalf("LearnSkillFromBook() error = %v", err)
	}
	if result.Slot != 1 {
		t.Fatalf("LearnSkillFromBook() slot = %d, want 1", result.Slot)
	}
	if result.SkillID != 5527 {
		t.Fatalf("LearnSkillFromBook() skillID = %d, want 5527", result.SkillID)
	}
	if result.RemainingStack != 1 {
		t.Fatalf("LearnSkillFromBook() remainingStack = %d, want 1", result.RemainingStack)
	}

	storedPet := petRepo.pets[2484410]
	if petSkillSlotValue(storedPet, 1) != 5527 {
		t.Fatalf("stored skill1 = %d, want 5527", petSkillSlotValue(storedPet, 1))
	}
	if storedPet.MaxHP != 146 {
		t.Fatalf("stored MaxHP = %d, want 146", storedPet.MaxHP)
	}
	if finalHP, ok := storedPet.Property["finalHp"].(int); !ok || finalHP != 146 {
		t.Fatalf("stored finalHp = %v, want 146", storedPet.Property["finalHp"])
	}

	storedItem := itemRepo.items[9001]
	if storedItem.StackCount != 1 {
		t.Fatalf("stored item stack = %d, want 1", storedItem.StackCount)
	}
}

func TestLearnSkillFromBookRejectsDuplicateSkillFamily(t *testing.T) {
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
				},
				Property: map[string]interface{}{
					"skill1": 5528,
				},
			},
		},
	}
	itemRepo := &bookSkillItemRepo{
		items: map[int64]*domainitem.Item{
			9001: {
				ID:          9001,
				CharacterID: 1,
				TemplateID:  3216,
				StackCount:  2,
			},
		},
	}

	service := NewService(petRepo, zap.NewNop())
	service.SetItemRepository(itemRepo)
	gameData := newPetSkillBookGameData(t)
	addUniversalPetSkillBookGameData(t, gameData)
	service.SetGameDataManager(gameData)

	_, err := service.LearnSkillFromBook(context.Background(), 1, 2484410, 9001)
	if err == nil {
		t.Fatalf("LearnSkillFromBook() error = nil, want duplicate failure")
	}

	var bookErr *PetSkillBookError
	if !errors.As(err, &bookErr) {
		t.Fatalf("LearnSkillFromBook() error type = %T, want *PetSkillBookError", err)
	}
	if bookErr.Failure != PetSkillBookFailureLearn {
		t.Fatalf("LearnSkillFromBook() failure = %d, want %d", bookErr.Failure, PetSkillBookFailureLearn)
	}
}

func TestLearnSkillFromBookRejectsInvalidBookTemplate(t *testing.T) {
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
				},
				Property: map[string]interface{}{},
			},
		},
	}
	itemRepo := &bookSkillItemRepo{
		items: map[int64]*domainitem.Item{
			9002: {
				ID:          9002,
				CharacterID: 1,
				TemplateID:  4000,
				StackCount:  1,
			},
		},
	}

	service := NewService(petRepo, zap.NewNop())
	service.SetItemRepository(itemRepo)
	service.SetGameDataManager(newPetSkillBookGameData(t))

	_, err := service.LearnSkillFromBook(context.Background(), 1, 2484410, 9002)
	if err == nil {
		t.Fatalf("LearnSkillFromBook() error = nil, want invalid book failure")
	}

	var bookErr *PetSkillBookError
	if !errors.As(err, &bookErr) {
		t.Fatalf("LearnSkillFromBook() error type = %T, want *PetSkillBookError", err)
	}
	if bookErr.Failure != PetSkillBookFailureBook {
		t.Fatalf("LearnSkillFromBook() failure = %d, want %d", bookErr.Failure, PetSkillBookFailureBook)
	}
}

func TestLearnSkillFromBookRejectsWhenNoOpenSkillSlot(t *testing.T) {
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
				},
				Property: map[string]interface{}{
					"skill1":  5001,
					"skill2":  5002,
					"skill3":  5003,
					"skill4":  5004,
					"skill5":  5005,
					"skill6":  -1,
					"skill7":  -1,
					"skill8":  -1,
					"skill9":  -1,
					"skill10": -1,
					"skill11": -1,
					"skill12": -1,
					"skill13": -1,
					"skill14": -1,
					"skill15": -1,
				},
			},
		},
	}
	itemRepo := &bookSkillItemRepo{
		items: map[int64]*domainitem.Item{
			9001: {
				ID:          9001,
				CharacterID: 1,
				TemplateID:  3216,
				StackCount:  1,
			},
		},
	}

	service := NewService(petRepo, zap.NewNop())
	service.SetItemRepository(itemRepo)
	service.SetGameDataManager(newPetSkillBookGameData(t))

	_, err := service.LearnSkillFromBook(context.Background(), 1, 2484410, 9001)
	if err == nil {
		t.Fatalf("LearnSkillFromBook() error = nil, want no-slot failure")
	}

	var bookErr *PetSkillBookError
	if !errors.As(err, &bookErr) {
		t.Fatalf("LearnSkillFromBook() error type = %T, want *PetSkillBookError", err)
	}
	if bookErr.Failure != PetSkillBookFailureLearn {
		t.Fatalf("LearnSkillFromBook() failure = %d, want %d", bookErr.Failure, PetSkillBookFailureLearn)
	}
}

func TestLearnSkillFromBookRejectsMismatchedPetClassID(t *testing.T) {
	petRepo := &openSkillPetRepo{
		pets: map[int64]*domainpet.Pet{
			2484410: {
				ID:              2484410,
				CharacterID:     1,
				TemplateID:      1002,
				Level:           1,
				AptStrength:     10,
				AptAgility:      10,
				AptStamina:      10,
				AptIntelligence: 10,
				AptEnergy:       10,
				GrowRate:        1,
				CreatureData: map[string]interface{}{
					"classIds": 2,
					"qLevel":   3,
				},
				Property: map[string]interface{}{},
			},
		},
	}
	itemRepo := &bookSkillItemRepo{
		items: map[int64]*domainitem.Item{
			9001: {
				ID:          9001,
				CharacterID: 1,
				TemplateID:  3216,
				StackCount:  1,
			},
		},
	}

	service := NewService(petRepo, zap.NewNop())
	service.SetItemRepository(itemRepo)
	service.SetGameDataManager(newPetSkillBookGameData(t))

	_, err := service.LearnSkillFromBook(context.Background(), 1, 2484410, 9001)
	if err == nil {
		t.Fatalf("LearnSkillFromBook() error = nil, want class restriction failure")
	}

	var bookErr *PetSkillBookError
	if !errors.As(err, &bookErr) {
		t.Fatalf("LearnSkillFromBook() error type = %T, want *PetSkillBookError", err)
	}
	if bookErr.Failure != PetSkillBookFailureBook {
		t.Fatalf("LearnSkillFromBook() failure = %d, want %d", bookErr.Failure, PetSkillBookFailureBook)
	}
}

func TestLearnSkillFromBookAllowsUniversalPetSkill(t *testing.T) {
	petRepo := &openSkillPetRepo{
		pets: map[int64]*domainpet.Pet{
			2484410: {
				ID:              2484410,
				CharacterID:     1,
				TemplateID:      1002,
				Level:           1,
				AptStrength:     10,
				AptAgility:      10,
				AptStamina:      10,
				AptIntelligence: 10,
				AptEnergy:       10,
				GrowRate:        1,
				CreatureData: map[string]interface{}{
					"classIds": 2,
					"qLevel":   3,
				},
				Property: map[string]interface{}{},
			},
		},
	}
	itemRepo := &bookSkillItemRepo{
		items: map[int64]*domainitem.Item{
			9003: {
				ID:          9003,
				CharacterID: 1,
				TemplateID:  4001,
				StackCount:  1,
			},
		},
	}

	service := NewService(petRepo, zap.NewNop())
	service.SetItemRepository(itemRepo)
	gameData := newPetSkillBookGameData(t)
	addUniversalPetSkillBookGameData(t, gameData)
	service.SetGameDataManager(gameData)

	result, err := service.LearnSkillFromBook(context.Background(), 1, 2484410, 9003)
	if err != nil {
		t.Fatalf("LearnSkillFromBook() error = %v", err)
	}
	if result.SkillID != 6001 {
		t.Fatalf("LearnSkillFromBook() skillID = %d, want 6001", result.SkillID)
	}
}

func newPetSkillBookGameData(t *testing.T) *gamedata.Manager {
	t.Helper()

	manager := gamedata.NewManager(nil, zap.NewNop())
	cache := manager.GetCache()

	loadTable := func(table string, rows ...string) {
		t.Helper()
		records := make([]json.RawMessage, 0, len(rows))
		for _, row := range rows {
			records = append(records, json.RawMessage(row))
		}
		if err := cache.LoadTable(table, records); err != nil {
			t.Fatalf("LoadTable(%s) error = %v", table, err)
		}
	}

	loadTable(models.TableCreature, `{"id":1001,"name":"Test Pet","apt_strength":10,"apt_agility":10,"apt_stamina":10,"apt_intelligence":10,"apt_energy":10,"grow_base":1,"element":1,"q_level":3}`)
	loadTable(models.TableCreature,
		`{"id":1001,"name":"Test Pet","apt_strength":10,"apt_agility":10,"apt_stamina":10,"apt_intelligence":10,"apt_energy":10,"grow_base":1,"element":1,"q_level":3,"class_ids":3}`,
		`{"id":1002,"name":"Other Test Pet","apt_strength":10,"apt_agility":10,"apt_stamina":10,"apt_intelligence":10,"apt_energy":10,"grow_base":1,"element":1,"q_level":3,"class_ids":2}`,
	)
	loadTable(models.TableItemTemplate,
		`{"id":3216,"name":"Thụ Bì Ngoại Sáo Siêu Cấp","kind":5,"type":506,"use_type":2,"prop_type":237,"skill_id":0}`,
		`{"id":4000,"name":"Táo","kind":5,"type":550,"use_type":1,"prop_type":0,"skill_id":0}`,
	)
	loadTable(models.TableSkill,
		`{"id":5527,"name":"Thụ Bì Ngoại Sáo Siêu Cấp","code_name":"thu_bi_ngoai_sao_super","buff_id":2113,"level":1,"cre_kind":"3|3"}`,
		`{"id":5528,"name":"Thụ Bì Ngoại Sáo Siêu Cấp","code_name":"thu_bi_ngoai_sao_super","buff_id":2114,"level":2,"cre_kind":"3|3"}`,
	)
	loadTable(models.TableBuff,
		`{"id":2113,"percent_flag":1,"prop1":1,"prop_num1":22}`,
		`{"id":2114,"percent_flag":1,"prop1":1,"prop_num1":31}`,
	)

	return manager
}

func addUniversalPetSkillBookGameData(t *testing.T, manager *gamedata.Manager) {
	t.Helper()

	cache := manager.GetCache()
	loadTable := func(table string, rows ...string) {
		t.Helper()
		records := make([]json.RawMessage, 0, len(rows))
		for _, row := range rows {
			records = append(records, json.RawMessage(row))
		}
		if err := cache.LoadTable(table, records); err != nil {
			t.Fatalf("LoadTable(%s) error = %v", table, err)
		}
	}

	loadTable(models.TableItemTemplate,
		`{"id":4001,"name":"Man Lực","kind":5,"type":506,"use_type":2,"prop_type":205,"skill_id":6001}`,
	)
	loadTable(models.TableSkill,
		`{"id":6001,"name":"Man Lực","code_name":"man_luc","buff_id":2200,"level":1,"cre_kind":"0"}`,
	)
	loadTable(models.TableBuff,
		`{"id":2200,"percent_flag":0,"prop1":4,"prop_num1":12}`,
	)
}
