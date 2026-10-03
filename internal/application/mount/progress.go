// Open-sourced by BaoLT

// Mount progression: feeding (addMountExp) raises lv against TBL_MOUNT type=1
// cumulative exp thresholds; evolving (addMountUpExp) consumes uplev items and rolls
// success = baseRate(type=2 exp) + accumulated lucky points, raising upLv (which lifts
// the level cap and unlocks the next dress) or banking more lucky points on failure.
// Exp gain per fed item (1-3, rare 10) and the success-roll model are inferred from the
// client rules text and TBL_MOUNT columns; calibrate against the live server if needed.
// addMountExp carries a feed MODE, not a literal count: the client (MountPanel.feedMount)
// sends 1 for a single feed and 2 for the x10 batch, mirrored here as "anything != 1 -> 10".
package mount

import (
	"context"
	"math/rand"
)

const maxMountLevelProbe = 60

func (s *Service) computeLevel(exp int, upLv int) int {
	if s.gameData == nil {
		return 0
	}
	level := 0
	for lvl := 0; lvl <= maxMountLevelProbe; lvl++ {
		row := s.gameData.FindMountByTypeAndLevel(1, lvl)
		if row != nil && exp >= int(row.Exp) {
			level = lvl + 1
		}
	}
	if cap := s.levelCap(upLv); cap > 0 && level > cap {
		level = cap
	}
	return level
}

func rollMountExp(count int) int {
	total := 0
	for i := 0; i < count; i++ {
		if rand.Intn(100) < 5 {
			total += 10
		} else {
			total += rand.Intn(3) + 1
		}
	}
	return total
}

func feedCount(mode int) int {
	if mode != 1 {
		return 10
	}
	return 1
}

func (s *Service) AddMountExp(ctx context.Context, charID int64, count int) (map[string]any, error) {
	count = feedCount(count)
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	if cap := s.levelCap(state.UpLv); cap > 0 && state.Lv >= cap {
		return nil, ErrMaxLevel
	}

	have, err := s.itemService.CountCarriedItemsByTemplateID(ctx, charID, mountLevItemTID)
	if err != nil {
		return nil, err
	}
	if have < count {
		return nil, ErrInsufficientItem
	}
	if _, err := s.itemService.ConsumeCarriedItemsByTemplateID(ctx, charID, mountLevItemTID, count); err != nil {
		return nil, err
	}

	gained := rollMountExp(count)
	state.Exp += gained
	state.Lv = s.computeLevel(state.Exp, state.UpLv)
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}

	return map[string]any{
		"addExp": gained,
		"exp":    state.Exp,
		"lev":    state.Lv,
	}, nil
}

func (s *Service) AddMountUpExp(ctx context.Context, charID int64) (map[string]any, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	if s.gameData == nil {
		return nil, ErrMaxRank
	}
	if next := s.gameData.FindMountByTypeAndLevel(2, state.UpLv+1); next == nil {
		return nil, ErrMaxRank
	}
	costRow := s.gameData.FindMountByTypeAndLevel(2, state.UpLv)
	if costRow == nil {
		return nil, ErrMaxRank
	}

	itemTID := mountUpLevItemTID
	if state.UpLv >= advUpLevThreshold {
		itemTID = advMountUpLevItemTID
	}
	need := int(costRow.ItemNum)
	if need < 1 {
		need = 1
	}

	have, err := s.itemService.CountCarriedItemsByTemplateID(ctx, charID, itemTID)
	if err != nil {
		return nil, err
	}
	if have < need {
		return nil, ErrInsufficientItem
	}
	if _, err := s.itemService.ConsumeCarriedItemsByTemplateID(ctx, charID, itemTID, need); err != nil {
		return nil, err
	}

	successRate := int(costRow.Exp) + state.AddRate
	if rand.Intn(100) < successRate {
		state.UpLv++
		state.AddRate = 0
		state.Lv = s.computeLevel(state.Exp, state.UpLv)
		if err := s.saveState(ctx, charID, state); err != nil {
			return nil, err
		}
		return map[string]any{
			"addExp":  0,
			"upLv":    state.UpLv,
			"addRate": state.AddRate,
			"lev":     state.Lv,
		}, nil
	}

	luckyGain := int(costRow.AddRate)
	if luckyGain < 1 {
		luckyGain = 1
	}
	state.AddRate += luckyGain
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return map[string]any{
		"addExp":  luckyGain,
		"addRate": state.AddRate,
	}, nil
}
