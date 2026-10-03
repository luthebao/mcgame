// Open-sourced by BaoLT

package item

import (
	"context"
	"encoding/json"
	"testing"
	"time"

	appbuff "mcgame-server/internal/application/buff"
	apptitle "mcgame-server/internal/application/title"
	domainbuff "mcgame-server/internal/domain/buff"
	domainchar "mcgame-server/internal/domain/character"
	domainpet "mcgame-server/internal/domain/pet"
	domainskill "mcgame-server/internal/domain/skill"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

type awardEffectTestPetService struct {
	templateIDs        []int
	quality            int
	awardQuality       float64
	contractCalls      int
	hasCapacity        bool
	capacityConfigured bool
}

func (s *awardEffectTestPetService) ContractPets(ctx context.Context, charID int64, templateIDs []int) ([]*domainpet.Pet, error) {
	s.templateIDs = append([]int(nil), templateIDs...)
	s.quality = 0
	s.awardQuality = 0
	s.contractCalls++
	return buildAwardTestPets(charID, templateIDs), nil
}

func (s *awardEffectTestPetService) ContractPetsWithQuality(ctx context.Context, charID int64, templateIDs []int, quality int) ([]*domainpet.Pet, error) {
	s.templateIDs = append([]int(nil), templateIDs...)
	s.quality = quality
	s.awardQuality = 0
	s.contractCalls++
	return buildAwardTestPets(charID, templateIDs), nil
}

func (s *awardEffectTestPetService) ContractPetsWithAwardQuality(ctx context.Context, charID int64, templateIDs []int, quality float64) ([]*domainpet.Pet, error) {
	s.templateIDs = append([]int(nil), templateIDs...)
	s.quality = 0
	s.awardQuality = quality
	s.contractCalls++
	return buildAwardTestPets(charID, templateIDs), nil
}

func (s *awardEffectTestPetService) HasPetCapacity(ctx context.Context, charID int64, incomingPets int) (bool, error) {
	if !s.capacityConfigured {
		return true, nil
	}
	return s.hasCapacity, nil
}

func buildAwardTestPets(charID int64, templateIDs []int) []*domainpet.Pet {
	pets := make([]*domainpet.Pet, 0, len(templateIDs))
	for idx, templateID := range templateIDs {
		pets = append(pets, &domainpet.Pet{
			ID:          int64(idx + 1),
			CharacterID: charID,
			TemplateID:  templateID,
			Name:        "Test Pet",
			Property:    map[string]interface{}{"state": 3},
		})
	}
	return pets
}

type awardEffectTestTitleService struct {
	grantedID int
	calls     int
}

func (s *awardEffectTestTitleService) GrantTitle(ctx context.Context, characterID int64, titleID int) (apptitle.GrantResult, error) {
	s.grantedID = titleID
	s.calls++
	return apptitle.GrantResult{
		Added:   true,
		TitleID: titleID,
		Titles:  "115",
	}, nil
}

type awardEffectTestSkillService struct {
	hasSkill  bool
	checkedID int
	learnedID int
}

func (s *awardEffectTestSkillService) HasSkill(ctx context.Context, charID int64, skillID int) (bool, error) {
	s.checkedID = skillID
	return s.hasSkill, nil
}

func (s *awardEffectTestSkillService) LearnSkill(ctx context.Context, charID int64, skillID int) (*domainskill.CharacterSkill, error) {
	s.learnedID = skillID
	return &domainskill.CharacterSkill{CharacterID: charID, SkillID: skillID, Level: 1}, nil
}

type awardEffectTestBuffService struct {
	requests []appbuff.AddRequest
}

func (s *awardEffectTestBuffService) AddOrRefresh(ctx context.Context, characterID int64, req appbuff.AddRequest) (*domainbuff.Buff, error) {
	s.requests = append(s.requests, req)
	return &domainbuff.Buff{
		ID:          91,
		CharacterID: characterID,
		BuffID:      req.BuffID,
		BuffType:    req.BuffType,
		StackCount:  req.StackCount,
	}, nil
}

func TestAwardEffectHandler_Apply_UsesPetAwardQualityWhenConfigured(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)
	manager := gamedata.NewManager(nil, logger)
	loadAwardTemplate(t, manager, models.ItemAwardTemplate{
		ID:      1,
		ItemID:  5000,
		AwardID: 701,
		Type:    12,
		Count:   2,
		Rate:    100,
		Quality: 15,
	})

	petService := &awardEffectTestPetService{}
	svc.SetPetService(petService)

	handler := &awardEffectHandler{
		gameData:    manager,
		itemService: svc,
	}

	result, err := handler.Apply(context.Background(), nil, &domainchar.Character{ID: 9}, nil, &models.ItemTemplateTemplate{ID: 5000, Name: "Pet Box"})
	if err != nil {
		t.Fatalf("Apply() error = %v", err)
	}

	if petService.quality != 0 {
		t.Fatalf("expected scaled description quality 0, got %d", petService.quality)
	}
	if petService.awardQuality != 15 {
		t.Fatalf("expected raw award quality 15, got %v", petService.awardQuality)
	}
	if len(petService.templateIDs) != 2 || petService.templateIDs[0] != 701 || petService.templateIDs[1] != 701 {
		t.Fatalf("ContractPetsWithAwardQuality() templateIDs = %v, want [701 701]", petService.templateIDs)
	}
	if len(result.Pets) != 2 {
		t.Fatalf("expected 2 pets, got %d", len(result.Pets))
	}
}

