// Open-sourced by BaoLT

// Explorer medal service manages level-up mutations for the FeatureExplorerMedal
// feature state. State is stored as info:"<level>|<score>" in the generic character
// feature store; parsing and persistence go through the statfeature repository so
// the login cData serializer (login_blobs.go) stays consistent.
//
// Upgrade semantics: score is cumulative (never consumed). A level-up succeeds when
// the player's current score >= nextLevel.cost. Score never decreases; only level
// advances. At level 100 (max) the service returns ErrAtMaxLevel.
package explorermedal

import (
	"context"
	"errors"
	"fmt"
	"strconv"
	"strings"

	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
)

const (
	MaxMedalLevel = 100
)

var (
	ErrAtMaxLevel        = errors.New("explorermedal: already at max level")
	ErrInsufficientScore = errors.New("explorermedal: insufficient EMP score")
)

type StateAccessor interface {
	ListCharacterFeatureStates(ctx context.Context, charID int64) ([]*domainfeature.CharacterFeatureState, error)
	UpsertCharacterFeatureState(ctx context.Context, state *domainfeature.CharacterFeatureState) error
}

type LevelUpResult struct {
	Level   int
	Score   int
	PropMap map[string]interface{}
}

type Service struct {
	repo     StateAccessor
	gameData *gamedata.Manager
}

func NewService(repo StateAccessor, gameData *gamedata.Manager) *Service {
	return &Service{repo: repo, gameData: gameData}
}

func (s *Service) GetState(ctx context.Context, charID int64) (level int, score int, err error) {
	states, err := s.repo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return 0, 0, fmt.Errorf("explorermedal: list feature states: %w", err)
	}
	for _, st := range states {
		if st.FeatureKey != domainfeature.FeatureExplorerMedal {
			continue
		}
		level, score = parseInfoField(st.State)
		return level, score, nil
	}
	return 0, 0, nil
}

func (s *Service) BuildPanelResponse(level, score int) []interface{} {
	propMap := s.buildCumulativePropMap(level)
	return []interface{}{level, propMap, score, 0}
}

func (s *Service) LevelUp(ctx context.Context, charID int64) (LevelUpResult, error) {
	level, score, err := s.GetState(ctx, charID)
	if err != nil {
		return LevelUpResult{}, err
	}
	if level >= MaxMedalLevel {
		return LevelUpResult{}, ErrAtMaxLevel
	}
	nextLevel := level + 1
	nextTemplate := s.gameData.GetExplorerMedal(nextLevel)
	if nextTemplate == nil {
		return LevelUpResult{}, ErrAtMaxLevel
	}
	requiredScore := int(nextTemplate.Cost)
	if score < requiredScore {
		return LevelUpResult{}, ErrInsufficientScore
	}
	newLevel := nextLevel
	newState := &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  domainfeature.FeatureExplorerMedal,
		State:       map[string]interface{}{"info": fmt.Sprintf("%d|%d", newLevel, score)},
	}
	if err := s.repo.UpsertCharacterFeatureState(ctx, newState); err != nil {
		return LevelUpResult{}, fmt.Errorf("explorermedal: persist level up: %w", err)
	}
	propMap := s.buildCumulativePropMap(newLevel)
	return LevelUpResult{
		Level:   newLevel,
		Score:   score,
		PropMap: propMap,
	}, nil
}

func (s *Service) buildCumulativePropMap(level int) map[string]interface{} {
	totals := map[int]float64{}
	for i := 1; i <= level; i++ {
		t := s.gameData.GetExplorerMedal(i)
		if t == nil {
			continue
		}
		addTemplateToPropMap(totals, t)
	}
	result := make(map[string]interface{}, len(totals))
	for k, v := range totals {
		result[strconv.Itoa(k)] = v
	}
	return result
}

func addTemplateToPropMap(totals map[int]float64, t *models.ExplorerMedalTemplate) {
	types := []float64{
		t.PropType1, t.PropType2, t.PropType3, t.PropType4,
		t.PropType5, t.PropType6, t.PropType7, t.PropType8,
	}
	nums := []float64{
		t.PropNum1, t.PropNum2, t.PropNum3, t.PropNum4,
		t.PropNum5, t.PropNum6, t.PropNum7, t.PropNum8,
	}
	for i, pt := range types {
		propType := int(pt)
		if propType <= 0 {
			continue
		}
		totals[propType] += nums[i]
	}
}

func parseInfoField(state map[string]interface{}) (level int, score int) {
	raw, ok := state["info"]
	if !ok {
		return 0, 0
	}
	info, ok := raw.(string)
	if !ok {
		return 0, 0
	}
	parts := strings.SplitN(info, "|", 2)
	if len(parts) < 1 {
		return 0, 0
	}
	level, _ = strconv.Atoi(strings.TrimSpace(parts[0]))
	if len(parts) >= 2 {
		score, _ = strconv.Atoi(strings.TrimSpace(parts[1]))
	}
	return level, score
}
