// Open-sourced by BaoLT

// Pet equipment application logic validates pet gear rules, keeps stable pet equip slot groups, and syncs stat bonuses.
package pet

import (
	"context"

	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const (
	petEquipmentPositionStart = 50
	petEquipmentPositionEnd   = 57
)

type PetEquipMove struct {
	ItemID  int64
	FromSID int
	ToSID   int
}

type PetEquipOnResult struct {
	Pet       *domainpet.Pet
	Slot      int
	OldItemID int64
	NewItemID int64
	Moves     []PetEquipMove
}

type PetEquipOffResult struct {
	Pet    *domainpet.Pet
	Slot   int
	ItemID int64
	Move   PetEquipMove
}

func (s *Service) EquipPetItem(ctx context.Context, charID int64, petID int64, itemID int64) (*PetEquipOnResult, error) {
	if s.petRepo == nil || s.itemRepo == nil || s.gameDataManager == nil {
		return nil, pkgerrors.ErrSystemError
	}

	p, err := s.getPetAndValidate(ctx, charID, petID)
	if err != nil {
		return nil, err
	}

	item, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return nil, err
	}
	if item == nil || item.CharacterID != charID {
		return nil, pkgerrors.ErrItemNotOwned
	}
	if !item.IsEquipment() || item.SlotType != domainitem.SlotTypeBag {
		return nil, pkgerrors.ErrCannotEquip
	}

	template := s.gameDataManager.GetEquipment(item.TemplateID)
	if !isPetEquipmentTemplate(template) || !petCanEquipTemplate(p, template, s.petSkillClassID(p)) {
		return nil, pkgerrors.ErrCannotEquip
	}

	slot := petEquipmentSlotFromTemplate(template)
	if slot == 0 {
		return nil, pkgerrors.ErrCannotEquip
	}

	group, groupAssigned, err := s.resolvePetEquipmentGroup(ctx, p)
	if err != nil {
		return nil, err
	}

	targetSlotIndex := petEquipmentInventorySlot(group, slot)
	targetSID := petEquipmentSID(targetSlotIndex)
	moveResult := &PetEquipOnResult{
		Pet:       p,
		Slot:      slot,
		NewItemID: item.ID,
		Moves: []PetEquipMove{
			{
				ItemID:  item.ID,
				FromSID: item.CalculateSID(),
				ToSID:   targetSID,
			},
		},
	}

	var displaced *domainitem.Item
	oldItemID := p.EquipmentItemID(slot)
	if oldItemID > 0 {
		moveResult.OldItemID = oldItemID
		displaced, err = s.itemRepo.FindByID(ctx, oldItemID)
		if err != nil && !pkgerrors.Is(err, pkgerrors.ErrItemNotFound) {
			return nil, err
		}
		if displaced != nil && displaced.CharacterID == charID {
			moveResult.Moves = append(moveResult.Moves, PetEquipMove{
				ItemID:  displaced.ID,
				FromSID: displaced.CalculateSID(),
				ToSID:   item.CalculateSID(),
			})
		} else {
			displaced = nil
		}
	}

	itemSnapshot := snapshotPetEquipItem(item)
	var displacedSnapshot *petEquipItemSnapshot
	tempSlotIndex := 0
	if displaced != nil {
		snapshot := snapshotPetEquipItem(displaced)
		displacedSnapshot = &snapshot
		tempSlotIndex = -int(displaced.ID)
	}
	petSnapshot := clonePetSnapshot(p)

	if displaced != nil {
		if err := s.itemRepo.MoveItem(ctx, displaced.ID, domainitem.SlotTypeTempBag, tempSlotIndex); err != nil {
			return nil, err
		}
		displaced.MoveTo(domainitem.SlotTypeTempBag, tempSlotIndex)
	}

	if err := s.itemRepo.MoveItem(ctx, item.ID, domainitem.SlotTypePetEquipped, targetSlotIndex); err != nil {
		if displacedSnapshot != nil {
			_ = s.itemRepo.MoveItem(ctx, displacedSnapshot.ItemID, displacedSnapshot.SlotType, displacedSnapshot.SlotIndex)
			displaced.MoveTo(displacedSnapshot.SlotType, displacedSnapshot.SlotIndex)
		}
		return nil, err
	}
	item.MoveTo(domainitem.SlotTypePetEquipped, targetSlotIndex)

	if displaced != nil {
		if err := s.itemRepo.MoveItem(ctx, displaced.ID, domainitem.SlotTypeBag, itemSnapshot.SlotIndex); err != nil {
			_ = s.itemRepo.MoveItem(ctx, item.ID, itemSnapshot.SlotType, itemSnapshot.SlotIndex)
			item.MoveTo(itemSnapshot.SlotType, itemSnapshot.SlotIndex)
			_ = s.itemRepo.MoveItem(ctx, displaced.ID, displacedSnapshot.SlotType, displacedSnapshot.SlotIndex)
			displaced.MoveTo(displacedSnapshot.SlotType, displacedSnapshot.SlotIndex)
			return nil, err
		}
		displaced.MoveTo(domainitem.SlotTypeBag, itemSnapshot.SlotIndex)
	}

	p.SetEquipmentItemID(slot, item.ID)
	s.syncPetEquipmentBonuses(ctx, p)
	s.syncPetSkillBonuses(p)
	p.RecalculateStats()

	if err := s.petRepo.Save(ctx, p); err != nil {
		if displacedSnapshot != nil {
			_ = s.itemRepo.MoveItem(ctx, displacedSnapshot.ItemID, displacedSnapshot.SlotType, displacedSnapshot.SlotIndex)
		}
		_ = s.itemRepo.MoveItem(ctx, itemSnapshot.ItemID, itemSnapshot.SlotType, itemSnapshot.SlotIndex)
		*p = *petSnapshot
		return nil, err
	}

	if groupAssigned {
		s.logger.Info("Assigned pet equipment group",
			zap.Int64("character_id", charID),
			zap.Int64("pet_id", petID),
			zap.Int("group", group))
	}

	s.logger.Info("Pet equipment equipped",
		zap.Int64("character_id", charID),
		zap.Int64("pet_id", petID),
		zap.Int64("item_id", itemID),
		zap.Int("slot", slot))

	return moveResult, nil
}