func TestAwardEffectHandler_Apply_UsesRawPetAwardQualityWhenConfigured(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)
	manager := gamedata.NewManager(nil, logger)
	loadAwardTemplate(t, manager, models.ItemAwardTemplate{
		ID:      3,
		ItemID:  5002,
		AwardID: 702,
		Type:    12,
		Count:   1,
		Rate:    100,
		Quality: 3,
	})

	petService := &awardEffectTestPetService{}
	svc.SetPetService(petService)

	handler := &awardEffectHandler{
		gameData:    manager,
		itemService: svc,
	}

	result, err := handler.Apply(context.Background(), nil, &domainchar.Character{ID: 12}, nil, &models.ItemTemplateTemplate{ID: 5002, Name: "Raw Pet Box"})
	if err != nil {
		t.Fatalf("Apply() error = %v", err)
	}
	if petService.quality != 0 {
		t.Fatalf("expected scaled description quality 0, got %d", petService.quality)
	}
	if petService.awardQuality != 3 {
		t.Fatalf("expected raw pet award quality 3, got %v", petService.awardQuality)
	}
	if len(result.Pets) != 1 {
		t.Fatalf("expected 1 pet, got %d", len(result.Pets))
	}
}

func TestAwardEffectHandler_Apply_UpdatesEachEquipmentAwardInstance(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)
	manager := gamedata.NewManager(nil, logger)
	loadAwardTemplate(t, manager, models.ItemAwardTemplate{
		ID:          2,
		ItemID:      5001,
		AwardID:     3009,
		Type:        19,
		Count:       2,
		Rate:        100,
		Quality:     10,
		PreNameType: 3,
	})
	loadEquipmentTemplate(t, manager, models.EquiptTemplateTemplate{ID: 3009, EndureMax: 40})
	svc.SetGameDataManager(manager)

	handler := &awardEffectHandler{
		gameData:    manager,
		itemService: svc,
	}

	result, err := handler.Apply(context.Background(), nil, &domainchar.Character{ID: 11}, nil, &models.ItemTemplateTemplate{ID: 5001, Name: "Equip Box"})
	if err != nil {
		t.Fatalf("Apply() error = %v", err)
	}
	if len(result.GrantedItems) != 2 {
		t.Fatalf("expected 2 granted items, got %d", len(result.GrantedItems))
	}

	for idx, granted := range result.GrantedItems {
		if granted.Count != 1 {
			t.Fatalf("granted[%d] Count = %d, want 1", idx, granted.Count)
		}
		if granted.Item == nil {
			t.Fatalf("granted[%d] Item is nil", idx)
		}
		if granted.Item.ColorCode != 2 {
			t.Fatalf("granted[%d] ColorCode = %d, want 2", idx, granted.Item.ColorCode)
		}
		if got := granted.Item.Properties["preNameType"]; got != 3 {
			t.Fatalf("granted[%d] preNameType = %#v, want 3", idx, got)
		}
		if got := granted.Item.Properties["q"]; got != 10 {
			t.Fatalf("granted[%d] q = %#v, want 10", idx, got)
		}
	}

	if len(repo.items) != 2 {
		t.Fatalf("stored items = %d, want 2", len(repo.items))
	}
}

