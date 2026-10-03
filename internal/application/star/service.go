// Open-sourced by BaoLT

// Star application service. Manages the 12-slot zodiac star upgrade lifecycle
// (Begin/Finish/Cancel/SpeedUp/AddAddition/Exchange) backed by the shared
// character_stat_features JSONB row keyed by feature_key="stars".
// See docs/research/2026-05-05_02_STAR_SUBSYSTEM_RESEARCH.md for the full design.
package star

import (
	"context"
	"errors"
	"fmt"
	"math/rand"
	"time"

	appitem "mcgame-server/internal/application/item"
	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata"

	"go.uber.org/zap"
)

const (
	StarTypeMin = 1
	StarTypeMax = 12
)

var (
	ErrInvalidStarType         = errors.New("invalid star type")
	ErrTemplateNotFound        = errors.New("star template not found")
	ErrLevelMismatch           = errors.New("template level does not advance current star level by exactly one")
	ErrPlayerLevelTooLow       = errors.New("player level below star template requirement")
	ErrTotalStarLevelTooLow    = errors.New("total star level below template requirement")
	ErrInsufficientGold        = errors.New("insufficient gold for star upgrade")
	ErrAnotherStarInProgress   = errors.New("another star is already upgrading")
	ErrNoUpgradeInProgress     = errors.New("no upgrade in progress for this star type")
	ErrUpgradeNotYetComplete   = errors.New("star upgrade timer has not elapsed")
	ErrCharacterNotFound       = errors.New("character not found")
	ErrNoUpgradeItemForStar    = errors.New("no speed-up item configured for this star type")
	ErrInsufficientSpeedItems  = errors.New("not enough speed-up items")
	ErrInsufficientStarPnt     = errors.New("not enough star points for addition")
	ErrAdditionItemRequired    = errors.New("addition item required")
	ErrInsufficientAddItem     = errors.New("not enough addition items")
	ErrAdditionMaxed           = errors.New("star addition is already at maximum")
	ErrInvalidAdditionQuantity = errors.New("invalid star addition quantity")
)

type Service struct {
	repo            domainfeature.Repository
	charRepo        domainchar.Repository
	gameDataManager *gamedata.Manager
	itemService     *appitem.Service
	logger          *zap.Logger
	now             func() time.Time
	rng             *rand.Rand
}

func NewService(repo domainfeature.Repository, charRepo domainchar.Repository, gameDataManager *gamedata.Manager, logger *zap.Logger) *Service {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Service{
		repo:            repo,
		charRepo:        charRepo,
		gameDataManager: gameDataManager,
		logger:          logger,
		now:             time.Now,
		rng:             rand.New(rand.NewSource(time.Now().UnixNano())),
	}
}

func (s *Service) SetItemService(svc *appitem.Service) {
	s.itemService = svc
}

type StarSlot struct {
	Type       int
	Tid        int
	Level      int
	Addition   float64
	FinishDate int64
}

type StarsState map[int]*StarSlot

func (s *Service) LoadCharacter(ctx context.Context, charID int64) (*domainchar.Character, error) {
	if s == nil || s.charRepo == nil {
		return nil, nil
	}
	return s.charRepo.FindByID(ctx, charID)
}

func (s *Service) Load(ctx context.Context, charID int64) (StarsState, error) {
	if s == nil || s.repo == nil {
		return defaultState(), nil
	}
	states, err := s.repo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("star: load feature state: %w", err)
	}
	for _, st := range states {
		if st == nil || st.FeatureKey != domainfeature.FeatureStars {
			continue
		}
		return decodeState(st.State), nil
	}
	return defaultState(), nil
}