func (s *Service) UnequipPetItem(ctx context.Context, charID int64, petID int64, itemID int64) (*PetEquipOffResult, error) {
	if s.petRepo == nil || s.itemRepo == nil || s.gameDataManager == nil {
		return nil, pkgerrors.ErrSystemError
	}

	p, err := s.getPetAndValidate(ctx, charID, petID)
	if err != nil {
		return nil, err
	}

	slot := 0
	for candidate := 1; candidate <= domainpet.TotalPetEquipmentSlots; candidate++ {
		if p.EquipmentItemID(candidate) == itemID {
			slot = candidate
			break
		}
	}
	if slot == 0 {
		return nil, pkgerrors.ErrCannotUnequip
	}

	item, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return nil, err
	}
	if item == nil || item.CharacterID != charID || item.SlotType != domainitem.SlotTypePetEquipped {
		return nil, pkgerrors.ErrCannotUnequip
	}

	bagSlot, err := s.itemRepo.FindFirstEmptySlot(ctx, charID, domainitem.SlotTypeBag, domainitem.DefaultBagSlots)
	if err != nil {
		return nil, err
	}

	itemSnapshot := snapshotPetEquipItem(item)
	petSnapshot := clonePetSnapshot(p)
	move := PetEquipMove{
		ItemID:  item.ID,
		FromSID: item.CalculateSID(),
		ToSID:   2101 + bagSlot,
	}

	if err := s.itemRepo.MoveItem(ctx, item.ID, domainitem.SlotTypeBag, bagSlot); err != nil {
		return nil, err
	}
	item.MoveTo(domainitem.SlotTypeBag, bagSlot)

	p.SetEquipmentItemID(slot, 0)
	s.syncPetEquipmentBonuses(ctx, p)
	s.syncPetSkillBonuses(p)
	p.RecalculateStats()

	if err := s.petRepo.Save(ctx, p); err != nil {
		_ = s.itemRepo.MoveItem(ctx, itemSnapshot.ItemID, itemSnapshot.SlotType, itemSnapshot.SlotIndex)
		item.MoveTo(itemSnapshot.SlotType, itemSnapshot.SlotIndex)
		*p = *petSnapshot
		return nil, err
	}

	s.logger.Info("Pet equipment unequipped",
		zap.Int64("character_id", charID),
		zap.Int64("pet_id", petID),
		zap.Int64("item_id", itemID),
		zap.Int("slot", slot))

	return &PetEquipOffResult{
		Pet:    p,
		Slot:   slot,
		ItemID: item.ID,
		Move:   move,
	}, nil
}

