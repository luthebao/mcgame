// Open-sourced by BaoLT

// Pet Talent bag operations: arrangeTalentBag (compact to dense slots 1..N, full
// bag reply), breakTalentStone (dismantle N stones for pvePoint = N*stone.exp),
// and resetTalentSlot (consume 2 same-level stones, produce 1 same-level stone of
// a re-rolled prop line). All but arrange return an incremental {a,d} bag delta.
//
// Reroll rule (resetTalentSlot): the two source stones must share the same level;
// the result is a SAME-level stone whose prop line is a seeded-random uniform draw
// over the level-matched candidate pool (see reroll.go for the pool definition and
// the documented calibration assumption). The chosen id is always an existing
// gamedata record, never fabricated.
package pettalent

import (
	"context"
	"sort"
	"strconv"
	"strings"
)

func (s *Service) ArrangeBag(ctx context.Context, charID int64) (map[string]interface{}, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	slots := make([]int, 0, len(state.Bag))
	for slot := range state.Bag {
		slots = append(slots, slot)
	}
	sort.Ints(slots)
	merged := map[int]BagEntry{}
	order := make([]int, 0, len(slots))
	byTid := map[int]int{}
	for _, slot := range slots {
		entry := state.Bag[slot]
		if dst, ok := byTid[entry.T]; ok {
			cur := merged[dst]
			cur.N += entry.N
			merged[dst] = cur
			continue
		}
		dense := len(order) + 1
		merged[dense] = entry
		byTid[entry.T] = dense
		order = append(order, dense)
	}
	state.Bag = merged
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return state.toBag(), nil
}

func (s *Service) BreakTalentStone(ctx context.Context, charID int64, csid, giid, count int) (map[string]interface{}, error) {
	if count <= 0 {
		return nil, ErrStoneMismatch
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	entry, ok := state.Bag[csid]
	if !ok || entry.T != giid || entry.N < count {
		return nil, ErrBagEntryMissing
	}
	rec := s.gameData.GetPetTalent(giid)
	if rec == nil {
		return nil, ErrStoneMismatch
	}

	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, err
	}
	delta := newDelta()
	s.reduceBag(state, delta, csid, count)
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	char.PvePoint += count * int(rec.Exp)
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}
	return delta.toMap(), nil
}

func (s *Service) ResetTalentSlot(ctx context.Context, charID int64, giids, csids string) (map[string]interface{}, error) {
	gids := parsePipeInts(giids)
	cids := parsePipeInts(csids)
	if len(gids) != rerollSourceCount || len(cids) != rerollSourceCount {
		return nil, ErrStoneMismatch
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}

	srcLv := -1
	for i, slot := range cids {
		entry, ok := state.Bag[slot]
		if !ok || entry.T != gids[i] || entry.N < 1 {
			return nil, ErrBagEntryMissing
		}
		rec := s.gameData.GetPetTalent(gids[i])
		if rec == nil {
			return nil, ErrStoneMismatch
		}
		if srcLv == -1 {
			srcLv = int(rec.Lv)
		} else if int(rec.Lv) != srcLv {
			return nil, ErrStoneMismatch
		}
	}

	resultRec := s.pickRerollResult(gids[0], srcLv)
	if resultRec == nil {
		return nil, ErrStoneMismatch
	}

	delta := newDelta()
	for i, slot := range cids {
		_ = i
		s.reduceBag(state, delta, slot, 1)
	}
	if err := s.addStone(state, delta, int(resultRec.ID), 1); err != nil {
		return nil, err
	}
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return delta.toMap(), nil
}

func parsePipeInts(raw string) []int {
	raw = strings.TrimSpace(raw)
	if raw == "" {
		return nil
	}
	parts := strings.Split(raw, "|")
	out := make([]int, 0, len(parts))
	for _, p := range parts {
		p = strings.TrimSpace(p)
		if p == "" {
			continue
		}
		n, err := strconv.Atoi(p)
		if err != nil {
			return nil
		}
		out = append(out, n)
	}
	return out
}
