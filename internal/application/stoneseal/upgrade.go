// Open-sourced by BaoLT

// Stone Seal upgrade operations: stoneSealBore (open a new hole) and
// stoneSealSuccinct (raise the seal level). Both support the two client pay modes
// with cost tables copied from StoneSealBoreCanvas.as:
//
//	bore  payMode 1 = gold (boreGoldCost),  payMode 2 = dust + 1 diamond (boreDustCost)
//	succ. payMode 1 = gold (succinctGoldCost), payMode 3 = dust (succinctDustCost)
//
// Bore cost is indexed by the count of FILLED holes (client getHoleNumber), seal
// level cost by the current level. The diamond color requirement (per hole) is
// enforced client-side; the server consumes the passed material and only verifies
// it is a diamond.
package stoneseal

import (
	"context"
	"fmt"

	domainchar "mcgame-server/internal/domain/character"
)

func (s *Service) Bore(ctx context.Context, charID int64, equipSid, sealIndex, payMode int, materialItemID int64) (map[string]interface{}, error) {
	if err := validateEquip(equipSid); err != nil {
		return nil, err
	}
	if err := validateSeal(sealIndex); err != nil {
		return nil, err
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	entry := state.entry(equipSid)
	if _, bored := entry.Data[sealIndex]; bored {
		return nil, ErrHoleAlreadyBored
	}
	if len(entry.Data) >= MaxSealIndex {
		return nil, ErrAllHolesBored
	}

	holeNum := entry.filledHoleCount()
	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, err
	}

	switch payMode {
	case PayModeGold:
		if err := deductGold(char, costAt(boreGoldCost, holeNum)); err != nil {
			return nil, err
		}
	case PayModeBoreDust:
		if err := s.consumeDiamond(ctx, charID, materialItemID); err != nil {
			return nil, err
		}
		if err := deductDust(char, costAt(boreDustCost, holeNum)); err != nil {
			return nil, err
		}
	default:
		return nil, fmt.Errorf("stoneseal: bore payMode %d không hỗ trợ", payMode)
	}

	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, fmt.Errorf("stoneseal: deduct bore cost: %w", err)
	}
	entry.Data[sealIndex] = EmptyHole
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return state.toStone(), nil
}

func (s *Service) Succinct(ctx context.Context, charID int64, equipSid, payMode int) (map[string]interface{}, error) {
	if err := validateEquip(equipSid); err != nil {
		return nil, err
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	entry := state.entry(equipSid)
	if entry.Lvl >= MaxSealLevel {
		return nil, ErrMaxSealLevel
	}

	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, err
	}

	switch payMode {
	case PayModeGold:
		if err := deductGold(char, costAt(succinctGoldCost, entry.Lvl)); err != nil {
			return nil, err
		}
	case PayModeSuccDust:
		if err := deductDust(char, costAt(succinctDustCost, entry.Lvl)); err != nil {
			return nil, err
		}
	default:
		return nil, fmt.Errorf("stoneseal: succinct payMode %d không hỗ trợ", payMode)
	}

	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, fmt.Errorf("stoneseal: deduct succinct cost: %w", err)
	}
	entry.Lvl++
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return state.toStone(), nil
}

func (s *Service) loadChar(ctx context.Context, charID int64) (*domainchar.Character, error) {
	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("stoneseal: load character: %w", err)
	}
	if char == nil {
		return nil, ErrCharacterMissing
	}
	return char, nil
}

func (s *Service) consumeDiamond(ctx context.Context, charID int64, materialItemID int64) error {
	item, err := s.items.GetItemByID(ctx, charID, materialItemID)
	if err != nil {
		return fmt.Errorf("stoneseal: lookup diamond: %w", err)
	}
	if item == nil {
		return ErrItemNotFound
	}
	if !s.items.IsDiamondItem(item.TemplateID) {
		return ErrNotDiamond
	}
	if _, _, err := s.items.ConsumeItemStackByID(ctx, charID, materialItemID, 1); err != nil {
		return fmt.Errorf("stoneseal: consume diamond: %w", err)
	}
	return nil
}

func deductGold(char *domainchar.Character, amount int) error {
	if amount <= 0 {
		return nil
	}
	if char.Gold < int64(amount) {
		return ErrInsufficientGold
	}
	char.Gold -= int64(amount)
	return nil
}

func deductDust(char *domainchar.Character, amount int) error {
	if amount <= 0 {
		return nil
	}
	if char.StoneSealPoint < amount {
		return ErrInsufficientDust
	}
	char.StoneSealPoint -= amount
	return nil
}
