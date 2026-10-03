// Open-sourced by BaoLT

package activity

import (
	"context"
	"time"

	domainchar "mcgame-server/internal/domain/character"
)

const pmDailyLoginStateKey = "dailyLoginPmExp"

var pmDailyLoginExpReward = map[int]int64{
	1: 500,
	2: 1000,
	3: 2000,
}

type PMExpChange struct {
	CharacterID     int64
	Delta           int64
	PMExp           int64
	PreviousPMLevel int
	PMLevel         int
	ActiveType      int
}

func (s *PremiumService) ChangePMExp(ctx context.Context, characterID int64, delta int64) (*PMExpChange, error) {
	char, now, changed, err := s.loadCharacter(ctx, characterID)
	if err != nil {
		return nil, err
	}
	if changed {
		if err := s.persistCharacter(ctx, char); err != nil {
			return nil, err
		}
		if err := s.syncAccountVIPLevel(ctx, char, now); err != nil {
			return nil, err
		}
	}

	return s.applyPMExpDelta(ctx, char, now, delta)
}

func (s *PremiumService) GrantDailyLoginPMExp(ctx context.Context, characterID int64) (*PMExpChange, error) {
	char, now, changed, err := s.loadCharacter(ctx, characterID)
	if err != nil {
		return nil, err
	}
	if changed {
		if err := s.persistCharacter(ctx, char); err != nil {
			return nil, err
		}
		if err := s.syncAccountVIPLevel(ctx, char, now); err != nil {
			return nil, err
		}
	}
	if !char.HasActiveVIP(now) {
		return nil, nil
	}

	delta := pmDailyLoginExpReward[char.VIPType]
	if delta <= 0 {
		return nil, nil
	}

	currentDay := pmToString(pmCurrentCycleDay(now, pmOperationCountConfig{CycleType: 1, Window: 1, MaxCount: 1}))
	if pmDailyLoginGrantedToday(char.PMProcessData, currentDay) {
		return nil, nil
	}

	if char.PMProcessData == nil {
		char.PMProcessData = map[string]interface{}{}
	}
	char.PMProcessData[pmDailyLoginStateKey] = map[string]interface{}{
		"day": currentDay,
	}

	return s.applyPMExpDelta(ctx, char, now, delta)
}

func (s *PremiumService) applyPMExpDelta(ctx context.Context, char *domainchar.Character, now time.Time, delta int64) (*PMExpChange, error) {
	if char == nil || delta == 0 {
		return nil, nil
	}

	previousPMLevel := char.CurrentPMLevel(now)
	nextPMExp := char.PMExp + delta
	if nextPMExp < 0 {
		nextPMExp = 0
	}
	actualDelta := nextPMExp - char.PMExp
	if actualDelta == 0 {
		return nil, nil
	}

	char.PMExp = nextPMExp

	if err := s.persistCharacter(ctx, char); err != nil {
		return nil, err
	}
	if err := s.syncAccountVIPLevel(ctx, char, now); err != nil {
		return nil, err
	}

	return &PMExpChange{
		CharacterID:     char.ID,
		Delta:           actualDelta,
		PMExp:           char.PMExp,
		PreviousPMLevel: previousPMLevel,
		PMLevel:         char.CurrentPMLevel(now),
		ActiveType:      char.VIPType,
	}, nil
}

func pmDailyLoginGrantedToday(pmProcessData map[string]interface{}, currentDay string) bool {
	if len(pmProcessData) == 0 {
		return false
	}

	raw, ok := pmProcessData[pmDailyLoginStateKey]
	if !ok {
		return false
	}

	entry, ok := raw.(map[string]interface{})
	if !ok {
		return false
	}

	return pmToString(entry["day"]) == currentDay
}