func TestAwardEffectHandler_Apply_GrantsFlexibleRewards(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)
	manager := gamedata.NewManager(nil, logger)

	loadAwardTemplate(t, manager, models.ItemAwardTemplate{ID: 10, ItemID: 5003, AwardID: 115, Type: 33, Count: 1, Rate: 100, Payload: map[string]interface{}{models.AwardPayloadGuaranteedKey: true}})
	loadAwardTemplate(t, manager, models.ItemAwardTemplate{ID: 11, ItemID: 5003, AwardID: 1086, Type: 34, Count: 1, Rate: 100, Payload: map[string]interface{}{models.AwardPayloadGuaranteedKey: true}})
	loadAwardTemplate(t, manager, models.ItemAwardTemplate{
		ID:      12,
		ItemID:  5003,
		AwardID: 701,
		Type:    32,
		Count:   90,
		Rate:    100,
		Payload: map[string]interface{}{"stackCount": 2.0, models.AwardPayloadGuaranteedKey: true},
	})
	loadAwardTemplate(t, manager, models.ItemAwardTemplate{ID: 13, ItemID: 5003, AwardID: 20, Type: 35, Count: 5, Rate: 100, Payload: map[string]interface{}{models.AwardPayloadGuaranteedKey: true}})

	titleService := &awardEffectTestTitleService{}
	skillService := &awardEffectTestSkillService{}
	buffService := &awardEffectTestBuffService{}
	svc.SetTitleService(titleService)
	svc.SetSkillService(skillService)
	svc.SetBuffService(buffService)

	handler := &awardEffectHandler{gameData: manager, itemService: svc}
	char := &domainchar.Character{ID: 21}

	result, err := handler.Apply(context.Background(), nil, char, nil, &models.ItemTemplateTemplate{ID: 5003, Name: "Flex Box"})
	if err != nil {
		t.Fatalf("Apply() error = %v", err)
	}
	if titleService.calls != 1 || titleService.grantedID != 115 {
		t.Fatalf("GrantTitle() calls = %d id = %d, want 1 and 115", titleService.calls, titleService.grantedID)
	}
	if skillService.checkedID != 1086 || skillService.learnedID != 1086 {
		t.Fatalf("skill service ids = checked %d learned %d, want 1086", skillService.checkedID, skillService.learnedID)
	}
	if len(result.GrantedTitles) != 1 || result.GrantedTitles[0].TitleID != 115 {
		t.Fatalf("granted titles = %#v, want title 115", result.GrantedTitles)
	}
	if len(result.GrantedSkillIDs) != 1 || result.GrantedSkillIDs[0] != 1086 {
		t.Fatalf("granted skill ids = %v, want [1086]", result.GrantedSkillIDs)
	}
	if len(result.GrantedBuffs) != 1 || result.GrantedBuffs[0].BuffID != 701 {
		t.Fatalf("granted buffs = %#v, want buff 701", result.GrantedBuffs)
	}
	if len(buffService.requests) != 1 {
		t.Fatalf("AddOrRefresh() calls = %d, want 1", len(buffService.requests))
	}
	if buffService.requests[0].Duration != 90*time.Second {
		t.Fatalf("buff duration = %v, want 90s", buffService.requests[0].Duration)
	}
	if buffService.requests[0].StackCount != 2 {
		t.Fatalf("buff stack count = %d, want 2", buffService.requests[0].StackCount)
	}
	if buffService.requests[0].BuffType != domainbuff.TypeTimed {
		t.Fatalf("buff type = %d, want %d", buffService.requests[0].BuffType, domainbuff.TypeTimed)
	}
	if char.GuildContrib != 5 {
		t.Fatalf("GuildContrib = %d, want 5", char.GuildContrib)
	}
	if !result.RefreshCharacterView {
		t.Fatal("expected RefreshCharacterView to be true")
	}
}

func loadAwardTemplate(t *testing.T, manager *gamedata.Manager, template models.ItemAwardTemplate) {
	t.Helper()
	raw, err := json.Marshal(template)
	if err != nil {
		t.Fatalf("marshal item award: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableItemAward, []json.RawMessage{raw}); err != nil {
		t.Fatalf("load item award: %v", err)
	}
}

func loadEquipmentTemplate(t *testing.T, manager *gamedata.Manager, template models.EquiptTemplateTemplate) {
	t.Helper()
	raw, err := json.Marshal(template)
	if err != nil {
		t.Fatalf("marshal equipment template: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{raw}); err != nil {
		t.Fatalf("load equipment template: %v", err)
	}
}
