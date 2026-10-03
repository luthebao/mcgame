// Open-sourced by BaoLT

package combat

import (
	"context"
	"encoding/json"
	"math"
	"testing"

	appcombat "mcgame-server/internal/application/combat"
	appquest "mcgame-server/internal/application/quest"
	domaincharacter "mcgame-server/internal/domain/character"
	combatdomain "mcgame-server/internal/domain/combat"
	domainpet "mcgame-server/internal/domain/pet"
	domainquest "mcgame-server/internal/domain/quest"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"

	amf0 "github.com/yutopp/go-amf0"
	"go.uber.org/zap"
)

type callbackCall struct {
	method string
	args   []interface{}
}

type callbackRecorder struct {
	calls    []callbackCall
	err      error
	expSkill int64
}

type stubOwnership struct {
	allow map[int]bool
	err   error
}

type handlerTestPetRepo struct {
	pets map[int64]*domainpet.Pet
}

type combatHandlerQuestRepo struct {
	progress map[int64]*domainquest.QuestProgress
}

func (r *handlerTestPetRepo) Save(ctx context.Context, pet *domainpet.Pet) error {
	if r.pets == nil {
		r.pets = make(map[int64]*domainpet.Pet)
	}
	copyPet := *pet
	r.pets[pet.ID] = &copyPet
	return nil
}

func (r *handlerTestPetRepo) FindByID(ctx context.Context, id int64) (*domainpet.Pet, error) {
	pet, ok := r.pets[id]
	if !ok {
		return nil, pkgerrors.ErrNotFound
	}
	copyPet := *pet
	return &copyPet, nil
}

func (r *handlerTestPetRepo) FindByCharacterID(ctx context.Context, characterID int64) ([]*domainpet.Pet, error) {
	result := make([]*domainpet.Pet, 0)
	for _, pet := range r.pets {
		if pet.CharacterID != characterID {
			continue
		}
		copyPet := *pet
		result = append(result, &copyPet)
	}
	return result, nil
}

func (r *handlerTestPetRepo) FindFollowingPet(ctx context.Context, characterID int64) (*domainpet.Pet, error) {
	for _, pet := range r.pets {
		if pet.CharacterID == characterID && pet.IsFollowing {
			copyPet := *pet
			return &copyPet, nil
		}
	}
	return nil, pkgerrors.ErrNotFound
}

func (r *handlerTestPetRepo) Delete(ctx context.Context, id int64) error {
	delete(r.pets, id)
	return nil
}

func (r *handlerTestPetRepo) Count(ctx context.Context, characterID int64) (int, error) {
	count := 0
	for _, pet := range r.pets {
		if pet.CharacterID == characterID {
			count++
		}
	}
	return count, nil
}

func (r *handlerTestPetRepo) UpdateFollowState(ctx context.Context, petID int64, isFollowing bool) error {
	if pet, ok := r.pets[petID]; ok {
		pet.IsFollowing = isFollowing
	}
	return nil
}

func (r *handlerTestPetRepo) ClearFollowing(ctx context.Context, characterID int64) error {
	for _, pet := range r.pets {
		if pet.CharacterID == characterID {
			pet.IsFollowing = false
		}
	}
	return nil
}

func (s *stubOwnership) HasSkill(ctx context.Context, charID int64, skillID int) (bool, error) {
	if s.err != nil {
		return false, s.err
	}
	return s.allow[skillID], nil
}

func (r *callbackRecorder) SendCallback(method string, args ...interface{}) error {
	copiedArgs := make([]interface{}, len(args))
	copy(copiedArgs, args)
	r.calls = append(r.calls, callbackCall{
		method: method,
		args:   copiedArgs,
	})
	return r.err
}

func (r *callbackRecorder) AddExpSkill(amount int64) int64 {
	r.expSkill += amount
	return r.expSkill
}

func (r *combatHandlerQuestRepo) Save(ctx context.Context, progress *domainquest.QuestProgress) error {
	if r.progress == nil {
		r.progress = make(map[int64]*domainquest.QuestProgress)
	}
	copyProgress := *progress
	copyObjectives := append([]domainquest.Objective(nil), progress.Objectives...)
	copyProgress.Objectives = copyObjectives
	r.progress[progress.ID] = &copyProgress
	return nil
}

func (r *combatHandlerQuestRepo) FindByID(ctx context.Context, id int64) (*domainquest.QuestProgress, error) {
	progress, ok := r.progress[id]
	if !ok {
		return nil, pkgerrors.ErrNotFound
	}
	copyProgress := *progress
	copyObjectives := append([]domainquest.Objective(nil), progress.Objectives...)
	copyProgress.Objectives = copyObjectives
	return &copyProgress, nil
}

func (r *combatHandlerQuestRepo) FindByCharacterAndQuest(ctx context.Context, characterID int64, questID int) (*domainquest.QuestProgress, error) {
	for _, progress := range r.progress {
		if progress.CharacterID == characterID && progress.QuestID == questID {
			copyProgress := *progress
			copyObjectives := append([]domainquest.Objective(nil), progress.Objectives...)
			copyProgress.Objectives = copyObjectives
			return &copyProgress, nil
		}
	}
	return nil, pkgerrors.ErrNotFound
}

