// Open-sourced by BaoLT

// Activity application service for PM/VIP persistence and synchronization.
package activity

import (
	"context"
	"errors"
	"strconv"
	"time"

	domainauth "mcgame-server/internal/domain/auth"
	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/gamedata"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

const dayDuration = 24 * time.Hour

var premiumPackageGoldCost = map[int]int64{
	1: 688,
	2: 1688,
	3: 2888,
}

type PremiumService struct {
	charRepo    domainchar.Repository
	accountRepo domainauth.AccountRepository
	gameData    *gamedata.Manager
	logger      *zap.Logger
	nowFn       func() time.Time
}

type PMState struct {
	CharacterID int64
	PMLevel     int
	PMExp       int64
	ActiveType  int
	ActiveTime  int64
	KeepDay     float64
	Gold        int64
	GoldCost    int64
	ProcessFlag map[string]interface{}
	Findback    bool
	Date        int64
	ExpiresAt   *time.Time
}

func NewPremiumService(charRepo domainchar.Repository, accountRepo domainauth.AccountRepository, logger *zap.Logger) *PremiumService {
	return &PremiumService{
		charRepo:    charRepo,
		accountRepo: accountRepo,
		logger:      logger,
		nowFn:       time.Now,
	}
}

func (s *PremiumService) SetNowFunc(nowFn func() time.Time) {
	if nowFn != nil {
		s.nowFn = nowFn
	}
}

func (s *PremiumService) SetGameDataManager(manager *gamedata.Manager) {
	s.gameData = manager
}

func (s *PremiumService) GetPMState(ctx context.Context, characterID int64) (*PMState, error) {
	char, now, changed, err := s.loadCharacter(ctx, characterID)
	if err != nil {
		return nil, err
	}
	if changed {
		if err := s.persistCharacter(ctx, char); err != nil {
			return nil, err
		}
	}
	if err := s.syncAccountVIPLevel(ctx, char, now); err != nil {
		return nil, err
	}
	return buildPMState(char, now), nil
}

func (s *PremiumService) BuyPM(ctx context.Context, characterID int64, activeType int) (*PMState, error) {
	if activeType < 1 || activeType > 3 {
		return nil, pkgerrors.ErrInvalidInput
	}

	char, now, changed, err := s.loadCharacter(ctx, characterID)
	if err != nil {
		return nil, err
	}
	if changed {
		if err := s.persistCharacter(ctx, char); err != nil {
			return nil, err
		}
		if err := s.syncAccountVIPLevel(ctx, char, now); err != nil {
			return nil, err
		}
	}

	if char.HasActiveVIP(now) && activeType < char.VIPType {
		return nil, pkgerrors.ErrInvalidInput
	}

	cost, ok := premiumPackageGoldCost[activeType]
	if !ok {
		return nil, pkgerrors.ErrInvalidInput
	}
	if char.Gold < cost {
		return nil, errors.New("not enough gold")
	}

	baseTime := now
	if char.VIPExpiresAt != nil && now.Before(*char.VIPExpiresAt) {
		baseTime = *char.VIPExpiresAt
	}

	char.Gold -= cost
	char.PMExp = pmExpAfterPackagePurchase(char.PMExp, activeType, cost)
	expiresAt := baseTime.Add(pmPackageDuration(activeType))
	char.VIPType = activeType
	char.VIPExpiresAt = &expiresAt

	if err := s.persistCharacter(ctx, char); err != nil {
		return nil, err
	}
	if err := s.syncAccountVIPLevel(ctx, char, now); err != nil {
		return nil, err
	}
	state := buildPMState(char, now)
	state.GoldCost = cost
	return state, nil
}

func (s *PremiumService) loadCharacter(ctx context.Context, characterID int64) (*domainchar.Character, time.Time, bool, error) {
	char, err := s.charRepo.FindByID(ctx, characterID)
	if err != nil {
		return nil, time.Time{}, false, err
	}

	now := s.nowFn()
	changed := char.NormalizeVIP(now)
	char.NormalizeSlotFields()
	if s.normalizePMFindback(char, now) {
		changed = true
	}
	return char, now, changed, nil
}

func (s *PremiumService) persistCharacter(ctx context.Context, char *domainchar.Character) error {
	if s.charRepo == nil || char == nil {
		return nil
	}
	return s.charRepo.Update(ctx, char)
}

func (s *PremiumService) syncAccountVIPLevel(ctx context.Context, char *domainchar.Character, now time.Time) error {
	if s.accountRepo == nil || char == nil || char.AccountID == uuid.Nil {
		return nil
	}

	account, err := s.accountRepo.FindByID(ctx, char.AccountID)
	if err != nil {
		return err
	}

	level := char.CurrentPMLevel(now)
	if account.VIPLevel == level {
		return nil
	}

	account.VIPLevel = level
	return s.accountRepo.Update(ctx, account)
}

func buildPMState(char *domainchar.Character, now time.Time) *PMState {
	state := &PMState{
		CharacterID: char.ID,
		PMLevel:     0,
		PMExp:       char.PMExp,
		ActiveType:  0,
		ActiveTime:  now.UnixMilli(),
		KeepDay:     0,
		Gold:        char.Gold,
		GoldCost:    0,
		ProcessFlag: map[string]interface{}{},
		Findback:    char.PMFindback,
		Date:        now.UnixMilli(),
	}

	if len(char.PMProcessData) > 0 {
		state.ProcessFlag = clonePMProcessFlag(char.PMProcessData)
	}

	if char.HasActiveVIP(now) {
		state.PMLevel = char.CurrentPMLevel(now)
		state.ActiveType = char.VIPType
		state.ExpiresAt = char.VIPExpiresAt
		state.KeepDay = char.RemainingVIPDuration(now).Hours() / 24
	}

	return state
}

func clonePMProcessFlag(source map[string]interface{}) map[string]interface{} {
	if len(source) == 0 {
		return map[string]interface{}{}
	}

	cloned := map[string]interface{}{}
	for key, value := range source {
		if _, err := strconv.Atoi(key); err != nil {
			continue
		}
		cloned[key] = value
	}
	return cloned
}

func pmPackageDuration(activeType int) time.Duration {
	switch activeType {
	case 1:
		return 30 * dayDuration
	case 2:
		return 90 * dayDuration
	default:
		return 180 * dayDuration
	}
}

func pmExpAfterPackagePurchase(currentExp int64, activeType int, cost int64) int64 {
	nextExp := currentExp + cost
	minimumExp := domainchar.PMExpThresholdForLevel(activeType)
	if nextExp < minimumExp {
		return minimumExp
	}
	return nextExp
}
