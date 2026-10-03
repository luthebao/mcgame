// Open-sourced by BaoLT

package farm

import (
	"context"
	"encoding/json"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	domainfarm "mcgame-server/internal/domain/farm"
	domainsocial "mcgame-server/internal/domain/social"
	"mcgame-server/internal/gamedata"

	"go.uber.org/zap"
)

type stubMagicEstateCharacterRepo struct {
	characters map[int64]*domainchar.Character
}

func (r *stubMagicEstateCharacterRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	return r.characters[id], nil
}

func (r *stubMagicEstateCharacterRepo) Update(ctx context.Context, character *domainchar.Character) error {
	r.characters[character.ID] = character
	return nil
}

type stubMagicEstateRepo struct {
	profiles map[int64]*domainfarm.MagicEstateProfile
	logs     map[int64][]*domainfarm.MagicEstateLog
	replays  map[int64][]*domainfarm.MagicEstateReplay
}

func (r *stubMagicEstateRepo) FindByCharacter(ctx context.Context, characterID int64) (*domainfarm.MagicEstateProfile, error) {
	return r.profiles[characterID], nil
}

func (r *stubMagicEstateRepo) Upsert(ctx context.Context, profile *domainfarm.MagicEstateProfile) error {
	if r.profiles == nil {
		r.profiles = map[int64]*domainfarm.MagicEstateProfile{}
	}
	r.profiles[profile.CharacterID] = profile
	return nil
}

func (r *stubMagicEstateRepo) FindLogsByCharacter(ctx context.Context, characterID int64, limit int) ([]*domainfarm.MagicEstateLog, error) {
	return r.logs[characterID], nil
}

func (r *stubMagicEstateRepo) FindSavedReplaysByCharacter(ctx context.Context, characterID int64, limit int) ([]*domainfarm.MagicEstateReplay, error) {
	return r.replays[characterID], nil
}

func (r *stubMagicEstateRepo) SaveReplay(ctx context.Context, replay *domainfarm.MagicEstateReplay) error {
	if r.replays == nil {
		r.replays = map[int64][]*domainfarm.MagicEstateReplay{}
	}
	list := r.replays[replay.CharacterID]
	replaced := false
	for index, existing := range list {
		if existing.BattleID == replay.BattleID {
			list[index] = replay
			replaced = true
			break
		}
	}
	if !replaced {
		list = append(list, replay)
	}
	r.replays[replay.CharacterID] = list
	return nil
}

func (r *stubMagicEstateRepo) DeleteReplay(ctx context.Context, characterID int64, battleID int64) error {
	list := r.replays[characterID]
	next := make([]*domainfarm.MagicEstateReplay, 0, len(list))
	for _, replay := range list {
		if replay.BattleID != battleID {
			next = append(next, replay)
		}
	}
	r.replays[characterID] = next
	return nil
}

func (r *stubMagicEstateRepo) SaveLog(ctx context.Context, log *domainfarm.MagicEstateLog) error {
	if r.logs == nil {
		r.logs = map[int64][]*domainfarm.MagicEstateLog{}
	}
	r.logs[log.CharacterID] = append(r.logs[log.CharacterID], log)
	return nil
}

type stubMagicEstateFriendRepo struct {
	friends map[int64][]*domainsocial.Relationship
}

func (r *stubMagicEstateFriendRepo) FindFriends(ctx context.Context, characterID int64) ([]*domainsocial.Relationship, error) {
	return r.friends[characterID], nil
}

func TestAddMineralConsumesResourcesAndCreatesReadySlot(t *testing.T) {
	gameData := gamedata.NewManager(nil, zap.NewNop())
	err := gameData.GetCache().LoadTable("TBL_MINERAL_TEMPLATE", []json.RawMessage{
		json.RawMessage(`{"id":1,"act_pnt":100,"money":10000,"num":100,"tid":7,"time":60}`),
	})
	if err != nil {
		t.Fatalf("LoadTable mineral error = %v", err)
	}

	charRepo := &stubMagicEstateCharacterRepo{
		characters: map[int64]*domainchar.Character{
			35644: {
				ID:        35644,
				Level:     160,
				MoneyBind: 4018405250026,
			},
		},
	}
	estateRepo := &stubMagicEstateRepo{
		profiles: map[int64]*domainfarm.MagicEstateProfile{
			35644: {
				CharacterID: 35644,
				FarmNum:     16,
				Actpoint:    1750,
				MaxActpoint: 1750,
				Slots:       map[int]*domainfarm.MagicEstateSlot{},
				Bag:         map[int]*domainfarm.MagicEstateBagSlot{},
			},
		},
	}

	service := NewMagicEstateService(estateRepo, charRepo, nil, gameData, zap.NewNop())
	result, err := service.AddMineral(context.Background(), 35644, 3, 1)
	if err != nil {
		t.Fatalf("AddMineral() error = %v", err)
	}

	if result.Profile.Actpoint != 1650 {
		t.Fatalf("Actpoint = %d, expected 1650", result.Profile.Actpoint)
	}
	if result.Character.MoneyBind != 4018405240026 {
		t.Fatalf("MoneyBind = %d, expected 4018405240026", result.Character.MoneyBind)
	}
	if slot := result.Profile.Slots[3]; slot == nil || slot.MineralID != 1 || slot.HavestFlag {
		t.Fatalf("expected ready slot 3 after AddMineral, got %#v", slot)
	}
}

