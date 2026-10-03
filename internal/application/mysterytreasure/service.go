// Open-sourced by BaoLT

// Mystery Treasure application service manages the player's mystery bag, learned recipes,
// make-skill level, and associated buff data.
// State is persisted into the character_stat_features JSONB row keyed
// feature_key="mystery_treasure".
//
// Bag wire format (shared between onGetMysBagData reply and updateMysTreBag push):
// { "<slot>": {mid: int, num: int}, … }
//
// LearnedRec wire format (identity map of learned recipe ids):
// { "<id>": <id>, … }
//
// State encode/decode: state.go
package mysterytreasure

import (
	"context"

	domainfeature "mcgame-server/internal/domain/statfeature"

	"go.uber.org/zap"
)

type Service struct {
	repo         domainfeature.Repository
	chipProvider ChipBagProvider
	gameData     GameDataPort
	items        ItemBagProvider
	logger       *zap.Logger
}

func NewService(repo domainfeature.Repository, logger *zap.Logger) *Service {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Service{repo: repo, logger: logger}
}

func (s *Service) SetChipBagProvider(provider ChipBagProvider) {
	s.chipProvider = provider
}

func (s *Service) Load(ctx context.Context, charID int64) (*MysteryTreasureState, error) {
	if s == nil || s.repo == nil {
		return DefaultState(), nil
	}
	states, err := s.repo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, err
	}
	for _, st := range states {
		if st == nil || st.FeatureKey != domainfeature.FeatureMysteryTreasure {
			continue
		}
		return decodeState(st.State), nil
	}
	return DefaultState(), nil
}

func (s *Service) Save(ctx context.Context, charID int64, st *MysteryTreasureState) error {
	if s == nil || s.repo == nil {
		return nil
	}
	encoded := encodeState(st)
	return s.repo.UpsertCharacterFeatureState(ctx, &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  domainfeature.FeatureMysteryTreasure,
		State:       encoded,
	})
}

func BagToWire(bag map[string]BagSlot) map[string]interface{} {
	wire := make(map[string]interface{}, len(bag))
	for k, v := range bag {
		wire[k] = map[string]interface{}{
			"mid": float64(v.Mid),
			"num": float64(v.Num),
		}
	}
	return wire
}
