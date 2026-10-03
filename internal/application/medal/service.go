// Open-sourced by BaoLT

// Medal (Ấn Chương) application service. Persists the panel state
// (feature_key='medal') and serves the buildable RPCs: getMedalInfo, moveMedal,
// arrangeMedalBag (this file) plus upMedal / breakMedal (upgrade.go).
//
// medalExp lives inside the feature state (key "exp"), NOT as a character currency,
// so up/break adjust state.Exp only and never touch charRepo. The service therefore
// needs only the feature-state repository, the game-data manager (TBL_MEDAL=98 via
// GetMedal for up/break cost+quality), and a logger.
//
// AddMedalToBag is the medal-award write-path (item award-type 36, see
// item/effect_award.go). It stacks the medal into the inventory and returns the
// resulting slot + total count so the caller can push the live updateMedalInBag
// reward to an open MedalPanel (see docs/research/2026-06-14_02_*).
package medal

import (
	"context"
	"errors"
	"fmt"

	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata"

	"go.uber.org/zap"
)

const featureKey = domainfeature.FeatureMedal

var (
	ErrInvalidArgs   = errors.New("ấn chương: tham số không hợp lệ")
	ErrSlotEmpty     = errors.New("ấn chương: ô trống")
	ErrSlotOccupied  = errors.New("ấn chương: ô đã có ấn chương")
	ErrBagFull       = errors.New("ấn chương: túi ấn chương đã đầy")
	ErrUnknownMedal  = errors.New("ấn chương: ấn chương không hợp lệ")
	ErrMaxLevel      = errors.New("ấn chương: ấn chương đã đạt cấp tối đa")
	ErrInsufficient  = errors.New("ấn chương: không đủ kinh nghiệm ấn chương")
	ErrRareProtected = errors.New("ban")
)

type Service struct {
	featureRepo domainfeature.Repository
	gameData    *gamedata.Manager
	logger      *zap.Logger
}

func NewService(featureRepo domainfeature.Repository, gameData *gamedata.Manager, logger *zap.Logger) *Service {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Service{featureRepo: featureRepo, gameData: gameData, logger: logger}
}

func (s *Service) loadState(ctx context.Context, charID int64) (*State, error) {
	states, err := s.featureRepo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("medal: load feature states: %w", err)
	}
	for _, st := range states {
		if st != nil && st.FeatureKey == featureKey {
			return stateFromMap(st.State), nil
		}
	}
	return defaultState(), nil
}

func (s *Service) saveState(ctx context.Context, charID int64, state *State) error {
	return s.featureRepo.UpsertCharacterFeatureState(ctx, &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  featureKey,
		State:       state.toPersist(),
	})
}

func (s *Service) GetInfo(ctx context.Context, charID int64) (map[string]interface{}, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	return state.infoWire(), nil
}

func (s *Service) AddMedalToBag(ctx context.Context, charID int64, tid, count int) (int, int, error) {
	if tid <= 0 || count <= 0 {
		return 0, 0, ErrInvalidArgs
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return 0, 0, err
	}
	for slot, entry := range state.Bag {
		if isInventory(slot) && entry.T == tid {
			entry.N += count
			state.Bag[slot] = entry
			if err := s.saveState(ctx, charID, state); err != nil {
				return 0, 0, err
			}
			return slot, entry.N, nil
		}
	}
	slot := state.firstFreeInventorySlot()
	if slot == 0 {
		return 0, 0, ErrBagFull
	}
	entry := BagEntry{I: slot, T: tid, N: count}
	state.Bag[slot] = entry
	if err := s.saveState(ctx, charID, state); err != nil {
		return 0, 0, err
	}
	return slot, entry.N, nil
}

type MoveResult struct {
	Type       int
	JoinTid    int
	PetJoinTid int
	Del        int
	HasDel     bool
	ChangedPA  map[int]BagEntry
	ChangedBA  map[int]BagEntry
}

func (s *Service) MoveMedal(ctx context.Context, charID int64, fromSid, toSid int) (*MoveResult, error) {
	if fromSid <= 0 || toSid <= 0 || fromSid == toSid {
		return nil, ErrInvalidArgs
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	src, ok := state.Bag[fromSid]
	if !ok {
		return nil, ErrSlotEmpty
	}

	res := &MoveResult{
		Type:       moveTypeChar,
		JoinTid:    state.CharBuffT,
		PetJoinTid: state.PetBuffT,
		ChangedPA:  map[int]BagEntry{},
		ChangedBA:  map[int]BagEntry{},
	}

	switch {
	case toSid == petEngrave:
		if !isInventory(fromSid) && !isPetEquip(fromSid) {
			return nil, ErrInvalidArgs
		}
		state.PetBuffT = src.T
		delete(state.Bag, fromSid)
		res.Type = moveTypePet
		res.PetJoinTid = state.PetBuffT
		res.Del = fromSid
		res.HasDel = true
	case toSid == charEngrave:
		if !isInventory(fromSid) && !isCharEquip(fromSid) {
			return nil, ErrInvalidArgs
		}
		state.CharBuffT = src.T
		delete(state.Bag, fromSid)
		res.Type = moveTypeChar
		res.JoinTid = state.CharBuffT
		res.Del = fromSid
		res.HasDel = true
	case isEquipSlot(toSid) || isInventory(toSid):
		if err := validateMoveBetweenSlots(fromSid, toSid); err != nil {
			return nil, err
		}
		dst, hasDst := state.Bag[toSid]
		src.I = toSid
		state.Bag[toSid] = src
		if hasDst {
			dst.I = fromSid
			state.Bag[fromSid] = dst
			recordChange(res, fromSid, dst)
		} else {
			delete(state.Bag, fromSid)
			res.Del = fromSid
			res.HasDel = true
		}
		recordChange(res, toSid, src)
		res.Type = moveTypeForSlot(toSid)
	default:
		return nil, ErrInvalidArgs
	}

	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return res, nil
}

func (s *Service) ArrangeBag(ctx context.Context, charID int64) (map[string]interface{}, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	ordered := orderedInventory(state)
	for slot := range state.Bag {
		if isInventory(slot) {
			delete(state.Bag, slot)
		}
	}
	for i, entry := range ordered {
		slot := i + 1
		entry.I = slot
		state.Bag[slot] = entry
	}
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return state.bagToWire(), nil
}

func validateMoveBetweenSlots(fromSid, toSid int) error {
	if isInventory(fromSid) && isInventory(toSid) {
		return nil
	}
	if isInventory(fromSid) && isEquipSlot(toSid) {
		return nil
	}
	if isEquipSlot(fromSid) && isInventory(toSid) {
		return nil
	}
	if isEquipSlot(fromSid) && isEquipSlot(toSid) {
		return nil
	}
	return ErrInvalidArgs
}

func moveTypeForSlot(sid int) int {
	if isPetEquip(sid) {
		return moveTypePet
	}
	return moveTypeChar
}

func recordChange(res *MoveResult, sid int, entry BagEntry) {
	if isEquipSlot(sid) {
		res.ChangedPA[sid] = entry
		return
	}
	if isInventory(sid) {
		res.ChangedBA[sid] = entry
	}
}

func orderedInventory(state *State) []BagEntry {
	ordered := make([]BagEntry, 0, len(state.Bag))
	for slot := 1; slot <= bagDisplayCap; slot++ {
		if entry, ok := state.Bag[slot]; ok {
			ordered = append(ordered, entry)
		}
	}
	for slot := bagDisplayCap + 1; slot <= bagMaxID; slot++ {
		if entry, ok := state.Bag[slot]; ok {
			ordered = append(ordered, entry)
		}
	}
	return ordered
}
