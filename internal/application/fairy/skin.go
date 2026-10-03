// Open-sourced by BaoLT

// Fairy skin (Hoán đổi) operations under feature_key='fairy_skin'.
//
//	getFairyResAndList  -> {actFairy, actFairyList}
//	setFairyRes(tid,type) type2 activate -> actFairy=tid; type1 hide -> actFairy=0;
//	                      response {type, tid}. The tid must already be owned.
//	setFairyResList(tid)  unlock a skin (550 Gold), add tid to actFairyList ->
//	                      {actFairy, actFairyList}. Skin tids 15/16 unlock via item
//	                      in the client; the gold path is implemented and the
//	                      item-unlock path deferred (no skin-item id from the client).
package fairy

import "context"

type SetResResult struct {
	Type int
	Tid  int
}

func (s *Service) GetResAndList(ctx context.Context, charID int64) (map[string]interface{}, error) {
	skin, err := s.loadSkinState(ctx, charID)
	if err != nil {
		return nil, err
	}
	return skin.toWire(), nil
}

func (s *Service) SetRes(ctx context.Context, charID int64, tid, resType int) (*SetResResult, error) {
	skin, err := s.loadSkinState(ctx, charID)
	if err != nil {
		return nil, err
	}
	if !skin.has(tid) {
		return nil, ErrSkinNotOwned
	}
	switch resType {
	case SetFairyResShow:
		skin.ActFairy = tid
	case SetFairyResHide:
		if skin.ActFairy == tid {
			skin.ActFairy = 0
		}
	default:
		resType = SetFairyResHide
		if skin.ActFairy == tid {
			skin.ActFairy = 0
		}
	}
	if err := s.saveSkinState(ctx, charID, skin); err != nil {
		return nil, err
	}
	return &SetResResult{Type: resType, Tid: tid}, nil
}

func (s *Service) SetResList(ctx context.Context, charID int64, tid int) (map[string]interface{}, error) {
	skin, err := s.loadSkinState(ctx, charID)
	if err != nil {
		return nil, err
	}
	if skin.has(tid) {
		return nil, ErrSkinOwned
	}
	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, err
	}
	if err := deductGold(char, SkinUnlockGoldCost); err != nil {
		return nil, err
	}
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}
	skin.add(tid)
	if err := s.saveSkinState(ctx, charID, skin); err != nil {
		return nil, err
	}
	return skin.toWire(), nil
}
