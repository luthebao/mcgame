// Open-sourced by BaoLT

// Rune-bag write-path for login-snapshot parity. Persists the rune *bag*
// (chaBag/petBag/upLvlHole) under character_feature_states feature_key='rune' in
// the exact shape statfeature.buildRuneInfoJSON already reads, so persisted bags
// re-emit at login with no auth/login change.
//
// Bag positions are 0-BASED string keys, matching the Flash client RuneBag.as
// updateBagView (slot0 -> pos 0, _runeArr indexed directly by the key) and
// RuneSlot.as runeChaBagPos/runePetBagPos. bagType mirrors RuneBag.as:
// 0=RUNE_CHAR_BAG (chaBag), 1=RUNE_PET_BAG (petBag). upLvlHole holds a single
// runeId (0 = empty staging slot), the SLOT_RUNE_UP target.
//
// RuneMove reproduces RuneSlot.dragDropHandler's bag<->upLvlHole moves
// (fromBagPos==-1: upLvlHole -> bag[toBagPos]; toBagPos==-1: bag[fromBagPos] ->
// upLvlHole) and additionally supports a same-bag slot swap for completeness.
// ArrangeRuneBag mirrors arrangeRuneBag (dense-pack into consecutive 0-based
// keys). AddRuneToBag is an exported seed method (mirrors soul.AddSoulToSlot) so
// the bag is populatable for visible parity until the deferred fill paths
// (runeRemove/runeResolve/exchangeRune) land.
//
// Socketing (runeSet/runeRemove) mutates decoInfo (the deco_hole feature), NOT
// this bag; those plus runeUpLvl/runeResolve/exchangeRune are deferred.
package rune

import (
	"context"
	"fmt"
	"sort"
	"strconv"

	domainfeature "mcgame-server/internal/domain/statfeature"
)

const (
	BagTypeCha = 0
	BagTypePet = 1

	UpLvlHolePos = -1
)

func (s *Service) SaveRuneBag(ctx context.Context, charID int64, bag RuneBag) error {
	if s == nil || s.repo == nil {
		return nil
	}
	if charID <= 0 {
		return ErrInvalidCharacterID
	}
	return s.repo.UpsertCharacterFeatureState(ctx, &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  domainfeature.FeatureRune,
		State:       encodeRuneBag(bag),
	})
}

func (s *Service) RuneMove(ctx context.Context, charID int64, fromBagPos, toBagPos, bagType int) (RuneBag, error) {
	if charID <= 0 {
		return RuneBag{}, ErrInvalidCharacterID
	}
	bag, err := s.GetRuneBag(ctx, charID)
	if err != nil {
		return RuneBag{}, err
	}
	target := bagByType(&bag, bagType)
	if target == nil {
		return RuneBag{}, fmt.Errorf("rune: invalid bag type %d", bagType)
	}

	switch {
	case fromBagPos == UpLvlHolePos && toBagPos == UpLvlHolePos:
		return bag, nil
	case fromBagPos == UpLvlHolePos:
		runeID := bag.UpLvlHole
		if runeID <= 0 {
			return bag, nil
		}
		key := strconv.Itoa(toBagPos)
		if slot, ok := (*target)[key]; ok && slot.R == runeID {
			slot.N++
			(*target)[key] = slot
		} else if ok {
			return bag, nil
		} else {
			(*target)[key] = RuneSlot{N: 1, R: runeID}
		}
		bag.UpLvlHole = 0
	case toBagPos == UpLvlHolePos:
		key := strconv.Itoa(fromBagPos)
		slot, ok := (*target)[key]
		if !ok || slot.R <= 0 {
			return bag, nil
		}
		if bag.UpLvlHole > 0 {
			return bag, nil
		}
		bag.UpLvlHole = slot.R
		if slot.N > 1 {
			slot.N--
			(*target)[key] = slot
		} else {
			delete(*target, key)
		}
	default:
		fromKey := strconv.Itoa(fromBagPos)
		toKey := strconv.Itoa(toBagPos)
		fromSlot, fromOK := (*target)[fromKey]
		toSlot, toOK := (*target)[toKey]
		switch {
		case fromOK && toOK:
			(*target)[fromKey], (*target)[toKey] = toSlot, fromSlot
		case fromOK:
			(*target)[toKey] = fromSlot
			delete(*target, fromKey)
		case toOK:
			(*target)[fromKey] = toSlot
			delete(*target, toKey)
		}
	}

	if err := s.SaveRuneBag(ctx, charID, bag); err != nil {
		return RuneBag{}, err
	}
	return bag, nil
}

