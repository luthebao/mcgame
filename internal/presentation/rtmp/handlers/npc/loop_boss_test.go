// Open-sourced by BaoLT

// Tests for the loop-boss NPC-click matcher extension in quest_battle.go:
// clicking a paired Trị An/Trừ Ma boss NPC (sub_type "all") should start a
// quest battle only while it is the character's active loop round with an
// unfinished kill objective.
package npc

import (
	"context"
	"encoding/json"
	"testing"

	appchar "mcgame-server/internal/application/character"
	appcombat "mcgame-server/internal/application/combat"
	appquest "mcgame-server/internal/application/quest"
	domainchar "mcgame-server/internal/domain/character"
	domaincombat "mcgame-server/internal/domain/combat"
	domainquest "mcgame-server/internal/domain/quest"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	infrartmp "mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
	"go.uber.org/zap/zaptest"
)

func newLoopBossClickTestCharacter() *domainchar.Character {
	return &domainchar.Character{
		ID: 1, Name: "tester", MapID: 3, Level: 20, ClassID: 1, Gender: 1,
		MaxHP: 320, CurrentHP: 320, MaxMP: 180, CurrentMP: 180,
		MaxSP: 120, CurrentSP: 120, Attack: 72, Defense: 40,
		MagicAttack: 50, MagicDefense: 34, Speed: 135, Hit: 120,
		Dodge: 12, Critical: 7, CriticalDmg: 150,
	}
}

func TestClickNpc_StartsQuestBattleForLoopBossNPC(t *testing.T) {
	logger := zaptest.NewLogger(t)
	gameDataManager := gamedata.NewManager(nil, zap.NewNop())
	npcTemplate := &models.NpcTemplate{
		ID:      1143,
		Name:    "Phi Tac",
		Type:    19,
		SubType: "all",
	}
	creatureTemplate := &models.CreatureTemplate{
		ID:              775,
		Name:            "Phi Tac",
		UseLv:           10,
		Life:            5000,
		GrowBase:        1,
		AttStrength:     10,
		AttAgility:      10,
		AttStamina:      10,
		AttIntelligence: 10,
		AttEnergy:       10,
		AptStrength:     4,
		AptAgility:      4,
		AptStamina:      4,
		AptIntelligence: 4,
		AptEnergy:       4,
		PropHit:         100,
		PropSpeed:       100,
		ResCode:         1,
		IconCode:        1,
		ColorCode:       1,
	}
	if err := gameDataManager.GetCache().LoadTable(models.TableNpc, []json.RawMessage{mustNPCJSON(t, npcTemplate)}); err != nil {
		t.Fatalf("failed to load npc template: %v", err)
	}
	if err := gameDataManager.GetCache().LoadTable(models.TableCreature, []json.RawMessage{mustQuestBattleJSON(t, creatureTemplate)}); err != nil {
		t.Fatalf("failed to load creature template: %v", err)
	}

	character := newLoopBossClickTestCharacter()
	charRepo := &questBattleCharacterRepo{char: character}
	charService := appchar.NewService(charRepo, logger)
	questRepo := &questBattleQuestRepo{
		active: []*domainquest.QuestProgress{
			{
				CharacterID: character.ID,
				QuestID:     4671,
				Status:      domainquest.QuestStatusActive,
				Objectives: []domainquest.Objective{
					{Type: domainquest.ObjectiveKillMonster, Target: 775, Required: 1},
				},
			},
		},
	}
	questService := appquest.NewService(questRepo, logger)
	questService.SetGameDataManager(gameDataManager)
	battleRepo := newQuestBattleRepo()
	combatService := appcombat.NewService(battleRepo, nil, nil, charRepo, nil, &questBattlePetRepo{}, logger)
	combatService.SetGameDataManager(gameDataManager)

	handler := NewHandler(nil, charService, questService, infrartmp.NewSceneManager(), nil, zap.NewNop())
	handler.SetGameDataManager(gameDataManager)
	handler.SetCombatService(combatService)

	conn := infrartmp.NewConnection(1, &questBattleStubNetConn{}, nil, zap.NewNop())
	conn.SetSceneInfo(3, character.ID)
	conn.SetChannelID(1)
	conn.SetPlayerInFront(true)
	ctx := &infrartmp.RPCContext{
		Context:     context.Background(),
		CharacterID: "1",
		Connection:  conn,
		ConnID:      1,
	}

	resp, err := handler.ClickNpc(ctx, []interface{}{float64(1143)})
	if err != nil {
		t.Fatalf("ClickNpc() error = %v", err)
	}
	response, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("ClickNpc() response type = %T, want map[string]interface{}", resp)
	}
	if success, ok := response["success"].(bool); !ok || !success {
		t.Fatalf("response success = %#v, want true", response["success"])
	}

	battleID, ok := response["battleId"].(string)
	if !ok || battleID == "" {
		t.Fatalf("response battleId = %#v, want non-empty string", response["battleId"])
	}
	battle, err := battleRepo.GetByID(battleID)
	if err != nil {
		t.Fatalf("battleRepo.GetByID(%q) error = %v", battleID, err)
	}

	foundEnemy := false
	for _, participant := range battle.Participants {
		if participant.Side == domaincombat.SideEnemy && participant.EntityType == domaincombat.ParticipantTypeCreature && participant.EntityID == 775 {
			foundEnemy = true
		}
	}
	if !foundEnemy {
		t.Fatal("expected enemy participant for creature 775 (loop boss)")
	}
}

