// Open-sourced by BaoLT

// Title service handles title-related business logic.
// Manages title ownership, activation, and retrieval.
package title

import (
	"context"
	"fmt"
	"strings"

	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

type GameDataProvider interface {
	GetTitle(id int) *models.TitleTemplate
	GetBuff(id int) *models.BuffTemplate
}

// Repository defines the interface for title data access.
type Repository interface {
	GetCharacterTitles(ctx context.Context, characterID int64) ([]int, error)
	GetCharacterSpecialTitles(ctx context.Context, characterID int64) ([]int, error)
	AddTitle(ctx context.Context, characterID int64, titleID int) error
	SetActiveTitle(ctx context.Context, characterID int64, titleID int) error
	SetActiveSpecialTitle(ctx context.Context, characterID int64, titleID int) error
	HasTitle(ctx context.Context, characterID int64, titleID int) (bool, error)
	GetActiveTitle(ctx context.Context, characterID int64) (int, error)
	GetActiveSpecialTitle(ctx context.Context, characterID int64) (int, error)
}

type GrantResult struct {
	Added         bool
	TitleID       int
	Titles        string
	SpecialTitles string
	IsSpecial     bool
}

// Service provides title-related business logic.
type Service struct {
	repo     Repository
	gameData GameDataProvider
	logger   *zap.Logger
}

// NewService creates a new title service.
func NewService(repo Repository, logger *zap.Logger) *Service {
	return &Service{
		repo:   repo,
		logger: logger,
	}
}

func (s *Service) SetGameDataProvider(provider GameDataProvider) {
	s.gameData = provider
}

// GetTitleList retrieves all titles owned by a character.
// Returns a map with "ct" (regular titles) and "cts" (special titles) as pipe-separated strings.
func (s *Service) GetTitleList(ctx context.Context, characterID int64) (map[string]any, error) {
	s.logger.Debug("Getting title list",
		zap.Int64("character_id", characterID))

	titles, specialTitles, err := s.loadTitleLists(ctx, characterID)
	if err != nil {
		return nil, err
	}
	ct := joinInts(titles)
	if ct != "" {
		ct = "|" + ct + "|"
	}
	cts := joinInts(specialTitles)
	if cts != "" {
		cts = cts + "|"
	}

	s.logger.Debug("Title list retrieved",
		zap.Int64("character_id", characterID),
		zap.String("ct", ct),
		zap.String("cts", cts))

	return map[string]any{
		"ct":  ct,
		"cts": cts,
	}, nil
}

func (s *Service) GrantTitle(ctx context.Context, characterID int64, titleID int) (GrantResult, error) {
	result := GrantResult{TitleID: titleID}
	if titleID <= 0 {
		return result, fmt.Errorf("invalid title id")
	}

	hasTitle, err := s.repo.HasTitle(ctx, characterID, titleID)
	if err != nil {
		return result, fmt.Errorf("failed to check title ownership: %w", err)
	}

	if !hasTitle {
		if err := s.repo.AddTitle(ctx, characterID, titleID); err != nil {
			return result, fmt.Errorf("failed to grant title: %w", err)
		}
		result.Added = true
	}

	titles, specialTitles, err := s.loadTitleLists(ctx, characterID)
	if err != nil {
		return result, err
	}

	result.Titles = joinInts(titles)
	result.SpecialTitles = joinInts(specialTitles)
	result.IsSpecial = containsInt(specialTitles, titleID)
	return result, nil
}

// SetActiveTitle sets or unsets the active title for a character.
// titleID of -1 means deactivate current title.
func (s *Service) SetActiveTitle(ctx context.Context, characterID int64, titleID int) (map[string]any, error) {
	s.logger.Debug("Setting active title",
		zap.Int64("character_id", characterID),
		zap.Int("title_id", titleID))

	// If titleID > 0, verify character owns the title
	if titleID > 0 {
		hasTitle, err := s.repo.HasTitle(ctx, characterID, titleID)
		if err != nil {
			return nil, fmt.Errorf("failed to check title ownership: %w", err)
		}
		if !hasTitle {
			s.logger.Warn("Character does not own title",
				zap.Int64("character_id", characterID),
				zap.Int("title_id", titleID))
			return map[string]any{
				"f": false,
			}, nil
		}
	}

	// Set active title
	if err := s.repo.SetActiveTitle(ctx, characterID, titleID); err != nil {
		s.logger.Error("Failed to set active title",
			zap.Int64("character_id", characterID),
			zap.Int("title_id", titleID),
			zap.Error(err))
		return nil, fmt.Errorf("failed to set active title: %w", err)
	}

	s.logger.Info("Active title set",
		zap.Int64("character_id", characterID),
		zap.Int("title_id", titleID))

	return map[string]any{
		"f":  true,
		"t":  titleID,
		"bd": s.buildTitleBuffPayload(titleID),
	}, nil
}

// SetActiveSpecialTitle sets or unsets the active special title for a character.
// titleID of -1 means deactivate current special title.
func (s *Service) SetActiveSpecialTitle(ctx context.Context, characterID int64, titleID int) (map[string]any, error) {
	s.logger.Debug("Setting active special title",
		zap.Int64("character_id", characterID),
		zap.Int("title_id", titleID))

	// If titleID > 0, verify character owns the title
	if titleID > 0 {
		hasTitle, err := s.repo.HasTitle(ctx, characterID, titleID)
		if err != nil {
			return nil, fmt.Errorf("failed to check title ownership: %w", err)
		}
		if !hasTitle {
			s.logger.Warn("Character does not own special title",
				zap.Int64("character_id", characterID),
				zap.Int("title_id", titleID))
			return map[string]any{
				"f": false,
			}, nil
		}
	}

	// Set active special title
	if err := s.repo.SetActiveSpecialTitle(ctx, characterID, titleID); err != nil {
		s.logger.Error("Failed to set active special title",
			zap.Int64("character_id", characterID),
			zap.Int("title_id", titleID),
			zap.Error(err))
		return nil, fmt.Errorf("failed to set active special title: %w", err)
	}

	s.logger.Info("Active special title set",
		zap.Int64("character_id", characterID),
		zap.Int("title_id", titleID))

	return map[string]any{
		"f":  true,
		"t":  titleID,
		"bd": s.buildTitleBuffPayload(titleID),
	}, nil
}

func (s *Service) buildTitleBuffPayload(titleID int) map[string]any {
	if s == nil || s.gameData == nil || titleID <= 0 {
		return nil
	}
	tpl := s.gameData.GetTitle(titleID)
	if tpl == nil || tpl.BuffID == nil || *tpl.BuffID <= 0 {
		return nil
	}
	buffID := int(*tpl.BuffID)
	buff := s.gameData.GetBuff(buffID)
	if buff == nil {
		s.logger.Warn("Title references unknown buff",
			zap.Int("title_id", titleID),
			zap.Int("buff_id", buffID))
		return nil
	}
	return map[string]any{
		"id":           buff.ID,
		"bid":          buff.ID,
		"type":         buff.Type,
		"kind":         buff.Kind,
		"icon_code":    buff.IconCode,
		"effect_num":   buff.EffectNum,
		"percent_flag": buff.PercentFlag,
		"prop1":        buff.Prop1,
		"prop2":        buff.Prop2,
		"prop3":        buff.Prop3,
		"prop4":        buff.Prop4,
		"prop5":        buff.Prop5,
		"prop6":        buff.Prop6,
		"prop_num1":    buff.PropNum1,
		"prop_num2":    buff.PropNum2,
		"prop_num3":    buff.PropNum3,
		"prop_num4":    buff.PropNum4,
		"prop_num5":    buff.PropNum5,
		"prop_num6":    buff.PropNum6,
	}
}

// joinInts converts a slice of integers to a plain pipe-separated string (e.g. 80|6|24).
// An empty slice returns "". GrantTitle results use this raw form; the login/gtl ct/cts
// strings add their own edge pipes in GetTitleList to match the live wire format.
func joinInts(nums []int) string {
	if len(nums) == 0 {
		return ""
	}
	strs := make([]string, len(nums))
	for i, n := range nums {
		strs[i] = fmt.Sprintf("%d", n)
	}
	return strings.Join(strs, "|")
}

func containsInt(values []int, target int) bool {
	for _, value := range values {
		if value == target {
			return true
		}
	}
	return false
}

func (s *Service) GetActiveTitle(ctx context.Context, characterID int64) (int, error) {
	return s.repo.GetActiveTitle(ctx, characterID)
}

func (s *Service) GetActiveSpecialTitle(ctx context.Context, characterID int64) (int, error) {
	return s.repo.GetActiveSpecialTitle(ctx, characterID)
}

func (s *Service) loadTitleLists(ctx context.Context, characterID int64) ([]int, []int, error) {
	titles, err := s.repo.GetCharacterTitles(ctx, characterID)
	if err != nil {
		s.logger.Error("Failed to get titles",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, nil, fmt.Errorf("failed to get titles: %w", err)
	}

	specialTitles, err := s.repo.GetCharacterSpecialTitles(ctx, characterID)
	if err != nil {
		s.logger.Error("Failed to get special titles",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, nil, fmt.Errorf("failed to get special titles: %w", err)
	}

	return titles, specialTitles, nil
}
