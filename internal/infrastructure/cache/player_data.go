// Open-sourced by BaoLT

// PlayerData holds all cached entities for a single player/character.
// Provides dirty tracking for write-behind persistence.
// Thread-safe via sync.RWMutex for concurrent RPC access.
package cache

import (
	"sync"

	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/item"
	"mcgame-server/internal/domain/pet"
	"mcgame-server/internal/domain/quest"
	"mcgame-server/internal/domain/skill"
)

type PlayerData struct {
	CharacterID int64
	Character   *character.Character
	Items       map[int64]*item.Item
	Skills      map[int64]*skill.CharacterSkill
	Pets        map[int64]*pet.Pet
	Quests      map[int64]*quest.QuestProgress

	dirtyChar   bool
	dirtyItems  map[int64]bool
	dirtySkills map[int64]bool
	dirtyPets   map[int64]bool
	dirtyQuests map[int64]bool

	deletedItems  []int64
	deletedSkills []int64
	deletedPets   []int64
	deletedQuests []int64

	mu sync.RWMutex
}

func NewPlayerData(charID int64) *PlayerData {
	return &PlayerData{
		CharacterID: charID,
		Items:       make(map[int64]*item.Item),
		Skills:      make(map[int64]*skill.CharacterSkill),
		Pets:        make(map[int64]*pet.Pet),
		Quests:      make(map[int64]*quest.QuestProgress),
		dirtyItems:  make(map[int64]bool),
		dirtySkills: make(map[int64]bool),
		dirtyPets:   make(map[int64]bool),
		dirtyQuests: make(map[int64]bool),
	}
}

func (p *PlayerData) IsDirty() bool {
	p.mu.RLock()
	defer p.mu.RUnlock()
	return p.dirtyChar ||
		len(p.dirtyItems) > 0 ||
		len(p.dirtySkills) > 0 ||
		len(p.dirtyPets) > 0 ||
		len(p.dirtyQuests) > 0 ||
		len(p.deletedItems) > 0 ||
		len(p.deletedSkills) > 0 ||
		len(p.deletedPets) > 0 ||
		len(p.deletedQuests) > 0
}

func (p *PlayerData) ClearDirty() {
	p.mu.Lock()
	defer p.mu.Unlock()
	p.dirtyChar = false
	p.dirtyItems = make(map[int64]bool)
	p.dirtySkills = make(map[int64]bool)
	p.dirtyPets = make(map[int64]bool)
	p.dirtyQuests = make(map[int64]bool)
	p.deletedItems = nil
	p.deletedSkills = nil
	p.deletedPets = nil
	p.deletedQuests = nil
}

func (p *PlayerData) SetCharacter(char *character.Character) {
	p.mu.Lock()
	defer p.mu.Unlock()
	p.Character = char
	p.dirtyChar = true
}

func (p *PlayerData) GetCharacter() *character.Character {
	p.mu.RLock()
	defer p.mu.RUnlock()
	return p.Character
}

func (p *PlayerData) MarkCharacterDirty() {
	p.mu.Lock()
	defer p.mu.Unlock()
	p.dirtyChar = true
}

func (p *PlayerData) SetItem(it *item.Item) {
	p.mu.Lock()
	defer p.mu.Unlock()
	p.Items[it.ID] = it
	p.dirtyItems[it.ID] = true
}

func (p *PlayerData) GetItem(id int64) *item.Item {
	p.mu.RLock()
	defer p.mu.RUnlock()
	return p.Items[id]
}

func (p *PlayerData) GetItems() []*item.Item {
	p.mu.RLock()
	defer p.mu.RUnlock()
	items := make([]*item.Item, 0, len(p.Items))
	for _, it := range p.Items {
		items = append(items, it)
	}
	return items
}

func (p *PlayerData) DeleteItem(id int64) {
	p.mu.Lock()
	defer p.mu.Unlock()
	delete(p.Items, id)
	delete(p.dirtyItems, id)
	p.deletedItems = append(p.deletedItems, id)
}

func (p *PlayerData) AddItemWithoutDirty(it *item.Item) {
	p.mu.Lock()
	defer p.mu.Unlock()
	p.Items[it.ID] = it
}

func (p *PlayerData) SetSkill(sk *skill.CharacterSkill) {
	p.mu.Lock()
	defer p.mu.Unlock()
	p.Skills[sk.ID] = sk
	p.dirtySkills[sk.ID] = true
}

func (p *PlayerData) GetSkill(id int64) *skill.CharacterSkill {
	p.mu.RLock()
	defer p.mu.RUnlock()
	return p.Skills[id]
}

func (p *PlayerData) GetSkills() []*skill.CharacterSkill {
	p.mu.RLock()
	defer p.mu.RUnlock()
	skills := make([]*skill.CharacterSkill, 0, len(p.Skills))
	for _, sk := range p.Skills {
		skills = append(skills, sk)
	}
	return skills
}

