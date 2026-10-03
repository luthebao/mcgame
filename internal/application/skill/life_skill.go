// Open-sourced by BaoLT

package skill

import (
	"context"
	"errors"
	"sort"
	"strings"

	domainchar "mcgame-server/internal/domain/character"
	domainskill "mcgame-server/internal/domain/skill"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

var (
	ErrLifeSkillTemplateNotFound     = errors.New("life skill template not found")
	ErrLifeSkillNotLearned           = errors.New("life skill not learned")
	ErrLifeSkillMaxLevel             = errors.New("life skill max level reached")
	ErrLifeSkillMasteryNotEnough     = errors.New("life skill mastery not enough")
	ErrLifeSkillExperienceNotEnough  = errors.New("life skill experience not enough")
	ErrLifeSkillContributionMissing  = errors.New("life skill contribution not enough")
	ErrLifeSkillRecipeNotFound       = errors.New("life skill recipe not found")
	ErrLifeSkillRecipeNotLearned     = errors.New("life skill recipe not learned")
	ErrLifeSkillRecipeLevelNotEnough = errors.New("life skill recipe level not enough")
)

type lifeSkillDefinition struct {
	skillType int
	propName  string
	getDex    func(*domainchar.Character) int
	setDex    func(*domainchar.Character, int)
}

func (s *Service) CanHandleSkillTemplate(skillID int) bool {
	template := s.skillTemplate(skillID)
	return template != nil && isUpgradeableLifeSkillType(int(template.Type))
}

func (s *Service) LearnPlantSkillByBook(ctx context.Context, charID int64) (*domainskill.CharacterSkill, *models.SkillTemplate, error) {
	return s.learnLifeSkillByBook(ctx, charID, PlantSkillType)
}

func (s *Service) LearnLifeSkillByBook(ctx context.Context, charID int64, skillType int) (*domainskill.CharacterSkill, *models.SkillTemplate, error) {
	return s.learnLifeSkillByBook(ctx, charID, skillType)
}

func (s *Service) LearnOrUpgradeLifeSkill(ctx context.Context, charID int64, requestedSkillID int) (*domainskill.CharacterSkill, *models.SkillTemplate, *domainchar.Character, error) {
	requestedTemplate := s.skillTemplate(requestedSkillID)
	if requestedTemplate == nil || !isUpgradeableLifeSkillType(int(requestedTemplate.Type)) {
		return nil, nil, nil, ErrLifeSkillTemplateNotFound
	}

	skillType := int(requestedTemplate.Type)
	if int(requestedTemplate.Level) <= 1 {
		existingSkill, _, err := s.findLifeSkillByType(ctx, charID, skillType)
		if err != nil {
			return nil, nil, nil, err
		}
		if existingSkill == nil && skillType != PlantSkillType {
			learnedSkill, template, learnErr := s.learnLifeSkillByBook(ctx, charID, skillType)
			if learnErr != nil {
				return nil, nil, nil, learnErr
			}
			char, charErr := s.requireCharacter(ctx, charID)
			if charErr != nil {
				return nil, nil, nil, charErr
			}
			return learnedSkill, template, char, nil
		}
	}

	return s.upgradeLifeSkill(ctx, charID, requestedSkillID)
}

func (s *Service) LearnRecipeSkillByFormulaName(ctx context.Context, charID int64, formulaName string) (*domainskill.CharacterSkill, *models.SkillTemplate, error) {
	recipeTemplate := s.recipeSkillTemplateByName(formulaName)
	if recipeTemplate == nil {
		return nil, nil, ErrLifeSkillRecipeNotFound
	}

	hasSkill, err := s.skillRepo.HasSkill(ctx, charID, int(recipeTemplate.ID))
	if err != nil {
		return nil, nil, err
	}
	if hasSkill {
		return nil, nil, pkgerrors.ErrAlreadyExists
	}

	baseSkillType, ok := baseLifeSkillTypeForRecipeType(int(recipeTemplate.Type))
	if !ok {
		return nil, nil, ErrLifeSkillRecipeNotFound
	}

	baseSkill, _, err := s.findLifeSkillByType(ctx, charID, baseSkillType)
	if err != nil {
		return nil, nil, err
	}
	if baseSkill == nil || baseSkill.Level < int(recipeTemplate.Level) {
		return nil, nil, ErrLifeSkillRecipeLevelNotEnough
	}

	skillEntry := domainskill.NewCharacterSkill(charID, int(recipeTemplate.ID))
	skillEntry.Level = int(recipeTemplate.Level)

	if err := s.skillRepo.Create(ctx, skillEntry); err != nil {
		return nil, nil, err
	}

	return skillEntry, recipeTemplate, nil
}

func (s *Service) CanCraftRecipe(ctx context.Context, charID int64, recipeSkillID int, lifeSkillType int) (*models.SkillTemplate, *models.SkillTemplate, *domainchar.Character, error) {
	recipeTemplate := s.skillTemplate(recipeSkillID)
	if recipeTemplate == nil {
		return nil, nil, nil, ErrLifeSkillRecipeNotFound
	}

	baseSkillType, ok := baseLifeSkillTypeForRecipeType(int(recipeTemplate.Type))
	if !ok || (lifeSkillType > 0 && baseSkillType != lifeSkillType) {
		return nil, nil, nil, ErrLifeSkillRecipeNotFound
	}

	hasSkill, err := s.skillRepo.HasSkill(ctx, charID, recipeSkillID)
	if err != nil {
		return nil, nil, nil, err
	}
	if !hasSkill {
		return nil, nil, nil, ErrLifeSkillRecipeNotLearned
	}

	baseSkill, baseTemplate, err := s.findLifeSkillByType(ctx, charID, baseSkillType)
	if err != nil {
		return nil, nil, nil, err
	}
	if baseSkill == nil || baseSkill.Level < int(recipeTemplate.Level) {
		return nil, nil, nil, ErrLifeSkillRecipeLevelNotEnough
	}

	char, err := s.requireCharacter(ctx, charID)
	if err != nil {
		return nil, nil, nil, err
	}

	return recipeTemplate, baseTemplate, char, nil
}

func (s *Service) UpgradePlantSkill(ctx context.Context, charID int64, requestedSkillID int) (*domainskill.CharacterSkill, *models.SkillTemplate, *domainchar.Character, error) {
	return s.upgradeLifeSkill(ctx, charID, requestedSkillID)
}

func (s *Service) AddPlantMastery(ctx context.Context, charID int64, amount int) (*domainchar.Character, *domainskill.CharacterSkill, error) {
	return s.AddLifeSkillMastery(ctx, charID, PlantSkillType, amount)
}

func (s *Service) AddLifeSkillMastery(ctx context.Context, charID int64, skillType int, amount int) (*domainchar.Character, *domainskill.CharacterSkill, error) {
	definition, ok := lifeSkillDefinitionForType(skillType)
	if !ok {
		return nil, nil, ErrLifeSkillTemplateNotFound
	}

	char, err := s.requireCharacter(ctx, charID)
	if err != nil {
		return nil, nil, err
	}

	if amount > 0 {
		definition.setDex(char, definition.getDex(char)+amount)
	}
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, nil, err
	}

	skillEntry, template, err := s.findLifeSkillByType(ctx, charID, skillType)
	if err != nil {
		return nil, nil, err
	}
	if skillEntry == nil {
		return char, nil, nil
	}

	if targetTemplate := s.lifeSkillTemplateByLevel(skillType, skillEntry.Level); targetTemplate != nil {
		template = targetTemplate
	}

	dirty := false
	if template != nil && skillEntry.SkillID != int(template.ID) {
		skillEntry.SkillID = int(template.ID)
		dirty = true
	}
	currentDex := definition.getDex(char)
	if skillEntry.Exp != currentDex {
		skillEntry.Exp = currentDex
		dirty = true
	}
	if dirty {
		if err := s.skillRepo.Update(ctx, skillEntry); err != nil {
			return nil, nil, err
		}
	}

	return char, skillEntry, nil
}

