// Open-sourced by BaoLT

package quest

import (
	"context"
	"encoding/json"
	"errors"
	"testing"
	"time"

	appitem "mcgame-server/internal/application/item"
	apppet "mcgame-server/internal/application/pet"
	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"
	domainquest "mcgame-server/internal/domain/quest"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	"mcgame-server/internal/gamedata/predef"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

type questTestCharacterRepo struct {
	char *domainchar.Character
}

func (r *questTestCharacterRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	if r.char == nil || r.char.ID != id {
		return nil, errors.New("character not found")
	}
	return r.char, nil
}

func (r *questTestCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *questTestCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *questTestCharacterRepo) FindByName(ctx context.Context, name string) (*domainchar.Character, error) {
	return nil, nil
}

func (r *questTestCharacterRepo) Create(ctx context.Context, character *domainchar.Character) error {
	return nil
}

func (r *questTestCharacterRepo) Update(ctx context.Context, character *domainchar.Character) error {
	r.char = character
	return nil
}

func (r *questTestCharacterRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (r *questTestCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}

func (r *questTestCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos domainchar.Position) error {
	return nil
}

func (r *questTestCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

type questTestItemRepo struct {
	nextID int64
	items  map[int64]*domainitem.Item
}

func newQuestTestItemRepo() *questTestItemRepo {
	return &questTestItemRepo{nextID: 1, items: make(map[int64]*domainitem.Item)}
}

func (r *questTestItemRepo) FindByID(ctx context.Context, id int64) (*domainitem.Item, error) {
	it, ok := r.items[id]
	if !ok {
		return nil, pkgerrors.ErrItemNotFound
	}
	copy := *it
	return &copy, nil
}

func (r *questTestItemRepo) FindByCharacterID(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	items := make([]*domainitem.Item, 0)
	for _, it := range r.items {
		if it.CharacterID == charID {
			copy := *it
			items = append(items, &copy)
		}
	}
	return items, nil
}

func (r *questTestItemRepo) FindByCharacterAndSlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) ([]*domainitem.Item, error) {
	items := make([]*domainitem.Item, 0)
	for _, it := range r.items {
		if it.CharacterID == charID && it.SlotType == slotType {
			copy := *it
			items = append(items, &copy)
		}
	}
	return items, nil
}

func (r *questTestItemRepo) FindBySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, slotIndex int) (*domainitem.Item, error) {
	for _, it := range r.items {
		if it.CharacterID == charID && it.SlotType == slotType && it.SlotIndex == slotIndex {
			copy := *it
			return &copy, nil
		}
	}
	return nil, pkgerrors.ErrItemNotFound
}

func (r *questTestItemRepo) FindEquipped(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	return r.FindByCharacterAndSlotType(ctx, charID, domainitem.SlotTypeEquipped)
}

func (r *questTestItemRepo) Create(ctx context.Context, it *domainitem.Item) error {
	copy := *it
	copy.ID = r.nextID
	r.nextID++
	r.items[copy.ID] = &copy
	it.ID = copy.ID
	return nil
}

func (r *questTestItemRepo) Update(ctx context.Context, it *domainitem.Item) error {
	if _, ok := r.items[it.ID]; !ok {
		return pkgerrors.ErrItemNotFound
	}
	copy := *it
	r.items[it.ID] = &copy
	return nil
}

func (r *questTestItemRepo) Delete(ctx context.Context, id int64) error {
	delete(r.items, id)
	return nil
}

func (r *questTestItemRepo) DeleteByCharacterID(ctx context.Context, charID int64) error {
	for id, it := range r.items {
		if it.CharacterID == charID {
			delete(r.items, id)
		}
	}
	return nil
}

func (r *questTestItemRepo) MoveItem(ctx context.Context, id int64, slotType domainitem.SlotType, slotIndex int) error {
	it, ok := r.items[id]
	if !ok {
		return pkgerrors.ErrItemNotFound
	}
	it.SlotType = slotType
	it.SlotIndex = slotIndex
	return nil
}

func (r *questTestItemRepo) UpdateStack(ctx context.Context, id int64, stackCount int) error {
	it, ok := r.items[id]
	if !ok {
		return pkgerrors.ErrItemNotFound
	}
	it.StackCount = stackCount
	return nil
}

func (r *questTestItemRepo) FindFirstEmptySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, maxSlots int) (int, error) {
	occupied := make(map[int]bool)
	for _, it := range r.items {
		if it.CharacterID == charID && it.SlotType == slotType {
			occupied[it.SlotIndex] = true
		}
	}
	for i := 0; i < maxSlots; i++ {
		if !occupied[i] {
			return i, nil
		}
	}
	return -1, pkgerrors.ErrInventoryFull
}

func (r *questTestItemRepo) CountBySlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) (int, error) {
	count := 0
	for _, it := range r.items {
		if it.CharacterID == charID && it.SlotType == slotType {
			count++
		}
	}
	return count, nil
}

type questTestQuestRepo struct {
	nextID    int64
	progress  map[int64]*domainquest.QuestProgress
	histories []*domainquest.QuestHistory
}

type questTestPetRepo struct {
	pets map[int64]*domainpet.Pet
}

func newQuestTestQuestRepo() *questTestQuestRepo {
	return &questTestQuestRepo{
		nextID:   1,
		progress: make(map[int64]*domainquest.QuestProgress),
	}
}

func newQuestTestPetRepo(pets ...*domainpet.Pet) *questTestPetRepo {
	repo := &questTestPetRepo{pets: make(map[int64]*domainpet.Pet, len(pets))}
	for _, pet := range pets {
		if pet == nil {
			continue
		}
		copyPet := *pet
		repo.pets[pet.ID] = &copyPet
	}
	return repo
}

func (r *questTestPetRepo) Save(ctx context.Context, pet *domainpet.Pet) error {
	if r.pets == nil {
		r.pets = make(map[int64]*domainpet.Pet)
	}
	copyPet := *pet
	r.pets[pet.ID] = &copyPet
	return nil
}

func (r *questTestPetRepo) FindByID(ctx context.Context, id int64) (*domainpet.Pet, error) {
	pet, ok := r.pets[id]
	if !ok {
		return nil, pkgerrors.ErrNotFound
	}
	copyPet := *pet
	return &copyPet, nil
}