func (r *combatHandlerQuestRepo) FindActiveByCharacter(ctx context.Context, characterID int64) ([]*domainquest.QuestProgress, error) {
	result := make([]*domainquest.QuestProgress, 0)
	for _, progress := range r.progress {
		if progress.CharacterID != characterID || progress.Status != domainquest.QuestStatusActive {
			continue
		}
		copyProgress := *progress
		copyObjectives := append([]domainquest.Objective(nil), progress.Objectives...)
		copyProgress.Objectives = copyObjectives
		result = append(result, &copyProgress)
	}
	return result, nil
}

func (r *combatHandlerQuestRepo) FindCompletedByCharacter(ctx context.Context, characterID int64) ([]*domainquest.QuestProgress, error) {
	return nil, nil
}

func (r *combatHandlerQuestRepo) FindAllByCharacter(ctx context.Context, characterID int64) ([]*domainquest.QuestProgress, error) {
	return nil, nil
}

func (r *combatHandlerQuestRepo) Update(ctx context.Context, progress *domainquest.QuestProgress) error {
	return r.Save(ctx, progress)
}

func (r *combatHandlerQuestRepo) Delete(ctx context.Context, id int64) error {
	delete(r.progress, id)
	return nil
}

func (r *combatHandlerQuestRepo) RecordHistory(ctx context.Context, history *domainquest.QuestHistory) error {
	return nil
}

func (r *combatHandlerQuestRepo) GetCompletedQuestIDs(ctx context.Context, characterID int64) ([]int, error) {
	return nil, nil
}

func mustCombatJSON(t *testing.T, v interface{}) json.RawMessage {
	t.Helper()
	data, err := json.Marshal(v)
	if err != nil {
		t.Fatalf("marshal json: %v", err)
	}
	return data
}

func TestSendBattleRewardItemCallbacks_SendsPopupAndBagUpdate(t *testing.T) {
	manager := gamedata.NewManager(nil, zap.NewNop())
	itemTpl := models.ItemTemplateTemplate{ID: 1684, Name: "Bao Tu Nam Luc", Type: 508, Kind: 5}
	if err := manager.GetCache().LoadTable(models.TableItemTemplate, []json.RawMessage{mustCombatJSON(t, itemTpl)}); err != nil {
		t.Fatalf("load item template: %v", err)
	}

	recorder := &callbackRecorder{}
	rewardDTO := map[string]interface{}{
		"items": []map[string]interface{}{
			{
				"templateId": 1684,
				"type":       29,
				"count":      1,
				"item": map[string]interface{}{
					"sid":       2311,
					"color":     0,
					"colorCode": 0,
				},
			},
		},
	}

	sendBattleRewardItemCallbacks(recorder, rewardDTO, manager)

	if len(recorder.calls) != 2 {
		t.Fatalf("SendCallback call count = %d, want 2", len(recorder.calls))
	}

	if recorder.calls[0].method != "onAddItem" {
		t.Fatalf("first callback method = %q, want onAddItem", recorder.calls[0].method)
	}
	notice, ok := recorder.calls[0].args[0].(map[string]interface{})
	if !ok {
		t.Fatalf("onAddItem payload = %#v, want map", recorder.calls[0].args[0])
	}
	if got := notice["i"]; got != 1684 {
		t.Fatalf("notice i = %#v, want 1684", got)
	}
	if got := notice["t"]; got != 29 {
		t.Fatalf("notice t = %#v, want 29", got)
	}
	if got := notice["n"]; got != "Bao Tu Nam Luc" {
		t.Fatalf("notice n = %#v, want Bao Tu Nam Luc", got)
	}
	if got := notice["tt"]; got != 5 {
		t.Fatalf("notice tt = %#v, want 5", got)
	}

	if recorder.calls[1].method != "onAddCharactorSlot" {
		t.Fatalf("second callback method = %q, want onAddCharactorSlot", recorder.calls[1].method)
	}
	itemPayload, ok := recorder.calls[1].args[0].(map[string]interface{})
	if !ok {
		t.Fatalf("onAddCharactorSlot payload = %#v, want map", recorder.calls[1].args[0])
	}
	if got := itemPayload["sid"]; got != 2311 {
		t.Fatalf("slot payload sid = %#v, want 2311", got)
	}
}

