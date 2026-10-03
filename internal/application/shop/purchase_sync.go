// Open-sourced by BaoLT

// Purchase bag sync helpers.
package shop

import (
	"context"
	"sort"

	domainitem "mcgame-server/internal/domain/item"
)

func (s *shopService) snapshotPurchaseBagStacks(ctx context.Context, characterID int64, templateID int, itemType domainitem.ItemType, isBound bool) (map[int64]int, error) {
	items, err := s.itemService.GetAllItems(ctx, characterID)
	if err != nil {
		return nil, err
	}

	stacks := make(map[int64]int)
	for _, it := range items {
		if it.SlotType != domainitem.SlotTypeBag {
			continue
		}
		if it.TemplateID != templateID || it.ItemType != itemType || it.IsBound != isBound {
			continue
		}
		stacks[it.ID] = it.StackCount
	}

	return stacks, nil
}

func (s *shopService) changedPurchaseBagDTOs(ctx context.Context, characterID int64, templateID int, itemType domainitem.ItemType, isBound bool, before map[int64]int) ([]map[string]interface{}, error) {
	items, err := s.itemService.GetAllItems(ctx, characterID)
	if err != nil {
		return nil, err
	}

	changed := make([]*domainitem.Item, 0)
	for _, it := range items {
		if it.SlotType != domainitem.SlotTypeBag {
			continue
		}
		if it.TemplateID != templateID || it.ItemType != itemType || it.IsBound != isBound {
			continue
		}

		previousStack, existed := before[it.ID]
		if existed && previousStack == it.StackCount {
			continue
		}

		changed = append(changed, it)
	}

	sort.Slice(changed, func(i, j int) bool {
		if changed[i].SlotIndex != changed[j].SlotIndex {
			return changed[i].SlotIndex < changed[j].SlotIndex
		}
		return changed[i].ID < changed[j].ID
	})

	return s.itemService.BuildClientItemDTOList(changed), nil
}
