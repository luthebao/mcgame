// Open-sourced by BaoLT

// PRS chip collect / swap draws — the deferred gacha actions for the Pet Real Soul
// panel: freePRSCollect, goldPRSCollect (148 gold), goldPRSCollectThree (888 gold),
// swapPRSChip, swapPRSChipTimes. All reuse the existing chipBag/excBag plumbing in
// service.go (addChipToBag / consumeChips / firstFreeChipPos) and emit ChipReward
// values the handler turns into onGetPRSChip{t,id,num} + updatePRSChipBag pushes.
//
// CALIBRATION — the ONE unknown (documented assumption):
// data_tbl_prs_chip has NO probability / weight / quantity / draw-pool column, and no
// separate gacha table exists schema-wide. The real per-chip drop rate is unknown, so
// the draw distribution here is ASSUMED uniform over chip ids 1-10 and expressed as a
// single tunable weight table (chipDrawWeights). To recalibrate against a live-log,
// edit chipDrawWeights only — no logic change. A naive uniform pool makes the rare
// cost_crystal=2000 chip (id 10) as likely as the cheap id 1, which is almost certainly
// economically wrong; the weight table is the correction seam (e.g. weight rare ids
// lower) once real rates are observed.
//
// EXPLOIT GATE — freePRSCollect costs 0 gold, so it MUST be rate-limited or it mints
// infinite chips. The Flash client (PRSPanel.as) shows no cooldown field for the free
// button (only goldLockFlag, a money-spend confirmation), so the gate is enforced
// SERVER-side here as a daily count (freeCollectDailyLimit), persisted in the prs state
// under a server-only "freeCollect" key the login read-path ignores. Gold draws are
// uncapped (the client gold cost is the throttle).
package prs

import (
	"context"
	"errors"
	"fmt"
	"sort"

	"go.uber.org/zap"
)

const (
	goldCollectCost       = 148
	goldCollectThreeCost  = 888
	goldCollectThreeQty   = 3
	freeCollectDailyLimit = 5
	dayLayout             = "2006-01-02"
)

var (
	ErrInsufficientGold = errors.New("prs: không đủ vàng")
	ErrFreeCollectLimit = errors.New("prs: đã hết lượt nhận miễn phí hôm nay")
	ErrNoChipPool       = errors.New("prs: không có mảnh vỡ trong kho dữ liệu")
)

var chipDrawWeights = map[int]int{
	1:  1,
	2:  1,
	3:  1,
	4:  1,
	5:  1,
	6:  1,
	7:  1,
	8:  1,
	9:  1,
	10: 1,
}

type weightedChip struct {
	id     int
	weight int
}

func (s *Service) drawPool() ([]weightedChip, int) {
	ids := make([]int, 0, len(chipDrawWeights))
	for id := range chipDrawWeights {
		ids = append(ids, id)
	}
	sort.Ints(ids)
	pool := make([]weightedChip, 0, len(ids))
	total := 0
	for _, id := range ids {
		weight := chipDrawWeights[id]
		if weight <= 0 {
			continue
		}
		if s.gameData == nil || s.gameData.GetPrsChip(id) == nil {
			continue
		}
		pool = append(pool, weightedChip{id: id, weight: weight})
		total += weight
	}
	return pool, total
}

func (s *Service) drawChip() (int, bool) {
	pool, total := s.drawPool()
	if total <= 0 {
		return 0, false
	}
	roll := s.rng.Intn(total)
	for _, wc := range pool {
		roll -= wc.weight
		if roll < 0 {
			return wc.id, true
		}
	}
	return pool[len(pool)-1].id, true
}

func (s *Service) chipTableID(chipID int) int {
	if tpl := s.gameData.GetPrsChip(chipID); tpl != nil {
		return tpl.TableID()
	}
	return 0
}

func (s *Service) today() string {
	return s.nowFn().Format(dayLayout)
}

func (s *Service) FreeCollect(ctx context.Context, charID int64) (*State, []ChipReward, error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	if _, total := s.drawPool(); total <= 0 {
		return nil, nil, ErrNoChipPool
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, nil, err
	}
	today := s.today()
	if state.FreeCollectDay != today {
		state.FreeCollectDay = today
		state.FreeCollectN = 0
	}
	if state.FreeCollectN >= freeCollectDailyLimit {
		return nil, nil, ErrFreeCollectLimit
	}
	state.FreeCollectN++

	rewards, err := s.applyDraws(state, 1)
	if err != nil {
		return nil, nil, err
	}
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, nil, err
	}
	return state, rewards, nil
}

func (s *Service) GoldCollect(ctx context.Context, charID int64) (*State, []ChipReward, error) {
	return s.goldCollect(ctx, charID, goldCollectCost, 1)
}

func (s *Service) GoldCollectThree(ctx context.Context, charID int64) (*State, []ChipReward, error) {
	return s.goldCollect(ctx, charID, goldCollectThreeCost, goldCollectThreeQty)
}

func (s *Service) goldCollect(ctx context.Context, charID int64, cost, qty int) (*State, []ChipReward, error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	if _, total := s.drawPool(); total <= 0 {
		return nil, nil, ErrNoChipPool
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, nil, err
	}
	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, nil, err
	}
	if char.Gold < int64(cost) {
		return nil, nil, ErrInsufficientGold
	}
	rewards, err := s.applyDraws(state, qty)
	if err != nil {
		return nil, nil, err
	}

	char.Gold -= int64(cost)
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, nil, fmt.Errorf("prs: deduct gold: %w", err)
	}
	if err := s.saveState(ctx, charID, state); err != nil {
		s.logger.Error("prs: gold deducted but chip save failed",
			zap.Int64("char_id", charID), zap.Int("cost", cost), zap.Error(err))
		return nil, nil, err
	}
	return state, rewards, nil
}

func (s *Service) applyDraws(state *State, qty int) ([]ChipReward, error) {
	rewards := make([]ChipReward, 0, qty)
	for i := 0; i < qty; i++ {
		chipID, ok := s.drawChip()
		if !ok {
			return nil, ErrNoChipPool
		}
		if !addChipToBag(state.ChipBag, chipID, 1) {
			return nil, ErrChipBagFull
		}
		rewards = append(rewards, ChipReward{TableID: s.chipTableID(chipID), ID: chipID, Num: 1})
	}
	return mergeRewards(rewards), nil
}

func mergeRewards(rewards []ChipReward) []ChipReward {
	if len(rewards) <= 1 {
		return rewards
	}
	index := map[int]int{}
	merged := make([]ChipReward, 0, len(rewards))
	for _, r := range rewards {
		if pos, ok := index[r.ID]; ok {
			merged[pos].Num += r.Num
			continue
		}
		index[r.ID] = len(merged)
		merged = append(merged, r)
	}
	return merged
}
