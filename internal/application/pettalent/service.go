// Open-sourced by BaoLT

// Pet Talent (Thiên Phú Pet) application service. Persists the panel state
// (feature_key='pet_talent') and serves the panel RPCs: initTalentPanelData,
// upTalentSlotLv (slot.go); arrangeTalentBag, breakTalentStone, resetTalentSlot
// (bag.go); fillTalentStone, takeOffTalentStone, moveStoneBagToBag, upTalentStone
// (inlay.go).
//
// Talent stones live in the normal panel bag (State.Bag); slot upgrades reference
// TBL_PET_TALENT records where id = basicTid + lv (lv 0-5 per slot). Stone records
// (lv>=1, up_exp=0, exp>0) form per-family chains where the next-level id is
// currentId+1 (same family + prop line). Currency deductions (pvePoint / gold for
// slot upgrades) mutate char + charRepo.Update without a separate currency push,
// matching the stoneseal/soul pattern; the client reconciles on next sync.
package pettalent

import (
	"context"
	"errors"
	"fmt"
	"math/rand"
	"sync"
	"time"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

const featureKey = domainfeature.FeaturePetTalent

const (
	goldRate          = 0.0666666666666667
	directionItemID   = 4181
	fuseSourceCount   = 5
	rerollSourceCount = 2
	slot10LevelGate   = 20
	slot11LevelGate   = 35
)

var directionItemQty = map[int]int{1: 1, 2: 3, 3: 15, 4: 50}

var (
	ErrCharacterMissing = errors.New("thiên phú: không tìm thấy nhân vật")
	ErrInvalidSlot      = errors.New("thiên phú: vị trí không hợp lệ")
	ErrMaxSlotLevel     = errors.New("thiên phú: cấp đã tối đa")
	ErrTalentNotFound   = errors.New("thiên phú: không tìm thấy dữ liệu thiên phú")
	ErrInsufficientPve  = errors.New("thiên phú: không đủ điểm anh linh")
	ErrInsufficientGold = errors.New("thiên phú: không đủ vàng")
	ErrBagEntryMissing  = errors.New("thiên phú: không tìm thấy linh thạch")
	ErrBagFull          = errors.New("thiên phú: túi linh thạch đã đầy")
	ErrStoneMismatch    = errors.New("thiên phú: linh thạch không hợp lệ")
	ErrNotStoneSlot     = errors.New("thiên phú: không phải ô khảm")
	ErrSlotLocked       = errors.New("thiên phú: ô khảm chưa mở khóa")
	ErrSlotOccupied     = errors.New("thiên phú: ô khảm đã có linh thạch")
	ErrSlotEmpty        = errors.New("thiên phú: ô khảm trống")
	ErrItemMissing      = errors.New("thiên phú: thiếu định hướng phù")
)

type ItemPort interface {
	GetItemByID(ctx context.Context, charID int64, itemID int64) (*domainitem.Item, error)
	ConsumeItemStackByID(ctx context.Context, charID int64, itemID int64, count int) (*domainitem.Item, bool, error)
	AddItemWithBind(ctx context.Context, charID int64, templateID int, itemType domainitem.ItemType, stackCount int, isBound bool) (*domainitem.Item, error)
	IsDiamondItem(templateID int) bool
}

type GameData interface {
	GetPetTalent(id int) *models.PetTalentTemplate
	FindPetTalentBySidLv(sid, lv int) *models.PetTalentTemplate
	GetAllPetTalents() []*models.PetTalentTemplate
}

type Service struct {
	featureRepo domainfeature.Repository
	charRepo    domainchar.Repository
	items       ItemPort
	gameData    GameData
	logger      *zap.Logger

	rngMu sync.Mutex
	rng   *rand.Rand
}

func NewService(featureRepo domainfeature.Repository, charRepo domainchar.Repository, items ItemPort, gameData GameData, logger *zap.Logger) *Service {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Service{
		featureRepo: featureRepo,
		charRepo:    charRepo,
		items:       items,
		gameData:    gameData,
		logger:      logger,
		rng:         rand.New(rand.NewSource(time.Now().UnixNano())),
	}
}

func (s *Service) SetRandSeed(seed int64) {
	s.rngMu.Lock()
	defer s.rngMu.Unlock()
	s.rng = rand.New(rand.NewSource(seed))
}

func (s *Service) randIntn(n int) int {
	if n <= 1 {
		return 0
	}
	s.rngMu.Lock()
	defer s.rngMu.Unlock()
	return s.rng.Intn(n)
}

func (s *Service) loadState(ctx context.Context, charID int64) (*State, error) {
	states, err := s.featureRepo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("pettalent: load feature states: %w", err)
	}
	for _, st := range states {
		if st != nil && st.FeatureKey == featureKey {
			return stateFromMap(st.State), nil
		}
	}
	return defaultState(), nil
}

func (s *Service) saveState(ctx context.Context, charID int64, state *State) error {
	return s.featureRepo.UpsertCharacterFeatureState(ctx, &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  featureKey,
		State:       state.toPersist(),
	})
}

func (s *Service) loadChar(ctx context.Context, charID int64) (*domainchar.Character, error) {
	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("pettalent: load character: %w", err)
	}
	if char == nil {
		return nil, ErrCharacterMissing
	}
	return char, nil
}

func (s *Service) InitPanelData(ctx context.Context, charID int64) (map[string]interface{}, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	return map[string]interface{}{
		talKey:   state.toTal(),
		inTalKey: state.toInTal(),
		bagKey:   state.toBag(),
	}, nil
}

func (s *Service) talentLevel(tid int) int {
	if tid <= 0 {
		return 0
	}
	rec := s.gameData.GetPetTalent(tid)
	if rec == nil {
		return 0
	}
	return int(rec.Lv)
}

func deductGold(char *domainchar.Character, amount int) error {
	if amount <= 0 {
		return nil
	}
	if char.Gold < int64(amount) {
		return ErrInsufficientGold
	}
	char.Gold -= int64(amount)
	return nil
}

func deductPve(char *domainchar.Character, amount int) error {
	if amount <= 0 {
		return nil
	}
	if char.PvePoint < amount {
		return ErrInsufficientPve
	}
	char.PvePoint -= amount
	return nil
}
