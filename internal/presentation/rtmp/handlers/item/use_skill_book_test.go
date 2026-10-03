// Open-sourced by BaoLT

package item

import (
	"context"
	"encoding/json"
	"testing"

	appskill "mcgame-server/internal/application/skill"
	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainskill "mcgame-server/internal/domain/skill"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap/zaptest"
)

type itemSkillTestRepo struct {
	nextID int64
	skills map[int64]*domainskill.CharacterSkill
}

func newItemSkillTestRepo() *itemSkillTestRepo {
	return &itemSkillTestRepo{
		nextID: 1,
		skills: make(map[int64]*domainskill.CharacterSkill),
	}
}

func (r *itemSkillTestRepo) FindByID(ctx context.Context, id int64) (*domainskill.CharacterSkill, error) {
	sk, ok := r.skills[id]
	if !ok {
		return nil, pkgerrors.ErrNotFound
	}
	copy := *sk
	return &copy, nil
}

func (r *itemSkillTestRepo) FindByCharacterID(ctx context.Context, charID int64) ([]*domainskill.CharacterSkill, error) {
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

func (r *itemSkillTestRepo) FindByCharacterAndSkill(ctx context.Context, charID int64, skillID int) (*domainskill.CharacterSkill, error) {
	for _, sk := range r.skills {
		if sk.CharacterID == charID && sk.SkillID == skillID {
			copy := *sk
			return &copy, nil
		}
	}
	return nil, pkgerrors.ErrNotFound
}

func (r *itemSkillTestRepo) FindBySlot(ctx context.Context, charID int64, slot int) (*domainskill.CharacterSkill, error) {
	for _, sk := range r.skills {
		if sk.CharacterID == charID && sk.SlotPosition != nil && *sk.SlotPosition == slot {
			copy := *sk
			return &copy, nil
		}
	}
	return nil, pkgerrors.ErrNotFound
}

func (r *itemSkillTestRepo) Create(ctx context.Context, sk *domainskill.CharacterSkill) error {
	copy := *sk
	copy.ID = r.nextID
	r.nextID++
	r.skills[copy.ID] = &copy
	sk.ID = copy.ID
	return nil
}

func (r *itemSkillTestRepo) Update(ctx context.Context, sk *domainskill.CharacterSkill) error {
	copy := *sk
	r.skills[copy.ID] = &copy
	return nil
}

func (r *itemSkillTestRepo) Delete(ctx context.Context, id int64) error {
	delete(r.skills, id)
	return nil
}

func (r *itemSkillTestRepo) UpdateSlot(ctx context.Context, id int64, slot *int) error {
	return nil
}

func (r *itemSkillTestRepo) UpdateCooldown(ctx context.Context, id int64, cooldownEnd *string) error {
	return nil
}

func (r *itemSkillTestRepo) HasSkill(ctx context.Context, charID int64, skillID int) (bool, error) {
	for _, sk := range r.skills {
		if sk.CharacterID == charID && sk.SkillID == skillID {
			return true, nil
		}
	}
	return false, nil
}

func TestItemHandlerUseItemPlantSkillBookLearnsSkill(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 60, Experience: 4321}
	book := &domainitem.Item{
		ID:          240901,
		CharacterID: char.ID,
		TemplateID:  appskill.PlantSkillBookTemplateID,
		ItemType:    domainitem.ItemTypeConsumable,
		SlotType:    domainitem.SlotTypeBag,
		SlotIndex:   0,
		StackCount:  1,
	}

	handler, ctx := buildItemTestHandler(t, char, book)
	loadItemSkillBookTemplate(t, handler)
	loadPlantSkillTemplates(t, handler)

	skillRepo := newItemSkillTestRepo()
	skillService := appskill.NewService(skillRepo, zaptest.NewLogger(t))
	skillService.SetCharacterRepository(&itemTestCharacterRepo{char: char})
	skillService.SetGameDataManager(handler.gameData)
	handler.SetSkillService(skillService)

	resp, err := handler.UseItem(ctx, []interface{}{float64(1), float64(-1), float64(book.ID)})
	if err != nil {
		t.Fatalf("UseItem() error = %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if success, _ := result["success"].(bool); !success {
		t.Fatalf("expected success=true, got %#v", result["success"])
	}

	learned, err := skillService.GetSkill(ctx.Context, char.ID, 4965)
	if err != nil {
		t.Fatalf("expected learned plant skill, got %v", err)
	}
	if learned.Level != 1 {
		t.Fatalf("expected learned level 1, got %d", learned.Level)
	}
	if learned.Exp != char.PlantDex {
		t.Fatalf("expected learned exp %d, got %d", char.PlantDex, learned.Exp)
	}

	if _, err := handler.itemService.GetItemByID(ctx.Context, char.ID, book.ID); !pkgerrors.Is(err, pkgerrors.ErrItemNotFound) {
		t.Fatalf("expected skill book to be consumed, got %v", err)
	}

	skillDTOs, err := skillService.GetSkillsForCallback(ctx.Context, char.ID)
	if err != nil {
		t.Fatalf("GetSkillsForCallback() error = %v", err)
	}
	if len(skillDTOs) != 1 {
		t.Fatalf("expected 1 skill dto, got %d", len(skillDTOs))
	}
	if got := skillDTOs[0]["id"]; got != 4965 {
		t.Fatalf("expected callback id 4965, got %#v", got)
	}
	if got := skillDTOs[0]["sid"]; got != 4965 {
		t.Fatalf("expected callback sid 4965, got %#v", got)
	}
}

func loadItemSkillBookTemplate(t *testing.T, handler *Handler) {
	t.Helper()

	raw := itemSkillRawJSON(t, map[string]interface{}{
		"id":        appskill.PlantSkillBookTemplateID,
		"kind":      1,
		"type":      1,
		"use_type":  2,
		"req_level": 50,
	})
	if err := handler.gameData.GetCache().LoadTable(models.TableItemTemplate, []json.RawMessage{raw}); err != nil {
		t.Fatalf("load skill book item template: %v", err)
	}
}

func loadPlantSkillTemplates(t *testing.T, handler *Handler) {
	t.Helper()

	raw := []json.RawMessage{
		itemSkillRawJSON(t, map[string]interface{}{
			"id":        4965,
			"name":      "Trồng Trọt",
			"type":      appskill.PlantSkillType,
			"kind":      2,
			"use_env":   6,
			"level":     1,
			"req_level": 50,
			"dex_skill": 0,
		}),
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableSkill, raw); err != nil {
		t.Fatalf("load plant skill template: %v", err)
	}
}

func itemSkillRawJSON(t *testing.T, value map[string]interface{}) json.RawMessage {
	t.Helper()

	data, err := json.Marshal(value)
	if err != nil {
		t.Fatalf("json.Marshal() error = %v", err)
	}

	return json.RawMessage(data)
}