func TestCollectQuestKillUpdates_UsesEndedBattleParticipants(t *testing.T) {
	questRepo := &combatHandlerQuestRepo{
		progress: map[int64]*domainquest.QuestProgress{
			1: {
				ID:          1,
				CharacterID: 1,
				QuestID:     50,
				Status:      domainquest.QuestStatusActive,
				Objectives: []domainquest.Objective{{
					Type:     domainquest.ObjectiveKillMonster,
					Target:   157,
					Required: 1,
				}},
			},
		},
	}
	questService := appquest.NewService(questRepo, zap.NewNop())
	handler := &Handler{
		questService: questService,
		logger:       zap.NewNop(),
	}

	battle := combatdomain.NewBattle(combatdomain.BattleTypePVE, 3)
	enemy := combatdomain.NewParticipant("npc_5", "Kê Vương", combatdomain.SideEnemy, true)
	enemy.EntityType = combatdomain.ParticipantTypeCreature
	enemy.EntityID = 157
	enemy.IsAlive = false
	battle.AddParticipant(enemy)
	battle.End(&combatdomain.BattleResult{
		WinnerSide:       combatdomain.SidePlayer,
		ItemRewards:      []combatdomain.ItemDrop{},
		PetRewards:       []combatdomain.PetReward{},
		CharacterRewards: map[int64]*combatdomain.CharacterReward{},
	})

	updatedQuests, questKill := handler.collectQuestKillUpdates(context.Background(), 1, battle)

	if len(updatedQuests) != 1 {
		t.Fatalf("updated quest count = %d, want 1", len(updatedQuests))
	}
	if got := questKill["157"]; got != 1 {
		t.Fatalf("questKill[157] = %#v, want 1", got)
	}

	progress, err := questRepo.FindByCharacterAndQuest(context.Background(), 1, 50)
	if err != nil {
		t.Fatalf("FindByCharacterAndQuest() error = %v", err)
	}
	if got := progress.Objectives[0].Current; got != 1 {
		t.Fatalf("objective current = %d, want 1", got)
	}
	if !progress.IsComplete() {
		t.Fatalf("progress should be complete after ended-battle kill credit")
	}
}

func TestSendBattleCharacterProgressCallbacks_RefreshesSkillsAfterLevelUp(t *testing.T) {
	recorder := &callbackRecorder{}
	char := &domaincharacter.Character{
		ID:         2,
		Level:      5,
		Experience: 250,
		AttrPoints: 4,
	}
	skills := []map[string]interface{}{
		{"sid": 1086, "position": 2},
	}

	sendBattleCharacterProgressCallbacks(recorder, char, 54, true, nil, skills)

	if len(recorder.calls) != 5 {
		t.Fatalf("SendCallback call count = %d, want 5", len(recorder.calls))
	}
	if recorder.calls[3].method != "onSkillUpdate" {
		t.Fatalf("fourth callback = %q, want onSkillUpdate", recorder.calls[3].method)
	}
	if recorder.calls[4].method != "onMWeaponSkillUpdate" {
		t.Fatalf("fifth callback = %q, want onMWeaponSkillUpdate", recorder.calls[4].method)
	}
}

func TestSendBattlePetProgressCallbacks_RefreshesLeveledPetState(t *testing.T) {
	recorder := &callbackRecorder{}
	pet := &domainpet.Pet{
		ID:          9,
		CharacterID: 2,
		Level:       3,
		Experience:  54,
		Life:        8500,
		Property: map[string]interface{}{
			"finalHp": 1120,
			"state":   int(domainpet.PetStateBattle),
		},
	}

	sendBattlePetProgressCallbacks(recorder, pet, true)

	if len(recorder.calls) != 4 {
		t.Fatalf("SendCallback call count = %d, want 4 (exp, life, level, onRefreshPetProp)", len(recorder.calls))
	}

	expCall := recorder.calls[0]
	if expCall.method != "onUpdatePet" {
		t.Fatalf("first callback = %q, want onUpdatePet", expCall.method)
	}
	if got, ok := expCall.args[0].(float64); !ok || got != 9 {
		t.Fatalf("exp callback pet id = %#v, want float64(9)", expCall.args[0])
	}
	if got, ok := expCall.args[1].(string); !ok || got != "exp" {
		t.Fatalf("exp callback field = %#v, want %q", expCall.args[1], "exp")
	}
	if got, ok := expCall.args[2].(string); !ok || got != "233" {
		t.Fatalf("exp callback value = %#v, want %q", expCall.args[2], "233")
	}

	lifeCall := recorder.calls[1]
	if lifeCall.method != "onUpdatePet" {
		t.Fatalf("second callback = %q, want onUpdatePet", lifeCall.method)
	}
	if got, ok := lifeCall.args[1].(string); !ok || got != "life" {
		t.Fatalf("life callback field = %#v, want %q", lifeCall.args[1], "life")
	}
	if got, ok := lifeCall.args[2].(string); !ok || got != "8500" {
		t.Fatalf("life callback value = %#v, want %q", lifeCall.args[2], "8500")
	}

	levelCall := recorder.calls[2]
	if levelCall.method != "onUpdatePet" {
		t.Fatalf("third callback = %q, want onUpdatePet", levelCall.method)
	}
	if got, ok := levelCall.args[1].(string); !ok || got != "level" {
		t.Fatalf("level callback field = %#v, want %q", levelCall.args[1], "level")
	}
	if got, ok := levelCall.args[2].(string); !ok || got != "3" {
		t.Fatalf("level callback value = %#v, want %q", levelCall.args[2], "3")
	}

	propCall := recorder.calls[3]
	if propCall.method != "onRefreshPetProp" {
		t.Fatalf("fourth callback = %q, want onRefreshPetProp", propCall.method)
	}
	payload, ok := propCall.args[0].(map[string]interface{})
	if !ok {
		t.Fatalf("prop callback payload = %#v, want map", propCall.args[0])
	}
	if got := payload["id"]; got != int64(9) {
		t.Fatalf("prop callback id = %#v, want 9", got)
	}
	stats, ok := payload["s"].(map[string]interface{})
	if !ok {
		t.Fatalf("prop callback stats = %#v, want map", payload["s"])
	}
	if got := stats["finalHp"]; got != 1120 {
		t.Fatalf("prop callback finalHp = %#v, want 1120", got)
	}
}

