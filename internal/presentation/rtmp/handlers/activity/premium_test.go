// Open-sourced by BaoLT

package activity

import (
	"context"
	"encoding/json"
	"errors"
	"net"
	"testing"
	"time"

	appactivity "mcgame-server/internal/application/activity"
	appbuff "mcgame-server/internal/application/buff"
	appitem "mcgame-server/internal/application/item"
	domainauth "mcgame-server/internal/domain/auth"
	domainbuff "mcgame-server/internal/domain/buff"
	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	infrartmp "mcgame-server/internal/infrastructure/rtmp"

	"github.com/google/uuid"
	"go.uber.org/zap/zaptest"
)

type premiumStubNetConn struct{}

func (s *premiumStubNetConn) Read(b []byte) (n int, err error)  { return 0, nil }
func (s *premiumStubNetConn) Write(b []byte) (n int, err error) { return len(b), nil }
func (s *premiumStubNetConn) Close() error                      { return nil }
func (s *premiumStubNetConn) LocalAddr() net.Addr               { return nil }
func (s *premiumStubNetConn) RemoteAddr() net.Addr {
	return &net.TCPAddr{IP: net.ParseIP("127.0.0.1"), Port: 1935}
}
func (s *premiumStubNetConn) SetDeadline(t time.Time) error      { return nil }
func (s *premiumStubNetConn) SetReadDeadline(t time.Time) error  { return nil }
func (s *premiumStubNetConn) SetWriteDeadline(t time.Time) error { return nil }

type premiumHandlerCharacterRepo struct {
	char *domainchar.Character
}

func (r *premiumHandlerCharacterRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	if r.char == nil || r.char.ID != id {
		return nil, errors.New("character not found")
	}
	copyChar := *r.char
	return &copyChar, nil
}

func (r *premiumHandlerCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *premiumHandlerCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *premiumHandlerCharacterRepo) FindByName(ctx context.Context, name string) (*domainchar.Character, error) {
	return nil, errors.New("character not found")
}

func (r *premiumHandlerCharacterRepo) Create(ctx context.Context, char *domainchar.Character) error {
	return nil
}

func (r *premiumHandlerCharacterRepo) Update(ctx context.Context, char *domainchar.Character) error {
	copyChar := *char
	r.char = &copyChar
	return nil
}

