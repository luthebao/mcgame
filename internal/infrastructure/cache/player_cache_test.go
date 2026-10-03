// Open-sourced by BaoLT

// Unit tests for PlayerCache manager functionality.
// Tests LoadPlayer, SavePlayer, SaveAndEvict, SaveAllDirty operations.
// Uses mock repositories to verify cache behavior without database.
package cache

import (
	"context"
	"errors"
	"sync"
	"testing"

	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/item"
	"mcgame-server/internal/domain/pet"
	"mcgame-server/internal/domain/quest"
	"mcgame-server/internal/domain/skill"

	"github.com/google/uuid"
	"go.uber.org/zap/zaptest"
)

type mockCharacterRepo struct {
	characters map[int64]*character.Character
	mu         sync.RWMutex
	updateErr  error
}

func newMockCharacterRepo() *mockCharacterRepo {
	return &mockCharacterRepo{
		characters: make(map[int64]*character.Character),
	}
}

func (r *mockCharacterRepo) FindByID(ctx context.Context, id int64) (*character.Character, error) {
	r.mu.RLock()
	defer r.mu.RUnlock()
	if c, ok := r.characters[id]; ok {
		return c, nil
	}
	return nil, nil
}

func (r *mockCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*character.Character, error) {
	return nil, nil
}

func (r *mockCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*character.Character, error) {
	return nil, nil
}

func (r *mockCharacterRepo) FindByName(ctx context.Context, name string) (*character.Character, error) {
	return nil, nil
}

func (r *mockCharacterRepo) Create(ctx context.Context, c *character.Character) error {
	r.mu.Lock()
	defer r.mu.Unlock()
	c.ID = int64(len(r.characters) + 1)
	r.characters[c.ID] = c
	return nil
}

func (r *mockCharacterRepo) Update(ctx context.Context, c *character.Character) error {
	if r.updateErr != nil {
		return r.updateErr
	}
	r.mu.Lock()
	defer r.mu.Unlock()
	r.characters[c.ID] = c
	return nil
}

func (r *mockCharacterRepo) Delete(ctx context.Context, id int64) error {
	r.mu.Lock()
	defer r.mu.Unlock()
	delete(r.characters, id)
	return nil
}

func (r *mockCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}

func (r *mockCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos character.Position) error {
	return nil
}

