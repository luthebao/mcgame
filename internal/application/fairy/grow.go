// Open-sourced by BaoLT

// Fairy cultivation / feeding operations: fairyGrowUp (grow exp), fairyRaise
// (satiety via a crafting material) and addFairyExp (level exp via fruit items).
//
// fairyGrowUp adds growth exp (gexp); the result `exp` is the total gexp gained
// this call, `cri` is the crit tier of the last cultivation (0 normal, 1 small,
// 2 big) and `gnum` the remaining daily cultivations. type0 spends 50000 Money and
// always rolls normal; type1 spends 5 Gold for one cultivation and may crit; type2
// is the 20x batch — it repeats the gold cultivation up to GrowBatchMultiple times,
// charging 5 Gold per iteration actually run and stopping early on out-of-gold, no
// daily cultivations left, or the grow-level cap (only the first iteration's
// shortfall is an error; a partial batch still commits what it ran). Gold is
// deducted in-memory then persisted (Update) before the gexp grant (saveState) —
// consume-then-credit. The per-call base gain is data-grounded against FairyGrowExp
// and always clamped so gexp never exceeds the cap — corruption-safe.
//
// addFairyExp consumes fruit items 3390/3391/3392 from the passed slot ids and adds
// their per-fruit exp (FairyExpFruitGain) to the fairy, clamped to the level cap;
// `num` is the number of fruits consumed and `en` the remaining daily feeds.
package fairy

import (
	"context"
	"math/rand"

	domainitem "mcgame-server/internal/domain/item"
)

const (
	growBaseDivisor = 20
	growMinGain     = 1

	raiseSatietyGain = 100
	satietyMax       = 10000
)

type GrowResult struct {
	F    bool
	Exp  int64
	Cri  int
	Gnum int
	Code string
}

type RaiseResult struct {
	F    bool
	Num  int
	Code string
}

type AddExpResult struct {
	F    bool
	Num  int
	En   int
	Code string
}

func (s *Service) GrowUp(ctx context.Context, charID, fairyID int64, growType int) (*GrowResult, error) {
	if growType != GrowTypeMoney && growType != GrowTypeGold && growType != GrowTypeGoldBatch {
		return &GrowResult{F: false, Code: "out"}, ErrInvalidGrowType
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	f, ok := state.fairy(fairyID)
	if !ok {
		return &GrowResult{F: false, Code: "out"}, ErrFairyMissing
	}
	s.refreshDaily(f)
	if gexpToLv(f.Gexp) >= FairyGrowLevel {
		return &GrowResult{F: false, Code: "lv"}, ErrMaxGrowLevel
	}
	if f.Gnum <= 0 {
		return &GrowResult{F: false, Code: "out"}, ErrNoCultivations
	}

	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, err
	}

	maxIter := 1
	if growType == GrowTypeGoldBatch {
		maxIter = GrowBatchMultiple
	}

	var total int64
	lastCri := 0
	done := 0
	for i := 0; i < maxIter; i++ {
		if f.Gnum <= 0 || gexpToLv(f.Gexp) >= FairyGrowLevel {
			break
		}
		if growType == GrowTypeMoney {
			if err := deductMoney(char, GrowCostMoney); err != nil {
				return &GrowResult{F: false, Code: "rmb"}, err
			}
		} else if err := deductGold(char, GrowCostGold); err != nil {
			if done == 0 {
				return &GrowResult{F: false, Code: "rmb"}, err
			}
			break
		}
		cri := 0
		if growType != GrowTypeMoney {
			cri = rollCrit()
		}
		gain := growGain(f.Gexp, cri)
		f.Gexp = clampInt64(f.Gexp+gain, 0, FairyGrowExp[len(FairyGrowExp)-1])
		f.Gnum--
		total += gain
		lastCri = cri
		done++
	}
	if done == 0 {
		return &GrowResult{F: false, Code: "out"}, ErrNoCultivations
	}
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return &GrowResult{F: true, Exp: total, Cri: lastCri, Gnum: f.Gnum}, nil
}

func (s *Service) Raise(ctx context.Context, charID, fairyID, itemSlotID int64, qty int) (*RaiseResult, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	f, ok := state.fairy(fairyID)
	if !ok {
		return &RaiseResult{F: false, Code: "item"}, ErrFairyMissing
	}
	if f.Doh >= satietyMax {
		return &RaiseResult{F: false, Code: "full"}, ErrSatietyFull
	}
	if qty <= 0 {
		qty = 1
	}
	item, err := s.items.GetItemByID(ctx, charID, itemSlotID)
	if err != nil {
		return nil, err
	}
	if item == nil {
		return &RaiseResult{F: false, Code: "item"}, ErrItemNotFound
	}
	rest, _, err := s.items.ConsumeItemStackByID(ctx, charID, itemSlotID, qty)
	if err != nil {
		return &RaiseResult{F: false, Code: "num"}, err
	}
	f.Doh = clampInt(f.Doh+raiseSatietyGain*qty, 0, satietyMax)
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return &RaiseResult{F: true, Num: stackCount(rest)}, nil
}

func (s *Service) AddExp(ctx context.Context, charID, fairyID int64, slotIDs []int64, qty int) (*AddExpResult, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	f, ok := state.fairy(fairyID)
	if !ok {
		return &AddExpResult{F: false, Code: "item"}, ErrFairyMissing
	}
	s.refreshDaily(f)
	if expToLv(f.Exp) >= FairyMaxLevel {
		return &AddExpResult{F: false, Code: "max"}, ErrMaxLevel
	}
	if f.En <= 0 {
		return &AddExpResult{F: false, Code: "out"}, ErrNoFeeds
	}
	if qty <= 0 {
		qty = 1
	}

	consumed := 0
	for _, slotID := range slotIDs {
		if f.En <= 0 || expToLv(f.Exp) >= FairyMaxLevel {
			break
		}
		item, err := s.items.GetItemByID(ctx, charID, slotID)
		if err != nil || item == nil || !isExpFruit(item.TemplateID) {
			continue
		}
		if _, _, err := s.items.ConsumeItemStackByID(ctx, charID, slotID, qty); err != nil {
			continue
		}
		add := fruitExpForTemplate(item.TemplateID) * int64(qty)
		f.Exp = clampInt64(f.Exp+add, 0, FairyLevelExp[len(FairyLevelExp)-1])
		consumed += qty
		f.En--
	}
	if consumed == 0 {
		return &AddExpResult{F: false, Code: "item"}, ErrItemNotFound
	}
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return &AddExpResult{F: true, Num: consumed, En: f.En}, nil
}

func growGain(gexp int64, cri int) int64 {
	next := FairyGrowExp[0]
	lv := gexpToLv(gexp)
	if lv < len(FairyGrowExp) {
		next = FairyGrowExp[lv]
	} else {
		next = FairyGrowExp[len(FairyGrowExp)-1]
	}
	gain := next / growBaseDivisor
	if gain < growMinGain {
		gain = growMinGain
	}
	switch cri {
	case 1:
		gain *= 2
	case 2:
		gain *= 3
	}
	return gain
}

func rollCrit() int {
	r := rand.Intn(100)
	switch {
	case r < 5:
		return 2
	case r < 20:
		return 1
	default:
		return 0
	}
}

func stackCount(item *domainitem.Item) int {
	if item == nil {
		return 0
	}
	return item.StackCount
}

func clampInt(v, lo, hi int) int {
	if v < lo {
		return lo
	}
	if v > hi {
		return hi
	}
	return v
}

func clampInt64(v, lo, hi int64) int64 {
	if v < lo {
		return lo
	}
	if v > hi {
		return hi
	}
	return v
}
