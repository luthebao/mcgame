// Open-sourced by BaoLT

package magicweapon

import (
	"context"
	"strconv"
	"sync"

	appitem "mcgame-server/internal/application/item"
	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type CharacterRepository interface {
	FindByID(ctx context.Context, id int64) (*domainchar.Character, error)
	Update(ctx context.Context, char *domainchar.Character) error
}

type Service struct {
	itemService *appitem.Service
	itemRepo    domainitem.Repository
	charRepo    CharacterRepository
	gameData    *gamedata.Manager
	logger      *zap.Logger

	skillGranter *SkillGranter

	pendingResetMu sync.Mutex
	pendingReset   map[int64]*PendingPropReset

	pendingSuccinctMu sync.Mutex
	pendingSuccinct   map[int64]*PendingSuccinct
}

func NewService(itemService *appitem.Service, itemRepo domainitem.Repository, charRepo CharacterRepository, gameData *gamedata.Manager, logger *zap.Logger) *Service {
	return &Service{
		itemService:     itemService,
		itemRepo:        itemRepo,
		charRepo:        charRepo,
		gameData:        gameData,
		logger:          logger,
		pendingReset:    make(map[int64]*PendingPropReset),
		pendingSuccinct: make(map[int64]*PendingSuccinct),
	}
}

func (s *Service) GameData() *gamedata.Manager {
	return s.gameData
}

func (s *Service) SetSkillGranter(g *SkillGranter) {
	s.skillGranter = g
}

func (s *Service) ClearPending(charID int64) {
	s.pendingResetMu.Lock()
	delete(s.pendingReset, charID)
	s.pendingResetMu.Unlock()
	s.pendingSuccinctMu.Lock()
	delete(s.pendingSuccinct, charID)
	s.pendingSuccinctMu.Unlock()
}

func (s *Service) ItemService() *appitem.Service {
	return s.itemService
}

func (s *Service) GetSpirituality(char *domainchar.Character) int64 {
	if char == nil {
		return 0
	}
	v, err := strconv.ParseInt(char.Spirituality, 10, 64)
	if err != nil {
		return 0
	}
	return v
}

func (s *Service) SetSpirituality(char *domainchar.Character, value int64) {
	if char == nil {
		return
	}
	if value < 0 {
		value = 0
	}
	char.Spirituality = strconv.FormatInt(value, 10)
}

func (s *Service) loadOwnedItem(ctx context.Context, charID, itemID int64) (*domainitem.Item, error) {
	if itemID <= 0 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	it, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return nil, err
	}
	if it == nil || it.CharacterID != charID {
		return nil, pkgerrors.ErrItemNotOwned
	}
	return it, nil
}

func (s *Service) persistItem(ctx context.Context, it *domainitem.Item) error {
	return s.itemRepo.Update(ctx, it)
}

func (s *Service) persistChar(ctx context.Context, char *domainchar.Character) error {
	return s.charRepo.Update(ctx, char)
}
