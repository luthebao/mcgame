// Open-sourced by BaoLT

// Pet Talent stone inlay + fuse operations (push-style; service returns the push
// payload, handler emits the named CallBack):
//
//	FillTalentStone     -> onFillOrTakeTalentStone  {bag, pan}  (bag stone -> inTal socket)
//	TakeOffTalentStone  -> onFillOrTakeTalentStone  {bag, pan}  (inTal socket -> bag stone)
//	MoveStoneBagToBag   -> onMoveStoneBagToBag      {a, d}      (bag<->bag move/merge)
//	UpTalentStone       -> onUpTalentStone          {a, d}      (fuse 5 -> 1, lv+1)
//
// Stone sockets are slot indices 10/11. Unlock gate: socket 10 needs the summed Tal
// levels of slots 1-9 on that page >= 20; socket 11 >= 35 (contract thresholds).
// Fuse: 5 same-level same-line source stones yield one lv+1 stone whose result line
// is a seeded-random uniform draw over the lv+1 candidate pool of the source grade
// (see reroll.go); it falls back to the deterministic same-line lv+1 id when the
// pool is unavailable. The optional direction talisman (item 4181, qty by source lv
// {1:1,2:3,3:15,4:50}) is consumed before the result is credited.
package pettalent

import "context"

func (s *Service) FillTalentStone(ctx context.Context, charID int64, fromBagSid, toSlotSid, giid int) (map[string]interface{}, error) {
	idx := slotIndexOf(toSlotSid)
	if idx < minStoneSlot || idx > maxStoneSlot {
		return nil, ErrNotStoneSlot
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	entry, ok := state.Bag[fromBagSid]
	if !ok || entry.T != giid || entry.N < 1 {
		return nil, ErrBagEntryMissing
	}
	if _, occupied := state.InTal[toSlotSid]; occupied {
		return nil, ErrSlotOccupied
	}
	if err := s.checkSocketUnlock(state, toSlotSid); err != nil {
		return nil, err
	}

	bag := newDelta()
	s.reduceBag(state, bag, fromBagSid, 1)
	state.InTal[toSlotSid] = giid
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return fillTakePayload(bag, toSlotSid, giid, true), nil
}

func (s *Service) TakeOffTalentStone(ctx context.Context, charID int64, fromSlotSid, toBagSid, giid int) (map[string]interface{}, error) {
	idx := slotIndexOf(fromSlotSid)
	if idx < minStoneSlot || idx > maxStoneSlot {
		return nil, ErrNotStoneSlot
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	stoneTid, ok := state.InTal[fromSlotSid]
	if !ok || stoneTid <= 0 {
		return nil, ErrSlotEmpty
	}
	if giid > 0 && giid != stoneTid {
		return nil, ErrStoneMismatch
	}

	bag := newDelta()
	if toBagSid > 0 {
		if err := s.addStoneAtSlot(state, bag, toBagSid, stoneTid, 1); err != nil {
			return nil, err
		}
	} else if err := s.addStone(state, bag, stoneTid, 1); err != nil {
		return nil, err
	}
	delete(state.InTal, fromSlotSid)
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return fillTakePayload(bag, fromSlotSid, stoneTid, false), nil
}

func (s *Service) MoveStoneBagToBag(ctx context.Context, charID int64, fromSid, toSid int) (map[string]interface{}, error) {
	if fromSid == toSid {
		return nil, ErrStoneMismatch
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	src, ok := state.Bag[fromSid]
	if !ok {
		return nil, ErrBagEntryMissing
	}
	d := newDelta()
	dst, occupied := state.Bag[toSid]
	switch {
	case !occupied:
		delete(state.Bag, fromSid)
		state.Bag[toSid] = src
		d.del[fromSid] = 0
		d.add[toSid] = src
	case dst.T == src.T:
		dst.N += src.N
		delete(state.Bag, fromSid)
		state.Bag[toSid] = dst
		d.del[fromSid] = 0
		d.add[toSid] = dst
	default:
		state.Bag[fromSid] = dst
		state.Bag[toSid] = src
		d.add[fromSid] = dst
		d.add[toSid] = src
	}
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return d.toMap(), nil
}

func (s *Service) UpTalentStone(ctx context.Context, charID int64, csids, giids string, useDirectionItem bool) (map[string]interface{}, error) {
	cids := parsePipeInts(csids)
	gids := parsePipeInts(giids)
	if len(cids) != fuseSourceCount || len(gids) != fuseSourceCount {
		return nil, ErrStoneMismatch
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}

	need := map[int]int{}
	srcLv := -1
	srcProp := -1
	for i, slot := range cids {
		need[slot]++
		rec := s.gameData.GetPetTalent(gids[i])
		if rec == nil {
			return nil, ErrStoneMismatch
		}
		if srcLv == -1 {
			srcLv = int(rec.Lv)
			srcProp = int(rec.PropType)
		} else if int(rec.Lv) != srcLv || int(rec.PropType) != srcProp {
			return nil, ErrStoneMismatch
		}
	}
	if srcLv >= maxSlotLevel {
		return nil, ErrMaxSlotLevel
	}
	for slot, want := range need {
		entry, ok := state.Bag[slot]
		if !ok || entry.N < want {
			return nil, ErrBagEntryMissing
		}
	}

	result := s.pickFuseResult(gids[0], srcLv)
	if result == nil || int(result.Lv) != srcLv+1 {
		return nil, ErrStoneMismatch
	}

	if useDirectionItem {
		if err := s.consumeDirectionItem(ctx, charID, srcLv); err != nil {
			return nil, err
		}
	}

	d := newDelta()
	for slot, want := range need {
		s.reduceBag(state, d, slot, want)
	}
	if err := s.addStone(state, d, int(result.ID), 1); err != nil {
		return nil, err
	}
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return d.toMap(), nil
}

func (s *Service) checkSocketUnlock(state *State, socketSid int) error {
	page := pageOf(socketSid)
	if page < 1 {
		return ErrInvalidSlot
	}
	total := 0
	for i := minSlotIndex; i <= maxUpSlot; i++ {
		total += s.talentLevel(state.Tal[page*sidPageMul+i])
	}
	gate := slot10LevelGate
	if slotIndexOf(socketSid) == maxStoneSlot {
		gate = slot11LevelGate
	}
	if total < gate {
		return ErrSlotLocked
	}
	return nil
}

func (s *Service) consumeDirectionItem(ctx context.Context, charID int64, srcLv int) error {
	qty, ok := directionItemQty[srcLv]
	if !ok || qty <= 0 {
		return nil
	}
	item, err := s.items.GetItemByID(ctx, charID, int64(directionItemID))
	if err != nil {
		return err
	}
	if item == nil || item.StackCount < qty {
		return ErrItemMissing
	}
	if _, _, err := s.items.ConsumeItemStackByID(ctx, charID, int64(directionItemID), qty); err != nil {
		return err
	}
	return nil
}

func fillTakePayload(bag *delta, socketSid, tid int, fill bool) map[string]interface{} {
	panAdd := map[string]interface{}{}
	panDel := map[string]interface{}{}
	if fill {
		panAdd[itoa(socketSid)] = map[string]interface{}{"tid": tid}
	} else {
		panDel[itoa(socketSid)] = 1
	}
	return map[string]interface{}{
		"bag": bag.toMap(),
		"pan": map[string]interface{}{"a": panAdd, "d": panDel},
	}
}