func TestNormalizeEncounterRate_UsesPerThousandScaling(t *testing.T) {
	if got := normalizeEncounterRate(50); math.Abs(got-0.3) > 1e-9 {
		t.Fatalf("normalizeEncounterRate(50) = %v, want 0.3", got)
	}
}

func TestNormalizeEncounterRate_AllowsFractionalRates(t *testing.T) {
	if got := normalizeEncounterRate(0.05); math.Abs(got-0.3) > 1e-9 {
		t.Fatalf("normalizeEncounterRate(0.05) = %v, want 0.3", got)
	}
}

func TestNormalizeEncounterRate_ZeroDisablesEncounters(t *testing.T) {
	if got := normalizeEncounterRate(0); got != 0 {
		t.Fatalf("normalizeEncounterRate(0) = %v, want 0", got)
	}
}

func TestShouldResolveDefeatedPlayerBattle(t *testing.T) {
	battle := combatdomain.NewBattle(combatdomain.BattleTypePVE, 20)
	battle.Start()

	player := combatdomain.NewParticipant("1", "player", combatdomain.SidePlayer, false)
	player.EntityType = combatdomain.ParticipantTypeCharacter
	player.IsAlive = false
	battle.AddParticipant(player)

	pet := combatdomain.NewParticipant("33", "pet", combatdomain.SidePlayer, false)
	pet.EntityType = combatdomain.ParticipantTypePet
	pet.IsAlive = true
	battle.AddParticipant(pet)

	if !shouldResolveDefeatedPlayerBattle(battle, 1) {
		t.Fatalf("shouldResolveDefeatedPlayerBattle() = false, want true")
	}
}

func TestSendBattleStartCallbacks_SendsPetHPAndBattleState(t *testing.T) {
	enemyPet := combatdomain.NewParticipant("99", "enemy-pet", combatdomain.SideEnemy, true)
	enemyPet.EntityType = combatdomain.ParticipantTypePet
	enemyPet.EntityID = 99

	player := combatdomain.NewParticipant("1", "player", combatdomain.SidePlayer, false)
	player.EntityType = combatdomain.ParticipantTypeCharacter
	player.EntityID = 1

	playerPet := combatdomain.NewParticipant("33", "player-pet", combatdomain.SidePlayer, false)
	playerPet.EntityType = combatdomain.ParticipantTypePet
	playerPet.EntityID = 33
	playerPet.CurrentHP = 248

	recorder := &callbackRecorder{}

	sendBattleStartCallbacks(recorder, "1", []*combatdomain.Participant{enemyPet, player, playerPet}, zap.NewNop())

	if len(recorder.calls) != 3 {
		t.Fatalf("SendCallback call count = %d, want 3", len(recorder.calls))
	}

	petCall := recorder.calls[0]
	if petCall.method != "onUpdatePet" {
		t.Fatalf("SendCallback method = %q, want %q", petCall.method, "onUpdatePet")
	}
	if len(petCall.args) != 3 {
		t.Fatalf("SendCallback arg count = %d, want 3", len(petCall.args))
	}

	petKey, ok := petCall.args[0].(float64)
	if !ok || petKey != 33 {
		t.Fatalf("SendCallback arg[0] = %#v, want float64(33)", petCall.args[0])
	}
	field, ok := petCall.args[1].(string)
	if !ok || field != "currentHp" {
		t.Fatalf("SendCallback arg[1] = %#v, want %q", petCall.args[1], "currentHp")
	}
	currentHP, ok := petCall.args[2].(string)
	if !ok || currentHP != "248" {
		t.Fatalf("SendCallback arg[2] = %#v, want %q", petCall.args[2], "248")
	}

	mpCall := recorder.calls[1]
	if mpCall.method != "onUpdatePet" {
		t.Fatalf("SendCallback method = %q, want %q", mpCall.method, "onUpdatePet")
	}
	if len(mpCall.args) != 3 {
		t.Fatalf("SendCallback arg count = %d, want 3", len(mpCall.args))
	}
	if got, ok := mpCall.args[1].(string); !ok || got != "currentMp" {
		t.Fatalf("SendCallback arg[1] = %#v, want %q", mpCall.args[1], "currentMp")
	}

	stateCall := recorder.calls[2]
	if stateCall.method != "onSetCharState" {
		t.Fatalf("SendCallback method = %q, want %q", stateCall.method, "onSetCharState")
	}
	if len(stateCall.args) != 1 {
		t.Fatalf("SendCallback arg count = %d, want 1", len(stateCall.args))
	}
	payload, ok := stateCall.args[0].(map[string]interface{})
	if !ok {
		t.Fatalf("SendCallback arg[0] = %#v, want map payload", stateCall.args[0])
	}
	if got, ok := payload["cid"].(string); !ok || got != "1" {
		t.Fatalf("state payload cid = %#v, want %q", payload["cid"], "1")
	}
	if got, ok := payload["state"].(int); !ok || got != clientCharStateBattle {
		t.Fatalf("state payload state = %#v, want %d", payload["state"], clientCharStateBattle)
	}
}

