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

func TestLearnSkill_UsesGamedataValidation(t *testing.T) {
	char := &domainchar.Character{ID: 1, ClassID: 1, Level: 10}
	service := newNormalSkillTestService(t, char, newLifeSkillTestRepo())

	skillEntry, err := service.LearnSkill(context.Background(), char.ID, 1086)
	if err != nil {
		t.Fatalf("LearnSkill() error = %v", err)
	}
	if skillEntry.SkillID != 1086 {
		t.Fatalf("LearnSkill() skill_id = %d, want 1086", skillEntry.SkillID)
	}
	if skillEntry.Level != 1 {
		t.Fatalf("LearnSkill() level = %d, want 1", skillEntry.Level)
	}
}

func TestLearnSkill_RejectsWrongClass(t *testing.T) {
	char := &domainchar.Character{ID: 1, ClassID: 2, Level: 10}
	service := newNormalSkillTestService(t, char, newLifeSkillTestRepo())

	_, err := service.LearnSkill(context.Background(), char.ID, 1086)
	if !pkgerrors.Is(err, pkgerrors.ErrInvalidInput) {
		t.Fatalf("LearnSkill() error = %v, want %v", err, pkgerrors.ErrInvalidInput)
	}
}

func TestLearnSkill_RejectsBelowClassRank(t *testing.T) {
	char := &domainchar.Character{ID: 1, ClassID: 1, Level: 50, ClassRank: 1}
	service := newClassRankSkillTestService(t, char)

	_, err := service.LearnSkill(context.Background(), char.ID, 2001)
	if !pkgerrors.Is(err, pkgerrors.ErrInsufficientClassRank) {
		t.Fatalf("LearnSkill() error = %v, want %v", err, pkgerrors.ErrInsufficientClassRank)
	}
}

func TestLearnSkill_AllowsAtClassRank(t *testing.T) {
	char := &domainchar.Character{ID: 1, ClassID: 1, Level: 50, ClassRank: 3}
	service := newClassRankSkillTestService(t, char)

	if _, err := service.LearnSkill(context.Background(), char.ID, 2001); err != nil {
		t.Fatalf("LearnSkill() error = %v, want nil", err)
	}
}

func TestLearnSkill_RejectsRebirthSkillWithoutRebirth(t *testing.T) {
	char := &domainchar.Character{ID: 1, ClassID: 1, Level: 50, ClassRank: 5, RebirthExp: 0}
	service := newClassRankSkillTestService(t, char)

	_, err := service.LearnSkill(context.Background(), char.ID, 2002)
	if !pkgerrors.Is(err, pkgerrors.ErrSkillRequiresRebirth) {
		t.Fatalf("LearnSkill() error = %v, want %v", err, pkgerrors.ErrSkillRequiresRebirth)
	}
}

func TestLearnSkill_AllowsRebirthSkillAfterRebirth(t *testing.T) {
	char := &domainchar.Character{ID: 1, ClassID: 1, Level: 50, ClassRank: 5, RebirthExp: 1}
	service := newClassRankSkillTestService(t, char)

	if _, err := service.LearnSkill(context.Background(), char.ID, 2002); err != nil {
		t.Fatalf("LearnSkill() error = %v, want nil", err)
	}
}

func newClassRankSkillTestService(t *testing.T, char *domainchar.Character) *Service {
	t.Helper()

	manager := gamedata.NewManager(nil, zap.NewNop())
	skills := []json.RawMessage{
		lifeSkillRawJSON(t, map[string]interface{}{
			"id":        2001,
			"name":      "Advanced Stance",
			"type":      1,
			"kind":      1,
			"use_env":   0,
			"level":     1,
			"req_level": 1,
			"req_class": "|1|",
			"req_c_l":   3,
			"code_name": "advstance",
		}),
		lifeSkillRawJSON(t, map[string]interface{}{
			"id":        2002,
			"name":      "Reborn Mastery",
			"type":      1,
			"kind":      1,
			"use_env":   0,
			"level":     1,
			"req_level": 1,
			"req_class": "|1|",
			"req_c_l":   10,
			"code_name": "rebornmastery",
		}),
	}
	if err := manager.GetCache().LoadTable(models.TableSkill, skills); err != nil {
		t.Fatalf("LoadTable(TableSkill) error = %v", err)
	}

	service := NewService(newLifeSkillTestRepo(), zap.NewNop())
	service.SetCharacterRepository(&lifeSkillTestCharacterRepo{char: char})
	service.SetGameDataManager(manager)

	return service
}

