// Open-sourced by BaoLT

// Unit tests for PlayerData struct and dirty tracking functionality.
// Tests CRUD operations, dirty flags, delete tracking, and concurrent access.
package cache

import (
	"sync"
	"testing"

	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/item"
	"mcgame-server/internal/domain/pet"
	"mcgame-server/internal/domain/quest"
	"mcgame-server/internal/domain/skill"
)

func TestNewPlayerData(t *testing.T) {
	data := NewPlayerData(123)

	if data.CharacterID != 123 {
		t.Errorf("expected CharacterID 123, got %d", data.CharacterID)
	}
	if data.Items == nil {
		t.Error("Items map not initialized")
	}
	if data.Skills == nil {
		t.Error("Skills map not initialized")
	}
	if data.Pets == nil {
		t.Error("Pets map not initialized")
	}
	if data.Quests == nil {
		t.Error("Quests map not initialized")
	}
	if data.IsDirty() {
		t.Error("new PlayerData should not be dirty")
	}
}

func TestPlayerData_Character(t *testing.T) {
	data := NewPlayerData(1)

	char := &character.Character{ID: 1, Name: "TestChar"}
	data.SetCharacter(char)

	if !data.IsDirty() {
		t.Error("expected dirty after SetCharacter")
	}

	got := data.GetCharacter()
	if got == nil || got.ID != 1 {
		t.Errorf("expected character with ID 1, got %v", got)
	}
}

func TestPlayerData_MarkCharacterDirty(t *testing.T) {
	data := NewPlayerData(1)
	data.Character = &character.Character{ID: 1}

	if data.IsDirty() {
		t.Error("should not be dirty initially")
	}

	data.MarkCharacterDirty()

	if !data.IsDirty() {
		t.Error("should be dirty after MarkCharacterDirty")
	}
}

func TestPlayerData_Items(t *testing.T) {
	data := NewPlayerData(1)

	it := &item.Item{ID: 100, TemplateID: 1001, CharacterID: 1}
	data.SetItem(it)

	if !data.IsDirty() {
		t.Error("expected dirty after SetItem")
	}

	got := data.GetItem(100)
	if got == nil || got.ID != 100 {
		t.Errorf("expected item with ID 100, got %v", got)
	}

	items := data.GetItems()
	if len(items) != 1 {
		t.Errorf("expected 1 item, got %d", len(items))
	}
}

func TestPlayerData_AddItemWithoutDirty(t *testing.T) {
	data := NewPlayerData(1)

	it := &item.Item{ID: 100, TemplateID: 1001}
	data.AddItemWithoutDirty(it)

	if data.IsDirty() {
		t.Error("should not be dirty after AddItemWithoutDirty")
	}

	got := data.GetItem(100)
	if got == nil {
		t.Error("expected item to be added")
	}
}

func TestPlayerData_DeleteItem(t *testing.T) {
	data := NewPlayerData(1)

	it := &item.Item{ID: 100}
	data.AddItemWithoutDirty(it)
	data.DeleteItem(100)

	if data.GetItem(100) != nil {
		t.Error("item should be deleted")
	}

	if !data.IsDirty() {
		t.Error("should be dirty after delete (deletedItems tracked)")
	}

	snapshot := data.GetDirtySnapshot()
	if len(snapshot.DeletedItems) != 1 || snapshot.DeletedItems[0] != 100 {
		t.Errorf("expected deleted item 100, got %v", snapshot.DeletedItems)
	}
}

func TestPlayerData_Skills(t *testing.T) {
	data := NewPlayerData(1)

	sk := &skill.CharacterSkill{ID: 200, SkillID: 2001, CharacterID: 1}
	data.SetSkill(sk)

	if !data.IsDirty() {
		t.Error("expected dirty after SetSkill")
	}

	got := data.GetSkill(200)
	if got == nil || got.ID != 200 {
		t.Errorf("expected skill with ID 200, got %v", got)
	}

	skills := data.GetSkills()
	if len(skills) != 1 {
		t.Errorf("expected 1 skill, got %d", len(skills))
	}
}

func TestPlayerData_AddSkillWithoutDirty(t *testing.T) {
	data := NewPlayerData(1)

	sk := &skill.CharacterSkill{ID: 200, SkillID: 2001}
	data.AddSkillWithoutDirty(sk)

	if data.IsDirty() {
		t.Error("should not be dirty after AddSkillWithoutDirty")
	}
}

func TestPlayerData_DeleteSkill(t *testing.T) {
	data := NewPlayerData(1)

	sk := &skill.CharacterSkill{ID: 200}
	data.AddSkillWithoutDirty(sk)
	data.DeleteSkill(200)

	if data.GetSkill(200) != nil {
		t.Error("skill should be deleted")
	}

	snapshot := data.GetDirtySnapshot()
	if len(snapshot.DeletedSkills) != 1 {
		t.Errorf("expected 1 deleted skill, got %d", len(snapshot.DeletedSkills))
	}
}

func TestPlayerData_Pets(t *testing.T) {
	data := NewPlayerData(1)

	pt := &pet.Pet{ID: 300, TemplateID: 3001, CharacterID: 1}
	data.SetPet(pt)

	if !data.IsDirty() {
		t.Error("expected dirty after SetPet")
	}

	got := data.GetPet(300)
	if got == nil || got.ID != 300 {
		t.Errorf("expected pet with ID 300, got %v", got)
	}

	pets := data.GetPets()
	if len(pets) != 1 {
		t.Errorf("expected 1 pet, got %d", len(pets))
	}
}

func TestPlayerData_AddPetWithoutDirty(t *testing.T) {
	data := NewPlayerData(1)

	pt := &pet.Pet{ID: 300}
	data.AddPetWithoutDirty(pt)

	if data.IsDirty() {
		t.Error("should not be dirty after AddPetWithoutDirty")
	}
}

