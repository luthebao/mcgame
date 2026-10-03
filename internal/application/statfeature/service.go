// Open-sourced by BaoLT

// Stat feature service aggregates persisted progression systems into login payload state and combat-ready bonuses.
package statfeature

import (
	"context"

	domainitem "mcgame-server/internal/domain/item"
	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata"

	"go.uber.org/zap"
)

type Service struct {
	repo            domainfeature.Repository
	gameDataManager *gamedata.Manager
	logger          *zap.Logger
}

func NewService(repo domainfeature.Repository, logger *zap.Logger) *Service {
	return &Service{
		repo:   repo,
		logger: logger,
	}
}

func (s *Service) SetGameDataManager(mgr *gamedata.Manager) {
	s.gameDataManager = mgr
}

func (s *Service) BuildCharacterLoginState(ctx context.Context, charID int64) (map[string]interface{}, error) {
	progression, featureStates, _, err := s.loadCharacterState(ctx, charID)
	if err != nil {
		return nil, err
	}

	result := defaultCharacterLoginState(progression)

	if state := featureStates[domainfeature.FeatureMagicArray]; len(state) > 0 {
		result["astrologicData"] = mergeMaps(defaultAstrologicData(), state)
		if astrologic, ok := result["astrologicData"].(map[string]interface{}); ok {
			result["starsData"] = stateValueAsMap(astrologic, "starsNow")
		}
	}

	if state := featureStates[domainfeature.FeatureStars]; len(state) > 0 {
		result["starsData"] = cloneMap(state)
	}

	if state := featureStates[domainfeature.FeatureActivePet]; len(state) > 0 {
		result["activePetObject"] = state
	}

	if state := featureStates[domainfeature.FeatureContractPet]; len(state) > 0 {
		result["contractPet"] = mergeMaps(defaultContractPetState(), state)
	}

	if state := featureStates[domainfeature.FeatureHeiyaoshi]; len(state) > 0 {
		result["heiyaoshi"] = mergeMaps(defaultHeiyaoshiState(), state)
	}

	result["warSprite"] = mergeMaps(defaultWarSpriteState(), featureStates[domainfeature.FeatureWarSprite])

	if state := featureStates[domainfeature.FeatureMonsterHeart]; len(state) > 0 {
		result["monsterHeartBag"] = monsterHeartBagFromState(state)
	}

	if state := featureStates[domainfeature.FeatureAwakening]; len(state) > 0 {
		if pointDict := cloneMap(stateValueAsMap(state, "pointDict")); len(pointDict) > 0 {
			result["awakenPointDict"] = pointDict
		}
		if awakenAdd, ok := intValue(state["awakenAdd"]); ok {
			result["awakenAdd"] = awakenAdd
		}
		if v, ok := intValue(state["point"]); ok {
			result["awakenPoint"] = v
		}
		if v, ok := intValue(state["pointUsed"]); ok {
			result["awakenPointUsed"] = v
		}
	}

	if state := featureStates[domainfeature.FeatureMedal]; len(state) > 0 {
		if medalExp, ok := intValue(state["exp"]); ok {
			result["medalExp"] = medalExp
		}
	}

	return result, nil
}

func (s *Service) GetCharacterLoginBlobs(ctx context.Context, charID int64, equippedItems []*domainitem.Item) (LoginBlobs, error) {
	if s == nil || s.repo == nil {
		return BuildLoginBlobs(map[string]map[string]interface{}{}, nil, nil, nil), nil
	}
	progression, featureStates, _, err := s.loadCharacterState(ctx, charID)
	if err != nil {
		return LoginBlobs{}, err
	}
	var accessor StoneSealItemAccessor
	if s.gameDataManager != nil {
		accessor = s.gameDataManager
	}
	return BuildLoginBlobs(featureStates, progression, buildEquippedItemsByEquipSid(equippedItems), accessor), nil
}

func (s *Service) loadCharacterState(ctx context.Context, charID int64) (*domainfeature.CharacterProgression, map[string]map[string]interface{}, *domainfeature.ActiveMount, error) {
	if s == nil || s.repo == nil {
		return nil, map[string]map[string]interface{}{}, nil, nil
	}

	progression, err := s.repo.GetCharacterProgression(ctx, charID)
	if err != nil {
		return nil, nil, nil, err
	}

	states, err := s.repo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, nil, nil, err
	}

	activeMount, err := s.repo.GetActiveMount(ctx, charID)
	if err != nil {
		return nil, nil, nil, err
	}

	return progression, buildCharacterStateMap(states), activeMount, nil
}

func (s *Service) loadPetState(ctx context.Context, petID int64) (map[string]map[string]interface{}, error) {
	if s == nil || s.repo == nil {
		return map[string]map[string]interface{}{}, nil
	}

	states, err := s.repo.ListPetFeatureStates(ctx, petID)
	if err != nil {
		return nil, err
	}

	return buildPetStateMap(states), nil
}

func buildCharacterStateMap(states []*domainfeature.CharacterFeatureState) map[string]map[string]interface{} {
	result := make(map[string]map[string]interface{}, len(states))
	for _, state := range states {
		if state == nil || state.FeatureKey == "" {
			continue
		}
		result[state.FeatureKey] = cloneMap(state.State)
	}
	return result
}

func buildPetStateMap(states []*domainfeature.PetFeatureState) map[string]map[string]interface{} {
	result := make(map[string]map[string]interface{}, len(states))
	for _, state := range states {
		if state == nil || state.FeatureKey == "" {
			continue
		}
		result[state.FeatureKey] = cloneMap(state.State)
	}
	return result
}
