// Open-sourced by BaoLT

// Monster Heart application service: panel state load, slot placement, and slot removal.
package monsterheart

import (
	"context"
	"errors"
	"fmt"

	domainfeature "mcgame-server/internal/domain/statfeature"

	"go.uber.org/zap"
)

var (
	ErrInvalidBox      = errors.New("invalid box index")
	ErrInvalidHole     = errors.New("invalid hole index")
	ErrItemNotInBag    = errors.New("item not in monster-heart bag")
	ErrSlotAlreadyFull = errors.New("target hole already occupied")
	ErrSlotEmpty       = errors.New("target hole already empty")
)

type Service struct {
	repo   domainfeature.Repository
	logger *zap.Logger
}

func NewService(repo domainfeature.Repository, logger *zap.Logger) *Service {
	return &Service{repo: repo, logger: logger}
}

func (s *Service) Load(ctx context.Context, charID int64) (*State, error) {
	if s == nil || s.repo == nil {
		return NewState(), nil
	}
	states, err := s.repo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("monsterheart: load feature state: %w", err)
	}
	for _, st := range states {
		if st == nil || st.FeatureKey != domainfeature.FeatureMonsterHeart {
			continue
		}
		return DecodeState(st.State), nil
	}
	return NewState(), nil
}

func (s *Service) saveState(ctx context.Context, charID int64, state *State) error {
	if s == nil || s.repo == nil {
		return nil
	}
	encoded := state.Encode()
	return s.repo.UpsertCharacterFeatureState(ctx, &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  domainfeature.FeatureMonsterHeart,
		State:       encoded,
	})
}

func (s *Service) SetSlot(ctx context.Context, charID int64, bagItemID, holePos, box int) (*State, error) {
	if !IsValidBox(box) {
		return nil, ErrInvalidBox
	}
	if !IsValidHole(holePos) {
		return nil, ErrInvalidHole
	}

	state, err := s.Load(ctx, charID)
	if err != nil {
		return nil, err
	}

	if !state.BagContains(bagItemID) {
		return nil, ErrItemNotInBag
	}

	existing := state.GetHoleItem(box, holePos)
	if existing != EmptySlot && existing != 0 {
		return nil, ErrSlotAlreadyFull
	}

	state.PlaceInHole(box, holePos, bagItemID)

	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, fmt.Errorf("monsterheart: save after set: %w", err)
	}

	s.logger.Info("monsterheart: slot set",
		zap.Int64("char_id", charID),
		zap.Int("bag_item_id", bagItemID),
		zap.Int("box", box),
		zap.Int("hole_pos", holePos))

	return state, nil
}

func (s *Service) RemoveSlot(ctx context.Context, charID int64, holePos, box int) (*State, error) {
	if !IsValidBox(box) {
		return nil, ErrInvalidBox
	}
	if !IsValidHole(holePos) {
		return nil, ErrInvalidHole
	}

	state, err := s.Load(ctx, charID)
	if err != nil {
		return nil, err
	}

	existing := state.GetHoleItem(box, holePos)
	if existing == EmptySlot || existing == 0 {
		return nil, ErrSlotEmpty
	}

	state.ClearHole(box, holePos)

	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, fmt.Errorf("monsterheart: save after remove: %w", err)
	}

	s.logger.Info("monsterheart: slot removed",
		zap.Int64("char_id", charID),
		zap.Int("box", box),
		zap.Int("hole_pos", holePos))

	return state, nil
}
