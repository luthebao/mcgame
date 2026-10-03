// Open-sourced by BaoLT

// Pet Stone inlay operations: petStoneSet, removePetStone, getPetStoneByEid,
// changePetStoneEnergy.
//
// Inlay state is stored per pet-equipment-instance under feature_key
// 'pet_stone_inlay' as {equGiid: {slot 1-6: stoneGiid}}. petStoneSet moves a
// stone out of the bag into the named slot; removePetStone moves it back. Slot 1
// is the energy (Tụ Linh) slot and carries the skillId bound to the energy stone.
//
// The equData field of the petStoneSet / removePetStone responses is a minimal
// stub ({}). Full TBL_EQUIPT_INSTANCE integration (writing inlay state onto the
// equipment-instance record the client mirrors via updateData) is deferred — the
// client's PetStonePanel re-reads inlay state through getPetStoneByEid, so the
// panel stays consistent without the equData blob.
//
// changePetStoneEnergy refines a skill onto an energy (Tụ Linh) stone. It charges
// energyStone — 500 for a passive skill (type 1), 1000 for a special skill
// (type 2) — and assigns a real skillId drawn from the TBL_SKILL ex_stone_sid pool
// (gamedata.PetStoneExSkillPool), segmented by type: type 1 draws a base/passive
// skill id (an ex_stone_sid>0 row), type 2 draws that row's ex_stone_sid target
// (the special "Bảo Thạch*…" skill). This replaces the previous skillId=0 stub,
// which charged the player but granted nothing.
//
// DOCUMENTED ASSUMPTION (calibrate later): the draw is a uniform pick over the
// pool — the ex_stone_sid candidate pool is real but carries no RNG weighting in
// the data, so each id is equally likely. petStoneSkillDrawUniform is the single
// switch; flip it (and feed a weight table) once live-log evidence lands. Uniform
// is strictly safer than the prior pay-for-nothing behaviour.
package petstone

import (
	"context"
	"strconv"

	"go.uber.org/zap"
)

const petStoneSkillDrawUniform = true

const (
	skillTypePassive = 1
	skillTypeSpecial = 2
)

type SetResult struct {
	BagData []interface{}
	SlotID  int
	NewID   int
	SkillID int
	EquData map[string]interface{}
}

func (s *Service) Set(ctx context.Context, charID, equGiid int64, slotIndex, stoneBagSlot int) (*SetResult, error) {
	if slotIndex < MinInlaySlot || slotIndex > MaxInlaySlot {
		return nil, ErrInvalidInlaySlot
	}
	bag, err := s.loadBag(ctx, charID)
	if err != nil {
		return nil, err
	}
	entry, ok := bag.Slots[stoneBagSlot]
	if !ok || entry == nil || entry.Giid <= 0 {
		return nil, ErrStoneNotFound
	}
	stone := s.stone(entry.Giid)
	if stone == nil {
		return nil, ErrStoneNotFound
	}
	inlay, err := s.loadInlay(ctx, charID)
	if err != nil {
		return nil, err
	}
	slots := inlay.slots(equGiid)
	if existing, taken := slots[slotIndex]; taken && existing > 0 {
		return nil, ErrInlaySlotTaken
	}

	skillID := 0
	if slotIndex == EnergySlot {
		skillID = entry.SkillID
	}
	stoneGiid := entry.Giid
	if !bag.removeFromSlot(stoneBagSlot, 1) {
		return nil, ErrInsufficientQty
	}
	slots[slotIndex] = stoneGiid

	if err := s.saveBag(ctx, charID, bag); err != nil {
		return nil, err
	}
	if err := s.saveInlay(ctx, charID, inlay); err != nil {
		return nil, err
	}
	return &SetResult{
		BagData: bag.toArray(),
		SlotID:  slotIndex,
		NewID:   stoneGiid,
		SkillID: skillID,
		EquData: map[string]interface{}{},
	}, nil
}