func (s *Service) syncPetEquipmentBonuses(ctx context.Context, p *domainpet.Pet) {
	bonuses := domainpet.NewEquipmentStatBonuses()
	if p == nil || s == nil || s.itemRepo == nil || s.gameDataManager == nil {
		if p != nil {
			p.SetEquipmentBonuses(bonuses)
		}
		return
	}

	for slot := 1; slot <= domainpet.TotalPetEquipmentSlots; slot++ {
		itemID := p.EquipmentItemID(slot)
		if itemID <= 0 {
			continue
		}

		item, err := s.itemRepo.FindByID(ctx, itemID)
		if err != nil || item == nil || item.CharacterID != p.CharacterID {
			continue
		}

		template := s.gameDataManager.GetEquipment(item.TemplateID)
		if template == nil {
			continue
		}

		addPetEquipmentItemBonuses(&bonuses, item, template)
	}

	p.SetEquipmentBonuses(bonuses)
}

func addPetEquipmentItemBonuses(bonuses *domainpet.EquipmentStatBonuses, item *domainitem.Item, template *models.EquiptTemplateTemplate) {
	if bonuses == nil || item == nil || template == nil {
		return
	}

	mainProp1 := petEquipmentItemPropValue(item.Properties, "mainProp1")
	mainPropNum1 := petEquipmentItemPropValue(item.Properties, "mainPropNum1")
	if mainProp1 <= 0 {
		mainProp1 = int(template.MainProp1)
		mainPropNum1 = int(template.MainPropNum1)
	}
	addPetEquipmentPropBonus(bonuses, mainProp1, mainPropNum1)

	bindNum1 := petEquipmentItemPropValue(item.Properties, "bindMainPropNum1")
	if bindNum1 > 0 {
		addPetEquipmentPropBonus(bonuses, mainProp1, bindNum1)
	}

	mainProp2 := petEquipmentItemPropValue(item.Properties, "mainProp2")
	mainPropNum2 := petEquipmentItemPropValue(item.Properties, "mainPropNum2")
	if mainProp2 <= 0 {
		mainProp2 = int(template.MainProp2)
		mainPropNum2 = int(template.MainPropNum2)
	}
	addPetEquipmentPropBonus(bonuses, mainProp2, mainPropNum2)

	bindNum2 := petEquipmentItemPropValue(item.Properties, "bindMainPropNum2")
	if bindNum2 > 0 {
		addPetEquipmentPropBonus(bonuses, mainProp2, bindNum2)
	}

	prop1 := petEquipmentItemPropValue(item.Properties, "prop1")
	propNum1 := petEquipmentItemPropValue(item.Properties, "propNum1")
	if prop1 <= 0 {
		prop1 = int(template.Prop1)
		propNum1 = int(template.PropNum1)
	}
	addPetEquipmentPropBonus(bonuses, prop1, propNum1)

	prop2 := petEquipmentItemPropValue(item.Properties, "prop2")
	propNum2 := petEquipmentItemPropValue(item.Properties, "propNum2")
	if prop2 <= 0 {
		prop2 = int(template.Prop2)
		propNum2 = int(template.PropNum2)
	}
	addPetEquipmentPropBonus(bonuses, prop2, propNum2)
}

