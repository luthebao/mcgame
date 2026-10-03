// Open-sourced by BaoLT

// Skill service handles character skill management use cases.
package skill

import (
	"context"

	domainchar "mcgame-server/internal/domain/character"
	domainskill "mcgame-server/internal/domain/skill"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const (
	PlantSkillBookTemplateID    = 2409
	CookSkillBookTemplateID     = 2410
	MedicineSkillBookTemplateID = 2411
	FishSkillType               = 14
	PlantSkillType              = 15
	HerbSkillType               = 16
	CookSkillType               = 17
	MedicineSkillType           = 18
	CookbookSkillType           = 21
	MedicinebookSkillType       = 22
)

type CharacterRepository interface {
	FindByID(ctx context.Context, id int64) (*domainchar.Character, error)
	Update(ctx context.Context, character *domainchar.Character) error
}

type Service struct {
	skillRepo domainskill.Repository
	charRepo  CharacterRepository
	gameData  *gamedata.Manager
	logger    *zap.Logger
}

func NewService(skillRepo domainskill.Repository, logger *zap.Logger) *Service {
	return &Service{
		skillRepo: skillRepo,
		logger:    logger,
	}
}

func (s *Service) SetCharacterRepository(repo CharacterRepository) {
	s.charRepo = repo
}

func (s *Service) SetGameDataManager(manager *gamedata.Manager) {
	s.gameData = manager
}

func (s *Service) GetSkillsForCallback(ctx context.Context, charID int64) ([]map[string]interface{}, error) {
	if err := s.syncLifeSkillEntries(ctx, charID); err != nil {
		s.logger.Warn("Failed to sync life skill entries",
			zap.Int64("character_id", charID),
			zap.Error(err))
	}

	skills, err := s.skillRepo.FindByCharacterID(ctx, charID)
	if err != nil {
		s.logger.Warn("Failed to get skills for callback",
			zap.Int64("character_id", charID),
			zap.Error(err))
		return []map[string]interface{}{}, nil
	}

	dtos := make([]map[string]interface{}, len(skills))
	for i, sk := range skills {
		dto := sk.ToDTO()
		if sk.SlotPosition != nil {
			dto["position"] = *sk.SlotPosition
		} else {
			dto["position"] = 0
		}
		if template := s.skillTemplate(sk.SkillID); template != nil {
			dto["kind"] = int(template.Kind)
		}
		dtos[i] = dto
	}

	return dtos, nil
}

func (s *Service) GetAllSkills(ctx context.Context, charID int64) ([]*domainskill.CharacterSkill, error) {
	skills, err := s.skillRepo.FindByCharacterID(ctx, charID)
	if err != nil {
		return nil, err
	}

	s.logger.Debug("Retrieved skills",
		zap.Int64("character_id", charID),
		zap.Int("count", len(skills)))

	return skills, nil
}

func (s *Service) GetSkill(ctx context.Context, charID int64, skillID int) (*domainskill.CharacterSkill, error) {
	sk, err := s.skillRepo.FindByCharacterAndSkill(ctx, charID, skillID)
	if err != nil {
		return nil, err
	}
	if sk == nil {
		return nil, pkgerrors.ErrNotFound
	}
	return sk, nil
}

func (s *Service) HasSkill(ctx context.Context, charID int64, skillID int) (bool, error) {
	return s.skillRepo.HasSkill(ctx, charID, skillID)
}

func (s *Service) LearnSkill(ctx context.Context, charID int64, skillID int) (*domainskill.CharacterSkill, error) {
	template, char, err := s.validateNormalSkillRequest(ctx, charID, skillID, false)
	if err != nil {
		return nil, err
	}

	return s.createNormalSkill(ctx, charID, skillID, template, char)
}

func (s *Service) LearnStarterSkill(ctx context.Context, charID int64, skillID int) (*domainskill.CharacterSkill, error) {
	template, char, err := s.validateNormalSkillRequest(ctx, charID, skillID, true)
	if err != nil {
		return nil, err
	}

	return s.createNormalSkill(ctx, charID, skillID, template, char)
}

func (s *Service) createNormalSkill(ctx context.Context, charID int64, skillID int, template *models.SkillTemplate, char *domainchar.Character) (*domainskill.CharacterSkill, error) {
	existing, err := s.skillRepo.FindByCharacterAndSkill(ctx, charID, skillID)
	if err == nil && existing != nil {
		return existing, nil
	}
	if err != nil && !pkgerrors.Is(err, pkgerrors.ErrNotFound) {
		return nil, err
	}

	sk := domainskill.NewCharacterSkill(charID, skillID)
	sk.Level = skillTemplateLevel(template)
	if char != nil && s.logger != nil {
		s.logger.Debug("Learning normal skill from gamedata",
			zap.Int64("character_id", charID),
			zap.Int("skill_id", skillID),
			zap.Int("skill_level", sk.Level),
			zap.Int("class_id", char.ClassID),
			zap.Int("character_level", char.Level))
	}
	if err := s.skillRepo.Create(ctx, sk); err != nil {
		return nil, err
	}

	s.logger.Info("Character learned skill",
		zap.Int64("character_id", charID),
		zap.Int("skill_id", skillID))

	return sk, nil
}

func (s *Service) UpgradeSkill(ctx context.Context, charID int64, requestedSkillID int) (*domainskill.CharacterSkill, error) {
	requestedTemplate, _, err := s.validateNormalSkillRequest(ctx, charID, requestedSkillID, false)
	if err != nil {
		return nil, err
	}

	exact, err := s.skillRepo.FindByCharacterAndSkill(ctx, charID, requestedSkillID)
	if err == nil && exact != nil {
		return exact, nil
	}
	if err != nil && !pkgerrors.Is(err, pkgerrors.ErrNotFound) {
		return nil, err
	}

	learnedSkills, err := s.skillRepo.FindByCharacterID(ctx, charID)
	if err != nil {
		return nil, err
	}

	current, currentTemplate := s.findSkillFamilyEntry(learnedSkills, requestedTemplate)
	if current == nil {
		return s.LearnSkill(ctx, charID, requestedSkillID)
	}
	if skillTemplateLevel(currentTemplate) >= skillTemplateLevel(requestedTemplate) {
		return current, nil
	}

	current.SkillID = requestedSkillID
	current.Level = skillTemplateLevel(requestedTemplate)
	if err := s.skillRepo.Update(ctx, current); err != nil {
		return nil, err
	}

	s.logger.Info("Character upgraded skill",
		zap.Int64("character_id", charID),
		zap.Int("skill_id", requestedSkillID),
		zap.Int("skill_level", current.Level))

	return current, nil
}

func (s *Service) ApplySkillPosition(ctx context.Context, charID int64, skillID int, position *int) error {
	skillEntry, err := s.skillRepo.FindByCharacterAndSkill(ctx, charID, skillID)
	if err != nil {
		return err
	}

	if position == nil || *position <= 0 {
		skillEntry.ClearSlot()
		return s.skillRepo.Update(ctx, skillEntry)
	}

	existing, err := s.skillRepo.FindBySlot(ctx, charID, *position)
	if err == nil && existing != nil && existing.ID != skillEntry.ID {
		existing.ClearSlot()
		if err := s.skillRepo.Update(ctx, existing); err != nil {
			return err
		}
	}
	if err != nil && !pkgerrors.Is(err, pkgerrors.ErrNotFound) {
		return err
	}

	skillEntry.SetSlot(*position)
	return s.skillRepo.Update(ctx, skillEntry)
}

func (s *Service) DeleteSkill(ctx context.Context, id int64) error {
	return s.skillRepo.Delete(ctx, id)
}

func (s *Service) GrantSkillUnchecked(ctx context.Context, charID int64, skillID int) (*domainskill.CharacterSkill, error) {
	template := s.skillTemplate(skillID)
	if template == nil {
		return nil, pkgerrors.ErrNotFound
	}
	existing, err := s.skillRepo.FindByCharacterAndSkill(ctx, charID, skillID)
	if err == nil && existing != nil {
		return existing, nil
	}
	if err != nil && !pkgerrors.Is(err, pkgerrors.ErrNotFound) {
		return nil, err
	}
	sk := domainskill.NewCharacterSkill(charID, skillID)
	sk.Level = skillTemplateLevel(template)
	if err := s.skillRepo.Create(ctx, sk); err != nil {
		return nil, err
	}
	if s.logger != nil {
		s.logger.Info("Granted skill unchecked",
			zap.Int64("character_id", charID),
			zap.Int("skill_id", skillID))
	}
	return sk, nil
}

func (s *Service) RevokeSkillBySID(ctx context.Context, charID int64, skillID int) error {
	existing, err := s.skillRepo.FindByCharacterAndSkill(ctx, charID, skillID)
	if err != nil {
		if pkgerrors.Is(err, pkgerrors.ErrNotFound) {
			return nil
		}
		return err
	}
	if existing == nil {
		return nil
	}
	if err := s.skillRepo.Delete(ctx, existing.ID); err != nil {
		return err
	}
	if s.logger != nil {
		s.logger.Info("Revoked skill",
			zap.Int64("character_id", charID),
			zap.Int("skill_id", skillID))
	}
	return nil
}

func (s *Service) validateNormalSkillRequest(ctx context.Context, charID int64, skillID int, ignoreLevelRequirement bool) (*models.SkillTemplate, *domainchar.Character, error) {
	template := s.skillTemplate(skillID)
	if template == nil {
		return nil, nil, pkgerrors.ErrNotFound
	}

	char, err := s.requireCharacter(ctx, charID)
	if err != nil {
		return nil, nil, err
	}

	if !ignoreLevelRequirement && char.Level < int(template.ReqLevel) {
		return nil, nil, pkgerrors.ErrInsufficientLevel
	}
	if !skillTemplateAllowsClass(template, char.ClassID) {
		return nil, nil, pkgerrors.ErrInvalidInput
	}
	if err := validateClassRankRequirement(template, char); err != nil {
		return nil, nil, err
	}

	return template, char, nil
}

const skillReqRebirthSentinel = 10

func validateClassRankRequirement(template *models.SkillTemplate, char *domainchar.Character) error {
	if template == nil || char == nil {
		return nil
	}
	required := int(template.ReqCL)
	if required <= 0 {
		return nil
	}
	if required == skillReqRebirthSentinel {
		if char.RebirthExp <= 0 {
			return pkgerrors.ErrSkillRequiresRebirth
		}
		return nil
	}
	if char.ClassRank < required {
		return pkgerrors.ErrInsufficientClassRank
	}
	return nil
}

func (s *Service) findSkillFamilyEntry(learnedSkills []*domainskill.CharacterSkill, requestedTemplate *models.SkillTemplate) (*domainskill.CharacterSkill, *models.SkillTemplate) {
	if requestedTemplate == nil || requestedTemplate.CodeName == "" {
		return nil, nil
	}

	var selected *domainskill.CharacterSkill
	var selectedTemplate *models.SkillTemplate
	for _, learned := range learnedSkills {
		template := s.skillTemplate(learned.SkillID)
		if template == nil || template.CodeName != requestedTemplate.CodeName {
			continue
		}
		if selectedTemplate == nil || skillTemplateLevel(template) > skillTemplateLevel(selectedTemplate) {
			selected = learned
			selectedTemplate = template
		}
	}

	return selected, selectedTemplate
}

func skillTemplateAllowsClass(template *models.SkillTemplate, classID int) bool {
	if template == nil {
		return false
	}
	requiredClasses := template.ParsePipeDelimitedInts(template.ReqClass)
	if len(requiredClasses) == 0 {
		return true
	}
	for _, requiredClassID := range requiredClasses {
		if requiredClassID == classID {
			return true
		}
	}
	return false
}

func skillTemplateLevel(template *models.SkillTemplate) int {
	if template == nil || int(template.Level) <= 0 {
		return 1
	}
	return int(template.Level)
}