func (s *Service) Remove(ctx context.Context, charID, equGiid int64, slotIndex int) (*SetResult, error) {
	if slotIndex < MinInlaySlot || slotIndex > MaxInlaySlot {
		return nil, ErrInvalidInlaySlot
	}
	inlay, err := s.loadInlay(ctx, charID)
	if err != nil {
		return nil, err
	}
	slots := inlay.slots(equGiid)
	stoneGiid, ok := slots[slotIndex]
	if !ok || stoneGiid <= 0 {
		return nil, ErrInlaySlotEmpty
	}
	bag, err := s.loadBag(ctx, charID)
	if err != nil {
		return nil, err
	}

	bag.addStone(stoneGiid, 1, 0)
	delete(slots, slotIndex)
	if len(slots) == 0 {
		delete(inlay.Equip, equGiid)
	}

	if err := s.saveBag(ctx, charID, bag); err != nil {
		return nil, err
	}
	if err := s.saveInlay(ctx, charID, inlay); err != nil {
		return nil, err
	}
	return &SetResult{
		BagData: bag.toArray(),
		SlotID:  slotIndex,
		NewID:   0,
		SkillID: 0,
		EquData: map[string]interface{}{},
	}, nil
}

func (s *Service) GetByEid(ctx context.Context, charID, equGiid int64) (interface{}, error) {
	inlay, err := s.loadInlay(ctx, charID)
	if err != nil {
		return nil, err
	}
	slots, ok := inlay.Equip[equGiid]
	if !ok || len(slots) == 0 {
		return -1, nil
	}
	out := map[string]interface{}{}
	for slot, stoneGiid := range slots {
		if stoneGiid <= 0 {
			continue
		}
		out[strconv.Itoa(slot)] = []interface{}{stoneGiid, 0, 0}
	}
	if len(out) == 0 {
		return -1, nil
	}
	return out, nil
}

type EnergyResult struct {
	Sid     int
	SkillID int
	BagData []interface{}
	NewSid  int
}

func (s *Service) ChangeEnergy(ctx context.Context, charID int64, energyBagSlot, skillType int) (*EnergyResult, error) {
	if skillType != skillTypePassive && skillType != skillTypeSpecial {
		return nil, ErrInvalidSkillType
	}
	bag, err := s.loadBag(ctx, charID)
	if err != nil {
		return nil, err
	}
	entry, ok := bag.Slots[energyBagSlot]
	if !ok || entry == nil || entry.Giid <= 0 {
		return nil, ErrStoneNotFound
	}
	stone := s.stone(entry.Giid)
	if stone == nil || stone.energyFlag != 1 {
		return nil, ErrNotEnergyStone
	}

	skillID, err := s.drawEnergySkill(skillType)
	if err != nil {
		return nil, err
	}

	cost := energyCostPassive
	if skillType == skillTypeSpecial {
		cost = energyCostSpecial
	}
	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, err
	}
	if char.EnergyStone < cost {
		return nil, ErrInsufficientEnergyStone
	}
	if err := char.DeductCurrency(currencyEnergyStone, cost); err != nil {
		return nil, err
	}
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}

	entry.SkillID = skillID
	if err := s.saveBag(ctx, charID, bag); err != nil {
		s.logger.Error("petstone: energyStone deducted but bag save failed",
			zap.Int64("char_id", charID), zap.Int("cost", cost), zap.Int("skill_id", skillID), zap.Error(err))
		return nil, err
	}
	return &EnergyResult{
		Sid:     energyBagSlot,
		SkillID: skillID,
		BagData: bag.toArray(),
		NewSid:  energyBagSlot,
	}, nil
}

func (s *Service) drawEnergySkill(skillType int) (int, error) {
	if s.gameData == nil {
		return 0, ErrNoSkillPool
	}
	passive, special := s.gameData.PetStoneExSkillPool()
	pool := passive
	if skillType == skillTypeSpecial {
		pool = special
	}
	if !petStoneSkillDrawUniform {
		return 0, ErrNoSkillPool
	}
	skillID := s.pick(pool)
	if skillID <= 0 {
		return 0, ErrNoSkillPool
	}
	return skillID, nil
}