func TestUpgradeSkill_UpdatesOwnedEntryAndPreservesFamily(t *testing.T) {
	slot := 2
	char := &domainchar.Character{ID: 1, ClassID: 1, Level: 20}
	existing := &domainskill.CharacterSkill{
		ID:           10,
		CharacterID:  char.ID,
		SkillID:      1086,
		Level:        1,
		SlotPosition: &slot,
	}
	repo := newLifeSkillTestRepo(existing)
	service := newNormalSkillTestService(t, char, repo)

	upgraded, err := service.UpgradeSkill(context.Background(), char.ID, 1087)
	if err != nil {
		t.Fatalf("UpgradeSkill() error = %v", err)
	}
	if upgraded.ID != existing.ID {
		t.Fatalf("UpgradeSkill() id = %d, want %d", upgraded.ID, existing.ID)
	}
	if upgraded.SkillID != 1087 {
		t.Fatalf("UpgradeSkill() skill_id = %d, want 1087", upgraded.SkillID)
	}
	if upgraded.Level != 2 {
		t.Fatalf("UpgradeSkill() level = %d, want 2", upgraded.Level)
	}
	if upgraded.SlotPosition == nil || *upgraded.SlotPosition != 2 {
		t.Fatalf("UpgradeSkill() slot = %#v, want 2", upgraded.SlotPosition)
	}
}

func TestApplySkillPosition_ReplacesExistingSlotOccupant(t *testing.T) {
	slot1 := 1
	slot2 := 2
	char := &domainchar.Character{ID: 1, ClassID: 1, Level: 20}
	first := &domainskill.CharacterSkill{
		ID:           10,
		CharacterID:  char.ID,
		SkillID:      1086,
		Level:        1,
		SlotPosition: &slot1,
	}
	second := &domainskill.CharacterSkill{
		ID:           11,
		CharacterID:  char.ID,
		SkillID:      1087,
		Level:        2,
		SlotPosition: &slot2,
	}
	repo := newLifeSkillTestRepo(first, second)
	service := newNormalSkillTestService(t, char, repo)

	if err := service.ApplySkillPosition(context.Background(), char.ID, 1087, &slot1); err != nil {
		t.Fatalf("ApplySkillPosition() error = %v", err)
	}

	updatedFirst, err := service.GetSkill(context.Background(), char.ID, 1086)
	if err != nil {
		t.Fatalf("GetSkill(1086) error = %v", err)
	}
	if updatedFirst.SlotPosition != nil {
		t.Fatalf("first skill slot = %#v, want nil", updatedFirst.SlotPosition)
	}

	updatedSecond, err := service.GetSkill(context.Background(), char.ID, 1087)
	if err != nil {
		t.Fatalf("GetSkill(1087) error = %v", err)
	}
	if updatedSecond.SlotPosition == nil || *updatedSecond.SlotPosition != 1 {
		t.Fatalf("second skill slot = %#v, want 1", updatedSecond.SlotPosition)
	}
}

func newNormalSkillTestService(t *testing.T, char *domainchar.Character, repo domainskill.Repository) *Service {
	t.Helper()

	manager := gamedata.NewManager(nil, zap.NewNop())
	skills := []json.RawMessage{
		lifeSkillRawJSON(t, map[string]interface{}{
			"id":        1086,
			"name":      "Bach Ho",
			"type":      1,
			"kind":      1,
			"use_env":   0,
			"level":     1,
			"req_level": 1,
			"req_class": "|1|",
			"code_name": "baiho",
		}),
		lifeSkillRawJSON(t, map[string]interface{}{
			"id":        1087,
			"name":      "Bach Ho",
			"type":      1,
			"kind":      1,
			"use_env":   0,
			"level":     2,
			"req_level": 10,
			"req_class": "|1|",
			"code_name": "baiho",
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