func (s *Service) GetPlantSkillLevel(ctx context.Context, charID int64) (int, error) {
	return s.GetLifeSkillLevel(ctx, charID, PlantSkillType)
}

func (s *Service) GetLifeSkillLevel(ctx context.Context, charID int64, skillType int) (int, error) {
	skillEntry, _, err := s.findLifeSkillByType(ctx, charID, skillType)
	if err != nil {
		return 0, err
	}
	if skillEntry == nil {
		return 0, nil
	}
	return skillEntry.Level, nil
}

func (s *Service) LifeSkillPropertyValues(char *domainchar.Character) map[string]int {
	if char == nil {
		return map[string]int{}
	}

	values := map[string]int{}
	for _, skillType := range trackedLifeSkillTypes() {
		definition, ok := lifeSkillDefinitionForType(skillType)
		if !ok {
			continue
		}
		values[definition.propName] = definition.getDex(char)
	}

	return values
}

func (s *Service) learnLifeSkillByBook(ctx context.Context, charID int64, skillType int) (*domainskill.CharacterSkill, *models.SkillTemplate, error) {
	definition, ok := lifeSkillDefinitionForType(skillType)
	if !ok {
		return nil, nil, ErrLifeSkillTemplateNotFound
	}

	char, err := s.requireCharacter(ctx, charID)
	if err != nil {
		return nil, nil, err
	}

	existingSkill, _, err := s.findLifeSkillByType(ctx, charID, skillType)
	if err != nil {
		return nil, nil, err
	}
	if existingSkill != nil {
		return nil, nil, pkgerrors.ErrAlreadyExists
	}

	template := s.lifeSkillTemplateByLevel(skillType, 1)
	if template == nil {
		return nil, nil, ErrLifeSkillTemplateNotFound
	}
	if char.Level < int(template.ReqLevel) {
		return nil, nil, pkgerrors.ErrInsufficientLevel
	}

	skillEntry := domainskill.NewCharacterSkill(charID, int(template.ID))
	skillEntry.Level = 1
	skillEntry.Exp = definition.getDex(char)

	if err := s.skillRepo.Create(ctx, skillEntry); err != nil {
		return nil, nil, err
	}

	s.logger.Info("Character learned life skill",
		zap.Int64("character_id", charID),
		zap.Int64("skill_template_id", template.ID))

	return skillEntry, template, nil
}

