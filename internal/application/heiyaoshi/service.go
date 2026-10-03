// Open-sourced by BaoLT

// Heiyaoshi service: panel state load, point activation, and GM reset orchestration.
package heiyaoshi

import (
	"context"
	"errors"
	"fmt"
	"slices"

	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"

	"go.uber.org/zap"
)

var (
	ErrInvalidPoint       = errors.New("invalid point")
	ErrInvalidFigure      = errors.New("invalid figure")
	ErrFigureMismatch     = errors.New("figure does not match current player progress")
	ErrPointAlreadyActive = errors.New("point already active")
	ErrPointNotAdjacent   = errors.New("point not adjacent to an activated point")
	ErrInsufficientStone  = errors.New("not enough heiyaoshi stones")
	ErrInsufficientGold   = errors.New("not enough gold")
	ErrCharacterNotFound  = errors.New("character not found")
	ErrPermissionDenied   = errors.New("permission denied")
)

type CharacterAccessor interface {
	GetByID(ctx context.Context, characterID int64) (*domainchar.Character, error)
	Save(ctx context.Context, char *domainchar.Character) error
}

type Service struct {
	repo   domainfeature.Repository
	chars  CharacterAccessor
	logger *zap.Logger
}

func NewService(repo domainfeature.Repository, chars CharacterAccessor, logger *zap.Logger) *Service {
	return &Service{repo: repo, chars: chars, logger: logger}
}

type PanelData struct {
	State          *State
	TriangleFigure map[string]any
}

type ResourceDelta struct {
	Field    string
	NewTotal int
}

type AreaUnlock struct {
	Figure int
	AreaID int
	Area   Area
}

type LineUnlock struct {
	Figure int
	LineID int
}

type ActivateResult struct {
	Figure          int
	PointID         int
	NewAreas        []AreaUnlock
	NewLines        []LineUnlock
	FigureCompleted bool
	State           *State
	WalletDeltas    []ResourceDelta
	UsedGold        bool
}

type StoneShortfall struct {
	Figure   int
	PointID  int
	GoldCost int
}

func (s *Service) LoadPanel(ctx context.Context, charID int64) (*PanelData, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	needsRepair := false
	if state.LastActFigure < MinFigure {
		state.LastActFigure = MinFigure
		needsRepair = true
	}
	if reconcileFigureProgress(state) {
		needsRepair = true
	}
	expected := computeBuffs(state, state.LastActFigure)
	if !buffsEqual(state.Buff, expected) {
		state.Buff = expected
		needsRepair = true
	}
	if needsRepair {
		if err := s.saveState(ctx, charID, state); err != nil {
			return nil, fmt.Errorf("heiyaoshi: repair state: %w", err)
		}
	}
	return &PanelData{State: state, TriangleFigure: TriangleFigureForPanel()}, nil
}

func (s *Service) ActivatePoint(ctx context.Context, charID int64, figureIdx, pointID int, useGold bool) (*ActivateResult, error) {
	if !IsValidFigure(figureIdx) {
		return nil, ErrInvalidFigure
	}
	return s.activate(ctx, charID, figureIdx, pointID, useGold)
}

func (s *Service) ActivateAtCurrentFigure(ctx context.Context, charID int64, pointID int, useGold bool) (*ActivateResult, error) {
	return s.activate(ctx, charID, 0, pointID, useGold)
}

