// Open-sourced by BaoLT

package magicweapon

import (
	"context"

	domainitem "mcgame-server/internal/domain/item"
	domainmw "mcgame-server/internal/domain/magicweapon"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (s *Service) RepairMagicWeapon(ctx context.Context, charID, equipItemID, stoneItemID int64) (*RepairResult, *domainitem.Item, error) {
	equip, err := s.loadOwnedItem(ctx, charID, equipItemID)
	if err != nil {
		return nil, nil, err
	}
	tpl := s.gameData.GetEquipment(equip.TemplateID)
	if !domainmw.IsMWTemplate(tpl) {
		return &RepairResult{Success: false}, nil, nil
	}
	if !equip.NeedsRepair() {
		return &RepairResult{Success: false}, equip, nil
	}

	stone, err := s.loadOwnedItem(ctx, charID, stoneItemID)
	if err != nil {
		return nil, nil, err
	}
	stoneTpl := s.gameData.GetItem(stone.TemplateID)
	if stoneTpl == nil || stone.TemplateID != domainmw.StoneRepair {
		return nil, nil, pkgerrors.ErrInvalidArgs
	}
	if stone.StackCount < 1 {
		return nil, nil, pkgerrors.ErrInsufficientFunds
	}

	if _, _, err := s.itemService.ConsumeItemStackByID(ctx, charID, stoneItemID, 1); err != nil {
		return nil, nil, err
	}

	equip.Repair()
	if err := s.persistItem(ctx, equip); err != nil {
		return nil, nil, err
	}

	remaining := max(stone.StackCount-1, 0)

	s.logger.Info("MW repaired",
		zap.Int64("char_id", charID),
		zap.Int64("item_id", equip.ID),
		zap.Int("stone_remaining", remaining))

	return &RepairResult{
		Success:        true,
		StoneRemaining: remaining,
		WasEquipped:    domainmw.IsEquipped(equip),
	}, equip, nil
}

func (s *Service) AllRepairMagicWeapon(ctx context.Context, charID int64, equipIDs, stoneIDs []int64) ([]*domainitem.Item, int, bool, error) {
	if len(equipIDs) == 0 {
		return nil, 0, false, nil
	}

	stones := make([]*domainitem.Item, 0, len(stoneIDs))
	stoneCounts := make([]int, 0, len(stoneIDs))
	totalStoneRemaining := 0
	for _, sid := range stoneIDs {
		cand, err := s.loadOwnedItem(ctx, charID, sid)
		if err != nil || cand == nil || cand.TemplateID != domainmw.StoneRepair {
			continue
		}
		stones = append(stones, cand)
		stoneCounts = append(stoneCounts, cand.StackCount)
		totalStoneRemaining += cand.StackCount
	}

	totalConsumed := 0
	repaired := make([]*domainitem.Item, 0, len(equipIDs))
	anyEquippedRepaired := false

	for _, equipID := range equipIDs {
		equip, err := s.loadOwnedItem(ctx, charID, equipID)
		if err != nil || equip == nil {
			continue
		}
		tpl := s.gameData.GetEquipment(equip.TemplateID)
		if !domainmw.IsMWTemplate(tpl) {
			continue
		}
		if !equip.NeedsRepair() {
			continue
		}

		stoneIdx := -1
		for i, c := range stoneCounts {
			if c > 0 {
				stoneIdx = i
				break
			}
		}
		if stoneIdx < 0 {
			break
		}
		if _, _, err := s.itemService.ConsumeItemStackByID(ctx, charID, stones[stoneIdx].ID, 1); err != nil {
			break
		}
		stoneCounts[stoneIdx]--
		totalConsumed++
		totalStoneRemaining--

		equip.Repair()
		if err := s.persistItem(ctx, equip); err != nil {
			continue
		}
		repaired = append(repaired, equip)
		if domainmw.IsEquipped(equip) {
			anyEquippedRepaired = true
		}
	}

	s.logger.Info("MW all-repair",
		zap.Int64("char_id", charID),
		zap.Int("repaired_count", len(repaired)),
		zap.Int("consumed_stones", totalConsumed))

	return repaired, totalStoneRemaining, anyEquippedRepaired, nil
}
