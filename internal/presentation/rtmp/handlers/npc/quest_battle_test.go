// Open-sourced by BaoLT

package npc

import (
	"context"
	"encoding/json"
	"errors"
	"net"
	"testing"
	"time"

	appchar "mcgame-server/internal/application/character"
	appcombat "mcgame-server/internal/application/combat"
	appquest "mcgame-server/internal/application/quest"
	domainchar "mcgame-server/internal/domain/character"
	domaincombat "mcgame-server/internal/domain/combat"
	domainpet "mcgame-server/internal/domain/pet"
	domainquest "mcgame-server/internal/domain/quest"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	infrartmp "mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/google/uuid"
	"go.uber.org/zap"
	"go.uber.org/zap/zaptest"
)

type questBattleStubNetConn struct{}

func (s *questBattleStubNetConn) Read(b []byte) (n int, err error)  { return 0, nil }
func (s *questBattleStubNetConn) Write(b []byte) (n int, err error) { return len(b), nil }
func (s *questBattleStubNetConn) Close() error                      { return nil }
func (s *questBattleStubNetConn) LocalAddr() net.Addr               { return nil }
func (s *questBattleStubNetConn) RemoteAddr() net.Addr {
	return &net.TCPAddr{IP: net.ParseIP("127.0.0.1"), Port: 1935}
}
func (s *questBattleStubNetConn) SetDeadline(t time.Time) error      { return nil }
func (s *questBattleStubNetConn) SetReadDeadline(t time.Time) error  { return nil }
func (s *questBattleStubNetConn) SetWriteDeadline(t time.Time) error { return nil }

type questBattleRepo struct {
	battles map[string]*domaincombat.Battle
}

func newQuestBattleRepo() *questBattleRepo {
	return &questBattleRepo{battles: make(map[string]*domaincombat.Battle)}
}

func (r *questBattleRepo) GetByID(battleID string) (*domaincombat.Battle, error) {
	battle, ok := r.battles[battleID]
	if !ok {
		return nil, pkgerrors.ErrNotFound
	}
	return battle, nil
}

func (r *questBattleRepo) GetByParticipant(participantID string) (*domaincombat.Battle, error) {
	for _, battle := range r.battles {
		for _, participant := range battle.Participants {
			if participant.ID == participantID {
				return battle, nil
			}
		}
	}
	return nil, pkgerrors.ErrNotFound
}

func (r *questBattleRepo) Store(battle *domaincombat.Battle) error {
	r.battles[battle.ID] = battle
	return nil
}

func (r *questBattleRepo) Remove(battleID string) error {
	delete(r.battles, battleID)
	return nil
}

func (r *questBattleRepo) GetAllActive() []*domaincombat.Battle {
	result := make([]*domaincombat.Battle, 0, len(r.battles))
	for _, battle := range r.battles {
		if battle.IsActive() {
			result = append(result, battle)
		}
	}
	return result
}

type questBattleCharacterRepo struct {
	char *domainchar.Character
}

func (r *questBattleCharacterRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	if r.char == nil || r.char.ID != id {
		return nil, errors.New("character not found")
	}
	copyChar := *r.char
	return &copyChar, nil
}

func (r *questBattleCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *questBattleCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *questBattleCharacterRepo) FindByName(ctx context.Context, name string) (*domainchar.Character, error) {
	return nil, errors.New("character not found")
}

func (r *questBattleCharacterRepo) Create(ctx context.Context, character *domainchar.Character) error {
	r.char = character
	return nil
}

func (r *questBattleCharacterRepo) Update(ctx context.Context, character *domainchar.Character) error {
	r.char = character
	return nil
}