func (s *Service) activate(ctx context.Context, charID int64, figureIdx, pointID int, useGold bool) (*ActivateResult, error) {
	if pointID < 1 {
		return nil, ErrInvalidPoint
	}

	char, err := s.loadCharacter(ctx, charID)
	if err != nil {
		return nil, err
	}

	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	if state.LastActFigure < MinFigure {
		state.LastActFigure = MinFigure
	}
	seedStarters(state, state.LastActFigure)
	if figureIdx != 0 && figureIdx != state.LastActFigure {
		return nil, ErrFigureMismatch
	}
	figure := state.LastActFigure

	point, ok := LookupPoint(figure, pointID)
	if !ok {
		return nil, ErrInvalidPoint
	}
	if state.HasPoint(pointID) {
		return nil, ErrPointAlreadyActive
	}
	if point.Price > 0 || point.Gold > 0 {
		if !slices.ContainsFunc(point.Around, state.HasPoint) {
			return nil, ErrPointNotAdjacent
		}
	}

	stoneAccessor, ok := domainchar.LookupGameKVAccessor(stoneCurrencyForFigure(figure))
	if !ok {
		return nil, fmt.Errorf("heiyaoshi: missing currency accessor for figure %d", figure)
	}
	goldDescriptor, _ := domainchar.BasicCurrencyDescriptor(domainchar.BasicCurrencyGold)
	var walletField string
	var newTotal int
	if useGold {
		if point.Gold > 0 {
			if int64(point.Gold) > char.Gold {
				return nil, ErrInsufficientGold
			}
			char.Gold -= int64(point.Gold)
		}
		walletField = goldDescriptor.ClientKey
		newTotal = int(char.Gold)
	} else {
		if point.Price > 0 {
			if err := char.DeductCurrency(stoneAccessor.Descriptor.TypeID, point.Price); err != nil {
				return nil, ErrInsufficientStone
			}
		}
		walletField = stoneAccessor.Descriptor.ClientKey
		newTotal = int(stoneAccessor.Get(char))
	}

	state.AddPoint(pointID)

	newAreaIDs := newlyCompletedAreas(state, figure, pointID)
	newAreas := make([]AreaUnlock, 0, len(newAreaIDs))
	for _, areaID := range newAreaIDs {
		state.MarkArea(areaID)
		area, _ := AreaAttributes(figure, areaID)
		newAreas = append(newAreas, AreaUnlock{Figure: figure, AreaID: areaID, Area: area})
	}

	newLineIDs := newlyCompletedLines(state, figure, pointID)
	newLines := make([]LineUnlock, 0, len(newLineIDs))
	for _, lineID := range newLineIDs {
		state.MarkLine(lineID)
		newLines = append(newLines, LineUnlock{Figure: figure, LineID: lineID})
	}

	figureCompleted := figureIsComplete(state, figure)
	if figureCompleted {
		state.LastActFigure = nextFigureAfter(figure)
		state.ResetCurrentFigure()
		if state.LastActFigure <= MaxFigure {
			seedStarters(state, state.LastActFigure)
		}
	}

	recomputeBuffs(state, state.LastActFigure)

	if err := s.persist(ctx, char, state); err != nil {
		return nil, err
	}

	if !useGold {
		newTotal = int(stoneAccessor.Get(char))
	}
	deltas := []ResourceDelta{
		{Field: walletField, NewTotal: newTotal},
	}
	return &ActivateResult{
		Figure:          figure,
		PointID:         pointID,
		NewAreas:        newAreas,
		NewLines:        newLines,
		FigureCompleted: figureCompleted,
		State:           state,
		WalletDeltas:    deltas,
		UsedGold:        useGold,
	}, nil
}

func (s *Service) Reset(ctx context.Context, requesterID, targetID int64) (*PanelData, error) {
	if s.chars == nil {
		return nil, errors.New("heiyaoshi: character accessor not configured")
	}
	requester, err := s.chars.GetByID(ctx, requesterID)
	if err != nil {
		return nil, fmt.Errorf("heiyaoshi: load requester: %w", err)
	}
	if requester == nil || requester.GMLevel < GMResetMinLevel {
		return nil, ErrPermissionDenied
	}

	target, err := s.chars.GetByID(ctx, targetID)
	if err != nil {
		return nil, fmt.Errorf("heiyaoshi: load target: %w", err)
	}
	if target == nil {
		return nil, ErrCharacterNotFound
	}

	state := NewState()
	state.LastActFigure = MinFigure
	seedStarters(state, state.LastActFigure)
	if err := s.saveState(ctx, targetID, state); err != nil {
		return nil, err
	}
	if s.logger != nil {
		s.logger.Info("heiyaoshi reset",
			zap.Int64("actor_id", requesterID),
			zap.Int64("target_id", targetID),
		)
	}
	return &PanelData{State: state, TriangleFigure: TriangleFigureForPanel()}, nil
}

func (s *Service) loadCharacter(ctx context.Context, charID int64) (*domainchar.Character, error) {
	if s.chars == nil {
		return nil, errors.New("heiyaoshi: character accessor not configured")
	}
	char, err := s.chars.GetByID(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("heiyaoshi: load character: %w", err)
	}
	if char == nil {
		return nil, ErrCharacterNotFound
	}
	return char, nil
}

func (s *Service) loadState(ctx context.Context, charID int64) (*State, error) {
	if s.repo == nil {
		return NewState(), nil
	}
	states, err := s.repo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("heiyaoshi: list state: %w", err)
	}
	for _, st := range states {
		if st == nil || st.FeatureKey != domainfeature.FeatureHeiyaoshi {
			continue
		}
		return DecodeState(st.State), nil
	}
	return NewState(), nil
}

func (s *Service) saveState(ctx context.Context, charID int64, state *State) error {
	if s.repo == nil {
		return nil
	}
	return s.repo.UpsertCharacterFeatureState(ctx, &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  domainfeature.FeatureHeiyaoshi,
		State:       state.Encode(),
	})
}

func (s *Service) persist(ctx context.Context, char *domainchar.Character, state *State) error {
	if err := s.saveState(ctx, char.ID, state); err != nil {
		return fmt.Errorf("heiyaoshi: save state: %w", err)
	}
	if err := s.chars.Save(ctx, char); err != nil {
		return fmt.Errorf("heiyaoshi: save character: %w", err)
	}
	return nil
}

func stoneCurrencyForFigure(figure int) int {
	if IsStage2Figure(figure) {
		return domainchar.CurrencyHeiyaoshiPoint2
	}
	return domainchar.CurrencyHeiyaoshiPoint
}
