// Open-sourced by BaoLT

// Stone Seal (Ấn Thạch DURRAS) application service. Persists the per-equip seal
// state (feature_key='stone_seal') and serves the panel RPCs: stoneSealGetData,
// stoneSealSetStone, stoneSealRemoveStone, stoneSealRemoveAllStone,
// stoneSealSwapStone (this file) plus stoneSealBore / stoneSealSuccinct (upgrade.go).
//
// Stones are consumed from / returned to the normal item bag via ItemPort. The
// returned stone item type defaults to ItemTypeMaterial (the persisted state only
// keeps the template id; calibrate against live-log if a stone is a consumable).
// Currency deductions (stoneSealPoint dust / gold) follow the codebase pattern of
// mutating char + charRepo.Update without a separate currency push (the client
// reconciles on its next sync), matching soul/mount.
package stoneseal

import (
	"context"
	"errors"
	"fmt"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainfeature "mcgame-server/internal/domain/statfeature"

	"go.uber.org/zap"
)

const featureKey = domainfeature.FeatureStoneSeal

var (
	ErrInvalidEquip     = errors.New("ấn thạch: vị trí trang bị không hợp lệ")
	ErrInvalidSeal      = errors.New("ấn thạch: vị trí ô không hợp lệ")
	ErrHoleNotBored     = errors.New("ấn thạch: ô chưa khai mở")
	ErrHoleOccupied     = errors.New("ấn thạch: ô đã có ấn thạch")
	ErrHoleEmpty        = errors.New("ấn thạch: ô trống")
	ErrHoleAlreadyBored = errors.New("ấn thạch: ô đã khai mở")
	ErrAllHolesBored    = errors.New("ấn thạch: đã khai mở tối đa")
	ErrMaxSealLevel     = errors.New("ấn thạch: cấp kết ấn đã tối đa")
	ErrItemNotFound     = errors.New("ấn thạch: không tìm thấy vật phẩm")
	ErrNotDiamond       = errors.New("ấn thạch: vật liệu không hợp lệ")
	ErrInsufficientDust = errors.New("ấn thạch: không đủ bụi ấn thạch")
	ErrInsufficientGold = errors.New("ấn thạch: không đủ vàng")
	ErrCharacterMissing = errors.New("ấn thạch: không tìm thấy nhân vật")
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
	logger      *zap.Logger
}

func NewService(featureRepo domainfeature.Repository, charRepo domainchar.Repository, items ItemPort, logger *zap.Logger) *Service {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Service{featureRepo: featureRepo, charRepo: charRepo, items: items, logger: logger}
}

func (s *Service) loadState(ctx context.Context, charID int64) (*State, error) {
	states, err := s.featureRepo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("stoneseal: load feature states: %w", err)
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

func (s *Service) GetData(ctx context.Context, charID int64) (map[string]interface{}, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	return state.toStone(), nil
}

func (s *Service) SetStone(ctx context.Context, charID int64, equipSid, sealIndex int, stoneItemID int64) (map[string]interface{}, error) {
	if err := validateEquip(equipSid); err != nil {
		return nil, err
	}
	if err := validateSeal(sealIndex); err != nil {
		return nil, err
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	entry := state.entry(equipSid)
	switch v, ok := entry.Data[sealIndex]; {
	case !ok:
		return nil, ErrHoleNotBored
	case v > EmptyHole:
		return nil, ErrHoleOccupied
	}

	item, err := s.items.GetItemByID(ctx, charID, stoneItemID)
	if err != nil {
		return nil, fmt.Errorf("stoneseal: lookup stone: %w", err)
	}
	if item == nil {
		return nil, ErrItemNotFound
	}
	templateID := item.TemplateID
	if _, _, err := s.items.ConsumeItemStackByID(ctx, charID, stoneItemID, 1); err != nil {
		return nil, fmt.Errorf("stoneseal: consume stone: %w", err)
	}

	entry.Data[sealIndex] = templateID
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return state.toStone(), nil
}

func (s *Service) RemoveStone(ctx context.Context, charID int64, equipSid, sealIndex int) (map[string]interface{}, error) {
	if err := validateEquip(equipSid); err != nil {
		return nil, err
	}
	if err := validateSeal(sealIndex); err != nil {
		return nil, err
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	entry := state.entry(equipSid)
	templateID, ok := entry.Data[sealIndex]
	if !ok || templateID <= EmptyHole {
		return nil, ErrHoleEmpty
	}

	entry.Data[sealIndex] = EmptyHole
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	s.returnStone(ctx, charID, templateID)
	return state.toStone(), nil
}

func (s *Service) RemoveAllStone(ctx context.Context, charID int64, equipSid int) (map[string]interface{}, error) {
	if err := validateEquip(equipSid); err != nil {
		return nil, err
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	entry := state.entry(equipSid)
	removed := make([]int, 0, len(entry.Data))
	for idx, v := range entry.Data {
		if v > EmptyHole {
			removed = append(removed, v)
			entry.Data[idx] = EmptyHole
		}
	}
	if len(removed) == 0 {
		return state.toStone(), nil
	}
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	for _, templateID := range removed {
		s.returnStone(ctx, charID, templateID)
	}
	return state.toStone(), nil
}

func (s *Service) SwapStone(ctx context.Context, charID int64, equipSid, idx1, idx2 int) (map[string]interface{}, error) {
	if err := validateEquip(equipSid); err != nil {
		return nil, err
	}
	if err := validateSeal(idx1); err != nil {
		return nil, err
	}
	if err := validateSeal(idx2); err != nil {
		return nil, err
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	entry := state.entry(equipSid)
	v1, ok1 := entry.Data[idx1]
	v2, ok2 := entry.Data[idx2]
	if !ok1 || !ok2 {
		return nil, ErrHoleNotBored
	}
	entry.Data[idx1], entry.Data[idx2] = v2, v1
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return state.toStone(), nil
}

func (s *Service) returnStone(ctx context.Context, charID int64, templateID int) {
	if templateID <= 0 {
		return
	}
	if _, err := s.items.AddItemWithBind(ctx, charID, templateID, domainitem.ItemTypeMaterial, 1, false); err != nil {
		s.logger.Warn("stoneseal: return stone to bag failed",
			zap.Int64("char_id", charID), zap.Int("template_id", templateID), zap.Error(err))
	}
}

func validateEquip(equipSid int) error {
	if equipSid < MinEquipSid || equipSid > MaxEquipSid {
		return ErrInvalidEquip
	}
	return nil
}

func validateSeal(sealIndex int) error {
	if sealIndex < MinSealIndex || sealIndex > MaxSealIndex {
		return ErrInvalidSeal
	}
	return nil
}
