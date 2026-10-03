// Open-sourced by BaoLT

// PRS divine-form ("Thần Hóa") operations: activate a form (consume chips),
// activate a special form (consume main-bag items via ItemConsumer),
// equip / un-equip the active form (drives the pet battle visual via prsUseId), and
// expire time-limited forms.
//
// Tab=0 forms (ActiveShow) consume PRS chips; limit_time is raw ms added to now-ms.
// Tab=1 forms (ActiveShowSpe) consume regular inventory items; limit_time is in
// minutes — expiry = nowMs + limitTime*60000, matching client PRSShowCvs.as arithmetic.
package prs

import (
	"context"
	"errors"
	"time"
)

var ErrInsufficientItems = errors.New("prs: không đủ vật phẩm")

var ErrNotActivated = errors.New("prs: hình dạng chưa kích hoạt")

func (s *Service) ActiveShow(ctx context.Context, charID int64, showID int) (map[string]interface{}, error) {
	tpl := s.gameData.GetPrsShow(showID)
	if tpl == nil {
		return nil, ErrUnknownShow
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	if state.hasActivated(showID) {
		return nil, ErrAlreadyActivated
	}

	needChipID := int(tpl.NeedChipID)
	needNum := int(tpl.NeedNum)
	if needNum > 0 {
		if !consumeChips(state.ChipBag, needChipID, needNum) {
			return nil, ErrInsufficientChips
		}
	}

	if tpl.LimitType > 0 && tpl.LimitTime > 0 {
		state.ActLimitObj[showID] = time.Now().UnixMilli() + int64(tpl.LimitTime)
	} else {
		state.ActArr[state.nextActArrIndex()] = showID
	}

	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return state.toWire(), nil
}

func (s *Service) ActiveShowSpe(ctx context.Context, charID int64, showID int) (map[string]interface{}, error) {
	tpl := s.gameData.GetPrsShow(showID)
	if tpl == nil {
		return nil, ErrUnknownShow
	}
	if int(tpl.Tab) != 1 {
		return nil, ErrUnknownShow
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	if state.hasActivated(showID) {
		return nil, ErrAlreadyActivated
	}
	if s.itemConsumer != nil {
		ok, err := s.itemConsumer.ConsumeItemsByTemplateID(ctx, charID, int(tpl.NeedChipID), int(tpl.NeedNum))
		if err != nil {
			return nil, err
		}
		if !ok {
			return nil, ErrInsufficientItems
		}
	}
	nowMs := time.Now().UnixMilli()
	state.ActLimitObj[showID] = nowMs + int64(tpl.LimitTime)*60000
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return state.toWire(), nil
}

func (s *Service) ReplaceShow(ctx context.Context, charID int64, showID int) (int, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return 0, err
	}
	if !state.hasActivated(showID) {
		return 0, ErrNotActivated
	}
	state.UseSid = showID
	state.UseID = showID
	if err := s.saveState(ctx, charID, state); err != nil {
		return 0, err
	}
	return showID, nil
}

func (s *Service) CancelShow(ctx context.Context, charID int64) (int, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return 0, err
	}
	state.UseSid = 0
	state.UseID = 0
	if err := s.saveState(ctx, charID, state); err != nil {
		return 0, err
	}
	return 0, nil
}

func (s *Service) UpdateActiveShow(ctx context.Context, charID int64, expiredShowIDs []int) error {
	if len(expiredShowIDs) == 0 {
		return nil
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return err
	}
	changed := false
	for _, showID := range expiredShowIDs {
		if _, ok := state.ActLimitObj[showID]; ok {
			delete(state.ActLimitObj, showID)
			changed = true
		}
		if state.UseSid == showID {
			state.UseSid = 0
			state.UseID = 0
			changed = true
		}
	}
	if !changed {
		return nil
	}
	return s.saveState(ctx, charID, state)
}
