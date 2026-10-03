// Open-sourced by BaoLT

// Soul acquisition + movement operations: the preySoul crystal gacha, the chip-spend
// exchangeSoul, the temp-bag → char-bag putSoulToBag moves (single + all),
// openPetSoulBag (soulExp-gated pet tier-2 slot unlock), and the drag-swap.
//
// CONSUME-THEN-CREDIT: every path persists the currency deduction + state save before
// crediting the gem, so a mid-failure never grants for free.
//
// DEFERRED / DOCUMENTED ASSUMPTION (the one calibration gap): preySoul's drop pool —
// which pet_soul ids each crystal tier rolls and the per-id weights — exists in neither
// DB nor client. We assume crystal index N (1..5) draws uniformly from the data_tbl_pet_soul
// rows whose color == N-1 (the 5 color tiers 0..4 line up with the 5 crystals), num=1, and
// the premium key (index 6) draws from the top color tier. Only the non-exchange pool
// (type=-1) is eligible; type=1 rows are chip-exchange-only. The whole curve is the single
// tunable preyCrystalPool table below — swap it once a preySoul live-log lands.
package soul

import (
	"context"
	"fmt"
	"math/rand"
	"sort"

	"go.uber.org/zap"
)

func exchangeFail(failType int) map[string]any {
	return map[string]any{"type": failType}
}

var soulCrystalCost = [6]int64{4000, 5000, 7000, 9000, 12000, 200}

var soulPetBagAddCost = map[int]int64{
	1: 20000, 2: 25000, 3: 30000, 4: 35000,
	5: 40000, 6: 45000, 7: 50000, 8: 55000,
}

var preyCrystalPool = map[int]int{
	1: 0,
	2: 1,
	3: 2,
	4: 3,
	5: 4,
	6: 4,
}

func crystalCost(index int) (int64, bool) {
	if index < 1 || index > len(soulCrystalCost) {
		return 0, false
	}
	return soulCrystalCost[index-1], true
}

func crystalPersistSid(index int) int {
	if index >= 2 && index <= 5 {
		return index
	}
	return 0
}

func (s *Service) preyPoolFor(index int) []int {
	color, ok := preyCrystalPool[index]
	if !ok || s.gameData == nil {
		return nil
	}
	ids := make([]int, 0, 64)
	for _, tpl := range s.gameData.SoulAllPetSouls() {
		if tpl == nil {
			continue
		}
		if int(tpl.Type) != -1 {
			continue
		}
		if int(tpl.Color) != color {
			continue
		}
		ids = append(ids, int(tpl.ID))
	}
	sort.Ints(ids)
	return ids
}

func (s *Service) rollPreySoul(index int, rng *rand.Rand) int {
	ids := s.preyPoolFor(index)
	if len(ids) == 0 {
		return 0
	}
	if rng == nil {
		return ids[rand.Intn(len(ids))]
	}
	return ids[rng.Intn(len(ids))]
}

func (s *Service) firstFreeTempSlot(state *CharSoulState) int {
	for i := 1; i <= maxTempSoulSlots; i++ {
		if _, taken := state.TempBag[i]; !taken {
			return i
		}
	}
	return 0
}

func (s *Service) PreySoul(ctx context.Context, charID int64, index int, moneyFlag bool, rng *rand.Rand) (map[string]any, error) {
	cost, ok := crystalCost(index)
	if !ok {
		return nil, ErrInvalidCrystal
	}
	state, err := s.loadCharState(ctx, charID)
	if err != nil {
		return nil, err
	}
	tempIdx := s.firstFreeTempSlot(state)
	if tempIdx <= 0 {
		return nil, ErrTempBagFull
	}
	rolledSid := s.rollPreySoul(index, rng)
	if rolledSid <= 0 {
		return nil, ErrEmptyPool
	}
	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, err
	}
	spent := int64(0)
	if !moneyFlag {
		if char.SoulPoints < cost {
			return nil, ErrInsufficientChip
		}
		char.SoulPoints -= cost
		if err := s.charRepo.Update(ctx, char); err != nil {
			return nil, fmt.Errorf("soul: spend soulPnt: %w", err)
		}
		spent = cost
	}
	state.TempBag[tempIdx] = rolledSid
	state.CrystalSid = crystalPersistSid(index)
	if err := s.saveCharState(ctx, charID, state); err != nil {
		s.logger.Error("soul: preySoul deducted but state save failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, err
	}
	return map[string]any{
		"sidObj":    map[string]any{"index": tempIdx, "ii": rolledSid},
		"newIndex":  index,
		"point":     char.SoulPoints,
		"moneyFlag": moneyFlag,
		"spent":     spent,
	}, nil
}

func (s *Service) ExchangeSoul(ctx context.Context, charID int64, soulID int) (map[string]any, error) {
	tpl := s.petSoulTemplate(soulID)
	if tpl == nil || int(tpl.Type) != 1 {
		return exchangeFail(3), nil
	}
	cost := int64(tpl.ReqChip)
	state, err := s.loadCharState(ctx, charID)
	if err != nil {
		return nil, err
	}
	slot := s.firstFreeSlot(state)
	if slot <= 0 {
		return exchangeFail(2), nil
	}
	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, err
	}
	if char.SoulPoints < cost {
		return exchangeFail(3), nil
	}
	char.SoulPoints -= cost
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, fmt.Errorf("soul: exchange spend chip: %w", err)
	}
	gem := SoulSlot{Sid: soulID}
	state.Slots[slot] = gem
	if err := s.saveCharState(ctx, charID, state); err != nil {
		s.logger.Error("soul: exchange deducted but state save failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, err
	}
	return map[string]any{
		"type":     1,
		"soulData": slotWire(slot, gem, 0),
		"chip":     char.SoulPoints,
	}, nil
}
