// Open-sourced by BaoLT

// Deferred rune economy: up-level (runeUpLvl), dissolve (runeResolve), chip->rune
// exchange (exchangeRune). All three move value through CurrencyRuneExp (the
// player's "Exp phù văn", currency id 217) via the RuneCharProvider interface.
//
// runeUpLvl advances the single rune staged in the bag's upLvlHole to its next_id
// when the player's runeExp >= the rune's up_exp; up_exp is then deducted
// (consume-then-credit: the cost is taken before the rune is upgraded and the bag
// re-saved). A rune with next_id<=0 is terminal (max level).
//
// runeResolve dissolves the runes named in runeObj{bagPos:runeId} from the chosen
// bag, summing each rune's `exp` * stack into a runeExp credit. The bag is reduced
// and saved BEFORE the exp is credited so a mid-failure never grants exp for free.
//
// exchangeRune scans the chip bag; for every chip whose RuneChip.num divides the
// stack, it converts floor(stack/num) copies into the chip's rid rune (TBL_DECO_RUNE
// id), debiting the chips first (save chip bag) then crediting the rune bag. Chips
// are matched by RuneChip.rid -> deco_rune.id (the client reads chip.rid to find the
// produced rune; deco_rune.chip_id is the inverse pointer).
package rune

import (
	"context"
	"fmt"
	"sort"
	"strconv"
)

type RuneResolveResult struct {
	Bag        RuneBag
	GainedExp  int
	RuneExpNow int
}

type RuneUpLvlResult struct {
	Bag        RuneBag
	Advanced   bool
	NewRuneID  int
	SpentExp   int
	RuneExpNow int
}

type ExchangeRuneResult struct {
	ChipBag    map[string]ChipSlot
	Bag        RuneBag
	Converted  int
	RuneExpNow int
}

func (s *Service) RuneUpLvl(ctx context.Context, charID int64) (*RuneUpLvlResult, error) {
	if charID <= 0 {
		return nil, ErrInvalidCharacterID
	}
	if s.gameData == nil {
		return nil, ErrRuneNoGameData
	}
	if s.charProvider == nil {
		return nil, ErrRuneNoCharProv
	}
	bag, err := s.GetRuneBag(ctx, charID)
	if err != nil {
		return nil, err
	}
	runeID := bag.UpLvlHole
	if runeID <= 0 {
		return nil, ErrRuneUpEmpty
	}
	tpl := s.gameData.GetDecoRune(runeID)
	if tpl == nil {
		return nil, ErrRuneNoGameData
	}
	if tpl.NextID <= 0 {
		return nil, ErrRuneUpMaxed
	}
	have, err := s.charProvider.GetRuneExp(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("rune: read rune exp: %w", err)
	}
	cost := tpl.UpExp
	if cost < 0 {
		cost = 0
	}
	if have < cost {
		return &RuneUpLvlResult{Bag: bag, Advanced: false, RuneExpNow: have}, ErrRuneUpNotEnough
	}

	if cost > 0 {
		if deductErr := s.charProvider.DeductRuneExp(ctx, charID, cost); deductErr != nil {
			return nil, fmt.Errorf("rune: deduct rune exp: %w", deductErr)
		}
	}
	bag.UpLvlHole = tpl.NextID
	if saveErr := s.SaveRuneBag(ctx, charID, bag); saveErr != nil {
		s.logf("runeUpLvl: rune exp deducted but bag save failed")
		return nil, fmt.Errorf("rune: persist bag after up-level: %w", saveErr)
	}
	after := have - cost
	return &RuneUpLvlResult{
		Bag:        bag,
		Advanced:   true,
		NewRuneID:  tpl.NextID,
		SpentExp:   cost,
		RuneExpNow: after,
	}, nil
}

