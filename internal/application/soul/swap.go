// Open-sourced by BaoLT

// Soul drag-swap (MoveSoul). The Flash client emits onUpdateSoulSlot{f,sid,newSid,type}
// after a drag completes; the inbound request verb is UNCONFIRMED (no static literal in
// the decompiled client — the DragableCanvas base builds it dynamically). We register the
// most likely name (moveSoul, matching the moveMedal/movePRSChip/moveStoneBagToBag verb
// family) and report it for live-log confirmation.
//
// Slot ids > petSoulWireOffset address the selected pet's slots (the client strips the
// offset). Type derives from the two endpoints:
//
//	type1 char↔char   (both ids ≤ offset)
//	type2 pet↔pet      (both ids > offset)
//	type3 pet←char-bag (sid is pet, newSid is char)
//	type4 char-bag←pet (sid is char, newSid is pet)
package soul

import (
	"context"
	"sort"
)

func sortedTempIndexes(bag map[int]int) []int {
	idxs := make([]int, 0, len(bag))
	for idx := range bag {
		idxs = append(idxs, idx)
	}
	sort.Ints(idxs)
	return idxs
}

func isPetWire(id int) bool { return id > petSoulWireOffset }

func stripPetWire(id int) int {
	if id > petSoulWireOffset {
		return id - petSoulWireOffset
	}
	return id
}

func swapResult(sid, newSid, swapType int) map[string]any {
	return map[string]any{"f": 1, "sid": sid, "newSid": newSid, "type": swapType}
}

func (s *Service) MoveSoul(ctx context.Context, charID, petID int64, sid, newSid int) (map[string]any, error) {
	switch {
	case !isPetWire(sid) && !isPetWire(newSid):
		return s.swapCharChar(ctx, charID, sid, newSid)
	case isPetWire(sid) && isPetWire(newSid):
		return s.swapPetPet(ctx, petID, sid, newSid)
	case isPetWire(sid) && !isPetWire(newSid):
		return s.swapPetFromBag(ctx, charID, petID, sid, newSid)
	default:
		return s.swapBagFromPet(ctx, charID, petID, sid, newSid)
	}
}

func (s *Service) swapCharChar(ctx context.Context, charID int64, sid, newSid int) (map[string]any, error) {
	state, err := s.loadCharState(ctx, charID)
	if err != nil {
		return nil, err
	}
	a, b := stripPetWire(sid), stripPetWire(newSid)
	swapSlots(state.Slots, a, b)
	if err := s.saveCharState(ctx, charID, state); err != nil {
		return nil, err
	}
	return swapResult(sid, newSid, 1), nil
}

func (s *Service) swapPetPet(ctx context.Context, petID int64, sid, newSid int) (map[string]any, error) {
	if petID <= 0 {
		return swapFail(), nil
	}
	state, err := s.loadPetState(ctx, petID)
	if err != nil {
		return nil, err
	}
	a, b := stripPetWire(sid), stripPetWire(newSid)
	swapSlots(state.Slots, a, b)
	if err := s.savePetState(ctx, petID, state); err != nil {
		return nil, err
	}
	return swapResult(sid, newSid, 2), nil
}

func (s *Service) swapPetFromBag(ctx context.Context, charID, petID int64, sid, newSid int) (map[string]any, error) {
	if petID <= 0 {
		return swapFail(), nil
	}
	charState, err := s.loadCharState(ctx, charID)
	if err != nil {
		return nil, err
	}
	petState, err := s.loadPetState(ctx, petID)
	if err != nil {
		return nil, err
	}
	petSlot, bagSlot := stripPetWire(sid), stripPetWire(newSid)
	swapAcross(petState.Slots, petSlot, charState.Slots, bagSlot)
	if err := s.savePetState(ctx, petID, petState); err != nil {
		return nil, err
	}
	if err := s.saveCharState(ctx, charID, charState); err != nil {
		return nil, err
	}
	return swapResult(sid, newSid, 3), nil
}

func (s *Service) swapBagFromPet(ctx context.Context, charID, petID int64, sid, newSid int) (map[string]any, error) {
	if petID <= 0 {
		return swapFail(), nil
	}
	charState, err := s.loadCharState(ctx, charID)
	if err != nil {
		return nil, err
	}
	petState, err := s.loadPetState(ctx, petID)
	if err != nil {
		return nil, err
	}
	bagSlot, petSlot := stripPetWire(sid), stripPetWire(newSid)
	swapAcross(charState.Slots, bagSlot, petState.Slots, petSlot)
	if err := s.savePetState(ctx, petID, petState); err != nil {
		return nil, err
	}
	if err := s.saveCharState(ctx, charID, charState); err != nil {
		return nil, err
	}
	return swapResult(sid, newSid, 4), nil
}

func swapFail() map[string]any { return map[string]any{"f": 0} }

func swapSlots(slots map[int]SoulSlot, a, b int) {
	av, aok := slots[a]
	bv, bok := slots[b]
	if bok {
		slots[a] = bv
	} else {
		delete(slots, a)
	}
	if aok {
		slots[b] = av
	} else {
		delete(slots, b)
	}
}

func swapAcross(left map[int]SoulSlot, a int, right map[int]SoulSlot, b int) {
	av, aok := left[a]
	bv, bok := right[b]
	if bok {
		left[a] = bv
	} else {
		delete(left, a)
	}
	if aok {
		right[b] = av
	} else {
		delete(right, b)
	}
}
