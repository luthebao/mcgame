// Open-sourced by BaoLT

// Pet Stone bag operations: initPetStonePanel, composePetStone, absorbPetStone,
// resolvePetStone. All return the full bag as a sparse Array for the wire.
//
// Compose ratio: the client compose tab has a single source slot plus a quantity
// stepper (1-999) and previews source.level -> source.nextId (one tier up). The
// silver label is costSil * qty. There is no N-stones-to-1 ratio in the UI, so we
// consume `qty` source stones and produce `qty` nextId stones at silver cost
// int(costSil)*qty (1:1). Documented as a deferral.
//
// Absorb target: TBL_PET_STONE rows encode, per propType, a 1->5 next_id chain and
// the level-5 row carries energy_id pointing at its level-6 (energy_flag=1) stone.
// We require all 5 source slots to be the SAME level-5 stone with energy_id>0 and
// produce 1 of that energy_id stone (the energyFlag=1 target). This is fully
// data-grounded and never yields an invalid id.
package petstone

import "context"

func (s *Service) Init(ctx context.Context, charID int64) ([]interface{}, error) {
	bag, err := s.loadBag(ctx, charID)
	if err != nil {
		return nil, err
	}
	return bag.toArray(), nil
}

func (s *Service) Compose(ctx context.Context, charID int64, sourceSlot, qty int) ([]interface{}, error) {
	if qty <= 0 {
		return nil, ErrInvalidQty
	}
	bag, err := s.loadBag(ctx, charID)
	if err != nil {
		return nil, err
	}
	entry, ok := bag.Slots[sourceSlot]
	if !ok || entry == nil || entry.Giid <= 0 {
		return nil, ErrStoneNotFound
	}
	if entry.StackNum < qty {
		return nil, ErrInsufficientQty
	}
	stone := s.stone(entry.Giid)
	if stone == nil || stone.nextID <= 0 {
		return nil, ErrNoNextTier
	}
	if s.stone(stone.nextID) == nil {
		return nil, ErrNoNextTier
	}

	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, err
	}
	cost := int64(stone.costSil) * int64(qty)
	if char.Money < cost {
		return nil, ErrInsufficientSil
	}
	char.Money -= cost

	if !bag.removeFromSlot(sourceSlot, qty) {
		return nil, ErrInsufficientQty
	}
	bag.addStone(stone.nextID, qty, 0)

	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}
	if err := s.saveBag(ctx, charID, bag); err != nil {
		return nil, err
	}
	return bag.toArray(), nil
}

func (s *Service) Absorb(ctx context.Context, charID int64, sidList []int) ([]interface{}, error) {
	if len(sidList) != 5 {
		return nil, ErrAbsorbNeedsFive
	}
	bag, err := s.loadBag(ctx, charID)
	if err != nil {
		return nil, err
	}
	used := map[int]int{}
	for _, sid := range sidList {
		used[sid]++
	}
	srcGiid := -1
	energyID := 0
	for sid, count := range used {
		entry, ok := bag.Slots[sid]
		if !ok || entry == nil || entry.Giid <= 0 {
			return nil, ErrStoneNotFound
		}
		if entry.StackNum < count {
			return nil, ErrInsufficientQty
		}
		stone := s.stone(entry.Giid)
		if stone == nil || stone.level != MaxStoneLevel || stone.energyFlag == 1 || stone.energyID <= 0 {
			return nil, ErrAbsorbNeedsFive
		}
		if srcGiid == -1 {
			srcGiid = entry.Giid
			energyID = stone.energyID
		} else if entry.Giid != srcGiid {
			return nil, ErrAbsorbNeedsFive
		}
	}
	if energyID <= 0 || s.stone(energyID) == nil {
		return nil, ErrNoEnergyTarget
	}

	for sid, count := range used {
		if !bag.removeFromSlot(sid, count) {
			return nil, ErrInsufficientQty
		}
	}
	bag.addStone(energyID, 1, 0)

	if err := s.saveBag(ctx, charID, bag); err != nil {
		return nil, err
	}
	return bag.toArray(), nil
}

func (s *Service) Resolve(ctx context.Context, charID int64, sourceSlot, qty int) ([]interface{}, error) {
	if qty <= 0 {
		return nil, ErrInvalidQty
	}
	bag, err := s.loadBag(ctx, charID)
	if err != nil {
		return nil, err
	}
	entry, ok := bag.Slots[sourceSlot]
	if !ok || entry == nil || entry.Giid <= 0 {
		return nil, ErrStoneNotFound
	}
	if entry.StackNum < qty {
		return nil, ErrInsufficientQty
	}
	stone := s.stone(entry.Giid)
	if stone == nil {
		return nil, ErrStoneNotFound
	}

	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, err
	}
	yield := stone.resolveNum * qty
	if yield > 0 {
		if err := char.AddCurrency(currencyEnergyStone, yield); err != nil {
			return nil, err
		}
	}

	if !bag.removeFromSlot(sourceSlot, qty) {
		return nil, ErrInsufficientQty
	}

	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}
	if err := s.saveBag(ctx, charID, bag); err != nil {
		return nil, err
	}
	return bag.toArray(), nil
}
