// Open-sourced by BaoLT

// Deferred TBL_QUEST_LOOP + type-7 child accessors (feature: quest loop
// system). QuestLoopTemplate had no per-table accessor yet; the Cache
// methods below follow the same one-method-per-table convention as
// GetQuest/GetAllQuests in cache.go. GetLoopChildren lazily indexes every
// type-7 TBL_QUEST row by its parsed "7-<pool>" sub_type so the loop
// service can pick a round without scanning all quests per call. TBL_QUEST
// is immutable once LoadAll has run, so the index is memoised per Manager
// (mirrors the PetStoneExSkillPool pattern in deferred_petstone.go).
package gamedata

import (
	"strconv"
	"strings"
	"sync"

	"mcgame-server/internal/gamedata/models"
)

const questTypeLoopChild = 7

func (c *Cache) GetQuestLoop(id int) *models.QuestLoopTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.questLoops[id]
}

func (c *Cache) GetAllQuestLoops() []*models.QuestLoopTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.QuestLoopTemplate, 0, len(c.questLoops))
	for _, v := range c.questLoops {
		result = append(result, v)
	}
	return result
}

func (m *Manager) GetQuestLoop(id int) *models.QuestLoopTemplate {
	return m.cache.GetQuestLoop(id)
}

func (m *Manager) GetAllQuestLoops() []*models.QuestLoopTemplate {
	return m.cache.GetAllQuestLoops()
}

var (
	loopChildPoolMu    sync.Mutex
	loopChildPoolCache = map[*Manager]map[int][]*models.QuestTemplate{}
	spawnableCidMu     sync.Mutex
	spawnableCidCache  = map[*Manager]map[int]bool{}
)

// CreatureHasMapSpawn reports whether cid appears in TBL_MAP_CREATURE, i.e.
// the creature can be fought on some map. Loop kill rounds targeting
// boss-only creatures (createBoss-spawned in the original server) fail this
// and are excluded from round selection until a boss-encounter channel
// exists.
func (m *Manager) CreatureHasMapSpawn(cid int) bool {
	spawnableCidMu.Lock()
	defer spawnableCidMu.Unlock()

	set, ok := spawnableCidCache[m]
	if !ok {
		set = make(map[int]bool)
		for _, mc := range m.cache.GetAllMapCreatures() {
			if mc != nil {
				set[int(mc.Cid)] = true
			}
		}
		spawnableCidCache[m] = set
	}
	return set[cid]
}

// GetLoopChildren returns every type-7 quest whose sub_type parses as
// "7-<pool>" for the given pool number.
func (m *Manager) GetLoopChildren(pool int) []*models.QuestTemplate {
	loopChildPoolMu.Lock()
	defer loopChildPoolMu.Unlock()

	index, ok := loopChildPoolCache[m]
	if !ok {
		index = m.buildLoopChildPoolIndex()
		loopChildPoolCache[m] = index
	}
	return index[pool]
}

func (m *Manager) buildLoopChildPoolIndex() map[int][]*models.QuestTemplate {
	index := make(map[int][]*models.QuestTemplate)
	for _, q := range m.cache.GetAllQuests() {
		if q == nil || int(q.Type) != questTypeLoopChild {
			continue
		}
		pool, ok := parseLoopChildPool(q.SubType)
		if !ok {
			continue
		}
		index[pool] = append(index[pool], q)
	}
	return index
}

func parseLoopChildPool(subType string) (int, bool) {
	const prefix = "7-"
	if !strings.HasPrefix(subType, prefix) {
		return 0, false
	}
	pool, err := strconv.Atoi(strings.TrimPrefix(subType, prefix))
	if err != nil {
		return 0, false
	}
	return pool, true
}
