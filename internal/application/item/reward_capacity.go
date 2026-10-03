// Open-sourced by BaoLT

package item

import (
	"context"

	domainitem "mcgame-server/internal/domain/item"
	pkgerrors "mcgame-server/pkg/errors"
)

type bagRewardSpec struct {
	TemplateID int
	ItemType   domainitem.ItemType
	Count      int
	IsBound    bool
	ColorCode  int
}

type bagRewardKey struct {
	TemplateID int
	ItemType   domainitem.ItemType
	IsBound    bool
	ColorCode  int
	MaxStack   int
}

func (s *Service) ensureBagCapacityForRewards(ctx context.Context, charID int64, rewards []bagRewardSpec) error {
	if len(rewards) == 0 {
		return nil
	}

	inventory, err := s.itemRepo.FindByCharacterAndSlotType(ctx, charID, domainitem.SlotTypeBag)
	if err != nil {
		return err
	}

	maxSlots := s.getMaxSlots(ctx, charID, domainitem.SlotTypeBag)
	remainingSlots := maxSlots - len(inventory)
	if remainingSlots < 0 {
		return pkgerrors.ErrInventoryFull
	}

	rewardCounts := make(map[bagRewardKey]int)
	for _, reward := range rewards {
		if reward.Count <= 0 {
			continue
		}
		key := s.bagRewardKey(reward)
		rewardCounts[key] += reward.Count
	}

	if len(rewardCounts) == 0 {
		return nil
	}

	existingFill := make(map[bagRewardKey]int)
	for _, inventoryItem := range inventory {
		key := bagRewardKey{
			TemplateID: inventoryItem.TemplateID,
			ItemType:   inventoryItem.ItemType,
			IsBound:    inventoryItem.IsBound,
			ColorCode:  s.resolveItemColorCode(inventoryItem.TemplateID, inventoryItem.ItemType, inventoryItem.ColorCode),
			MaxStack:   s.rewardMaxStack(inventoryItem.TemplateID, inventoryItem.ItemType),
		}
		if _, ok := rewardCounts[key]; !ok {
			continue
		}
		if key.MaxStack <= 1 || inventoryItem.StackCount >= key.MaxStack {
			continue
		}
		existingFill[key] += key.MaxStack - inventoryItem.StackCount
	}

	newSlotsNeeded := 0
	for key, totalCount := range rewardCounts {
		fillCapacity := existingFill[key]
		if fillCapacity > totalCount {
			fillCapacity = totalCount
		}

		remainingCount := totalCount - fillCapacity
		if remainingCount <= 0 {
			continue
		}

		newSlotsNeeded += (remainingCount + key.MaxStack - 1) / key.MaxStack
		if newSlotsNeeded > remainingSlots {
			return pkgerrors.ErrInventoryFull
		}
	}

	return nil
}

func (s *Service) bagRewardKey(reward bagRewardSpec) bagRewardKey {
	colorCode := s.resolveItemColorCode(reward.TemplateID, reward.ItemType, reward.ColorCode)
	maxStack := s.rewardMaxStack(reward.TemplateID, reward.ItemType)
	if maxStack <= 0 {
		maxStack = 1
	}

	return bagRewardKey{
		TemplateID: reward.TemplateID,
		ItemType:   reward.ItemType,
		IsBound:    reward.IsBound,
		ColorCode:  colorCode,
		MaxStack:   maxStack,
	}
}

func (s *Service) rewardMaxStack(templateID int, itemType domainitem.ItemType) int {
	if s.gameDataRec == nil {
		return 1
	}

	if itemType == domainitem.ItemTypeEquipment {
		if equipTpl := s.gameDataRec.GetEquipment(templateID); equipTpl != nil {
			maxStack := int(equipTpl.StackMax)
			if equipTpl.SingleFlag > 0 || maxStack <= 0 {
				return 1
			}
			return maxStack
		}
		return 1
	}

	if itemTpl := s.gameDataRec.GetItem(templateID); itemTpl != nil {
		maxStack := int(itemTpl.StackMax)
		if itemTpl.SingleFlag > 0 || maxStack <= 0 {
			return 1
		}
		return maxStack
	}

	return 1
}
