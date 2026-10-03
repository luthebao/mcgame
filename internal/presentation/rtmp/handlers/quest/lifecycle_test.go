// Open-sourced by BaoLT

package quest

import (
	"context"
	"encoding/json"
	"errors"
	"testing"
	"time"

	appitem "mcgame-server/internal/application/item"
	appquest "mcgame-server/internal/application/quest"
	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainquest "mcgame-server/internal/domain/quest"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	infrartmp "mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

type lifecycleTestCharacterRepo struct {
	char *domainchar.Character
}

func (r *lifecycleTestCharacterRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	if r.char == nil || r.char.ID != id {
		return nil, errors.New("character not found")
	}
	copyChar := *r.char
	return &copyChar, nil
}

func (r *lifecycleTestCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *lifecycleTestCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *lifecycleTestCharacterRepo) FindByName(ctx context.Context, name string) (*domainchar.Character, error) {
	return nil, errors.New("character not found")
}

func (r *lifecycleTestCharacterRepo) Create(ctx context.Context, character *domainchar.Character) error {
	r.char = character
	return nil
}

func (r *lifecycleTestCharacterRepo) Update(ctx context.Context, character *domainchar.Character) error {
	r.char = character
	return nil
}

func (r *lifecycleTestCharacterRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (r *lifecycleTestCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}

func (r *lifecycleTestCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos domainchar.Position) error {
	return nil
}

func (r *lifecycleTestCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

type lifecycleTestItemRepo struct {
	nextID int64
	items  map[int64]*domainitem.Item
}

func newLifecycleTestItemRepo() *lifecycleTestItemRepo {
	return &lifecycleTestItemRepo{
		nextID: 1,
		items:  make(map[int64]*domainitem.Item),
	}
}

func (r *lifecycleTestItemRepo) FindByID(ctx context.Context, id int64) (*domainitem.Item, error) {
	it, ok := r.items[id]
	if !ok {
		return nil, pkgerrors.ErrItemNotFound
	}
	copyItem := *it
	return &copyItem, nil
}

func (r *lifecycleTestItemRepo) FindByCharacterID(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	result := make([]*domainitem.Item, 0)
	for _, it := range r.items {
		if it.CharacterID != charID {
			continue
		}
		copyItem := *it
		result = append(result, &copyItem)
	}
	return result, nil
}

func (r *lifecycleTestItemRepo) FindByCharacterAndSlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) ([]*domainitem.Item, error) {
	result := make([]*domainitem.Item, 0)
	for _, it := range r.items {
		if it.CharacterID != charID || it.SlotType != slotType {
			continue
		}
		copyItem := *it
		result = append(result, &copyItem)
	}
	return result, nil
}

func (r *lifecycleTestItemRepo) FindBySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, slotIndex int) (*domainitem.Item, error) {
	for _, it := range r.items {
		if it.CharacterID == charID && it.SlotType == slotType && it.SlotIndex == slotIndex {
			copyItem := *it
			return &copyItem, nil
		}
	}
	return nil, pkgerrors.ErrItemNotFound
}

func (r *lifecycleTestItemRepo) FindEquipped(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	return r.FindByCharacterAndSlotType(ctx, charID, domainitem.SlotTypeEquipped)
}

func (r *lifecycleTestItemRepo) Create(ctx context.Context, it *domainitem.Item) error {
	copyItem := *it
	copyItem.ID = r.nextID
	r.nextID++
	r.items[copyItem.ID] = &copyItem
	it.ID = copyItem.ID
	return nil
}

func (r *lifecycleTestItemRepo) Update(ctx context.Context, it *domainitem.Item) error {
	if _, ok := r.items[it.ID]; !ok {
		return pkgerrors.ErrItemNotFound
	}
	copyItem := *it
	r.items[it.ID] = &copyItem
	return nil
}

func (r *lifecycleTestItemRepo) Delete(ctx context.Context, id int64) error {
	delete(r.items, id)
	return nil
}

func (r *lifecycleTestItemRepo) DeleteByCharacterID(ctx context.Context, charID int64) error {
	for id, it := range r.items {
		if it.CharacterID == charID {
			delete(r.items, id)
		}
	}
	return nil
}

func (r *lifecycleTestItemRepo) MoveItem(ctx context.Context, id int64, slotType domainitem.SlotType, slotIndex int) error {
	it, ok := r.items[id]
	if !ok {
		return pkgerrors.ErrItemNotFound
	}
	it.SlotType = slotType
	it.SlotIndex = slotIndex
	return nil
}

func (r *lifecycleTestItemRepo) UpdateStack(ctx context.Context, id int64, stackCount int) error {
	it, ok := r.items[id]
	if !ok {
		return pkgerrors.ErrItemNotFound
	}
	it.StackCount = stackCount
	return nil
}

func (r *lifecycleTestItemRepo) FindFirstEmptySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, maxSlots int) (int, error) {
	occupied := make(map[int]bool)
	for _, it := range r.items {
		if it.CharacterID == charID && it.SlotType == slotType {
			occupied[it.SlotIndex] = true
		}
	}
	for slotIndex := 0; slotIndex < maxSlots; slotIndex++ {
		if !occupied[slotIndex] {
			return slotIndex, nil
		}
	}
	return -1, pkgerrors.ErrInventoryFull
}

