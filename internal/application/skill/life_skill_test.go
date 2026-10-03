// Open-sourced by BaoLT

package skill

import (
	"context"
	"encoding/json"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	domainskill "mcgame-server/internal/domain/skill"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type lifeSkillTestCharacterRepo struct {
	char *domainchar.Character
}

func (r *lifeSkillTestCharacterRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	if r.char == nil || r.char.ID != id {
		return nil, pkgerrors.ErrNotFound
	}
	return r.char, nil
}

func (r *lifeSkillTestCharacterRepo) Update(ctx context.Context, character *domainchar.Character) error {
	r.char = character
	return nil
}

type lifeSkillTestRepo struct {
	nextID int64
	skills map[int64]*domainskill.CharacterSkill
}

func newLifeSkillTestRepo(skills ...*domainskill.CharacterSkill) *lifeSkillTestRepo {
	repo := &lifeSkillTestRepo{
		nextID: 1,
		skills: make(map[int64]*domainskill.CharacterSkill),
	}
	for _, sk := range skills {
		copy := *sk
		if copy.ID == 0 {
			copy.ID = repo.nextID
			repo.nextID++
		}
		if copy.ID >= repo.nextID {
			repo.nextID = copy.ID + 1
		}
		repo.skills[copy.ID] = &copy
	}
	return repo
}

func (r *lifeSkillTestRepo) FindByID(ctx context.Context, id int64) (*domainskill.CharacterSkill, error) {
	sk, ok := r.skills[id]
	if !ok {
		return nil, pkgerrors.ErrNotFound
	}
	copy := *sk
	return &copy, nil
}

func (r *lifeSkillTestRepo) FindByCharacterID(ctx context.Context, charID int64) ([]*domainskill.CharacterSkill, error) {
	result := make([]*domainskill.CharacterSkill, 0)
	for _, sk := range r.skills {
		if sk.CharacterID != charID {
			continue
		}
		copy := *sk
		result = append(result, &copy)
	}
	return result, nil
}

func (r *lifeSkillTestRepo) FindByCharacterAndSkill(ctx context.Context, charID int64, skillID int) (*domainskill.CharacterSkill, error) {
	for _, sk := range r.skills {
		if sk.CharacterID == charID && sk.SkillID == skillID {
			copy := *sk
			return &copy, nil
		}
	}
	return nil, pkgerrors.ErrNotFound
}

func (r *lifeSkillTestRepo) FindBySlot(ctx context.Context, charID int64, slot int) (*domainskill.CharacterSkill, error) {
	for _, sk := range r.skills {
		if sk.CharacterID == charID && sk.SlotPosition != nil && *sk.SlotPosition == slot {
			copy := *sk
			return &copy, nil
		}
	}
	return nil, pkgerrors.ErrNotFound
}

func (r *lifeSkillTestRepo) Create(ctx context.Context, sk *domainskill.CharacterSkill) error {
	copy := *sk
	if copy.ID == 0 {
		copy.ID = r.nextID
		r.nextID++
	}
	r.skills[copy.ID] = &copy
	sk.ID = copy.ID
	return nil
}

func (r *lifeSkillTestRepo) Update(ctx context.Context, sk *domainskill.CharacterSkill) error {
	copy := *sk
	r.skills[copy.ID] = &copy
	return nil
}

func (r *lifeSkillTestRepo) Delete(ctx context.Context, id int64) error {
	delete(r.skills, id)
	return nil
}

func (r *lifeSkillTestRepo) UpdateSlot(ctx context.Context, id int64, slot *int) error {
	sk, ok := r.skills[id]
	if !ok {
		return pkgerrors.ErrNotFound
	}
	sk.SlotPosition = slot
	return nil
}

func (r *lifeSkillTestRepo) UpdateCooldown(ctx context.Context, id int64, cooldownEnd *string) error {
	if _, ok := r.skills[id]; !ok {
		return pkgerrors.ErrNotFound
	}
	return nil
}

func (r *lifeSkillTestRepo) HasSkill(ctx context.Context, charID int64, skillID int) (bool, error) {
	for _, sk := range r.skills {
		if sk.CharacterID == charID && sk.SkillID == skillID {
			return true, nil
		}
	}
	return false, nil
}

func TestLearnPlantSkillByBookCreatesLevelOneEntry(t *testing.T) {
	char := &domainchar.Character{ID: 1, Level: 50, PlantDex: 40}
	repo := newLifeSkillTestRepo()
	service := newLifeSkillTestService(t, char, repo)

	skillEntry, template, err := service.LearnPlantSkillByBook(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("LearnPlantSkillByBook() error = %v", err)
	}
	if template == nil || int(template.ID) != 4965 {
		t.Fatalf("expected template 4965, got %#v", template)
	}
	if skillEntry.SkillID != 4965 {
		t.Fatalf("expected skill template 4965, got %d", skillEntry.SkillID)
	}
	if skillEntry.Level != 1 {
		t.Fatalf("expected level 1, got %d", skillEntry.Level)
	}
	if skillEntry.Exp != 40 {
		t.Fatalf("expected exp 40, got %d", skillEntry.Exp)
	}
}

func TestUpgradePlantSkillConsumesResourcesAndUpdatesTemplate(t *testing.T) {
	char := &domainchar.Character{
		ID:            1,
		Level:         60,
		Experience:    5000,
		Money:         9000,
		GuildContrib:  200,
		DonateContrib: 200,
		PlantDex:      600,
	}
	existing := &domainskill.CharacterSkill{
		ID:          10,
		CharacterID: char.ID,
		SkillID:     4965,
		Level:       1,
		Exp:         char.PlantDex,
	}
	repo := newLifeSkillTestRepo(existing)
	service := newLifeSkillTestService(t, char, repo)

	skillEntry, template, updatedChar, err := service.UpgradePlantSkill(context.Background(), char.ID, 4965)
	if err != nil {
		t.Fatalf("UpgradePlantSkill() error = %v", err)
	}
	if template == nil || int(template.ID) != 4964 {
		t.Fatalf("expected template 4964, got %#v", template)
	}
	if skillEntry.SkillID != 4964 {
		t.Fatalf("expected updated skill template 4964, got %d", skillEntry.SkillID)
	}
	if skillEntry.Level != 2 {
		t.Fatalf("expected level 2, got %d", skillEntry.Level)
	}
	if updatedChar.Experience != 4000 {
		t.Fatalf("expected experience 4000, got %d", updatedChar.Experience)
	}
	if updatedChar.Money != 7000 {
		t.Fatalf("expected money 7000, got %d", updatedChar.Money)
	}
	if updatedChar.GuildContrib != 0 {
		t.Fatalf("expected guild contribution 0, got %d", updatedChar.GuildContrib)
	}
	if updatedChar.DonateContrib != 100 {
		t.Fatalf("expected donate contribution 100, got %d", updatedChar.DonateContrib)
	}
}

func TestUpgradePlantSkillRequiresMastery(t *testing.T) {
	char := &domainchar.Character{
		ID:         1,
		Level:      60,
		Experience: 5000,
		Money:      9000,
		PlantDex:   559,
	}
	existing := &domainskill.CharacterSkill{
		ID:          11,
		CharacterID: char.ID,
		SkillID:     4965,
		Level:       1,
		Exp:         char.PlantDex,
	}
	repo := newLifeSkillTestRepo(existing)
	service := newLifeSkillTestService(t, char, repo)

	_, _, _, err := service.UpgradePlantSkill(context.Background(), char.ID, 4965)
	if err == nil {
		t.Fatal("expected mastery error, got nil")
	}
	if !pkgerrors.Is(err, ErrLifeSkillMasteryNotEnough) && err != ErrLifeSkillMasteryNotEnough {
		t.Fatalf("expected ErrLifeSkillMasteryNotEnough, got %v", err)
	}
}

func TestAddPlantMasterySyncsSkillExp(t *testing.T) {
	char := &domainchar.Character{
		ID:       1,
		Level:    50,
		PlantDex: 100,
	}
	existing := &domainskill.CharacterSkill{
		ID:          12,
		CharacterID: char.ID,
		SkillID:     4965,
		Level:       1,
		Exp:         100,
	}
	repo := newLifeSkillTestRepo(existing)
	service := newLifeSkillTestService(t, char, repo)

	updatedChar, skillEntry, err := service.AddPlantMastery(context.Background(), char.ID, 20)
	if err != nil {
		t.Fatalf("AddPlantMastery() error = %v", err)
	}
	if updatedChar.PlantDex != 120 {
		t.Fatalf("expected plant dex 120, got %d", updatedChar.PlantDex)
	}
	if skillEntry == nil {
		t.Fatal("expected skill entry to be updated")
	}
	if skillEntry.Exp != 120 {
		t.Fatalf("expected skill exp 120, got %d", skillEntry.Exp)
	}
}

func TestGetSkillsForCallbackIncludesLegacyClientAliases(t *testing.T) {
	char := &domainchar.Character{
		ID:       1,
		Level:    50,
		PlantDex: 100,
	}
	slot := 3
	existing := &domainskill.CharacterSkill{
		ID:           13,
		CharacterID:  char.ID,
		SkillID:      4965,
		Level:        1,
		Exp:          char.PlantDex,
		SlotPosition: &slot,
	}
	repo := newLifeSkillTestRepo(existing)
	service := newLifeSkillTestService(t, char, repo)

	dtos, err := service.GetSkillsForCallback(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("GetSkillsForCallback() error = %v", err)
	}
	if len(dtos) != 1 {
		t.Fatalf("expected 1 dto, got %d", len(dtos))
	}
	if got := dtos[0]["sid"]; got != 4965 {
		t.Fatalf("expected sid 4965, got %#v", got)
	}
	if got := dtos[0]["id"]; got != 4965 {
		t.Fatalf("expected id 4965, got %#v", got)
	}
	if got := dtos[0]["entryId"]; got != int64(13) {
		t.Fatalf("expected entryId 13, got %#v", got)
	}
	if got := dtos[0]["position"]; got != slot {
		t.Fatalf("expected position %d, got %#v", slot, got)
	}
	if got := dtos[0]["kind"]; got != 2 {
		t.Fatalf("expected kind 2, got %#v", got)
	}
}

func newLifeSkillTestService(t *testing.T, char *domainchar.Character, repo domainskill.Repository) *Service {
	t.Helper()

	manager := gamedata.NewManager(nil, zap.NewNop())
	skills := []json.RawMessage{
		lifeSkillRawJSON(t, map[string]interface{}{
			"id":                 4965,
			"name":               "Trồng Trọt",
			"type":               PlantSkillType,
			"kind":               2,
			"use_env":            6,
			"level":              1,
			"req_level":          50,
			"dex_skill":          0,
			"exp_skill":          0,
			"gold":               0,
			"cost_guild_contrib": 0,
		}),
		lifeSkillRawJSON(t, map[string]interface{}{
			"id":                 4964,
			"name":               "Trồng Trọt",
			"type":               PlantSkillType,
			"kind":               2,
			"use_env":            6,
			"level":              2,
			"req_level":          55,
			"dex_skill":          560,
			"exp_skill":          1000,
			"gold":               2000,
			"cost_guild_contrib": 300,
		}),
		lifeSkillRawJSON(t, map[string]interface{}{
			"id":                 4963,
			"name":               "Trồng Trọt",
			"type":               PlantSkillType,
			"kind":               2,
			"use_env":            6,
			"level":              3,
			"req_level":          60,
			"dex_skill":          800,
			"exp_skill":          2000,
			"gold":               3000,
			"cost_guild_contrib": 0,
		}),
	}
	if err := manager.GetCache().LoadTable(models.TableSkill, skills); err != nil {
		t.Fatalf("LoadTable(TableSkill) error = %v", err)
	}

	service := NewService(repo, zap.NewNop())
	service.SetCharacterRepository(&lifeSkillTestCharacterRepo{char: char})
	service.SetGameDataManager(manager)

	return service
}

func lifeSkillRawJSON(t *testing.T, value map[string]interface{}) json.RawMessage {
	t.Helper()

	data, err := json.Marshal(value)
	if err != nil {
		t.Fatalf("json.Marshal() error = %v", err)
	}

	return json.RawMessage(data)
}