func (s *Service) ArrangeRuneBag(ctx context.Context, charID int64, bagType int) (RuneBag, error) {
	if charID <= 0 {
		return RuneBag{}, ErrInvalidCharacterID
	}
	bag, err := s.GetRuneBag(ctx, charID)
	if err != nil {
		return RuneBag{}, err
	}
	target := bagByType(&bag, bagType)
	if target == nil {
		return RuneBag{}, fmt.Errorf("rune: invalid bag type %d", bagType)
	}

	keys := make([]int, 0, len(*target))
	for k := range *target {
		n, convErr := strconv.Atoi(k)
		if convErr != nil {
			continue
		}
		keys = append(keys, n)
	}
	sort.Ints(keys)

	packed := make(map[string]RuneSlot, len(keys))
	pos := 0
	for _, k := range keys {
		slot := (*target)[strconv.Itoa(k)]
		packed[strconv.Itoa(pos)] = slot
		pos++
	}
	setBagByType(&bag, bagType, packed)

	if err := s.SaveRuneBag(ctx, charID, bag); err != nil {
		return RuneBag{}, err
	}
	return bag, nil
}

func (s *Service) AddRuneToBag(ctx context.Context, charID int64, bagType, runeID, n int) (RuneBag, error) {
	if charID <= 0 {
		return RuneBag{}, ErrInvalidCharacterID
	}
	if runeID <= 0 || n <= 0 {
		return RuneBag{}, fmt.Errorf("rune: invalid runeID %d or count %d", runeID, n)
	}
	bag, err := s.GetRuneBag(ctx, charID)
	if err != nil {
		return RuneBag{}, err
	}
	target := bagByType(&bag, bagType)
	if target == nil {
		return RuneBag{}, fmt.Errorf("rune: invalid bag type %d", bagType)
	}

	for key, slot := range *target {
		if slot.R == runeID {
			slot.N += n
			(*target)[key] = slot
			if err := s.SaveRuneBag(ctx, charID, bag); err != nil {
				return RuneBag{}, err
			}
			return bag, nil
		}
	}

	pos := firstFreeBagPos(*target)
	if pos < 0 {
		return RuneBag{}, ErrBagFull
	}
	(*target)[strconv.Itoa(pos)] = RuneSlot{N: n, R: runeID}

	if err := s.SaveRuneBag(ctx, charID, bag); err != nil {
		return RuneBag{}, err
	}
	return bag, nil
}

func bagByType(bag *RuneBag, bagType int) *map[string]RuneSlot {
	switch bagType {
	case BagTypeCha:
		if bag.ChaBag == nil {
			bag.ChaBag = map[string]RuneSlot{}
		}
		return &bag.ChaBag
	case BagTypePet:
		if bag.PetBag == nil {
			bag.PetBag = map[string]RuneSlot{}
		}
		return &bag.PetBag
	}
	return nil
}

func setBagByType(bag *RuneBag, bagType int, m map[string]RuneSlot) {
	switch bagType {
	case BagTypeCha:
		bag.ChaBag = m
	case BagTypePet:
		bag.PetBag = m
	}
}

func firstFreeBagPos(bag map[string]RuneSlot) int {
	for pos := 0; pos < MaxRuneBagSlots; pos++ {
		if _, taken := bag[strconv.Itoa(pos)]; !taken {
			return pos
		}
	}
	return -1
}

func encodeRuneBag(bag RuneBag) map[string]interface{} {
	chaBag := make(map[string]interface{}, len(bag.ChaBag))
	for k, v := range bag.ChaBag {
		chaBag[k] = map[string]interface{}{"n": v.N, "r": v.R}
	}
	petBag := make(map[string]interface{}, len(bag.PetBag))
	for k, v := range bag.PetBag {
		petBag[k] = map[string]interface{}{"n": v.N, "r": v.R}
	}
	return map[string]interface{}{
		"chaBag":    chaBag,
		"petBag":    petBag,
		"upLvlHole": bag.UpLvlHole,
	}
}