func (r *lifecycleTestItemRepo) CountBySlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) (int, error) {
	count := 0
	for _, it := range r.items {
		if it.CharacterID == charID && it.SlotType == slotType {
			count++
		}
	}
	return count, nil
}

type lifecycleTestQuestRepo struct {
	nextID   int64
	progress map[int64]*domainquest.QuestProgress
}

func newLifecycleTestQuestRepo() *lifecycleTestQuestRepo {
	return &lifecycleTestQuestRepo{
		nextID:   1,
		progress: make(map[int64]*domainquest.QuestProgress),
	}
}

func (r *lifecycleTestQuestRepo) Save(ctx context.Context, progress *domainquest.QuestProgress) error {
	if progress.ID == 0 {
		progress.ID = r.nextID
		r.nextID++
	}
	r.progress[progress.ID] = cloneLifecycleQuestProgress(progress)
	return nil
}

func (r *lifecycleTestQuestRepo) FindByID(ctx context.Context, id int64) (*domainquest.QuestProgress, error) {
	progress, ok := r.progress[id]
	if !ok {
		return nil, pkgerrors.ErrNotFound
	}
	return cloneLifecycleQuestProgress(progress), nil
}

func (r *lifecycleTestQuestRepo) FindByCharacterAndQuest(ctx context.Context, characterID int64, questID int) (*domainquest.QuestProgress, error) {
	for _, progress := range r.progress {
		if progress.CharacterID == characterID && progress.QuestID == questID {
			return cloneLifecycleQuestProgress(progress), nil
		}
	}
	return nil, pkgerrors.ErrNotFound
}

func (r *lifecycleTestQuestRepo) FindActiveByCharacter(ctx context.Context, characterID int64) ([]*domainquest.QuestProgress, error) {
	result := make([]*domainquest.QuestProgress, 0)
	for _, progress := range r.progress {
		if progress.CharacterID == characterID && progress.Status == domainquest.QuestStatusActive {
			result = append(result, cloneLifecycleQuestProgress(progress))
		}
	}
	return result, nil
}

func (r *lifecycleTestQuestRepo) FindCompletedByCharacter(ctx context.Context, characterID int64) ([]*domainquest.QuestProgress, error) {
	result := make([]*domainquest.QuestProgress, 0)
	for _, progress := range r.progress {
		if progress.CharacterID == characterID && progress.Status == domainquest.QuestStatusCompleted {
			result = append(result, cloneLifecycleQuestProgress(progress))
		}
	}
	return result, nil
}

func (r *lifecycleTestQuestRepo) FindAllByCharacter(ctx context.Context, characterID int64) ([]*domainquest.QuestProgress, error) {
	result := make([]*domainquest.QuestProgress, 0)
	for _, progress := range r.progress {
		if progress.CharacterID == characterID {
			result = append(result, cloneLifecycleQuestProgress(progress))
		}
	}
	return result, nil
}

func (r *lifecycleTestQuestRepo) Update(ctx context.Context, progress *domainquest.QuestProgress) error {
	if _, ok := r.progress[progress.ID]; !ok {
		return pkgerrors.ErrNotFound
	}
	r.progress[progress.ID] = cloneLifecycleQuestProgress(progress)
	return nil
}

func (r *lifecycleTestQuestRepo) Delete(ctx context.Context, id int64) error {
	delete(r.progress, id)
	return nil
}

