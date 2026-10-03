// Open-sourced by BaoLT

// SpeedUp instantly completes an in-progress star upgrade by consuming one
// star-type-specific speed-up item (ITEM_TYPE_STAR_SPEED = 552).
// If itemID > 0 that specific item instance is used; otherwise the first
// matching carried item by template ID is used.
// STAR_SPEED_UP_ITEM_IDS maps star type 1–12 to template IDs 3316–3327.
package star

import (
	"context"
	"errors"
	"fmt"

	pkgerrors "mcgame-server/pkg/errors"
)

func (s *Service) SpeedUp(ctx context.Context, charID int64, starType int, itemID int64) (StarsState, error) {
	if !validStarType(starType) {
		return nil, ErrInvalidStarType
	}
	if s.itemService == nil {
		return nil, fmt.Errorf("star speedup: item service not configured")
	}

	state, err := s.Load(ctx, charID)
	if err != nil {
		return nil, err
	}
	slot := state[starType]
	if slot == nil || slot.FinishDate <= 0 {
		return nil, ErrNoUpgradeInProgress
	}

	itemTemplateID, ok := starSpeedUpItemIDs[starType]
	if !ok {
		return nil, ErrNoUpgradeItemForStar
	}

	if itemID > 0 {
		_, _, err = s.itemService.ConsumeItemStackByID(ctx, charID, itemID, 1)
		if err != nil {
			if errors.Is(err, pkgerrors.ErrNotFound) {
				return nil, ErrInsufficientSpeedItems
			}
			return nil, fmt.Errorf("star speedup: consume item: %w", err)
		}
	} else {
		_, err = s.itemService.ConsumeCarriedItemsByTemplateID(ctx, charID, itemTemplateID, 1)
		if err != nil {
			if errors.Is(err, pkgerrors.ErrInsufficientFunds) {
				return nil, ErrInsufficientSpeedItems
			}
			return nil, fmt.Errorf("star speedup: consume by template: %w", err)
		}
	}

	slot.FinishDate = s.now().UnixMilli() - 1

	if err := s.save(ctx, charID, state); err != nil {
		return nil, err
	}
	return state, nil
}
