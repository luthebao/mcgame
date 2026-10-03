// Open-sourced by BaoLT

// Astrology application service manages the 12-cung pick/refresh panel
// (getAstrologicData, refreshStars, pickStar).
// State is persisted into the character_stat_features JSONB row keyed
// feature_key="magic_array", reusing the same row that login serializers
// already read for starsData / astrologicData.
//
// Pick economy (from observed live captures):
//
//	maxPickTimes    = 12 (total free picks per cycle)
//	maxRefreshTimes = 10 (total free refreshes per cycle)
//	npPntPerPick    = 12 (npPnt credited per successful pick)
//
// Formula completion: formula[i] is a []int of star sids that must all appear
// in starsCollected to trigger the formula-i award. Each formula fires exactly
// once per cycle (tracked via FormulasClaimed).
// Gold cost for refresh beyond free quota is an open question (OQ: astrologic-economy).
//
// Concurrency: mutateState serializes all Load->mutate->Save paths per charID
// using a per-player sync.Mutex stored in playerLocks (sync.Map).
//
// State encode/decode: state.go
// Formula evaluation:  formulas.go
package astrology

import (
	"context"
	"errors"
	"math/rand"
	"sync"

	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"

	"go.uber.org/zap"
)

const (
	MaxPickTimes    = 12
	MaxRefreshTimes = 10
	CandidateCount  = 3
	MinStarSid      = 1
	MaxStarSid      = 12
	NpPntPerPick    = 12
)

var (
	ErrInvalidPickIndex   = errors.New("invalid star pick index")
	ErrNoPickTimesLeft    = errors.New("no pick times remaining")
	ErrNoRefreshTimesLeft = errors.New("no refresh times remaining")
)

type AstrologicState struct {
	StarsCollected  []int
	StarsToPick     []int
	PickCount       int
	RefreshCount    int
	BuyPickCount    int
	FormulasClaimed []int
}

type PickResult struct {
	Sid          int
	LeftTimes    int
	BuyTimes     int
	RefreshTimes int
	NewStars     []int
	FormulaAward *FormulaAward
	NpPntDelta   int
	NpPntBalance int
}

type FormulaAward struct {
	Aid     int
	Fid     string
	Formula []int
	Mult    int
	Stars   []int
}

type RefreshResult struct {
	RefreshTimes int
	StarsToPick  []int
}

type Service struct {
	repo        domainfeature.Repository
	charRepo    domainchar.Repository
	logger      *zap.Logger
	playerLocks sync.Map
}

func NewService(repo domainfeature.Repository, charRepo domainchar.Repository, logger *zap.Logger) *Service {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Service{
		repo:     repo,
		charRepo: charRepo,
		logger:   logger,
	}
}

func (s *Service) playerLock(charID int64) *sync.Mutex {
	v, _ := s.playerLocks.LoadOrStore(charID, &sync.Mutex{})
	return v.(*sync.Mutex)
}

func (s *Service) Load(ctx context.Context, charID int64) (*AstrologicState, error) {
	if s == nil || s.repo == nil {
		return defaultState(), nil
	}
	states, err := s.repo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, err
	}
	for _, st := range states {
		if st == nil || st.FeatureKey != domainfeature.FeatureMagicArray {
			continue
		}
		return decodeState(st.State), nil
	}
	return defaultState(), nil
}

func (s *Service) GetAstrologicData(ctx context.Context, charID int64) (*AstrologicState, error) {
	mu := s.playerLock(charID)
	mu.Lock()
	defer mu.Unlock()

	state, err := s.Load(ctx, charID)
	if err != nil {
		return nil, err
	}
	if len(state.StarsToPick) == 0 {
		state.StarsToPick = rollCandidates(state.StarsCollected)
		if err := s.save(ctx, charID, state); err != nil {
			return nil, err
		}
	}
	return state, nil
}

