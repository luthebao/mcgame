// Open-sourced by BaoLT

// PRS chip swap (reroll/convert) — swapPRSChip rerolls the chips staged in the excBag
// (the 1-3 exchange slots) into freshly-drawn chip ids, and swapPRSChipTimes does the
// same across every occupied exc slot at once. Both push updatePRSExcBag (the drained
// staging slots) + updatePRSChipBag (the rerolled chips) and one onGetPRSChip per
// yielded chip.
//
// CALIBRATION / SAFETY — data_tbl_prs_chip carries no swap-rule, conversion-rate, or
// loss/yield column, so the exact swap mechanic is unknown. The conservative
// interpretation baked in here is NET-ZERO: each consumed staged chip yields exactly
// one rerolled chip (count preserved), drawn from the SAME tunable chipDrawWeights pool
// as the collect draws. This requires the player to already own the staged chips, so it
// cannot mint chips from nothing (no exploit). The yielded distribution recalibrates
// with chipDrawWeights; if a live-log reveals a different conversion (e.g. N→1 upgrade
// or a fixed loss rate) only this file's reroll loop needs revisiting.
package prs

import (
	"context"
	"sort"
)

func (s *Service) SwapChip(ctx context.Context, charID int64) (*State, []ChipReward, error) {
	return s.swap(ctx, charID, false)
}

func (s *Service) SwapChipTimes(ctx context.Context, charID int64) (*State, []ChipReward, error) {
	return s.swap(ctx, charID, true)
}

func (s *Service) swap(ctx context.Context, charID int64, all bool) (*State, []ChipReward, error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	if _, total := s.drawPool(); total <= 0 {
		return nil, nil, ErrNoChipPool
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, nil, err
	}

	positions := occupiedExcPositions(state.ExcBag)
	if len(positions) == 0 {
		return nil, nil, ErrInsufficientChips
	}
	if !all {
		positions = positions[:1]
	}

	rewards := make([]ChipReward, 0, len(positions))
	for _, pos := range positions {
		slot := state.ExcBag[pos]
		delete(state.ExcBag, pos)
		for i := 0; i < slot.ChipNum; i++ {
			chipID, ok := s.drawChip()
			if !ok {
				return nil, nil, ErrNoChipPool
			}
			if !addChipToBag(state.ChipBag, chipID, 1) {
				return nil, nil, ErrChipBagFull
			}
			rewards = append(rewards, ChipReward{TableID: s.chipTableID(chipID), ID: chipID, Num: 1})
		}
	}

	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, nil, err
	}
	return state, mergeRewards(rewards), nil
}

func occupiedExcPositions(bag map[int]ChipSlot) []int {
	positions := make([]int, 0, len(bag))
	for pos, slot := range bag {
		if slot.ChipNum > 0 {
			positions = append(positions, pos)
		}
	}
	sort.Ints(positions)
	return positions
}