func TestSendBattlePetStateCallbacks_SendsOwnerPetStateUpdates(t *testing.T) {
	recorder := &callbackRecorder{}
	sendBattlePetStateCallbacks(recorder, "42", []appcombat.BattlePetStateChange{
		{OwnerID: 42, PetID: 99, State: int(domainpet.PetStateBattle)},
		{OwnerID: 7, PetID: 55, State: int(domainpet.PetStateRest)},
	}, zap.NewNop())

	if len(recorder.calls) != 1 {
		t.Fatalf("SendCallback call count = %d, want 1", len(recorder.calls))
	}
	if recorder.calls[0].method != "onUpdatePet" {
		t.Fatalf("SendCallback method = %q, want %q", recorder.calls[0].method, "onUpdatePet")
	}
	if got, ok := recorder.calls[0].args[0].(float64); !ok || got != 99 {
		t.Fatalf("SendCallback arg[0] = %#v, want float64(99)", recorder.calls[0].args[0])
	}
	if got, ok := recorder.calls[0].args[1].(string); !ok || got != "state" {
		t.Fatalf("SendCallback arg[1] = %#v, want %q", recorder.calls[0].args[1], "state")
	}
	if got, ok := recorder.calls[0].args[2].(int); !ok || got != int(domainpet.PetStateBattle) {
		t.Fatalf("SendCallback arg[2] = %#v, want %d", recorder.calls[0].args[2], domainpet.PetStateBattle)
	}
}

func TestExtractBattleUpdateCmdArray_NoArgsIsPing(t *testing.T) {
	cmdArray, hasPayload, err := extractBattleUpdateCmdArray(nil)
	if err != nil {
		t.Fatalf("extractBattleUpdateCmdArray() error = %v", err)
	}
	if hasPayload {
		t.Fatalf("extractBattleUpdateCmdArray() hasPayload = true, want false")
	}
	if len(cmdArray) != 0 {
		t.Fatalf("extractBattleUpdateCmdArray() len = %d, want 0", len(cmdArray))
	}
}

func TestExtractBattleUpdateCmdArray_NilArgIsPing(t *testing.T) {
	cmdArray, hasPayload, err := extractBattleUpdateCmdArray([]interface{}{nil})
	if err != nil {
		t.Fatalf("extractBattleUpdateCmdArray() error = %v", err)
	}
	if hasPayload {
		t.Fatalf("extractBattleUpdateCmdArray() hasPayload = true, want false")
	}
	if len(cmdArray) != 0 {
		t.Fatalf("extractBattleUpdateCmdArray() len = %d, want 0", len(cmdArray))
	}
}

func TestExtractBattleUpdateCmdArray_EmptyECMAArrayIsPing(t *testing.T) {
	cmdArray, hasPayload, err := extractBattleUpdateCmdArray([]interface{}{amf0.ECMAArray{}})
	if err != nil {
		t.Fatalf("extractBattleUpdateCmdArray() error = %v", err)
	}
	if hasPayload {
		t.Fatalf("extractBattleUpdateCmdArray() hasPayload = true, want false")
	}
	if len(cmdArray) != 0 {
		t.Fatalf("extractBattleUpdateCmdArray() len = %d, want 0", len(cmdArray))
	}
}

func TestExtractBattleUpdateCmdArray_OrdersIndexedPayload(t *testing.T) {
	args := []interface{}{amf0.ECMAArray{
		"1": map[string]interface{}{"action": -20},
		"0": map[string]interface{}{"action": -10},
	}}

	cmdArray, hasPayload, err := extractBattleUpdateCmdArray(args)
	if err != nil {
		t.Fatalf("extractBattleUpdateCmdArray() error = %v", err)
	}
	if !hasPayload {
		t.Fatalf("extractBattleUpdateCmdArray() hasPayload = false, want true")
	}
	if len(cmdArray) != 2 {
		t.Fatalf("extractBattleUpdateCmdArray() len = %d, want 2", len(cmdArray))
	}

	first, ok := cmdArray[0].(map[string]interface{})
	if !ok || first["action"] != -10 {
		t.Fatalf("cmdArray[0] = %#v, want action -10", cmdArray[0])
	}

	second, ok := cmdArray[1].(map[string]interface{})
	if !ok || second["action"] != -20 {
		t.Fatalf("cmdArray[1] = %#v, want action -20", cmdArray[1])
	}
}

func TestExtractBattleUpdateCmdArray_UnexpectedArgTypeFails(t *testing.T) {
	_, _, err := extractBattleUpdateCmdArray([]interface{}{"bad"})
	if err != pkgerrors.ErrInvalidArgs {
		t.Fatalf("extractBattleUpdateCmdArray() error = %v, want %v", err, pkgerrors.ErrInvalidArgs)
	}
}