func (s *Service) Begin(ctx context.Context, charID int64, nextTemplateID int) (StarsState, error) {
	if s == nil || s.gameDataManager == nil {
		return nil, fmt.Errorf("star service not configured")
	}
	tpl := s.gameDataManager.GetStarsTemplate(nextTemplateID)
	if tpl == nil {
		return nil, ErrTemplateNotFound
	}
	starType := int(tpl.Type)
	if !validStarType(starType) {
		return nil, ErrInvalidStarType
	}

	state, err := s.Load(ctx, charID)
	if err != nil {
		return nil, err
	}

	nowMs := s.now().UnixMilli()
	stateDirty := false
	for _, slot := range state {
		if slot == nil || slot.FinishDate <= 0 {
			continue
		}
		if slot.FinishDate <= nowMs {
			slot.Level++
			slot.FinishDate = 0
			stateDirty = true
		}
	}
	if stateDirty {
		if err := s.save(ctx, charID, state); err != nil {
			return nil, err
		}
	}

	for t, slot := range state {
		if t == starType {
			continue
		}
		if slot != nil && slot.FinishDate > 0 {
			return nil, ErrAnotherStarInProgress
		}
	}

	slot := state[starType]
	if slot == nil {
		slot = &StarSlot{Type: starType}
		state[starType] = slot
	}
	if slot.FinishDate > 0 {
		return nil, ErrAnotherStarInProgress
	}
	if int(tpl.Level) != slot.Level+1 {
		return nil, ErrLevelMismatch
	}

	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return nil, err
	}
	if char == nil {
		return nil, ErrCharacterNotFound
	}
	if char.Level < int(tpl.ReqLevel) {
		return nil, ErrPlayerLevelTooLow
	}
	if totalLevel(state) < int(tpl.ReqStarLevel) {
		return nil, ErrTotalStarLevelTooLow
	}
	cost := int64(tpl.ReqMoney)
	if char.Gold < cost {
		return nil, ErrInsufficientGold
	}

	char.Gold -= cost
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, fmt.Errorf("star: deduct gold: %w", err)
	}

	finishMs := s.now().Add(time.Duration(tpl.ReqSeconds) * time.Second).UnixMilli()
	slot.Tid = int(tpl.ID)
	slot.FinishDate = finishMs

	if err := s.save(ctx, charID, state); err != nil {
		return nil, err
	}
	return state, nil
}

func (s *Service) Finish(ctx context.Context, charID int64, starType int) (StarsState, error) {
	if !validStarType(starType) {
		return nil, ErrInvalidStarType
	}
	state, err := s.Load(ctx, charID)
	if err != nil {
		return nil, err
	}
	slot := state[starType]
	if slot == nil || slot.FinishDate <= 0 {
		return nil, ErrNoUpgradeInProgress
	}
	if s.now().UnixMilli() < slot.FinishDate {
		return nil, ErrUpgradeNotYetComplete
	}

	slot.Level++
	slot.FinishDate = 0

	if err := s.save(ctx, charID, state); err != nil {
		return nil, err
	}
	return state, nil
}

func (s *Service) Cancel(ctx context.Context, charID int64, starType int) (StarsState, error) {
	if !validStarType(starType) {
		return nil, ErrInvalidStarType
	}
	state, err := s.Load(ctx, charID)
	if err != nil {
		return nil, err
	}
	slot := state[starType]
	if slot == nil || slot.FinishDate <= 0 {
		return state, nil
	}
	slot.FinishDate = 0
	slot.Tid = templateIDForLevel(s.gameDataManager, starType, slot.Level)

	if err := s.save(ctx, charID, state); err != nil {
		return nil, err
	}
	return state, nil
}

func (s *Service) save(ctx context.Context, charID int64, state StarsState) error {
	encoded := encodeState(state)
	return s.repo.UpsertCharacterFeatureState(ctx, &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  domainfeature.FeatureStars,
		State:       encoded,
	})
}

func validStarType(t int) bool {
	return t >= StarTypeMin && t <= StarTypeMax
}

func totalLevel(state StarsState) int {
	total := 0
	for _, slot := range state {
		if slot != nil {
			total += slot.Level
		}
	}
	return total
}

func templateIDForLevel(mgr *gamedata.Manager, starType, level int) int {
	if mgr == nil || level <= 0 {
		return 0
	}
	tpl := mgr.FindStarsTemplateByTypeAndLevel(starType, level)
	if tpl == nil {
		return 0
	}
	return int(tpl.ID)
}
