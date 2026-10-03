// Open-sourced by BaoLT

package activity

import (
	"context"
	"encoding/json"
	"errors"
	"testing"
	"time"

	domainauth "mcgame-server/internal/domain/auth"
	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

type premiumTestCharacterRepo struct {
	characters map[int64]*domainchar.Character
}

func newPremiumTestCharacterRepo(chars ...*domainchar.Character) *premiumTestCharacterRepo {
	items := make(map[int64]*domainchar.Character, len(chars))
	for _, char := range chars {
		copyChar := *char
		items[char.ID] = &copyChar
	}
	return &premiumTestCharacterRepo{characters: items}
}

func (r *premiumTestCharacterRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	char, ok := r.characters[id]
	if !ok {
		return nil, context.Canceled
	}
	copyChar := *char
	return &copyChar, nil
}

func (r *premiumTestCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *premiumTestCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *premiumTestCharacterRepo) FindByName(ctx context.Context, name string) (*domainchar.Character, error) {
	return nil, context.Canceled
}

func (r *premiumTestCharacterRepo) Create(ctx context.Context, char *domainchar.Character) error {
	copyChar := *char
	r.characters[char.ID] = &copyChar
	return nil
}

func (r *premiumTestCharacterRepo) Update(ctx context.Context, char *domainchar.Character) error {
	copyChar := *char
	r.characters[char.ID] = &copyChar
	return nil
}

func (r *premiumTestCharacterRepo) Delete(ctx context.Context, id int64) error {
	delete(r.characters, id)
	return nil
}

func (r *premiumTestCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}

func (r *premiumTestCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos domainchar.Position) error {
	return nil
}

func (r *premiumTestCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

type premiumTestAccountRepo struct {
	accounts map[uuid.UUID]*domainauth.Account
}

func newPremiumTestAccountRepo(accounts ...*domainauth.Account) *premiumTestAccountRepo {
	items := make(map[uuid.UUID]*domainauth.Account, len(accounts))
	for _, account := range accounts {
		copyAccount := *account
		items[account.ID] = &copyAccount
	}
	return &premiumTestAccountRepo{accounts: items}
}

func (r *premiumTestAccountRepo) FindByID(ctx context.Context, id uuid.UUID) (*domainauth.Account, error) {
	account, ok := r.accounts[id]
	if !ok {
		return nil, context.Canceled
	}
	copyAccount := *account
	return &copyAccount, nil
}

func (r *premiumTestAccountRepo) FindByUsername(ctx context.Context, username string) (*domainauth.Account, error) {
	return nil, context.Canceled
}

func (r *premiumTestAccountRepo) Create(ctx context.Context, account *domainauth.Account) error {
	copyAccount := *account
	r.accounts[account.ID] = &copyAccount
	return nil
}

func (r *premiumTestAccountRepo) Update(ctx context.Context, account *domainauth.Account) error {
	copyAccount := *account
	r.accounts[account.ID] = &copyAccount
	return nil
}

func (r *premiumTestAccountRepo) ExistsByUsername(ctx context.Context, username string) (bool, error) {
	return false, nil
}

func (r *premiumTestAccountRepo) UpdateLastLogin(ctx context.Context, id uuid.UUID) error {
	return nil
}

func TestBuyPMPersistsPremiumStateAndSyncsAccountLevel(t *testing.T) {
	now := time.Date(2026, 4, 3, 9, 0, 0, 0, time.UTC)
	accountID := uuid.New()
	char := domainchar.NewCharacter(accountID, "vip", 1, 0)
	char.ID = 1001
	char.Gold = 5000
	account := &domainauth.Account{ID: accountID}

	charRepo := newPremiumTestCharacterRepo(char)
	accountRepo := newPremiumTestAccountRepo(account)
	service := NewPremiumService(charRepo, accountRepo, nil)
	service.SetNowFunc(func() time.Time { return now })

	state, err := service.BuyPM(context.Background(), char.ID, 2)
	if err != nil {
		t.Fatalf("BuyPM returned error: %v", err)
	}

	if state.PMLevel != 2 {
		t.Fatalf("state.PMLevel = %d, want 2", state.PMLevel)
	}
	if state.PMExp != 15000 {
		t.Fatalf("state.PMExp = %d, want 15000", state.PMExp)
	}
	if state.ActiveType != 2 {
		t.Fatalf("state.ActiveType = %d, want 2", state.ActiveType)
	}
	if state.KeepDay != 90 {
		t.Fatalf("state.KeepDay = %v, want 90", state.KeepDay)
	}
	if state.Gold != 3312 {
		t.Fatalf("state.Gold = %d, want 3312", state.Gold)
	}
	if state.GoldCost != 1688 {
		t.Fatalf("state.GoldCost = %d, want 1688", state.GoldCost)
	}

	storedChar, err := charRepo.FindByID(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("FindByID returned error: %v", err)
	}
	if storedChar.VIPType != 2 {
		t.Fatalf("storedChar.VIPType = %d, want 2", storedChar.VIPType)
	}
	if storedChar.VIPExpiresAt == nil {
		t.Fatal("storedChar.VIPExpiresAt = nil")
	}
	if got := storedChar.VIPExpiresAt.Sub(now); got != 90*dayDuration {
		t.Fatalf("storedChar.VIPExpiresAt delta = %v, want %v", got, 90*dayDuration)
	}
	if storedChar.Gold != 3312 {
		t.Fatalf("storedChar.Gold = %d, want 3312", storedChar.Gold)
	}
	if storedChar.PMExp != 15000 {
		t.Fatalf("storedChar.PMExp = %d, want 15000", storedChar.PMExp)
	}

	storedAccount, err := accountRepo.FindByID(context.Background(), accountID)
	if err != nil {
		t.Fatalf("FindByID account returned error: %v", err)
	}
	if storedAccount.VIPLevel != 2 {
		t.Fatalf("storedAccount.VIPLevel = %d, want 2", storedAccount.VIPLevel)
	}
}

func TestBuyPMRejectsInsufficientGold(t *testing.T) {
	now := time.Date(2026, 4, 3, 9, 0, 0, 0, time.UTC)
	accountID := uuid.New()
	char := domainchar.NewCharacter(accountID, "poor", 1, 0)
	char.ID = 1004
	char.Gold = 100
	account := &domainauth.Account{ID: accountID}

	charRepo := newPremiumTestCharacterRepo(char)
	accountRepo := newPremiumTestAccountRepo(account)
	service := NewPremiumService(charRepo, accountRepo, nil)
	service.SetNowFunc(func() time.Time { return now })

	_, err := service.BuyPM(context.Background(), char.ID, 1)
	if err == nil || err.Error() != "not enough gold" {
		t.Fatalf("BuyPM error = %v, want %q", err, "not enough gold")
	}

	storedChar, err := charRepo.FindByID(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("FindByID returned error: %v", err)
	}
	if storedChar.Gold != 100 {
		t.Fatalf("storedChar.Gold = %d, want 100", storedChar.Gold)
	}
	if storedChar.VIPType != 0 {
		t.Fatalf("storedChar.VIPType = %d, want 0", storedChar.VIPType)
	}
	if storedChar.VIPExpiresAt != nil {
		t.Fatalf("storedChar.VIPExpiresAt = %v, want nil", storedChar.VIPExpiresAt)
	}
}

func TestBuyPMAccumulatesPMExpAcrossPurchases(t *testing.T) {
	now := time.Date(2026, 4, 3, 9, 0, 0, 0, time.UTC)
	accountID := uuid.New()
	char := domainchar.NewCharacter(accountID, "accumulate", 1, 0)
	char.ID = 1010
	char.Gold = 10000
	account := &domainauth.Account{ID: accountID}

	charRepo := newPremiumTestCharacterRepo(char)
	accountRepo := newPremiumTestAccountRepo(account)
	service := NewPremiumService(charRepo, accountRepo, nil)
	service.SetNowFunc(func() time.Time { return now })

	if _, err := service.BuyPM(context.Background(), char.ID, 1); err != nil {
		t.Fatalf("first BuyPM returned error: %v", err)
	}
	state, err := service.BuyPM(context.Background(), char.ID, 3)
	if err != nil {
		t.Fatalf("second BuyPM returned error: %v", err)
	}

	wantPMExp := int64(45000)
	if state.PMExp != wantPMExp {
		t.Fatalf("state.PMExp = %d, want %d", state.PMExp, wantPMExp)
	}

	storedChar, err := charRepo.FindByID(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("FindByID returned error: %v", err)
	}
	if storedChar.PMExp != wantPMExp {
		t.Fatalf("storedChar.PMExp = %d, want %d", storedChar.PMExp, wantPMExp)
	}
}

func TestBuyPM_FirstHalfYearPurchaseSeedsPMExpToLevelThreeThreshold(t *testing.T) {
	now := time.Date(2026, 4, 3, 9, 0, 0, 0, time.UTC)
	accountID := uuid.New()
	char := domainchar.NewCharacter(accountID, "seed-threshold", 1, 0)
	char.ID = 1015
	char.Gold = 10000
	account := &domainauth.Account{ID: accountID}

	charRepo := newPremiumTestCharacterRepo(char)
	accountRepo := newPremiumTestAccountRepo(account)
	service := NewPremiumService(charRepo, accountRepo, nil)
	service.SetNowFunc(func() time.Time { return now })

	state, err := service.BuyPM(context.Background(), char.ID, 3)
	if err != nil {
		t.Fatalf("BuyPM returned error: %v", err)
	}
	if state.PMLevel != 3 {
		t.Fatalf("state.PMLevel = %d, want 3", state.PMLevel)
	}
	if state.PMExp != 45000 {
		t.Fatalf("state.PMExp = %d, want 45000", state.PMExp)
	}

	storedChar, err := charRepo.FindByID(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("FindByID returned error: %v", err)
	}
	if storedChar.PMExp != 45000 {
		t.Fatalf("storedChar.PMExp = %d, want 45000", storedChar.PMExp)
	}
	if got := storedChar.CurrentPMLevel(now); got != 3 {
		t.Fatalf("storedChar.CurrentPMLevel() = %d, want 3", got)
	}

	storedAccount, err := accountRepo.FindByID(context.Background(), accountID)
	if err != nil {
		t.Fatalf("FindByID account returned error: %v", err)
	}
	if storedAccount.VIPLevel != 3 {
		t.Fatalf("storedAccount.VIPLevel = %d, want 3", storedAccount.VIPLevel)
	}
}

func TestBuyPMRejectsDowngradeForActivePremium(t *testing.T) {
	now := time.Date(2026, 4, 3, 9, 0, 0, 0, time.UTC)
	accountID := uuid.New()
	char := domainchar.NewCharacter(accountID, "downgrade", 1, 0)
	char.ID = 1005
	char.Gold = 5000
	char.VIPType = 3
	expiresAt := now.Add(180 * dayDuration)
	char.VIPExpiresAt = &expiresAt
	account := &domainauth.Account{ID: accountID, VIPLevel: 3}

	charRepo := newPremiumTestCharacterRepo(char)
	accountRepo := newPremiumTestAccountRepo(account)
	service := NewPremiumService(charRepo, accountRepo, nil)
	service.SetNowFunc(func() time.Time { return now })

	_, err := service.BuyPM(context.Background(), char.ID, 1)
	if !errors.Is(err, pkgerrors.ErrInvalidInput) {
		t.Fatalf("BuyPM error = %v, want %v", err, pkgerrors.ErrInvalidInput)
	}

	storedChar, err := charRepo.FindByID(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("FindByID returned error: %v", err)
	}
	if storedChar.Gold != 5000 {
		t.Fatalf("storedChar.Gold = %d, want 5000", storedChar.Gold)
	}
	if storedChar.VIPType != 3 {
		t.Fatalf("storedChar.VIPType = %d, want 3", storedChar.VIPType)
	}
	if storedChar.VIPExpiresAt == nil || !storedChar.VIPExpiresAt.Equal(expiresAt) {
		t.Fatalf("storedChar.VIPExpiresAt = %v, want %v", storedChar.VIPExpiresAt, expiresAt)
	}
}

func TestGetPMStateNormalizesExpiredPremiumAndClearsMirrorLevel(t *testing.T) {
	now := time.Date(2026, 4, 3, 9, 0, 0, 0, time.UTC)
	accountID := uuid.New()
	char := domainchar.NewCharacter(accountID, "expired", 1, 0)
	char.ID = 1002
	char.VIPType = 3
	char.PMFindback = true
	expiredAt := now.Add(-time.Hour)
	char.VIPExpiresAt = &expiredAt
	char.PMExp = 555000
	char.PMProcessData = map[string]interface{}{
		pmFindbackStateKey: map[string]interface{}{"day": "3|2|4"},
		pmFindbackAuditKey: map[string]interface{}{"day": "3|2|4", "rights": []interface{}{2}},
	}
	account := &domainauth.Account{ID: accountID, VIPLevel: 7}

	charRepo := newPremiumTestCharacterRepo(char)
	accountRepo := newPremiumTestAccountRepo(account)
	service := NewPremiumService(charRepo, accountRepo, nil)
	service.SetNowFunc(func() time.Time { return now })

	state, err := service.GetPMState(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("GetPMState returned error: %v", err)
	}

	if state.PMLevel != 0 {
		t.Fatalf("state.PMLevel = %d, want 0", state.PMLevel)
	}
	if state.ActiveType != 0 {
		t.Fatalf("state.ActiveType = %d, want 0", state.ActiveType)
	}
	if state.Findback {
		t.Fatal("state.Findback = true, want false")
	}

	storedChar, err := charRepo.FindByID(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("FindByID returned error: %v", err)
	}
	if storedChar.VIPType != 0 {
		t.Fatalf("storedChar.VIPType = %d, want 0", storedChar.VIPType)
	}
	if storedChar.VIPExpiresAt != nil {
		t.Fatalf("storedChar.VIPExpiresAt = %v, want nil", storedChar.VIPExpiresAt)
	}
	if storedChar.PMFindback {
		t.Fatal("storedChar.PMFindback = true, want false")
	}
	if _, ok := storedChar.PMProcessData[pmFindbackStateKey]; ok {
		t.Fatal("expected pm findback state key to be cleared when premium expires")
	}
	if _, ok := storedChar.PMProcessData[pmFindbackAuditKey]; ok {
		t.Fatal("expected pm findback audit key to be cleared when premium expires")
	}

	storedAccount, err := accountRepo.FindByID(context.Background(), accountID)
	if err != nil {
		t.Fatalf("FindByID account returned error: %v", err)
	}
	if storedAccount.VIPLevel != 0 {
		t.Fatalf("storedAccount.VIPLevel = %d, want 0", storedAccount.VIPLevel)
	}
}

func TestGetPMStateUsesHighestLevelFromExpThresholds(t *testing.T) {
	now := time.Date(2026, 4, 3, 9, 0, 0, 0, time.UTC)
	accountID := uuid.New()
	char := domainchar.NewCharacter(accountID, "leveled", 1, 0)
	char.ID = 1003
	char.VIPType = 1
	expiresAt := now.Add(30 * dayDuration)
	char.VIPExpiresAt = &expiresAt
	char.PMExp = 555000
	account := &domainauth.Account{ID: accountID}

	charRepo := newPremiumTestCharacterRepo(char)
	accountRepo := newPremiumTestAccountRepo(account)
	service := NewPremiumService(charRepo, accountRepo, nil)
	service.SetNowFunc(func() time.Time { return now })

	state, err := service.GetPMState(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("GetPMState returned error: %v", err)
	}

	if state.PMLevel != 7 {
		t.Fatalf("state.PMLevel = %d, want 7", state.PMLevel)
	}

	storedAccount, err := accountRepo.FindByID(context.Background(), accountID)
	if err != nil {
		t.Fatalf("FindByID account returned error: %v", err)
	}
	if storedAccount.VIPLevel != 7 {
		t.Fatalf("storedAccount.VIPLevel = %d, want 7", storedAccount.VIPLevel)
	}
}

func TestGetPMState_OnlyReturnsNumericProcessFlags(t *testing.T) {
	now := time.Date(2026, 4, 3, 9, 0, 0, 0, time.UTC)
	char := domainchar.NewCharacter(uuid.New(), "pm-flags", 1, 0)
	char.ID = 1011
	char.VIPType = 1
	expiresAt := now.Add(30 * dayDuration)
	char.VIPExpiresAt = &expiresAt
	char.PMProcessData = map[string]interface{}{
		"1": map[string]interface{}{
			"day":  "3|19|0",
			"type": 1,
			"time": 1,
		},
		"interfaceData":      map[string]interface{}{"bp": true},
		pmDailyLoginStateKey: map[string]interface{}{"day": "3|19|0"},
	}

	charRepo := newPremiumTestCharacterRepo(char)
	service := NewPremiumService(charRepo, nil, nil)
	service.SetNowFunc(func() time.Time { return now })

	state, err := service.GetPMState(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("GetPMState returned error: %v", err)
	}
	if len(state.ProcessFlag) != 1 {
		t.Fatalf("len(state.ProcessFlag) = %d, want 1", len(state.ProcessFlag))
	}
	if _, ok := state.ProcessFlag["1"]; !ok {
		t.Fatalf("expected numeric process flag to be preserved")
	}
	if _, ok := state.ProcessFlag["interfaceData"]; ok {
		t.Fatal("expected interfaceData to be omitted from processFlag")
	}
	if _, ok := state.ProcessFlag[pmDailyLoginStateKey]; ok {
		t.Fatal("expected internal daily login state to be omitted from processFlag")
	}
}

func TestGrantDailyLoginPMExp_AwardsOncePerDayAndUpdatesMirrorLevel(t *testing.T) {
	now := time.Date(2026, 4, 3, 9, 0, 0, 0, time.UTC)
	accountID := uuid.New()
	char := domainchar.NewCharacter(accountID, "pm-login", 1, 0)
	char.ID = 1012
	char.VIPType = 1
	expiresAt := now.Add(30 * dayDuration)
	char.VIPExpiresAt = &expiresAt
	char.PMExp = 14900
	account := &domainauth.Account{ID: accountID, VIPLevel: 1}

	charRepo := newPremiumTestCharacterRepo(char)
	accountRepo := newPremiumTestAccountRepo(account)
	service := NewPremiumService(charRepo, accountRepo, nil)
	currentNow := now
	service.SetNowFunc(func() time.Time { return currentNow })

	change, err := service.GrantDailyLoginPMExp(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("GrantDailyLoginPMExp returned error: %v", err)
	}
	if change == nil {
		t.Fatal("GrantDailyLoginPMExp returned nil change, want reward")
	}
	if change.Delta != 500 {
		t.Fatalf("change.Delta = %d, want 500", change.Delta)
	}
	if change.PreviousPMLevel != 1 {
		t.Fatalf("change.PreviousPMLevel = %d, want 1", change.PreviousPMLevel)
	}
	if change.PMLevel != 2 {
		t.Fatalf("change.PMLevel = %d, want 2", change.PMLevel)
	}
	if change.PMExp != 15400 {
		t.Fatalf("change.PMExp = %d, want 15400", change.PMExp)
	}

	storedChar, err := charRepo.FindByID(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("FindByID returned error: %v", err)
	}
	if storedChar.PMExp != 15400 {
		t.Fatalf("storedChar.PMExp = %d, want 15400", storedChar.PMExp)
	}
	if got := storedChar.CurrentPMLevel(currentNow); got != 2 {
		t.Fatalf("storedChar.CurrentPMLevel() = %d, want 2", got)
	}
	if _, ok := storedChar.PMProcessData[pmDailyLoginStateKey]; !ok {
		t.Fatal("expected daily login PM state marker to be persisted")
	}

	storedAccount, err := accountRepo.FindByID(context.Background(), accountID)
	if err != nil {
		t.Fatalf("FindByID account returned error: %v", err)
	}
	if storedAccount.VIPLevel != 2 {
		t.Fatalf("storedAccount.VIPLevel = %d, want 2", storedAccount.VIPLevel)
	}

	secondChange, err := service.GrantDailyLoginPMExp(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("second GrantDailyLoginPMExp returned error: %v", err)
	}
	if secondChange != nil {
		t.Fatalf("second GrantDailyLoginPMExp = %#v, want nil", secondChange)
	}

	currentNow = now.Add(24 * time.Hour)
	thirdChange, err := service.GrantDailyLoginPMExp(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("third GrantDailyLoginPMExp returned error: %v", err)
	}
	if thirdChange == nil {
		t.Fatal("third GrantDailyLoginPMExp returned nil change, want reward after next day")
	}
	if thirdChange.Delta != 500 {
		t.Fatalf("thirdChange.Delta = %d, want 500", thirdChange.Delta)
	}
	if thirdChange.PMExp != 15900 {
		t.Fatalf("thirdChange.PMExp = %d, want 15900", thirdChange.PMExp)
	}
}

func TestGetPMState_GrantsPMFindbackForMissedTrackedDailyRights(t *testing.T) {
	now := time.Date(2026, 4, 4, 9, 0, 0, 0, time.UTC)
	accountID := uuid.New()
	char := domainchar.NewCharacter(accountID, "pm-findback-grant", 1, 0)
	char.ID = 1013
	char.VIPType = 3
	expiresAt := now.Add(180 * dayDuration)
	char.VIPExpiresAt = &expiresAt
	char.PMExp = 205000
	previousDay := pmToString(pmCurrentCycleDay(now.Add(-24*time.Hour), pmOperationCountConfig{CycleType: 1, Window: 1, MaxCount: 1}))
	currentDay := pmToString(pmCurrentCycleDay(now, pmOperationCountConfig{CycleType: 1, Window: 1, MaxCount: 1}))
	char.PMProcessData = map[string]interface{}{
		pmFindbackAuditKey: map[string]interface{}{
			"day":    previousDay,
			"rights": []interface{}{2},
		},
	}
	account := &domainauth.Account{ID: accountID, VIPLevel: 5}

	charRepo := newPremiumTestCharacterRepo(char)
	accountRepo := newPremiumTestAccountRepo(account)
	service := NewPremiumService(charRepo, accountRepo, nil)
	service.SetGameDataManager(newPremiumPMRightManager(t,
		models.PmRightTemplate{ID: 2, Type: 2, CountConfig: "1|1|1", Vip4: 10, Vip5: 20, Vip6: 30},
		models.PmRightTemplate{ID: 24, Type: 4, CountConfig: "1|1|1", Vip4: 1, Vip5: 1, Vip6: 1},
	))
	service.SetNowFunc(func() time.Time { return now })

	state, err := service.GetPMState(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("GetPMState returned error: %v", err)
	}
	if !state.Findback {
		t.Fatal("state.Findback = false, want true")
	}

	storedChar, err := charRepo.FindByID(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("FindByID returned error: %v", err)
	}
	if !storedChar.PMFindback {
		t.Fatal("storedChar.PMFindback = false, want true")
	}
	if got := pmReadFindbackStateDay(storedChar.PMProcessData); got != currentDay {
		t.Fatalf("pmReadFindbackStateDay() = %q, want %q", got, currentDay)
	}
	auditDay, auditRights := pmReadFindbackAudit(storedChar.PMProcessData)
	if auditDay != currentDay {
		t.Fatalf("audit day = %q, want %q", auditDay, currentDay)
	}
	if len(auditRights) != 1 || auditRights[0] != 2 {
		t.Fatalf("audit rights = %#v, want []int{2}", auditRights)
	}
	if _, ok := state.ProcessFlag[pmFindbackStateKey]; ok {
		t.Fatal("expected internal pm findback state to be omitted from processFlag")
	}
	if _, ok := state.ProcessFlag[pmFindbackAuditKey]; ok {
		t.Fatal("expected internal pm findback audit to be omitted from processFlag")
	}
}

func TestGetPMState_DoesNotRegrantPMFindbackAfterSameDayGrant(t *testing.T) {
	now := time.Date(2026, 4, 4, 9, 0, 0, 0, time.UTC)
	accountID := uuid.New()
	char := domainchar.NewCharacter(accountID, "pm-findback-once", 1, 0)
	char.ID = 1014
	char.VIPType = 3
	expiresAt := now.Add(180 * dayDuration)
	char.VIPExpiresAt = &expiresAt
	char.PMExp = 205000
	previousDay := pmToString(pmCurrentCycleDay(now.Add(-24*time.Hour), pmOperationCountConfig{CycleType: 1, Window: 1, MaxCount: 1}))
	currentDay := pmToString(pmCurrentCycleDay(now, pmOperationCountConfig{CycleType: 1, Window: 1, MaxCount: 1}))
	char.PMProcessData = map[string]interface{}{
		pmFindbackStateKey: map[string]interface{}{"day": currentDay},
		pmFindbackAuditKey: map[string]interface{}{
			"day":    previousDay,
			"rights": []interface{}{2},
		},
	}
	account := &domainauth.Account{ID: accountID, VIPLevel: 5}

	charRepo := newPremiumTestCharacterRepo(char)
	accountRepo := newPremiumTestAccountRepo(account)
	service := NewPremiumService(charRepo, accountRepo, nil)
	service.SetGameDataManager(newPremiumPMRightManager(t,
		models.PmRightTemplate{ID: 2, Type: 2, CountConfig: "1|1|1", Vip4: 10, Vip5: 20, Vip6: 30},
		models.PmRightTemplate{ID: 24, Type: 4, CountConfig: "1|1|1", Vip4: 1, Vip5: 1, Vip6: 1},
	))
	service.SetNowFunc(func() time.Time { return now })

	state, err := service.GetPMState(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("GetPMState returned error: %v", err)
	}
	if state.Findback {
		t.Fatal("state.Findback = true, want false")
	}

	storedChar, err := charRepo.FindByID(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("FindByID returned error: %v", err)
	}
	if storedChar.PMFindback {
		t.Fatal("storedChar.PMFindback = true, want false")
	}
	if got := pmReadFindbackStateDay(storedChar.PMProcessData); got != currentDay {
		t.Fatalf("pmReadFindbackStateDay() = %q, want %q", got, currentDay)
	}
	auditDay, auditRights := pmReadFindbackAudit(storedChar.PMProcessData)
	if auditDay != currentDay {
		t.Fatalf("audit day = %q, want %q", auditDay, currentDay)
	}
	if len(auditRights) != 1 || auditRights[0] != 2 {
		t.Fatalf("audit rights = %#v, want []int{2}", auditRights)
	}
}

func TestDoPMOperation_DailyLimitAndDailyReset(t *testing.T) {
	now := time.Date(2026, 4, 3, 9, 0, 0, 0, time.UTC)
	accountID := uuid.New()
	char := domainchar.NewCharacter(accountID, "pm-daily", 1, 0)
	char.ID = 2001
	char.VIPType = 3
	expiresAt := now.Add(30 * dayDuration)
	char.VIPExpiresAt = &expiresAt
	account := &domainauth.Account{ID: accountID}

	charRepo := newPremiumTestCharacterRepo(char)
	accountRepo := newPremiumTestAccountRepo(account)
	service := NewPremiumService(charRepo, accountRepo, nil)
	currentNow := now
	service.SetNowFunc(func() time.Time { return currentNow })

	input := PMOperationInput{
		Index:         1,
		OperationType: 2,
		CountConfig:   "1|1|1",
	}

	first, err := service.DoPMOperation(context.Background(), char.ID, input)
	if err != nil {
		t.Fatalf("first DoPMOperation returned error: %v", err)
	}
	if first.Time != 1 {
		t.Fatalf("first.Time = %d, want 1", first.Time)
	}
	if first.Type != 1 {
		t.Fatalf("first.Type = %d, want 1", first.Type)
	}

	_, err = service.DoPMOperation(context.Background(), char.ID, input)
	if !errors.Is(err, ErrPMOperationAlreadyClaimed) {
		t.Fatalf("second DoPMOperation error = %v, want %v", err, ErrPMOperationAlreadyClaimed)
	}

	currentNow = now.Add(24 * time.Hour)
	third, err := service.DoPMOperation(context.Background(), char.ID, input)
	if err != nil {
		t.Fatalf("third DoPMOperation returned error: %v", err)
	}
	if third.Time != 1 {
		t.Fatalf("third.Time = %d, want 1", third.Time)
	}
}

func TestDoPMOperation_WeeklyWindowLimit(t *testing.T) {
	now := time.Date(2026, 4, 6, 9, 0, 0, 0, time.UTC)
	accountID := uuid.New()
	char := domainchar.NewCharacter(accountID, "pm-week", 1, 0)
	char.ID = 2002
	char.VIPType = 4
	expiresAt := now.Add(30 * dayDuration)
	char.VIPExpiresAt = &expiresAt
	account := &domainauth.Account{ID: accountID}

	charRepo := newPremiumTestCharacterRepo(char)
	accountRepo := newPremiumTestAccountRepo(account)
	service := NewPremiumService(charRepo, accountRepo, nil)
	currentNow := now
	service.SetNowFunc(func() time.Time { return currentNow })

	input := PMOperationInput{
		Index:         10,
		OperationType: 2,
		CountConfig:   "2|7|1",
	}

	first, err := service.DoPMOperation(context.Background(), char.ID, input)
	if err != nil {
		t.Fatalf("first DoPMOperation returned error: %v", err)
	}
	if first.Time != 1 {
		t.Fatalf("first.Time = %d, want 1", first.Time)
	}

	_, err = service.DoPMOperation(context.Background(), char.ID, input)
	if !errors.Is(err, ErrPMOperationAlreadyClaimed) {
		t.Fatalf("second DoPMOperation error = %v, want %v", err, ErrPMOperationAlreadyClaimed)
	}

	currentNow = now.AddDate(0, 0, 7)
	third, err := service.DoPMOperation(context.Background(), char.ID, input)
	if err != nil {
		t.Fatalf("third DoPMOperation returned error: %v", err)
	}
	if third.Time != 1 {
		t.Fatalf("third.Time = %d, want 1", third.Time)
	}
}

func TestDoPMOperation_FindbackFlag(t *testing.T) {
	now := time.Date(2026, 4, 3, 9, 0, 0, 0, time.UTC)
	accountID := uuid.New()
	char := domainchar.NewCharacter(accountID, "pm-findback", 1, 0)
	char.ID = 2003
	char.VIPType = 4
	char.PMFindback = false
	expiresAt := now.Add(30 * dayDuration)
	char.VIPExpiresAt = &expiresAt
	account := &domainauth.Account{ID: accountID}

	charRepo := newPremiumTestCharacterRepo(char)
	accountRepo := newPremiumTestAccountRepo(account)
	service := NewPremiumService(charRepo, accountRepo, nil)
	service.SetNowFunc(func() time.Time { return now })

	input := PMOperationInput{
		Index:         24,
		OperationType: 4,
		CountConfig:   "1|1|1",
	}

	_, err := service.DoPMOperation(context.Background(), char.ID, input)
	if !errors.Is(err, ErrPMOperationExpired) {
		t.Fatalf("DoPMOperation error = %v, want %v", err, ErrPMOperationExpired)
	}

	char.PMFindback = true
	if err := charRepo.Update(context.Background(), char); err != nil {
		t.Fatalf("Update returned error: %v", err)
	}

	result, err := service.DoPMOperation(context.Background(), char.ID, input)
	if err != nil {
		t.Fatalf("DoPMOperation returned error: %v", err)
	}
	if result.Type != 4 {
		t.Fatalf("result.Type = %d, want 4", result.Type)
	}

	storedChar, err := charRepo.FindByID(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("FindByID returned error: %v", err)
	}
	if storedChar.PMFindback {
		t.Fatal("storedChar.PMFindback = true, want false")
	}
}

func newPremiumPMRightManager(t *testing.T, rights ...models.PmRightTemplate) *gamedata.Manager {
	t.Helper()

	manager := gamedata.NewManager(nil, zap.NewNop())
	records := make([]json.RawMessage, 0, len(rights))
	for _, right := range rights {
		data, err := json.Marshal(right)
		if err != nil {
			t.Fatalf("json.Marshal returned error: %v", err)
		}
		records = append(records, data)
	}
	if err := manager.GetCache().LoadTable(models.TablePmRight, records); err != nil {
		t.Fatalf("LoadTable returned error: %v", err)
	}
	return manager
}
