// Open-sourced by BaoLT

package magicweapon

import (
	"context"

	domainitem "mcgame-server/internal/domain/item"
	domainmw "mcgame-server/internal/domain/magicweapon"

	"go.uber.org/zap"
)

func (s *Service) ResolveMagicWeapon(ctx context.Context, charID, equipItemID int64) (*ResolveResult, *domainitem.Item, *domainitem.Item, int, error) {
	equip, err := s.loadOwnedItem(ctx, charID, equipItemID)
	if err != nil {
		return nil, nil, nil, 0, err
	}
	tpl := s.gameData.GetEquipment(equip.TemplateID)
	if !domainmw.IsMWTemplate(tpl) {
		return &ResolveResult{Success: false}, nil, nil, 0, nil
	}

	wasEquipped := domainmw.IsEquipped(equip)
	oldSID := equip.CalculateSID()
	isMain := int(tpl.Type) == domainmw.ItemTypeMain

	if isMain {
		char, err := s.charRepo.FindByID(ctx, charID)
		if err == nil && char != nil {
			refund := s.estimateSpiritRefund(equip)
			if refund > 0 {
				s.SetSpirituality(char, s.GetSpirituality(char)+refund)
				if err := s.persistChar(ctx, char); err != nil {
					s.logger.Warn("MW resolve: failed to persist spirit refund", zap.Error(err))
				}
			}
		}
		if wasEquipped && s.skillGranter != nil {
			if err := s.skillGranter.RevokeOnUnequip(ctx, charID, equip); err != nil {
				s.logger.Warn("MW resolve: revoke skills failed", zap.Error(err))
			}
		}
	}

	materialTID := domainmw.StoneRepair
	stackNum := 1

	if err := s.itemRepo.Delete(ctx, equip.ID); err != nil {
		return nil, nil, nil, 0, err
	}

	material, err := s.itemService.AddItem(ctx, charID, materialTID, domainitem.ItemTypeConsumable, stackNum)
	if err != nil {
		s.logger.Warn("MW resolve: failed to add material", zap.Error(err))
	}

	s.logger.Info("MW resolved",
		zap.Int64("char_id", charID),
		zap.Int64("item_id", equip.ID),
		zap.Bool("is_main", isMain),
		zap.Int("material_tid", materialTID),
		zap.Int("stack_num", stackNum))

	return &ResolveResult{
		Success:      true,
		MaterialType: 28,
		MaterialTID:  materialTID,
		StackNum:     stackNum,
		TempQuality:  0,
		WasEquipped:  wasEquipped,
	}, material, equip, oldSID, nil
}

func (s *Service) estimateSpiritRefund(equip *domainitem.Item) int64 {
	if equip == nil || s.gameData == nil {
		return 0
	}
	if equip.StarLevel <= 0 {
		return 0
	}
	totalSpent := s.gameData.ArtifactCumulativeSpirit(equip.TemplateID, equip.StarLevel)
	return (totalSpent * 40) / 100
}