func (r *lifecycleTestQuestRepo) RecordHistory(ctx context.Context, history *domainquest.QuestHistory) error {
	return nil
}

func (r *lifecycleTestQuestRepo) GetCompletedQuestIDs(ctx context.Context, characterID int64) ([]int, error) {
	result := make([]int, 0)
	for _, progress := range r.progress {
		if progress.CharacterID == characterID && progress.Status == domainquest.QuestStatusCompleted {
			result = append(result, progress.QuestID)
		}
	}
	return result, nil
}

func cloneLifecycleQuestProgress(progress *domainquest.QuestProgress) *domainquest.QuestProgress {
	if progress == nil {
		return nil
	}
	copyProgress := *progress
	if progress.Objectives != nil {
		copyProgress.Objectives = append([]domainquest.Objective(nil), progress.Objectives...)
	}
	if progress.CompletedAt != nil {
		completedAt := *progress.CompletedAt
		copyProgress.CompletedAt = &completedAt
	}
	if progress.ExpiresAt != nil {
		expiresAt := *progress.ExpiresAt
		copyProgress.ExpiresAt = &expiresAt
	}
	if progress.LastReset != nil {
		lastReset := *progress.LastReset
		copyProgress.LastReset = &lastReset
	}
	return &copyProgress
}

func TestTakeQuest_GrantsConfiguredQuestStartItems(t *testing.T) {
	tests := []struct {
		name           string
		questID        int
		itemID         int
		itemName       string
		expectedSlot   domainitem.SlotType
		expectedAmount int
	}{
		{name: "quest 160", questID: 160, itemID: 335, itemName: "Thuoc Thu Nghiem", expectedSlot: domainitem.SlotTypeQuestBag, expectedAmount: 1},
		{name: "quest 162", questID: 162, itemID: 515, itemName: "Mau Thuc An Cua Ve Si", expectedSlot: domainitem.SlotTypeQuestBag, expectedAmount: 1},
		{name: "quest 164", questID: 164, itemID: 517, itemName: "Canh Giai Doc", expectedSlot: domainitem.SlotTypeQuestBag, expectedAmount: 1},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			logger := zap.NewNop()
			manager := gamedata.NewManager(nil, logger)
			charRepo := &lifecycleTestCharacterRepo{char: &domainchar.Character{ID: 1, Level: 30}}
			itemRepo := newLifecycleTestItemRepo()
			questRepo := newLifecycleTestQuestRepo()
			itemService := appitem.NewService(itemRepo, logger)
			questService := appquest.NewService(questRepo, logger)

			loadLifecycleQuestTestData(t, manager, tt.questID, tt.itemID, tt.itemName)

			itemService.SetGameDataManager(manager)
			itemService.SetCharacterRepository(charRepo)
			itemService.SetQuestService(questService)
			questService.SetGameDataManager(manager)
			questService.SetCharacterRepository(charRepo)
			questService.SetItemService(itemService)

			handler := NewHandler(questService, logger)
			handler.SetItemService(itemService)
			handler.SetGameDataManager(manager)

			ctx := &infrartmp.RPCContext{
				Context:     context.Background(),
				CharacterID: "1",
				Connection:  infrartmp.NewConnection(1, nil, nil, logger),
				Timestamp:   time.Now(),
			}

			if _, err := handler.TakeQuest(ctx, []interface{}{float64(tt.questID), float64(430)}); err != nil {
				t.Fatalf("take quest: %v", err)
			}

			items, err := itemRepo.FindByCharacterAndSlotType(context.Background(), 1, tt.expectedSlot)
			if err != nil {
				t.Fatalf("find quest bag items: %v", err)
			}
			if len(items) != 1 {
				t.Fatalf("expected one quest bag item, got %d", len(items))
			}
			if items[0].TemplateID != tt.itemID {
				t.Fatalf("expected item %d, got %d", tt.itemID, items[0].TemplateID)
			}
			if items[0].StackCount != tt.expectedAmount {
				t.Fatalf("expected stack count %d, got %d", tt.expectedAmount, items[0].StackCount)
			}

			progress, err := questRepo.FindByCharacterAndQuest(context.Background(), 1, tt.questID)
			if err != nil {
				t.Fatalf("find quest progress: %v", err)
			}
			if len(progress.Objectives) != 1 {
				t.Fatalf("expected one objective, got %d", len(progress.Objectives))
			}
			if progress.Objectives[0].Target != tt.itemID {
				t.Fatalf("expected objective target %d, got %d", tt.itemID, progress.Objectives[0].Target)
			}
			if progress.Objectives[0].Current != tt.expectedAmount {
				t.Fatalf("expected collected amount %d, got %d", tt.expectedAmount, progress.Objectives[0].Current)
			}
		})
	}
}

