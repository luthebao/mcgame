// Open-sourced by BaoLT

// War sprite service: panel state load, four upgrade flows (kind 1/2 × stones/gold), and bonus aggregator.
// Persists via the generic player.character_stat_features JSONB store under feature_key='war_sprite'.
package warsprite

import (
	"context"
	"errors"
	"fmt"

	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"
	domainwsp "mcgame-server/internal/domain/warsprite"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

type CharacterAccessor interface {
	GetByID(ctx context.Context, characterID int64) (*domainchar.Character, error)
	Save(ctx context.Context, char *domainchar.Character) error
}

type Service struct {
	repo   domainfeature.Repository
	chars  CharacterAccessor
	data   *gamedata.Manager
	logger *zap.Logger
}

func NewService(repo domainfeature.Repository, chars CharacterAccessor, data *gamedata.Manager, logger *zap.Logger) *Service {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Service{repo: repo, chars: chars, data: data, logger: logger}
}

type ResourceDelta struct {
	Field    string
	NewTotal int
}

type UpgradeResult struct {
	State       *domainwsp.State
	Character   *domainchar.Character
	NewID       int64
	WalletDelta ResourceDelta
	NextIsMaxed bool
}

func (s *Service) GetState(ctx context.Context, charID int64) (*domainwsp.State, error) {
	state, _, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	return state, nil
}

func (s *Service) InitDefault(ctx context.Context, charID int64) error {
	if charID <= 0 {
		return nil
	}
	state, found, err := s.loadState(ctx, charID)
	if err != nil {
		return err
	}
	if found && state != nil {
		return nil
	}
	return s.saveState(ctx, charID, domainwsp.Default())
}

func (s *Service) Upgrade(ctx context.Context, charID int64, kind, index int, useGold bool) (*UpgradeResult, error) {
	if !domainwsp.ValidKind(kind) {
		return nil, domainwsp.ErrInvalidKind
	}
	if !domainwsp.ValidIndex(index) {
		return nil, domainwsp.ErrInvalidIndex
	}
	if s.data == nil {
		return nil, errors.New("warsprite: gamedata manager not configured")
	}

	state, err := s.GetState(ctx, charID)
	if err != nil {
		return nil, err
	}

	currentID, err := state.Get(kind, index)
	if err != nil {
		return nil, err
	}
	current := s.data.GetWarSprite(int(currentID))
	if current == nil {
		return nil, domainwsp.ErrTemplateNotFound
	}
	if domainwsp.Kind(current) != kind {
		return nil, domainwsp.ErrInvalidKind
	}
	if domainwsp.IsMaxed(current) {
		return nil, domainwsp.ErrMaxLevel
	}

	nextID := domainwsp.NextID(current)
	next := s.data.GetWarSprite(nextID)
	if next == nil {
		return nil, domainwsp.ErrTemplateNotFound
	}

	char, err := s.loadCharacter(ctx, charID)
	if err != nil {
		return nil, err
	}

	delta, err := s.deductCost(char, current, kind, useGold)
	if err != nil {
		return nil, err
	}

	if err := state.Set(kind, index, int64(nextID)); err != nil {
		return nil, err
	}

	if err := s.persist(ctx, char, state); err != nil {
		return nil, err
	}

	return &UpgradeResult{
		State:       state,
		Character:   char,
		NewID:       int64(nextID),
		WalletDelta: delta,
		NextIsMaxed: domainwsp.IsMaxed(next),
	}, nil
}

func (s *Service) AggregateBonuses(ctx context.Context, charID int64) (map[int]int64, error) {
	state, err := s.GetState(ctx, charID)
	if err != nil {
		return nil, err
	}
	if s.data == nil {
		return map[int]int64{}, nil
	}
	return domainwsp.AggregateMultiplied(state, s.data.GetWarSprite), nil
}

func (s *Service) deductCost(char *domainchar.Character, current *models.WarSpriteTemplate, kind int, useGold bool) (ResourceDelta, error) {
	if useGold {
		gold := domainwsp.GoldCost(current)
		if gold > 0 {
			if int64(gold) > char.Gold {
				return ResourceDelta{}, domainwsp.ErrInsufficientGold
			}
			char.Gold -= int64(gold)
		}
		return ResourceDelta{Field: "gold", NewTotal: int(char.Gold)}, nil
	}
	stone := domainwsp.StoneCost(current)
	currencyType := stoneCurrencyForKind(kind)
	if stone > 0 {
		if err := char.DeductCurrency(currencyType, stone); err != nil {
			return ResourceDelta{}, domainwsp.ErrInsufficientStone
		}
	}
	accessor, ok := domainchar.LookupGameKVAccessor(currencyType)
	if !ok {
		return ResourceDelta{}, nil
	}
	return ResourceDelta{Field: accessor.Descriptor.ClientKey, NewTotal: int(accessor.Get(char))}, nil
}

func (s *Service) loadCharacter(ctx context.Context, charID int64) (*domainchar.Character, error) {
	if s.chars == nil {
		return nil, errors.New("warsprite: character accessor not configured")
	}
	char, err := s.chars.GetByID(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("warsprite: load character: %w", err)
	}
	if char == nil {
		return nil, domainwsp.ErrCharacterNotFound
	}
	return char, nil
}

func (s *Service) loadState(ctx context.Context, charID int64) (*domainwsp.State, bool, error) {
	if s.repo == nil {
		return domainwsp.Default(), false, nil
	}
	states, err := s.repo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, false, fmt.Errorf("warsprite: list state: %w", err)
	}
	for _, st := range states {
		if st == nil || st.FeatureKey != domainfeature.FeatureWarSprite {
			continue
		}
		return domainwsp.Decode(st.State), true, nil
	}
	return domainwsp.Default(), false, nil
}

func (s *Service) saveState(ctx context.Context, charID int64, state *domainwsp.State) error {
	if s.repo == nil {
		return nil
	}
	return s.repo.UpsertCharacterFeatureState(ctx, &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  domainfeature.FeatureWarSprite,
		State:       state.Encode(),
	})
}

func (s *Service) persist(ctx context.Context, char *domainchar.Character, state *domainwsp.State) error {
	if err := s.saveState(ctx, char.ID, state); err != nil {
		return fmt.Errorf("warsprite: save state: %w", err)
	}
	if s.chars != nil {
		if err := s.chars.Save(ctx, char); err != nil {
			return fmt.Errorf("warsprite: save character: %w", err)
		}
	}
	return nil
}

func stoneCurrencyForKind(kind int) int {
	if kind == domainwsp.KindBattleSprite {
		return domainchar.CurrencyBattleSprite
	}
	return domainchar.CurrencyWarSprite
}
