// Open-sourced by BaoLT

package pet

import (
	"context"
	"fmt"
	"strconv"

	domainpet "mcgame-server/internal/domain/pet"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const (
	petSkillDefaultOpenSlots = 5
	petSkillFirstOpenSlot    = 6
	petSkillLastOpenSlot     = 15
)

var (
	petSkillOpenCosts = map[int]int{
		6:  10,
		7:  20,
		8:  40,
		9:  70,
		10: 110,
		11: 160,
		12: 220,
		13: 290,
		14: 370,
		15: 460,
	}
	petSkillQualityMultipliers = map[int]int{
		1: 1,
		2: 3,
		3: 10,
	}
)

type PetSkillOpenResult struct {
	PetID        int64
	Slot         int
	SlotKey      string
	Cost         int
	CurrencyType string
	Remaining    int64
}

func (s *Service) OpenPetSkill(ctx context.Context, charID int64, petID int64, slot int) (*PetSkillOpenResult, error) {
	if s.petRepo == nil || s.charRepo == nil {
		return nil, pkgerrors.ErrSystemError
	}
	if slot < petSkillFirstOpenSlot || slot > petSkillLastOpenSlot {
		return nil, pkgerrors.ErrInvalidInput
	}

	p, err := s.getPetAndValidate(ctx, charID, petID)
	if err != nil {
		return nil, err
	}
	ensurePetSkillSlots(p)

	if petSkillSlotValue(p, slot) != -1 {
		return nil, pkgerrors.ErrInvalidInput
	}

	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return nil, err
	}
	if char == nil {
		return nil, pkgerrors.ErrNotFound
	}

	cost, err := s.petSkillOpenCost(p, slot)
	if err != nil {
		return nil, err
	}

	originalGold := char.Gold
	originalGoldBind := char.GoldBind

	currencyType, remaining, err := consumePetSlotCurrency(char, cost)
	if err != nil {
		return nil, err
	}
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}

	setPetSkillSlotValue(p, slot, 0)
	if err := s.petRepo.Save(ctx, p); err != nil {
		char.Gold = originalGold
		char.GoldBind = originalGoldBind
		if rollbackErr := s.charRepo.Update(ctx, char); rollbackErr != nil {
			s.logger.Error("Failed to rollback pet skill slot currency",
				zap.Int64("character_id", charID),
				zap.Int64("pet_id", petID),
				zap.Int("slot", slot),
				zap.Error(rollbackErr))
		}
		return nil, err
	}

	result := &PetSkillOpenResult{
		PetID:        p.ID,
		Slot:         slot,
		SlotKey:      petSkillSlotKey(slot),
		Cost:         cost,
		CurrencyType: currencyType,
		Remaining:    remaining,
	}

	s.logger.Info("Pet skill slot opened",
		zap.Int64("character_id", charID),
		zap.Int64("pet_id", petID),
		zap.Int("slot", slot),
		zap.Int("cost", cost),
		zap.String("currency_type", currencyType),
		zap.Int("quality_level", s.petSkillQualityLevel(p)))

	return result, nil
}

func ensurePetSkillSlots(p *domainpet.Pet) {
	if p == nil {
		return
	}
	if p.Property == nil {
		p.Property = make(map[string]interface{})
	}

	for slot := 1; slot <= petSkillLastOpenSlot; slot++ {
		key := petSkillSlotKey(slot)
		value, ok := parsePetSkillSlotNumber(p.Property[key])
		if !ok {
			p.Property[key] = defaultPetSkillSlotValue(slot)
			continue
		}
		if slot <= petSkillDefaultOpenSlots && value < 0 {
			p.Property[key] = 0
			continue
		}
		if slot > petSkillDefaultOpenSlots && value < 0 {
			p.Property[key] = -1
			continue
		}
		p.Property[key] = value
	}
}

func defaultPetSkillSlotValue(slot int) int {
	if slot <= petSkillDefaultOpenSlots {
		return 0
	}
	return -1
}

func petSkillSlotValue(p *domainpet.Pet, slot int) int {
	if p == nil || p.Property == nil {
		return defaultPetSkillSlotValue(slot)
	}
	value, ok := parsePetSkillSlotNumber(p.Property[petSkillSlotKey(slot)])
	if !ok {
		return defaultPetSkillSlotValue(slot)
	}
	if slot <= petSkillDefaultOpenSlots && value < 0 {
		return 0
	}
	if slot > petSkillDefaultOpenSlots && value < 0 {
		return -1
	}
	return value
}

func setPetSkillSlotValue(p *domainpet.Pet, slot int, value int) {
	if p == nil {
		return
	}
	if p.Property == nil {
		p.Property = make(map[string]interface{})
	}
	p.Property[petSkillSlotKey(slot)] = value
}

func petSkillSlotKey(slot int) string {
	return fmt.Sprintf("skill%d", slot)
}

func parsePetSkillSlotNumber(value interface{}) (int, bool) {
	switch typed := value.(type) {
	case int:
		return typed, true
	case int32:
		return int(typed), true
	case int64:
		return int(typed), true
	case float64:
		return int(typed), true
	case float32:
		return int(typed), true
	case string:
		if typed == "" {
			return 0, false
		}
		parsed, err := strconv.Atoi(typed)
		if err != nil {
			return 0, false
		}
		return parsed, true
	default:
		return 0, false
	}
}

func (s *Service) petSkillOpenCost(p *domainpet.Pet, slot int) (int, error) {
	baseCost, ok := petSkillOpenCosts[slot]
	if !ok {
		return 0, pkgerrors.ErrInvalidInput
	}
	return baseCost * petSkillQualityMultiplier(s.petSkillQualityLevel(p)), nil
}

func petSkillQualityMultiplier(qLevel int) int {
	if multiplier, ok := petSkillQualityMultipliers[qLevel]; ok {
		return multiplier
	}
	return 1
}

func (s *Service) petSkillQualityLevel(p *domainpet.Pet) int {
	if p != nil && p.CreatureData != nil {
		if qLevel, ok := parsePetSkillSlotNumber(p.CreatureData["qLevel"]); ok && qLevel > 0 {
			return qLevel
		}
	}
	if p != nil && s.gameDataManager != nil {
		if template := s.gameDataManager.GetCreature(int(p.TemplateID)); template != nil {
			qLevel := int(template.QLevel)
			if qLevel > 0 {
				return qLevel
			}
		}
	}
	return 1
}

func (s *Service) petSkillClassID(p *domainpet.Pet) int {
	if p != nil && p.CreatureData != nil {
		if classID, ok := parsePetSkillSlotNumber(p.CreatureData["classIds"]); ok && classID > 0 {
			return classID
		}
	}
	if p != nil && s.gameDataManager != nil {
		if template := s.gameDataManager.GetCreature(int(p.TemplateID)); template != nil {
			classID := int(template.ClassIds)
			if classID > 0 {
				return classID
			}
		}
	}
	return 0
}
