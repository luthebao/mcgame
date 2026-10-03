// Open-sourced by BaoLT

// Magic estate service manages Fazenda RPC state stored in dedicated tables.
package farm

import (
	"context"
	"errors"
	"fmt"
	"sort"
	"time"

	domainchar "mcgame-server/internal/domain/character"
	domainfarm "mcgame-server/internal/domain/farm"
	domainsocial "mcgame-server/internal/domain/social"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

var (
	ErrMagicEstateUnavailable        = errors.New("magic estate service is unavailable")
	ErrMagicEstateInvalidSlot        = errors.New("invalid magic estate slot")
	ErrMagicEstateInvalidMineral     = errors.New("invalid magic estate mineral")
	ErrMagicEstateSlotLocked         = errors.New("magic estate slot locked")
	ErrMagicEstateSlotCoolingDown    = errors.New("magic estate slot cooling down")
	ErrMagicEstateSlotEmpty          = errors.New("magic estate slot empty")
	ErrMagicEstateInsufficientMoney  = errors.New("not enough money bind")
	ErrMagicEstateInsufficientAction = errors.New("not enough actpoint")
	ErrMagicEstateFarmNumCapped      = errors.New("magic estate farm count capped")
	ErrMagicEstateFrozen             = errors.New("magic estate slot frozen")
	ErrMagicEstateInsufficientMove   = errors.New("not enough move point")
)

var magicEstateLevelConfigs = []struct {
	Exp     int
	MaxFarm int
}{
	{Exp: 60, MaxFarm: 4},
	{Exp: 240, MaxFarm: 6},
	{Exp: 640, MaxFarm: 8},
	{Exp: 1920, MaxFarm: 12},
	{Exp: 1921, MaxFarm: 16},
}

var magicEstateFarmNumCosts = []int64{
	0,
	0,
	30000,
	60000,
	120000,
	210000,
	330000,
	480000,
	660000,
	960000,
	1380000,
	1920000,
	2620000,
	3480000,
	4500000,
	5680000,
}

const (
	magicEstateBattleWin  = 1
	magicEstateBattleLose = 2
	magicEstateBattleDraw = -1
	magicEstateStealCost  = 10
)

type MagicEstateCharacterRepository interface {
	FindByID(ctx context.Context, id int64) (*domainchar.Character, error)
	Update(ctx context.Context, character *domainchar.Character) error
}

type MagicEstateFriendRepository interface {
	FindFriends(ctx context.Context, characterID int64) ([]*domainsocial.Relationship, error)
}

type MagicEstateView struct {
	Character *domainchar.Character
	Profile   *domainfarm.MagicEstateProfile
}

type AddMineralResult struct {
	Character  *domainchar.Character
	Profile    *domainfarm.MagicEstateProfile
	Slot       *domainfarm.MagicEstateSlot
	Mineral    *models.MineralTemplateTemplate
	SpentMoney int64
	CooldownAt int64
	CappedExp  bool
}

type HarvestMineResult struct {
	Character  *domainchar.Character
	Profile    *domainfarm.MagicEstateProfile
	Slot       *domainfarm.MagicEstateSlot
	BagSlot    *domainfarm.MagicEstateBagSlot
	RewardName string
	RewardTid  int
	RewardNum  int
	CooldownAt int64
}

type AddFarmNumResult struct {
	Character *domainchar.Character
	Profile   *domainfarm.MagicEstateProfile
	Cost      int64
}

type FarmLvUpResult struct {
	Character *domainchar.Character
	Profile   *domainfarm.MagicEstateProfile
	Cost      int64
}

type SteelMineResult struct {
	OwnerCharacterID     int64
	HarvesterCharacterID int64
	OwnerProfile         *domainfarm.MagicEstateProfile
	HarvesterProfile     *domainfarm.MagicEstateProfile
	OwnerCharacter       *domainchar.Character
	HarvesterCharacter   *domainchar.Character
	Log                  *domainfarm.MagicEstateLog
	RewardName           string
}

type MagicEstateService struct {
	estateRepo domainfarm.MagicEstateRepository
	charRepo   MagicEstateCharacterRepository
	friendRepo MagicEstateFriendRepository
	gameData   *gamedata.Manager
	logger     *zap.Logger
}

func NewMagicEstateService(estateRepo domainfarm.MagicEstateRepository, charRepo MagicEstateCharacterRepository, friendRepo MagicEstateFriendRepository, gameData *gamedata.Manager, logger *zap.Logger) *MagicEstateService {
	return &MagicEstateService{
		estateRepo: estateRepo,
		charRepo:   charRepo,
		friendRepo: friendRepo,
		gameData:   gameData,
		logger:     logger,
	}
}

func (s *MagicEstateService) GetEstateView(ctx context.Context, characterID int64) (*MagicEstateView, error) {
	if s.charRepo == nil || s.estateRepo == nil {
		return nil, ErrMagicEstateUnavailable
	}

	character, err := s.charRepo.FindByID(ctx, characterID)
	if err != nil {
		return nil, err
	}

	profile, err := s.estateRepo.FindByCharacter(ctx, characterID)
	if err != nil {
		return nil, err
	}
	if profile == nil {
		profile = domainfarm.NewMagicEstateProfile(character.ID, character.Level)
	}
	profile.Normalize(character.Level, time.Now())

	return &MagicEstateView{
		Character: character,
		Profile:   profile,
	}, nil
}

func (s *MagicEstateService) GetFriendEstateViews(ctx context.Context, characterID int64) (map[int64]*MagicEstateView, error) {
	if s.friendRepo == nil {
		return map[int64]*MagicEstateView{}, nil
	}

	friends, err := s.friendRepo.FindFriends(ctx, characterID)
	if err != nil {
		return nil, err
	}

	result := make(map[int64]*MagicEstateView, len(friends))
	for _, friend := range friends {
		if friend == nil || friend.OtherID <= 0 {
			continue
		}
		view, err := s.GetEstateView(ctx, friend.OtherID)
		if err != nil {
			s.logger.Warn("Failed to load friend magic estate",
				zap.Int64("character_id", characterID),
				zap.Int64("friend_id", friend.OtherID),
				zap.Error(err))
			continue
		}
		result[friend.OtherID] = view
	}

	return result, nil
}

func (s *MagicEstateService) GetFarmBag(ctx context.Context, characterID int64) (map[string]interface{}, error) {
	view, err := s.GetEstateView(ctx, characterID)
	if err != nil {
		return nil, err
	}

	return domainfarm.BuildMagicEstateBagDTO(view.Profile), nil
}

func (s *MagicEstateService) GetFarmBagSlot(ctx context.Context, characterID int64, slotIndex int) (*domainfarm.MagicEstateBagSlot, error) {
	view, err := s.GetEstateView(ctx, characterID)
	if err != nil {
		return nil, err
	}
	if view.Profile.Bag == nil {
		return nil, nil
	}
	return view.Profile.Bag[slotIndex], nil
}

func (s *MagicEstateService) GetAllFarmBagSlots(ctx context.Context, characterID int64) ([]*domainfarm.MagicEstateBagSlot, error) {
	view, err := s.GetEstateView(ctx, characterID)
	if err != nil {
		return nil, err
	}
	if len(view.Profile.Bag) == 0 {
		return []*domainfarm.MagicEstateBagSlot{}, nil
	}

	slotIndexes := make([]int, 0, len(view.Profile.Bag))
	for slotIndex := range view.Profile.Bag {
		slotIndexes = append(slotIndexes, slotIndex)
	}
	sort.Ints(slotIndexes)

	result := make([]*domainfarm.MagicEstateBagSlot, 0, len(slotIndexes))
	for _, slotIndex := range slotIndexes {
		if slot := view.Profile.Bag[slotIndex]; slot != nil {
			result = append(result, slot)
		}
	}
	return result, nil
}

func (s *MagicEstateService) RemoveFarmBagSlots(ctx context.Context, characterID int64, slotIndexes []int) (map[string]interface{}, error) {
	view, err := s.GetEstateView(ctx, characterID)
	if err != nil {
		return nil, err
	}
	if len(slotIndexes) == 0 {
		return map[string]interface{}{}, nil
	}

	delta := make(map[string]interface{}, len(slotIndexes))
	for _, slotIndex := range slotIndexes {
		delete(view.Profile.Bag, slotIndex)
		delta[fmt.Sprintf("%d", slotIndex)] = nil
	}

	if err := s.persistView(ctx, view); err != nil {
		return nil, err
	}
	return delta, nil
}

func (s *MagicEstateService) GetFarmLog(ctx context.Context, characterID int64) (map[string]interface{}, error) {
	if _, err := s.GetEstateView(ctx, characterID); err != nil {
		return nil, err
	}
	logs, err := s.estateRepo.FindLogsByCharacter(ctx, characterID, 100)
	if err != nil {
		return nil, err
	}
	result := make(map[string]interface{}, len(logs))
	for _, log := range logs {
		if log == nil {
			continue
		}
		result[fmt.Sprintf("%d", log.ID)] = map[string]interface{}{
			"logTime":  log.LogTime,
			"result":   log.Result,
			"guest":    log.Guest,
			"cid":      fmt.Sprintf("%d", log.CID),
			"tid":      fmt.Sprintf("%d", log.TID),
			"name":     log.Name,
			"id":       log.ItemTemplateID,
			"num":      log.Num,
			"noreplay": log.NoReplay,
			"bid":      fmt.Sprintf("%d", log.BattleID),
		}
	}
	return result, nil
}

func (s *MagicEstateService) GetReplayList(ctx context.Context, characterID int64) (map[string]interface{}, error) {
	if _, err := s.GetEstateView(ctx, characterID); err != nil {
		return nil, err
	}
	replays, err := s.estateRepo.FindSavedReplaysByCharacter(ctx, characterID, 50)
	if err != nil {
		return nil, err
	}
	result := make(map[string]interface{}, len(replays))
	for _, replay := range replays {
		if replay == nil {
			continue
		}
		key := fmt.Sprintf("%d", replay.BattleID)
		result[key] = map[string]interface{}{
			"id":        key,
			"battleId":  key,
			"name":      replay.Name,
			"timestamp": replay.Timestamp,
		}
	}
	return result, nil
}

func (s *MagicEstateService) SaveReplay(ctx context.Context, characterID int64, name string, battleID int64) (*domainfarm.MagicEstateReplay, error) {
	if _, err := s.GetEstateView(ctx, characterID); err != nil {
		return nil, err
	}

	replay := &domainfarm.MagicEstateReplay{
		CharacterID: characterID,
		BattleID:    battleID,
		Name:        name,
		Timestamp:   time.Now().Format("2006-01-02 15:04:05"),
	}
	if err := s.estateRepo.SaveReplay(ctx, replay); err != nil {
		return nil, err
	}
	return replay, nil
}

func (s *MagicEstateService) DeleteReplay(ctx context.Context, characterID int64, battleID int64) error {
	if _, err := s.GetEstateView(ctx, characterID); err != nil {
		return err
	}
	return s.estateRepo.DeleteReplay(ctx, characterID, battleID)
}

func (s *MagicEstateService) AddMineral(ctx context.Context, characterID int64, slotID int, mineralID int) (*AddMineralResult, error) {
	view, err := s.GetEstateView(ctx, characterID)
	if err != nil {
		return nil, err
	}

	if slotID < 1 || slotID > domainfarm.MagicEstateMaxSlots {
		return nil, ErrMagicEstateInvalidSlot
	}
	if slotID > view.Profile.FarmNum {
		return nil, ErrMagicEstateSlotLocked
	}

	mineral := s.getMineralTemplate(mineralID)
	if mineral == nil {
		return nil, ErrMagicEstateInvalidMineral
	}

	if existing := view.Profile.Slots[slotID]; existing != nil {
		if existing.HavestFlag && existing.CooldownEndsAt > time.Now().UnixMilli() {
			return &AddMineralResult{
				Character:  view.Character,
				Profile:    view.Profile,
				Slot:       existing,
				Mineral:    mineral,
				CooldownAt: existing.CooldownEndsAt,
			}, ErrMagicEstateSlotCoolingDown
		}
		return nil, ErrMagicEstateSlotLocked
	}

	cost := int64(mineral.Money)
	actCost := int(mineral.ActPnt)
	if view.Character.MoneyBind < cost {
		return nil, ErrMagicEstateInsufficientMoney
	}
	if view.Profile.Actpoint < actCost {
		return nil, ErrMagicEstateInsufficientAction
	}

	view.Character.MoneyBind -= cost
	view.Profile.Actpoint -= actCost

	if view.Profile.Exp < domainfarm.MagicEstateMaxExp {
		view.Profile.Exp++
	}

	now := time.Now().UnixMilli()
	slot := &domainfarm.MagicEstateSlot{
		SlotID:         slotID,
		MineralID:      mineralID,
		Num:            int(mineral.Num),
		MaxNum:         int(mineral.Num),
		CooldownEndsAt: now,
		HavestFlag:     false,
	}
	view.Profile.Slots[slotID] = slot

	if err := s.persistView(ctx, view); err != nil {
		return nil, err
	}

	return &AddMineralResult{
		Character:  view.Character,
		Profile:    view.Profile,
		Slot:       slot,
		Mineral:    mineral,
		SpentMoney: cost,
		CappedExp:  view.Profile.Exp >= domainfarm.MagicEstateMaxExp,
	}, nil
}

func (s *MagicEstateService) HarvestMine(ctx context.Context, characterID int64, slotID int) (*HarvestMineResult, error) {
	view, err := s.GetEstateView(ctx, characterID)
	if err != nil {
		return nil, err
	}

	slot, ok := view.Profile.Slots[slotID]
	if !ok || slot == nil {
		return nil, ErrMagicEstateSlotEmpty
	}
	if slot.HavestFlag {
		return nil, ErrMagicEstateSlotCoolingDown
	}

	mineral := s.getMineralTemplate(slot.MineralID)
	if mineral == nil {
		return nil, ErrMagicEstateInvalidMineral
	}

	rewardTid := int(mineral.Tid)
	rewardNum := slot.Num
	bagSlot := upsertFarmBagSlot(view.Profile, rewardTid, rewardNum, 0)
	cooldownAt := time.Now().Add(time.Duration(mineral.Time) * time.Minute).UnixMilli()

	slot.HavestFlag = true
	slot.CooldownEndsAt = cooldownAt
	view.Profile.Slots[slotID] = slot

	if err := s.persistView(ctx, view); err != nil {
		return nil, err
	}

	return &HarvestMineResult{
		Character:  view.Character,
		Profile:    view.Profile,
		Slot:       slot,
		BagSlot:    bagSlot,
		RewardName: s.getItemName(rewardTid),
		RewardTid:  rewardTid,
		RewardNum:  rewardNum,
		CooldownAt: cooldownAt,
	}, nil
}

func (s *MagicEstateService) AddFarmNum(ctx context.Context, characterID int64) (*AddFarmNumResult, error) {
	view, err := s.GetEstateView(ctx, characterID)
	if err != nil {
		return nil, err
	}

	if view.Profile.FarmNum >= domainfarm.MagicEstateMaxSlots {
		return nil, ErrMagicEstateFarmNumCapped
	}

	maxFarm := magicEstateMaxFarmByExp(view.Profile.Exp)
	if view.Profile.FarmNum >= maxFarm {
		return nil, ErrMagicEstateFarmNumCapped
	}

	cost := magicEstateFarmNumCost(view.Profile.FarmNum)
	if view.Character.MoneyBind < cost {
		return nil, ErrMagicEstateInsufficientMoney
	}

	view.Character.MoneyBind -= cost
	view.Profile.FarmNum++

	if err := s.persistView(ctx, view); err != nil {
		return nil, err
	}

	return &AddFarmNumResult{
		Character: view.Character,
		Profile:   view.Profile,
		Cost:      cost,
	}, nil
}

func (s *MagicEstateService) FarmLvUp(ctx context.Context, characterID int64) (*FarmLvUpResult, error) {
	view, err := s.GetEstateView(ctx, characterID)
	if err != nil {
		return nil, err
	}

	currentLevelIndex := magicEstateLevelIndexByExp(view.Profile.Exp)
	if currentLevelIndex >= len(magicEstateLevelConfigs)-1 {
		return nil, ErrMagicEstateFarmNumCapped
	}

	levelCfg := magicEstateLevelConfigs[currentLevelIndex]
	if view.Profile.Exp < levelCfg.Exp {
		return nil, ErrMagicEstateFarmNumCapped
	}

	cost := magicEstateLevelUpCost(currentLevelIndex)
	if view.Character.MoneyBind < cost {
		return nil, ErrMagicEstateInsufficientMoney
	}

	view.Character.MoneyBind -= cost
	view.Profile.Exp++
	view.Profile.Normalize(view.Character.Level, time.Now())

	if err := s.persistView(ctx, view); err != nil {
		return nil, err
	}

	return &FarmLvUpResult{
		Character: view.Character,
		Profile:   view.Profile,
		Cost:      cost,
	}, nil
}

func (s *MagicEstateService) GetActpoint(ctx context.Context, characterID int64, fallbackLevel int) (int, int) {
	if s.estateRepo == nil {
		maxActpoint := domainfarm.DefaultMagicEstateMaxActpoint(fallbackLevel)
		return maxActpoint, maxActpoint
	}
	profile, err := s.estateRepo.FindByCharacter(ctx, characterID)
	if err != nil || profile == nil {
		maxActpoint := domainfarm.DefaultMagicEstateMaxActpoint(fallbackLevel)
		return maxActpoint, maxActpoint
	}
	profile.Normalize(fallbackLevel, time.Now())
	return profile.Actpoint, profile.MaxActpoint
}

func (s *MagicEstateService) GetMovePnt(ctx context.Context, characterID int64, fallbackLevel int) (int, int) {
	if s.estateRepo == nil {
		maxMovePnt := domainfarm.DefaultMagicEstateMaxMovePnt(fallbackLevel)
		return maxMovePnt, maxMovePnt
	}
	profile, err := s.estateRepo.FindByCharacter(ctx, characterID)
	if err != nil || profile == nil {
		maxMovePnt := domainfarm.DefaultMagicEstateMaxMovePnt(fallbackLevel)
		return maxMovePnt, maxMovePnt
	}
	profile.Normalize(fallbackLevel, time.Now())
	return profile.MovePnt, profile.MaxMovePnt
}

func (s *MagicEstateService) SteelMine(ctx context.Context, harvesterCharacterID int64, ownerCharacterID int64, slotID int) (*SteelMineResult, error) {
	if harvesterCharacterID <= 0 || ownerCharacterID <= 0 {
		return nil, ErrMagicEstateInvalidSlot
	}

	harvesterView, err := s.GetEstateView(ctx, harvesterCharacterID)
	if err != nil {
		return nil, err
	}
	ownerView, err := s.GetEstateView(ctx, ownerCharacterID)
	if err != nil {
		return nil, err
	}

	slot := ownerView.Profile.Slots[slotID]
	if slot == nil || slot.HavestFlag {
		return nil, ErrMagicEstateFrozen
	}
	if harvesterView.Profile.MovePnt < magicEstateStealCost {
		return nil, ErrMagicEstateInsufficientMove
	}

	harvesterView.Profile.MovePnt -= magicEstateStealCost

	resultValue := magicEstateSteelResult(harvesterView.Character.Level, ownerView.Character.Level)
	battleID := time.Now().UnixMilli()*100000 + harvesterCharacterID
	log := &domainfarm.MagicEstateLog{
		CharacterID: harvesterCharacterID,
		LogTime:     time.Now().UnixMilli(),
		Result:      resultValue,
		Guest:       false,
		CID:         harvesterCharacterID,
		TID:         ownerCharacterID,
		Name:        ownerView.Character.Name,
		NoReplay:    false,
		BattleID:    battleID,
	}

	rewardName := ""
	if resultValue == magicEstateBattleWin {
		stolen := slot.Num / 10
		if stolen < 1 {
			stolen = 1
		}
		if stolen > slot.Num {
			stolen = slot.Num
		}

		mineral := s.getMineralTemplate(slot.MineralID)
		if mineral != nil {
			log.ItemTemplateID = int(mineral.Tid)
			log.Num = stolen
			rewardName = s.getItemName(log.ItemTemplateID)
		}
		slot.Num -= stolen
		if slot.Num <= 0 {
			delete(ownerView.Profile.Slots, slotID)
		} else {
			ownerView.Profile.Slots[slotID] = slot
		}
	}

	if err := s.persistView(ctx, harvesterView); err != nil {
		return nil, err
	}
	if err := s.persistView(ctx, ownerView); err != nil {
		return nil, err
	}
	if err := s.estateRepo.SaveLog(ctx, log); err != nil {
		return nil, err
	}
	ownerLog := &domainfarm.MagicEstateLog{
		CharacterID:    ownerCharacterID,
		LogTime:        log.LogTime,
		Result:         resultValue,
		Guest:          true,
		CID:            harvesterCharacterID,
		TID:            ownerCharacterID,
		Name:           harvesterView.Character.Name,
		ItemTemplateID: log.ItemTemplateID,
		Num:            log.Num,
		NoReplay:       log.NoReplay,
		BattleID:       log.BattleID,
	}
	if err := s.estateRepo.SaveLog(ctx, ownerLog); err != nil {
		return nil, err
	}

	return &SteelMineResult{
		OwnerCharacterID:     ownerCharacterID,
		HarvesterCharacterID: harvesterCharacterID,
		OwnerProfile:         ownerView.Profile,
		HarvesterProfile:     harvesterView.Profile,
		OwnerCharacter:       ownerView.Character,
		HarvesterCharacter:   harvesterView.Character,
		Log:                  log,
		RewardName:           rewardName,
	}, nil
}

func magicEstateMaxFarmByExp(exp int) int {
	for _, cfg := range magicEstateLevelConfigs {
		if exp <= cfg.Exp {
			return cfg.MaxFarm
		}
	}
	return magicEstateLevelConfigs[len(magicEstateLevelConfigs)-1].MaxFarm
}

func magicEstateLevelIndexByExp(exp int) int {
	for index, cfg := range magicEstateLevelConfigs {
		if exp <= cfg.Exp {
			return index
		}
	}
	return len(magicEstateLevelConfigs) - 1
}

func magicEstateLevelUpCost(currentLevelIndex int) int64 {
	switch currentLevelIndex {
	case 0:
		return 400000
	case 1:
		return 2600000
	case 2:
		return 11000000
	case 3:
		return 42000000
	default:
		return 0
	}
}

func magicEstateFarmNumCost(currentFarmNum int) int64 {
	if currentFarmNum < 0 || currentFarmNum >= len(magicEstateFarmNumCosts) {
		return 0
	}
	return magicEstateFarmNumCosts[currentFarmNum]
}

func magicEstateSteelResult(attackerLevel int, defenderLevel int) int {
	if attackerLevel > defenderLevel {
		return magicEstateBattleWin
	}
	if attackerLevel == defenderLevel {
		return magicEstateBattleDraw
	}
	return magicEstateBattleLose
}

func upsertFarmBagSlot(profile *domainfarm.MagicEstateProfile, templateID int, amount int, colorCode int) *domainfarm.MagicEstateBagSlot {
	if profile.Bag == nil {
		profile.Bag = map[int]*domainfarm.MagicEstateBagSlot{}
	}

	slotIndexes := make([]int, 0, len(profile.Bag))
	for slotIndex := range profile.Bag {
		slotIndexes = append(slotIndexes, slotIndex)
	}
	sort.Ints(slotIndexes)

	for _, slotIndex := range slotIndexes {
		slot := profile.Bag[slotIndex]
		if slot != nil && slot.TemplateID == templateID && slot.ColorCode == colorCode {
			slot.Num += int64(amount)
			profile.Bag[slotIndex] = slot
			return slot
		}
	}

	nextIndex := 0
	for _, slotIndex := range slotIndexes {
		if slotIndex == nextIndex {
			nextIndex++
			continue
		}
		if slotIndex > nextIndex {
			break
		}
	}

	slot := &domainfarm.MagicEstateBagSlot{
		SlotIndex:  nextIndex,
		TemplateID: templateID,
		Num:        int64(amount),
		ColorCode:  colorCode,
	}
	profile.Bag[nextIndex] = slot
	return slot
}

func (s *MagicEstateService) persistView(ctx context.Context, view *MagicEstateView) error {
	if view == nil || view.Character == nil || view.Profile == nil {
		return ErrMagicEstateUnavailable
	}
	view.Profile.Normalize(view.Character.Level, time.Now())
	if err := s.charRepo.Update(ctx, view.Character); err != nil {
		return err
	}
	return s.estateRepo.Upsert(ctx, view.Profile)
}

func (s *MagicEstateService) getMineralTemplate(mineralID int) *models.MineralTemplateTemplate {
	if s.gameData == nil {
		return nil
	}
	return s.gameData.GetMineralTemplate(mineralID)
}

func (s *MagicEstateService) getItemName(itemID int) string {
	if s.gameData != nil {
		if item := s.gameData.GetItem(itemID); item != nil && item.Name != "" {
			return item.Name
		}
	}
	return fmt.Sprintf("Vật phẩm %d", itemID)
}