func TestMergeBattleCommands_PreservesExistingAndAppliesIncoming(t *testing.T) {
	existing := map[string]*combatdomain.BattleCommand{
		"1": {
			ActorID:    "1",
			TargetID:   "0",
			ActionType: combatdomain.ClientActionAttack,
		},
	}

	incoming := []*combatdomain.BattleCommand{
		{
			ActorID:    "33",
			TargetID:   "1",
			ActionType: combatdomain.ClientActionAttack,
		},
		{
			ActorID:    "1",
			TargetID:   "2",
			ActionType: combatdomain.ClientActionDefend,
		},
	}

	merged := mergeBattleCommands(existing, incoming)

	if len(merged) != 2 {
		t.Fatalf("mergeBattleCommands() len = %d, want 2", len(merged))
	}
	if got := merged["1"].TargetID; got != "2" {
		t.Fatalf("mergeBattleCommands() player target = %q, want %q", got, "2")
	}
	if got := merged["1"].ActionType; got != combatdomain.ClientActionDefend {
		t.Fatalf("mergeBattleCommands() player action = %d, want %d", got, combatdomain.ClientActionDefend)
	}
	if got := merged["33"].TargetID; got != "1" {
		t.Fatalf("mergeBattleCommands() pet target = %q, want %q", got, "1")
	}
}

func TestMissingPlayerCommandActors_RequiresLivePlayerCharactersOnly(t *testing.T) {
	battle := combatdomain.NewBattle(combatdomain.BattleTypePVE, 20)

	player := combatdomain.NewParticipant("1", "player", combatdomain.SidePlayer, false)
	player.EntityType = combatdomain.ParticipantTypeCharacter
	player.IsAlive = true
	battle.AddParticipant(player)

	pet := combatdomain.NewParticipant("33", "pet", combatdomain.SidePlayer, false)
	pet.EntityType = combatdomain.ParticipantTypePet
	pet.IsAlive = true
	battle.AddParticipant(pet)

	deadPet := combatdomain.NewParticipant("34", "dead-pet", combatdomain.SidePlayer, false)
	deadPet.EntityType = combatdomain.ParticipantTypePet
	deadPet.IsAlive = false
	battle.AddParticipant(deadPet)

	enemy := combatdomain.NewParticipant("enemy", "enemy", combatdomain.SideEnemy, true)
	enemy.IsAlive = true
	battle.AddParticipant(enemy)

	missing := battle.MissingPlayerCommandActors(map[string]*combatdomain.BattleCommand{
		"1": {
			ActorID:    "1",
			TargetID:   "0",
			ActionType: combatdomain.ClientActionAttack,
		},
	})

	if len(missing) != 0 {
		t.Fatalf("MissingPlayerCommandActors() = %v, want [] (alive pet should not be required)", missing)
	}

	missingAll := battle.MissingPlayerCommandActors(map[string]*combatdomain.BattleCommand{
		"1": {
			ActorID:    "1",
			TargetID:   "0",
			ActionType: combatdomain.ClientActionAttack,
		},
		"33": {
			ActorID:    "33",
			TargetID:   "0",
			ActionType: combatdomain.ClientActionPet,
		},
	})

	if len(missingAll) != 0 {
		t.Fatalf("MissingPlayerCommandActors() with both commands = %v, want [] (no missing when both provided)", missingAll)
	}
}

func TestShouldAutoDefendEmptyPing_RoundOneOnly(t *testing.T) {
	battle := combatdomain.NewBattle(combatdomain.BattleTypePVE, 20)
	battle.CurrentRound = 1
	if !shouldAutoDefendEmptyPing(battle) {
		t.Fatalf("shouldAutoDefendEmptyPing(round 1) = false, want true")
	}

	battle.CurrentRound = 2
	if shouldAutoDefendEmptyPing(battle) {
		t.Fatalf("shouldAutoDefendEmptyPing(round 2) = true, want false")
	}

	if shouldAutoDefendEmptyPing(nil) {
		t.Fatalf("shouldAutoDefendEmptyPing(nil) = true, want false")
	}
}

func TestShouldAutoDefendEmptyPing_NotAfterBootstrapFired(t *testing.T) {
	battle := combatdomain.NewBattle(combatdomain.BattleTypePVE, 20)
	battle.CurrentRound = 1
	battle.BootstrapAutoDefendFired = true

	if shouldAutoDefendEmptyPing(battle) {
		t.Fatalf("shouldAutoDefendEmptyPing(round 1, bootstrap fired) = true, want false")
	}
}

func TestParseTargetID_PreservesClientBattlePositions(t *testing.T) {
	h := &Handler{}

	if got := h.parseTargetID(float64(10)); got != "10" {
		t.Fatalf("parseTargetID(10) = %q, want %q", got, "10")
	}
	if got := h.parseTargetID(float64(15)); got != "15" {
		t.Fatalf("parseTargetID(15) = %q, want %q", got, "15")
	}
	if got := h.parseTargetID("10"); got != "10" {
		t.Fatalf("parseTargetID(\"10\") = %q, want %q", got, "10")
	}
	if got := h.parseTargetID("1"); got != "1" {
		t.Fatalf("parseTargetID(\"1\") = %q, want %q", got, "1")
	}
}

