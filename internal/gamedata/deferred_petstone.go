// Open-sourced by BaoLT

// Deferred Pet Stone gamedata accessor (feature: petstone).
//
// changePetStoneEnergy refines a skill into an inlaid energy stone. The candidate
// pool is the set of TBL_SKILL rows that carry ex_stone_sid > 0: each such row is
// a base (passive) skill, and its ex_stone_sid points at the matching special
// ("Bảo Thạch*…") skill record. The panel's type arg segments the draw:
//
//	type 1 (passive / Bị Động) -> a base skill id   (the ex_stone_sid>0 row itself)
//	type 2 (special / Đặc Kỹ)  -> the ex_stone_sid target id of one of those rows
//
// PetStoneExSkillPool returns both segments as sorted, de-duplicated id slices so
// the caller can make a deterministic uniform draw. The result is memoised per
// Manager because TBL_SKILL is immutable once LoadAll has run; the build reads only
// through the existing exported GetAllSkills accessor, so no shared cache state is
// touched here. Keying the memo on the Manager pointer keeps test Managers (each
// loaded with its own skill fixture) independent.
package gamedata

import (
	"sort"
	"sync"
)

type petStoneExSkillPool struct {
	passive []int
	special []int
}

var (
	petStoneExSkillPoolMu    sync.Mutex
	petStoneExSkillPoolCache = map[*Manager]petStoneExSkillPool{}
)

func (m *Manager) PetStoneExSkillPool() (passive []int, special []int) {
	petStoneExSkillPoolMu.Lock()
	defer petStoneExSkillPoolMu.Unlock()
	pool, ok := petStoneExSkillPoolCache[m]
	if !ok {
		pool = m.buildPetStoneExSkillPool()
		petStoneExSkillPoolCache[m] = pool
	}
	return pool.passive, pool.special
}

func (m *Manager) buildPetStoneExSkillPool() petStoneExSkillPool {
	skills := m.cache.GetAllSkills()
	known := make(map[int]struct{}, len(skills))
	for _, s := range skills {
		if s == nil {
			continue
		}
		known[int(s.ID)] = struct{}{}
	}

	passiveSet := make(map[int]struct{})
	specialSet := make(map[int]struct{})
	for _, s := range skills {
		if s == nil {
			continue
		}
		target := int(s.ExStoneSid)
		if target <= 0 {
			continue
		}
		passiveSet[int(s.ID)] = struct{}{}
		if _, ok := known[target]; ok {
			specialSet[target] = struct{}{}
		}
	}

	return petStoneExSkillPool{
		passive: petStoneSortedKeys(passiveSet),
		special: petStoneSortedKeys(specialSet),
	}
}

func petStoneSortedKeys(set map[int]struct{}) []int {
	out := make([]int, 0, len(set))
	for k := range set {
		out = append(out, k)
	}
	sort.Ints(out)
	return out
}