func (r *questTestPetRepo) FindByCharacterID(ctx context.Context, characterID int64) ([]*domainpet.Pet, error) {
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

func (r *questTestPetRepo) FindFollowingPet(ctx context.Context, characterID int64) (*domainpet.Pet, error) {
	for _, pet := range r.pets {
		if pet.CharacterID == characterID && pet.IsFollowing {
			copyPet := *pet
			return &copyPet, nil
		}
	}
	return nil, pkgerrors.ErrNotFound
}

func (r *questTestPetRepo) Delete(ctx context.Context, id int64) error {
	delete(r.pets, id)
	return nil
}

func (r *questTestPetRepo) Count(ctx context.Context, characterID int64) (int, error) {
	count := 0
	for _, pet := range r.pets {
		if pet.CharacterID == characterID {
			count++
		}
	}
	return count, nil
}

func (r *questTestPetRepo) UpdateFollowState(ctx context.Context, petID int64, isFollowing bool) error {
	pet, ok := r.pets[petID]
	if !ok {
		return pkgerrors.ErrNotFound
	}
	pet.IsFollowing = isFollowing
	return nil
}

func (r *questTestPetRepo) ClearFollowing(ctx context.Context, characterID int64) error {
	for _, pet := range r.pets {
		if pet.CharacterID == characterID {
			pet.IsFollowing = false
		}
	}
	return nil
}

func (r *questTestQuestRepo) Save(ctx context.Context, progress *domainquest.QuestProgress) error {
	if progress.ID == 0 {
		progress.ID = r.nextID
		r.nextID++
	}
	r.progress[progress.ID] = cloneQuestProgress(progress)
	return nil
}

func (r *questTestQuestRepo) FindByID(ctx context.Context, id int64) (*domainquest.QuestProgress, error) {
	progress, ok := r.progress[id]
	if !ok {
		return nil, pkgerrors.ErrNotFound
	}
	return cloneQuestProgress(progress), nil
}

func (r *questTestQuestRepo) FindByCharacterAndQuest(ctx context.Context, characterID int64, questID int) (*domainquest.QuestProgress, error) {
	for _, progress := range r.progress {
		if progress.CharacterID == characterID && progress.QuestID == questID {
			return cloneQuestProgress(progress), nil
		}
	}
	return nil, pkgerrors.ErrNotFound
}

func (r *questTestQuestRepo) FindActiveByCharacter(ctx context.Context, characterID int64) ([]*domainquest.QuestProgress, error) {
	result := make([]*domainquest.QuestProgress, 0)
	for _, progress := range r.progress {
		if progress.CharacterID == characterID && progress.Status == domainquest.QuestStatusActive {
			result = append(result, cloneQuestProgress(progress))
		}
	}
	return result, nil
}

func (r *questTestQuestRepo) FindCompletedByCharacter(ctx context.Context, characterID int64) ([]*domainquest.QuestProgress, error) {
	result := make([]*domainquest.QuestProgress, 0)
	for _, progress := range r.progress {
		if progress.CharacterID == characterID && progress.Status == domainquest.QuestStatusCompleted {
			result = append(result, cloneQuestProgress(progress))
		}
	}
	return result, nil
}

func (r *questTestQuestRepo) FindAllByCharacter(ctx context.Context, characterID int64) ([]*domainquest.QuestProgress, error) {
	result := make([]*domainquest.QuestProgress, 0)
	for _, progress := range r.progress {
		if progress.CharacterID == characterID {
			result = append(result, cloneQuestProgress(progress))
		}
	}
	return result, nil
}

func (r *questTestQuestRepo) Update(ctx context.Context, progress *domainquest.QuestProgress) error {
	if _, ok := r.progress[progress.ID]; !ok {
		return pkgerrors.ErrNotFound
	}
	r.progress[progress.ID] = cloneQuestProgress(progress)
	return nil
}

func (r *questTestQuestRepo) Delete(ctx context.Context, id int64) error {
	if _, ok := r.progress[id]; !ok {
		return pkgerrors.ErrNotFound
	}
	delete(r.progress, id)
	return nil
}

func (r *questTestQuestRepo) RecordHistory(ctx context.Context, history *domainquest.QuestHistory) error {
	copy := *history
	r.histories = append(r.histories, &copy)
	return nil
}

func (r *questTestQuestRepo) GetCompletedQuestIDs(ctx context.Context, characterID int64) ([]int, error) {
	result := make([]int, 0)
	for _, progress := range r.progress {
		if progress.CharacterID == characterID && progress.Status == domainquest.QuestStatusCompleted {
			result = append(result, progress.QuestID)
		}
	}
	return result, nil
}

func cloneQuestProgress(progress *domainquest.QuestProgress) *domainquest.QuestProgress {
	if progress == nil {
		return nil
	}
	copy := *progress
	if progress.Objectives != nil {
		copy.Objectives = append([]domainquest.Objective(nil), progress.Objectives...)
	}
	if progress.CompletedAt != nil {
		completedAt := *progress.CompletedAt
		copy.CompletedAt = &completedAt
	}
	if progress.ExpiresAt != nil {
		expiresAt := *progress.ExpiresAt
		copy.ExpiresAt = &expiresAt
	}
	if progress.LastReset != nil {
		lastReset := *progress.LastReset
		copy.LastReset = &lastReset
	}
	return &copy
}

func TestApplyRewards_SkipsInvalidEquipmentAwardTemplate(t *testing.T) {
	logger := zap.NewNop()

	charRepo := &questTestCharacterRepo{char: &domainchar.Character{ID: 1, Level: 1}}
	itemRepo := newQuestTestItemRepo()
	itemService := appitem.NewService(itemRepo, logger)

	manager := gamedata.NewManager(nil, logger)
	questTpl := models.QuestTemplate{ID: 9001, AwardExpRe: 1}
	awardTpl := models.QuestAwardTemplate{ID: 1, B: 1, ItemID: 1280, Num: 1, Qid: 9001, Type: 19}

	if err := manager.GetCache().LoadTable(models.TableQuest, []json.RawMessage{mustQuestJSON(t, questTpl)}); err != nil {
		t.Fatalf("load quest table: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableQuestAward, []json.RawMessage{mustQuestJSON(t, awardTpl)}); err != nil {
		t.Fatalf("load quest award table: %v", err)
	}

	itemService.SetGameDataManager(manager)

	svc := NewService(nil, logger)
	svc.SetGameDataManager(manager)
	svc.SetCharacterRepository(charRepo)
	svc.SetItemService(itemService)

	rewards, err := svc.applyRewards(context.Background(), 1, 9001, 0)
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	items, ok := rewards["items"].([]map[string]interface{})
	if !ok {
		t.Fatalf("expected items as []map[string]interface{}, got %T", rewards["items"])
	}
	if len(items) != 0 {
		t.Fatalf("expected no rewarded items for missing equipment template, got %d", len(items))
	}

	notifiedItems, ok := rewards["notifiedItems"].([]map[string]interface{})
	if !ok {
		t.Fatalf("expected notifiedItems as []map[string]interface{}, got %T", rewards["notifiedItems"])
	}
	if len(notifiedItems) != 0 {
		t.Fatalf("expected no popup items for missing equipment template, got %d", len(notifiedItems))
	}

	if len(itemRepo.items) != 0 {
		t.Fatalf("expected no persisted items for missing equipment template, got %d", len(itemRepo.items))
	}
}

func TestApplyRewards_UsesQuestAwardQualityForEquipment(t *testing.T) {
	logger := zap.NewNop()

	charRepo := &questTestCharacterRepo{char: &domainchar.Character{ID: 1, Level: 1}}
	itemRepo := newQuestTestItemRepo()
	itemService := appitem.NewService(itemRepo, logger)

	manager := gamedata.NewManager(nil, logger)
	questTpl := models.QuestTemplate{ID: 9002, AwardExpRe: 1}
	awardTpl := models.QuestAwardTemplate{ID: 2, B: 1, ItemID: 170, Num: 1, Q: 10, Qid: 9002, Type: 19}
	equipTpl := models.EquiptTemplateTemplate{ID: 170, Name: "Kiếm Thử Nghiệm", Kind: 1, EndureMax: 60, MainProp1: 11, MainProp2: 20, Prop1: 8, Prop2: 13, MainPropNum1: 100, MainPropNum2: 40, PropNum1: 60, PropNum2: 30, BindPropNum: 15, ActivePropType: 8, ActivePropNum: 5}

	if err := manager.GetCache().LoadTable(models.TableQuest, []json.RawMessage{mustQuestJSON(t, questTpl)}); err != nil {
		t.Fatalf("load quest table: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableQuestAward, []json.RawMessage{mustQuestJSON(t, awardTpl)}); err != nil {
		t.Fatalf("load quest award table: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{mustQuestJSON(t, equipTpl)}); err != nil {
		t.Fatalf("load equipment table: %v", err)
	}

	itemService.SetGameDataManager(manager)

	svc := NewService(nil, logger)
	svc.SetGameDataManager(manager)
	svc.SetCharacterRepository(charRepo)
	svc.SetItemService(itemService)

	rewards, err := svc.applyRewards(context.Background(), 1, 9002, 0)
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	items, ok := rewards["items"].([]map[string]interface{})
	if !ok || len(items) != 1 {
		t.Fatalf("expected one rewarded item, got %#v", rewards["items"])
	}

	itemDTO := items[0]
	if colorCode, ok := itemDTO["colorCode"].(int); !ok || colorCode != 3 {
		t.Fatalf("expected rewarded item colorCode 3, got %#v", itemDTO["colorCode"])
	}
	if color := questTestInt(itemDTO["color"]); color != 2 {
		t.Fatalf("expected rewarded item display color 2, got %#v", itemDTO["color"])
	}
	if preNameType, ok := itemDTO["preNameType"].(int); !ok || preNameType != 5 {
		t.Fatalf("expected rewarded item preNameType 5, got %#v", itemDTO["preNameType"])
	}
	if q, ok := itemDTO["q"].(int); !ok || q != 10 {
		t.Fatalf("expected rewarded item q 10, got %#v", itemDTO["q"])
	}
	if element, ok := itemDTO["element"].(int); !ok || element < 1 || element > 6 {
		t.Fatalf("expected rewarded item element in [1,6], got %#v", itemDTO["element"])
	}
	if bindBonus := questTestInt(itemDTO["bindMainPropNum1"]); bindBonus < 0 || bindBonus > 22 {
		t.Fatalf("expected rewarded item bindMainPropNum1 in [0,22], got %#v", itemDTO["bindMainPropNum1"])
	}
	if bindBonus := questTestInt(itemDTO["bindMainPropNum2"]); bindBonus < 0 || bindBonus > 22 {
		t.Fatalf("expected rewarded item bindMainPropNum2 in [0,22], got %#v", itemDTO["bindMainPropNum2"])
	}
	if activeProp := questTestInt(itemDTO["activeProp"]); activeProp != 8 {
		t.Fatalf("expected rewarded item activeProp 8, got %#v", itemDTO["activeProp"])
	}
	if activePropNum := questTestInt(itemDTO["activePropNum"]); activePropNum != 5 {
		t.Fatalf("expected rewarded item activePropNum 5, got %#v", itemDTO["activePropNum"])
	}
	assertQuestRewardTypes(t, itemDTO, []int{11, 20, 8, 13})
	assertQuestRewardValues(t, itemDTO, map[int][2]int{
		11: {145, 150},
		20: {58, 60},
		8:  {87, 90},
		13: {43, 45},
	})

	notifiedItems, ok := rewards["notifiedItems"].([]map[string]interface{})
	if !ok || len(notifiedItems) != 1 {
		t.Fatalf("expected one notified item, got %#v", rewards["notifiedItems"])
	}

	notifiedItem := notifiedItems[0]
	if q, ok := notifiedItem["q"].(int); !ok || q != 10 {
		t.Fatalf("expected notified quality 10, got %#v", notifiedItem["q"])
	}
	if color, ok := notifiedItem["c"].(int); !ok || color != 2 {
		t.Fatalf("expected notified display color 2, got %#v", notifiedItem["c"])
	}
	if name, ok := notifiedItem["n"].(string); !ok || name != "Trác Việt Kiếm Thử Nghiệm" {
		t.Fatalf("expected notified name to include Trác Việt prefix, got %#v", notifiedItem["n"])
	}

	persistedItem, err := itemRepo.FindByID(context.Background(), 1)
	if err != nil {
		t.Fatalf("expected persisted reward item, got %v", err)
	}
	if element, ok := persistedItem.Properties["element"].(int); !ok || element < 1 || element > 6 {
		t.Fatalf("expected persisted reward item element in [1,6], got %#v", persistedItem.Properties["element"])
	}
}

func TestApplyRewards_ClassQuestBumpsClassRankAndQuestN(t *testing.T) {
	logger := zap.NewNop()

	startRank := 2
	startQuestN := 4
	char := &domainchar.Character{ID: 1, Level: 20, ClassRank: startRank, QuestN: startQuestN}
	charRepo := &questTestCharacterRepo{char: char}
	itemService := appitem.NewService(newQuestTestItemRepo(), logger)

	manager := gamedata.NewManager(nil, logger)
	questTpl := models.QuestTemplate{ID: 9100, Type: 3, MoneyType: 2}
	if err := manager.GetCache().LoadTable(models.TableQuest, []json.RawMessage{mustQuestJSON(t, questTpl)}); err != nil {
		t.Fatalf("load quest table: %v", err)
	}

	itemService.SetGameDataManager(manager)

	svc := NewService(nil, logger)
	svc.SetGameDataManager(manager)
	svc.SetCharacterRepository(charRepo)
	svc.SetItemService(itemService)

	rewards, err := svc.applyRewards(context.Background(), 1, 9100, 0)
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	if char.ClassRank != startRank+1 {
		t.Fatalf("expected ClassRank %d, got %d", startRank+1, char.ClassRank)
	}
	if char.QuestN != startQuestN+1 {
		t.Fatalf("expected QuestN %d, got %d", startQuestN+1, char.QuestN)
	}

	newCL, ok := rewards["classRankUp"].(int)
	if !ok {
		t.Fatalf("expected rewards[classRankUp] of type int, got %T", rewards["classRankUp"])
	}
	if newCL != startRank+1 {
		t.Fatalf("expected classRankUp = %d, got %d", startRank+1, newCL)
	}

	expectedExp := predef.CalcClassQuestExp(20, startQuestN)
	if got, _ := rewards["exp"].(int64); got != expectedExp {
		t.Fatalf("expected exp = %d (formula with pre-bump QuestN %d), got %d", expectedExp, startQuestN, got)
	}
}

func TestApplyRewards_ClassQuestClampsAtMaxRank(t *testing.T) {
	logger := zap.NewNop()

	char := &domainchar.Character{ID: 1, Level: 20, ClassRank: 5, QuestN: 0}
	charRepo := &questTestCharacterRepo{char: char}
	itemService := appitem.NewService(newQuestTestItemRepo(), logger)

	manager := gamedata.NewManager(nil, logger)
	questTpl := models.QuestTemplate{ID: 9101, Type: 3, MoneyType: 2}
	if err := manager.GetCache().LoadTable(models.TableQuest, []json.RawMessage{mustQuestJSON(t, questTpl)}); err != nil {
		t.Fatalf("load quest table: %v", err)
	}

	itemService.SetGameDataManager(manager)

	svc := NewService(nil, logger)
	svc.SetGameDataManager(manager)
	svc.SetCharacterRepository(charRepo)
	svc.SetItemService(itemService)

	rewards, err := svc.applyRewards(context.Background(), 1, 9101, 0)
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	if char.ClassRank != 5 {
		t.Fatalf("expected ClassRank to stay at 5, got %d", char.ClassRank)
	}
	if _, has := rewards["classRankUp"]; has {
		t.Fatalf("expected no classRankUp key at max rank, got %v", rewards["classRankUp"])
	}
}

func TestApplyRewards_NonClassQuestIncrementsOnlyQuestN(t *testing.T) {
	logger := zap.NewNop()

	char := &domainchar.Character{ID: 1, Level: 5, ClassRank: 1, QuestN: 2}
	charRepo := &questTestCharacterRepo{char: char}
	itemService := appitem.NewService(newQuestTestItemRepo(), logger)

	manager := gamedata.NewManager(nil, logger)
	questTpl := models.QuestTemplate{ID: 9102, Type: 1, AwardExpRe: 100}
	if err := manager.GetCache().LoadTable(models.TableQuest, []json.RawMessage{mustQuestJSON(t, questTpl)}); err != nil {
		t.Fatalf("load quest table: %v", err)
	}

	itemService.SetGameDataManager(manager)

	svc := NewService(nil, logger)
	svc.SetGameDataManager(manager)
	svc.SetCharacterRepository(charRepo)
	svc.SetItemService(itemService)

	rewards, err := svc.applyRewards(context.Background(), 1, 9102, 0)
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	if char.ClassRank != 1 {
		t.Fatalf("expected ClassRank to stay at 1, got %d", char.ClassRank)
	}
	if char.QuestN != 3 {
		t.Fatalf("expected QuestN = 3, got %d", char.QuestN)
	}
	if _, has := rewards["classRankUp"]; has {
		t.Fatalf("expected no classRankUp key for non-class quest, got %v", rewards["classRankUp"])
	}
}

func TestCompleteQuest_RejectsMissingCollectItemsAndResyncsObjectives(t *testing.T) {
	logger := zap.NewNop()
	charRepo := &questTestCharacterRepo{char: &domainchar.Character{ID: 1, Level: 1}}
	itemRepo := newQuestTestItemRepo()
	itemService := appitem.NewService(itemRepo, logger)
	questRepo := newQuestTestQuestRepo()

	progress := &domainquest.QuestProgress{
		CharacterID: 1,
		QuestID:     7001,
		Status:      domainquest.QuestStatusActive,
		Objectives: []domainquest.Objective{{
			Type:     domainquest.ObjectiveCollectItem,
			Target:   30,
			Current:  1,
			Required: 1,
		}},
		StartedAt: time.Now(),
	}
	if err := questRepo.Save(context.Background(), progress); err != nil {
		t.Fatalf("save quest progress: %v", err)
	}

	svc := NewService(questRepo, logger)
	svc.SetCharacterRepository(charRepo)
	svc.SetItemService(itemService)

	if _, _, err := svc.CompleteQuest(context.Background(), 1, 7001); !pkgerrors.Is(err, pkgerrors.ErrInvalidInput) {
		t.Fatalf("expected invalid input when collect item is missing, got %v", err)
	}

	stored, err := questRepo.FindByCharacterAndQuest(context.Background(), 1, 7001)
	if err != nil {
		t.Fatalf("reload quest progress: %v", err)
	}
	if stored.Status != domainquest.QuestStatusActive {
		t.Fatalf("expected quest to remain active, got %d", stored.Status)
	}
	if current := stored.Objectives[0].Current; current != 0 {
		t.Fatalf("expected collect objective to resync to 0, got %d", current)
	}
}

func TestGetActiveQuests_ResyncsCollectObjectivesFromInventory(t *testing.T) {
	logger := zap.NewNop()
	itemRepo := newQuestTestItemRepo()
	itemService := appitem.NewService(itemRepo, logger)
	questRepo := newQuestTestQuestRepo()

	progress := &domainquest.QuestProgress{
		CharacterID: 1,
		QuestID:     7003,
		Status:      domainquest.QuestStatusActive,
		Objectives: []domainquest.Objective{{
			Type:     domainquest.ObjectiveCollectItem,
			Target:   1684,
			Current:  1,
			Required: 1,
		}},
		StartedAt: time.Now(),
	}
	if err := questRepo.Save(context.Background(), progress); err != nil {
		t.Fatalf("save quest progress: %v", err)
	}

	svc := NewService(questRepo, logger)
	svc.SetItemService(itemService)

	active, err := svc.GetActiveQuests(context.Background(), 1)
	if err != nil {
		t.Fatalf("get active quests: %v", err)
	}
	if len(active) != 1 {
		t.Fatalf("expected one active quest, got %d", len(active))
	}
	if current := active[0].Objectives[0].Current; current != 0 {
		t.Fatalf("expected collect objective to resync to 0, got %d", current)
	}
}

func TestCompleteQuest_ConsumesCollectItemsFromQuestBag(t *testing.T) {
	logger := zap.NewNop()
	charRepo := &questTestCharacterRepo{char: &domainchar.Character{ID: 1, Level: 1}}
	itemRepo := newQuestTestItemRepo()
	itemService := appitem.NewService(itemRepo, logger)
	questRepo := newQuestTestQuestRepo()

	manager := gamedata.NewManager(nil, logger)
	questTpl := models.QuestTemplate{ID: 7002, AwardExpRe: 0}
	if err := manager.GetCache().LoadTable(models.TableQuest, []json.RawMessage{mustQuestJSON(t, questTpl)}); err != nil {
		t.Fatalf("load quest table: %v", err)
	}
	itemService.SetGameDataManager(manager)

	progress := &domainquest.QuestProgress{
		CharacterID: 1,
		QuestID:     7002,
		Status:      domainquest.QuestStatusActive,
		Objectives: []domainquest.Objective{{
			Type:     domainquest.ObjectiveCollectItem,
			Target:   30,
			Current:  0,
			Required: 1,
		}},
		StartedAt: time.Now(),
	}
	if err := questRepo.Save(context.Background(), progress); err != nil {
		t.Fatalf("save quest progress: %v", err)
	}

	if _, err := itemService.AddItemToSlot(context.Background(), 1, 30, domainitem.ItemTypeQuest, 1, true, domainitem.SlotTypeQuestBag); err != nil {
		t.Fatalf("add quest bag item: %v", err)
	}

	svc := NewService(questRepo, logger)
	svc.SetCharacterRepository(charRepo)
	svc.SetItemService(itemService)
	svc.SetGameDataManager(manager)

	completed, _, err := svc.CompleteQuest(context.Background(), 1, 7002)
	if err != nil {
		t.Fatalf("complete quest: %v", err)
	}
	if completed.Status != domainquest.QuestStatusCompleted {
		t.Fatalf("expected completed quest status, got %d", completed.Status)
	}

	items, err := itemRepo.FindByCharacterAndSlotType(context.Background(), 1, domainitem.SlotTypeQuestBag)
	if err != nil {
		t.Fatalf("load quest bag items: %v", err)
	}
	for _, it := range items {
		if it.TemplateID == 30 {
			t.Fatalf("expected quest item 30 to be consumed, found %+v", it)
		}
	}
}

func TestCompleteQuest_GrantsRewardExpToActivePet(t *testing.T) {
	logger := zap.NewNop()
	charRepo := &questTestCharacterRepo{char: &domainchar.Character{ID: 1, Level: 1}}
	itemRepo := newQuestTestItemRepo()
	itemService := appitem.NewService(itemRepo, logger)
	questRepo := newQuestTestQuestRepo()
	petRepo := newQuestTestPetRepo(&domainpet.Pet{
		ID:          9,
		CharacterID: 1,
		TemplateID:  700,
		Name:        "Quest Pet",
		Level:       1,
		Life:        10000,
		IsFollowing: true,
		Property:    map[string]interface{}{},
	})
	petService := apppet.NewService(petRepo, logger)

	manager := gamedata.NewManager(nil, logger)
	questTpl := models.QuestTemplate{ID: 7004, AwardExpRe: 20}
	if err := manager.GetCache().LoadTable(models.TableQuest, []json.RawMessage{mustQuestJSON(t, questTpl)}); err != nil {
		t.Fatalf("load quest table: %v", err)
	}

	progress := &domainquest.QuestProgress{
		CharacterID: 1,
		QuestID:     7004,
		Status:      domainquest.QuestStatusActive,
		StartedAt:   time.Now(),
	}
	if err := questRepo.Save(context.Background(), progress); err != nil {
		t.Fatalf("save quest progress: %v", err)
	}

	svc := NewService(questRepo, logger)
	svc.SetCharacterRepository(charRepo)
	svc.SetItemService(itemService)
	svc.SetPetService(petService)
	svc.SetGameDataManager(manager)

	completed, rewards, err := svc.CompleteQuest(context.Background(), 1, 7004)
	if err != nil {
		t.Fatalf("complete quest: %v", err)
	}
	if completed.Status != domainquest.QuestStatusCompleted {
		t.Fatalf("expected completed quest status, got %d", completed.Status)
	}

	storedPet, err := petRepo.FindByID(context.Background(), 9)
	if err != nil {
		t.Fatalf("load rewarded pet: %v", err)
	}
	if storedPet.Experience != 20 {
		t.Fatalf("expected active pet experience 20, got %d", storedPet.Experience)
	}

	activePetReward, ok := rewards["activePet"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected activePet reward payload, got %#v", rewards["activePet"])
	}
	data, ok := activePetReward["data"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected activePet reward data payload, got %#v", activePetReward["data"])
	}
	if exp, ok := data["exp"].(int64); !ok || exp != storedPet.ClientExperience() {
		t.Fatalf("expected activePet exp %d, got %#v", storedPet.ClientExperience(), data["exp"])
	}
}

func TestEnrichQuestDTO_KillQuestUsesCreatureNameForPosition(t *testing.T) {
	logger := zap.NewNop()
	manager := gamedata.NewManager(nil, logger)

	questTpl := models.QuestTemplate{
		ID:        3165,
		Name:      "Nhiem Vu Ren Luyen Cap 5",
		Info:      "Khieu chien Chieu Tai Mao",
		Type:      10,
		StartNPC:  143,
		FinishNPC: 143,
	}
	requireTpl := models.QuestRequireTemplate{
		ID:     1,
		Qid:    3165,
		Kind:   2,
		ItemID: 126,
		Num:    1,
	}
	npcTpl := models.NpcTemplate{
		ID:       143,
		Name:     "NPC Chi Duong",
		PosMapID: 99,
		PosX:     12,
		PosY:     34,
	}
	mapTpl := models.MapTemplate{
		ID:   99,
		Name: "Ban Do Sai",
	}
	creatureTpl := models.CreatureTemplate{
		ID:   126,
		Name: "Chieu Tai Mao",
	}

	if err := manager.GetCache().LoadTable(models.TableQuest, []json.RawMessage{mustQuestJSON(t, questTpl)}); err != nil {
		t.Fatalf("load quest table: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableQuestRequire, []json.RawMessage{mustQuestJSON(t, requireTpl)}); err != nil {
		t.Fatalf("load quest require table: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableNpc, []json.RawMessage{mustQuestJSON(t, npcTpl)}); err != nil {
		t.Fatalf("load npc table: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableMap, []json.RawMessage{mustQuestJSON(t, mapTpl)}); err != nil {
		t.Fatalf("load map table: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableCreature, []json.RawMessage{mustQuestJSON(t, creatureTpl)}); err != nil {
		t.Fatalf("load creature table: %v", err)
	}

	progress := &domainquest.QuestProgress{
		CharacterID: 1,
		QuestID:     3165,
		Status:      domainquest.QuestStatusActive,
		Objectives: []domainquest.Objective{{
			Type:     domainquest.ObjectiveKillMonster,
			Target:   126,
			Required: 1,
			Current:  0,
		}},
		StartedAt: time.Now(),
	}

	svc := NewService(nil, logger)
	svc.SetGameDataManager(manager)

	dto := svc.EnrichQuestDTO(context.Background(), progress)
	pos, ok := dto["pos"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected pos payload, got %#v", dto["pos"])
	}
	if name, ok := pos["name"].(string); !ok || name != "Chieu Tai Mao" {
		t.Fatalf("expected kill quest pos.name to use creature name, got %#v", pos["name"])
	}
}

func mustQuestJSON(t *testing.T, v interface{}) json.RawMessage {
	t.Helper()
	data, err := json.Marshal(v)
	if err != nil {
		t.Fatalf("marshal json: %v", err)
	}
	return data
}

func questTestInt(value interface{}) int {
	switch typed := value.(type) {
	case int:
		return typed
	case int8:
		return int(typed)
	case int16:
		return int(typed)
	case int32:
		return int(typed)
	case int64:
		return int(typed)
	case float32:
		return int(typed)
	case float64:
		return int(typed)
	default:
		return 0
	}
}

func assertQuestRewardTypes(t *testing.T, itemDTO map[string]interface{}, expected []int) {
	t.Helper()
	seen := make(map[int]int, len(expected))
	for _, key := range []string{"mainProp1", "mainProp2", "prop1", "prop2"} {
		seen[questTestInt(itemDTO[key])]++
	}
	for _, expectedType := range expected {
		if seen[expectedType] != 1 {
			t.Fatalf("expected prop type %d to appear exactly once, got item %#v", expectedType, itemDTO)
		}
		delete(seen, expectedType)
	}
	for propType, count := range seen {
		if propType != 0 || count != 0 {
			t.Fatalf("unexpected prop types %#v in item %#v", seen, itemDTO)
		}
	}
}

func TestCanAcceptQuestWithSnapshot_GenderAndPrereqs(t *testing.T) {
	logger := zap.NewNop()

	const (
		genderMale   = 0
		genderFemale = 1
		genderNone   = 2
	)

	type prereq struct {
		kind  int
		quest int
	}

	type seedQuest struct {
		id           int
		minLvl       int
		maxLvl       int
		gender       int
		reqClass     string
		preQuestType int
		isRebirth    int
		prereqs      []prereq
	}

	cases := []struct {
		name      string
		quest     seedQuest
		char      *domainchar.Character
		completed map[int]bool
		want      bool
		reason    string
	}{
		{
			name:  "starter_quest_gender_none_accepted_for_new_char",
			quest: seedQuest{id: 1001, minLvl: 1, maxLvl: 160, gender: genderNone, reqClass: "all", preQuestType: 1},
			char:  &domainchar.Character{ID: 1, Level: 1, Gender: genderMale, ClassID: 1},
			want:  true,
		},
		{
			name:   "gender_mismatch_rejects",
			quest:  seedQuest{id: 1002, minLvl: 1, maxLvl: 160, gender: genderFemale, reqClass: "all", preQuestType: 1},
			char:   &domainchar.Character{ID: 1, Level: 1, Gender: genderMale, ClassID: 1},
			want:   false,
			reason: "Gender requirement not met",
		},
		{
			name:  "gender_male_only_accepts_male",
			quest: seedQuest{id: 1003, minLvl: 1, maxLvl: 160, gender: genderMale, reqClass: "all", preQuestType: 1},
			char:  &domainchar.Character{ID: 1, Level: 1, Gender: genderMale, ClassID: 1},
			want:  true,
		},
		{
			name:   "and_mode_blocks_when_prereq_quest_unfinished",
			quest:  seedQuest{id: 1004, minLvl: 1, maxLvl: 160, gender: genderNone, reqClass: "all", preQuestType: 1, prereqs: []prereq{{kind: 2, quest: 1001}}},
			char:   &domainchar.Character{ID: 1, Level: 1, Gender: genderMale, ClassID: 1},
			want:   false,
			reason: "Required quest not completed",
		},
		{
			name:      "and_mode_passes_when_prereq_quest_finished",
			quest:     seedQuest{id: 1005, minLvl: 1, maxLvl: 160, gender: genderNone, reqClass: "all", preQuestType: 1, prereqs: []prereq{{kind: 2, quest: 1001}}},
			char:      &domainchar.Character{ID: 1, Level: 1, Gender: genderMale, ClassID: 1},
			completed: map[int]bool{1001: true},
			want:      true,
		},
		{
			name:  "pre_quest_type_zero_ignores_quest_prereq",
			quest: seedQuest{id: 1006, minLvl: 1, maxLvl: 160, gender: genderNone, reqClass: "all", preQuestType: 0, prereqs: []prereq{{kind: 2, quest: 1001}}},
			char:  &domainchar.Character{ID: 1, Level: 1, Gender: genderMale, ClassID: 1},
			want:  true,
		},
		{
			name:      "or_mode_accepts_with_any_completed",
			quest:     seedQuest{id: 1007, minLvl: 1, maxLvl: 160, gender: genderNone, reqClass: "all", preQuestType: 2, prereqs: []prereq{{kind: 2, quest: 1001}, {kind: 2, quest: 9999}}},
			char:      &domainchar.Character{ID: 1, Level: 1, Gender: genderMale, ClassID: 1},
			completed: map[int]bool{1001: true},
			want:      true,
		},
		{
			name:   "or_mode_rejects_with_none_completed",
			quest:  seedQuest{id: 1008, minLvl: 1, maxLvl: 160, gender: genderNone, reqClass: "all", preQuestType: 2, prereqs: []prereq{{kind: 2, quest: 1001}, {kind: 2, quest: 9999}}},
			char:   &domainchar.Character{ID: 1, Level: 1, Gender: genderMale, ClassID: 1},
			want:   false,
			reason: "Required quest not completed",
		},
		{
			name:   "class_restriction_rejects_other_class",
			quest:  seedQuest{id: 1009, minLvl: 1, maxLvl: 160, gender: genderNone, reqClass: "|1|", preQuestType: 1},
			char:   &domainchar.Character{ID: 1, Level: 1, Gender: genderMale, ClassID: 2},
			want:   false,
			reason: "Class requirement not met",
		},
	}

	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			manager := gamedata.NewManager(nil, logger)
			questTpl := models.QuestTemplate{
				ID:           int64(tc.quest.id),
				MinLevel:     float64(tc.quest.minLvl),
				MaxLevel:     float64(tc.quest.maxLvl),
				Gender:       float64(tc.quest.gender),
				ReqClass:     tc.quest.reqClass,
				PreQuestType: float64(tc.quest.preQuestType),
				IsRebirth:    float64(tc.quest.isRebirth),
			}
			if err := manager.GetCache().LoadTable(models.TableQuest, []json.RawMessage{mustQuestJSON(t, questTpl)}); err != nil {
				t.Fatalf("load quest table: %v", err)
			}
			if len(tc.quest.prereqs) > 0 {
				rows := make([]json.RawMessage, 0, len(tc.quest.prereqs))
				for i, p := range tc.quest.prereqs {
					rows = append(rows, mustQuestJSON(t, models.QuestPreTemplate{
						ID:     int64(tc.quest.id*100 + i),
						Qid:    float64(tc.quest.id),
						Kind:   float64(p.kind),
						ItemID: float64(p.quest),
					}))
				}
				if err := manager.GetCache().LoadTable(models.TableQuestPre, rows); err != nil {
					t.Fatalf("load quest pre table: %v", err)
				}
			}

			svc := NewService(nil, logger)
			svc.SetGameDataManager(manager)

			tpl := manager.GetQuest(tc.quest.id)
			if tpl == nil {
				t.Fatalf("quest template %d not loaded", tc.quest.id)
			}

			ok, reason := svc.CanAcceptQuestWithSnapshot(context.Background(), tc.char, tpl, nil, tc.completed)
			if ok != tc.want {
				t.Fatalf("CanAcceptQuestWithSnapshot() = (%v, %q), want %v", ok, reason, tc.want)
			}
			if !tc.want && tc.reason != "" && reason != tc.reason {
				t.Fatalf("reason = %q, want %q", reason, tc.reason)
			}
		})
	}
}

func assertQuestRewardValues(t *testing.T, itemDTO map[string]interface{}, expected map[int][2]int) {
	t.Helper()
	for _, pair := range [][2]string{{"mainProp1", "mainPropNum1"}, {"mainProp2", "mainPropNum2"}, {"prop1", "propNum1"}, {"prop2", "propNum2"}} {
		propType := questTestInt(itemDTO[pair[0]])
		bounds, ok := expected[propType]
		if !ok {
			t.Fatalf("unexpected prop type %d in item %#v", propType, itemDTO)
		}
		value := questTestInt(itemDTO[pair[1]])
		if value < bounds[0] || value > bounds[1] {
			t.Fatalf("expected %s for prop type %d in [%d,%d], got %#v", pair[1], propType, bounds[0], bounds[1], itemDTO[pair[1]])
		}
	}
}

func TestGetInitialObjectives_MapsAllRequireKinds(t *testing.T) {
	logger := zap.NewNop()
	manager := gamedata.NewManager(nil, logger)

	rows := []models.QuestRequireTemplate{
		{ID: 1, Qid: 8001, Kind: 1, Type: 29, ItemID: 100, Num: 3, Q: -1},
		{ID: 2, Qid: 8001, Kind: 1, Type: 19, ItemID: 200, Num: 1, Q: 10},
		{ID: 3, Qid: 8001, Kind: 2, Type: 12, ItemID: 300, Num: 2, Q: 0},
		{ID: 4, Qid: 8001, Kind: 3, Type: 12, ItemID: 400, Num: 1, Q: 12},
	}
	rawRows := make([]json.RawMessage, 0, len(rows))
	for _, r := range rows {
		rawRows = append(rawRows, mustQuestJSON(t, r))
	}
	if err := manager.GetCache().LoadTable(models.TableQuestRequire, rawRows); err != nil {
		t.Fatalf("load quest require: %v", err)
	}

	svc := NewService(nil, logger)
	svc.SetGameDataManager(manager)

	objectives := svc.GetInitialObjectives(8001)
	if len(objectives) != 4 {
		t.Fatalf("expected 4 objectives, got %d", len(objectives))
	}

	byTarget := make(map[int]domainquest.Objective, len(objectives))
	for _, obj := range objectives {
		byTarget[obj.Target] = obj
	}

	cases := []struct {
		name      string
		target    int
		objType   domainquest.ObjectiveType
		tableType int
		quality   int
		required  int
	}{
		{"collect_item", 100, domainquest.ObjectiveCollectItem, domainquest.TableIDItemTemplate, -1, 3},
		{"collect_equip", 200, domainquest.ObjectiveCollectItem, domainquest.TableIDEquiptTemplate, 10, 1},
		{"kill_creature", 300, domainquest.ObjectiveKillMonster, 0, 0, 2},
		{"submit_pet", 400, domainquest.ObjectiveSubmitPet, 0, 12, 1},
	}
	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			obj, ok := byTarget[tc.target]
			if !ok {
				t.Fatalf("no objective for target %d", tc.target)
			}
			if obj.Type != tc.objType {
				t.Fatalf("Type = %d, want %d", obj.Type, tc.objType)
			}
			if obj.ItemTableType != tc.tableType {
				t.Fatalf("ItemTableType = %d, want %d", obj.ItemTableType, tc.tableType)
			}
			if obj.Quality != tc.quality {
				t.Fatalf("Quality = %d, want %d", obj.Quality, tc.quality)
			}
			if obj.Required != tc.required {
				t.Fatalf("Required = %d, want %d", obj.Required, tc.required)
			}
		})
	}
}

func TestCanAcceptQuest_ItemPrereqFiltersByTableType(t *testing.T) {
	logger := zap.NewNop()
	manager := gamedata.NewManager(nil, logger)

	questTpl := models.QuestTemplate{ID: 8100, MinLevel: 1, MaxLevel: 99, Gender: 2, ReqClass: "all"}
	preTpl := models.QuestPreTemplate{ID: 1, Qid: 8100, Kind: 1, Type: 29, ItemID: 555, Num: 1}
	itemTpl := models.ItemTemplateTemplate{ID: 555, Name: "Quest Token", Kind: 1}
	equipTpl := models.EquiptTemplateTemplate{ID: 555, Name: "Confusing Sword", Kind: 1, EndureMax: 60}
	if err := manager.GetCache().LoadTable(models.TableQuest, []json.RawMessage{mustQuestJSON(t, questTpl)}); err != nil {
		t.Fatalf("load quest: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableQuestPre, []json.RawMessage{mustQuestJSON(t, preTpl)}); err != nil {
		t.Fatalf("load quest pre: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableItemTemplate, []json.RawMessage{mustQuestJSON(t, itemTpl)}); err != nil {
		t.Fatalf("load item template: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{mustQuestJSON(t, equipTpl)}); err != nil {
		t.Fatalf("load equip template: %v", err)
	}

	itemRepo := newQuestTestItemRepo()
	itemService := appitem.NewService(itemRepo, logger)
	itemService.SetGameDataManager(manager)
	if _, err := itemService.AddItemToSlot(context.Background(), 1, 555, domainitem.ItemTypeEquipment, 1, false, domainitem.SlotTypeBag); err != nil {
		t.Fatalf("add equipment: %v", err)
	}

	svc := NewService(nil, logger)
	svc.SetGameDataManager(manager)
	svc.SetItemService(itemService)
	tpl := manager.GetQuest(8100)
	char := &domainchar.Character{ID: 1, Level: 5, Gender: 0, ClassID: 1}

	ok, reason := svc.CanAcceptQuestWithSnapshot(context.Background(), char, tpl, nil, nil)
	if ok {
		t.Fatalf("expected equipment to NOT satisfy TBL_ITEM_TEMPLATE (29) prereq, got accept (%q)", reason)
	}

	if _, err := itemService.AddItemToSlot(context.Background(), 1, 555, domainitem.ItemTypeConsumable, 1, false, domainitem.SlotTypeBag); err != nil {
		t.Fatalf("add consumable: %v", err)
	}
	if ok, reason := svc.CanAcceptQuestWithSnapshot(context.Background(), char, tpl, nil, nil); !ok {
		t.Fatalf("expected accept after adding consumable, got reject %q", reason)
	}
}

func TestCompleteQuest_SubmitPetConsumesLowestQualifyingPet(t *testing.T) {
	logger := zap.NewNop()
	charRepo := &questTestCharacterRepo{char: &domainchar.Character{ID: 1, Level: 1}}
	questRepo := newQuestTestQuestRepo()

	manager := gamedata.NewManager(nil, logger)
	questTpl := models.QuestTemplate{ID: 8200}
	creatureTpl := models.CreatureTemplate{ID: 700, Name: "Hắc Linh Lang"}
	if err := manager.GetCache().LoadTable(models.TableQuest, []json.RawMessage{mustQuestJSON(t, questTpl)}); err != nil {
		t.Fatalf("load quest: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableCreature, []json.RawMessage{mustQuestJSON(t, creatureTpl)}); err != nil {
		t.Fatalf("load creature: %v", err)
	}

	whitePet := &domainpet.Pet{ID: 10, CharacterID: 1, TemplateID: 700, Name: "Hắc Linh Lang", Level: 1, GrowRate: 1.0, Life: 10000, Property: map[string]interface{}{}}
	bluePet := &domainpet.Pet{ID: 11, CharacterID: 1, TemplateID: 700, Name: "Hắc Linh Lang", Level: 1, GrowRate: 1.6, Life: 10000, Property: map[string]interface{}{}}
	purplePet := &domainpet.Pet{ID: 12, CharacterID: 1, TemplateID: 700, Name: "Hắc Linh Lang", Level: 1, GrowRate: 2.0, Life: 10000, Property: map[string]interface{}{}}
	renamedPet := &domainpet.Pet{ID: 13, CharacterID: 1, TemplateID: 700, Name: "Tiểu Hắc", Level: 1, GrowRate: 2.5, Life: 10000, Property: map[string]interface{}{}}
	petRepo := newQuestTestPetRepo(whitePet, bluePet, purplePet, renamedPet)
	petService := apppet.NewService(petRepo, logger)
	petService.SetGameDataManager(manager)
	itemService := appitem.NewService(newQuestTestItemRepo(), logger)
	itemService.SetGameDataManager(manager)

	progress := &domainquest.QuestProgress{
		CharacterID: 1,
		QuestID:     8200,
		Status:      domainquest.QuestStatusActive,
		Objectives: []domainquest.Objective{{
			Type:     domainquest.ObjectiveSubmitPet,
			Target:   700,
			Required: 1,
			Quality:  10,
		}},
		StartedAt: time.Now(),
	}
	if err := questRepo.Save(context.Background(), progress); err != nil {
		t.Fatalf("save quest: %v", err)
	}

	svc := NewService(questRepo, logger)
	svc.SetGameDataManager(manager)
	svc.SetCharacterRepository(charRepo)
	svc.SetItemService(itemService)
	svc.SetPetService(petService)

	completed, rewards, err := svc.CompleteQuest(context.Background(), 1, 8200)
	if err != nil {
		t.Fatalf("complete quest: %v", err)
	}
	if completed.Status != domainquest.QuestStatusCompleted {
		t.Fatalf("expected completed status, got %d", completed.Status)
	}

	consumed, ok := rewards["consumedPets"].([]int64)
	if !ok || len(consumed) != 1 {
		t.Fatalf("expected one consumed pet, got %#v", rewards["consumedPets"])
	}
	if consumed[0] != whitePet.ID {
		t.Fatalf("expected lowest-growRate white pet (%d) consumed, got %d", whitePet.ID, consumed[0])
	}
	if _, err := petRepo.FindByID(context.Background(), whitePet.ID); !errors.Is(err, pkgerrors.ErrNotFound) {
		t.Fatalf("expected white pet deleted, got %v", err)
	}
	if _, err := petRepo.FindByID(context.Background(), renamedPet.ID); err != nil {
		t.Fatalf("expected renamed pet preserved, got %v", err)
	}
}

func TestCompleteQuest_SubmitPetRejectsWhenNoneQualify(t *testing.T) {
	logger := zap.NewNop()
	charRepo := &questTestCharacterRepo{char: &domainchar.Character{ID: 1, Level: 1}}
	questRepo := newQuestTestQuestRepo()

	manager := gamedata.NewManager(nil, logger)
	questTpl := models.QuestTemplate{ID: 8201}
	creatureTpl := models.CreatureTemplate{ID: 701, Name: "Bạch Hồ"}
	if err := manager.GetCache().LoadTable(models.TableQuest, []json.RawMessage{mustQuestJSON(t, questTpl)}); err != nil {
		t.Fatalf("load quest: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableCreature, []json.RawMessage{mustQuestJSON(t, creatureTpl)}); err != nil {
		t.Fatalf("load creature: %v", err)
	}

	weakPet := &domainpet.Pet{ID: 30, CharacterID: 1, TemplateID: 701, Name: "Bạch Hồ", Level: 1, GrowRate: 1.0, Life: 10000, Property: map[string]interface{}{}}
	petRepo := newQuestTestPetRepo(weakPet)
	petService := apppet.NewService(petRepo, logger)
	petService.SetGameDataManager(manager)
	itemService := appitem.NewService(newQuestTestItemRepo(), logger)
	itemService.SetGameDataManager(manager)

	progress := &domainquest.QuestProgress{
		CharacterID: 1,
		QuestID:     8201,
		Status:      domainquest.QuestStatusActive,
		Objectives: []domainquest.Objective{{
			Type:     domainquest.ObjectiveSubmitPet,
			Target:   701,
			Required: 1,
			Quality:  20,
		}},
		StartedAt: time.Now(),
	}
	if err := questRepo.Save(context.Background(), progress); err != nil {
		t.Fatalf("save quest: %v", err)
	}

	svc := NewService(questRepo, logger)
	svc.SetGameDataManager(manager)
	svc.SetCharacterRepository(charRepo)
	svc.SetItemService(itemService)
	svc.SetPetService(petService)

	if _, _, err := svc.CompleteQuest(context.Background(), 1, 8201); !pkgerrors.Is(err, pkgerrors.ErrInvalidInput) {
		t.Fatalf("expected invalid input when no pet qualifies, got %v", err)
	}
	if _, err := petRepo.FindByID(context.Background(), weakPet.ID); err != nil {
		t.Fatalf("expected weak pet preserved on failed completion, got %v", err)
	}
}

func TestEnrichQuestDTO_EmitsPetAndEquipmentRequirements(t *testing.T) {
	logger := zap.NewNop()
	manager := gamedata.NewManager(nil, logger)

	questTpl := models.QuestTemplate{ID: 8300, FinishNPC: 0}
	creatureTpl := models.CreatureTemplate{ID: 900, Name: "Phụng Tinh"}
	equipTpl := models.EquiptTemplateTemplate{ID: 800, Name: "Đoạn Kiếm Cổ", Kind: 1}
	if err := manager.GetCache().LoadTable(models.TableQuest, []json.RawMessage{mustQuestJSON(t, questTpl)}); err != nil {
		t.Fatalf("load quest: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableCreature, []json.RawMessage{mustQuestJSON(t, creatureTpl)}); err != nil {
		t.Fatalf("load creature: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{mustQuestJSON(t, equipTpl)}); err != nil {
		t.Fatalf("load equipment: %v", err)
	}

	progress := &domainquest.QuestProgress{
		CharacterID: 1,
		QuestID:     8300,
		Status:      domainquest.QuestStatusActive,
		Objectives: []domainquest.Objective{
			{Type: domainquest.ObjectiveCollectItem, Target: 800, Required: 1, ItemTableType: domainquest.TableIDEquiptTemplate, Quality: 0},
			{Type: domainquest.ObjectiveKillMonster, Target: 900, Required: 3},
			{Type: domainquest.ObjectiveSubmitPet, Target: 900, Required: 1, Quality: 12},
		},
		StartedAt: time.Now(),
	}

	svc := NewService(nil, logger)
	svc.SetGameDataManager(manager)

	dto := svc.EnrichQuestDTO(context.Background(), progress)
	require, ok := dto["require"].([]map[string]interface{})
	if !ok || len(require) != 3 {
		t.Fatalf("expected 3 require entries, got %#v", dto["require"])
	}

	type expected struct {
		kind     int
		typ      int
		quality  int
		name     string
		hasCreat bool
	}
	expectations := []expected{
		{kind: 1, typ: 19, quality: 0, name: "Đoạn Kiếm Cổ"},
		{kind: 2, typ: 12, quality: 0, name: "Phụng Tinh", hasCreat: true},
		{kind: 3, typ: 12, quality: 12, name: "Phụng Tinh", hasCreat: true},
	}
	for i, exp := range expectations {
		entry := require[i]
		if questTestInt(entry["kind"]) != exp.kind {
			t.Fatalf("entry %d kind = %v, want %d", i, entry["kind"], exp.kind)
		}
		if questTestInt(entry["type"]) != exp.typ {
			t.Fatalf("entry %d type = %v, want %d", i, entry["type"], exp.typ)
		}
		if questTestInt(entry["q"]) != exp.quality {
			t.Fatalf("entry %d q = %v, want %d", i, entry["q"], exp.quality)
		}
		if name, _ := entry["name"].(string); name != exp.name {
			t.Fatalf("entry %d name = %q, want %q", i, name, exp.name)
		}
		if exp.hasCreat {
			if _, ok := entry["creature"].(map[string]interface{}); !ok {
				t.Fatalf("entry %d expected creature payload, got %#v", i, entry["creature"])
			}
		}
	}

	if questKill, ok := dto["questKill"].([]map[string]interface{}); !ok || len(questKill) != 1 {
		t.Fatalf("expected one questKill row (kill objective only), got %#v", dto["questKill"])
	}
}

func TestCompleteQuest_EquipmentObjectiveRejectsWrongColor(t *testing.T) {
	logger := zap.NewNop()
	manager := gamedata.NewManager(nil, logger)
	equipTpl := models.EquiptTemplateTemplate{ID: 850, Name: "Cổ Đao Bụi", Kind: 1, EndureMax: 50}
	if err := manager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{mustQuestJSON(t, equipTpl)}); err != nil {
		t.Fatalf("load equip: %v", err)
	}
	questTpl := models.QuestTemplate{ID: 8500}
	if err := manager.GetCache().LoadTable(models.TableQuest, []json.RawMessage{mustQuestJSON(t, questTpl)}); err != nil {
		t.Fatalf("load quest: %v", err)
	}

	itemRepo := newQuestTestItemRepo()
	itemService := appitem.NewService(itemRepo, logger)
	itemService.SetGameDataManager(manager)
	charRepo := &questTestCharacterRepo{char: &domainchar.Character{ID: 1, Level: 1}}

	// Add a colorCode=0 (white) equipment when the objective wants quality 10 (colorCode 2 / blue).
	if _, err := itemService.AddItemWithBindAndColor(context.Background(), 1, 850, domainitem.ItemTypeEquipment, 1, false, 0); err != nil {
		t.Fatalf("add wrong-color equipment: %v", err)
	}

	questRepo := newQuestTestQuestRepo()
	progress := &domainquest.QuestProgress{
		CharacterID: 1,
		QuestID:     8500,
		Status:      domainquest.QuestStatusActive,
		Objectives: []domainquest.Objective{{
			Type:          domainquest.ObjectiveCollectItem,
			Target:        850,
			Required:      1,
			ItemTableType: domainquest.TableIDEquiptTemplate,
			Quality:       10,
			Current:       1,
		}},
		StartedAt: time.Now(),
	}
	if err := questRepo.Save(context.Background(), progress); err != nil {
		t.Fatalf("save quest: %v", err)
	}

	svc := NewService(questRepo, logger)
	svc.SetGameDataManager(manager)
	svc.SetCharacterRepository(charRepo)
	svc.SetItemService(itemService)

	if _, _, err := svc.CompleteQuest(context.Background(), 1, 8500); !pkgerrors.Is(err, pkgerrors.ErrInvalidInput) {
		t.Fatalf("expected invalid input when equipment color does not match quality 10, got %v", err)
	}

	// Add the right-color equipment and retry.
	expectedColor := domainitem.EquipmentColorCodeFromQuality(10)
	if _, err := itemService.AddItemWithBindAndColor(context.Background(), 1, 850, domainitem.ItemTypeEquipment, 1, false, expectedColor); err != nil {
		t.Fatalf("add matching equipment: %v", err)
	}
	if _, _, err := svc.CompleteQuest(context.Background(), 1, 8500); err != nil {
		t.Fatalf("expected completion with matching-color equipment, got %v", err)
	}
}

func TestGetActiveQuests_SyncsSubmitPetObjective(t *testing.T) {
	logger := zap.NewNop()

	manager := gamedata.NewManager(nil, logger)
	creatureTpl := models.CreatureTemplate{ID: 950, Name: "Thần Long"}
	if err := manager.GetCache().LoadTable(models.TableCreature, []json.RawMessage{mustQuestJSON(t, creatureTpl)}); err != nil {
		t.Fatalf("load creature: %v", err)
	}

	pet := &domainpet.Pet{ID: 50, CharacterID: 1, TemplateID: 950, Name: "Thần Long", Level: 1, GrowRate: 1.7, Life: 10000, Property: map[string]interface{}{}}
	petRepo := newQuestTestPetRepo(pet)
	petService := apppet.NewService(petRepo, logger)
	petService.SetGameDataManager(manager)
	itemService := appitem.NewService(newQuestTestItemRepo(), logger)
	itemService.SetGameDataManager(manager)
	questRepo := newQuestTestQuestRepo()

	progress := &domainquest.QuestProgress{
		CharacterID: 1,
		QuestID:     8400,
		Status:      domainquest.QuestStatusActive,
		Objectives: []domainquest.Objective{{
			Type:     domainquest.ObjectiveSubmitPet,
			Target:   950,
			Required: 1,
			Quality:  15,
			Current:  0,
		}},
		StartedAt: time.Now(),
	}
	if err := questRepo.Save(context.Background(), progress); err != nil {
		t.Fatalf("save quest: %v", err)
	}

	svc := NewService(questRepo, logger)
	svc.SetGameDataManager(manager)
	svc.SetItemService(itemService)
	svc.SetPetService(petService)

	active, err := svc.GetActiveQuests(context.Background(), 1)
	if err != nil {
		t.Fatalf("get active quests: %v", err)
	}
	if len(active) != 1 {
		t.Fatalf("expected 1 active quest, got %d", len(active))
	}
	if current := active[0].Objectives[0].Current; current != 1 {
		t.Fatalf("expected pet objective synced to 1, got %d", current)
	}
}