func (s *Service) RefreshStars(ctx context.Context, charID int64) (*RefreshResult, error) {
	mu := s.playerLock(charID)
	mu.Lock()
	defer mu.Unlock()

	state, err := s.Load(ctx, charID)
	if err != nil {
		return nil, err
	}
	if state.RefreshCount >= MaxRefreshTimes {
		return nil, ErrNoRefreshTimesLeft
	}
	state.RefreshCount++
	state.StarsToPick = rollCandidates(state.StarsCollected)
	if err := s.save(ctx, charID, state); err != nil {
		return nil, err
	}
	return &RefreshResult{
		RefreshTimes: MaxRefreshTimes - state.RefreshCount,
		StarsToPick:  state.StarsToPick,
	}, nil
}

func (s *Service) PickStar(ctx context.Context, charID int64, sidArg int) (*PickResult, error) {
	if sidArg < MinStarSid || sidArg > MaxStarSid {
		return nil, ErrInvalidPickIndex
	}

	mu := s.playerLock(charID)
	mu.Lock()
	defer mu.Unlock()

	state, err := s.Load(ctx, charID)
	if err != nil {
		return nil, err
	}
	if len(state.StarsToPick) == 0 {
		state.StarsToPick = rollCandidates(state.StarsCollected)
	}

	validSid := false
	for _, sid := range state.StarsToPick {
		if sid == sidArg {
			validSid = true
			break
		}
	}
	if !validSid {
		return nil, ErrInvalidPickIndex
	}

	if state.PickCount >= MaxPickTimes && state.BuyPickCount <= 0 {
		return nil, ErrNoPickTimesLeft
	}

	state.StarsCollected = append(state.StarsCollected, sidArg)

	if state.PickCount < MaxPickTimes {
		state.PickCount++
	} else {
		state.BuyPickCount--
	}

	state.StarsToPick = rollCandidates(state.StarsCollected)

	award := evaluateFormulas(state.StarsCollected, state.FormulasClaimed)
	if award != nil {
		state.FormulasClaimed = append(state.FormulasClaimed, award.Aid)
	}

	npPntDelta := NpPntPerPick
	if award != nil {
		npPntDelta += award.Aid
	}

	var npPntBalance int
	if s.charRepo != nil {
		char, charErr := s.charRepo.FindByID(ctx, charID)
		if charErr == nil && char != nil {
			if addErr := char.AddCurrency(domainchar.CurrencyNpPoint, npPntDelta); addErr == nil {
				if updateErr := s.charRepo.Update(ctx, char); updateErr == nil {
					npPntBalance = char.NpPoint
				} else {
					s.logger.Warn("astrology: failed to persist npPnt",
						zap.Int64("char_id", charID),
						zap.Error(updateErr))
				}
			} else {
				s.logger.Warn("astrology: AddCurrency npPnt failed",
					zap.Int64("char_id", charID),
					zap.Error(addErr))
			}
		} else if charErr != nil {
			s.logger.Warn("astrology: FindByID for npPnt failed",
				zap.Int64("char_id", charID),
				zap.Error(charErr))
		}
	}

	if err := s.save(ctx, charID, state); err != nil {
		return nil, err
	}

	leftTimes := MaxPickTimes - state.PickCount
	if leftTimes < 0 {
		leftTimes = 0
	}
	return &PickResult{
		Sid:          sidArg,
		LeftTimes:    leftTimes,
		BuyTimes:     state.BuyPickCount,
		RefreshTimes: MaxRefreshTimes - state.RefreshCount,
		NewStars:     state.StarsToPick,
		FormulaAward: award,
		NpPntDelta:   npPntDelta,
		NpPntBalance: npPntBalance,
	}, nil
}

func (s *Service) save(ctx context.Context, charID int64, state *AstrologicState) error {
	encoded := encodeState(state)
	return s.repo.UpsertCharacterFeatureState(ctx, &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  domainfeature.FeatureMagicArray,
		State:       encoded,
	})
}

func rollCandidates(collected []int) []int {
	candidates := make([]int, 0, CandidateCount)
	attempts := 0
	for len(candidates) < CandidateCount && attempts < 100 {
		attempts++
		sid := rand.Intn(MaxStarSid-MinStarSid+1) + MinStarSid
		duplicate := false
		for _, c := range candidates {
			if c == sid {
				duplicate = true
				break
			}
		}
		if !duplicate {
			candidates = append(candidates, sid)
		}
	}
	for len(candidates) < CandidateCount {
		candidates = append(candidates, MinStarSid)
	}
	return candidates
}
