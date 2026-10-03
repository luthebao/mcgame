// Open-sourced by BaoLT

package pet

import (
	"context"
	"errors"

	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const petSkillDeleteItemTemplateID = 1364

var (
	ErrPetMustBeBoundForSkillDelete = errors.New("pet must be bound before deleting skill")
	ErrPetSkillDeleteItemRequired   = errors.New("pet skill delete item required")
)

type PetSkillDeleteResult struct {
	Pet             *domainpet.Pet
	Slot            int
	SlotKey         string
	RemovedSkillID  int
	ConsumedItemID  int64
	ConsumedItemSID int
	RemainingStack  int
	ItemDeleted     bool
}

func (s *Service) DeletePetSkill(ctx context.Context, charID int64, petID int64, slot int) (*PetSkillDeleteResult, error) {
	if s.petRepo == nil || s.itemRepo == nil {
		return nil, pkgerrors.ErrSystemError
	}
	if slot < 1 || slot > domainpet.TotalPetSkillSlots {
		return nil, pkgerrors.ErrInvalidInput
	}

	p, err := s.getPetAndValidate(ctx, charID, petID)
	if err != nil {
		return nil, err
	}
	if !p.IsBound() {
		return nil, ErrPetMustBeBoundForSkillDelete
	}

	ensurePetSkillSlots(p)
	skillID := petSkillSlotValue(p, slot)
	if skillID <= 0 {
		return nil, pkgerrors.ErrInvalidInput
	}

	originalPet := clonePetSnapshot(p)

	setPetSkillSlotValue(p, slot, 0)
	s.syncPetSkillBonuses(p)
	p.RecalculateStats()

	if err := s.petRepo.Save(ctx, p); err != nil {
		return nil, err
	}

	consumedItem, itemDeleted, err := s.consumePetSkillDeleteItem(ctx, charID)
	if err != nil {
		if rollbackErr := s.petRepo.Save(ctx, originalPet); rollbackErr != nil && s.logger != nil {
			s.logger.Error("Failed to rollback pet after petDelSkill consume error",
				zap.Int64("character_id", charID),
				zap.Int64("pet_id", petID),
				zap.Int("slot", slot),
				zap.Error(rollbackErr))
		}
		return nil, err
	}

	result := &PetSkillDeleteResult{
		Pet:             p,
		Slot:            slot,
		SlotKey:         petSkillSlotKey(slot),
		RemovedSkillID:  skillID,
		ConsumedItemID:  consumedItem.ID,
		ConsumedItemSID: consumedItem.CalculateSID(),
		RemainingStack:  consumedItem.StackCount,
		ItemDeleted:     itemDeleted,
	}

	if s.logger != nil {
		s.logger.Info("Pet skill deleted",
			zap.Int64("character_id", charID),
			zap.Int64("pet_id", petID),
			zap.Int("slot", slot),
			zap.Int("skill_id", skillID),
			zap.Int64("item_id", consumedItem.ID),
			zap.Int("remaining_stack", consumedItem.StackCount))
	}

	return result, nil
}

func (s *Service) consumePetSkillDeleteItem(ctx context.Context, charID int64) (*domainitem.Item, bool, error) {
	for _, slotType := range []domainitem.SlotType{domainitem.SlotTypeBag, domainitem.SlotTypePetItemBag} {
		items, err := s.itemRepo.FindByCharacterAndSlotType(ctx, charID, slotType)
		if err != nil {
			return nil, false, err
		}

		for _, item := range items {
			if item == nil || item.TemplateID != petSkillDeleteItemTemplateID || item.StackCount <= 0 {
				continue
			}

			item.StackCount--
			if item.StackCount == 0 {
				if err := s.itemRepo.Delete(ctx, item.ID); err != nil {
					return nil, false, err
				}
				return item, true, nil
			}

			if err := s.itemRepo.UpdateStack(ctx, item.ID, item.StackCount); err != nil {
				return nil, false, err
			}
			return item, false, nil
		}
	}

	return nil, false, ErrPetSkillDeleteItemRequired
}
