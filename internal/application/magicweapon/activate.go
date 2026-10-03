// Open-sourced by BaoLT

package magicweapon

import (
	"context"

	domainitem "mcgame-server/internal/domain/item"
	domainmw "mcgame-server/internal/domain/magicweapon"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (s *Service) ActivateMWPro(ctx context.Context, charID, equipItemID int64, propIndex int) (*ActivateResult, *domainitem.Item, error) {
	if propIndex < 0 || propIndex > 2 {
		return nil, nil, pkgerrors.ErrInvalidArgs
	}
	equip, err := s.loadOwnedItem(ctx, charID, equipItemID)
	if err != nil {
		return nil, nil, err
	}
	tpl := s.gameData.GetEquipment(equip.TemplateID)
	if !domainmw.IsSubTemplate(tpl) {
		return &ActivateResult{Failed: true}, nil, nil
	}

	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil || char == nil {
		return nil, nil, pkgerrors.ErrUnauthorized
	}
	if char.Level < domainmw.UnlockPlayerLevel {
		return &ActivateResult{Failed: true}, nil, nil
	}

	current := domainmw.ParseSubFlag(domainmw.PropString(equip, domainmw.PropKeyFlag))
	if propIndex > 0 && current.Get(propIndex-1) == nil {
		return &ActivateResult{Failed: true, Index: propIndex}, nil, nil
	}
	if current.Get(propIndex) != nil {
		return &ActivateResult{Failed: true, Index: propIndex}, nil, nil
	}

	cost := int64(domainmw.ActivateGoldCost)
	useUnbound := char.SelectedGoldType == 4
	if useUnbound && char.Gold < cost {
		return &ActivateResult{Failed: true}, nil, nil
	}
	if !useUnbound && char.GoldBind < cost {
		return &ActivateResult{Failed: true}, nil, nil
	}
	if useUnbound {
		char.Gold -= cost
	} else {
		char.GoldBind -= cost
	}
	if err := s.persistChar(ctx, char); err != nil {
		return nil, nil, err
	}

	slot := randomSucceedSlot()
	if slot == nil {
		return &ActivateResult{Failed: true}, nil, nil
	}
	current.Set(propIndex, slot)
	encoded, err := current.Encode()
	if err == nil {
		domainmw.SetPropString(equip, domainmw.PropKeyFlag, encoded)
	}
	if err := s.persistItem(ctx, equip); err != nil {
		return nil, nil, err
	}

	s.logger.Info("MW activate slot",
		zap.Int64("char_id", charID),
		zap.Int64("item_id", equip.ID),
		zap.Int("index", propIndex),
		zap.Int("prop_type", slot.PropType),
		zap.Float64("prop_val", slot.PropVal))

	return &ActivateResult{
		Failed:      false,
		Index:       propIndex,
		Slot:        slot,
		WasEquipped: domainmw.IsSubEquipped(equip),
		Gold:        char.Gold,
		GoldBind:    char.GoldBind,
		UsedBound:   !useUnbound,
	}, equip, nil
}
