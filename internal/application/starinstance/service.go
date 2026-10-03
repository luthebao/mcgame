// Open-sourced by BaoLT

// Star instance application service for Tinh Giới Thập Nhị Cung (12x12 zodiac PvE grid).
// Manages daily attempt tracking, lifetime score grid, gold purchases for extra attempts,
// and battle result processing. State persisted under character_feature_states
// with feature_key='star_instance'. Party support: each member spends one attempt and
// earns full starPnt on win.
package starinstance

import (
	"context"
	"errors"
	"fmt"
	"time"

	appstar "mcgame-server/internal/application/star"
	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"

	"go.uber.org/zap"
)

const (
	featureKeyStarInstance = "star_instance"
)

var (
	ErrInvalidSid          = errors.New("sid phải nằm trong khoảng 1-12")
	ErrInvalidLevel        = errors.New("level phải nằm trong khoảng 1-12")
	ErrOutOfAttempts       = errors.New("số lần khiêu chiến đã hết")
	ErrAttemptCapReached   = errors.New("đã đạt giới hạn số lần mua tối đa")
	ErrInsufficientGold    = errors.New("không đủ vàng")
	ErrInvalidCurrentMax   = errors.New("giá trị currentMax không hợp lệ")
	ErrCultivationRequired = errors.New("cần nâng cấp tinh cung trước")
	ErrCharacterNotFound   = errors.New("không tìm thấy nhân vật")
)

type Service struct {
	charRepo    domainchar.Repository
	featureRepo domainfeature.Repository
	starService *appstar.Service
	nowFunc     func() time.Time
	logger      *zap.Logger
}

func NewService(charRepo domainchar.Repository, featureRepo domainfeature.Repository, starService *appstar.Service, logger *zap.Logger) *Service {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Service{
		charRepo:    charRepo,
		featureRepo: featureRepo,
		starService: starService,
		nowFunc:     time.Now,
		logger:      logger,
	}
}

func (s *Service) SetNowFunc(fn func() time.Time) {
	if fn != nil {
		s.nowFunc = fn
	}
}

type ClickResult struct {
	Code         int
	OffenderID   int64
	OffenderName string
}

type BattleEndResult struct {
	Score      int
	NewStarPnt int
	Win        bool
}

func (s *Service) currentCycle() int {
	now := s.nowFunc()
	return now.Year()*10000 + int(now.Month())*100 + now.Day()
}

func (s *Service) loadState(ctx context.Context, charID int64) (*WarMapState, error) {
	states, err := s.featureRepo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("star_instance: load feature states: %w", err)
	}
	cycle := s.currentCycle()
	for _, st := range states {
		if st == nil || st.FeatureKey != featureKeyStarInstance {
			continue
		}
		return WarMapStateFromMap(st.State, cycle), nil
	}
	return defaultWarMapState(cycle), nil
}

func (s *Service) saveState(ctx context.Context, charID int64, state *WarMapState) error {
	return s.featureRepo.UpsertCharacterFeatureState(ctx, &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  featureKeyStarInstance,
		State:       state.ToMap(),
	})
}

func (s *Service) GetWarMap(ctx context.Context, charID int64) (*WarMapState, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	cycle := s.currentCycle()
	state.MaybeResetForCycle(cycle)
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return state, nil
}

func (s *Service) WarMapLoginGrid(ctx context.Context, charID int64) (map[string]any, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	state.MaybeResetForCycle(s.currentCycle())
	return state.LoginGrid(), nil
}

func (s *Service) AddWarMapTime(ctx context.Context, charID int64, currentMax int) (int, error) {
	if currentMax < WarMapMinSmax || currentMax >= WarMapMaxSmax {
		return 0, ErrInvalidCurrentMax
	}

	state, err := s.loadState(ctx, charID)
	if err != nil {
		return 0, err
	}
	cycle := s.currentCycle()
	state.MaybeResetForCycle(cycle)

	if state.DailyMax >= WarMapMaxSmax {
		return 0, ErrAttemptCapReached
	}
	if state.DailyMax != currentMax {
		return 0, ErrInvalidCurrentMax
	}

	cost := int64((state.DailyMax - 4) * 10)

	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return 0, err
	}
	if char == nil {
		return 0, ErrCharacterNotFound
	}
	if char.Gold < cost {
		return 0, ErrInsufficientGold
	}

	char.Gold -= cost
	if err := s.charRepo.Update(ctx, char); err != nil {
		return 0, fmt.Errorf("star_instance: deduct gold: %w", err)
	}

	state.DailyMax++
	if err := s.saveState(ctx, charID, state); err != nil {
		return 0, err
	}

	return state.DailyMax, nil
}