func (s *Service) upgradeLifeSkill(ctx context.Context, charID int64, requestedSkillID int) (*domainskill.CharacterSkill, *models.SkillTemplate, *domainchar.Character, error) {
	requestedTemplate := s.skillTemplate(requestedSkillID)
	if requestedTemplate == nil || !isUpgradeableLifeSkillType(int(requestedTemplate.Type)) {
		return nil, nil, nil, ErrLifeSkillTemplateNotFound
	}

	skillType := int(requestedTemplate.Type)
	definition, ok := lifeSkillDefinitionForType(skillType)
	if !ok {
		return nil, nil, nil, ErrLifeSkillTemplateNotFound
	}

	char, err := s.requireCharacter(ctx, charID)
	if err != nil {
		return nil, nil, nil, err
	}

	skillEntry, _, err := s.findLifeSkillByType(ctx, charID, skillType)
	if err != nil {
		return nil, nil, nil, err
	}
	if skillEntry == nil {
		return nil, nil, nil, ErrLifeSkillNotLearned
	}

	nextTemplate := s.lifeSkillTemplateByLevel(skillType, skillEntry.Level+1)
	if nextTemplate == nil {
		return nil, nil, nil, ErrLifeSkillMaxLevel
	}

	if char.Level < int(nextTemplate.ReqLevel) {
		return nil, nil, nil, pkgerrors.ErrInsufficientLevel
	}
	if requiredMastery := int(nextTemplate.DexSkill); requiredMastery > 0 && definition.getDex(char) < requiredMastery {
		return nil, nil, nil, ErrLifeSkillMasteryNotEnough
	}
	if requiredExp := int64(nextTemplate.ExpSkill); requiredExp > 0 && char.Experience < requiredExp {
		return nil, nil, nil, ErrLifeSkillExperienceNotEnough
	}
	if requiredMoney := int64(nextTemplate.Gold); requiredMoney > 0 && char.Money < requiredMoney {
		return nil, nil, nil, pkgerrors.ErrInsufficientFunds
	}
	if requiredContrib := int(nextTemplate.CostGuildContrib); requiredContrib > 0 && char.GuildContrib+char.DonateContrib < requiredContrib {
		return nil, nil, nil, ErrLifeSkillContributionMissing
	}

	char.Experience -= int64(nextTemplate.ExpSkill)
	char.Money -= int64(nextTemplate.Gold)
	deductLifeSkillContribution(char, int(nextTemplate.CostGuildContrib))

	skillEntry.SkillID = int(nextTemplate.ID)
	skillEntry.Level = int(nextTemplate.Level)
	skillEntry.Exp = definition.getDex(char)

	if err := s.skillRepo.Update(ctx, skillEntry); err != nil {
		return nil, nil, nil, err
	}
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, nil, nil, err
	}

	s.logger.Info("Character upgraded life skill",
		zap.Int64("character_id", charID),
		zap.Int64("skill_template_id", nextTemplate.ID),
		zap.Int("skill_level", skillEntry.Level))

	return skillEntry, nextTemplate, char, nil
}

