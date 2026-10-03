// Open-sourced by BaoLT

// PRS — "Chân Hồn Thần Thú" (Pet Real Soul) application service. Persists the panel
// state (feature_key='prs') and serves the buildable RPCs: initPRSPanel,
// addSoulTreeLvl, movePRSChip, exchangePRSChip (this file) plus the divine-form
// operations replacePRSShow / cancelPRSShow / activePRSShow / activePRSShowSpe /
// updateActivePRSShow (forms.go).
//
// The chip collect/swap draws (freePRSCollect, goldPRSCollect, goldPRSCollectThree,
// swapPRSChip, swapPRSChipTimes) live in collect.go / swap.go and reuse this file's
// chipBag plumbing. activePRSShowSpe (tab=1 special forms) consumes a regular inventory
// item via the ItemConsumer interface (nil-guarded, wired at startup via SetItemConsumer).
//
// Currency deductions use char.DeductCurrency + charRepo.Update (no separate currency
// push, matching soul/mount/stoneseal). The soul-tree cost model assumes sequential
// node ids (tid = level); if TBL_PRS_TREE uses a NextID chain switch to
// GetPrsTree(currentTid).NextID. Calibrate against the live-log.
package prs

import (
	"context"
	"errors"
	"fmt"
	"math/rand"
	"strconv"
	"sync"
	"time"

	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata"

	"go.uber.org/zap"
)

const (
	featureKey      = domainfeature.FeaturePRS
	maxChipBagSlots = 100
	directionToExc  = 1
	directionToChip = 2
)

var (
	ErrCharacterMissing    = errors.New("prs: không tìm thấy nhân vật")
	ErrMaxTree             = errors.New("prs: cây chân hồn đã đạt tối đa")
	ErrInsufficientStone   = errors.New("prs: không đủ chân hồn thạch")
	ErrInsufficientCrystal = errors.New("prs: không đủ kết tinh thần dụ")
	ErrUnknownChip         = errors.New("prs: mảnh vỡ không hợp lệ")
	ErrUnknownShow         = errors.New("prs: hình dạng không hợp lệ")
	ErrInsufficientChips   = errors.New("prs: không đủ mảnh vỡ")
	ErrAlreadyActivated    = errors.New("prs: hình dạng đã kích hoạt")
	ErrChipBagFull         = errors.New("prs: túi mảnh vỡ đã đầy")
	ErrInvalidArgs         = errors.New("prs: tham số không hợp lệ")
)

type ItemConsumer interface {
	ConsumeItemsByTemplateID(ctx context.Context, charID int64, templateID int, count int) (bool, error)
}

type Service struct {
	featureRepo  domainfeature.Repository
	charRepo     domainchar.Repository
	gameData     *gamedata.Manager
	logger       *zap.Logger
	mu           sync.Mutex
	rng          *rand.Rand
	nowFn        func() time.Time
	itemConsumer ItemConsumer
}

func (s *Service) SetItemConsumer(ic ItemConsumer) {
	if s == nil || ic == nil {
		return
	}
	s.itemConsumer = ic
}

func NewService(featureRepo domainfeature.Repository, charRepo domainchar.Repository, gameData *gamedata.Manager, logger *zap.Logger) *Service {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Service{
		featureRepo: featureRepo,
		charRepo:    charRepo,
		gameData:    gameData,
		logger:      logger,
		rng:         rand.New(rand.NewSource(time.Now().UnixNano())),
		nowFn:       time.Now,
	}
}

func (s *Service) SetNowFunc(fn func() time.Time) {
	if fn != nil {
		s.nowFn = fn
	}
}

func (s *Service) SetRandSource(src rand.Source) {
	if src == nil {
		return
	}
	s.rng = rand.New(src)
}

func (s *Service) loadState(ctx context.Context, charID int64) (*State, error) {
	states, err := s.featureRepo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("prs: load feature states: %w", err)
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
		return nil, fmt.Errorf("prs: load character: %w", err)
	}
	if char == nil {
		return nil, ErrCharacterMissing
	}
	return char, nil
}