func addPetEquipmentPropBonus(bonuses *domainpet.EquipmentStatBonuses, rawProp, value int) {
	if bonuses == nil || rawProp <= 0 || value == 0 {
		return
	}

	if statProp, ok := petEquipmentPercentPropToStat(rawProp); ok {
		bonuses.AddPercent(statProp, value)
		return
	}

	if statProp, ok := petEquipmentFloatPropToStat(rawProp); ok {
		bonuses.AddFloat(statProp, float64(value))
		return
	}

	bonuses.AddFlat(rawProp, value)
}

func petEquipmentPercentPropToStat(rawProp int) (int, bool) {
	switch rawProp {
	case 24:
		return 1, true
	case 25:
		return 2, true
	default:
		return 0, false
	}
}

func petEquipmentFloatPropToStat(rawProp int) (int, bool) {
	switch rawProp {
	case 14, 26, 27, 28, 29, 30, 31, 32:
		return rawProp, true
	default:
		return 0, false
	}
}

func petEquipmentItemPropValue(props map[string]interface{}, key string) int {
	if props == nil {
		return 0
	}
	value, ok := props[key]
	if !ok {
		return 0
	}
	switch typed := value.(type) {
	case int:
		return typed
	case int32:
		return int(typed)
	case int64:
		return int(typed)
	case float32:
		return int(typed)
	case float64:
		return int(typed)
	case string:
		parsed, ok := parsePetSkillRequirementPart(typed)
		if !ok {
			return 0
		}
		return parsed
	default:
		return 0
	}
}

func isPetEquipmentTemplate(template *models.EquiptTemplateTemplate) bool {
	if template == nil {
		return false
	}
	position := int(template.Position)
	return int(template.Kind) == 9 && position >= petEquipmentPositionStart && position <= petEquipmentPositionEnd
}

func petCanEquipTemplate(p *domainpet.Pet, template *models.EquiptTemplateTemplate, petClassID int) bool {
	if p == nil || template == nil {
		return false
	}
	if int(template.ReqLevel) > 0 && p.Level < int(template.ReqLevel) {
		return false
	}

	requiredClasses := template.ParsePipeDelimitedInts(template.ReqClass)
	if len(requiredClasses) > 0 {
		match := false
		for _, classID := range requiredClasses {
			if classID == petClassID {
				match = true
				break
			}
		}
		if !match {
			return false
		}
	}

	requiredTemplates := template.ParsePipeDelimitedInts(template.ReqClassID)
	if len(requiredTemplates) > 0 {
		match := false
		for _, templateID := range requiredTemplates {
			if templateID == p.TemplateID {
				match = true
				break
			}
		}
		if !match {
			return false
		}
	}

	return true
}

func petEquipmentSlotFromTemplate(template *models.EquiptTemplateTemplate) int {
	if template == nil {
		return 0
	}
	position := int(template.Position)
	if position < petEquipmentPositionStart || position > petEquipmentPositionEnd {
		return 0
	}
	return position - petEquipmentPositionStart + 1
}

func petEquipmentInventorySlot(group int, slot int) int {
	return (group * domainpet.TotalPetEquipmentSlots) + (slot - 1)
}

func petEquipmentSID(slotIndex int) int {
	return 1001 + slotIndex
}

func (s *Service) resolvePetEquipmentGroup(ctx context.Context, p *domainpet.Pet) (int, bool, error) {
	if p == nil {
		return 0, false, pkgerrors.ErrNotFound
	}

	if group, ok := p.EquipmentGroup(); ok {
		return group, false, nil
	}

	if inferred, ok := s.inferPetEquipmentGroup(ctx, p); ok {
		p.SetEquipmentGroup(inferred)
		return inferred, true, nil
	}

	group, err := s.allocatePetEquipmentGroup(ctx, p.CharacterID, p.ID)
	if err != nil {
		return 0, false, err
	}
	p.SetEquipmentGroup(group)
	return group, true, nil
}

