// Open-sourced by BaoLT

// Boss daily application service for persistence and daily reset logic.
package activity

import (
	"context"
	"errors"
	"fmt"
	"time"

	domainactivity "mcgame-server/internal/domain/activity"
	domainchar "mcgame-server/internal/domain/character"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const bossDailyDefaultTotal = 16

type BossDailyBattleValidation struct {
	State     *domainactivity.BossDailyState
	CurrentDay string
	CurrentTime int64
	BossIDStr string
	Config    *domainactivity.BossConfigEntry
}

type BossLootResolver interface {
	ResolveBossNIDByDailyID(ctx context.Context, dailyBossID int) (int, string, bool)
}

type BossDailyService struct {
	charRepo     domainchar.Repository
	logger       *zap.Logger
	nowFn        func() time.Time
	lootResolver BossLootResolver
}

func NewBossDailyService(charRepo domainchar.Repository, logger *zap.Logger) *BossDailyService {
	return &BossDailyService{
		charRepo: charRepo,
		logger:   logger,
		nowFn:    time.Now,
	}
}

func (s *BossDailyService) SetNowFunc(fn func() time.Time) {
	if fn != nil {
		s.nowFn = fn
	}
}

func (s *BossDailyService) SetBossLootResolver(r BossLootResolver) {
	s.lootResolver = r
}

func (s *BossDailyService) ResolveBossNIDByDailyID(ctx context.Context, dailyBossID int) (int, string, bool) {
	if s.lootResolver == nil {
		return 0, "", false
	}
	return s.lootResolver.ResolveBossNIDByDailyID(ctx, dailyBossID)
}

func (s *BossDailyService) GetBossDailyData(ctx context.Context, characterID int64) (map[string]interface{}, error) {
	char, err := s.charRepo.FindByID(ctx, characterID)
	if err != nil {
		return nil, err
	}

	now := s.nowFn()
	state := domainactivity.FromMap(char.BossDaily)

	currentDay := bossDailyCycleDay(now)
	changed := false
	if state.IsNewDay(currentDay) {
		state.Reset(currentDay, now.UnixMilli())
		changed = true
	}

	if changed {
		char.BossDaily = state.ToMap()
		if err := s.charRepo.Update(ctx, char); err != nil {
			return nil, err
		}
	}

	currentTime := now.UnixMilli()
	payload := map[string]interface{}{
		"total": bossDailyDefaultTotal,
		"t":     currentTime,
		"data": map[string]interface{}{
			"d":    currentDay,
			"n":    state.UsedCount,
			"now":  currentTime,
			"dfd":  state.DoneForDay,
			"data": state.PerBoss,
		},
	}

	return payload, nil
}

func (s *BossDailyService) ValidateBossDailyBattle(ctx context.Context, characterID int64, bossID int) (*BossDailyBattleValidation, error) {
	config := domainactivity.GetBossConfig(bossID)
	if config == nil {
		return nil, pkgerrors.ErrInvalidInput
	}

	char, err := s.charRepo.FindByID(ctx, characterID)
	if err != nil {
		return nil, err
	}

	now := s.nowFn()
	state := domainactivity.FromMap(char.BossDaily)

	currentDay := bossDailyCycleDay(now)
	if state.IsNewDay(currentDay) {
		state.Reset(currentDay, now.UnixMilli())
	}

	bossIDStr := fmt.Sprintf("%d", bossID)
	currentTime := now.UnixMilli()

	if config.Type == 1 {
		entryN := 0
		if entry, ok := state.PerBoss[bossIDStr]; ok {
			if m, ok := entry.(map[string]interface{}); ok {
				if n, ok := m["n"]; ok {
					switch v := n.(type) {
					case float64:
						entryN = int(v)
					case int:
						entryN = v
					case int64:
						entryN = int(v)
					}
				}
			}
		}
		if entryN >= config.Num {
			return nil, errors.New("no attempts remaining")
		}
		state.PerBoss[bossIDStr] = map[string]interface{}{
			"d": currentDay,
			"n": entryN + 1,
		}
	} else if config.Type == 2 {
		var lastTime int64
		if entry, ok := state.PerBoss[bossIDStr]; ok {
			if m, ok := entry.(map[string]interface{}); ok {
				if t, ok := m["t"]; ok {
					switch v := t.(type) {
					case float64:
						lastTime = int64(v)
					case int:
						lastTime = int64(v)
					case int64:
						lastTime = v
					}
				}
			}
		}
		if lastTime > 0 && lastTime+config.Step > currentTime {
			return nil, errors.New("cooldown not expired")
		}
		state.PerBoss[bossIDStr] = map[string]interface{}{
			"t": currentTime,
		}
	}

	state.UsedCount++
	state.DoneForDay[bossIDStr] = bossID
	state.Day = currentDay
	state.Now = currentTime

	return &BossDailyBattleValidation{
		State:       state,
		CurrentDay:  currentDay,
		CurrentTime: currentTime,
		BossIDStr:   bossIDStr,
		Config:      config,
	}, nil
}

func (s *BossDailyService) CommitBossDailyState(ctx context.Context, characterID int64, state *domainactivity.BossDailyState) error {
	char, err := s.charRepo.FindByID(ctx, characterID)
	if err != nil {
		return err
	}
	char.BossDaily = state.ToMap()
	return s.charRepo.Update(ctx, char)
}

func (s *BossDailyService) BossDailyBattle(ctx context.Context, characterID int64, bossID int) error {
	validation, err := s.ValidateBossDailyBattle(ctx, characterID, bossID)
	if err != nil {
		return err
	}
	return s.CommitBossDailyState(ctx, characterID, validation.State)
}

func (s *BossDailyService) BossDailyFinishByCard(ctx context.Context, characterID int64, bossID int) error {
	config := domainactivity.GetBossConfig(bossID)
	if config == nil {
		return pkgerrors.ErrInvalidInput
	}

	char, err := s.charRepo.FindByID(ctx, characterID)
	if err != nil {
		return err
	}

	state := domainactivity.FromMap(char.BossDaily)

	bossIDStr := fmt.Sprintf("%d", bossID)
	if doneVal, ok := state.DoneForDay[bossIDStr]; !ok {
		return errors.New("boss not defeated today")
	} else {
		switch v := doneVal.(type) {
		case float64:
			if int(v) != bossID {
				return errors.New("boss not defeated today")
			}
		case int:
			if v != bossID {
				return errors.New("boss not defeated today")
			}
		case int64:
			if int(v) != bossID {
				return errors.New("boss not defeated today")
			}
		}
	}

	return nil
}

func bossDailyCycleDay(now time.Time) string {
	return domainactivity.BossDailyCycleDay(int(now.Month())-1, now.Day(), int(now.Weekday()))
}
