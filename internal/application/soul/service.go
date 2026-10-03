// Open-sourced by BaoLT

// Soul Gem (Mệnh Hồn) application service: char + per-pet soul-slot persistence,
// the login soulBagData / soulInfo / tempSoulData blobs, and the slot-management RPCs.
// Deterministic + exp-pool ops live in service.go/ops.go (openBag, lockSoul,
// soulLevelUp, putInToExp, transformExp). Acquisition + movement ops live in
// acquire.go (preySoul gacha, exchangeSoul), movement.go (putSoulToBag, openPetSoulBag)
// and swap.go (the drag-swap MoveSoul). State persists under character_feature_states
// feature_key='soul' (char) and the pet feature-state table feature_key='pet_soul'.
//
// One calibration gap remains: the preySoul drop pool (see acquire.go preyCrystalPool)
// is a documented assumption (group by data_tbl_pet_soul.color tier, uniform-within-tier)
// until a preySoul live-log lands. The drag-swap inbound verb name is likewise
// unconfirmed (see swap.go). crystalSid (last-selected soul-crystal, a top-level login
// scalar) persists here; PreySoul is its real writer (SetCrystalSid remains a seed path),
// CrystalSidForLogin emits it. TempSoulDataForLogin emits the persisted preySoul temp bag.
package soul

import (
	"context"
	"errors"
	"fmt"

	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

const (
	featureKeyChar  = domainfeature.FeatureSoul
	featureKeyPet   = domainfeature.FeaturePetSoul
	openBagGoldCost = 10
	defaultUpExp    = 100
)

var (
	ErrCharacterNotFound = errors.New("không tìm thấy nhân vật")
	ErrBagFull           = errors.New("túi mệnh hồn đã mở tối đa")
	ErrInsufficientGold  = errors.New("không đủ vàng")
	ErrInsufficientExp   = errors.New("không đủ điểm kinh nghiệm mệnh hồn")
	ErrInsufficientChip  = errors.New("không đủ mảnh mệnh hồn")
	ErrSlotEmpty         = errors.New("ô mệnh hồn trống")
	ErrSlotLocked        = errors.New("mệnh hồn đang khóa")
	ErrInvalidCrystal    = errors.New("pha lê không hợp lệ")
	ErrTempBagFull       = errors.New("túi tạm mệnh hồn đã đầy")
	ErrEmptyPool         = errors.New("không có mệnh hồn để săn")
	ErrTempSlotEmpty     = errors.New("ô tạm trống")
	ErrPetBagMaxed       = errors.New("túi mệnh hồn thú đã mở tối đa")
	ErrPetBagLocked      = errors.New("chưa đủ điều kiện mở túi mệnh hồn thú")
)

type Service struct {
	featureRepo domainfeature.Repository
	charRepo    domainchar.Repository
	gameData    *gamedata.Manager
	logger      *zap.Logger
}

func NewService(featureRepo domainfeature.Repository, charRepo domainchar.Repository, gameData *gamedata.Manager, logger *zap.Logger) *Service {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Service{featureRepo: featureRepo, charRepo: charRepo, gameData: gameData, logger: logger}
}

func (s *Service) loadCharState(ctx context.Context, charID int64) (*CharSoulState, error) {
	states, err := s.featureRepo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("soul: load char feature states: %w", err)
	}
	for _, st := range states {
		if st != nil && st.FeatureKey == featureKeyChar {
			return charSoulStateFromMap(st.State), nil
		}
	}
	return defaultCharSoulState(), nil
}

func (s *Service) saveCharState(ctx context.Context, charID int64, state *CharSoulState) error {
	return s.featureRepo.UpsertCharacterFeatureState(ctx, &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  featureKeyChar,
		State:       state.ToMap(),
	})
}

func (s *Service) loadPetState(ctx context.Context, petID int64) (*PetSoulState, error) {
	states, err := s.featureRepo.ListPetFeatureStates(ctx, petID)
	if err != nil {
		return nil, fmt.Errorf("soul: load pet feature states: %w", err)
	}
	for _, st := range states {
		if st != nil && st.FeatureKey == featureKeyPet {
			return petSoulStateFromMap(st.State), nil
		}
	}
	return defaultPetSoulState(), nil
}

func (s *Service) savePetState(ctx context.Context, petID int64, state *PetSoulState) error {
	return s.featureRepo.UpsertPetFeatureState(ctx, &domainfeature.PetFeatureState{
		PetID:      petID,
		FeatureKey: featureKeyPet,
		State:      state.ToMap(),
	})
}

