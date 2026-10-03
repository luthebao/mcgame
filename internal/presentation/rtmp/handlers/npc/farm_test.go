// Open-sourced by BaoLT

package npc

import (
	"encoding/json"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	domainfarm "mcgame-server/internal/domain/farm"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

func TestHasFarmPlantVigor(t *testing.T) {
	char := &domainchar.Character{CurrentSP: 25}

	if !hasFarmPlantVigor(char, farmPlantVigorCost) {
		t.Fatalf("expected character to have enough vigor")
	}

	if hasFarmPlantVigor(char, farmPlantVigorCost+1) {
		t.Fatalf("expected character to lack vigor for larger cost")
	}
}

func TestSpendFarmPlantVigor(t *testing.T) {
	char := &domainchar.Character{CurrentSP: 40}

	if !spendFarmPlantVigor(char, farmPlantVigorCost) {
		t.Fatalf("expected vigor spend to succeed")
	}

	if char.CurrentSP != 15 {
		t.Fatalf("expected vigor to be 15, got %d", char.CurrentSP)
	}

	if spendFarmPlantVigor(char, farmPlantVigorCost) {
		t.Fatalf("expected second vigor spend to fail")
	}

	if char.CurrentSP != 15 {
		t.Fatalf("expected vigor to stay 15 after failed spend, got %d", char.CurrentSP)
	}
}

func TestFarmExistingPlotSystemMessage(t *testing.T) {
	gameData := newFarmTestGameDataManager(t)
	plot := &domainfarm.Plot{PlotNPCID: 1707, CropNPCID: 1229}

	got := farmExistingPlotSystemMessage(1, plot, gameData)
	want := "Tại kênh 1 - vị trí Nông Trường Số 1 [63,122], bạn có một vườn Bắp"
	if got != want {
		t.Fatalf("farmExistingPlotSystemMessage() = %q, expected %q", got, want)
	}
}

func TestFarmRipeSystemMessage(t *testing.T) {
	gameData := newFarmTestGameDataManager(t)
	plot := &domainfarm.Plot{PlotNPCID: 1707, CropNPCID: 1229}

	got := farmRipeSystemMessage(1, plot, gameData)
	want := "Tại kênh 1 - vị trí Nông Trường Số 1 [63,122], Bắp mà bạn trồng đã chín, hãy thu hoạch ngay đi."
	if got != want {
		t.Fatalf("farmRipeSystemMessage() = %q, expected %q", got, want)
	}
}

func TestFarmCharacterPlantSkillLevel(t *testing.T) {
	gameData := newFarmTestGameDataManager(t)

	level, ok := farmCharacterPlantSkillLevel(&domainchar.Character{Level: 60, PlantDex: 600}, gameData)
	if !ok {
		t.Fatal("expected plant skill data to be available")
	}
	if level != 2 {
		t.Fatalf("farmCharacterPlantSkillLevel() = %d, expected 2", level)
	}

	level, ok = farmCharacterPlantSkillLevel(&domainchar.Character{Level: 54, PlantDex: 0}, gameData)
	if !ok {
		t.Fatal("expected plant skill data to be available")
	}
	if level != 1 {
		t.Fatalf("farmCharacterPlantSkillLevel() at level 54 = %d, expected 1", level)
	}
}

func TestFarmPlantSkillLevelEnough(t *testing.T) {
	gameData := newFarmTestGameDataManager(t)
	char := &domainchar.Character{Level: 60, PlantDex: 600}

	if !farmPlantSkillLevelEnough(char, 1229, gameData) {
		t.Fatal("expected crop level 2 to be plantable")
	}

	if farmPlantSkillLevelEnough(char, 1230, gameData) {
		t.Fatal("expected crop level 3 to be blocked")
	}
}

func TestFarmVisualMapIDFromPayload(t *testing.T) {
	payload := map[string]interface{}{"map": "57"}

	if got := farmVisualMapIDFromPayload(payload); got != 57 {
		t.Fatalf("farmVisualMapIDFromPayload() = %d, expected 57", got)
	}
}

func TestFarmPlotSceneMapIDUsesPlotNPCMap(t *testing.T) {
	gameData := newFarmTestGameDataManager(t)
	handler := NewHandler(nil, nil, nil, nil, nil, zap.NewNop())
	handler.SetGameDataManager(gameData)

	if got := handler.farmPlotSceneMapID(nil, 1707); got != 57 {
		t.Fatalf("farmPlotSceneMapID() = %d, expected 57", got)
	}
}

func newFarmTestGameDataManager(t *testing.T) *gamedata.Manager {
	t.Helper()

	manager := gamedata.NewManager(nil, zap.NewNop())
	npcs := []json.RawMessage{
		mustRawJSON(t, map[string]interface{}{
			"id":         1707,
			"name":       "Ô đất 1",
			"pos_map_id": 57,
			"pos_x":      63,
			"pos_y":      122,
			"lv":         0,
		}),
		mustRawJSON(t, map[string]interface{}{
			"id":         1229,
			"name":       "Bắp",
			"pos_map_id": 57,
			"pos_x":      0,
			"pos_y":      0,
			"lv":         2,
		}),
		mustRawJSON(t, map[string]interface{}{
			"id":         1230,
			"name":       "Lúa",
			"pos_map_id": 57,
			"pos_x":      0,
			"pos_y":      0,
			"lv":         3,
		}),
	}
	if err := manager.GetCache().LoadTable(models.TableNpc, npcs); err != nil {
		t.Fatalf("LoadTable(TableNpc) error = %v", err)
	}

	skills := []json.RawMessage{
		mustRawJSON(t, map[string]interface{}{
			"id":        4965,
			"name":      "Trồng Trọt",
			"type":      15,
			"level":     1,
			"req_level": 50,
			"dex_skill": -1,
		}),
		mustRawJSON(t, map[string]interface{}{
			"id":        4964,
			"name":      "Trồng Trọt",
			"type":      15,
			"level":     2,
			"req_level": 55,
			"dex_skill": 560,
		}),
		mustRawJSON(t, map[string]interface{}{
			"id":        4963,
			"name":      "Trồng Trọt",
			"type":      15,
			"level":     3,
			"req_level": 60,
			"dex_skill": 800,
		}),
	}
	if err := manager.GetCache().LoadTable(models.TableSkill, skills); err != nil {
		t.Fatalf("LoadTable(TableSkill) error = %v", err)
	}

	return manager
}

func mustRawJSON(t *testing.T, value map[string]interface{}) json.RawMessage {
	t.Helper()

	data, err := json.Marshal(value)
	if err != nil {
		t.Fatalf("json.Marshal() error = %v", err)
	}

	return json.RawMessage(data)
}