func TestPlayerData_DeletePet(t *testing.T) {
	data := NewPlayerData(1)

	pt := &pet.Pet{ID: 300}
	data.AddPetWithoutDirty(pt)
	data.DeletePet(300)

	if data.GetPet(300) != nil {
		t.Error("pet should be deleted")
	}

	snapshot := data.GetDirtySnapshot()
	if len(snapshot.DeletedPets) != 1 {
		t.Errorf("expected 1 deleted pet, got %d", len(snapshot.DeletedPets))
	}
}

func TestPlayerData_Quests(t *testing.T) {
	data := NewPlayerData(1)

	q := &quest.QuestProgress{ID: 400, QuestID: 4001, CharacterID: 1}
	data.SetQuest(q)

	if !data.IsDirty() {
		t.Error("expected dirty after SetQuest")
	}

	got := data.GetQuest(400)
	if got == nil || got.ID != 400 {
		t.Errorf("expected quest with ID 400, got %v", got)
	}

	quests := data.GetQuests()
	if len(quests) != 1 {
		t.Errorf("expected 1 quest, got %d", len(quests))
	}
}

func TestPlayerData_AddQuestWithoutDirty(t *testing.T) {
	data := NewPlayerData(1)

	q := &quest.QuestProgress{ID: 400}
	data.AddQuestWithoutDirty(q)

	if data.IsDirty() {
		t.Error("should not be dirty after AddQuestWithoutDirty")
	}
}

func TestPlayerData_DeleteQuest(t *testing.T) {
	data := NewPlayerData(1)

	q := &quest.QuestProgress{ID: 400}
	data.AddQuestWithoutDirty(q)
	data.DeleteQuest(400)

	if data.GetQuest(400) != nil {
		t.Error("quest should be deleted")
	}

	snapshot := data.GetDirtySnapshot()
	if len(snapshot.DeletedQuests) != 1 {
		t.Errorf("expected 1 deleted quest, got %d", len(snapshot.DeletedQuests))
	}
}

func TestPlayerData_ClearDirty(t *testing.T) {
	data := NewPlayerData(1)

	data.SetCharacter(&character.Character{ID: 1})
	data.SetItem(&item.Item{ID: 100})
	data.SetSkill(&skill.CharacterSkill{ID: 200})
	data.SetPet(&pet.Pet{ID: 300})
	data.SetQuest(&quest.QuestProgress{ID: 400})

	data.DeleteItem(100)

	if !data.IsDirty() {
		t.Error("should be dirty before ClearDirty")
	}

	data.ClearDirty()

	if data.IsDirty() {
		t.Error("should not be dirty after ClearDirty")
	}

	snapshot := data.GetDirtySnapshot()
	if len(snapshot.DeletedItems) != 0 {
		t.Error("deleted items should be cleared")
	}
}

func TestPlayerData_GetDirtySnapshot(t *testing.T) {
	data := NewPlayerData(1)

	char := &character.Character{ID: 1, Name: "Test"}
	data.SetCharacter(char)

	it := &item.Item{ID: 100}
	data.SetItem(it)

	sk := &skill.CharacterSkill{ID: 200}
	data.SetSkill(sk)

	pt := &pet.Pet{ID: 300}
	data.SetPet(pt)

	q := &quest.QuestProgress{ID: 400}
	data.SetQuest(q)

	data.AddItemWithoutDirty(&item.Item{ID: 101})
	data.DeleteItem(101)

	snapshot := data.GetDirtySnapshot()

	if !snapshot.DirtyChar {
		t.Error("expected DirtyChar true")
	}
	if snapshot.Character == nil || snapshot.Character.ID != 1 {
		t.Error("expected character in snapshot")
	}
	if len(snapshot.DirtyItems) != 1 {
		t.Errorf("expected 1 dirty item, got %d", len(snapshot.DirtyItems))
	}
	if len(snapshot.DirtySkills) != 1 {
		t.Errorf("expected 1 dirty skill, got %d", len(snapshot.DirtySkills))
	}
	if len(snapshot.DirtyPets) != 1 {
		t.Errorf("expected 1 dirty pet, got %d", len(snapshot.DirtyPets))
	}
	if len(snapshot.DirtyQuests) != 1 {
		t.Errorf("expected 1 dirty quest, got %d", len(snapshot.DirtyQuests))
	}
	if len(snapshot.DeletedItems) != 1 {
		t.Errorf("expected 1 deleted item, got %d", len(snapshot.DeletedItems))
	}
}

func TestPlayerData_ConcurrentAccess(t *testing.T) {
	data := NewPlayerData(1)

	var wg sync.WaitGroup
	for i := 0; i < 100; i++ {
		wg.Add(1)
		go func(n int) {
			defer wg.Done()
			data.SetItem(&item.Item{ID: int64(n), TemplateID: n})
			data.GetItem(int64(n))
			data.GetItems()
			data.IsDirty()
		}(i)
	}
	wg.Wait()

	items := data.GetItems()
	if len(items) != 100 {
		t.Errorf("expected 100 items, got %d", len(items))
	}
}

func TestPlayerData_DeleteRemovesDirtyFlag(t *testing.T) {
	data := NewPlayerData(1)

	it := &item.Item{ID: 100}
	data.SetItem(it)

	data.DeleteItem(100)

	snapshot := data.GetDirtySnapshot()
	if _, exists := snapshot.DirtyItems[100]; exists {
		t.Error("deleted item should not be in dirty items")
	}
	if len(snapshot.DeletedItems) != 1 {
		t.Error("deleted item should be tracked")
	}
}