func TestParseCommandsRejectsUnknownSkillForPlayer(t *testing.T) {
	battle := combatdomain.NewBattle(combatdomain.BattleTypePVE, 20)
	player := combatdomain.NewParticipant("42", "player", combatdomain.SidePlayer, false)
	player.EntityType = combatdomain.ParticipantTypeCharacter
	player.IsAlive = true
	battle.AddParticipant(player)

	handler := &Handler{
		logger:         zap.NewNop(),
		skillOwnership: &stubOwnership{allow: map[int]bool{1086: true}},
	}

	rejected := handler.parseCommands(context.Background(), []interface{}{
		map[string]interface{}{
			"tid":    float64(1),
			"action": float64(combatdomain.ClientActionSkill),
			"id":     float64(9999),
		},
	}, 42, battle)
	if len(rejected) != 0 {
		t.Fatalf("parseCommands() len = %d, want 0 for unknown skill", len(rejected))
	}

	accepted := handler.parseCommands(context.Background(), []interface{}{
		map[string]interface{}{
			"tid":    float64(1),
			"action": float64(combatdomain.ClientActionSkill),
			"id":     float64(1086),
		},
	}, 42, battle)
	if len(accepted) != 1 {
		t.Fatalf("parseCommands() len = %d, want 1 for learned skill", len(accepted))
	}
	if accepted[0].SkillID != 1086 {
		t.Fatalf("parseCommands() skill = %d, want 1086", accepted[0].SkillID)
	}
}

func TestParseCommandsResolvesReplacementPetForClientActionPet(t *testing.T) {
	battle := combatdomain.NewBattle(combatdomain.BattleTypePVE, 20)
	player := combatdomain.NewParticipant("42", "player", combatdomain.SidePlayer, false)
	player.EntityType = combatdomain.ParticipantTypeCharacter
	player.EntityID = 42
	player.Position = 10
	player.IsAlive = true
	battle.AddParticipant(player)

	currentPet := combatdomain.NewParticipant("pet_11", "current", combatdomain.SidePlayer, false)
	currentPet.EntityType = combatdomain.ParticipantTypePet
	currentPet.EntityID = 11
	currentPet.OwnerID = 42
	currentPet.Position = 15
	currentPet.IsAlive = true
	battle.AddParticipant(currentPet)

	handler := &Handler{
		logger: zap.NewNop(),
		combatService: appcombat.NewService(nil, nil, nil, nil, nil, &handlerTestPetRepo{
			pets: map[int64]*domainpet.Pet{
				99: {
					ID:          99,
					CharacterID: 42,
					TemplateID:  808,
					Name:        "swap-in",
					Level:       10,
					Life:        10000,
					CurrentHP:   150,
					CurrentMP:   90,
					MaxHP:       150,
					MaxMP:       90,
					CreatureData: map[string]interface{}{
						"resCode": 2001,
					},
					Property: map[string]interface{}{
						"finalAttack":         50,
						"finalDefence":        40,
						"finalMAttack":        30,
						"finalMDefence":       30,
						"finalSpeed":          120,
						"finalHit":            110,
						"finalDodge":          10,
						"finalCritical":       4,
						"finalCriticalDamage": 150,
						"finalCounter":        0,
						"finalCombo":          0,
						"finalPraDef":         0,
						"finalPraMagDef":      0,
						"finalReduceHurt1":    0,
						"finalReduceHurt2":    0,
						"finalResiCritical":   0,
						"finalResiDefy":       0,
						"finalEnhPhyHurt":     0,
						"finalEnhMagicHurt":   0,
					},
				},
			},
		}, zap.NewNop()),
	}

	commands := handler.parseCommands(context.Background(), []interface{}{
		map[string]interface{}{
			"tid":    float64(-1),
			"action": float64(combatdomain.ClientActionPet),
			"id":     float64(99),
			"level":  float64(-1),
		},
	}, 42, battle)
	if len(commands) != 1 {
		t.Fatalf("parseCommands() len = %d, want 1", len(commands))
	}
	if commands[0].SelectedPetID != 99 {
		t.Fatalf("SelectedPetID = %d, want 99", commands[0].SelectedPetID)
	}
	if commands[0].ReplacementPet == nil {
		t.Fatal("ReplacementPet = nil, want participant")
	}
	if commands[0].ReplacementPet.Position != 15 {
		t.Fatalf("ReplacementPet.Position = %d, want 15", commands[0].ReplacementPet.Position)
	}
}

func TestBuildBattleInfoResponse_UsesParticipantPositions(t *testing.T) {
	battle := combatdomain.NewBattle(combatdomain.BattleTypePVE, 20)

	player := combatdomain.NewParticipant("1", "player", combatdomain.SidePlayer, false)
	player.Position = 0
	battle.AddParticipant(player)

	enemy := combatdomain.NewParticipant("2", "enemy", combatdomain.SideEnemy, true)
	enemy.Position = 15
	battle.AddParticipant(enemy)

	response := buildBattleInfoResponse(battle)

	if len(response) != 2 {
		t.Fatalf("buildBattleInfoResponse() len = %d, want 2", len(response))
	}

	playerInfo, ok := response["0"].(map[string]interface{})
	if !ok {
		t.Fatalf("buildBattleInfoResponse()[\"0\"] = %#v, want map[string]interface{}", response["0"])
	}
	if keepRound, ok := playerInfo["keepRound"].(map[string]interface{}); !ok || len(keepRound) != 0 {
		t.Fatalf("player keepRound = %#v, want empty map", playerInfo["keepRound"])
	}

	enemyInfo, ok := response["15"].(map[string]interface{})
	if !ok {
		t.Fatalf("buildBattleInfoResponse()[\"15\"] = %#v, want map[string]interface{}", response["15"])
	}
	if keepRound, ok := enemyInfo["keepRound"].(map[string]interface{}); !ok || len(keepRound) != 0 {
		t.Fatalf("enemy keepRound = %#v, want empty map", enemyInfo["keepRound"])
	}

	if _, ok := response["success"]; ok {
		t.Fatalf("buildBattleInfoResponse() included legacy success wrapper")
	}
	if _, ok := response["battleData"]; ok {
		t.Fatalf("buildBattleInfoResponse() included legacy battleData wrapper")
	}
}

