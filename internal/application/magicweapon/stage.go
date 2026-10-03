// Open-sourced by BaoLT

package magicweapon

import (
	"context"

	domainitem "mcgame-server/internal/domain/item"
	domainmw "mcgame-server/internal/domain/magicweapon"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (s *Service) StageMagicWeapon(ctx context.Context, charID, equipItemID, crystalItemID int64) (*StageResult, *domainitem.Item, error) {
	equip, err := s.loadOwnedItem(ctx, charID, equipItemID)
	if err != nil {
		return nil, nil, err
	}
	tpl := s.gameData.GetEquipment(equip.TemplateID)
	if !domainmw.IsMainTemplate(tpl) {
		return &StageResult{Success: false, Message: "Không phải thần khí chính"}, nil, nil
	}

	if equip.StarLevel < domainmw.StageEightLevel {
		return &StageResult{Success: false, Message: "Thần khí chính không đủ điều kiện tăng vòng"}, nil, nil
	}

	currentP1 := domainmw.PropFloat(equip, domainmw.PropKeyMainPropNum1)
	threshold := tpl.MainPropNum1 * StageEightMin
	if currentP1 < threshold {
		return &StageResult{Success: false, Message: "Thần khí chính không đủ điều kiện tăng vòng"}, nil, nil
	}

	currentVong := ComputeStageVong(currentP1, tpl.MainPropNum1)
	if currentVong >= 8 {
		return &StageResult{Success: false, Message: "Thần khí chính đã ở vòng 8"}, nil, nil
	}

	crystal, err := s.loadOwnedItem(ctx, charID, crystalItemID)
	if err != nil {
		return nil, nil, err
	}
	if crystal.TemplateID != domainmw.StoneStageEigh {
		return nil, nil, pkgerrors.ErrInvalidArgs
	}
	if crystal.StackCount < 1 {
		return nil, nil, pkgerrors.ErrInsufficientFunds
	}

	if _, _, err := s.itemService.ConsumeItemStackByID(ctx, charID, crystalItemID, 1); err != nil {
		return nil, nil, err
	}

	newP1 := tpl.MainPropNum1 * StageEightMax
	newP2 := tpl.MainPropNum2 * StageEightMax
	domainmw.SetPropFloat(equip, domainmw.PropKeyMainPropNum1, newP1)
	domainmw.SetPropFloat(equip, domainmw.PropKeyMainPropNum2, newP2)

	mainFlag := domainmw.ParseMainFlag(domainmw.PropString(equip, domainmw.PropKeyFlag))
	mainFlag.FlagStr = "stage8"
	if encoded, err := mainFlag.Encode(); err == nil {
		domainmw.SetPropString(equip, domainmw.PropKeyFlag, encoded)
	}

	if err := s.persistItem(ctx, equip); err != nil {
		return nil, nil, err
	}

	flagStr, _ := mainFlag.Encode()
	remaining := max(crystal.StackCount-1, 0)

	s.logger.Info("MW stage promoted",
		zap.Int64("char_id", charID),
		zap.Int64("item_id", equip.ID),
		zap.Float64("new_p1", newP1),
		zap.Float64("new_p2", newP2))

	return &StageResult{
		Success:        true,
		Message:        "Thăng vòng thành công",
		ItemID:         equip.ID,
		FlagStr:        flagStr,
		NewPropNum1:    newP1,
		NewPropNum2:    newP2,
		StoneRemaining: remaining,
		WasEquipped:    domainmw.IsMainEquipped(equip),
	}, equip, nil
}
