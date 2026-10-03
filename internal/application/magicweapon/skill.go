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

const SkillUseEnvMW = 5

func (s *Service) GetMWSkills(ctx context.Context, charID, equipItemID int64) (map[string]int, error) {
	it, err := s.loadOwnedItem(ctx, charID, equipItemID)
	if err != nil {
		return nil, err
	}
	tpl := s.gameData.GetEquipment(it.TemplateID)
	if !domainmw.IsMWTemplate(tpl) {
		return map[string]int{}, nil
	}
	if int(tpl.Type) != domainmw.ItemTypeMain {
		return map[string]int{}, nil
	}
	return domainmw.TSlotMap(it), nil
}

func (s *Service) ResetMagicWeaponSkill(ctx context.Context, charID, equipItemID, stoneItemID int64, skillPosition int) (*SkillResetResult, *domainitem.Item, error) {
	if skillPosition < 1 || skillPosition > 10 {
		return nil, nil, pkgerrors.ErrInvalidArgs
	}
	equip, err := s.loadOwnedItem(ctx, charID, equipItemID)
	if err != nil {
		return nil, nil, err
	}
	tpl := s.gameData.GetEquipment(equip.TemplateID)
	if !domainmw.IsMainTemplate(tpl) {
		return &SkillResetResult{Success: false}, nil, nil
	}

	stone, err := s.loadOwnedItem(ctx, charID, stoneItemID)
	if err != nil {
		return nil, nil, err
	}
	if stone.TemplateID != domainmw.StoneSkill {
		return nil, nil, pkgerrors.ErrInvalidArgs
	}
	if stone.StackCount < 1 {
		return nil, nil, pkgerrors.ErrInsufficientFunds
	}

	pool := s.collectMWSkillPool()
	if len(pool) == 0 {
		return &SkillResetResult{Success: false}, nil, nil
	}

	currentSID := domainmw.TSlotValue(equip, skillPosition)
	candidates := make([]int, 0, len(pool))
	for _, sid := range pool {
		if sid != currentSID {
			candidates = append(candidates, sid)
		}
	}
	if len(candidates) == 0 {
		candidates = pool
	}
	newSID := candidates[rand.Intn(len(candidates))]

	if _, _, err := s.itemService.ConsumeItemStackByID(ctx, charID, stoneItemID, 1); err != nil {
		return nil, nil, err
	}

	oldSID := domainmw.TSlotValue(equip, skillPosition)
	domainmw.SetTSlot(equip, skillPosition, newSID)
	if err := s.persistItem(ctx, equip); err != nil {
		return nil, nil, err
	}

	if domainmw.IsMainEquipped(equip) && s.skillGranter != nil {
		if oldSID > 0 {
			_ = s.skillGranter.RevokeSkillByID(ctx, charID, oldSID)
		}
		_ = s.skillGranter.GrantSkillByID(ctx, charID, newSID)
	}

	remaining := max(stone.StackCount-1, 0)

	s.logger.Info("MW skill reset",
		zap.Int64("char_id", charID),
		zap.Int64("item_id", equip.ID),
		zap.Int("position", skillPosition),
		zap.Int("new_sid", newSID))

	return &SkillResetResult{
		Success:        true,
		StoneRemaining: remaining,
		NewSkillID:     newSID,
		WasEquipped:    domainmw.IsMainEquipped(equip),
	}, equip, nil
}

func (s *Service) collectMWSkillPool() []int {
	if s.gameData == nil {
		return nil
	}
	return s.gameData.GetSkillIDsByUseEnv(SkillUseEnvMW)
}