func TestClickNpc_DoesNotStartLoopBossBattleWithoutActiveRound(t *testing.T) {
	logger := zaptest.NewLogger(t)
	gameDataManager := gamedata.NewManager(nil, zap.NewNop())
	npcTemplate := &models.NpcTemplate{
		ID:      1143,
		Name:    "Phi Tac",
		Type:    19,
		SubType: "all",
	}
	if err := gameDataManager.GetCache().LoadTable(models.TableNpc, []json.RawMessage{mustNPCJSON(t, npcTemplate)}); err != nil {
		t.Fatalf("failed to load npc template: %v", err)
	}

	character := newLoopBossClickTestCharacter()
	charRepo := &questBattleCharacterRepo{char: character}
	charService := appchar.NewService(charRepo, logger)
	questRepo := &questBattleQuestRepo{}
	questService := appquest.NewService(questRepo, logger)
	questService.SetGameDataManager(gameDataManager)
	battleRepo := newQuestBattleRepo()
	combatService := appcombat.NewService(battleRepo, nil, nil, charRepo, nil, &questBattlePetRepo{}, logger)
	combatService.SetGameDataManager(gameDataManager)

	handler := NewHandler(nil, charService, questService, infrartmp.NewSceneManager(), nil, zap.NewNop())
	handler.SetGameDataManager(gameDataManager)
	handler.SetCombatService(combatService)

	conn := infrartmp.NewConnection(1, &questBattleStubNetConn{}, nil, zap.NewNop())
	conn.SetSceneInfo(3, character.ID)
	conn.SetChannelID(1)
	conn.SetPlayerInFront(true)
	ctx := &infrartmp.RPCContext{
		Context:     context.Background(),
		CharacterID: "1",
		Connection:  conn,
		ConnID:      1,
	}

	resp, err := handler.ClickNpc(ctx, []interface{}{float64(1143)})
	if err != nil {
		t.Fatalf("ClickNpc() error = %v", err)
	}
	if resp != nil {
		t.Fatalf("ClickNpc() response = %#v, want nil when no active loop round pairs with this boss", resp)
	}
	if conn.GetBattleID() != "" {
		t.Fatalf("connection battle id = %q, want empty", conn.GetBattleID())
	}
	if len(battleRepo.battles) != 0 {
		t.Fatalf("battle count = %d, want 0", len(battleRepo.battles))
	}
}

func TestClickNpc_DoesNotStartLoopBossBattleWhenObjectiveComplete(t *testing.T) {
	logger := zaptest.NewLogger(t)
	gameDataManager := gamedata.NewManager(nil, zap.NewNop())
	npcTemplate := &models.NpcTemplate{
		ID:      1143,
		Name:    "Phi Tac",
		Type:    19,
		SubType: "all",
	}
	if err := gameDataManager.GetCache().LoadTable(models.TableNpc, []json.RawMessage{mustNPCJSON(t, npcTemplate)}); err != nil {
		t.Fatalf("failed to load npc template: %v", err)
	}

	character := newLoopBossClickTestCharacter()
	charRepo := &questBattleCharacterRepo{char: character}
	charService := appchar.NewService(charRepo, logger)
	questRepo := &questBattleQuestRepo{
		active: []*domainquest.QuestProgress{
			{
				CharacterID: character.ID,
				QuestID:     4671,
				Status:      domainquest.QuestStatusActive,
				Objectives: []domainquest.Objective{
					{Type: domainquest.ObjectiveKillMonster, Target: 775, Required: 1, Current: 1},
				},
			},
		},
	}
	questService := appquest.NewService(questRepo, logger)
	questService.SetGameDataManager(gameDataManager)
	battleRepo := newQuestBattleRepo()
	combatService := appcombat.NewService(battleRepo, nil, nil, charRepo, nil, &questBattlePetRepo{}, logger)
	combatService.SetGameDataManager(gameDataManager)

	handler := NewHandler(nil, charService, questService, infrartmp.NewSceneManager(), nil, zap.NewNop())
	handler.SetGameDataManager(gameDataManager)
	handler.SetCombatService(combatService)

	conn := infrartmp.NewConnection(1, &questBattleStubNetConn{}, nil, zap.NewNop())
	conn.SetSceneInfo(3, character.ID)
	conn.SetChannelID(1)
	conn.SetPlayerInFront(true)
	ctx := &infrartmp.RPCContext{
		Context:     context.Background(),
		CharacterID: "1",
		Connection:  conn,
		ConnID:      1,
	}

	resp, err := handler.ClickNpc(ctx, []interface{}{float64(1143)})
	if err != nil {
		t.Fatalf("ClickNpc() error = %v", err)
	}
	if resp != nil {
		t.Fatalf("ClickNpc() response = %#v, want nil so turn-in interaction can open", resp)
	}
	if len(battleRepo.battles) != 0 {
		t.Fatalf("battle count = %d, want 0", len(battleRepo.battles))
	}
}
