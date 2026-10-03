// Open-sourced by BaoLT

package pet

import (
	"context"
	"strconv"
	"strings"

	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const (
	PetSkillBookFailureLearn = 1
	PetSkillBookFailureBook  = 2
	PetSkillBookFailureInput = 3
)

type PetSkillBookError struct {
	Failure   int
	Remaining int
	cause     error
}

func (e *PetSkillBookError) Error() string {
	switch e.Failure {
	case PetSkillBookFailureLearn:
		return "pet skill learn failed"
	case PetSkillBookFailureBook:
		return "invalid pet skill book"
	case PetSkillBookFailureInput:
		return "invalid pet skill request"
	default:
		return "pet skill book failed"
	}
}

func (e *PetSkillBookError) Unwrap() error {
	return e.cause
}

type PetSkillBookResult struct {
	Pet            *domainpet.Pet
	Slot           int
	SlotKey        string
	SkillID        int
	RemainingStack int
}

type petSkillRequirements struct {
	ClassID int
	QLevel  int
}

func (s *Service) LearnSkillFromBook(ctx context.Context, charID int64, petID int64, bookItemID int64) (*PetSkillBookResult, error) {
	if s.itemRepo == nil || s.gameDataManager == nil {
		return nil, pkgerrors.ErrSystemError
	}

	p, err := s.getPetAndValidate(ctx, charID, petID)
	if err != nil {
		if pkgerrors.Is(err, pkgerrors.ErrNotFound) {
			return nil, newPetSkillBookError(PetSkillBookFailureInput, -1, err)
		}
		return nil, err
	}

	bookItem, err := s.itemRepo.FindByID(ctx, bookItemID)
	if err != nil {
		if pkgerrors.Is(err, pkgerrors.ErrItemNotFound) || pkgerrors.Is(err, pkgerrors.ErrNotFound) {
			return nil, newPetSkillBookError(PetSkillBookFailureInput, -1, err)
		}
		return nil, err
	}
	if bookItem == nil || bookItem.CharacterID != charID || bookItem.StackCount <= 0 {
		return nil, newPetSkillBookError(PetSkillBookFailureInput, -1, nil)
	}

	remainingStack := bookItem.StackCount
	bookTemplate := s.gameDataManager.GetItem(bookItem.TemplateID)
	if !isPetSkillBookTemplate(bookTemplate) {
		return nil, newPetSkillBookError(PetSkillBookFailureBook, remainingStack, nil)
	}

	skillTemplate := s.resolvePetSkillBookSkill(bookTemplate)
	if skillTemplate == nil {
		return nil, newPetSkillBookError(PetSkillBookFailureBook, remainingStack, nil)
	}

	if !s.petCanLearnSkillTemplate(p, skillTemplate) {
		return nil, newPetSkillBookError(PetSkillBookFailureBook, remainingStack, nil)
	}

	slot, ok := firstAvailablePetSkillSlot(p)
	if !ok || s.petHasConflictingSkill(p, skillTemplate) {
		return nil, newPetSkillBookError(PetSkillBookFailureLearn, remainingStack, nil)
	}

	originalPet := clonePetSnapshot(p)
	setPetSkillSlotValue(p, slot, skillTemplate.GetID())
	s.syncPetSkillBonuses(p)
	p.RecalculateStats()

	if err := s.petRepo.Save(ctx, p); err != nil {
		return nil, err
	}

	remainingStack, err = s.consumePetSkillBookItem(ctx, bookItem)
	if err != nil {
		if rollbackErr := s.petRepo.Save(ctx, originalPet); rollbackErr != nil && s.logger != nil {
			s.logger.Error("Failed to rollback pet after petBook consume error",
				zap.Int64("character_id", charID),
				zap.Int64("pet_id", petID),
				zap.Int64("item_id", bookItemID),
				zap.Error(rollbackErr))
		}
		return nil, err
	}

	s.logger.Info("Pet learned skill from book",
		zap.Int64("character_id", charID),
		zap.Int64("pet_id", petID),
		zap.Int64("skill_book_item_id", bookItemID),
		zap.Int("skill_id", skillTemplate.GetID()),
		zap.Int("slot", slot))

	return &PetSkillBookResult{
		Pet:            p,
		Slot:           slot,
		SlotKey:        petSkillSlotKey(slot),
		SkillID:        skillTemplate.GetID(),
		RemainingStack: remainingStack,
	}, nil
}

func (s *Service) syncPetSkillBonuses(p *domainpet.Pet) {
	if p == nil {
		return
	}
	bonuses := domainpet.NewSkillStatBonuses()
	if s.gameDataManager == nil {
		p.SetSkillBonuses(bonuses)
		return
	}

	for slot := 1; slot <= domainpet.TotalPetSkillSlots; slot++ {
		skillID := petSkillSlotValue(p, slot)
		if skillID <= 0 {
			continue
		}
		skill := s.gameDataManager.GetSkill(skillID)
		if skill == nil || int(skill.BuffID) <= 0 {
			continue
		}
		buff := s.gameDataManager.GetBuff(int(skill.BuffID))
		if buff == nil {
			continue
		}
		addPetSkillBuffBonuses(&bonuses, buff)
	}

	p.SetSkillBonuses(bonuses)
}

func addPetSkillBuffBonuses(bonuses *domainpet.SkillStatBonuses, buff *models.BuffTemplate) {
	if bonuses == nil || buff == nil {
		return
	}

	propIDs := []float64{buff.Prop1, buff.Prop2, buff.Prop3, buff.Prop4, buff.Prop5, buff.Prop6}
	propNums := []float64{buff.PropNum1, buff.PropNum2, buff.PropNum3, buff.PropNum4, buff.PropNum5, buff.PropNum6}
	scaled := int(buff.PercentFlag) == 1

	for index, rawPropID := range propIDs {
		propID := int(rawPropID)
		value := propNums[index]
		if propID <= 0 || value == 0 {
			continue
		}
		applyPetBuffPropBonus(bonuses, propID, value, scaled)
	}
}

func applyPetBuffPropBonus(bonuses *domainpet.SkillStatBonuses, propID int, value float64, scaled bool) {
	if bonuses == nil {
		return
	}

	switch propID {
	case 1, 2, 4, 5, 6, 7, 8, 9, 11:
		if scaled {
			bonuses.AddScaled(propID, value)
			return
		}
		bonuses.AddDirect(propID, value)
	case 10, 12, 13, 14, 15, 16, 17, 18, 19, 25, 34:
		bonuses.AddDirect(propID, value)
	}
}

func (s *Service) petHasConflictingSkill(p *domainpet.Pet, learnedSkill *models.SkillTemplate) bool {
	if p == nil || learnedSkill == nil {
		return true
	}

	for slot := 1; slot <= domainpet.TotalPetSkillSlots; slot++ {
		existingSkillID := petSkillSlotValue(p, slot)
		if existingSkillID <= 0 {
			continue
		}
		if existingSkillID == learnedSkill.GetID() {
			return true
		}

		existingSkill := s.gameDataManager.GetSkill(existingSkillID)
		if existingSkill == nil {
			continue
		}

		if existingSkill.Name == learnedSkill.Name {
			return true
		}
		if existingSkill.CodeName != "" && existingSkill.CodeName == learnedSkill.CodeName {
			return true
		}
		if skillTemplateConflicts(existingSkill, learnedSkill) || skillTemplateConflicts(learnedSkill, existingSkill) {
			return true
		}
	}

	return false
}

func skillTemplateConflicts(skill *models.SkillTemplate, target *models.SkillTemplate) bool {
	if skill == nil || target == nil || skill.ScriptReqL == "" {
		return false
	}
	for _, blockedSkillID := range skill.ParsePipeDelimitedInts(skill.ScriptReqL) {
		if blockedSkillID == target.GetID() {
			return true
		}
	}
	return false
}

func (s *Service) resolvePetSkillBookSkill(bookTemplate *models.ItemTemplateTemplate) *models.SkillTemplate {
	if s == nil || s.gameDataManager == nil || bookTemplate == nil {
		return nil
	}

	if bookTemplate.SkillID > 0 {
		if skill := s.gameDataManager.GetSkill(int(bookTemplate.SkillID)); skill != nil {
			return skill
		}
	}

	var selected *models.SkillTemplate
	for _, skill := range s.gameDataManager.GetAllSkills() {
		if skill == nil || skill.Name != bookTemplate.Name {
			continue
		}
		if selected == nil || int(skill.Level) < int(selected.Level) {
			selected = skill
		}
	}

	return selected
}

func (s *Service) petCanLearnSkillTemplate(p *domainpet.Pet, skill *models.SkillTemplate) bool {
	if p == nil || skill == nil {
		return false
	}

	requirements := parsePetSkillRequirements(skill)
	if requirements.ClassID > 0 && s.petSkillClassID(p) != requirements.ClassID {
		return false
	}
	if requirements.QLevel > 0 && s.petSkillQualityLevel(p) < requirements.QLevel {
		return false
	}

	return true
}

func isPetSkillBookTemplate(template *models.ItemTemplateTemplate) bool {
	if template == nil {
		return false
	}
	return int(template.Type) == 506 && int(template.UseType) == 2
}

func firstAvailablePetSkillSlot(p *domainpet.Pet) (int, bool) {
	for slot := 1; slot <= domainpet.TotalPetSkillSlots; slot++ {
		if petSkillSlotValue(p, slot) == 0 {
			return slot, true
		}
	}
	return 0, false
}

func parsePetSkillRequirements(skill *models.SkillTemplate) petSkillRequirements {
	requirements := petSkillRequirements{}
	if skill == nil || skill.CreKind == "" {
		return requirements
	}

	parts := strings.Split(skill.CreKind, "|")
	if len(parts) > 0 {
		if classID, ok := parsePetSkillRequirementPart(parts[0]); ok {
			requirements.ClassID = classID
		}
	}
	if len(parts) > 1 {
		if qLevel, ok := parsePetSkillRequirementPart(parts[1]); ok {
			requirements.QLevel = qLevel
		}
	}

	return requirements
}

func parsePetSkillRequirementPart(raw string) (int, bool) {
	raw = strings.TrimSpace(raw)
	if raw == "" {
		return 0, false
	}

	value, err := strconv.Atoi(raw)
	if err != nil {
		return 0, false
	}

	return value, true
}

func (s *Service) consumePetSkillBookItem(ctx context.Context, item *domainitem.Item) (int, error) {
	if s == nil || s.itemRepo == nil || item == nil {
		return 0, pkgerrors.ErrSystemError
	}
	if item.StackCount <= 0 {
		return 0, pkgerrors.ErrInvalidInput
	}

	remaining := item.StackCount - 1
	if remaining == 0 {
		if err := s.itemRepo.Delete(ctx, item.ID); err != nil {
			return 0, err
		}
		return 0, nil
	}

	if err := s.itemRepo.UpdateStack(ctx, item.ID, remaining); err != nil {
		return item.StackCount, err
	}

	return remaining, nil
}

func clonePetSnapshot(p *domainpet.Pet) *domainpet.Pet {
	if p == nil {
		return nil
	}

	cloned := *p
	cloned.Property = clonePetMapSnapshot(p.Property)
	cloned.CreatureData = clonePetMapSnapshot(p.CreatureData)
	return &cloned
}

func clonePetMapSnapshot(source map[string]interface{}) map[string]interface{} {
	if source == nil {
		return nil
	}
	cloned := make(map[string]interface{}, len(source))
	for key, value := range source {
		cloned[key] = value
	}
	return cloned
}

func newPetSkillBookError(failure int, remaining int, cause error) error {
	return &PetSkillBookError{
		Failure:   failure,
		Remaining: remaining,
		cause:     cause,
	}
}
