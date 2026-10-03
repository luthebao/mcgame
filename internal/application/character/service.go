// Open-sourced by BaoLT

// Character service handles character lifecycle use cases.
// Provides creation, selection, retrieval, and position management.
// Integrates with game data for class appearance and stat lookups.
package character

import (
	"context"
	"strconv"

	"mcgame-server/internal/domain/character"
	domainskill "mcgame-server/internal/domain/skill"
	"mcgame-server/internal/domain/social"
	"mcgame-server/internal/gamedata"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

type Service struct {
	repo          character.Repository
	gameData      *gamedata.Manager
	skillLearner  SkillLearner
	warSpriteInit WarSpriteInitializer
	logger        *zap.Logger
}

type SkillLearner interface {
	LearnStarterSkill(ctx context.Context, charID int64, skillID int) (*domainskill.CharacterSkill, error)
}

type WarSpriteInitializer interface {
	InitDefault(ctx context.Context, charID int64) error
}

func NewService(repo character.Repository, logger *zap.Logger) *Service {
	return &Service{
		repo:   repo,
		logger: logger,
	}
}

func (s *Service) SetGameDataManager(manager *gamedata.Manager) {
	s.gameData = manager
}

func (s *Service) SetSkillLearner(learner SkillLearner) {
	s.skillLearner = learner
}

func (s *Service) SetWarSpriteInitializer(init WarSpriteInitializer) {
	s.warSpriteInit = init
}

type CreateRequest struct {
	AccountID uuid.UUID
	Name      string
	ClassID   int
	Gender    int
}

func (s *Service) Create(ctx context.Context, req *CreateRequest) (*character.Character, error) {
	exists, err := s.repo.ExistsByName(ctx, req.Name)
	if err != nil {
		return nil, err
	}
	if exists {
		return nil, pkgerrors.ErrAlreadyExists
	}

	char := character.NewCharacter(req.AccountID, req.Name, req.ClassID, req.Gender)
	char.SetBagSlotNum(1)
	char.SetBankSlotNum(1)
	s.applyClassDefaultStats(char)
	char.RecalculateStats()
	char.CurrentHP = char.MaxHP
	char.CurrentMP = char.MaxMP

	if err := s.repo.Create(ctx, char); err != nil {
		return nil, err
	}

	s.seedClassStarterSkills(ctx, char)
	s.seedWarSpriteState(ctx, char)

	s.logger.Info("Character created",
		zap.String("name", char.Name),
		zap.Int64("character_id", char.ID),
		zap.String("account_id", req.AccountID.String()),
		zap.Int("class_id", char.ClassID),
		zap.Int("gender", char.Gender),
		zap.Int("pet_max_num", char.PetMaxNum))

	return char, nil
}

func (s *Service) seedWarSpriteState(ctx context.Context, char *character.Character) {
	if char == nil || s.warSpriteInit == nil {
		return
	}
	if err := s.warSpriteInit.InitDefault(ctx, char.ID); err != nil && s.logger != nil {
		s.logger.Warn("Failed to seed war sprite state",
			zap.Int64("character_id", char.ID),
			zap.Error(err))
	}
}

func (s *Service) seedClassStarterSkills(ctx context.Context, char *character.Character) {
	if char == nil || s.gameData == nil || s.skillLearner == nil {
		return
	}
	classData := s.gameData.GetClass(char.ClassID)
	if classData == nil {
		return
	}
	for _, skillID := range classData.ParsePipeDelimitedInts(classData.StartSkill) {
		if skillID <= 0 {
			continue
		}
		if _, err := s.skillLearner.LearnStarterSkill(ctx, char.ID, skillID); err != nil && s.logger != nil {
			s.logger.Warn("Failed to seed starter skill",
				zap.Int64("character_id", char.ID),
				zap.Int("class_id", char.ClassID),
				zap.Int("skill_id", skillID),
				zap.Error(err))
		}
	}
}

type SelectRequest struct {
	AccountID   uuid.UUID
	CharacterID int64
}

func (s *Service) Select(ctx context.Context, req *SelectRequest) (*character.Character, error) {
	char, err := s.repo.FindByID(ctx, req.CharacterID)
	if err != nil {
		return nil, err
	}

	if char.AccountID != req.AccountID {
		s.logger.Warn("Character selection denied: not owner",
			zap.Int64("character_id", req.CharacterID),
			zap.String("account_id", req.AccountID.String()))
		return nil, pkgerrors.ErrCharacterNotOwned
	}

	s.restoreClassAptitude(char)
	return char, nil
}

func (s *Service) GetByAccountID(ctx context.Context, accountID uuid.UUID) ([]*character.Character, error) {
	return s.repo.FindByAccountID(ctx, accountID)
}

func (s *Service) GetByID(ctx context.Context, characterID int64) (*character.Character, error) {
	char, err := s.repo.FindByID(ctx, characterID)
	if err != nil {
		return nil, err
	}
	s.restoreClassAptitude(char)
	return char, nil
}

func (s *Service) GetCharacter(ctx context.Context, characterID int64) (*character.Character, error) {
	return s.GetByID(ctx, characterID)
}

// GetCharacterAttributes returns character attributes formatted for client (HP, MP, EXP, etc.)
// Currently using mock "high" preset for development/testing
func (s *Service) GetCharacterAttributes(ctx context.Context, characterID int64) (map[string]interface{}, error) {
	char, err := s.repo.FindByID(ctx, characterID)
	if err != nil {
		return nil, err
	}

	s.restoreClassAptitude(char)
	return s.BuildViewPropertiesFromBase(char), nil
}

func (s *Service) BuildViewPropertiesWithEquipment(char *character.Character, bonuses character.EquipmentStatBonuses) map[string]interface{} {
	return character.BuildViewPropertiesWithEquipment(char, bonuses)
}

func (s *Service) applyClassDefaultStats(char *character.Character) {
	if char == nil || s.gameData == nil {
		return
	}
	classData := s.gameData.GetClass(char.ClassID)
	if classData == nil {
		return
	}
	char.Strength = int(classData.AttStrength)
	char.Agility = int(classData.AttAgility)
	char.Stamina = int(classData.AttStamina)
	char.Intelligence = int(classData.AttIntelligence)
	char.Spirit = int(classData.AttEnergy)
	char.ClassAptStrength = int(classData.AptStrength)
	char.ClassAptAgility = int(classData.AptAgility)
	char.ClassAptStamina = int(classData.AptStamina)
	char.ClassAptIntelligence = int(classData.AptIntelligence)
	char.ClassAptEnergy = int(classData.AptEnergy)
}

func (s *Service) restoreClassAptitude(char *character.Character) {
	if char == nil || s.gameData == nil {
		return
	}
	classData := s.gameData.GetClass(char.ClassID)
	if classData == nil {
		return
	}
	char.SetClassAptitudes(
		int(classData.AptStrength),
		int(classData.AptAgility),
		int(classData.AptStamina),
		int(classData.AptIntelligence),
		int(classData.AptEnergy),
	)
}

func (s *Service) BuildViewPropertiesFromBase(char *character.Character) map[string]interface{} {
	return character.BuildViewPropertiesFromBase(char)
}

func (s *Service) GetIconCodeByClassAndGender(classID, gender int) string {
	if s.gameData == nil {
		return ""
	}
	classData := s.gameData.GetClass(classID)
	if classData == nil {
		return ""
	}
	if gender == 1 {
		return strconv.FormatFloat(classData.IconCodeFemale, 'f', 0, 64)
	}
	return strconv.FormatFloat(classData.IconCodeMale, 'f', 0, 64)
}

func (s *Service) GetAppearanceCodesByClassAndGender(classID, gender int) (string, string, string, string) {
	if s.gameData == nil {
		return "", "", "", ""
	}
	classData := s.gameData.GetClass(classID)
	if classData == nil {
		return "", "", "", ""
	}
	if gender == 1 {
		return strconv.FormatFloat(classData.ResCodeFemale, 'f', 0, 64),
			strconv.FormatFloat(classData.ImgCodeFemale, 'f', 0, 64),
			strconv.FormatFloat(classData.IconCodeFemale, 'f', 0, 64),
			strconv.FormatFloat(classData.ColorCodeFemale1, 'f', 0, 64)
	}
	return strconv.FormatFloat(classData.ResCodeMale, 'f', 0, 64),
		strconv.FormatFloat(classData.ImgCodeMale, 'f', 0, 64),
		strconv.FormatFloat(classData.IconCodeMale, 'f', 0, 64),
		strconv.FormatFloat(classData.ColorCodeMale1, 'f', 0, 64)
}

func (s *Service) UpdatePosition(ctx context.Context, characterID int64, pos character.Position) error {
	return s.repo.UpdatePosition(ctx, characterID, pos)
}

func (s *Service) SaveGuideLog(ctx context.Context, charID int64, guideID int) error {
	char, err := s.repo.FindByID(ctx, charID)
	if err != nil {
		return err
	}

	if char.GuideLog == nil {
		char.GuideLog = make(map[int]bool)
	}
	char.GuideLog[guideID] = true

	return s.repo.Update(ctx, char)
}

func (s *Service) Save(ctx context.Context, char *character.Character) error {
	return s.repo.Update(ctx, char)
}

func (s *Service) Update(ctx context.Context, char *character.Character) error {
	return s.repo.Update(ctx, char)
}

func (s *Service) Delete(ctx context.Context, accountID uuid.UUID, characterID int64) error {
	char, err := s.repo.FindByID(ctx, characterID)
	if err != nil {
		return err
	}

	if char.AccountID != accountID {
		return pkgerrors.ErrCharacterNotOwned
	}

	return s.repo.Delete(ctx, characterID)
}

func (s *Service) GetCharacterBasicInfo(ctx context.Context, characterID int64) (*social.CharacterOnlineData, error) {
	char, err := s.repo.FindByID(ctx, characterID)
	if err != nil {
		return nil, err
	}

	return &social.CharacterOnlineData{
		Exp:     char.CumulativeExp(),
		ClassID: char.ClassID,
	}, nil
}

func (s *Service) GetCharacterIDByName(ctx context.Context, name string) (int64, string, error) {
	char, err := s.repo.FindByName(ctx, name)
	if err != nil {
		return 0, "", err
	}
	if char == nil {
		return 0, "", pkgerrors.ErrCharacterNotFound
	}
	return char.ID, char.Name, nil
}

func (s *Service) GetCharacterNameByID(ctx context.Context, characterID int64) (string, error) {
	char, err := s.repo.FindByID(ctx, characterID)
	if err != nil {
		return "", err
	}
	if char == nil {
		return "", pkgerrors.ErrCharacterNotFound
	}
	return char.Name, nil
}

// GetMockCharacterAttributes returns mock character attributes for testing/development
// Useful for testing UI without needing real character data
func (s *Service) GetMockCharacterAttributes(preset string) map[string]interface{} {
	switch preset {
	case "low":
		// Level 1 character - new player
		return map[string]interface{}{
			"hp":           100,
			"maxHp":        100,
			"mp":           50,
			"maxMp":        50,
			"sp":           100,
			"maxSp":        100,
			"exp":          0,
			"level":        1,
			"rebirthLvl":   0,
			"rebirthExp":   0,
			"money":        0,
			"moneyBind":    0,
			"gold":         0,
			"goldBind":     0,
			"strength":     10,
			"agility":      10,
			"stamina":      10,
			"intelligence": 10,
			"spirit":       10,
			"attrPoints":   0,
			"attack":       15,
			"defense":      10,
			"magicAttack":  12,
			"magicDefense": 8,
			"hit":          50,
			"dodge":        30,
			"critical":     5,
			"criticalDmg":  100,
			"speed":        50,
		}

	case "medium":
		// Level 30 character - mid-game
		return map[string]interface{}{
			"hp":           700,
			"maxHp":        700,
			"mp":           200,
			"maxMp":        200,
			"sp":           250,
			"maxSp":        250,
			"exp":          90000,
			"level":        30,
			"rebirthLvl":   0,
			"rebirthExp":   0,
			"money":        50000,
			"moneyBind":    10000,
			"gold":         1000,
			"goldBind":     500,
			"strength":     25,
			"agility":      25,
			"stamina":      25,
			"intelligence": 25,
			"spirit":       25,
			"attrPoints":   10,
			"attack":       80,
			"defense":      60,
			"magicAttack":  75,
			"magicDefense": 55,
			"hit":          75,
			"dodge":        60,
			"critical":     15,
			"criticalDmg":  120,
			"speed":        75,
		}

	case "high":
		// Level 100 character - high-level
		return map[string]interface{}{
			"hp":           2500,
			"maxHp":        2500,
			"mp":           600,
			"maxMp":        600,
			"sp":           700,
			"maxSp":        700,
			"exp":          1000000,
			"level":        100,
			"rebirthLvl":   0,
			"rebirthExp":   0,
			"money":        500000,
			"moneyBind":    100000,
			"gold":         10000,
			"goldBind":     5000,
			"strength":     50,
			"agility":      50,
			"stamina":      50,
			"intelligence": 50,
			"spirit":       50,
			"attrPoints":   100,
			"attack":       250,
			"defense":      200,
			"magicAttack":  240,
			"magicDefense": 190,
			"hit":          90,
			"dodge":        85,
			"critical":     30,
			"criticalDmg":  150,
			"speed":        100,
		}

	case "max":
		// Level 160 character - max level
		return map[string]interface{}{
			"hp":           4100,
			"maxHp":        4100,
			"mp":           1050,
			"maxMp":        1050,
			"sp":           1100,
			"maxSp":        1100,
			"exp":          2560000,
			"level":        160,
			"rebirthLvl":   0,
			"rebirthExp":   0,
			"money":        9999999,
			"moneyBind":    9999999,
			"gold":         99999,
			"goldBind":     99999,
			"strength":     100,
			"agility":      100,
			"stamina":      100,
			"intelligence": 100,
			"spirit":       100,
			"attrPoints":   500,
			"attack":       500,
			"defense":      450,
			"magicAttack":  480,
			"magicDefense": 440,
			"hit":          99,
			"dodge":        95,
			"critical":     50,
			"criticalDmg":  200,
			"speed":        150,
		}

	case "rich":
		// Rich character - lots of money
		return map[string]interface{}{
			"hp":           1500,
			"maxHp":        1500,
			"mp":           400,
			"maxMp":        400,
			"sp":           500,
			"maxSp":        500,
			"exp":          500000,
			"level":        50,
			"rebirthLvl":   0,
			"rebirthExp":   0,
			"money":        9999999,
			"moneyBind":    9999999,
			"gold":         99999,
			"goldBind":     99999,
			"strength":     35,
			"agility":      35,
			"stamina":      35,
			"intelligence": 35,
			"spirit":       35,
			"attrPoints":   50,
			"attack":       150,
			"defense":      120,
			"magicAttack":  140,
			"magicDefense": 110,
			"hit":          80,
			"dodge":        70,
			"critical":     20,
			"criticalDmg":  130,
			"speed":        85,
		}

	case "damaged":
		// Damaged character - low health
		return map[string]interface{}{
			"hp":           10,
			"maxHp":        1000,
			"mp":           5,
			"maxMp":        300,
			"sp":           10,
			"maxSp":        400,
			"exp":          300000,
			"level":        40,
			"rebirthLvl":   0,
			"rebirthExp":   0,
			"money":        100000,
			"moneyBind":    20000,
			"gold":         2000,
			"goldBind":     1000,
			"strength":     30,
			"agility":      30,
			"stamina":      30,
			"intelligence": 30,
			"spirit":       30,
			"attrPoints":   30,
			"attack":       120,
			"defense":      100,
			"magicAttack":  110,
			"magicDefense": 90,
			"hit":          75,
			"dodge":        65,
			"critical":     18,
			"criticalDmg":  125,
			"speed":        80,
		}

	default:
		// Default: level 1 character
		return s.GetMockCharacterAttributes("low")
	}
}

// GetMockAttributePresets returns list of available mock presets
func (s *Service) GetMockAttributePresets() []string {
	return []string{
		"low",     // Level 1 character
		"medium",  // Level 30 character
		"high",    // Level 100 character
		"max",     // Level 160 character (max level)
		"rich",    // Lots of money and gold
		"damaged", // Low health
	}
}