func TestBuildBattleInfoResponse_NilBattleReturnsEmptyMap(t *testing.T) {
	response := buildBattleInfoResponse(nil)
	if len(response) != 0 {
		t.Fatalf("buildBattleInfoResponse(nil) len = %d, want 0", len(response))
	}
}

func TestGetBattleInfo_ReturnsEmptyMapWhenBattleMissing(t *testing.T) {
	handler := &Handler{
		battleInfoLookup: func(string) (*combatdomain.Battle, error) {
			return nil, pkgerrors.ErrNotFound
		},
		logger: zap.NewNop(),
	}

	result, err := handler.GetBattleInfo(nil, []interface{}{"missing-battle"})
	if err != nil {
		t.Fatalf("GetBattleInfo() error = %v, want nil", err)
	}

	payload, ok := result.(map[string]interface{})
	if !ok {
		t.Fatalf("GetBattleInfo() type = %T, want map[string]interface{}", result)
	}
	if len(payload) != 0 {
		t.Fatalf("GetBattleInfo() len = %d, want 0", len(payload))
	}
	if _, ok := payload["success"]; ok {
		t.Fatalf("GetBattleInfo() included legacy error wrapper")
	}
}

func TestGetBattleInfo_ReturnsFlatPayloadFromCleanupLookup(t *testing.T) {
	battle := combatdomain.NewBattle(combatdomain.BattleTypePVE, 20)

	player := combatdomain.NewParticipant("1", "player", combatdomain.SidePlayer, false)
	player.Position = 10
	battle.AddParticipant(player)

	enemy := combatdomain.NewParticipant("2", "enemy", combatdomain.SideEnemy, true)
	enemy.Position = 0
	battle.AddParticipant(enemy)

	handler := &Handler{
		battleInfoLookup: func(string) (*combatdomain.Battle, error) {
			return battle, nil
		},
		logger: zap.NewNop(),
	}

	result, err := handler.GetBattleInfo(nil, []interface{}{"ended-battle"})
	if err != nil {
		t.Fatalf("GetBattleInfo() error = %v, want nil", err)
	}

	payload, ok := result.(map[string]interface{})
	if !ok {
		t.Fatalf("GetBattleInfo() type = %T, want map[string]interface{}", result)
	}
	if len(payload) != 2 {
		t.Fatalf("GetBattleInfo() len = %d, want 2", len(payload))
	}
	if _, ok := payload["10"]; !ok {
		t.Fatalf("GetBattleInfo() missing player battle position")
	}
	if _, ok := payload["0"]; !ok {
		t.Fatalf("GetBattleInfo() missing enemy battle position")
	}
	if _, ok := payload["battleData"]; ok {
		t.Fatalf("GetBattleInfo() included legacy battleData wrapper")
	}
	if _, ok := payload["success"]; ok {
		t.Fatalf("GetBattleInfo() included legacy success wrapper")
	}
	entry, ok := payload["10"].(map[string]interface{})
	if !ok {
		t.Fatalf("GetBattleInfo()[\"10\"] = %#v, want map[string]interface{}", payload["10"])
	}
	if keepRound, ok := entry["keepRound"].(map[string]interface{}); !ok || len(keepRound) != 0 {
		t.Fatalf("GetBattleInfo()[\"10\"].keepRound = %#v, want empty map", entry["keepRound"])
	}
}

func TestSendSkillCallbackUpdates_SendsFullRefreshCallbacks(t *testing.T) {
	recorder := &callbackRecorder{}
	skills := []map[string]interface{}{
		{"sid": 1086, "position": 2},
	}

	sendSkillCallbackUpdates(recorder, skills)

	if len(recorder.calls) != 2 {
		t.Fatalf("SendCallback call count = %d, want 2", len(recorder.calls))
	}
	if recorder.calls[0].method != "onSkillUpdate" {
		t.Fatalf("first callback = %q, want onSkillUpdate", recorder.calls[0].method)
	}
	if recorder.calls[1].method != "onMWeaponSkillUpdate" {
		t.Fatalf("second callback = %q, want onMWeaponSkillUpdate", recorder.calls[1].method)
	}
	if got := recorder.calls[0].args[0]; got == nil {
		t.Fatalf("onSkillUpdate payload = nil, want skills")
	}
	if len(recorder.calls[1].args) != 2 {
		t.Fatalf("onMWeaponSkillUpdate arg count = %d, want 2", len(recorder.calls[1].args))
	}
	if flag, ok := recorder.calls[1].args[1].(bool); !ok || !flag {
		t.Fatalf("onMWeaponSkillUpdate refresh flag = %#v, want true", recorder.calls[1].args[1])
	}
}