func (r *questBattleCharacterRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (r *questBattleCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}

func (r *questBattleCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos domainchar.Position) error {
	return nil
}

func (r *questBattleCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

type questBattlePetRepo struct{}

func (r *questBattlePetRepo) Save(ctx context.Context, pet *domainpet.Pet) error {
	return nil
}

func (r *questBattlePetRepo) FindByID(ctx context.Context, id int64) (*domainpet.Pet, error) {
	return nil, pkgerrors.ErrNotFound
}

func (r *questBattlePetRepo) FindByCharacterID(ctx context.Context, characterID int64) ([]*domainpet.Pet, error) {
	return nil, nil
}

func (r *questBattlePetRepo) FindFollowingPet(ctx context.Context, characterID int64) (*domainpet.Pet, error) {
	return nil, pkgerrors.ErrNotFound
}

func (r *questBattlePetRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (r *questBattlePetRepo) Count(ctx context.Context, characterID int64) (int, error) {
	return 0, nil
}

func (r *questBattlePetRepo) UpdateFollowState(ctx context.Context, petID int64, isFollowing bool) error {
	return nil
}

func (r *questBattlePetRepo) ClearFollowing(ctx context.Context, characterID int64) error {
	return nil
}

type questBattleQuestRepo struct {
	active []*domainquest.QuestProgress
}

func (r *questBattleQuestRepo) Save(ctx context.Context, progress *domainquest.QuestProgress) error {
	return nil
}

func (r *questBattleQuestRepo) FindByID(ctx context.Context, id int64) (*domainquest.QuestProgress, error) {
	return nil, pkgerrors.ErrNotFound
}

func (r *questBattleQuestRepo) FindByCharacterAndQuest(ctx context.Context, characterID int64, questID int) (*domainquest.QuestProgress, error) {
	for _, progress := range r.active {
		if progress.CharacterID == characterID && progress.QuestID == questID {
			return progress, nil
		}
	}
	return nil, pkgerrors.ErrNotFound
}

func (r *questBattleQuestRepo) FindActiveByCharacter(ctx context.Context, characterID int64) ([]*domainquest.QuestProgress, error) {
	result := make([]*domainquest.QuestProgress, 0, len(r.active))
	for _, progress := range r.active {
		if progress.CharacterID != characterID {
			continue
		}
		copyProgress := *progress
		copyProgress.Objectives = append([]domainquest.Objective(nil), progress.Objectives...)
		result = append(result, &copyProgress)
	}
	return result, nil
}

func (r *questBattleQuestRepo) FindCompletedByCharacter(ctx context.Context, characterID int64) ([]*domainquest.QuestProgress, error) {
	return nil, nil
}

func (r *questBattleQuestRepo) FindAllByCharacter(ctx context.Context, characterID int64) ([]*domainquest.QuestProgress, error) {
	return nil, nil
}

func (r *questBattleQuestRepo) Update(ctx context.Context, progress *domainquest.QuestProgress) error {
	return nil
}

func (r *questBattleQuestRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (r *questBattleQuestRepo) RecordHistory(ctx context.Context, history *domainquest.QuestHistory) error {
	return nil
}

func (r *questBattleQuestRepo) GetCompletedQuestIDs(ctx context.Context, characterID int64) ([]int, error) {
	return nil, nil
}

func TestClickNpc_StartsQuestBattleForActiveKillQuest(t *testing.T) {
	logger := zaptest.NewLogger(t)
	gameDataManager := gamedata.NewManager(nil, zap.NewNop())
	npcTemplate := &models.NpcTemplate{
		ID:      475,
		Name:    "Ke Vuong",
		Type:    20,
		SubType: "50|5418|5419",
	}
	creatureTemplate := &models.CreatureTemplate{
		ID:              157,
		Name:            "Ke Vuong",
		UseLv:           18,
		Life:            10000,
		GrowBase:        1,
		AttStrength:     12,
		AttAgility:      11,
		AttStamina:      13,
		AttIntelligence: 10,
		AttEnergy:       9,
		AptStrength:     4,
		AptAgility:      4,
		AptStamina:      4,
		AptIntelligence: 4,
		AptEnergy:       4,
		PropHit:         100,
		PropSpeed:       100,
		ResCode:         3050070000157,
		IconCode:        3050070001157,
		ColorCode:       3,
	}
	if err := gameDataManager.GetCache().LoadTable(models.TableNpc, []json.RawMessage{mustNPCJSON(t, npcTemplate)}); err != nil {
		t.Fatalf("failed to load npc template: %v", err)
	}
	if err := gameDataManager.GetCache().LoadTable(models.TableCreature, []json.RawMessage{mustQuestBattleJSON(t, creatureTemplate)}); err != nil {
		t.Fatalf("failed to load creature template: %v", err)
	}

	character := &domainchar.Character{
		ID:                1,
		Name:              "tester",
		MapID:             3,
		Level:             35,
		ClassID:           1,
		Gender:            1,
		MaxHP:             320,
		CurrentHP:         320,
		MaxMP:             180,
		CurrentMP:         180,
		MaxSP:             120,
		CurrentSP:         120,
		Attack:            72,
		Defense:           40,
		MagicAttack:       50,
		MagicDefense:      34,
		Speed:             135,
		Hit:               120,
		Dodge:             12,
		Critical:          7,
		CriticalDmg:       150,
		FinalCounter:      0,
		FinalCombo:        0,
		FinalPraDef:       0,
		FinalPraMagDef:    0,
		FinalReduceHurt1:  0,
		FinalReduceHurt2:  0,
		FinalResiCritical: 0,
		FinalResiDefy:     0,
		FinalEnhPhyHurt:   0,
		FinalEnhMagicHurt: 0,
	}
	charRepo := &questBattleCharacterRepo{char: character}
	charService := appchar.NewService(charRepo, logger)
	questRepo := &questBattleQuestRepo{
		active: []*domainquest.QuestProgress{
			{
				CharacterID: character.ID,
				QuestID:     50,
				Status:      domainquest.QuestStatusActive,
				Objectives: []domainquest.Objective{
					{Type: domainquest.ObjectiveKillMonster, Target: 157, Required: 1},
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

	resp, err := handler.ClickNpc(ctx, []interface{}{float64(475)})
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
	if conn.GetBattleID() != battleID {
		t.Fatalf("connection battle id = %q, want %q", conn.GetBattleID(), battleID)
	}

	battle, err := battleRepo.GetByID(battleID)
	if err != nil {
		t.Fatalf("battleRepo.GetByID(%q) error = %v", battleID, err)
	}
	if len(battle.Watchers) != 1 {
		t.Fatalf("battle watcher count = %d, want 1", len(battle.Watchers))
	}

	foundEnemy := false
	for _, participant := range battle.Participants {
		if participant.Side != domaincombat.SideEnemy || participant.EntityType != domaincombat.ParticipantTypeCreature {
			continue
		}
		if participant.EntityID != 157 {
			t.Fatalf("enemy entity id = %d, want 157", participant.EntityID)
		}
		foundEnemy = true
	}
	if !foundEnemy {
		t.Fatal("expected enemy participant for creature 157")
	}
}

func TestClickNpc_StartsBattleForBattleTypeQuestNpc(t *testing.T) {
	logger := zaptest.NewLogger(t)
	gameDataManager := gamedata.NewManager(nil, zap.NewNop())
	npcTemplate := &models.NpcTemplate{
		ID:      143,
		Name:    "Chieu Tai Mao",
		Type:    10,
		SubType: "3165|3166|3167",
	}
	creatureTemplate := &models.CreatureTemplate{
		ID:              126,
		Name:            "Chieu Tai Mao",
		UseLv:           5,
		Life:            10000,
		GrowBase:        1,
		AttStrength:     12,
		AttAgility:      10,
		AttStamina:      11,
		AttIntelligence: 8,
		AttEnergy:       7,
		AptStrength:     4,
		AptAgility:      4,
		AptStamina:      4,
		AptIntelligence: 4,
		AptEnergy:       4,
		PropHit:         100,
		PropSpeed:       100,
		ResCode:         2060090400011,
		IconCode:        3060090400011,
		ColorCode:       1,
	}
	requireTemplate := &models.QuestRequireTemplate{
		ID:     1,
		Qid:    3165,
		Kind:   2,
		ItemID: 126,
		Num:    1,
	}
	if err := gameDataManager.GetCache().LoadTable(models.TableNpc, []json.RawMessage{mustNPCJSON(t, npcTemplate)}); err != nil {
		t.Fatalf("failed to load npc template: %v", err)
	}
	if err := gameDataManager.GetCache().LoadTable(models.TableCreature, []json.RawMessage{mustQuestBattleJSON(t, creatureTemplate)}); err != nil {
		t.Fatalf("failed to load creature template: %v", err)
	}
	if err := gameDataManager.GetCache().LoadTable(models.TableQuestRequire, []json.RawMessage{mustQuestBattleJSON(t, requireTemplate)}); err != nil {
		t.Fatalf("failed to load quest require template: %v", err)
	}

	character := &domainchar.Character{
		ID:                1,
		Name:              "tester",
		MapID:             3,
		Level:             8,
		ClassID:           1,
		Gender:            1,
		MaxHP:             320,
		CurrentHP:         320,
		MaxMP:             180,
		CurrentMP:         180,
		MaxSP:             120,
		CurrentSP:         120,
		Attack:            72,
		Defense:           40,
		MagicAttack:       50,
		MagicDefense:      34,
		Speed:             135,
		Hit:               120,
		Dodge:             12,
		Critical:          7,
		CriticalDmg:       150,
		FinalCounter:      0,
		FinalCombo:        0,
		FinalPraDef:       0,
		FinalPraMagDef:    0,
		FinalReduceHurt1:  0,
		FinalReduceHurt2:  0,
		FinalResiCritical: 0,
		FinalResiDefy:     0,
		FinalEnhPhyHurt:   0,
		FinalEnhMagicHurt: 0,
	}
	charRepo := &questBattleCharacterRepo{char: character}
	charService := appchar.NewService(charRepo, logger)
	questRepo := &questBattleQuestRepo{
		active: []*domainquest.QuestProgress{
			{
				CharacterID: character.ID,
				QuestID:     3165,
				Status:      domainquest.QuestStatusActive,
				Objectives: []domainquest.Objective{
					{Type: domainquest.ObjectiveKillMonster, Target: 126, Required: 1},
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

	resp, err := handler.ClickNpc(ctx, []interface{}{float64(143)})
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
		if participant.Side != domaincombat.SideEnemy || participant.EntityType != domaincombat.ParticipantTypeCreature {
			continue
		}
		if participant.EntityID != 126 {
			t.Fatalf("enemy entity id = %d, want 126", participant.EntityID)
		}
		foundEnemy = true
	}
	if !foundEnemy {
		t.Fatal("expected enemy participant for creature 126")
	}
}

func TestClickNpc_DoesNotStartQuestBattleWhenObjectiveAlreadyComplete(t *testing.T) {
	logger := zaptest.NewLogger(t)
	gameDataManager := gamedata.NewManager(nil, zap.NewNop())
	npcTemplate := &models.NpcTemplate{
		ID:      143,
		Name:    "Chieu Tai Mao",
		Type:    10,
		SubType: "3165|3166|3167",
	}
	creatureTemplate := &models.CreatureTemplate{
		ID:              126,
		Name:            "Chieu Tai Mao",
		UseLv:           5,
		Life:            10000,
		GrowBase:        1,
		AttStrength:     12,
		AttAgility:      10,
		AttStamina:      11,
		AttIntelligence: 8,
		AttEnergy:       7,
		AptStrength:     4,
		AptAgility:      4,
		AptStamina:      4,
		AptIntelligence: 4,
		AptEnergy:       4,
		PropHit:         100,
		PropSpeed:       100,
		ResCode:         2060090400011,
		IconCode:        3060090400011,
		ColorCode:       1,
	}
	requireTemplate := &models.QuestRequireTemplate{
		ID:     1,
		Qid:    3165,
		Kind:   2,
		ItemID: 126,
		Num:    1,
	}
	if err := gameDataManager.GetCache().LoadTable(models.TableNpc, []json.RawMessage{mustNPCJSON(t, npcTemplate)}); err != nil {
		t.Fatalf("failed to load npc template: %v", err)
	}
	if err := gameDataManager.GetCache().LoadTable(models.TableCreature, []json.RawMessage{mustQuestBattleJSON(t, creatureTemplate)}); err != nil {
		t.Fatalf("failed to load creature template: %v", err)
	}
	if err := gameDataManager.GetCache().LoadTable(models.TableQuestRequire, []json.RawMessage{mustQuestBattleJSON(t, requireTemplate)}); err != nil {
		t.Fatalf("failed to load quest require template: %v", err)
	}

	character := &domainchar.Character{
		ID:                1,
		Name:              "tester",
		MapID:             3,
		Level:             8,
		ClassID:           1,
		Gender:            1,
		MaxHP:             320,
		CurrentHP:         320,
		MaxMP:             180,
		CurrentMP:         180,
		MaxSP:             120,
		CurrentSP:         120,
		Attack:            72,
		Defense:           40,
		MagicAttack:       50,
		MagicDefense:      34,
		Speed:             135,
		Hit:               120,
		Dodge:             12,
		Critical:          7,
		CriticalDmg:       150,
		FinalCounter:      0,
		FinalCombo:        0,
		FinalPraDef:       0,
		FinalPraMagDef:    0,
		FinalReduceHurt1:  0,
		FinalReduceHurt2:  0,
		FinalResiCritical: 0,
		FinalResiDefy:     0,
		FinalEnhPhyHurt:   0,
		FinalEnhMagicHurt: 0,
	}
	charRepo := &questBattleCharacterRepo{char: character}
	charService := appchar.NewService(charRepo, logger)
	questRepo := &questBattleQuestRepo{
		active: []*domainquest.QuestProgress{
			{
				CharacterID: character.ID,
				QuestID:     3165,
				Status:      domainquest.QuestStatusActive,
				Objectives: []domainquest.Objective{
					{Type: domainquest.ObjectiveKillMonster, Target: 126, Required: 1, Current: 1},
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

	resp, err := handler.ClickNpc(ctx, []interface{}{float64(143)})
	if err != nil {
		t.Fatalf("ClickNpc() error = %v", err)
	}
	if resp != nil {
		t.Fatalf("ClickNpc() response = %#v, want nil so turn-in interaction can open", resp)
	}
	if conn.GetBattleID() != "" {
		t.Fatalf("connection battle id = %q, want empty", conn.GetBattleID())
	}
	if len(battleRepo.battles) != 0 {
		t.Fatalf("battle count = %d, want 0", len(battleRepo.battles))
	}
}

func TestResolveQuestBattleCreatureID_RequiresMatchingActiveQuest(t *testing.T) {
	logger := zaptest.NewLogger(t)
	gameDataManager := gamedata.NewManager(nil, zap.NewNop())
	npcTemplate := &models.NpcTemplate{
		ID:      475,
		Name:    "Ke Vuong",
		Type:    20,
		SubType: "50|5418|5419",
	}
	if err := gameDataManager.GetCache().LoadTable(models.TableNpc, []json.RawMessage{mustNPCJSON(t, npcTemplate)}); err != nil {
		t.Fatalf("failed to load npc template: %v", err)
	}

	questRepo := &questBattleQuestRepo{
		active: []*domainquest.QuestProgress{
			{
				CharacterID: 1,
				QuestID:     49,
				Status:      domainquest.QuestStatusActive,
				Objectives: []domainquest.Objective{
					{Type: domainquest.ObjectiveKillMonster, Target: 156, Required: 1},
				},
			},
		},
	}
	questService := appquest.NewService(questRepo, logger)
	handler := NewHandler(nil, nil, questService, nil, nil, zap.NewNop())
	handler.SetGameDataManager(gameDataManager)

	matchedQuestID, creatureIDs, ok := handler.resolveQuestBattleCreatureIDs(context.Background(), 1, 0, []int{50, 5418, 5419})
	if ok {
		t.Fatalf("resolveQuestBattleCreatureIDs() = (%d, %v, true), want unresolved", matchedQuestID, creatureIDs)
	}
}

func TestClickNpc_StartsMultiBossQuestBattleForStoryBattleNPC(t *testing.T) {
	logger := zaptest.NewLogger(t)
	gameDataManager := gamedata.NewManager(nil, zap.NewNop())

	npcTemplate := &models.NpcTemplate{
		ID:      600,
		Name:    "Khao Quan Trung Cap",
		Type:    19,
		SubType: "",
	}
	if err := gameDataManager.GetCache().LoadTable(models.TableNpc, []json.RawMessage{mustNPCJSON(t, npcTemplate)}); err != nil {
		t.Fatalf("failed to load npc template: %v", err)
	}

	questTemplate := &models.QuestTemplate{
		ID:        645,
		Name:      "Thang Cap Trung Cap 3-2",
		StartNPC:  600,
		FinishNPC: 600,
	}
	if err := gameDataManager.GetCache().LoadTable(models.TableQuest, []json.RawMessage{mustQuestBattleJSON(t, questTemplate)}); err != nil {
		t.Fatalf("failed to load quest template: %v", err)
	}

	bossCids := []int{92, 94, 96, 99, 216, 330}
	creaturePayloads := make([]json.RawMessage, 0, len(bossCids))
	for _, cid := range bossCids {
		creaturePayloads = append(creaturePayloads, mustQuestBattleJSON(t, &models.CreatureTemplate{
			ID:              int64(cid),
			Name:            "Khao Quan",
			UseLv:           40,
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
		}))
	}
	if err := gameDataManager.GetCache().LoadTable(models.TableCreature, creaturePayloads); err != nil {
		t.Fatalf("failed to load creature templates: %v", err)
	}

	character := &domainchar.Character{
		ID: 1, Name: "tester", MapID: 31, Level: 40, ClassID: 1, Gender: 1,
		MaxHP: 320, CurrentHP: 320, MaxMP: 180, CurrentMP: 180,
		MaxSP: 120, CurrentSP: 120, Attack: 72, Defense: 40,
		MagicAttack: 50, MagicDefense: 34, Speed: 135, Hit: 120,
		Dodge: 12, Critical: 7, CriticalDmg: 150,
	}
	charRepo := &questBattleCharacterRepo{char: character}
	charService := appchar.NewService(charRepo, logger)

	objectives := make([]domainquest.Objective, 0, len(bossCids))
	for _, cid := range bossCids {
		objectives = append(objectives, domainquest.Objective{
			Type: domainquest.ObjectiveKillMonster, Target: cid, Required: 1,
		})
	}
	questRepo := &questBattleQuestRepo{
		active: []*domainquest.QuestProgress{
			{
				CharacterID: character.ID,
				QuestID:     645,
				Status:      domainquest.QuestStatusActive,
				Objectives:  objectives,
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
	conn.SetSceneInfo(31, character.ID)
	conn.SetChannelID(1)
	conn.SetPlayerInFront(true)
	ctx := &infrartmp.RPCContext{
		Context:     context.Background(),
		CharacterID: "1",
		Connection:  conn,
		ConnID:      1,
	}

	resp, err := handler.ClickNpc(ctx, []interface{}{float64(600)})
	if err != nil {
		t.Fatalf("ClickNpc() error = %v", err)
	}
	response, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("ClickNpc() response type = %T, want map[string]interface{}", resp)
	}
	battleID, ok := response["battleId"].(string)
	if !ok || battleID == "" {
		t.Fatalf("response battleId = %#v, want non-empty string", response["battleId"])
	}

	battle, err := battleRepo.GetByID(battleID)
	if err != nil {
		t.Fatalf("battleRepo.GetByID(%q) error = %v", battleID, err)
	}

	enemyIDs := make([]int64, 0, len(bossCids))
	enemyPositions := make([]int, 0, len(bossCids))
	for _, p := range battle.Participants {
		if p.Side != domaincombat.SideEnemy || p.EntityType != domaincombat.ParticipantTypeCreature {
			continue
		}
		enemyIDs = append(enemyIDs, p.EntityID)
		enemyPositions = append(enemyPositions, p.Position)
	}

	if len(enemyIDs) != len(bossCids) {
		t.Fatalf("enemy count = %d, want %d (ids=%v positions=%v)", len(enemyIDs), len(bossCids), enemyIDs, enemyPositions)
	}
	for _, cid := range bossCids {
		found := false
		for _, eid := range enemyIDs {
			if eid == int64(cid) {
				found = true
				break
			}
		}
		if !found {
			t.Fatalf("missing enemy with creature id %d (got %v)", cid, enemyIDs)
		}
	}

	expectedSlots := []int{0, 2, 1, 4, 3, 5}
	if len(enemyPositions) != len(expectedSlots) {
		t.Fatalf("position count = %d, want %d (got %v)", len(enemyPositions), len(expectedSlots), enemyPositions)
	}
	for _, slot := range expectedSlots {
		found := false
		for _, p := range enemyPositions {
			if p == slot {
				found = true
				break
			}
		}
		if !found {
			t.Fatalf("missing slot %d in positions %v", slot, enemyPositions)
		}
	}
}

func mustQuestBattleJSON(t *testing.T, value interface{}) json.RawMessage {
	t.Helper()
	data, err := json.Marshal(value)
	if err != nil {
		t.Fatalf("failed to marshal fixture: %v", err)
	}
	return data
}
