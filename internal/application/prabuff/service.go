// Open-sourced by BaoLT

// praBuff — "Ma Pháp Bí Trận" (Magic Formation Array) application service. Persists
// the 8-track formation state (feature_key='pra_buff') and serves the two panel RPCs:
//
//	getMagicArrayData(praType)        -> {praType, buff, exp, goldNum, elementNum}
//	addPracticeExp(praType, isGold)   -> + addExp; pushed via updatePraView
//
// Currency: praTypes 1-4 spend elementPnt, 5-8 spend yijieElement (or gold when
// isGold). Costs are the client display values (10 element / 7 gold) — documented
// assumptions to calibrate vs live-log, as is the crit-bonus roll (critMulit; odds +
// multiplier in tables.go). The rebirth-rank gate and DEF/ATK/SPD effect tables are
// client-side display-only / combat-engine work, out of scope. Currency deducts follow
// the soul/stoneseal pattern (mutate char + charRepo.Update, no separate currency push).
package prabuff

import (
	"context"
	"errors"
	"fmt"
	"math/rand"
	"time"

	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"

	"go.uber.org/zap"
)

const (
	featureKey  = domainfeature.FeaturePraBuff
	elementCost = 10
	goldCost    = 7
)

var (
	ErrInvalidPraType      = errors.New("ma pháp bí trận: loại trận không hợp lệ")
	ErrMaxLevel            = errors.New("ma pháp bí trận: đã đạt cấp tối đa")
	ErrInsufficientGold    = errors.New("ma pháp bí trận: không đủ vàng")
	ErrInsufficientElement = errors.New("ma pháp bí trận: không đủ nguyên tố")
	ErrCharacterMissing    = errors.New("ma pháp bí trận: không tìm thấy nhân vật")
)

type Service struct {
	featureRepo domainfeature.Repository
	charRepo    domainchar.Repository
	logger      *zap.Logger
	rng         *rand.Rand
}

func NewService(featureRepo domainfeature.Repository, charRepo domainchar.Repository, logger *zap.Logger) *Service {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Service{
		featureRepo: featureRepo,
		charRepo:    charRepo,
		logger:      logger,
		rng:         rand.New(rand.NewSource(time.Now().UnixNano())),
	}
}

func (s *Service) SetRandSource(src rand.Source) {
	if src == nil {
		return
	}
	s.rng = rand.New(src)
}

func (s *Service) loadState(ctx context.Context, charID int64) (*State, error) {
	states, err := s.featureRepo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("prabuff: load feature states: %w", err)
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

func (s *Service) loadChar(ctx context.Context, charID int64) (*domainchar.Character, error) {
	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("prabuff: load character: %w", err)
	}
	if char == nil {
		return nil, ErrCharacterMissing
	}
	return char, nil
}

func (s *Service) GetMagicArrayData(ctx context.Context, charID int64, praType int) (map[string]interface{}, error) {
	if !validPraType(praType) {
		return nil, ErrInvalidPraType
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, err
	}
	return baseWire(char, praType, state.track(praType)), nil
}

func (s *Service) AddPracticeExp(ctx context.Context, charID int64, praType int, isGold bool) (map[string]interface{}, error) {
	if !validPraType(praType) {
		return nil, ErrInvalidPraType
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	track := state.track(praType)
	if track.Level >= MaxLevel {
		return nil, ErrMaxLevel
	}
	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, err
	}

	if err := s.deductCost(char, praType, isGold); err != nil {
		return nil, err
	}

	gain, didCrit := applyCrit(addExpFor(track.Level), s.rng.Intn(100))
	track.Exp += gain
	for track.Level < MaxLevel && track.Exp >= levelExpThreshold(track.Level) {
		track.Level++
	}
	state.setTrack(praType, track)

	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, fmt.Errorf("prabuff: deduct cost: %w", err)
	}
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}

	wire := baseWire(char, praType, track)
	wire["addExp"] = gain
	wire["critMulit"] = didCrit
	return wire, nil
}

func (s *Service) deductCost(char *domainchar.Character, praType int, isGold bool) error {
	if isGold {
		if char.Gold < int64(goldCost) {
			return ErrInsufficientGold
		}
		char.Gold -= int64(goldCost)
		return nil
	}
	if err := char.DeductCurrency(elementCurrencyID(praType), elementCost); err != nil {
		return ErrInsufficientElement
	}
	return nil
}

func elementCurrencyID(praType int) int {
	if praType >= 5 {
		return domainchar.CurrencyYijieElement
	}
	return domainchar.CurrencyElementPoint
}

func elementBalance(char *domainchar.Character, praType int) int {
	if praType >= 5 {
		return char.YijieElement
	}
	return char.ElementPoint
}

func baseWire(char *domainchar.Character, praType int, track Track) map[string]interface{} {
	return map[string]interface{}{
		"praType":    praType,
		"buff":       track.Level,
		"exp":        track.Exp,
		"goldNum":    char.Gold,
		"elementNum": elementBalance(char, praType),
	}
}
