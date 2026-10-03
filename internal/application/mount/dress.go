// Open-sourced by BaoLT

// Mount-dress equip/unequip logic. A mount-dress is the cosmetic+stat skin worn
// while riding (TBL_MOUNT_DRESS, ids 1-20). beginMounting(dressId) persists the
// active dress (state.UseDress) and surfaces its res_code for the onMountOn zone
// broadcast; stopMounting clears it for the onMountOff broadcast. onUpdateDressList
// pushes are produced on acquire (action=1) / expire (action=2).
//
// ROUTING ASSUMPTION (deferred to the parent's dispatcher): the client's
// beginMounting RPC is shared with pet-riding and carries no wire discriminator.
// Disambiguation is by id-space: an arg that is a TBL_MOUNT_DRESS id (1-20) the
// character OWNS routes to mount-dress; anything else falls through to pet-riding.
// IsOwnedDress is the predicate the parent calls to make that decision; the dress
// id-space (1-20) is disjoint from the large pet instance id-space, so the
// heuristic is unambiguous with the current data.
package mount

import (
	"context"
	"strconv"
)

const (
	dressActionAdd    = 1
	dressActionRemove = 2
	dressIDMin        = 1
	dressIDMax        = 20
	noDress           = -1
	permanentExpiry   = int64(1)
)

func dressIDInRange(dressID int) bool {
	return dressID >= dressIDMin && dressID <= dressIDMax
}

func (s *Service) DressResCode(dressID int) int64 {
	if s.gameData == nil {
		return 0
	}
	tpl := s.gameData.GetMountDress(dressID)
	if tpl == nil {
		return 0
	}
	return int64(tpl.ResCode)
}

func (s *Service) IsOwnedDress(ctx context.Context, charID int64, dressID int) (bool, error) {
	if !dressIDInRange(dressID) {
		return false, nil
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return false, err
	}
	_, owned := s.ownedDresses(state)[dressID]
	return owned, nil
}

func (s *Service) ActiveMountDress(ctx context.Context, charID int64) (int, bool, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return noDress, false, err
	}
	if state.UseDress > 0 {
		return state.UseDress, true, nil
	}
	return noDress, false, nil
}

func (s *Service) BeginMountDress(ctx context.Context, charID int64, dressID int) (int64, bool, error) {
	if !dressIDInRange(dressID) {
		return 0, false, nil
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return 0, false, err
	}
	if _, owned := s.ownedDresses(state)[dressID]; !owned {
		return 0, false, nil
	}
	resCode := s.DressResCode(dressID)
	state.UseDress = dressID
	if err := s.saveState(ctx, charID, state); err != nil {
		return 0, false, err
	}
	return resCode, true, nil
}

func (s *Service) StopMountDress(ctx context.Context, charID int64) (bool, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return false, err
	}
	if state.UseDress <= 0 {
		return false, nil
	}
	state.UseDress = noDress
	if err := s.saveState(ctx, charID, state); err != nil {
		return false, err
	}
	return true, nil
}

func (s *Service) GrantDress(ctx context.Context, charID int64, dressID int, expiryMs int64) error {
	if !dressIDInRange(dressID) {
		return nil
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return err
	}
	if expiryMs <= 0 {
		expiryMs = permanentExpiry
	}
	state.ExtraDresses[strconv.Itoa(dressID)] = expiryMs
	return s.saveState(ctx, charID, state)
}

func (s *Service) ExpireDress(ctx context.Context, charID int64, dressID int) (clearedActive bool, err error) {
	if !dressIDInRange(dressID) {
		return false, nil
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return false, err
	}
	delete(state.ExtraDresses, strconv.Itoa(dressID))
	if state.UseDress == dressID {
		state.UseDress = noDress
		clearedActive = true
	}
	if err := s.saveState(ctx, charID, state); err != nil {
		return false, err
	}
	return clearedActive, nil
}
