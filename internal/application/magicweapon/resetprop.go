// Open-sourced by BaoLT

package magicweapon

import (
	"context"
	"math/rand"

	domainitem "mcgame-server/internal/domain/item"
	domainmw "mcgame-server/internal/domain/magicweapon"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (s *Service) QueryMWResetPropMax(ctx context.Context, charID, equipItemID int64) (*QueryResetMaxResult, error) {
	equip, err := s.loadOwnedItem(ctx, charID, equipItemID)
	if err != nil {
		return nil, err
	}
	tpl := s.gameData.GetEquipment(equip.TemplateID)
	if !domainmw.IsMWTemplate(tpl) {
		return &QueryResetMaxResult{Success: false}, nil
	}
	return &QueryResetMaxResult{
		Success:         true,
		MaxMainPropNum1: tpl.MainPropNum1 * StageEightMax,
		MaxMainPropNum2: tpl.MainPropNum2 * StageEightMax,
	}, nil
}

func (s *Service) MagicWeaponResetProp(ctx context.Context, charID, equipItemID, stoneItemID int64) (*ResetPropPreviewResult, error) {
	equip, err := s.loadOwnedItem(ctx, charID, equipItemID)
	if err != nil {
		return nil, err
	}
	tpl := s.gameData.GetEquipment(equip.TemplateID)
	if !domainmw.IsMainTemplate(tpl) {
		return &ResetPropPreviewResult{Success: false}, nil
	}
	if !equip.IsBound {
		return &ResetPropPreviewResult{Success: false}, nil
	}
	if equip.StarLevel < domainmw.MWResetLevelLimit {
		return &ResetPropPreviewResult{Success: false}, nil
	}

	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil || char == nil {
		return nil, pkgerrors.ErrUnauthorized
	}
	if s.GetSpirituality(char) < domainmw.ResetSpiritualityNeed {
		return &ResetPropPreviewResult{Success: false}, nil
	}

	stone, err := s.loadOwnedItem(ctx, charID, stoneItemID)
	if err != nil {
		return nil, err
	}
	if stone.TemplateID != domainmw.StoneProp {
		return nil, pkgerrors.ErrInvalidArgs
	}
	if stone.StackCount < domainmw.ResetStoneNeed {
		return &ResetPropPreviewResult{Success: false}, nil
	}

	if _, _, err := s.itemService.ConsumeItemStackByID(ctx, charID, stoneItemID, domainmw.ResetStoneNeed); err != nil {
		return nil, err
	}

	maxP1 := tpl.MainPropNum1 * StageEightMax
	maxP2 := tpl.MainPropNum2 * StageEightMax
	newP1 := tpl.MainPropNum1 + rand.Float64()*(maxP1-tpl.MainPropNum1)
	newP2 := tpl.MainPropNum2 + rand.Float64()*(maxP2-tpl.MainPropNum2)

	preview := &PendingPropReset{
		ItemID:          equip.ID,
		NewMainPropNum1: newP1,
		OldMainPropNum1: domainmw.PropFloat(equip, domainmw.PropKeyMainPropNum1),
		NewMainPropNum2: newP2,
		OldMainPropNum2: domainmw.PropFloat(equip, domainmw.PropKeyMainPropNum2),
	}

	s.pendingResetMu.Lock()
	s.pendingReset[charID] = preview
	s.pendingResetMu.Unlock()

	remaining := max(stone.StackCount-domainmw.ResetStoneNeed, 0)

	s.logger.Info("MW prop reset preview generated",
		zap.Int64("char_id", charID),
		zap.Int64("item_id", equip.ID),
		zap.Float64("new_p1", newP1),
		zap.Float64("new_p2", newP2))

	return &ResetPropPreviewResult{
		Success:        true,
		StoneRemaining: remaining,
		Preview:        preview,
	}, nil
}

func (s *Service) ApplyMWResetProp(ctx context.Context, charID int64) (*ResetPropApplyResult, *domainitem.Item, error) {
	s.pendingResetMu.Lock()
	preview, ok := s.pendingReset[charID]
	if !ok {
		s.pendingResetMu.Unlock()
		return &ResetPropApplyResult{Applied: false}, nil, nil
	}
	delete(s.pendingReset, charID)
	s.pendingResetMu.Unlock()

	equip, err := s.loadOwnedItem(ctx, charID, preview.ItemID)
	if err != nil {
		return nil, nil, err
	}
	domainmw.SetPropFloat(equip, domainmw.PropKeyMainPropNum1, preview.NewMainPropNum1)
	domainmw.SetPropFloat(equip, domainmw.PropKeyMainPropNum2, preview.NewMainPropNum2)
	if err := s.persistItem(ctx, equip); err != nil {
		return nil, nil, err
	}

	s.logger.Info("MW prop reset applied",
		zap.Int64("char_id", charID),
		zap.Int64("item_id", equip.ID))

	return &ResetPropApplyResult{
		Applied:     true,
		ItemID:      equip.ID,
		WasEquipped: domainmw.IsMainEquipped(equip),
	}, equip, nil
}

func (s *Service) ClearPendingReset(charID int64) {
	s.pendingResetMu.Lock()
	delete(s.pendingReset, charID)
	s.pendingResetMu.Unlock()
}
