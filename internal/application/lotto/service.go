// Open-sourced by BaoLT

// Lottery holding-bag application service. Manages the lotto/lottery/luckDraw reward
// bags: read, claim-to-inventory (single/all), discard-all, and sort, plus an AddToBag
// write path used by draws/events to deposit winnings. The Wish-Tree draw RPCs
// (getLottoData/lottoByClient) live in draw.go: the pool is TBL_PLAN filtered by type +
// weighted by the r column; gold costs and the daily free-type-1 quota are client-sourced
// constants (see draw.go header) since they are not in any data table.
package lotto

import (
	"context"
	"fmt"
	"math/rand"
	"sync"
	"time"

	appitem "mcgame-server/internal/application/item"
	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

const featureKeyLotto = domainfeature.FeatureLotto

type LottoGameData interface {
	PlansByType(t int) []*models.PlanTemplate
}

type LottoCharProvider interface {
	FindByID(ctx context.Context, id int64) (*domainchar.Character, error)
	Update(ctx context.Context, c *domainchar.Character) error
}

type Service struct {
	featureRepo domainfeature.Repository
	itemService *appitem.Service
	gameData    LottoGameData
	chars       LottoCharProvider
	logger      *zap.Logger
	rng         *rand.Rand
	rngMu       sync.Mutex
}

func NewService(featureRepo domainfeature.Repository, logger *zap.Logger) *Service {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Service{featureRepo: featureRepo, logger: logger, rng: rand.New(rand.NewSource(time.Now().UnixNano()))}
}

func (s *Service) SetItemService(svc *appitem.Service) {
	s.itemService = svc
}

func (s *Service) SetGameData(gd LottoGameData) {
	s.gameData = gd
}

func (s *Service) SetCharRepository(repo LottoCharProvider) {
	s.chars = repo
}

func (s *Service) loadState(ctx context.Context, charID int64) (*LottoState, error) {
	states, err := s.featureRepo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("lotto: load feature states: %w", err)
	}
	for _, st := range states {
		if st != nil && st.FeatureKey == featureKeyLotto {
			return lottoStateFromMap(st.State), nil
		}
	}
	return defaultLottoState(), nil
}

func (s *Service) saveState(ctx context.Context, charID int64, state *LottoState) error {
	return s.featureRepo.UpsertCharacterFeatureState(ctx, &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  featureKeyLotto,
		State:       state.ToMap(),
	})
}

func (s *Service) BagLengths(ctx context.Context, charID int64) (lotto int, lottery int) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		s.logger.Warn("lotto: login length load failed", zap.Int64("char_id", charID), zap.Error(err))
		return 0, 0
	}
	return len(state.Lotto), len(state.Lottery)
}

func (s *Service) GetBag(ctx context.Context, charID int64, kind string) ([]any, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	return entriesToList(*state.bag(kind)), nil
}

func (s *Service) Sort(ctx context.Context, charID int64, kind string) ([]any, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	return entriesToList(*state.bag(kind)), nil
}

func (s *Service) ThrowAll(ctx context.Context, charID int64, kind string) ([]any, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	*state.bag(kind) = []LottoEntry{}
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return []any{}, nil
}

func (s *Service) ClaimAll(ctx context.Context, charID int64, kind string) ([]any, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	bag := state.bag(kind)
	remaining := make([]LottoEntry, 0, len(*bag))
	for _, entry := range *bag {
		if grantErr := s.grantEntry(ctx, charID, entry); grantErr != nil {
			s.logger.Warn("lotto: claim-all grant failed", zap.Int64("char_id", charID), zap.Error(grantErr))
			remaining = append(remaining, entry)
		}
	}
	*bag = remaining
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return entriesToList(*bag), nil
}

func (s *Service) ClaimSingle(ctx context.Context, charID int64, kind string, index int) ([]any, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	bag := state.bag(kind)
	if index < 0 || index >= len(*bag) {
		return entriesToList(*bag), nil
	}
	entry := (*bag)[index]
	if grantErr := s.grantEntry(ctx, charID, entry); grantErr != nil {
		return nil, grantErr
	}
	*bag = append((*bag)[:index], (*bag)[index+1:]...)
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return entriesToList(*bag), nil
}

func (s *Service) AddToBag(ctx context.Context, charID int64, kind string, entry LottoEntry) error {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return err
	}
	bag := state.bag(kind)
	if len(*bag)+1 > lottoBagCap {
		return ErrLottoBagFull
	}
	*bag = append(*bag, entry)
	return s.saveState(ctx, charID, state)
}

func (s *Service) grantEntry(ctx context.Context, charID int64, entry LottoEntry) error {
	if s.itemService == nil {
		return fmt.Errorf("lotto: item service unavailable")
	}
	templateID := parseInt(entry.Ii)
	if templateID <= 0 {
		return fmt.Errorf("lotto: invalid template id %q", entry.Ii)
	}
	count := entry.N
	if count <= 0 {
		count = 1
	}
	itemType := domainitem.ItemTypeConsumable
	if entry.Ti == "19" || entry.Ti == "27" {
		itemType = domainitem.ItemTypeEquipment
	}
	_, err := s.itemService.AddItemWithBind(ctx, charID, templateID, itemType, count, entry.B == 1)
	return err
}
