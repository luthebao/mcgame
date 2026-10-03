// Open-sourced by BaoLT

// Pet Talent reroll / fuse result-line selection.
//
// DOCUMENTED CALIBRATION ASSUMPTION (the one unknown for this feature):
// data_tbl_pet_talent has NO weight/probability column. resetTalentSlot and
// upTalentStone pick the result attribute line (prop_type) by a SEEDED-RANDOM
// UNIFORM draw over the level-matched candidate pool. Live may be weighted or may
// constrain the candidate set; the pool definition and the selection knobs live
// HERE in one place so they are trivially tunable later, and an injected *rand.Rand
// (Service.rng, overridable via SetRandSeed) makes the draw deterministic in tests.
//
// Pool shape (verified against data_tbl_pet_talent, 1024 rows): a "stone" record has
// a stone-socket sid (sid%10000==11), lv>=1, up_exp==0, exp>0. id == basic_tid +
// (lv-1), so the lv+1 record of a family is currentId+1, and a family's lv1 record
// has id == basic_tid. The same (lv, prop_type) maps to several families that differ
// only by their per-family grade; the grade is stable across levels and equals the
// family lv1 record's exp. The pool is therefore scoped to the SOURCE family's grade
// and deduplicated to ONE representative id per prop_type — the "level-matched
// prop_type pool" (19 prop_types per grade).
//
// Knobs:
//
//	rerollAllowSameLine = true  -> reroll MAY return the source prop_type (uniform
//	  over the full pool). Documented decision: with no weight column and no client
//	  evidence of exclusion, an unbiased uniform draw is the safest default.
//	fuseRandomizesLine  = true  -> fuse output prop_type is drawn uniformly from the
//	  lv+1 pool of the source grade. If false (or pool empty) it falls back to the
//	  deterministic same-line lv+1 id (currentId+1).
package pettalent

import (
	"sort"

	"mcgame-server/internal/gamedata/models"
)

const (
	rerollAllowSameLine = true
	fuseRandomizesLine  = true
)

func isStoneRecord(rec *models.PetTalentTemplate) bool {
	if rec == nil {
		return false
	}
	if int(rec.Sid)%sidPageMul != maxSlotIndex {
		return false
	}
	return rec.Lv >= 1 && rec.UpExp == 0 && rec.Exp > 0
}

func (s *Service) familyGrade(rec *models.PetTalentTemplate) (float64, bool) {
	if rec == nil {
		return 0, false
	}
	anchor := s.gameData.GetPetTalent(int(rec.BasicTid))
	if anchor != nil && anchor.Exp > 0 {
		return anchor.Exp, true
	}
	if rec.Exp > 0 {
		return rec.Exp, true
	}
	return 0, false
}

func (s *Service) levelMatchedPool(lv int, grade float64) []*models.PetTalentTemplate {
	byProp := map[int]*models.PetTalentTemplate{}
	for _, rec := range s.gameData.GetAllPetTalents() {
		if !isStoneRecord(rec) || int(rec.Lv) != lv {
			continue
		}
		g, ok := s.familyGrade(rec)
		if !ok || g != grade {
			continue
		}
		prop := int(rec.PropType)
		if existing, ok := byProp[prop]; !ok || rec.ID < existing.ID {
			byProp[prop] = rec
		}
	}
	pool := make([]*models.PetTalentTemplate, 0, len(byProp))
	for _, rec := range byProp {
		pool = append(pool, rec)
	}
	sort.Slice(pool, func(i, j int) bool { return pool[i].ID < pool[j].ID })
	return pool
}

func (s *Service) pickRerollResult(srcTid, srcLv int) *models.PetTalentTemplate {
	src := s.gameData.GetPetTalent(srcTid)
	if src == nil {
		return nil
	}
	grade, ok := s.familyGrade(src)
	if !ok {
		return nil
	}
	pool := s.levelMatchedPool(srcLv, grade)
	if len(pool) == 0 {
		return nil
	}
	if !rerollAllowSameLine && len(pool) > 1 {
		filtered := make([]*models.PetTalentTemplate, 0, len(pool))
		for _, rec := range pool {
			if int(rec.PropType) != int(src.PropType) {
				filtered = append(filtered, rec)
			}
		}
		if len(filtered) > 0 {
			pool = filtered
		}
	}
	return pool[s.randIntn(len(pool))]
}

func (s *Service) pickFuseResult(srcTid, srcLv int) *models.PetTalentTemplate {
	src := s.gameData.GetPetTalent(srcTid)
	if src == nil {
		return nil
	}
	if !fuseRandomizesLine {
		return s.fuseDeterministic(srcTid, srcLv)
	}
	grade, ok := s.familyGrade(src)
	if !ok {
		return s.fuseDeterministic(srcTid, srcLv)
	}
	pool := s.levelMatchedPool(srcLv+1, grade)
	if len(pool) == 0 {
		return s.fuseDeterministic(srcTid, srcLv)
	}
	return pool[s.randIntn(len(pool))]
}

func (s *Service) fuseDeterministic(srcTid, srcLv int) *models.PetTalentTemplate {
	result := s.gameData.GetPetTalent(srcTid + 1)
	if result == nil || int(result.Lv) != srcLv+1 {
		return nil
	}
	return result
}
