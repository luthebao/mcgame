// Open-sourced by BaoLT

// Exchange converts star-related items from the player's bag into speed-up items.
// Client sends: sid (source item instance ID), giid (target item template ID),
// num (quantity), tempFlag (temp bag source flag, currently unused server-side).
// The server consumes `num` of the source item and awards `num` of the target item.
// Response: flag, finalNum, finalNme, slotId (see onStarExchage in StarExchange.as).
package star

import (
	"context"
	"fmt"

	domainitem "mcgame-server/internal/domain/item"
)

type ExchangeResult struct {
	FinalNum int
	FinalNme string
	SlotID   int64
}

func (s *Service) Exchange(ctx context.Context, charID int64, sourceItemID int64, targetTemplateID int, num int) (*ExchangeResult, error) {
	if s.itemService == nil {
		return nil, fmt.Errorf("star exchange: item service not configured")
	}
	if num <= 0 {
		return nil, fmt.Errorf("star exchange: invalid quantity")
	}

	sourceItem, err := s.itemService.GetItemByID(ctx, charID, sourceItemID)
	if err != nil || sourceItem == nil {
		return nil, fmt.Errorf("star exchange: source item not found")
	}
	if sourceItem.StackCount < num {
		return nil, fmt.Errorf("star exchange: not enough source items")
	}

	_, _, err = s.itemService.ConsumeItemStackByID(ctx, charID, sourceItemID, num)
	if err != nil {
		return nil, fmt.Errorf("star exchange: consume source: %w", err)
	}

	awarded, err := s.itemService.AddItemWithBindAndColor(ctx, charID, targetTemplateID, domainitem.ItemTypeConsumable, num, false, 0)
	if err != nil {
		return nil, fmt.Errorf("star exchange: award target: %w", err)
	}

	targetName := ""
	if tpl := s.itemService.GetItemTemplate(targetTemplateID); tpl != nil {
		targetName = tpl.Name
	}

	slotID := sourceItemID
	if awarded != nil {
		slotID = awarded.ID
	}

	return &ExchangeResult{
		FinalNum: num,
		FinalNme: targetName,
		SlotID:   slotID,
	}, nil
}