func (s *Service) allocatePetEquipmentGroup(ctx context.Context, charID int64, petID int64) (int, error) {
	pets, err := s.petRepo.FindByCharacterID(ctx, charID)
	if err != nil {
		return 0, err
	}

	used := make(map[int]bool, len(pets))
	for _, pet := range pets {
		if pet == nil || pet.ID == petID {
			continue
		}
		if group, ok := pet.EquipmentGroup(); ok {
			used[group] = true
			continue
		}
		if inferred, ok := s.inferPetEquipmentGroup(ctx, pet); ok {
			used[inferred] = true
		}
	}

	for group := 0; group < domainpet.MaxPetEquipmentGroups; group++ {
		if !used[group] {
			return group, nil
		}
	}

	return 0, pkgerrors.ErrInventoryFull
}

func (s *Service) inferPetEquipmentGroup(ctx context.Context, p *domainpet.Pet) (int, bool) {
	if p == nil || s == nil || s.itemRepo == nil {
		return 0, false
	}

	for slot := 1; slot <= domainpet.TotalPetEquipmentSlots; slot++ {
		itemID := p.EquipmentItemID(slot)
		if itemID <= 0 {
			continue
		}

		item, err := s.itemRepo.FindByID(ctx, itemID)
		if err != nil || item == nil || item.SlotType != domainitem.SlotTypePetEquipped || item.SlotIndex < 0 {
			continue
		}

		group := item.SlotIndex / domainpet.TotalPetEquipmentSlots
		if group >= 0 && group < domainpet.MaxPetEquipmentGroups {
			return group, true
		}
	}

	return 0, false
}

func (s *Service) movePetEquipmentToBag(ctx context.Context, p *domainpet.Pet) error {
	if p == nil || !p.HasEquippedItems() || s.itemRepo == nil {
		return nil
	}

	equippedCount := 0
	for slot := 1; slot <= domainpet.TotalPetEquipmentSlots; slot++ {
		if p.EquipmentItemID(slot) > 0 {
			equippedCount++
		}
	}

	bagItems, err := s.itemRepo.FindByCharacterAndSlotType(ctx, p.CharacterID, domainitem.SlotTypeBag)
	if err != nil {
		return err
	}
	if (domainitem.DefaultBagSlots - len(bagItems)) < equippedCount {
		return pkgerrors.ErrInventoryFull
	}

	changed := false
	for slot := 1; slot <= domainpet.TotalPetEquipmentSlots; slot++ {
		itemID := p.EquipmentItemID(slot)
		if itemID <= 0 {
			continue
		}

		item, err := s.itemRepo.FindByID(ctx, itemID)
		if err != nil {
			if pkgerrors.Is(err, pkgerrors.ErrItemNotFound) {
				p.SetEquipmentItemID(slot, 0)
				changed = true
				continue
			}
			return err
		}
		if item == nil || item.CharacterID != p.CharacterID {
			p.SetEquipmentItemID(slot, 0)
			changed = true
			continue
		}

		bagSlot, err := s.itemRepo.FindFirstEmptySlot(ctx, p.CharacterID, domainitem.SlotTypeBag, domainitem.DefaultBagSlots)
		if err != nil {
			return err
		}
		if err := s.itemRepo.MoveItem(ctx, item.ID, domainitem.SlotTypeBag, bagSlot); err != nil {
			return err
		}
		p.SetEquipmentItemID(slot, 0)
		changed = true
	}

	if !changed {
		return nil
	}

	s.syncPetEquipmentBonuses(ctx, p)
	s.syncPetSkillBonuses(p)
	p.RecalculateStats()

	return s.petRepo.Save(ctx, p)
}

type petEquipItemSnapshot struct {
	ItemID    int64
	SlotType  domainitem.SlotType
	SlotIndex int
}

func snapshotPetEquipItem(item *domainitem.Item) petEquipItemSnapshot {
	return petEquipItemSnapshot{
		ItemID:    item.ID,
		SlotType:  item.SlotType,
		SlotIndex: item.SlotIndex,
	}
}