func (s *Service) syncLifeSkillEntries(ctx context.Context, charID int64) error {
	if s.charRepo == nil || s.gameData == nil {
		return nil
	}

	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return err
	}

	skills, err := s.skillRepo.FindByCharacterID(ctx, charID)
	if err != nil {
		return err
	}

	for _, skillEntry := range skills {
		template := s.skillTemplate(skillEntry.SkillID)
		if template == nil {
			continue
		}

		definition, ok := lifeSkillDefinitionForType(int(template.Type))
		if !ok {
			continue
		}

		dirty := false
		if targetTemplate := s.lifeSkillTemplateByLevel(int(template.Type), skillEntry.Level); targetTemplate != nil && skillEntry.SkillID != int(targetTemplate.ID) {
			skillEntry.SkillID = int(targetTemplate.ID)
			dirty = true
		}
		currentDex := definition.getDex(char)
		if skillEntry.Exp != currentDex {
			skillEntry.Exp = currentDex
			dirty = true
		}
		if dirty {
			if err := s.skillRepo.Update(ctx, skillEntry); err != nil {
				return err
			}
		}
	}

	return nil
}

func (s *Service) findLifeSkillByType(ctx context.Context, charID int64, skillType int) (*domainskill.CharacterSkill, *models.SkillTemplate, error) {
	skills, err := s.skillRepo.FindByCharacterID(ctx, charID)
	if err != nil {
		return nil, nil, err
	}

	for _, skillEntry := range skills {
		template := s.skillTemplate(skillEntry.SkillID)
		if template == nil {
			continue
		}
		if int(template.Type) != skillType {
			continue
		}
		return skillEntry, template, nil
	}

	return nil, nil, nil
}

func (s *Service) lifeSkillTemplateByLevel(skillType int, level int) *models.SkillTemplate {
	if s.gameData == nil || level <= 0 {
		return nil
	}

	templates := s.lifeSkillTemplates(skillType)
	for _, template := range templates {
		if int(template.Level) == level {
			return template
		}
	}

	return nil
}

func (s *Service) lifeSkillTemplates(skillType int) []*models.SkillTemplate {
	if s.gameData == nil {
		return nil
	}

	templates := make([]*models.SkillTemplate, 0)
	for _, template := range s.gameData.GetAllSkills() {
		if template == nil || int(template.Type) != skillType {
			continue
		}
		templates = append(templates, template)
	}

	sort.Slice(templates, func(i, j int) bool {
		if templates[i].Level == templates[j].Level {
			return templates[i].ID < templates[j].ID
		}
		return templates[i].Level < templates[j].Level
	})

	return templates
}