func (p *PlayerData) DeleteSkill(id int64) {
	p.mu.Lock()
	defer p.mu.Unlock()
	delete(p.Skills, id)
	delete(p.dirtySkills, id)
	p.deletedSkills = append(p.deletedSkills, id)
}

func (p *PlayerData) AddSkillWithoutDirty(sk *skill.CharacterSkill) {
	p.mu.Lock()
	defer p.mu.Unlock()
	p.Skills[sk.ID] = sk
}

func (p *PlayerData) SetPet(pt *pet.Pet) {
	p.mu.Lock()
	defer p.mu.Unlock()
	p.Pets[pt.ID] = pt
	p.dirtyPets[pt.ID] = true
}

func (p *PlayerData) GetPet(id int64) *pet.Pet {
	p.mu.RLock()
	defer p.mu.RUnlock()
	return p.Pets[id]
}

func (p *PlayerData) GetPets() []*pet.Pet {
	p.mu.RLock()
	defer p.mu.RUnlock()
	pets := make([]*pet.Pet, 0, len(p.Pets))
	for _, pt := range p.Pets {
		pets = append(pets, pt)
	}
	return pets
}

func (p *PlayerData) DeletePet(id int64) {
	p.mu.Lock()
	defer p.mu.Unlock()
	delete(p.Pets, id)
	delete(p.dirtyPets, id)
	p.deletedPets = append(p.deletedPets, id)
}

func (p *PlayerData) AddPetWithoutDirty(pt *pet.Pet) {
	p.mu.Lock()
	defer p.mu.Unlock()
	p.Pets[pt.ID] = pt
}

func (p *PlayerData) SetQuest(q *quest.QuestProgress) {
	p.mu.Lock()
	defer p.mu.Unlock()
	p.Quests[q.ID] = q
	p.dirtyQuests[q.ID] = true
}

func (p *PlayerData) GetQuest(id int64) *quest.QuestProgress {
	p.mu.RLock()
	defer p.mu.RUnlock()
	return p.Quests[id]
}

func (p *PlayerData) GetQuests() []*quest.QuestProgress {
	p.mu.RLock()
	defer p.mu.RUnlock()
	quests := make([]*quest.QuestProgress, 0, len(p.Quests))
	for _, q := range p.Quests {
		quests = append(quests, q)
	}
	return quests
}

func (p *PlayerData) DeleteQuest(id int64) {
	p.mu.Lock()
	defer p.mu.Unlock()
	delete(p.Quests, id)
	delete(p.dirtyQuests, id)
	p.deletedQuests = append(p.deletedQuests, id)
}

func (p *PlayerData) AddQuestWithoutDirty(q *quest.QuestProgress) {
	p.mu.Lock()
	defer p.mu.Unlock()
	p.Quests[q.ID] = q
}

type DirtySnapshot struct {
	Character     *character.Character
	DirtyChar     bool
	DirtyItems    map[int64]*item.Item
	DirtySkills   map[int64]*skill.CharacterSkill
	DirtyPets     map[int64]*pet.Pet
	DirtyQuests   map[int64]*quest.QuestProgress
	DeletedItems  []int64
	DeletedSkills []int64
	DeletedPets   []int64
	DeletedQuests []int64
}

func (p *PlayerData) GetDirtySnapshot() *DirtySnapshot {
	p.mu.RLock()
	defer p.mu.RUnlock()

	snapshot := &DirtySnapshot{
		Character:     p.Character,
		DirtyChar:     p.dirtyChar,
		DirtyItems:    make(map[int64]*item.Item),
		DirtySkills:   make(map[int64]*skill.CharacterSkill),
		DirtyPets:     make(map[int64]*pet.Pet),
		DirtyQuests:   make(map[int64]*quest.QuestProgress),
		DeletedItems:  append([]int64{}, p.deletedItems...),
		DeletedSkills: append([]int64{}, p.deletedSkills...),
		DeletedPets:   append([]int64{}, p.deletedPets...),
		DeletedQuests: append([]int64{}, p.deletedQuests...),
	}

	for id := range p.dirtyItems {
		if it, ok := p.Items[id]; ok {
			snapshot.DirtyItems[id] = it
		}
	}
	for id := range p.dirtySkills {
		if sk, ok := p.Skills[id]; ok {
			snapshot.DirtySkills[id] = sk
		}
	}
	for id := range p.dirtyPets {
		if pt, ok := p.Pets[id]; ok {
			snapshot.DirtyPets[id] = pt
		}
	}
	for id := range p.dirtyQuests {
		if q, ok := p.Quests[id]; ok {
			snapshot.DirtyQuests[id] = q
		}
	}

	return snapshot
}
