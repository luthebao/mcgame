// Open-sourced by BaoLT

// Soul gem movement: putSoulToBag (temp-bag → char-bag, single + all), openPetSoulBag
// (soulExp-gated pet tier-2 slot unlock), and the drag-swap MoveSoul (char↔char,
// pet↔pet, pet↔char-bag in both directions). Slot ids > petSoulWireOffset address pet
// slots; the swap strips the offset to index the pet's own slot map.
//
// openPetSoulBag cost is the client constant SOULNUM_PET_BAG_ADD[openNum2+1]; the gate
// (openNum >= 5) mirrors PetSoulPanel.openPetSoulBag. CONSUME-THEN-CREDIT: soulExp is
// deducted and persisted before openNum2 is advanced.
package soul

import (
	"context"
	"fmt"

	"go.uber.org/zap"
)

func (s *Service) PutSoulToBag(ctx context.Context, charID int64, tempIndex int) (map[string]any, error) {
	state, err := s.loadCharState(ctx, charID)
	if err != nil {
		return nil, err
	}
	payload, ok := s.moveTempToBag(state, tempIndex)
	if !ok {
		return putBagFail(2), nil
	}
	if err := s.saveCharState(ctx, charID, state); err != nil {
		return nil, err
	}
	return payload, nil
}

func (s *Service) PutAllSoulToBag(ctx context.Context, charID int64) (map[string]any, error) {
	state, err := s.loadCharState(ctx, charID)
	if err != nil {
		return nil, err
	}
	out := map[string]any{}
	moved := 0
	for _, idx := range sortedTempIndexes(state.TempBag) {
		payload, ok := s.moveTempToBag(state, idx)
		if !ok {
			break
		}
		out[formatInt(idx)] = payload
		moved++
	}
	if moved == 0 {
		return out, nil
	}
	if err := s.saveCharState(ctx, charID, state); err != nil {
		return nil, err
	}
	return out, nil
}

func (s *Service) moveTempToBag(state *CharSoulState, tempIndex int) (map[string]any, bool) {
	ii, ok := state.TempBag[tempIndex]
	if !ok || ii <= 0 {
		return nil, false
	}
	slot := s.firstFreeSlot(state)
	if slot <= 0 {
		return nil, false
	}
	gem := SoulSlot{Sid: ii}
	state.Slots[slot] = gem
	delete(state.TempBag, tempIndex)
	return map[string]any{
		"f":        1,
		"index":    tempIndex,
		"soulData": slotWire(slot, gem, 0),
	}, true
}

func putBagFail(failType int) map[string]any {
	return map[string]any{"f": 0, "type": failType}
}

func (s *Service) SeedPetOpenNum(ctx context.Context, petID int64, openNum int) error {
	state, err := s.loadPetState(ctx, petID)
	if err != nil {
		return err
	}
	if openNum < 0 {
		openNum = 0
	}
	state.OpenNum = openNum
	return s.savePetState(ctx, petID, state)
}

func (s *Service) OpenPetSoulBag(ctx context.Context, charID, petID int64) (map[string]any, error) {
	state, err := s.loadPetState(ctx, petID)
	if err != nil {
		return nil, err
	}
	if state.OpenNum < 5 {
		return nil, ErrPetBagLocked
	}
	next := state.OpenNum2 + 1
	cost, ok := soulPetBagAddCost[next]
	if !ok {
		return nil, ErrPetBagMaxed
	}
	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, err
	}
	if char.SoulExp < cost {
		return nil, ErrInsufficientExp
	}
	char.SoulExp -= cost
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, fmt.Errorf("soul: openPetSoulBag spend soulExp: %w", err)
	}
	state.OpenNum2 = next
	if err := s.savePetState(ctx, petID, state); err != nil {
		s.logger.Error("soul: openPetSoulBag deducted but pet state save failed", zap.Int64("char_id", charID), zap.Int64("pet_id", petID), zap.Error(err))
		return nil, err
	}
	return map[string]any{
		"soulExp":  char.SoulExp,
		"pid":      petID,
		"openNum2": state.OpenNum2,
	}, nil
}