func TestHarvestMineAddsFarmBagAndStartsCooldown(t *testing.T) {
	gameData := gamedata.NewManager(nil, zap.NewNop())
	err := gameData.GetCache().LoadTable("TBL_MINERAL_TEMPLATE", []json.RawMessage{
		json.RawMessage(`{"id":1,"act_pnt":100,"money":10000,"num":100,"tid":7,"time":60}`),
	})
	if err != nil {
		t.Fatalf("LoadTable mineral error = %v", err)
	}
	err = gameData.GetCache().LoadTable("TBL_ITEM_TEMPLATE", []json.RawMessage{
		json.RawMessage(`{"id":7,"name":"Kim Loại"}`),
	})
	if err != nil {
		t.Fatalf("LoadTable item error = %v", err)
	}

	charRepo := &stubMagicEstateCharacterRepo{
		characters: map[int64]*domainchar.Character{
			35644: {
				ID:        35644,
				Level:     160,
				MoneyBind: 10000,
			},
		},
	}
	estateRepo := &stubMagicEstateRepo{
		profiles: map[int64]*domainfarm.MagicEstateProfile{
			35644: {
				CharacterID: 35644,
				FarmNum:     2,
				Actpoint:    1750,
				MaxActpoint: 1750,
				Slots: map[int]*domainfarm.MagicEstateSlot{
					1: {
						SlotID:         1,
						MineralID:      1,
						Num:            100,
						MaxNum:         100,
						CooldownEndsAt: 1,
						HavestFlag:     false,
					},
				},
				Bag: map[int]*domainfarm.MagicEstateBagSlot{},
			},
		},
	}

	service := NewMagicEstateService(estateRepo, charRepo, nil, gameData, zap.NewNop())
	result, err := service.HarvestMine(context.Background(), 35644, 1)
	if err != nil {
		t.Fatalf("HarvestMine() error = %v", err)
	}

	if result.BagSlot == nil || result.BagSlot.TemplateID != 7 || result.BagSlot.Num != 100 {
		t.Fatalf("expected bag slot with 100 item 7, got %#v", result.BagSlot)
	}
	if !result.Slot.HavestFlag {
		t.Fatalf("expected harvested slot to enter cooldown")
	}
	if result.CooldownAt <= 1 {
		t.Fatalf("expected cooldown timestamp to advance, got %d", result.CooldownAt)
	}
}

func TestAddFarmNumConsumesMoneyAndIncrementsFarmNum(t *testing.T) {
	charRepo := &stubMagicEstateCharacterRepo{
		characters: map[int64]*domainchar.Character{
			35644: {
				ID:        35644,
				Level:     160,
				MoneyBind: 100000,
			},
		},
	}
	estateRepo := &stubMagicEstateRepo{
		profiles: map[int64]*domainfarm.MagicEstateProfile{
			35644: {
				CharacterID: 35644,
				Exp:         0,
				Actpoint:    1750,
				MaxActpoint: 1750,
				FarmNum:     2,
				Slots:       map[int]*domainfarm.MagicEstateSlot{},
				Bag:         map[int]*domainfarm.MagicEstateBagSlot{},
			},
		},
	}

	service := NewMagicEstateService(estateRepo, charRepo, nil, nil, zap.NewNop())
	result, err := service.AddFarmNum(context.Background(), 35644)
	if err != nil {
		t.Fatalf("AddFarmNum() error = %v", err)
	}

	if result.Profile.FarmNum != 3 {
		t.Fatalf("FarmNum = %d, expected 3", result.Profile.FarmNum)
	}
	if result.Cost != 30000 {
		t.Fatalf("Cost = %d, expected 30000", result.Cost)
	}
	if result.Character.MoneyBind != 70000 {
		t.Fatalf("MoneyBind = %d, expected 70000", result.Character.MoneyBind)
	}
}

