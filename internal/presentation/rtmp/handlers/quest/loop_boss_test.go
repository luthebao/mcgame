// Open-sourced by BaoLT

package quest

import (
	"context"
	"encoding/json"
	"testing"

	appitem "mcgame-server/internal/application/item"
	appquest "mcgame-server/internal/application/quest"
	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainquest "mcgame-server/internal/domain/quest"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	infrartmp "mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type loopBossTestLoopRepo struct {
	states map[int64]map[int]*domainquest.LoopState
}

func newLoopBossTestLoopRepo() *loopBossTestLoopRepo {
	return &loopBossTestLoopRepo{states: make(map[int64]map[int]*domainquest.LoopState)}
}

func (r *loopBossTestLoopRepo) GetAll(ctx context.Context, characterID int64) ([]*domainquest.LoopState, error) {
	result := make([]*domainquest.LoopState, 0)
	for _, st := range r.states[characterID] {
		copyState := *st
		result = append(result, &copyState)
	}
	return result, nil
}

func (r *loopBossTestLoopRepo) Upsert(ctx context.Context, state *domainquest.LoopState) (*domainquest.LoopState, error) {
	if r.states[state.CharacterID] == nil {
		r.states[state.CharacterID] = make(map[int]*domainquest.LoopState)
	}
	copyState := *state
	r.states[state.CharacterID][state.LoopID] = &copyState
	result := copyState
	return &result, nil
}

func (r *loopBossTestLoopRepo) Deactivate(ctx context.Context, characterID int64, loopID int) (bool, error) {
	st, ok := r.states[characterID][loopID]
	if !ok || !st.Active {
		return false, nil
	}
	st.Active = false
	st.ActiveQuestID = 0
	return true, nil
}

func TestTakeLoop_GrantsOrderItemForItemSummonBoss(t *testing.T) {
	logger := zap.NewNop()
	manager := gamedata.NewManager(nil, logger)

	loopTpl := models.QuestLoopTemplate{ID: 4, Nid: 277, Num: 10, Refresh: 600, MinLevel: 1}
	childTpl := models.QuestTemplate{ID: 4671, Type: 7, SubType: "7-4", MinLevel: 0, FinishNPC: 277}
	itemTpl := models.ItemTemplateTemplate{ID: 2263, Name: "Lệnh Truy Bắt", Kind: 5, Type: 508, StackMax: 1}

	if err := manager.GetCache().LoadTable(models.TableQuestLoop, []json.RawMessage{mustLifecycleJSON(t, loopTpl)}); err != nil {
		t.Fatalf("load quest loop table: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableQuest, []json.RawMessage{mustLifecycleJSON(t, childTpl)}); err != nil {
		t.Fatalf("load quest table: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableItemTemplate, []json.RawMessage{mustLifecycleJSON(t, itemTpl)}); err != nil {
		t.Fatalf("load item table: %v", err)
	}

	charRepo := &lifecycleTestCharacterRepo{char: &domainchar.Character{ID: 1, Level: 30}}
	itemRepo := newLifecycleTestItemRepo()
	questRepo := newLifecycleTestQuestRepo()
	loopRepo := newLoopBossTestLoopRepo()

	itemService := appitem.NewService(itemRepo, logger)
	questService := appquest.NewService(questRepo, logger)
	itemService.SetGameDataManager(manager)
	itemService.SetCharacterRepository(charRepo)
	itemService.SetQuestService(questService)
	questService.SetGameDataManager(manager)
	questService.SetCharacterRepository(charRepo)
	questService.SetItemService(itemService)
	questService.SetLoopRepository(loopRepo)

	handler := NewHandler(questService, logger)
	handler.SetItemService(itemService)
	handler.SetGameDataManager(manager)

	ctx := &infrartmp.RPCContext{
		Context:     context.Background(),
		CharacterID: "1",
		Connection:  infrartmp.NewConnection(1, nil, nil, logger),
	}

	if _, err := handler.TakeLoop(ctx, []interface{}{float64(4)}); err != nil {
		t.Fatalf("take loop: %v", err)
	}

	items, err := itemRepo.FindByCharacterAndSlotType(context.Background(), 1, domainitem.SlotTypeQuestBag)
	if err != nil {
		t.Fatalf("find quest bag items: %v", err)
	}
	if len(items) != 1 {
		t.Fatalf("expected one quest bag item, got %d", len(items))
	}
	if items[0].TemplateID != 2263 {
		t.Fatalf("expected order item 2263, got %d", items[0].TemplateID)
	}
	if items[0].StackCount != 1 {
		t.Fatalf("expected stack count 1, got %d", items[0].StackCount)
	}

	state := loopRepo.states[1][4]
	if state == nil || !state.Active || state.ActiveQuestID != 4671 {
		t.Fatalf("expected active loop state pinned to quest 4671, got %+v", state)
	}
}
