// Open-sourced by BaoLT

package pet

import (
	"context"
	"fmt"

	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (s *Service) ContractPet(ctx context.Context, charID int64, templateID int) (*domainpet.Pet, error) {
	pets, err := s.ContractPets(ctx, charID, []int{templateID})
	if err != nil {
		return nil, err
	}
	if len(pets) == 0 {
		return nil, pkgerrors.ErrNotFound
	}
	return pets[0], nil
}

func (s *Service) ContractPets(ctx context.Context, charID int64, templateIDs []int) ([]*domainpet.Pet, error) {
	return s.contractPetsWithGrowRate(ctx, charID, templateIDs, nil)
}

func (s *Service) ContractPetsWithQuality(ctx context.Context, charID int64, templateIDs []int, quality int) ([]*domainpet.Pet, error) {
	if quality <= 0 {
		return s.ContractPets(ctx, charID, templateIDs)
	}

	growRate := float64(quality) / 10
	return s.contractPetsWithGrowRate(ctx, charID, templateIDs, &growRate)
}

func (s *Service) ContractPetsWithAwardQuality(ctx context.Context, charID int64, templateIDs []int, quality float64) ([]*domainpet.Pet, error) {
	if quality <= 0 {
		return s.ContractPets(ctx, charID, templateIDs)
	}

	return s.contractPetsWithGrowRate(ctx, charID, templateIDs, &quality)
}

func (s *Service) contractPetsWithGrowRate(ctx context.Context, charID int64, templateIDs []int, growRate *float64) ([]*domainpet.Pet, error) {
	if len(templateIDs) == 0 {
		return nil, pkgerrors.ErrInvalidInput
	}
	if s.gameDataManager == nil {
		return nil, pkgerrors.ErrSystemError
	}

	hasCapacity, err := s.HasPetCapacity(ctx, charID, len(templateIDs))
	if err != nil {
		return nil, err
	}
	if !hasCapacity {
		return nil, pkgerrors.ErrInventoryFull
	}

	templates := make([]*models.CreatureTemplate, 0, len(templateIDs))
	for _, templateID := range templateIDs {
		template := s.gameDataManager.GetCreature(templateID)
		if template == nil {
			return nil, pkgerrors.ErrNotFound
		}
		templates = append(templates, template)
	}

	createdPets := make([]*domainpet.Pet, 0, len(templates))
	for _, template := range templates {
		newPet := domainpet.NewPetFromCreature(charID, template)
		if growRate != nil {
			applyPetGrowRate(newPet, *growRate)
		}
		ensurePetSkillSlots(newPet)
		s.seedDefaultPetSkills(newPet)
		if err := s.petRepo.Save(ctx, newPet); err != nil {
			for _, createdPet := range createdPets {
				if createdPet == nil || createdPet.ID == 0 {
					continue
				}
				if rollbackErr := s.petRepo.Delete(ctx, createdPet.ID); rollbackErr != nil && s.logger != nil {
					s.logger.Warn("Failed to rollback contracted pet",
						zap.Int64("character_id", charID),
						zap.Int64("pet_id", createdPet.ID),
						zap.Error(rollbackErr))
				}
			}
			return nil, err
		}
		createdPets = append(createdPets, newPet)
	}

	if s.logger != nil {
		s.logger.Info("Pets contracted",
			zap.Int64("character_id", charID),
			zap.Int("pet_count", len(createdPets)))
	}

	return createdPets, nil
}

func (s *Service) seedDefaultPetSkills(p *domainpet.Pet) {
	if p == nil || s.gameDataManager == nil {
		return
	}
	creatureSkills := s.gameDataManager.GetCreatureSkills(int(p.TemplateID))
	for index, creatureSkill := range creatureSkills {
		slot := index + 1
		if slot > petSkillDefaultOpenSlots {
			break
		}
		skillID := int(creatureSkill.Sid)
		if skillID <= 0 {
			continue
		}
		setPetSkillSlotValue(p, slot, skillID)
	}
}

func applyPetGrowRate(pet *domainpet.Pet, growRate float64) {
	if pet == nil || growRate <= 0 {
		return
	}

	pet.GrowRate = growRate
	pet.RecalculateStats()

	if pet.CreatureData == nil {
		pet.CreatureData = make(map[string]interface{})
	}
	pet.CreatureData["growBase"] = fmt.Sprintf("%.2f", pet.GrowRate)
}

func (s *Service) HasPetCapacity(ctx context.Context, charID int64, incomingPets int) (bool, error) {
	if incomingPets <= 0 {
		return true, nil
	}
	if s.charRepo == nil {
		return true, nil
	}

	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return false, err
	}
	if char == nil {
		return false, pkgerrors.ErrNotFound
	}
	char.NormalizeSlotFields()

	count, err := s.petRepo.Count(ctx, charID)
	if err != nil {
		return false, err
	}

	return count+incomingPets <= char.PetMaxNum, nil
}
