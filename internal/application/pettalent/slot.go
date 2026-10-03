// Open-sourced by BaoLT

// Pet Talent slot upgrade: upTalentSlotLv. Only slot indices 1-9 (fixed-attribute
// talent slots) are upgradeable. The next-level record is FindPetTalentBySidLv(
// sid, currentLv+1); its up_exp is the pvePoint cost, or ceil(up_exp*goldRate) when
// paying with gold. The new Tal[sid] = the next record id and a {sid:newTid} delta
// is returned to merge into the client's petTalentData.tal.
package pettalent

import (
	"context"
	"math"
)

func (s *Service) UpTalentSlotLv(ctx context.Context, charID int64, sid int, useGold bool) (map[string]interface{}, error) {
	idx := slotIndexOf(sid)
	if pageOf(sid) < 1 || pageOf(sid) > 4 || idx < minSlotIndex || idx > maxUpSlot {
		return nil, ErrInvalidSlot
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}

	currentLv := s.talentLevel(state.Tal[sid])
	if currentLv >= maxSlotLevel {
		return nil, ErrMaxSlotLevel
	}
	next := s.gameData.FindPetTalentBySidLv(sid, currentLv+1)
	if next == nil {
		return nil, ErrTalentNotFound
	}

	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, err
	}
	if useGold {
		gold := int(math.Ceil(next.UpExp * goldRate))
		if err := deductGold(char, gold); err != nil {
			return nil, err
		}
	} else {
		if err := deductPve(char, int(next.UpExp)); err != nil {
			return nil, err
		}
	}
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}

	newTid := int(next.ID)
	state.Tal[sid] = newTid
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return map[string]interface{}{itoa(sid): newTid}, nil
}