func (r *premiumHandlerCharacterRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (r *premiumHandlerCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}

func (r *premiumHandlerCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos domainchar.Position) error {
	return nil
}

func (r *premiumHandlerCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

type premiumHandlerAccountRepo struct {
	account *domainauth.Account
}

type premiumHandlerStatFeatureRepo struct {
	characterState map[int64]map[string]map[string]interface{}
}

type premiumHandlerBuffRepo struct {
	upserts []*domainbuff.Buff
	nextID  int64
}

func (r *premiumHandlerBuffRepo) ListByCharacter(ctx context.Context, characterID int64) ([]*domainbuff.Buff, error) {
	return nil, nil
}

func (r *premiumHandlerBuffRepo) GetByID(ctx context.Context, id int64) (*domainbuff.Buff, error) {
	return nil, errors.New("not implemented")
}

func (r *premiumHandlerBuffRepo) Upsert(ctx context.Context, buff *domainbuff.Buff) (*domainbuff.Buff, error) {
	r.nextID++
	stored := *buff
	stored.ID = r.nextID
	r.upserts = append(r.upserts, &stored)
	return &stored, nil
}

func (r *premiumHandlerBuffRepo) Delete(ctx context.Context, id int64) error { return nil }

func (r *premiumHandlerBuffRepo) DeleteExpired(ctx context.Context, characterID int64, now time.Time) (int64, error) {
	return 0, nil
}

func (r *premiumHandlerStatFeatureRepo) GetCharacterProgression(ctx context.Context, charID int64) (*domainfeature.CharacterProgression, error) {
	return nil, nil
}

func (r *premiumHandlerStatFeatureRepo) ListCharacterFeatureStates(ctx context.Context, charID int64) ([]*domainfeature.CharacterFeatureState, error) {
	featureState := r.characterState[charID]
	if len(featureState) == 0 {
		return nil, nil
	}
	result := make([]*domainfeature.CharacterFeatureState, 0, len(featureState))
	for featureKey, state := range featureState {
		result = append(result, &domainfeature.CharacterFeatureState{
			CharacterID: charID,
			FeatureKey:  featureKey,
			State:       clonePremiumState(state),
		})
	}
	return result, nil
}

func (r *premiumHandlerStatFeatureRepo) UpsertCharacterSoulProgression(_ context.Context, _ int64, _ int, _ int64) error {
	return nil
}

func (r *premiumHandlerStatFeatureRepo) UpsertCharacterFeatureState(ctx context.Context, state *domainfeature.CharacterFeatureState) error {
	if state == nil {
		return nil
	}
	if r.characterState == nil {
		r.characterState = make(map[int64]map[string]map[string]interface{})
	}
	if r.characterState[state.CharacterID] == nil {
		r.characterState[state.CharacterID] = make(map[string]map[string]interface{})
	}
	r.characterState[state.CharacterID][state.FeatureKey] = clonePremiumState(state.State)
	return nil
}

func (r *premiumHandlerStatFeatureRepo) ListPetFeatureStates(ctx context.Context, petID int64) ([]*domainfeature.PetFeatureState, error) {
	return nil, nil
}

func (r *premiumHandlerStatFeatureRepo) UpsertPetFeatureState(ctx context.Context, state *domainfeature.PetFeatureState) error {
	return nil
}

func (r *premiumHandlerStatFeatureRepo) GetActiveMount(ctx context.Context, charID int64) (*domainfeature.ActiveMount, error) {
	return nil, nil
}

func (r *premiumHandlerStatFeatureRepo) PPVEChallengeNextFloor(_ context.Context, _ int64, _ int, _ int, _ string) (*domainfeature.PPVEChallengeResult, error) {
	return nil, nil
}

func (r *premiumHandlerAccountRepo) FindByID(ctx context.Context, id uuid.UUID) (*domainauth.Account, error) {
	if r.account == nil || r.account.ID != id {
		return nil, errors.New("account not found")
	}
	copyAccount := *r.account
	return &copyAccount, nil
}

func (r *premiumHandlerAccountRepo) FindByUsername(ctx context.Context, username string) (*domainauth.Account, error) {
	return nil, errors.New("account not found")
}

func (r *premiumHandlerAccountRepo) Create(ctx context.Context, account *domainauth.Account) error {
	return nil
}

func (r *premiumHandlerAccountRepo) Update(ctx context.Context, account *domainauth.Account) error {
	copyAccount := *account
	r.account = &copyAccount
	return nil
}

func (r *premiumHandlerAccountRepo) ExistsByUsername(ctx context.Context, username string) (bool, error) {
	return false, nil
}

func (r *premiumHandlerAccountRepo) UpdateLastLogin(ctx context.Context, id uuid.UUID) error {
	return nil
}

func TestBuyPm_InsufficientGoldReturnsNoRPCError(t *testing.T) {
	logger := zaptest.NewLogger(t)
	accountID := uuid.New()
	charRepo := &premiumHandlerCharacterRepo{
		char: &domainchar.Character{
			ID:        101,
			AccountID: accountID,
			Name:      "tester",
			Gold:      100,
		},
	}
	accountRepo := &premiumHandlerAccountRepo{
		account: &domainauth.Account{ID: accountID},
	}

	service := appactivity.NewPremiumService(charRepo, accountRepo, logger)
	handler := NewHandler(nil, logger)
	handler.SetPremiumService(service)

	conn := infrartmp.NewConnection(1, &premiumStubNetConn{}, nil, logger)
	ctx := &infrartmp.RPCContext{
		Context:     context.Background(),
		ConnID:      1,
		CharacterID: "101",
		Connection:  conn,
	}

	result, err := handler.BuyPm(ctx, []interface{}{float64(1)})
	if err != nil {
		t.Fatalf("BuyPm() error = %v, want nil", err)
	}
	if result != nil {
		t.Fatalf("BuyPm() result = %#v, want nil on failure", result)
	}
}

func TestDoPmOperation_CouponRewardAddsGoldBindAndProgress(t *testing.T) {
	logger := zaptest.NewLogger(t)
	now := time.Date(2026, 4, 19, 9, 0, 0, 0, time.UTC)
	accountID := uuid.New()
	charRepo := &premiumHandlerCharacterRepo{
		char: &domainchar.Character{
			ID:            202,
			AccountID:     accountID,
			Name:          "tester",
			VIPType:       1,
			GoldBind:      5,
			PMProcessData: map[string]interface{}{},
		},
	}
	expiresAt := now.Add(30 * 24 * time.Hour)
	charRepo.char.VIPExpiresAt = &expiresAt
	accountRepo := &premiumHandlerAccountRepo{
		account: &domainauth.Account{ID: accountID, VIPLevel: 1},
	}

	service := appactivity.NewPremiumService(charRepo, accountRepo, logger)
	service.SetNowFunc(func() time.Time { return now })
	handler := NewHandler(nil, logger)
	handler.SetPremiumService(service)
	handler.SetCharacterRepository(charRepo)
	handler.SetGameDataManager(newPMRightTestManager(t, models.PmRightTemplate{
		ID:          2,
		CountConfig: "1|1|1",
		Type:        2,
		Value1:      10,
		Vip1:        1,
		Vip2:        1,
		Vip3:        1,
		Vip4:        1,
		Vip5:        1,
		Vip6:        1,
		Vip7:        1,
		Vip8:        1,
		Vip9:        1,
		SortIndex:   1,
		Desc:        "Mỗi ngày nhận 10 kim phiếu",
		Desc2:       "Mỗi ngày nhận kim phiếu",
	}))

	conn := infrartmp.NewConnection(1, &premiumStubNetConn{}, nil, logger)
	ctx := &infrartmp.RPCContext{
		Context:     context.Background(),
		ConnID:      1,
		CharacterID: "202",
		Connection:  conn,
	}

	result, err := handler.DoPmOperation(ctx, []interface{}{"2"})
	if err != nil {
		t.Fatalf("DoPmOperation() error = %v", err)
	}
	if result != nil {
		t.Fatalf("DoPmOperation() result = %#v, want nil", result)
	}
	if charRepo.char.GoldBind != 15 {
		t.Fatalf("charRepo.char.GoldBind = %d, want 15", charRepo.char.GoldBind)
	}
	progressRaw, ok := charRepo.char.PMProcessData["2"]
	if !ok {
		t.Fatal("expected PM process flag for right 2 to be persisted")
	}
	progress, ok := progressRaw.(map[string]interface{})
	if !ok {
		t.Fatalf("PM process flag type = %T, want map[string]interface{}", progressRaw)
	}
	if progress["time"] != 1 {
		t.Fatalf("progress[time] = %#v, want 1", progress["time"])
	}
	if progress["type"] != 1 {
		t.Fatalf("progress[type] = %#v, want 1", progress["type"])
	}
	if accountRepo.account.VIPLevel != 1 {
		t.Fatalf("accountRepo.account.VIPLevel = %d, want 1", accountRepo.account.VIPLevel)
	}
	if _, err := handler.DoPmOperation(ctx, []interface{}{"2"}); err != nil {
		t.Fatalf("second DoPmOperation() error = %v, want nil handler-level response", err)
	}
	if charRepo.char.GoldBind != 15 {
		t.Fatalf("charRepo.char.GoldBind after duplicate claim = %d, want 15", charRepo.char.GoldBind)
	}
}

func TestDoPmOperation_ExpRewardAddsLevelScaledExperienceAndProgress(t *testing.T) {
	logger := zaptest.NewLogger(t)
	now := time.Date(2026, 4, 19, 9, 0, 0, 0, time.UTC)
	accountID := uuid.New()
	charRepo := &premiumHandlerCharacterRepo{
		char: &domainchar.Character{
			ID:            202,
			AccountID:     accountID,
			Name:          "tester",
			Level:         10,
			Experience:    0,
			VIPType:       1,
			PMProcessData: map[string]interface{}{},
		},
	}
	expiresAt := now.Add(30 * 24 * time.Hour)
	charRepo.char.VIPExpiresAt = &expiresAt
	accountRepo := &premiumHandlerAccountRepo{
		account: &domainauth.Account{ID: accountID, VIPLevel: 1},
	}

	service := appactivity.NewPremiumService(charRepo, accountRepo, logger)
	service.SetNowFunc(func() time.Time { return now })
	handler := NewHandler(nil, logger)
	handler.SetPremiumService(service)
	handler.SetCharacterRepository(charRepo)
	handler.SetGameDataManager(newPMRightTestManager(t, models.PmRightTemplate{
		ID:          1,
		CountConfig: "1|1|1",
		Type:        2,
		Value1:      2,
		Value2:      3,
		Value3:      3,
		Value4:      5,
		Value5:      5,
		Value6:      7,
		Value7:      7,
		Value8:      9,
		Value9:      9,
		Vip1:        1,
		Vip2:        1,
		Vip3:        1,
		Vip4:        1,
		Vip5:        1,
		Vip6:        1,
		Vip7:        1,
		Vip8:        1,
		Vip9:        1,
		SortIndex:   2,
		Desc:        "Mỗi ngày nhận 1 lượng kinh nghiệm",
		Desc2:       "Mỗi ngày nhận 1 lượng kinh nghiệm",
	}))

	baseExp := charRepo.char.ExperienceForLevel(charRepo.char.Level + 1)
	expectedGain := baseExp * 2
	expectedChar := *charRepo.char
	expectedLeveledUp := expectedChar.GainExperience(expectedGain)

	conn := infrartmp.NewConnection(1, &premiumStubNetConn{}, nil, logger)
	ctx := &infrartmp.RPCContext{
		Context:     context.Background(),
		ConnID:      1,
		CharacterID: "202",
		Connection:  conn,
	}

	result, err := handler.DoPmOperation(ctx, []interface{}{"1"})
	if err != nil {
		t.Fatalf("DoPmOperation() error = %v", err)
	}
	if result != nil {
		t.Fatalf("DoPmOperation() result = %#v, want nil", result)
	}
	if charRepo.char.Level != expectedChar.Level {
		t.Fatalf("character level = %d, want %d", charRepo.char.Level, expectedChar.Level)
	}
	if charRepo.char.Experience != expectedChar.Experience {
		t.Fatalf("character experience = %d, want %d", charRepo.char.Experience, expectedChar.Experience)
	}
	progressRaw, ok := charRepo.char.PMProcessData["1"]
	if !ok {
		t.Fatal("expected PM process flag for right 1 to be persisted")
	}
	progress, ok := progressRaw.(map[string]interface{})
	if !ok {
		t.Fatalf("PM process flag type = %T, want map[string]interface{}", progressRaw)
	}
	if progress["time"] != 1 {
		t.Fatalf("progress[time] = %#v, want 1", progress["time"])
	}
	if progress["type"] != 1 {
		t.Fatalf("progress[type] = %#v, want 1", progress["type"])
	}
	if expectedLeveledUp && charRepo.char.Level <= 10 {
		t.Fatal("expected EXP reward to level up the character")
	}
}

func TestDoPmOperation_MonthlyBagRewardAddsItemAndProgress(t *testing.T) {
	logger := zaptest.NewLogger(t)
	now := time.Date(2026, 4, 19, 9, 0, 0, 0, time.UTC)
	accountID := uuid.New()
	charRepo := &premiumHandlerCharacterRepo{
		char: &domainchar.Character{
			ID:            303,
			AccountID:     accountID,
			Name:          "tester",
			VIPType:       1,
			PMProcessData: map[string]interface{}{},
		},
	}
	expiresAt := now.Add(30 * 24 * time.Hour)
	charRepo.char.VIPExpiresAt = &expiresAt
	accountRepo := &premiumHandlerAccountRepo{
		account: &domainauth.Account{ID: accountID, VIPLevel: 1},
	}
	itemRepo := newFakeSendCombineItemRepo()
	itemService := appitem.NewService(itemRepo, logger)

	service := appactivity.NewPremiumService(charRepo, accountRepo, logger)
	service.SetNowFunc(func() time.Time { return now })
	handler := NewHandler(itemService, logger)
	handler.SetPremiumService(service)
	handler.SetCharacterRepository(charRepo)
	handler.SetGameDataManager(newPMRightTestManager(t, models.PmRightTemplate{
		ID:          10,
		CountConfig: "2|30|1",
		Type:        2,
		Vip1:        1,
		Vip2:        1,
		Vip3:        1,
		Vip4:        1,
		Vip5:        1,
		Vip6:        1,
		Vip7:        1,
		Vip8:        1,
		Vip9:        1,
		SortIndex:   4,
		Desc:        "Mỗi tháng có thể nhận 1 loại túi quà VIP",
		Desc2:       "Mỗi tháng nhận quà VIP",
	}))

	conn := infrartmp.NewConnection(1, &premiumStubNetConn{}, nil, logger)
	ctx := &infrartmp.RPCContext{
		Context:     context.Background(),
		ConnID:      1,
		CharacterID: "303",
		Connection:  conn,
	}

	result, err := handler.DoPmOperation(ctx, []interface{}{"10"})
	if err != nil {
		t.Fatalf("DoPmOperation() error = %v", err)
	}
	if result != nil {
		t.Fatalf("DoPmOperation() result = %#v, want nil", result)
	}
	if len(itemRepo.items) != 1 {
		t.Fatalf("len(itemRepo.items) = %d, want 1", len(itemRepo.items))
	}
	for _, item := range itemRepo.items {
		if item.TemplateID != 3232 {
			t.Fatalf("item.TemplateID = %d, want 3232", item.TemplateID)
		}
		if item.CharacterID != 303 {
			t.Fatalf("item.CharacterID = %d, want 303", item.CharacterID)
		}
		if item.StackCount != 1 {
			t.Fatalf("item.StackCount = %d, want 1", item.StackCount)
		}
		if !item.IsBound {
			t.Fatal("monthly PM reward item should be bound")
		}
	}
	progressRaw, ok := charRepo.char.PMProcessData["10"]
	if !ok {
		t.Fatal("expected PM process flag for right 10 to be persisted")
	}
	progress, ok := progressRaw.(map[string]interface{})
	if !ok {
		t.Fatalf("PM process flag type = %T, want map[string]interface{}", progressRaw)
	}
	if progress["time"] != 1 {
		t.Fatalf("progress[time] = %#v, want 1", progress["time"])
	}
	if progress["type"] != 2 {
		t.Fatalf("progress[type] = %#v, want 2", progress["type"])
	}
}

func TestDoPmOperation_DailyTransformPersistsStateAndProgress(t *testing.T) {
	logger := zaptest.NewLogger(t)
	now := time.Date(2026, 4, 19, 9, 0, 0, 0, time.UTC)
	accountID := uuid.New()
	charRepo := &premiumHandlerCharacterRepo{
		char: &domainchar.Character{
			ID:            404,
			AccountID:     accountID,
			Name:          "tester",
			VIPType:       1,
			PMProcessData: map[string]interface{}{},
		},
	}
	expiresAt := now.Add(30 * 24 * time.Hour)
	charRepo.char.VIPExpiresAt = &expiresAt
	accountRepo := &premiumHandlerAccountRepo{
		account: &domainauth.Account{ID: accountID, VIPLevel: 1},
	}

	service := appactivity.NewPremiumService(charRepo, accountRepo, logger)
	service.SetNowFunc(func() time.Time { return now })
	handler := NewHandler(nil, logger)
	handler.SetPremiumService(service)
	handler.SetCharacterRepository(charRepo)
	manager := newPMRightTestManager(t, models.PmRightTemplate{
		ID:          13,
		CountConfig: "1|1|1",
		Type:        2,
		Vip1:        1,
		Vip2:        1,
		Vip3:        1,
		Vip4:        1,
		Vip5:        1,
		Vip6:        1,
		Vip7:        1,
		Vip8:        1,
		Vip9:        1,
		SortIndex:   7,
		Desc:        "Mỗi ngày biến hình 1 lần",
		Desc2:       "Mỗi ngày biến hình 1 lần",
	})
	loadPMOperationTableRows(t, manager, models.TableCreature,
		map[string]interface{}{"id": 901, "name": "Hidden Creature", "res_code": 2070380000021.0, "show_able": 0.0, "catchable": 1.0, "use_lv": 170.0},
		map[string]interface{}{"id": 902, "name": "Visible Boss", "res_code": 2070380001021.0, "show_able": 1.0, "catchable": 0.0, "use_lv": 220.0},
		map[string]interface{}{"id": 903, "name": "Visible Duplicate", "res_code": 2070380001021.0, "show_able": 1.0, "catchable": 1.0, "use_lv": 120.0},
		map[string]interface{}{"id": 904, "name": "Hidden Pet", "res_code": 2070380002021.0, "show_able": 0.0, "catchable": 1.0, "use_lv": 120.0},
	)
	handler.SetGameDataManager(manager)

	conn := infrartmp.NewConnection(1, &premiumStubNetConn{}, nil, logger)
	ctx := &infrartmp.RPCContext{
		Context:     context.Background(),
		ConnID:      1,
		CharacterID: "404",
		Connection:  conn,
	}

	result, err := handler.DoPmOperation(ctx, []interface{}{"13"})
	if err != nil {
		t.Fatalf("DoPmOperation() error = %v", err)
	}
	if result != nil {
		t.Fatalf("DoPmOperation() result = %#v, want nil", result)
	}
	if _, ok := charRepo.char.PMProcessData["13"]; !ok {
		t.Fatal("expected PM process flag for right 13 to be persisted")
	}
	transformRaw, ok := charRepo.char.PMProcessData["pm13Transform"]
	if !ok {
		t.Fatal("expected pm13Transform state to be persisted")
	}
	transform, ok := transformRaw.(map[string]interface{})
	if !ok {
		t.Fatalf("pm13Transform type = %T, want map[string]interface{}", transformRaw)
	}
	resCode, ok := transform["resCode"].(int64)
	if !ok {
		if asFloat, floatOK := transform["resCode"].(float64); floatOK {
			resCode = int64(asFloat)
			ok = true
		}
	}
	if !ok || resCode <= 0 {
		t.Fatalf("pm13Transform.resCode = %#v, want positive", transform["resCode"])
	}
	if resCode != 2070380001021 {
		t.Fatalf("pm13Transform.resCode = %d, want 2070380001021 (show_able = 1 creature pool)", resCode)
	}
}

func TestDoPmOperation_DailyBuffPersistsStateAndProgress(t *testing.T) {
	logger := zaptest.NewLogger(t)
	now := time.Date(2026, 4, 19, 9, 0, 0, 0, time.UTC)
	accountID := uuid.New()
	charRepo := &premiumHandlerCharacterRepo{
		char: &domainchar.Character{
			ID:            505,
			AccountID:     accountID,
			Name:          "tester",
			PMExp:         1105000,
			VIPType:       1,
			PMProcessData: map[string]interface{}{},
		},
	}
	expiresAt := now.Add(30 * 24 * time.Hour)
	charRepo.char.VIPExpiresAt = &expiresAt
	accountRepo := &premiumHandlerAccountRepo{
		account: &domainauth.Account{ID: accountID, VIPLevel: 9},
	}
	statFeatureRepo := &premiumHandlerStatFeatureRepo{}
	buffRepo := &premiumHandlerBuffRepo{}

	manager := newPMRightTestManager(t, models.PmRightTemplate{
		ID:          3,
		CountConfig: "1|1|1",
		Type:        2,
		Value1:      4,
		Value2:      4,
		Value3:      6,
		Value4:      6,
		Value5:      8,
		Value6:      8,
		Value7:      10,
		Value8:      10,
		Value9:      12,
		Vip1:        1,
		Vip2:        1,
		Vip3:        1,
		Vip4:        1,
		Vip5:        1,
		Vip6:        1,
		Vip7:        1,
		Vip8:        1,
		Vip9:        1,
		SortIndex:   3,
		Desc:        "Mỗi ngày nhận buff 1 lần",
		Desc2:       "Mỗi ngày nhận buff 1 lần",
	})
	loadPMOperationTableRows(t, manager, models.TableBuff,
		map[string]interface{}{"id": 3309, "percent_flag": 1, "prop1": 1, "prop2": 4, "prop3": 5, "prop4": 6, "prop5": 7, "prop_num1": 12, "prop_num2": 12, "prop_num3": 12, "prop_num4": 12, "prop_num5": 12},
	)

	service := appactivity.NewPremiumService(charRepo, accountRepo, logger)
	service.SetNowFunc(func() time.Time { return now })
	handler := NewHandler(nil, logger)
	handler.SetPremiumService(service)
	handler.SetCharacterRepository(charRepo)
	handler.SetStatFeatureRepository(statFeatureRepo)
	handler.SetBuffService(appbuff.NewService(buffRepo, manager, logger))
	handler.SetGameDataManager(manager)

	conn := infrartmp.NewConnection(1, &premiumStubNetConn{}, nil, logger)
	ctx := &infrartmp.RPCContext{
		Context:     context.Background(),
		ConnID:      1,
		CharacterID: "505",
		Connection:  conn,
	}

	result, err := handler.DoPmOperation(ctx, []interface{}{"3"})
	if err != nil {
		t.Fatalf("DoPmOperation() error = %v", err)
	}
	if result != nil {
		t.Fatalf("DoPmOperation() result = %#v, want nil", result)
	}
	progressRaw, ok := charRepo.char.PMProcessData["3"]
	if !ok {
		t.Fatal("expected PM process flag for right 3 to be persisted")
	}
	progress, ok := progressRaw.(map[string]interface{})
	if !ok {
		t.Fatalf("PM process flag type = %T, want map[string]interface{}", progressRaw)
	}
	if progress["time"] != 1 {
		t.Fatalf("progress[time] = %#v, want 1", progress["time"])
	}
	state := statFeatureRepo.characterState[505][domainfeature.FeaturePMDailyBuff]
	if state != nil {
		t.Fatal("statFeature path should no longer be used for PM daily buff")
	}
	if len(buffRepo.upserts) != 1 {
		t.Fatalf("buff upsert count = %d, want 1", len(buffRepo.upserts))
	}
	stored := buffRepo.upserts[0]
	if stored.CharacterID != 505 {
		t.Fatalf("buff character_id = %d, want 505", stored.CharacterID)
	}
	if stored.BuffID != 3309 {
		t.Fatalf("buff_id = %d, want 3309", stored.BuffID)
	}
	if stored.BuffType != domainbuff.TypePermanent {
		t.Fatalf("buff_type = %d, want %d", stored.BuffType, domainbuff.TypePermanent)
	}
	if stored.Source != "pm_daily" {
		t.Fatalf("buff source = %q, want pm_daily", stored.Source)
	}
}

func newPMRightTestManager(t *testing.T, rights ...models.PmRightTemplate) *gamedata.Manager {
	t.Helper()

	manager := gamedata.NewManager(nil, zaptest.NewLogger(t))
	records := make([]json.RawMessage, 0, len(rights))
	for _, right := range rights {
		data, err := json.Marshal(right)
		if err != nil {
			t.Fatalf("json.Marshal returned error: %v", err)
		}
		records = append(records, data)
	}
	if err := manager.GetCache().LoadTable(models.TablePmRight, records); err != nil {
		t.Fatalf("LoadTable(TablePmRight) error = %v", err)
	}

	return manager
}

func loadPMOperationTableRows(t *testing.T, manager *gamedata.Manager, tableName string, rows ...map[string]interface{}) {
	t.Helper()
	records := make([]json.RawMessage, 0, len(rows))
	for _, row := range rows {
		data, err := json.Marshal(row)
		if err != nil {
			t.Fatalf("json.Marshal returned error: %v", err)
		}
		records = append(records, data)
	}
	if err := manager.GetCache().LoadTable(tableName, records); err != nil {
		t.Fatalf("LoadTable(%s) error = %v", tableName, err)
	}
}

func clonePremiumState(state map[string]interface{}) map[string]interface{} {
	if len(state) == 0 {
		return map[string]interface{}{}
	}
	cloned := make(map[string]interface{}, len(state))
	for key, value := range state {
		cloned[key] = value
	}
	return cloned
}
