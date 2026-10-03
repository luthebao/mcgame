// Open-sourced by BaoLT

// Pet Stone (Tụ Linh Bảo Thạch) application service. Persists the per-character
// stone bag (feature_key='pet_stone') and the per-equipment inlay map
// (feature_key='pet_stone_inlay') via domainfeature.Repository, and serves the
// panel RPCs:
//
//	initPetStonePanel / composePetStone / absorbPetStone / resolvePetStone (bag.go),
//	petStoneSet / removePetStone / getPetStoneByEid / changePetStoneEnergy (inlay.go).
//
// The energy-stone currency (cData["energyStone"], CurrencyEnergyStone=235) is
// mutated through char.AddCurrency / char.DeductCurrency; silver (char.Money)
// follows the codebase pattern of mutating char + charRepo.Update without a
// separate currency push (the client reconciles on its next sync).
//
// Stones never enter the normal item bag — they live entirely in this feature's
// own stone-bag state. The ItemPort interface is kept for parity with the
// stoneseal template and is unused by this feature today (no item consume/grant).
package petstone

import (
	"context"
	"errors"
	"fmt"
	"math/rand"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainfeature "mcgame-server/internal/domain/statfeature"
	gamedata "mcgame-server/internal/gamedata"

	"go.uber.org/zap"
)

const (
	bagFeatureKey   = domainfeature.FeaturePetStone
	inlayFeatureKey = domainfeature.FeaturePetStoneInlay

	currencyEnergyStone = domainchar.CurrencyEnergyStone

	energyCostPassive = 500
	energyCostSpecial = 1000
)

var (
	ErrCharacterMissing        = errors.New("tụ linh: không tìm thấy nhân vật")
	ErrInvalidSlot             = errors.New("tụ linh: ô túi không hợp lệ")
	ErrStoneNotFound           = errors.New("tụ linh: không tìm thấy bảo thạch")
	ErrInvalidQty              = errors.New("tụ linh: số lượng không hợp lệ")
	ErrInsufficientQty         = errors.New("tụ linh: không đủ bảo thạch")
	ErrNoNextTier              = errors.New("tụ linh: bảo thạch đã đạt cấp tối đa")
	ErrInsufficientSil         = errors.New("tụ linh: không đủ bạc")
	ErrInvalidInlaySlot        = errors.New("tụ linh: ô khảm không hợp lệ")
	ErrInlaySlotTaken          = errors.New("tụ linh: ô khảm đã có bảo thạch")
	ErrInlaySlotEmpty          = errors.New("tụ linh: ô khảm trống")
	ErrNotEnergyStone          = errors.New("tụ linh: không phải tụ linh thạch")
	ErrNotEnergySlot           = errors.New("tụ linh: ô không phải ô tụ linh")
	ErrInsufficientEnergyStone = errors.New("tụ linh: không đủ tụ linh thạch")
	ErrNoEnergyTarget          = errors.New("tụ linh: không tìm thấy tụ linh thạch mục tiêu")
	ErrAbsorbNeedsFive         = errors.New("tụ linh: cần đúng 5 bảo thạch cấp 5")
	ErrInvalidSkillType        = errors.New("tụ linh: loại kỹ năng không hợp lệ")
	ErrNoSkillPool             = errors.New("tụ linh: không có kỹ năng để khảm")
)

type ItemPort interface {
	GetItemByID(ctx context.Context, charID int64, itemID int64) (*domainitem.Item, error)
	ConsumeItemStackByID(ctx context.Context, charID int64, itemID int64, count int) (*domainitem.Item, bool, error)
	AddItemWithBind(ctx context.Context, charID int64, templateID int, itemType domainitem.ItemType, stackCount int, isBound bool) (*domainitem.Item, error)
	IsDiamondItem(templateID int) bool
}

type Service struct {
	featureRepo domainfeature.Repository
	charRepo    domainchar.Repository
	items       ItemPort
	gameData    *gamedata.Manager
	logger      *zap.Logger
	rng         func(n int) int
}

func NewService(featureRepo domainfeature.Repository, charRepo domainchar.Repository, items ItemPort, gameData *gamedata.Manager, logger *zap.Logger) *Service {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Service{featureRepo: featureRepo, charRepo: charRepo, items: items, gameData: gameData, logger: logger, rng: rand.Intn}
}

func (s *Service) pick(ids []int) int {
	if len(ids) == 0 {
		return 0
	}
	roll := s.rng
	if roll == nil {
		roll = rand.Intn
	}
	return ids[roll(len(ids))]
}

func (s *Service) loadBag(ctx context.Context, charID int64) (*BagState, error) {
	states, err := s.featureRepo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("petstone: load feature states: %w", err)
	}
	for _, st := range states {
		if st != nil && st.FeatureKey == bagFeatureKey {
			return bagStateFromMap(st.State), nil
		}
	}
	return defaultBagState(), nil
}

func (s *Service) saveBag(ctx context.Context, charID int64, state *BagState) error {
	return s.featureRepo.UpsertCharacterFeatureState(ctx, &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  bagFeatureKey,
		State:       state.toPersist(),
	})
}

func (s *Service) loadInlay(ctx context.Context, charID int64) (*InlayState, error) {
	states, err := s.featureRepo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("petstone: load inlay states: %w", err)
	}
	for _, st := range states {
		if st != nil && st.FeatureKey == inlayFeatureKey {
			return inlayStateFromMap(st.State), nil
		}
	}
	return defaultInlayState(), nil
}

func (s *Service) saveInlay(ctx context.Context, charID int64, state *InlayState) error {
	return s.featureRepo.UpsertCharacterFeatureState(ctx, &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  inlayFeatureKey,
		State:       state.toPersist(),
	})
}

func (s *Service) loadChar(ctx context.Context, charID int64) (*domainchar.Character, error) {
	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("petstone: load character: %w", err)
	}
	if char == nil {
		return nil, ErrCharacterMissing
	}
	return char, nil
}

func (s *Service) stone(giid int) *gamedataStone {
	if s.gameData == nil || giid <= 0 {
		return nil
	}
	t := s.gameData.GetPetStone(giid)
	if t == nil {
		return nil
	}
	return &gamedataStone{
		nextID:     int(t.NextID),
		costSil:    int(t.CostSil),
		resolveNum: int(t.ResolveNum),
		energyFlag: int(t.EnergyFlag),
		energyID:   int(t.EnergyID),
		level:      int(t.Level),
	}
}

type gamedataStone struct {
	nextID     int
	costSil    int
	resolveNum int
	energyFlag int
	energyID   int
	level      int
}