func (s *Service) SoulBagDataForLogin(ctx context.Context, charID int64) map[string]any {
	state, err := s.loadCharState(ctx, charID)
	if err != nil {
		s.logger.Warn("soul: login bag load failed", zap.Int64("char_id", charID), zap.Error(err))
		return map[string]any{"open": 0, "data": map[string]any{}}
	}
	return state.LoginObj()
}

func (s *Service) CrystalSidForLogin(ctx context.Context, charID int64) int {
	state, err := s.loadCharState(ctx, charID)
	if err != nil {
		s.logger.Warn("soul: login crystalSid load failed", zap.Int64("char_id", charID), zap.Error(err))
		return 0
	}
	return state.CrystalSid
}

func (s *Service) TempSoulDataForLogin(ctx context.Context, charID int64) map[string]any {
	state, err := s.loadCharState(ctx, charID)
	if err != nil {
		s.logger.Warn("soul: login tempSoulData load failed", zap.Int64("char_id", charID), zap.Error(err))
		return map[string]any{}
	}
	return state.TempBagWire()
}

func (s *Service) SetCrystalSid(ctx context.Context, charID int64, crystalSid int) error {
	if crystalSid < 0 {
		crystalSid = 0
	}
	state, err := s.loadCharState(ctx, charID)
	if err != nil {
		return err
	}
	state.CrystalSid = crystalSid
	return s.saveCharState(ctx, charID, state)
}

func (s *Service) PetSoulInfo(ctx context.Context, petID int64) map[string]any {
	state, err := s.loadPetState(ctx, petID)
	if err != nil {
		s.logger.Warn("soul: login pet info load failed", zap.Int64("pet_id", petID), zap.Error(err))
		return map[string]any{"openNum": 0, "openNum2": 0, "data": map[string]any{}}
	}
	return state.LoginObj()
}

func (s *Service) OpenBag(ctx context.Context, charID int64) (int, error) {
	state, err := s.loadCharState(ctx, charID)
	if err != nil {
		return 0, err
	}
	if state.Open >= maxCharSoulSlots {
		return 0, ErrBagFull
	}
	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return 0, err
	}
	if char == nil {
		return 0, ErrCharacterNotFound
	}
	if char.Gold < openBagGoldCost {
		return 0, ErrInsufficientGold
	}
	char.Gold -= openBagGoldCost
	if err := s.charRepo.Update(ctx, char); err != nil {
		return 0, fmt.Errorf("soul: deduct gold: %w", err)
	}
	state.Open++
	if err := s.saveCharState(ctx, charID, state); err != nil {
		return 0, err
	}
	return state.Open, nil
}

func (s *Service) LockSoul(ctx context.Context, charID int64, slot int) (bool, error) {
	state, err := s.loadCharState(ctx, charID)
	if err != nil {
		return false, err
	}
	gem, ok := state.Slots[slot]
	if !ok {
		return false, ErrSlotEmpty
	}
	gem.Lock = !gem.Lock
	state.Slots[slot] = gem
	if err := s.saveCharState(ctx, charID, state); err != nil {
		return false, err
	}
	return gem.Lock, nil
}

func (s *Service) AddSoulToSlot(ctx context.Context, charID int64, slot, sid int, exp int64) error {
	state, err := s.loadCharState(ctx, charID)
	if err != nil {
		return err
	}
	if slot <= 0 {
		slot = s.firstFreeSlot(state)
	}
	if slot <= 0 {
		return ErrBagFull
	}
	state.Slots[slot] = SoulSlot{Sid: sid, Exp: exp}
	return s.saveCharState(ctx, charID, state)
}

func (s *Service) firstFreeSlot(state *CharSoulState) int {
	for i := 1; i <= state.Open; i++ {
		if _, taken := state.Slots[i]; !taken {
			return i
		}
	}
	return 0
}

func (s *Service) petSoulTemplate(sid int) *models.PetSoulTemplate {
	if s.gameData == nil || sid <= 0 {
		return nil
	}
	return s.gameData.GetPetSoul(sid)
}

func (s *Service) upExpFor(sid int) int64 {
	if s.gameData == nil || sid <= 0 {
		return defaultUpExp
	}
	if tpl := s.gameData.GetPetSoul(sid); tpl != nil && tpl.UpExp > 0 {
		return int64(tpl.UpExp)
	}
	return defaultUpExp
}

func (s *Service) dissolveChip(sid int) int64 {
	if s.gameData == nil || sid <= 0 {
		return 0
	}
	if tpl := s.gameData.GetPetSoul(sid); tpl != nil {
		return int64(tpl.Chip)
	}
	return 0
}
