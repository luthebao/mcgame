// Open-sourced by BaoLT

package quest

import (
	"context"
	"encoding/json"
	"testing"

	domainquest "mcgame-server/internal/domain/quest"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

func newLoopBossTestNPCManager(t *testing.T, npcs []models.NpcTemplate) *gamedata.Manager {
	t.Helper()
	manager := gamedata.NewManager(nil, zap.NewNop())
	rows := make([]json.RawMessage, 0, len(npcs))
	for _, n := range npcs {
		rows = append(rows, mustQuestJSON(t, n))
	}
	if len(rows) > 0 {
		if err := manager.GetCache().LoadTable(models.TableNpc, rows); err != nil {
			t.Fatalf("load npc table: %v", err)
		}
	}
	return manager
}

func TestSummonLoopBoss_Gates(t *testing.T) {
	logger := zap.NewNop()
	npcTpl := models.NpcTemplate{ID: 1143, Name: "Phi Tac", Type: 19, PosX: 500, PosY: 600, ResCode: 12345}
	manager := newLoopBossTestNPCManager(t, []models.NpcTemplate{npcTpl})

	newSvc := func() (*Service, *fakeLoopRepo, *questTestQuestRepo) {
		questRepo := newQuestTestQuestRepo()
		loopRepo := newFakeLoopRepo()
		svc := NewService(questRepo, logger)
		svc.SetGameDataManager(manager)
		svc.SetLoopRepository(loopRepo)
		return svc, loopRepo, questRepo
	}

	t.Run("no_active_round_rejects", func(t *testing.T) {
		svc, _, _ := newSvc()
		if _, err := svc.SummonLoopBoss(context.Background(), 1, 2263, 3, 100, 100); err == nil {
			t.Fatalf("expected rejection with no active loop round")
		}
	})

	t.Run("wrong_active_round_rejects", func(t *testing.T) {
		svc, loopRepo, _ := newSvc()
		loopRepo.states[1] = map[int]*domainquest.LoopState{
			4: {CharacterID: 1, LoopID: 4, Active: true, ActiveQuestID: 9999},
		}
		if _, err := svc.SummonLoopBoss(context.Background(), 1, 2263, 3, 100, 100); err == nil {
			t.Fatalf("expected rejection when the active round does not pair with item 2263's quest")
		}
	})

	t.Run("objective_complete_rejects", func(t *testing.T) {
		svc, loopRepo, questRepo := newSvc()
		loopRepo.states[1] = map[int]*domainquest.LoopState{
			4: {CharacterID: 1, LoopID: 4, Active: true, ActiveQuestID: 4671},
		}
		progress := domainquest.NewQuestProgress(1, 4671, []domainquest.Objective{
			{Type: domainquest.ObjectiveKillMonster, Target: 775, Required: 1, Current: 1},
		})
		if err := questRepo.Save(context.Background(), progress); err != nil {
			t.Fatalf("save progress: %v", err)
		}
		if _, err := svc.SummonLoopBoss(context.Background(), 1, 2263, 3, 100, 100); err == nil {
			t.Fatalf("expected rejection once the round's kill objective is already complete")
		}
	})

	t.Run("happy_path_registers_summon_at_offset_position", func(t *testing.T) {
		svc, loopRepo, questRepo := newSvc()
		loopRepo.states[1] = map[int]*domainquest.LoopState{
			4: {CharacterID: 1, LoopID: 4, Active: true, ActiveQuestID: 4671},
		}
		progress := domainquest.NewQuestProgress(1, 4671, []domainquest.Objective{
			{Type: domainquest.ObjectiveKillMonster, Target: 775, Required: 1, Current: 0},
		})
		if err := questRepo.Save(context.Background(), progress); err != nil {
			t.Fatalf("save progress: %v", err)
		}

		summon, err := svc.SummonLoopBoss(context.Background(), 1, 2263, 3, 100, 100)
		if err != nil {
			t.Fatalf("SummonLoopBoss: %v", err)
		}
		if summon.NpcID != 1143 || summon.QuestID != 4671 || summon.MapID != 3 || summon.X != 180 || summon.Y != 100 {
			t.Fatalf("unexpected summon %+v", summon)
		}
	})
}

func TestActiveLoopBossForScene(t *testing.T) {
	logger := zap.NewNop()
	npcTplSummon := models.NpcTemplate{ID: 1143, Name: "Phi Tac", Type: 19, PosX: 500, PosY: 600, ResCode: 111}
	npcTplMapMode := models.NpcTemplate{ID: 2169, Name: "Vien Co Cu Thu", Type: 10, PosX: 1422, PosY: 578, ResCode: 222}
	manager := newLoopBossTestNPCManager(t, []models.NpcTemplate{npcTplSummon, npcTplMapMode})

	t.Run("summon_mode_returns_entry_only_on_registered_map", func(t *testing.T) {
		questRepo := newQuestTestQuestRepo()
		loopRepo := newFakeLoopRepo()
		svc := NewService(questRepo, logger)
		svc.SetGameDataManager(manager)
		svc.SetLoopRepository(loopRepo)

		loopRepo.states[1] = map[int]*domainquest.LoopState{
			4: {CharacterID: 1, LoopID: 4, Active: true, ActiveQuestID: 4671},
		}
		progress := domainquest.NewQuestProgress(1, 4671, []domainquest.Objective{
			{Type: domainquest.ObjectiveKillMonster, Target: 775, Required: 1, Current: 0},
		})
		if err := questRepo.Save(context.Background(), progress); err != nil {
			t.Fatalf("save progress: %v", err)
		}
		if _, err := svc.SummonLoopBoss(context.Background(), 1, 2263, 3, 100, 100); err != nil {
			t.Fatalf("SummonLoopBoss: %v", err)
		}

		entries := svc.ActiveLoopBossForScene(context.Background(), 1, 3)
		if len(entries) != 1 || entries[0].NpcID != 1143 || entries[0].PosX != 180 || entries[0].PosY != 100 {
			t.Fatalf("unexpected scene entries on registered map: %#v", entries)
		}

		if entries := svc.ActiveLoopBossForScene(context.Background(), 1, 99); len(entries) != 0 {
			t.Fatalf("expected no entries on an unregistered map, got %#v", entries)
		}
	})

	t.Run("map_mode_returns_entry_only_on_allowed_maps", func(t *testing.T) {
		questRepo := newQuestTestQuestRepo()
		loopRepo := newFakeLoopRepo()
		svc := NewService(questRepo, logger)
		svc.SetGameDataManager(manager)
		svc.SetLoopRepository(loopRepo)

		loopRepo.states[1] = map[int]*domainquest.LoopState{
			16: {CharacterID: 1, LoopID: 16, Active: true, ActiveQuestID: 7669},
		}
		progress := domainquest.NewQuestProgress(1, 7669, []domainquest.Objective{
			{Type: domainquest.ObjectiveKillMonster, Target: 1876, Required: 1, Current: 0},
		})
		if err := questRepo.Save(context.Background(), progress); err != nil {
			t.Fatalf("save progress: %v", err)
		}

		entries := svc.ActiveLoopBossForScene(context.Background(), 1, 27)
		if len(entries) != 1 || entries[0].NpcID != 2169 || entries[0].PosX != 1422 || entries[0].PosY != 578 {
			t.Fatalf("unexpected scene entries on allowed map: %#v", entries)
		}
		if entries := svc.ActiveLoopBossForScene(context.Background(), 1, 10); len(entries) != 0 {
			t.Fatalf("expected no entries on a map outside spec.Maps, got %#v", entries)
		}
	})

	t.Run("objective_complete_excludes_boss", func(t *testing.T) {
		questRepo := newQuestTestQuestRepo()
		loopRepo := newFakeLoopRepo()
		svc := NewService(questRepo, logger)
		svc.SetGameDataManager(manager)
		svc.SetLoopRepository(loopRepo)

		loopRepo.states[1] = map[int]*domainquest.LoopState{
			16: {CharacterID: 1, LoopID: 16, Active: true, ActiveQuestID: 7669},
		}
		progress := domainquest.NewQuestProgress(1, 7669, []domainquest.Objective{
			{Type: domainquest.ObjectiveKillMonster, Target: 1876, Required: 1, Current: 1},
		})
		if err := questRepo.Save(context.Background(), progress); err != nil {
			t.Fatalf("save progress: %v", err)
		}

		if entries := svc.ActiveLoopBossForScene(context.Background(), 1, 27); len(entries) != 0 {
			t.Fatalf("expected the boss to be excluded once its kill objective is complete, got %#v", entries)
		}
	})
}