func TestTakeBuildQuest_GrantsConfiguredQuestStartItems(t *testing.T) {
	logger := zap.NewNop()
	manager := gamedata.NewManager(nil, logger)
	charRepo := &lifecycleTestCharacterRepo{char: &domainchar.Character{ID: 1, Level: 30}}
	itemRepo := newLifecycleTestItemRepo()
	questRepo := newLifecycleTestQuestRepo()
	itemService := appitem.NewService(itemRepo, logger)
	questService := appquest.NewService(questRepo, logger)

	loadLifecycleQuestTestData(t, manager, 162, 515, "Mau Thuc An Cua Ve Si")

	itemService.SetGameDataManager(manager)
	itemService.SetCharacterRepository(charRepo)
	itemService.SetQuestService(questService)
	questService.SetGameDataManager(manager)
	questService.SetCharacterRepository(charRepo)
	questService.SetItemService(itemService)

	handler := NewHandler(questService, logger)
	handler.SetItemService(itemService)
	handler.SetGameDataManager(manager)

	ctx := &infrartmp.RPCContext{
		Context:     context.Background(),
		CharacterID: "1",
		Connection:  infrartmp.NewConnection(1, nil, nil, logger),
		Timestamp:   time.Now(),
	}

	result, err := handler.TakeBuildQuest(ctx, []interface{}{float64(162), float64(430)})
	if err != nil {
		t.Fatalf("take build quest: %v", err)
	}

	resultMap, ok := result.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map result, got %T", result)
	}
	if flag, ok := resultMap["flag"].(bool); !ok || !flag {
		t.Fatalf("expected success flag, got %#v", resultMap["flag"])
	}

	items, err := itemRepo.FindByCharacterAndSlotType(context.Background(), 1, domainitem.SlotTypeQuestBag)
	if err != nil {
		t.Fatalf("find quest bag items: %v", err)
	}
	if len(items) != 1 {
		t.Fatalf("expected one quest bag item, got %d", len(items))
	}
	if items[0].TemplateID != 515 {
		t.Fatalf("expected item 515, got %d", items[0].TemplateID)
	}
	if items[0].StackCount != 1 {
		t.Fatalf("expected stack count 1, got %d", items[0].StackCount)
	}
}

func loadLifecycleQuestTestData(t *testing.T, manager *gamedata.Manager, questID int, itemID int, itemName string) {
	t.Helper()

	questTpl := models.QuestTemplate{
		ID:         int64(questID),
		Name:       "Quest Test",
		Info:       "Quest Test",
		StartNPC:   430,
		FinishNPC:  430,
		MinLevel:   1,
		AwardExpRe: 1,
	}
	requireTpl := models.QuestRequireTemplate{
		ID:     int64(questID),
		Qid:    float64(questID),
		Kind:   1,
		ItemID: float64(itemID),
		Num:    1,
		Q:      -1,
		Type:   29,
	}
	itemTpl := models.ItemTemplateTemplate{
		ID:       int64(itemID),
		Name:     itemName,
		Kind:     5,
		Type:     508,
		StackMax: 99,
	}

	if err := manager.GetCache().LoadTable(models.TableQuest, []json.RawMessage{mustLifecycleJSON(t, questTpl)}); err != nil {
		t.Fatalf("load quest table: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableQuestRequire, []json.RawMessage{mustLifecycleJSON(t, requireTpl)}); err != nil {
		t.Fatalf("load quest require table: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableItemTemplate, []json.RawMessage{mustLifecycleJSON(t, itemTpl)}); err != nil {
		t.Fatalf("load item table: %v", err)
	}
}

func mustLifecycleJSON(t *testing.T, value interface{}) json.RawMessage {
	t.Helper()
	data, err := json.Marshal(value)
	if err != nil {
		t.Fatalf("marshal json: %v", err)
	}
	return data
}
