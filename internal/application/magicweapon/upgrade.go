// Open-sourced by BaoLT

package magicweapon

import (
	"context"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainmw "mcgame-server/internal/domain/magicweapon"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (s *Service) GetSpiritRequire(ctx context.Context, charID, slotItemID int64) (int64, error) {
	it, err := s.loadOwnedItem(ctx, charID, slotItemID)
	if err != nil {
		return 0, err
	}

	tpl := s.gameData.GetEquipment(it.TemplateID)
	if tpl == nil {
		return 0, pkgerrors.ErrInvalidArgs
	}
	if int(tpl.Kind) != domainmw.ItemKind {
		return 0, pkgerrors.ErrInvalidArgs
	}

	nextLevel := it.StarLevel + 1
	row := s.gameData.GetArtifactUpgrade(it.TemplateID, nextLevel)
	if row == nil {
		return 0, nil
	}
	return int64(row.SpiritNum), nil
}

func (s *Service) UpgradeMagicWeapon(ctx context.Context, charID, slotItemID int64) (*UpgradeResult, *domainitem.Item, *domainchar.Character, error) {
	it, err := s.loadOwnedItem(ctx, charID, slotItemID)
	if err != nil {
		return nil, nil, nil, err
	}

	tpl := s.gameData.GetEquipment(it.TemplateID)
	if !domainmw.IsMWTemplate(tpl) {
		return &UpgradeResult{Success: false, FailType: 1, Message: "Không phải thần khí"}, nil, nil, nil
	}

	if !it.IsBound {
		return &UpgradeResult{Success: false, FailType: 3, Message: "Thần khí phải khóa trước khi nâng cấp"}, nil, nil, nil
	}

	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil || char == nil {
		return nil, nil, nil, pkgerrors.ErrUnauthorized
	}

	currentLevel := it.StarLevel
	nextLevel := currentLevel + 1

	if nextLevel >= domainmw.UpgradeNumPlayerLevel100 && char.Level < 100 {
		return &UpgradeResult{Success: false, FailType: 1, Message: "Để tiếp tục thăng cấp nhân vật cần đạt cấp 100"}, nil, nil, nil
	}

	row := s.gameData.GetArtifactUpgrade(it.TemplateID, nextLevel)
	if row == nil {
		return &UpgradeResult{Success: false, FailType: 2, Message: "Đã đạt cấp tối đa"}, nil, nil, nil
	}

	cost := int64(row.SpiritNum)
	have := s.GetSpirituality(char)
	if have < cost {
		return &UpgradeResult{Success: false, FailType: 1, Message: "Điểm thần tu không đủ"}, nil, nil, nil
	}

	s.SetSpirituality(char, have-cost)
	if err := s.persistChar(ctx, char); err != nil {
		return nil, nil, nil, err
	}

	it.StarLevel = nextLevel
	domainmw.SetPropFloat(it, domainmw.PropKeyMainPropNum1, row.PropNum1)
	domainmw.SetPropFloat(it, domainmw.PropKeyMainPropNum2, row.PropNum2)

	newColor := computeColorByUpgrade(nextLevel)
	if newColor > 0 {
		it.ColorCode = newColor
	}

	if err := s.persistItem(ctx, it); err != nil {
		return nil, nil, nil, err
	}

	s.logger.Info("MW upgraded",
		zap.Int64("char_id", charID),
		zap.Int64("item_id", it.ID),
		zap.Int("level", nextLevel),
		zap.Int64("spirit_cost", cost))

	nextRow := s.gameData.GetArtifactUpgrade(it.TemplateID, nextLevel+1)
	var nextRequire int64
	if nextRow != nil {
		nextRequire = int64(nextRow.SpiritNum)
	}

	return &UpgradeResult{
		Success:     true,
		NewLevel:    nextLevel,
		NextRequire: nextRequire,
		ColorCode:   it.ColorCode,
	}, it, char, nil
}

func computeColorByUpgrade(level int) int {
	switch {
	case level >= 16:
		return 5
	case level >= 11:
		return 4
	case level >= 6:
		return 3
	case level >= 1:
		return 2
	}
	return 0
}
