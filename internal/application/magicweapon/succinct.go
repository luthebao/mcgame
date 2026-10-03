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

func (s *Service) ShowMWInfo(ctx context.Context, charID, equipItemID int64) (*domainmw.SubFlag, error) {
	equip, err := s.loadOwnedItem(ctx, charID, equipItemID)
	if err != nil {
		return nil, err
	}
	tpl := s.gameData.GetEquipment(equip.TemplateID)
	if !domainmw.IsMWTemplate(tpl) {
		return &domainmw.SubFlag{}, nil
	}
	return domainmw.ParseSubFlag(domainmw.PropString(equip, domainmw.PropKeyFlag)), nil
}

func (s *Service) SucinctMW(ctx context.Context, charID, equipItemID int64, lockArr [3]bool, autoBuy bool) (*SuccinctRollResult, error) {
	equip, err := s.loadOwnedItem(ctx, charID, equipItemID)
	if err != nil {
		return nil, err
	}
	tpl := s.gameData.GetEquipment(equip.TemplateID)
	if !domainmw.IsSubTemplate(tpl) {
		return nil, pkgerrors.ErrInvalidArgs
	}

	count, err := s.itemService.CountCarriedItemsByTemplateID(ctx, charID, domainmw.StoneSuccinct)
	if err != nil {
		return nil, err
	}
	if count < 1 {
		return nil, pkgerrors.ErrInsufficientFunds
	}
	if _, err := s.itemService.ConsumeCarriedItemsByTemplateID(ctx, charID, domainmw.StoneSuccinct, 1); err != nil {
		return nil, err
	}

	current := domainmw.ParseSubFlag(domainmw.PropString(equip, domainmw.PropKeyFlag))
	rolled := &domainmw.SubFlag{}
	for i := 0; i < 3; i++ {
		if lockArr[i] {
			rolled.Set(i, randomSucceedSlot())
		} else {
			if existing := current.Get(i); existing != nil {
				rolled.Set(i, &domainmw.SuccinctSlot{PropType: existing.PropType, PropVal: existing.PropVal})
			}
		}
	}

	s.pendingSuccinctMu.Lock()
	s.pendingSuccinct[charID] = &PendingSuccinct{
		ItemID:  equip.ID,
		NewProp: rolled,
		LockArr: lockArr,
	}
	s.pendingSuccinctMu.Unlock()

	s.logger.Info("MW succinct rolled",
		zap.Int64("char_id", charID),
		zap.Int64("item_id", equip.ID))

	return &SuccinctRollResult{NewProp: rolled, LockArr: lockArr}, nil
}

func (s *Service) OnSureSuccinctMW(ctx context.Context, charID int64, confirm int) (*SuccinctSureResult, *domainitem.Item, error) {
	s.pendingSuccinctMu.Lock()
	pending, ok := s.pendingSuccinct[charID]
	if ok {
		delete(s.pendingSuccinct, charID)
	}
	s.pendingSuccinctMu.Unlock()

	if !ok {
		return &SuccinctSureResult{HadPending: false}, nil, nil
	}

	if confirm != 1 {
		equip, _ := s.loadOwnedItem(ctx, charID, pending.ItemID)
		current := domainmw.ParseSubFlag(domainmw.PropString(equip, domainmw.PropKeyFlag))
		return &SuccinctSureResult{
			HadPending: true,
			Discarded:  true,
			Flag:       current,
		}, nil, nil
	}

	equip, err := s.loadOwnedItem(ctx, charID, pending.ItemID)
	if err != nil {
		return nil, nil, err
	}

	encoded, err := pending.NewProp.Encode()
	if err == nil {
		domainmw.SetPropString(equip, domainmw.PropKeyFlag, encoded)
	}
	if err := s.persistItem(ctx, equip); err != nil {
		return nil, nil, err
	}

	return &SuccinctSureResult{
		HadPending:  true,
		Flag:        pending.NewProp,
		WasEquipped: domainmw.IsSubEquipped(equip),
	}, equip, nil
}

func (s *Service) ClearPendingSuccinct(charID int64) {
	s.pendingSuccinctMu.Lock()
	delete(s.pendingSuccinct, charID)
	s.pendingSuccinctMu.Unlock()
}

func randomSucceedSlot() *domainmw.SuccinctSlot {
	types := ActivatePropTypes()
	if len(types) == 0 {
		return nil
	}
	pt := types[rand.Intn(len(types))]
	r, ok := ActivatePropRange(pt)
	if !ok {
		return nil
	}
	val := r.ValMin + rand.Float64()*(r.ValMax-r.ValMin)
	return &domainmw.SuccinctSlot{PropType: pt, PropVal: val}
}