func (s *Service) ClickWarMap(ctx context.Context, leaderID int64, partyIDs []int64, sid, level int) (*ClickResult, error) {
	if sid < WarMapSidMin || sid > WarMapSidMax {
		return nil, ErrInvalidSid
	}
	if level < WarMapLevelMin || level > WarMapLevelMax {
		return nil, ErrInvalidLevel
	}

	memberIDs := buildMemberList(leaderID, partyIDs)

	type memberState struct {
		charID int64
		name   string
		state  *WarMapState
		char   *domainchar.Character
	}

	cycle := s.currentCycle()
	loaded := make([]memberState, 0, len(memberIDs))

	for _, charID := range memberIDs {
		char, err := s.charRepo.FindByID(ctx, charID)
		if err != nil {
			return nil, err
		}
		if char == nil {
			return &ClickResult{Code: -5, OffenderID: charID, OffenderName: ""}, nil
		}

		if s.starService != nil {
			starsState, err := s.starService.Load(ctx, charID)
			if err != nil {
				return nil, err
			}
			slot := starsState[sid]
			if slot == nil || slot.Level < level {
				return &ClickResult{Code: -2, OffenderID: charID, OffenderName: char.Name}, nil
			}
		}

		wmState, err := s.loadState(ctx, charID)
		if err != nil {
			return nil, err
		}
		wmState.MaybeResetForCycle(cycle)

		if wmState.DailyUsed >= wmState.DailyMax {
			return &ClickResult{Code: -3, OffenderID: charID, OffenderName: char.Name}, nil
		}

		loaded = append(loaded, memberState{charID: charID, name: char.Name, state: wmState, char: char})
	}

	for _, ms := range loaded {
		ms.state.DailyUsed++
		if err := s.saveState(ctx, ms.charID, ms.state); err != nil {
			s.logger.Error("star_instance: failed to save snum increment",
				zap.Int64("char_id", ms.charID),
				zap.Error(err))
			return nil, err
		}
	}

	return &ClickResult{Code: 1}, nil
}

func (s *Service) OnBattleEnd(ctx context.Context, charID int64, sid, level, deaths int, elapsedSec int64, win bool) (*BattleEndResult, error) {
	if sid < WarMapSidMin || sid > WarMapSidMax {
		return nil, ErrInvalidSid
	}
	if level < WarMapLevelMin || level > WarMapLevelMax {
		return nil, ErrInvalidLevel
	}

	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	cycle := s.currentCycle()
	state.MaybeResetForCycle(cycle)

	score := 0
	newStarPnt := 0

	if win {
		score = ComputeScore(deaths, elapsedSec)
		existing := state.Scores[level][sid]
		if float64(score) > existing {
			state.Scores[level][sid] = float64(score)
		}

		char, err := s.charRepo.FindByID(ctx, charID)
		if err != nil {
			return nil, err
		}
		if char == nil {
			return nil, ErrCharacterNotFound
		}

		award := StarPntForLevel(level)
		if err := char.AddCurrency(domainchar.CurrencyStarPnt, award); err != nil {
			s.logger.Error("star_instance: failed to add starPnt",
				zap.Int64("char_id", charID),
				zap.Error(err))
		} else {
			if err := s.charRepo.Update(ctx, char); err != nil {
				return nil, fmt.Errorf("star_instance: save starPnt: %w", err)
			}
		}
		newStarPnt = char.StarPnt
	}

	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}

	return &BattleEndResult{
		Score:      score,
		NewStarPnt: newStarPnt,
		Win:        win,
	}, nil
}

func buildMemberList(leaderID int64, partyIDs []int64) []int64 {
	seen := map[int64]bool{leaderID: true}
	result := []int64{leaderID}
	for _, id := range partyIDs {
		if id == leaderID || seen[id] {
			continue
		}
		seen[id] = true
		result = append(result, id)
	}
	return result
}
