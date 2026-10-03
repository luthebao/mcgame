// Open-sourced by BaoLT

// AddAddition attempts to increase the star addition (tinh hoa) value for a slot.
// Consumes `quantity` ITEM_TYPE_STAR_ADD (551) items and deducts bạc.
// Rate mirrors the client (StarAdditionPanel.as:651-700):
//   tier  = colorTierFromAddition(slot.Addition)
//   rate  = min(BASIC_SUCCESS[tier]*quantity + ADD_SUCCESS[tier], 1.0)
//   money = round(BASIC_MONEY[starType] * 20 * rate * slot.Addition).
// Single Bernoulli roll vs `rate`. On success slot.Addition += 0.05, capped at 5.0.
// `quantity` is clamped at StarAdditionMaxQuantity (matches client NumericStepper max).
package star

import (
	"context"
	"errors"
	"fmt"
	"math"

	pkgerrors "mcgame-server/pkg/errors"
)

const starAdditionMax = 5.0

type AddAdditionResult struct {
	State     StarsState
	StarType  int
	OldValue  float64
	NewValue  float64
	Success   bool
	ColorTier int
	Consumed  int
	Rate      float64
	MoneyCost int64
}

func (s *Service) AddAddition(ctx context.Context, charID int64, starType int, quantity int, itemID int64) (*AddAdditionResult, error) {
	if !validStarType(starType) {
		return nil, ErrInvalidStarType
	}
	if s.itemService == nil {
		return nil, fmt.Errorf("star addition: item service not configured")
	}
	if quantity <= 0 {
		return nil, ErrInvalidAdditionQuantity
	}
	if quantity > StarAdditionMaxQuantity {
		quantity = StarAdditionMaxQuantity
	}

	state, err := s.Load(ctx, charID)
	if err != nil {
		return nil, err
	}
	slot := state[starType]
	if slot == nil {
		return nil, ErrInvalidStarType
	}

	if slot.Addition >= starAdditionMax {
		return nil, ErrAdditionMaxed
	}

	colorTier := colorTierFromAddition(slot.Addition)
	rate := computeAdditionRate(colorTier, quantity)

	moneyCost := int64(0)
	if basicMoney, ok := starAdditionBasicMoney[starType]; ok && basicMoney > 0 {
		moneyCost = int64(math.Round(float64(basicMoney) * StarAdditionMoneyMultiplier * rate * slot.Addition))
	}
	if moneyCost > 0 {
		char, err := s.charRepo.FindByID(ctx, charID)
		if err != nil {
			return nil, fmt.Errorf("star addition: load char: %w", err)
		}
		if char == nil {
			return nil, ErrCharacterNotFound
		}
		if char.Money < moneyCost {
			return nil, ErrInsufficientStarPnt
		}
		char.Money -= moneyCost
		if err := s.charRepo.Update(ctx, char); err != nil {
			return nil, fmt.Errorf("star addition: deduct money: %w", err)
		}
	}

	if _, _, err := s.itemService.ConsumeItemStackByID(ctx, charID, itemID, quantity); err != nil {
		if errors.Is(err, pkgerrors.ErrNotFound) || errors.Is(err, pkgerrors.ErrItemNotOwned) {
			return nil, ErrAdditionItemRequired
		}
		if errors.Is(err, pkgerrors.ErrInsufficientFunds) {
			return nil, ErrInsufficientAddItem
		}
		return nil, fmt.Errorf("star addition: consume add-item: %w", err)
	}

	oldAddition := slot.Addition
	success := s.rng.Float64() < rate

	if success {
		slot.Addition = min(slot.Addition+0.05, starAdditionMax)
	}

	if err := s.save(ctx, charID, state); err != nil {
		return nil, err
	}

	return &AddAdditionResult{
		State:     state,
		StarType:  starType,
		OldValue:  oldAddition,
		NewValue:  slot.Addition,
		Success:   success,
		ColorTier: colorTierFromAddition(slot.Addition),
		Consumed:  quantity,
		Rate:      rate,
		MoneyCost: moneyCost,
	}, nil
}