func (s *Service) requireCharacter(ctx context.Context, charID int64) (*domainchar.Character, error) {
	if s.charRepo == nil {
		return nil, pkgerrors.ErrSystemError
	}
	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return nil, err
	}
	if char == nil {
		return nil, pkgerrors.ErrNotFound
	}
	return char, nil
}

func (s *Service) skillTemplate(skillID int) *models.SkillTemplate {
	if s.gameData == nil || skillID <= 0 {
		return nil
	}
	return s.gameData.GetSkill(skillID)
}

func (s *Service) recipeSkillTemplateByName(name string) *models.SkillTemplate {
	normalizedName := strings.TrimSpace(name)
	if normalizedName == "" || s.gameData == nil {
		return nil
	}

	for _, skillType := range []int{CookbookSkillType, MedicinebookSkillType} {
		for _, template := range s.lifeSkillTemplates(skillType) {
			if template == nil {
				continue
			}
			if strings.EqualFold(strings.TrimSpace(template.Name), normalizedName) {
				return template
			}
		}
	}

	return nil
}

func trackedLifeSkillTypes() []int {
	return []int{FishSkillType, PlantSkillType, HerbSkillType, CookSkillType, MedicineSkillType}
}

func isUpgradeableLifeSkillType(skillType int) bool {
	switch skillType {
	case PlantSkillType, CookSkillType, MedicineSkillType:
		return true
	default:
		return false
	}
}

func baseLifeSkillTypeForRecipeType(skillType int) (int, bool) {
	switch skillType {
	case CookbookSkillType:
		return CookSkillType, true
	case MedicinebookSkillType:
		return MedicineSkillType, true
	default:
		return 0, false
	}
}

func lifeSkillDefinitionForType(skillType int) (lifeSkillDefinition, bool) {
	switch skillType {
	case FishSkillType:
		return lifeSkillDefinition{
			skillType: FishSkillType,
			propName:  "fishDex",
			getDex: func(char *domainchar.Character) int {
				if char == nil {
					return 0
				}
				return char.FishDex
			},
			setDex: func(char *domainchar.Character, value int) {
				if char != nil {
					char.FishDex = value
				}
			},
		}, true
	case PlantSkillType:
		return lifeSkillDefinition{
			skillType: PlantSkillType,
			propName:  "plantDex",
			getDex: func(char *domainchar.Character) int {
				if char == nil {
					return 0
				}
				return char.PlantDex
			},
			setDex: func(char *domainchar.Character, value int) {
				if char != nil {
					char.PlantDex = value
				}
			},
		}, true
	case HerbSkillType:
		return lifeSkillDefinition{
			skillType: HerbSkillType,
			propName:  "herbDex",
			getDex: func(char *domainchar.Character) int {
				if char == nil {
					return 0
				}
				return char.HerbDex
			},
			setDex: func(char *domainchar.Character, value int) {
				if char != nil {
					char.HerbDex = value
				}
			},
		}, true
	case CookSkillType:
		return lifeSkillDefinition{
			skillType: CookSkillType,
			propName:  "cookDex",
			getDex: func(char *domainchar.Character) int {
				if char == nil {
					return 0
				}
				return char.CookDex
			},
			setDex: func(char *domainchar.Character, value int) {
				if char != nil {
					char.CookDex = value
				}
			},
		}, true
	case MedicineSkillType:
		return lifeSkillDefinition{
			skillType: MedicineSkillType,
			propName:  "medicineDex",
			getDex: func(char *domainchar.Character) int {
				if char == nil {
					return 0
				}
				return char.MedicineDex
			},
			setDex: func(char *domainchar.Character, value int) {
				if char != nil {
					char.MedicineDex = value
				}
			},
		}, true
	default:
		return lifeSkillDefinition{}, false
	}
}

func deductLifeSkillContribution(char *domainchar.Character, amount int) {
	if char == nil || amount <= 0 {
		return
	}

	if char.GuildContrib >= amount {
		char.GuildContrib -= amount
		return
	}

	remaining := amount - char.GuildContrib
	char.GuildContrib = 0
	if remaining >= char.DonateContrib {
		char.DonateContrib = 0
		return
	}
	char.DonateContrib -= remaining
}
