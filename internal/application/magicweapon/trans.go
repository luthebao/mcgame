// Open-sourced by BaoLT

package magicweapon

import (
	"context"

	domainitem "mcgame-server/internal/domain/item"
	domainmw "mcgame-server/internal/domain/magicweapon"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (s *Service) TransMagicWeapon(ctx context.Context, charID, srcID, tgtID, stoneID int64) (*TransResult, *domainitem.Item, *domainitem.Item, int, error) {
	src, err := s.loadOwnedItem(ctx, charID, srcID)
	if err != nil {
		return nil, nil, nil, 0, err
	}
	tgt, err := s.loadOwnedItem(ctx, charID, tgtID)
	if err != nil {
		return nil, nil, nil, 0, err
	}
	srcTpl := s.gameData.GetEquipment(src.TemplateID)
	tgtTpl := s.gameData.GetEquipment(tgt.TemplateID)
	if srcTpl == nil || tgtTpl == nil {
		return nil, nil, nil, 0, pkgerrors.ErrInvalidArgs
	}
	if int(srcTpl.Kind) != domainmw.ItemKind || int(srcTpl.Type) != domainmw.ItemTypeMain {
		return &TransResult{Success: false, Message: "Nguồn không phải thần khí chính"}, nil, nil, 0, nil
	}
	if int(tgtTpl.Kind) != domainmw.ItemKind || int(tgtTpl.Type) != domainmw.ItemTypeMain {
		return &TransResult{Success: false, Message: "Đích không phải thần khí chính"}, nil, nil, 0, nil
	}
	if srcTpl.ID == tgtTpl.ID && src.ID == tgt.ID {
		return nil, nil, nil, 0, pkgerrors.ErrInvalidArgs
	}

	srcP1 := domainmw.PropFloat(src, domainmw.PropKeyMainPropNum1)
	tgtP1 := domainmw.PropFloat(tgt, domainmw.PropKeyMainPropNum1)
	if tgtP1 >= srcP1 {
		return &TransResult{Success: false, Message: "Thuộc tính đích cao hơn hoặc bằng nguồn"}, nil, nil, 0, nil
	}

	stone, err := s.loadOwnedItem(ctx, charID, stoneID)
	if err != nil {
		return nil, nil, nil, 0, err
	}
	if stone.TemplateID != domainmw.StoneTrans {
		return nil, nil, nil, 0, pkgerrors.ErrInvalidArgs
	}
	if stone.StackCount < 1 {
		return nil, nil, nil, 0, pkgerrors.ErrInsufficientFunds
	}

	srcSID := src.CalculateSID()

	if src.IsEquipped() && s.skillGranter != nil {
		if err := s.skillGranter.RevokeOnUnequip(ctx, charID, src); err != nil {
			s.logger.Warn("MW trans: revoke src skills failed", zap.Error(err))
		}
	}

	if _, _, err := s.itemService.ConsumeItemStackByID(ctx, charID, stoneID, 1); err != nil {
		return nil, nil, nil, 0, err
	}

	domainmw.SetPropFloat(tgt, domainmw.PropKeyMainPropNum1, srcP1)
	domainmw.SetPropFloat(tgt, domainmw.PropKeyMainPropNum2, domainmw.PropFloat(src, domainmw.PropKeyMainPropNum2))
	if mp1 := domainmw.PropInt(src, domainmw.PropKeyMainProp1); mp1 > 0 {
		domainmw.SetPropInt(tgt, domainmw.PropKeyMainProp1, mp1)
	}
	if mp2 := domainmw.PropInt(src, domainmw.PropKeyMainProp2); mp2 > 0 {
		domainmw.SetPropInt(tgt, domainmw.PropKeyMainProp2, mp2)
	}
	tgt.IsBound = true
	if err := s.persistItem(ctx, tgt); err != nil {
		return nil, nil, nil, 0, err
	}
	if err := s.itemRepo.Delete(ctx, src.ID); err != nil {
		return nil, nil, nil, 0, err
	}

	remaining := max(stone.StackCount-1, 0)

	wasEquipped := domainmw.IsMainEquipped(tgt) || src.IsEquipped()

	s.logger.Info("MW trans",
		zap.Int64("char_id", charID),
		zap.Int64("src", src.ID),
		zap.Int64("tgt", tgt.ID))

	return &TransResult{
		Success:        true,
		Message:        "Hoán chuyển thành công",
		StoneRemaining: remaining,
		WasEquipped:    wasEquipped,
	}, tgt, src, srcSID, nil
}
