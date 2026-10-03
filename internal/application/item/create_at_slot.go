// Open-sourced by BaoLT

// Slot-targeted item creation helpers keep replacement flows aligned with the client slot contract.
package item

import (
	"context"

	domainitem "mcgame-server/internal/domain/item"
	pkgerrors "mcgame-server/pkg/errors"
)

func (s *Service) AddItemWithBindAndColorAtSlot(ctx context.Context, charID int64, templateID int, itemType domainitem.ItemType, stackCount int, isBound bool, colorCode int, slotType domainitem.SlotType, slotIndex int) (*domainitem.Item, error) {
	colorCode = s.resolveItemColorCode(templateID, itemType, colorCode)

	existing, err := s.itemRepo.FindBySlot(ctx, charID, slotType, slotIndex)
	if err != nil && !pkgerrors.Is(err, pkgerrors.ErrItemNotFound) {
		return nil, err
	}
	if existing != nil {
		return nil, pkgerrors.ErrSlotOccupied
	}

	it := domainitem.NewItem(charID, templateID, itemType, slotType, slotIndex)
	it.StackCount = stackCount
	it.IsBound = isBound
	it.ColorCode = colorCode

	if itemType == domainitem.ItemTypeEquipment && s.gameDataRec != nil {
		if equipTpl := s.gameDataRec.GetEquipment(templateID); equipTpl != nil {
			s.populateEquipmentProperties(it, equipTpl)
		}
	}

	if err := s.itemRepo.Create(ctx, it); err != nil {
		return nil, err
	}

	if s.questService != nil {
		_, _ = s.questService.OnItemCollected(ctx, charID, templateID, stackCount)
	}

	return it, nil
}