func (r *mockCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

type mockItemRepo struct {
	items         map[int64]*item.Item
	mu            sync.RWMutex
	updateErr     error
	deleteErr     error
	enforceUnique bool
}

func newMockItemRepo() *mockItemRepo {
	return &mockItemRepo{
		items: make(map[int64]*item.Item),
	}
}

func (r *mockItemRepo) FindByID(ctx context.Context, id int64) (*item.Item, error) {
	r.mu.RLock()
	defer r.mu.RUnlock()
	if it, ok := r.items[id]; ok {
		return it, nil
	}
	return nil, nil
}

func (r *mockItemRepo) FindByCharacterID(ctx context.Context, charID int64) ([]*item.Item, error) {
	r.mu.RLock()
	defer r.mu.RUnlock()
	var result []*item.Item
	for _, it := range r.items {
		if it.CharacterID == charID {
			result = append(result, it)
		}
	}
	return result, nil
}

func (r *mockItemRepo) FindByCharacterAndSlotType(ctx context.Context, charID int64, slotType item.SlotType) ([]*item.Item, error) {
	return nil, nil
}

func (r *mockItemRepo) FindEquipped(ctx context.Context, charID int64) ([]*item.Item, error) {
	return nil, nil
}

func (r *mockItemRepo) Create(ctx context.Context, it *item.Item) error {
	r.mu.Lock()
	defer r.mu.Unlock()
	it.ID = int64(len(r.items) + 1)
	r.items[it.ID] = it
	return nil
}

func (r *mockItemRepo) Update(ctx context.Context, it *item.Item) error {
	if r.updateErr != nil {
		return r.updateErr
	}
	r.mu.Lock()
	defer r.mu.Unlock()
	if r.enforceUnique {
		for id, existing := range r.items {
			if id == it.ID {
				continue
			}
			if existing.CharacterID == it.CharacterID && existing.SlotType == it.SlotType && existing.SlotIndex == it.SlotIndex {
				return errors.New("failed to update item: ERROR: duplicate key value violates unique constraint \"character_items_character_id_slot_type_slot_index_key\" (SQLSTATE 23505)")
			}
		}
	}
	r.items[it.ID] = it
	return nil
}

func (r *mockItemRepo) Delete(ctx context.Context, id int64) error {
	if r.deleteErr != nil {
		return r.deleteErr
	}
	r.mu.Lock()
	defer r.mu.Unlock()
	delete(r.items, id)
	return nil
}

func (r *mockItemRepo) DeleteByCharacterID(ctx context.Context, charID int64) error {
	return nil
}

func (r *mockItemRepo) FindBySlot(ctx context.Context, charID int64, slotType item.SlotType, slotIndex int) (*item.Item, error) {
	return nil, nil
}

func (r *mockItemRepo) MoveItem(ctx context.Context, id int64, slotType item.SlotType, slotIndex int) error {
	return nil
}

func (r *mockItemRepo) UpdateStack(ctx context.Context, id int64, stackCount int) error {
	return nil
}

func (r *mockItemRepo) FindFirstEmptySlot(ctx context.Context, charID int64, slotType item.SlotType, maxSlots int) (int, error) {
	return 0, nil
}

func (r *mockItemRepo) CountBySlotType(ctx context.Context, charID int64, slotType item.SlotType) (int, error) {
	return 0, nil
}

type mockSkillRepo struct {
	skills    map[int64]*skill.CharacterSkill
	mu        sync.RWMutex
	updateErr error
}

func newMockSkillRepo() *mockSkillRepo {
	return &mockSkillRepo{
		skills: make(map[int64]*skill.CharacterSkill),
	}
}

func (r *mockSkillRepo) FindByID(ctx context.Context, id int64) (*skill.CharacterSkill, error) {
	r.mu.RLock()
	defer r.mu.RUnlock()
	if sk, ok := r.skills[id]; ok {
		return sk, nil
	}
	return nil, nil
}

func (r *mockSkillRepo) FindByCharacterID(ctx context.Context, charID int64) ([]*skill.CharacterSkill, error) {
	r.mu.RLock()
	defer r.mu.RUnlock()
	var result []*skill.CharacterSkill
	for _, sk := range r.skills {
		if sk.CharacterID == charID {
			result = append(result, sk)
		}
	}
	return result, nil
}

func (r *mockSkillRepo) FindByCharacterAndSkill(ctx context.Context, charID int64, skillID int) (*skill.CharacterSkill, error) {
	r.mu.RLock()
	defer r.mu.RUnlock()
	for _, sk := range r.skills {
		if sk.CharacterID == charID && sk.SkillID == skillID {
			return sk, nil
		}
	}
	return nil, nil
}

func (r *mockSkillRepo) FindBySlot(ctx context.Context, charID int64, slot int) (*skill.CharacterSkill, error) {
	r.mu.RLock()
	defer r.mu.RUnlock()
	for _, sk := range r.skills {
		if sk.CharacterID == charID && sk.SlotPosition != nil && *sk.SlotPosition == slot {
			return sk, nil
		}
	}
	return nil, nil
}

func (r *mockSkillRepo) Create(ctx context.Context, sk *skill.CharacterSkill) error {
	r.mu.Lock()
	defer r.mu.Unlock()
	sk.ID = int64(len(r.skills) + 1)
	r.skills[sk.ID] = sk
	return nil
}

func (r *mockSkillRepo) Update(ctx context.Context, sk *skill.CharacterSkill) error {
	if r.updateErr != nil {
		return r.updateErr
	}
	r.mu.Lock()
	defer r.mu.Unlock()
	r.skills[sk.ID] = sk
	return nil
}

func (r *mockSkillRepo) Delete(ctx context.Context, id int64) error {
	r.mu.Lock()
	defer r.mu.Unlock()
	delete(r.skills, id)
	return nil
}

func (r *mockSkillRepo) UpdateSlot(ctx context.Context, id int64, slot *int) error {
	return nil
}

func (r *mockSkillRepo) UpdateCooldown(ctx context.Context, id int64, cooldownEnd *string) error {
	return nil
}

func (r *mockSkillRepo) HasSkill(ctx context.Context, charID int64, skillID int) (bool, error) {
	r.mu.RLock()
	defer r.mu.RUnlock()
	for _, sk := range r.skills {
		if sk.CharacterID == charID && sk.SkillID == skillID {
			return true, nil
		}
	}
	return false, nil
}

type mockPetRepo struct {
	pets      map[int64]*pet.Pet
	mu        sync.RWMutex
	updateErr error
}

func newMockPetRepo() *mockPetRepo {
	return &mockPetRepo{
		pets: make(map[int64]*pet.Pet),
	}
}

func (r *mockPetRepo) FindByID(ctx context.Context, id int64) (*pet.Pet, error) {
	r.mu.RLock()
	defer r.mu.RUnlock()
	if p, ok := r.pets[id]; ok {
		return p, nil
	}
	return nil, nil
}

func (r *mockPetRepo) FindByCharacterID(ctx context.Context, charID int64) ([]*pet.Pet, error) {
	r.mu.RLock()
	defer r.mu.RUnlock()
	var result []*pet.Pet
	for _, p := range r.pets {
		if p.CharacterID == charID {
			result = append(result, p)
		}
	}
	return result, nil
}

func (r *mockPetRepo) FindFollowingPet(ctx context.Context, charID int64) (*pet.Pet, error) {
	return nil, nil
}

func (r *mockPetRepo) Save(ctx context.Context, p *pet.Pet) error {
	if r.updateErr != nil {
		return r.updateErr
	}
	r.mu.Lock()
	defer r.mu.Unlock()
	if p.ID == 0 {
		p.ID = int64(len(r.pets) + 1)
	}
	r.pets[p.ID] = p
	return nil
}

func (r *mockPetRepo) Delete(ctx context.Context, id int64) error {
	r.mu.Lock()
	defer r.mu.Unlock()
	delete(r.pets, id)
	return nil
}

func (r *mockPetRepo) Count(ctx context.Context, charID int64) (int, error) {
	return 0, nil
}

func (r *mockPetRepo) UpdateFollowState(ctx context.Context, petID int64, isFollowing bool) error {
	return nil
}

func (r *mockPetRepo) ClearFollowing(ctx context.Context, charID int64) error {
	return nil
}

type mockQuestRepo struct {
	quests    map[int64]*quest.QuestProgress
	mu        sync.RWMutex
	updateErr error
}

func newMockQuestRepo() *mockQuestRepo {
	return &mockQuestRepo{
		quests: make(map[int64]*quest.QuestProgress),
	}
}

func (r *mockQuestRepo) FindByID(ctx context.Context, id int64) (*quest.QuestProgress, error) {
	r.mu.RLock()
	defer r.mu.RUnlock()
	if q, ok := r.quests[id]; ok {
		return q, nil
	}
	return nil, nil
}

func (r *mockQuestRepo) FindByCharacterAndQuest(ctx context.Context, charID int64, questID int) (*quest.QuestProgress, error) {
	return nil, nil
}

func (r *mockQuestRepo) FindActiveByCharacter(ctx context.Context, charID int64) ([]*quest.QuestProgress, error) {
	return nil, nil
}

func (r *mockQuestRepo) FindCompletedByCharacter(ctx context.Context, charID int64) ([]*quest.QuestProgress, error) {
	return nil, nil
}

func (r *mockQuestRepo) FindAllByCharacter(ctx context.Context, charID int64) ([]*quest.QuestProgress, error) {
	r.mu.RLock()
	defer r.mu.RUnlock()
	var result []*quest.QuestProgress
	for _, q := range r.quests {
		if q.CharacterID == charID {
			result = append(result, q)
		}
	}
	return result, nil
}

func (r *mockQuestRepo) Save(ctx context.Context, q *quest.QuestProgress) error {
	r.mu.Lock()
	defer r.mu.Unlock()
	if q.ID == 0 {
		q.ID = int64(len(r.quests) + 1)
	}
	r.quests[q.ID] = q
	return nil
}

func (r *mockQuestRepo) Update(ctx context.Context, q *quest.QuestProgress) error {
	if r.updateErr != nil {
		return r.updateErr
	}
	r.mu.Lock()
	defer r.mu.Unlock()
	r.quests[q.ID] = q
	return nil
}

func (r *mockQuestRepo) Delete(ctx context.Context, id int64) error {
	r.mu.Lock()
	defer r.mu.Unlock()
	delete(r.quests, id)
	return nil
}

func (r *mockQuestRepo) RecordHistory(ctx context.Context, history *quest.QuestHistory) error {
	return nil
}

func (r *mockQuestRepo) GetCompletedQuestIDs(ctx context.Context, charID int64) ([]int, error) {
	return nil, nil
}

func newTestPlayerCache(t *testing.T) (*PlayerCache, *mockCharacterRepo, *mockItemRepo, *mockSkillRepo, *mockPetRepo, *mockQuestRepo) {
	logger := zaptest.NewLogger(t)
	charRepo := newMockCharacterRepo()
	itemRepo := newMockItemRepo()
	skillRepo := newMockSkillRepo()
	petRepo := newMockPetRepo()
	questRepo := newMockQuestRepo()

	cache := NewPlayerCache(charRepo, itemRepo, skillRepo, petRepo, questRepo, nil, logger)
	return cache, charRepo, itemRepo, skillRepo, petRepo, questRepo
}

func TestNewPlayerCache(t *testing.T) {
	cache, _, _, _, _, _ := newTestPlayerCache(t)

	if cache == nil {
		t.Fatal("NewPlayerCache returned nil")
	}
	if cache.activeSessions == nil {
		t.Error("activeSessions map not initialized")
	}
}

func TestPlayerCache_LoadPlayer(t *testing.T) {
	cache, charRepo, itemRepo, skillRepo, petRepo, questRepo := newTestPlayerCache(t)
	ctx := context.Background()

	char := &character.Character{ID: 1, Name: "TestChar"}
	charRepo.characters[1] = char

	it := &item.Item{ID: 100, CharacterID: 1}
	itemRepo.items[100] = it

	sk := &skill.CharacterSkill{ID: 200, CharacterID: 1}
	skillRepo.skills[200] = sk

	pt := &pet.Pet{ID: 300, CharacterID: 1}
	petRepo.pets[300] = pt

	q := &quest.QuestProgress{ID: 400, CharacterID: 1}
	questRepo.quests[400] = q

	data, err := cache.LoadPlayer(ctx, 1)
	if err != nil {
		t.Fatalf("LoadPlayer failed: %v", err)
	}

	if data.CharacterID != 1 {
		t.Errorf("expected CharacterID 1, got %d", data.CharacterID)
	}
	if data.Character == nil || data.Character.ID != 1 {
		t.Error("character not loaded")
	}
	if len(data.Items) != 1 {
		t.Errorf("expected 1 item, got %d", len(data.Items))
	}
	if len(data.Skills) != 1 {
		t.Errorf("expected 1 skill, got %d", len(data.Skills))
	}
	if len(data.Pets) != 1 {
		t.Errorf("expected 1 pet, got %d", len(data.Pets))
	}
	if len(data.Quests) != 1 {
		t.Errorf("expected 1 quest, got %d", len(data.Quests))
	}
}

func TestPlayerCache_LoadPlayer_AlreadyCached(t *testing.T) {
	cache, charRepo, _, _, _, _ := newTestPlayerCache(t)
	ctx := context.Background()

	char := &character.Character{ID: 1, Name: "TestChar"}
	charRepo.characters[1] = char

	data1, _ := cache.LoadPlayer(ctx, 1)
	data2, _ := cache.LoadPlayer(ctx, 1)

	if data1 != data2 {
		t.Error("expected same PlayerData instance for repeated load")
	}
}

func TestPlayerCache_GetPlayer(t *testing.T) {
	cache, charRepo, _, _, _, _ := newTestPlayerCache(t)
	ctx := context.Background()

	if cache.GetPlayer(1) != nil {
		t.Error("GetPlayer should return nil for non-existent player")
	}

	charRepo.characters[1] = &character.Character{ID: 1}
	cache.LoadPlayer(ctx, 1)

	data := cache.GetPlayer(1)
	if data == nil {
		t.Error("GetPlayer should return cached data")
	}
}

func TestPlayerCache_HasPlayer(t *testing.T) {
	cache, charRepo, _, _, _, _ := newTestPlayerCache(t)
	ctx := context.Background()

	if cache.HasPlayer(1) {
		t.Error("HasPlayer should return false for non-existent player")
	}

	charRepo.characters[1] = &character.Character{ID: 1}
	cache.LoadPlayer(ctx, 1)

	if !cache.HasPlayer(1) {
		t.Error("HasPlayer should return true for cached player")
	}
}

func TestPlayerCache_SavePlayer(t *testing.T) {
	cache, charRepo, _, _, _, _ := newTestPlayerCache(t)
	ctx := context.Background()

	charRepo.characters[1] = &character.Character{ID: 1, Name: "Original"}
	data, _ := cache.LoadPlayer(ctx, 1)

	data.SetCharacter(&character.Character{ID: 1, Name: "Updated"})

	err := cache.SavePlayer(ctx, 1)
	if err != nil {
		t.Fatalf("SavePlayer failed: %v", err)
	}

	if charRepo.characters[1].Name != "Updated" {
		t.Error("character not updated in repo")
	}
}

func TestPlayerCache_SavePlayer_NotDirty(t *testing.T) {
	cache, charRepo, _, _, _, _ := newTestPlayerCache(t)
	ctx := context.Background()

	charRepo.characters[1] = &character.Character{ID: 1, Name: "Original"}
	cache.LoadPlayer(ctx, 1)

	err := cache.SavePlayer(ctx, 1)
	if err != nil {
		t.Fatalf("SavePlayer failed: %v", err)
	}
}

func TestPlayerCache_SaveAndEvict(t *testing.T) {
	cache, charRepo, _, _, _, _ := newTestPlayerCache(t)
	ctx := context.Background()

	charRepo.characters[1] = &character.Character{ID: 1, Name: "Original"}
	data, _ := cache.LoadPlayer(ctx, 1)

	data.SetCharacter(&character.Character{ID: 1, Name: "Updated"})

	err := cache.SaveAndEvict(ctx, 1)
	if err != nil {
		t.Fatalf("SaveAndEvict failed: %v", err)
	}

	if charRepo.characters[1].Name != "Updated" {
		t.Error("character not updated in repo")
	}

	if cache.HasPlayer(1) {
		t.Error("player should be evicted from cache")
	}
}

func TestPlayerCache_SaveAndEvict_NonExistent(t *testing.T) {
	cache, _, _, _, _, _ := newTestPlayerCache(t)
	ctx := context.Background()

	err := cache.SaveAndEvict(ctx, 999)
	if err != nil {
		t.Fatalf("SaveAndEvict should not error for non-existent player: %v", err)
	}
}

func TestPlayerCache_InvalidateCharacter_RemovesCachedSessionAndHotState(t *testing.T) {
	cache, charRepo, _, _, _, _ := newTestPlayerCache(t)
	ctx := context.Background()

	charRepo.characters[1] = &character.Character{ID: 1, Name: "stale"}
	if _, err := cache.LoadPlayer(ctx, 1); err != nil {
		t.Fatalf("LoadPlayer failed: %v", err)
	}
	cache.hotStates[1] = NewHotStateBuffer(1)

	if err := cache.InvalidateCharacter(ctx, 1); err != nil {
		t.Fatalf("InvalidateCharacter failed: %v", err)
	}
	if cache.HasPlayer(1) {
		t.Fatal("expected cached player to be removed")
	}
	if cache.GetHotState(1) != nil {
		t.Fatal("expected hot state to be removed")
	}
}

func TestCachedCharacterRepository_Create_InvalidatesReusedCharacterID(t *testing.T) {
	cache, charRepo, _, _, _, _ := newTestPlayerCache(t)
	ctx := context.Background()

	stale := NewPlayerData(1)
	stale.Character = &character.Character{ID: 1, Name: "old"}
	cache.activeSessions[1] = stale
	cache.hotStates[1] = NewHotStateBuffer(1)

	repo := NewCachedCharacterRepository(cache, charRepo)
	char := &character.Character{Name: "new"}
	if err := repo.Create(ctx, char); err != nil {
		t.Fatalf("Create failed: %v", err)
	}
	if char.ID != 1 {
		t.Fatalf("expected created character ID 1, got %d", char.ID)
	}
	if cache.HasPlayer(1) {
		t.Fatal("expected stale cached session to be invalidated")
	}
	if cache.GetHotState(1) != nil {
		t.Fatal("expected stale hot state to be invalidated")
	}
	if got := charRepo.characters[1].Name; got != "new" {
		t.Fatalf("expected repo to store created character, got %q", got)
	}
}

func TestPlayerCache_SaveAllDirty(t *testing.T) {
	cache, charRepo, _, _, _, _ := newTestPlayerCache(t)
	ctx := context.Background()

	charRepo.characters[1] = &character.Character{ID: 1, Name: "Char1"}
	charRepo.characters[2] = &character.Character{ID: 2, Name: "Char2"}

	data1, _ := cache.LoadPlayer(ctx, 1)
	cache.LoadPlayer(ctx, 2)

	data1.SetCharacter(&character.Character{ID: 1, Name: "Char1Updated"})

	stats, err := cache.SaveAllDirty(ctx)
	if err != nil {
		t.Fatalf("SaveAllDirty failed: %v", err)
	}

	if stats.TotalCached != 2 {
		t.Errorf("expected TotalCached 2, got %d", stats.TotalCached)
	}
	if stats.DirtyCount != 1 {
		t.Errorf("expected DirtyCount 1, got %d", stats.DirtyCount)
	}
	if stats.SavedCount != 1 {
		t.Errorf("expected SavedCount 1, got %d", stats.SavedCount)
	}

	if charRepo.characters[1].Name != "Char1Updated" {
		t.Error("dirty character not updated")
	}
}

func TestPlayerCache_SaveAllDirty_WithDeletes(t *testing.T) {
	cache, charRepo, itemRepo, _, _, _ := newTestPlayerCache(t)
	ctx := context.Background()

	charRepo.characters[1] = &character.Character{ID: 1}
	it := &item.Item{ID: 100, CharacterID: 1}
	itemRepo.items[100] = it

	data, _ := cache.LoadPlayer(ctx, 1)

	data.DeleteItem(100)

	_, err := cache.SaveAllDirty(ctx)
	if err != nil {
		t.Fatalf("SaveAllDirty failed: %v", err)
	}

	if _, exists := itemRepo.items[100]; exists {
		t.Error("deleted item should be removed from repo")
	}
}

func TestPlayerCache_SavePlayer_PersistsSwappedBagSlotsWithoutConflicts(t *testing.T) {
	cache, charRepo, itemRepo, _, _, _ := newTestPlayerCache(t)
	ctx := context.Background()

	itemRepo.enforceUnique = true
	charRepo.characters[1] = &character.Character{ID: 1}
	itemRepo.items[100] = &item.Item{ID: 100, CharacterID: 1, SlotType: item.SlotTypeBag, SlotIndex: 0}
	itemRepo.items[101] = &item.Item{ID: 101, CharacterID: 1, SlotType: item.SlotTypeBag, SlotIndex: 1}

	data, _ := cache.LoadPlayer(ctx, 1)
	data.SetItem(&item.Item{ID: 100, CharacterID: 1, SlotType: item.SlotTypeBag, SlotIndex: 1})
	data.SetItem(&item.Item{ID: 101, CharacterID: 1, SlotType: item.SlotTypeBag, SlotIndex: 0})

	if err := cache.SavePlayer(ctx, 1); err != nil {
		t.Fatalf("SavePlayer failed: %v", err)
	}

	if got := itemRepo.items[100].SlotIndex; got != 1 {
		t.Fatalf("expected item 100 slot 1, got %d", got)
	}
	if got := itemRepo.items[101].SlotIndex; got != 0 {
		t.Fatalf("expected item 101 slot 0, got %d", got)
	}
	if data.IsDirty() {
		t.Fatal("expected player data to be clean after successful save")
	}
}

func TestPlayerCache_GetCachedPlayerIDs(t *testing.T) {
	cache, charRepo, _, _, _, _ := newTestPlayerCache(t)
	ctx := context.Background()

	charRepo.characters[1] = &character.Character{ID: 1}
	charRepo.characters[2] = &character.Character{ID: 2}

	cache.LoadPlayer(ctx, 1)
	cache.LoadPlayer(ctx, 2)

	ids := cache.GetCachedPlayerIDs()
	if len(ids) != 2 {
		t.Errorf("expected 2 cached players, got %d", len(ids))
	}
}

func TestPlayerCache_Stats(t *testing.T) {
	cache, charRepo, itemRepo, skillRepo, petRepo, questRepo := newTestPlayerCache(t)
	ctx := context.Background()

	charRepo.characters[1] = &character.Character{ID: 1}
	itemRepo.items[100] = &item.Item{ID: 100, CharacterID: 1}
	itemRepo.items[101] = &item.Item{ID: 101, CharacterID: 1}
	skillRepo.skills[200] = &skill.CharacterSkill{ID: 200, CharacterID: 1}
	petRepo.pets[300] = &pet.Pet{ID: 300, CharacterID: 1}
	questRepo.quests[400] = &quest.QuestProgress{ID: 400, CharacterID: 1}

	data, _ := cache.LoadPlayer(ctx, 1)
	data.MarkCharacterDirty()

	stats := cache.Stats()

	if stats["active_sessions_legacy"] != 1 {
		t.Errorf("expected active_sessions_legacy 1, got %d", stats["active_sessions_legacy"])
	}
	if stats["dirty_players"] != 1 {
		t.Errorf("expected dirty_players 1, got %d", stats["dirty_players"])
	}
	if stats["total_items"] != 2 {
		t.Errorf("expected total_items 2, got %d", stats["total_items"])
	}
	if stats["total_skills"] != 1 {
		t.Errorf("expected total_skills 1, got %d", stats["total_skills"])
	}
	if stats["total_pets"] != 1 {
		t.Errorf("expected total_pets 1, got %d", stats["total_pets"])
	}
	if stats["total_quests"] != 1 {
		t.Errorf("expected total_quests 1, got %d", stats["total_quests"])
	}
}

func TestPlayerCache_ConcurrentLoad(t *testing.T) {
	cache, charRepo, _, _, _, _ := newTestPlayerCache(t)
	ctx := context.Background()

	charRepo.characters[1] = &character.Character{ID: 1}

	var wg sync.WaitGroup
	results := make(chan *PlayerData, 10)

	for i := 0; i < 10; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			data, err := cache.LoadPlayer(ctx, 1)
			if err != nil {
				t.Errorf("LoadPlayer failed: %v", err)
				return
			}
			results <- data
		}()
	}

	wg.Wait()
	close(results)

	var first *PlayerData
	for data := range results {
		if first == nil {
			first = data
		} else if data != first {
			t.Error("expected all goroutines to get same PlayerData instance")
		}
	}
}

func TestPlayerCache_PersistErrors(t *testing.T) {
	cache, charRepo, _, _, _, _ := newTestPlayerCache(t)
	ctx := context.Background()

	charRepo.characters[1] = &character.Character{ID: 1}
	charRepo.updateErr = errors.New("update failed")

	data, _ := cache.LoadPlayer(ctx, 1)
	data.SetCharacter(&character.Character{ID: 1, Name: "Updated"})

	err := cache.SavePlayer(ctx, 1)
	if err == nil {
		t.Error("expected error from SavePlayer")
	}
}