func (s *Service) GetPanel(ctx context.Context, charID int64) (map[string]interface{}, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	return state.toWire(), nil
}

func (s *Service) ChipBagWire(ctx context.Context, charID int64) (map[string]interface{}, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	return chipBagToWire(state.ChipBag), nil
}

func (s *Service) AddSoulTreeLvl(ctx context.Context, charID int64) (map[string]interface{}, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	currentTid, _ := strconv.Atoi(state.Tid)
	nextTid := currentTid + 1
	tpl := s.gameData.GetPrsTree(nextTid)
	if tpl == nil {
		return nil, ErrMaxTree
	}

	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, err
	}
	if err := char.DeductCurrency(domainchar.CurrencyRealSoulStone, int(tpl.CostStone)); err != nil {
		return nil, ErrInsufficientStone
	}
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, fmt.Errorf("prs: deduct soul stone: %w", err)
	}

	state.Tid = strconv.Itoa(nextTid)
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return state.toWire(), nil
}

func (s *Service) MoveChip(ctx context.Context, charID int64, fromPos, toPos, direction int) (*State, error) {
	if fromPos <= 0 || toPos <= 0 {
		return nil, ErrInvalidArgs
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	switch direction {
	case directionToExc:
		swapChipSlots(state.ChipBag, fromPos, state.ExcBag, toPos)
	case directionToChip:
		swapChipSlots(state.ExcBag, fromPos, state.ChipBag, toPos)
	default:
		return nil, ErrInvalidArgs
	}
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return state, nil
}

func (s *Service) ExchangeChip(ctx context.Context, charID int64, chipID int) (*State, *ChipReward, error) {
	tpl := s.gameData.GetPrsChip(chipID)
	if tpl == nil {
		return nil, nil, ErrUnknownChip
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, nil, err
	}
	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, nil, err
	}
	if err := char.DeductCurrency(domainchar.CurrencyRealSoulCrystal, int(tpl.CostCrystal)); err != nil {
		return nil, nil, ErrInsufficientCrystal
	}
	if !addChipToBag(state.ChipBag, chipID, 1) {
		return nil, nil, ErrChipBagFull
	}
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, nil, fmt.Errorf("prs: deduct crystal: %w", err)
	}
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, nil, err
	}
	reward := &ChipReward{TableID: tpl.TableID(), ID: chipID, Num: 1}
	return state, reward, nil
}

type ChipReward struct {
	TableID int
	ID      int
	Num     int
}

func swapChipSlots(fromBag map[int]ChipSlot, fromPos int, toBag map[int]ChipSlot, toPos int) {
	fromSlot, fromOK := fromBag[fromPos]
	toSlot, toOK := toBag[toPos]
	if toOK {
		fromBag[fromPos] = toSlot
	} else {
		delete(fromBag, fromPos)
	}
	if fromOK {
		toBag[toPos] = fromSlot
	} else {
		delete(toBag, toPos)
	}
}

func addChipToBag(bag map[int]ChipSlot, chipID, num int) bool {
	for pos, slot := range bag {
		if slot.ChipID == chipID {
			slot.ChipNum += num
			bag[pos] = slot
			return true
		}
	}
	pos := firstFreeChipPos(bag, maxChipBagSlots)
	if pos == 0 {
		return false
	}
	bag[pos] = ChipSlot{ChipID: chipID, ChipNum: num}
	return true
}

func consumeChips(bag map[int]ChipSlot, chipID, num int) bool {
	total := 0
	for _, slot := range bag {
		if slot.ChipID == chipID {
			total += slot.ChipNum
		}
	}
	if total < num {
		return false
	}
	remaining := num
	for pos, slot := range bag {
		if slot.ChipID != chipID || remaining <= 0 {
			continue
		}
		take := min(slot.ChipNum, remaining)
		slot.ChipNum -= take
		remaining -= take
		if slot.ChipNum <= 0 {
			delete(bag, pos)
		} else {
			bag[pos] = slot
		}
	}
	return true
}
