// Open-sourced by BaoLT

// Awakening service. This file holds the talent-point allocation path: addAwakenPoint /
// reduceAwakenPoint (the awakenPointDict writer) and AddAwakenPoints (a pool seed).
// State persists under feature_key 'awakening'; the pool is initialized from
// character_progression on first write.
//
// Skill meta (cost/max/req/code) comes from TBL_AWAKENING_SKILL via gameData. Both
// allocation RPCs reply with {awakenPoint, awakenPointUsed, awakenDict} as the inline
// Responder result (the client routes it to onAddAwakenPoint).
//
// The probabilistic level-up gacha (awakening / ensureBuyAwaken) lives in gacha.go and
// shares this Service; its cross-service dependencies (charRepo / ItemPort /
// ProgressionWriter / rng) are injected via the setters below so the allocation wiring
// stays unchanged.
package awaken

import (
	"context"
	"errors"
	"fmt"
	"math/rand"
	"time"

	"mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata"

	"go.uber.org/zap"
)

const featureKey = domainfeature.FeatureAwakening

var (
	ErrUnknownSkill       = errors.New("giác tỉnh: kỹ năng không hợp lệ")
	ErrInsufficientPoints = errors.New("giác tỉnh: không đủ điểm giác ngộ")
	ErrMaxSkillLevel      = errors.New("giác tỉnh: thiên phú đã đạt cấp tối đa")
	ErrReqNotMet          = errors.New("giác tỉnh: chưa đủ điểm giác ngộ tích lũy")
	ErrNotLearned         = errors.New("giác tỉnh: chưa học thiên phú này")
	ErrInvalidArgs        = errors.New("giác tỉnh: tham số không hợp lệ")
)

type Service struct {
	featureRepo domainfeature.Repository
	gameData    *gamedata.Manager
	logger      *zap.Logger

	charRepo character.Repository
	items    ItemPort
	progress ProgressionWriter
	rng      floatRoller
}

type floatRoller interface {
	Float64() float64
}

func NewService(featureRepo domainfeature.Repository, gameData *gamedata.Manager, logger *zap.Logger) *Service {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Service{
		featureRepo: featureRepo,
		gameData:    gameData,
		logger:      logger,
		rng:         rand.New(rand.NewSource(time.Now().UnixNano())),
	}
}

func (s *Service) SetCharacterRepository(repo character.Repository) { s.charRepo = repo }

func (s *Service) SetItemPort(port ItemPort) { s.items = port }

func (s *Service) SetProgressionWriter(w ProgressionWriter) { s.progress = w }

func (s *Service) SetRandSource(src rand.Source) {
	if src == nil {
		return
	}
	s.rng = rand.New(src)
}

func (s *Service) setRoller(r floatRoller) {
	if r != nil {
		s.rng = r
	}
}

func (s *Service) loadState(ctx context.Context, charID int64) (*State, error) {
	states, err := s.featureRepo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("awaken: load feature states: %w", err)
	}
	for _, st := range states {
		if st != nil && st.FeatureKey == featureKey {
			return stateFromMap(st.State), nil
		}
	}
	state := defaultState()
	if prog, err := s.featureRepo.GetCharacterProgression(ctx, charID); err == nil && prog != nil {
		state.Point = prog.AwakenPoints
		state.PointUsed = prog.AwakenPointsUsed
	}
	return state, nil
}

func (s *Service) saveState(ctx context.Context, charID int64, state *State) error {
	return s.featureRepo.UpsertCharacterFeatureState(ctx, &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  featureKey,
		State:       state.toPersist(),
	})
}

func (s *Service) AddPoint(ctx context.Context, charID int64, skillID int) (map[string]interface{}, error) {
	skill := s.gameData.GetAwakeningSkill(skillID)
	if skill == nil {
		return nil, ErrUnknownSkill
	}
	cost := int(skill.CostPoints)
	maxLevel := int(skill.MaxLevel)
	reqPoints := int(skill.ReqPoints)
	code := skillCode(skill.SkillCodeName)

	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	if state.Point < cost {
		return nil, ErrInsufficientPoints
	}
	if state.PointDict[code] >= maxLevel {
		return nil, ErrMaxSkillLevel
	}
	if state.PointUsed < reqPoints {
		return nil, ErrReqNotMet
	}

	state.Point -= cost
	state.PointUsed += cost
	state.PointDict[code]++
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return state.wire(), nil
}

func (s *Service) ReducePoint(ctx context.Context, charID int64, skillID int) (map[string]interface{}, error) {
	skill := s.gameData.GetAwakeningSkill(skillID)
	if skill == nil {
		return nil, ErrUnknownSkill
	}
	cost := int(skill.CostPoints)
	code := skillCode(skill.SkillCodeName)

	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	if state.PointDict[code] <= 0 {
		return nil, ErrNotLearned
	}

	state.Point += cost
	state.PointUsed -= cost
	if state.PointUsed < 0 {
		state.PointUsed = 0
	}
	state.PointDict[code]--
	if state.PointDict[code] <= 0 {
		delete(state.PointDict, code)
	}
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return state.wire(), nil
}

func (s *Service) AddAwakenPoints(ctx context.Context, charID int64, n int) error {
	if n <= 0 {
		return ErrInvalidArgs
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return err
	}
	state.Point += n
	return s.saveState(ctx, charID, state)
}