func TestSaveReplayPersistsReplayListEntry(t *testing.T) {
	charRepo := &stubMagicEstateCharacterRepo{
		characters: map[int64]*domainchar.Character{
			35644: {ID: 35644, Level: 160},
		},
	}
	estateRepo := &stubMagicEstateRepo{
		profiles: map[int64]*domainfarm.MagicEstateProfile{
			35644: domainfarm.NewMagicEstateProfile(35644, 160),
		},
	}

	service := NewMagicEstateService(estateRepo, charRepo, nil, nil, zap.NewNop())
	replay, err := service.SaveReplay(context.Background(), 35644, "Test Replay", 12345)
	if err != nil {
		t.Fatalf("SaveReplay() error = %v", err)
	}
	if replay.BattleID != 12345 {
		t.Fatalf("BattleID = %d, expected 12345", replay.BattleID)
	}

	list, err := service.GetReplayList(context.Background(), 35644)
	if err != nil {
		t.Fatalf("GetReplayList() error = %v", err)
	}
	entry, ok := list["12345"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected replay list entry for battle 12345")
	}
	if entry["name"] != "Test Replay" {
		t.Fatalf("replay name = %#v, expected Test Replay", entry["name"])
	}
}

func TestFarmLvUpConsumesMoneyAndAdvancesExpBoundary(t *testing.T) {
	charRepo := &stubMagicEstateCharacterRepo{
		characters: map[int64]*domainchar.Character{
			35644: {ID: 35644, Level: 160, MoneyBind: 1000000},
		},
	}
	estateRepo := &stubMagicEstateRepo{
		profiles: map[int64]*domainfarm.MagicEstateProfile{
			35644: {
				CharacterID: 35644,
				Exp:         60,
				Actpoint:    1750,
				MaxActpoint: 1750,
				MovePnt:     900,
				MaxMovePnt:  900,
				FarmNum:     2,
				Slots:       map[int]*domainfarm.MagicEstateSlot{},
				Bag:         map[int]*domainfarm.MagicEstateBagSlot{},
			},
		},
	}

	service := NewMagicEstateService(estateRepo, charRepo, nil, nil, zap.NewNop())
	result, err := service.FarmLvUp(context.Background(), 35644)
	if err != nil {
		t.Fatalf("FarmLvUp() error = %v", err)
	}
	if result.Profile.Exp != 61 {
		t.Fatalf("Exp = %d, expected 61", result.Profile.Exp)
	}
	if result.Cost != 400000 {
		t.Fatalf("Cost = %d, expected 400000", result.Cost)
	}
	if result.Character.MoneyBind != 600000 {
		t.Fatalf("MoneyBind = %d, expected 600000", result.Character.MoneyBind)
	}
}

func TestSteelMineConsumesMovePointAndCreatesLogs(t *testing.T) {
	gameData := gamedata.NewManager(nil, zap.NewNop())
	err := gameData.GetCache().LoadTable("TBL_MINERAL_TEMPLATE", []json.RawMessage{
		json.RawMessage(`{"id":1,"act_pnt":100,"money":10000,"num":100,"tid":7,"time":60}`),
	})
	if err != nil {
		t.Fatalf("LoadTable mineral error = %v", err)
	}
	err = gameData.GetCache().LoadTable("TBL_ITEM_TEMPLATE", []json.RawMessage{
		json.RawMessage(`{"id":7,"name":"Kim Loại"}`),
	})
	if err != nil {
		t.Fatalf("LoadTable item error = %v", err)
	}

	charRepo := &stubMagicEstateCharacterRepo{
		characters: map[int64]*domainchar.Character{
			35644: {ID: 35644, Level: 160, MoneyBind: 10000},
			35273: {ID: 35273, Level: 170, MoneyBind: 10000},
		},
	}
	estateRepo := &stubMagicEstateRepo{
		profiles: map[int64]*domainfarm.MagicEstateProfile{
			35644: {
				CharacterID: 35644,
				Exp:         0,
				Actpoint:    1750,
				MaxActpoint: 1750,
				MovePnt:     880,
				MaxMovePnt:  900,
				FarmNum:     2,
				Slots:       map[int]*domainfarm.MagicEstateSlot{},
				Bag:         map[int]*domainfarm.MagicEstateBagSlot{},
			},
			35273: {
				CharacterID: 35273,
				Exp:         0,
				Actpoint:    1850,
				MaxActpoint: 1850,
				MovePnt:     950,
				MaxMovePnt:  950,
				FarmNum:     16,
				Slots: map[int]*domainfarm.MagicEstateSlot{
					15: {
						SlotID:         15,
						MineralID:      1,
						Num:            100,
						MaxNum:         100,
						CooldownEndsAt: 1,
						HavestFlag:     false,
					},
				},
				Bag: map[int]*domainfarm.MagicEstateBagSlot{},
			},
		},
	}

	service := NewMagicEstateService(estateRepo, charRepo, nil, gameData, zap.NewNop())
	result, err := service.SteelMine(context.Background(), 35644, 35273, 15)
	if err != nil {
		t.Fatalf("SteelMine() error = %v", err)
	}
	if result.HarvesterProfile.MovePnt != 870 {
		t.Fatalf("MovePnt = %d, expected 870", result.HarvesterProfile.MovePnt)
	}
	if len(estateRepo.logs[35644]) == 0 {
		t.Fatalf("expected attacker log entry")
	}
	if len(estateRepo.logs[35273]) == 0 {
		t.Fatalf("expected defender log entry")
	}
}