func (s *Service) RuneResolve(ctx context.Context, charID int64, runeObj map[string]int, bagType int) (*RuneResolveResult, error) {
	if charID <= 0 {
		return nil, ErrInvalidCharacterID
	}
	if s.gameData == nil {
		return nil, ErrRuneNoGameData
	}
	if s.charProvider == nil {
		return nil, ErrRuneNoCharProv
	}
	bag, err := s.GetRuneBag(ctx, charID)
	if err != nil {
		return nil, err
	}
	target := bagByType(&bag, bagType)
	if target == nil {
		return nil, fmt.Errorf("rune: invalid bag type %d", bagType)
	}

	positions := make([]string, 0, len(runeObj))
	for k := range runeObj {
		positions = append(positions, k)
	}
	sort.Strings(positions)

	gained := 0
	for _, posKey := range positions {
		runeID := runeObj[posKey]
		slot, ok := (*target)[posKey]
		if !ok || slot.R <= 0 || slot.N <= 0 {
			continue
		}
		if runeID > 0 && slot.R != runeID {
			continue
		}
		tpl := s.gameData.GetDecoRune(slot.R)
		if tpl == nil {
			continue
		}
		gained += tpl.Exp * slot.N
		delete(*target, posKey)
	}

	if gained <= 0 {
		now, _ := s.charProvider.GetRuneExp(ctx, charID)
		return &RuneResolveResult{Bag: bag, GainedExp: 0, RuneExpNow: now}, nil
	}

	if saveErr := s.SaveRuneBag(ctx, charID, bag); saveErr != nil {
		return nil, fmt.Errorf("rune: persist bag before exp credit: %w", saveErr)
	}
	if addErr := s.charProvider.AddRuneExp(ctx, charID, gained); addErr != nil {
		s.logf("runeResolve: bag reduced but rune exp credit failed")
		return nil, fmt.Errorf("rune: credit rune exp: %w", addErr)
	}
	now, _ := s.charProvider.GetRuneExp(ctx, charID)
	return &RuneResolveResult{Bag: bag, GainedExp: gained, RuneExpNow: now}, nil
}

func (s *Service) ExchangeRune(ctx context.Context, charID int64) (*ExchangeRuneResult, error) {
	if charID <= 0 {
		return nil, ErrInvalidCharacterID
	}
	if s.gameData == nil {
		return nil, ErrRuneNoGameData
	}
	chipBag, err := s.GetChipBag(ctx, charID)
	if err != nil {
		return nil, err
	}

	type conv struct {
		runeID int
		count  int
	}
	produced := make([]conv, 0, len(chipBag))

	chipKeys := make([]string, 0, len(chipBag))
	for k := range chipBag {
		chipKeys = append(chipKeys, k)
	}
	sort.Strings(chipKeys)

	for _, k := range chipKeys {
		slot := chipBag[k]
		chipID, perr := strconv.Atoi(slot.ChipID)
		if perr != nil || chipID <= 0 || slot.Num <= 0 {
			continue
		}
		chip := s.gameDataRuneChip(chipID)
		if chip == nil || chip.RuneID <= 0 || chip.Num <= 0 {
			continue
		}
		makeCount := slot.Num / chip.Num
		if makeCount <= 0 {
			continue
		}
		consumed := makeCount * chip.Num
		remaining := slot.Num - consumed
		if remaining > 0 {
			slot.Num = remaining
			chipBag[k] = slot
		} else {
			delete(chipBag, k)
		}
		produced = append(produced, conv{runeID: chip.RuneID, count: makeCount})
	}

	if len(produced) == 0 {
		bag, _ := s.GetRuneBag(ctx, charID)
		now := 0
		if s.charProvider != nil {
			now, _ = s.charProvider.GetRuneExp(ctx, charID)
		}
		return &ExchangeRuneResult{ChipBag: chipBag, Bag: bag, Converted: 0, RuneExpNow: now}, nil
	}

	if saveErr := s.SaveChipBag(ctx, charID, chipBag); saveErr != nil {
		return nil, fmt.Errorf("rune: persist chip bag before rune credit: %w", saveErr)
	}

	totalConverted := 0
	var lastBag RuneBag
	for _, p := range produced {
		bag, addErr := s.AddRuneToBag(ctx, charID, BagTypeCha, p.runeID, p.count)
		if addErr != nil {
			s.logf("exchangeRune: chips consumed but rune credit failed")
			return nil, fmt.Errorf("rune: credit rune from chip: %w", addErr)
		}
		lastBag = bag
		totalConverted += p.count
	}

	now := 0
	if s.charProvider != nil {
		now, _ = s.charProvider.GetRuneExp(ctx, charID)
	}
	return &ExchangeRuneResult{ChipBag: chipBag, Bag: lastBag, Converted: totalConverted, RuneExpNow: now}, nil
}

func (s *Service) gameDataRuneChip(chipID int) *RuneChipInfo {
	if s.gameData == nil {
		return nil
	}
	return s.gameData.GetRuneChipInfo(chipID)
}
