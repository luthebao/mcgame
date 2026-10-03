// Open-sourced by BaoLT

// Mount (Thú Cưỡi) application service: riding progression, evolution, dress
// ownership and equip state. State persists under character_feature_states
// feature_key='mount'; mount/dress templates come from TBL_MOUNT / TBL_MOUNT_DRESS.
package mount

import (
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"sort"
	"strconv"
	"time"

	appitem "mcgame-server/internal/application/item"
	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata"

	"go.uber.org/zap"
)

const (
	featureKeyMount      = domainfeature.FeatureMount
	mountLevItemTID      = 3804
	mountUpLevItemTID    = 3805
	advMountUpLevItemTID = 6273
	advUpLevThreshold    = 8
	mountInfoFallback    = `{"addRate":0,"addRateDay":"0|0|0","dressData":{},"exp":0,"getDate":0,"lv":0,"upLv":0,"useDress":-1}`
)

var (
	ErrCharacterNotFound = errors.New("không tìm thấy nhân vật")
	ErrDressNotOwned     = errors.New("chưa sở hữu hình ảnh thú cưỡi này")
	ErrInsufficientItem  = errors.New("không đủ vật phẩm")
	ErrInsufficientGold  = errors.New("không đủ vàng")
	ErrMaxLevel          = errors.New("thú cưỡi đã đạt cấp tối đa")
	ErrMaxRank           = errors.New("thú cưỡi đã đạt cảnh giới tối đa")
)

type Service struct {
	featureRepo domainfeature.Repository
	charRepo    domainchar.Repository
	itemService *appitem.Service
	gameData    *gamedata.Manager
	nowFunc     func() time.Time
	logger      *zap.Logger
}

func NewService(featureRepo domainfeature.Repository, charRepo domainchar.Repository, gameData *gamedata.Manager, logger *zap.Logger) *Service {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Service{
		featureRepo: featureRepo,
		charRepo:    charRepo,
		gameData:    gameData,
		nowFunc:     time.Now,
		logger:      logger,
	}
}

func (s *Service) SetItemService(svc *appitem.Service) {
	s.itemService = svc
}

func (s *Service) SetNowFunc(fn func() time.Time) {
	if fn != nil {
		s.nowFunc = fn
	}
}

func (s *Service) loadState(ctx context.Context, charID int64) (*MountState, error) {
	states, err := s.featureRepo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("mount: load feature states: %w", err)
	}
	for _, st := range states {
		if st != nil && st.FeatureKey == featureKeyMount {
			return mountStateFromMap(st.State), nil
		}
	}
	return defaultMountState(), nil
}

func (s *Service) saveState(ctx context.Context, charID int64, state *MountState) error {
	return s.featureRepo.UpsertCharacterFeatureState(ctx, &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  featureKeyMount,
		State:       state.ToMap(),
	})
}

func (s *Service) ownedDresses(state *MountState) map[int]int64 {
	owned := map[int]int64{}
	if s.gameData != nil {
		for lvl := 0; lvl <= state.UpLv; lvl++ {
			row := s.gameData.FindMountByTypeAndLevel(2, lvl)
			if row == nil {
				continue
			}
			if did := int(row.DressID); did > 0 {
				owned[did] = 1
			}
		}
	}
	for id, expiry := range state.ExtraDresses {
		if n, err := strconv.Atoi(id); err == nil {
			owned[n] = expiry
		}
	}
	return owned
}

func (s *Service) levelCap(upLv int) int {
	if s.gameData == nil {
		return 0
	}
	if row := s.gameData.FindMountByTypeAndLevel(2, upLv); row != nil {
		return int(row.MountLevLimit)
	}
	return 0
}

func (s *Service) MountInfoForLogin(ctx context.Context, charID int64) string {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		s.logger.Warn("mount: login load failed", zap.Int64("char_id", charID), zap.Error(err))
		return mountInfoFallback
	}
	return s.mountInfoJSON(state)
}

func (s *Service) mountInfoJSON(state *MountState) string {
	if state == nil {
		state = defaultMountState()
	}
	dressData := map[string]any{}
	for did := range s.ownedDresses(state) {
		dressData[strconv.Itoa(did)] = 1
	}
	obj := map[string]any{
		"addRate":    state.AddRate,
		"addRateDay": state.AddRateDay,
		"dressData":  dressData,
		"exp":        state.Exp,
		"getDate":    state.GetDate,
		"lv":         state.Lv,
		"upLv":       state.UpLv,
		"useDress":   state.UseDress,
	}
	b, err := json.Marshal(obj)
	if err != nil {
		return mountInfoFallback
	}
	return string(b)
}

func (s *Service) GetMountList(ctx context.Context, charID int64) (map[string]any, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	owned := s.ownedDresses(state)
	ids := make([]int, 0, len(owned))
	for id := range owned {
		ids = append(ids, id)
	}
	sort.Ints(ids)

	mountList := make([]int, 0, len(ids))
	overdue := make([]int64, 0, len(ids))
	for _, id := range ids {
		mountList = append(mountList, id)
		overdue = append(overdue, owned[id])
	}
	return map[string]any{
		"mountList":        mountList,
		"mountOverdueList": overdue,
		"useDress":         state.UseDress,
		"exp":              state.Exp,
		"addRate":          state.AddRate,
		"lev":              state.Lv,
		"upLv":             state.UpLv,
	}, nil
}

func (s *Service) CheckHaveMount(ctx context.Context, charID int64) (int, error) {
	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return 0, err
	}
	if char == nil {
		return 0, nil
	}
	if char.ClassRank >= 1 {
		return 1, nil
	}
	return 0, nil
}

func (s *Service) RenewMount(ctx context.Context, charID int64, dressID int) (int64, error) {
	dress := s.dressTemplate(dressID)
	if dress == nil {
		return 0, ErrDressNotOwned
	}
	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return 0, err
	}
	if char == nil {
		return 0, ErrCharacterNotFound
	}
	cost := int64(dress.Gold)
	if char.Gold < cost {
		return 0, ErrInsufficientGold
	}
	char.Gold -= cost
	if err := s.charRepo.Update(ctx, char); err != nil {
		return 0, fmt.Errorf("mount: deduct gold: %w", err)
	}

	state, err := s.loadState(ctx, charID)
	if err != nil {
		return 0, err
	}
	expiry := s.nowFunc().Add(30 * 24 * time.Hour).UnixMilli()
	state.ExtraDresses[strconv.Itoa(dressID)] = expiry
	if err := s.saveState(ctx, charID, state); err != nil {
		return 0, err
	}
	return expiry, nil
}

func (s *Service) dressTemplate(dressID int) *gamedataMountDress {
	if s.gameData == nil {
		return nil
	}
	if tpl := s.gameData.GetMountDress(dressID); tpl != nil {
		return &gamedataMountDress{Gold: int(tpl.Gold)}
	}
	return nil
}

type gamedataMountDress struct {
	Gold int
}
