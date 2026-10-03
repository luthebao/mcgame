// Open-sourced by BaoLT

package auth

import (
	"context"
	"encoding/json"
	"errors"
	"testing"
	"time"

	appactivity "mcgame-server/internal/application/activity"
	appchar "mcgame-server/internal/application/character"
	appitem "mcgame-server/internal/application/item"
	apppet "mcgame-server/internal/application/pet"
	appskill "mcgame-server/internal/application/skill"
	domainachievement "mcgame-server/internal/domain/achievement"
	domainauth "mcgame-server/internal/domain/auth"
	domainchar "mcgame-server/internal/domain/character"
	domaindress "mcgame-server/internal/domain/dress"
	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"
	domainskill "mcgame-server/internal/domain/skill"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

type authTestCharacterRepo struct {
	char       *domainchar.Character
	updateCall int
}

func (r *authTestCharacterRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	if r.char == nil || r.char.ID != id {
		return nil, errors.New("character not found")
	}
	return r.char, nil
}

func (r *authTestCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *authTestCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *authTestCharacterRepo) FindByName(ctx context.Context, name string) (*domainchar.Character, error) {
	return nil, nil
}

func (r *authTestCharacterRepo) Create(ctx context.Context, character *domainchar.Character) error {
	return nil
}

func (r *authTestCharacterRepo) Update(ctx context.Context, character *domainchar.Character) error {
	r.updateCall++
	if character != nil {
		copyChar := *character
		r.char = &copyChar
	}
	return nil
}

func (r *authTestCharacterRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (r *authTestCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}

func (r *authTestCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos domainchar.Position) error {
	return nil
}

func (r *authTestCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

type authTestAccountRepo struct {
	account    *domainauth.Account
	updateCall int
}

type authTestPetRepo struct {
	pets      map[int64]*domainpet.Pet
	saveCalls int
}

type authTestAchievementProvider struct {
	snapshot domainachievement.Snapshot
	err      error
}

func (p *authTestAchievementProvider) LoadSnapshot(ctx context.Context, charID int64) (domainachievement.Snapshot, error) {
	if p.err != nil {
		return domainachievement.Snapshot{}, p.err
	}
	return p.snapshot, nil
}

func (r *authTestPetRepo) Save(ctx context.Context, pet *domainpet.Pet) error {
	r.saveCalls++
	if r.pets == nil {
		r.pets = map[int64]*domainpet.Pet{}
	}
	copyPet := *pet
	copyPet.Property = cloneAuthMap(pet.Property)
	r.pets[pet.ID] = &copyPet
	return nil
}

func (r *authTestPetRepo) FindByID(ctx context.Context, id int64) (*domainpet.Pet, error) {
	pet, ok := r.pets[id]
	if !ok {
		return nil, pkgerrors.ErrNotFound
	}
	copyPet := *pet
	copyPet.Property = cloneAuthMap(pet.Property)
	return &copyPet, nil
}

func (r *authTestPetRepo) FindByCharacterID(ctx context.Context, characterID int64) ([]*domainpet.Pet, error) {
	result := []*domainpet.Pet{}
	for _, pet := range r.pets {
		if pet != nil && pet.CharacterID == characterID {
			copyPet := *pet
			copyPet.Property = cloneAuthMap(pet.Property)
			result = append(result, &copyPet)
		}
	}
	return result, nil
}

func (r *authTestPetRepo) FindFollowingPet(ctx context.Context, characterID int64) (*domainpet.Pet, error) {
	for _, pet := range r.pets {
		if pet != nil && pet.CharacterID == characterID && pet.IsFollowing {
			copyPet := *pet
			copyPet.Property = cloneAuthMap(pet.Property)
			return &copyPet, nil
		}
	}
	return nil, nil
}

func (r *authTestPetRepo) Delete(ctx context.Context, id int64) error { return nil }

func (r *authTestPetRepo) Count(ctx context.Context, characterID int64) (int, error) {
	return 0, nil
}

func (r *authTestPetRepo) UpdateFollowState(ctx context.Context, petID int64, isFollowing bool) error {
	return nil
}

func (r *authTestPetRepo) ClearFollowing(ctx context.Context, characterID int64) error {
	return nil
}

type authTestSkillRepo struct {
	owned map[int64]map[int]bool
}

func (r *authTestSkillRepo) FindByID(ctx context.Context, id int64) (*domainskill.CharacterSkill, error) {
	return nil, pkgerrors.ErrNotFound
}

func (r *authTestSkillRepo) FindByCharacterID(ctx context.Context, charID int64) ([]*domainskill.CharacterSkill, error) {
	return nil, nil
}

func (r *authTestSkillRepo) FindByCharacterAndSkill(ctx context.Context, charID int64, skillID int) (*domainskill.CharacterSkill, error) {
	return nil, pkgerrors.ErrNotFound
}

func (r *authTestSkillRepo) FindBySlot(ctx context.Context, charID int64, slot int) (*domainskill.CharacterSkill, error) {
	return nil, pkgerrors.ErrNotFound
}

func (r *authTestSkillRepo) Create(ctx context.Context, skill *domainskill.CharacterSkill) error {
	return nil
}

func (r *authTestSkillRepo) Update(ctx context.Context, skill *domainskill.CharacterSkill) error {
	return nil
}

func (r *authTestSkillRepo) Delete(ctx context.Context, id int64) error { return nil }

func (r *authTestSkillRepo) UpdateSlot(ctx context.Context, id int64, slot *int) error { return nil }

func (r *authTestSkillRepo) UpdateCooldown(ctx context.Context, id int64, cooldownEnd *string) error {
	return nil
}

func (r *authTestSkillRepo) HasSkill(ctx context.Context, charID int64, skillID int) (bool, error) {
	if r.owned == nil {
		return false, nil
	}
	return r.owned[charID][skillID], nil
}

func (r *authTestAccountRepo) FindByID(ctx context.Context, id uuid.UUID) (*domainauth.Account, error) {
	if r.account == nil || r.account.ID != id {
		return nil, errors.New("account not found")
	}
	copyAccount := *r.account
	return &copyAccount, nil
}

func (r *authTestAccountRepo) FindByUsername(ctx context.Context, username string) (*domainauth.Account, error) {
	return nil, errors.New("account not found")
}

func (r *authTestAccountRepo) Create(ctx context.Context, account *domainauth.Account) error {
	r.account = account
	return nil
}

func (r *authTestAccountRepo) Update(ctx context.Context, account *domainauth.Account) error {
	r.updateCall++
	if account != nil {
		copyAccount := *account
		r.account = &copyAccount
	}
	return nil
}

func (r *authTestAccountRepo) ExistsByUsername(ctx context.Context, username string) (bool, error) {
	return false, nil
}

func (r *authTestAccountRepo) UpdateLastLogin(ctx context.Context, id uuid.UUID) error {
	return nil
}

type authTestItemRepo struct {
	items []*domainitem.Item
}

type authTestStartedActivityProvider struct {
	items []interface{}
	err   error
}

func (p *authTestStartedActivityProvider) BuildStartedActList(ctx context.Context) ([]interface{}, error) {
	if p.err != nil {
		return nil, p.err
	}
	return p.items, nil
}

func (r *authTestItemRepo) FindByID(ctx context.Context, id int64) (*domainitem.Item, error) {
	for _, item := range r.items {
		if item != nil && item.ID == id {
			copy := *item
			return &copy, nil
		}
	}
	return nil, pkgerrors.ErrItemNotFound
}

func (r *authTestItemRepo) FindByCharacterID(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	result := make([]*domainitem.Item, 0, len(r.items))
	for _, item := range r.items {
		if item != nil && item.CharacterID == charID {
			copy := *item
			result = append(result, &copy)
		}
	}
	return result, nil
}

func (r *authTestItemRepo) FindByCharacterAndSlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) ([]*domainitem.Item, error) {
	result := make([]*domainitem.Item, 0, len(r.items))
	for _, item := range r.items {
		if item != nil && item.CharacterID == charID && item.SlotType == slotType {
			copy := *item
			result = append(result, &copy)
		}
	}
	return result, nil
}

func (r *authTestItemRepo) FindBySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, slotIndex int) (*domainitem.Item, error) {
	for _, item := range r.items {
		if item != nil && item.CharacterID == charID && item.SlotType == slotType && item.SlotIndex == slotIndex {
			copy := *item
			return &copy, nil
		}
	}
	return nil, pkgerrors.ErrItemNotFound
}

func (r *authTestItemRepo) FindEquipped(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	return r.FindByCharacterAndSlotType(ctx, charID, domainitem.SlotTypeEquipped)
}

func (r *authTestItemRepo) Create(ctx context.Context, item *domainitem.Item) error     { return nil }
func (r *authTestItemRepo) Update(ctx context.Context, item *domainitem.Item) error     { return nil }
func (r *authTestItemRepo) Delete(ctx context.Context, id int64) error                  { return nil }
func (r *authTestItemRepo) DeleteByCharacterID(ctx context.Context, charID int64) error { return nil }
func (r *authTestItemRepo) MoveItem(ctx context.Context, id int64, slotType domainitem.SlotType, slotIndex int) error {
	return nil
}
func (r *authTestItemRepo) UpdateStack(ctx context.Context, id int64, stackCount int) error {
	return nil
}
func (r *authTestItemRepo) FindFirstEmptySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, maxSlots int) (int, error) {
	return 0, nil
}
func (r *authTestItemRepo) CountBySlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) (int, error) {
	return 0, nil
}

func TestBuildOnChooseCharactorPayload_UsesFullViewPropsInCProp(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 1001
	char.Level = 10
	char.Strength = 30
	char.Agility = 18
	char.Stamina = 20
	char.Intelligence = 15
	char.Spirit = 12
	char.AttrPoints = 4
	char.LastPoint = ""
	char.Spirituality = ""

	repo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(repo, zap.NewNop())
	h := NewHandler(nil, charService, nil, nil, nil, nil, nil, zap.NewNop())

	payload := h.buildOnChooseCharactorPayload(context.Background(), char)

	cProp, ok := payload["cProp"].(map[string]interface{})
	if !ok {
		t.Fatalf("cProp type = %T, want map[string]interface{}", payload["cProp"])
	}

	checks := map[string]interface{}{
		"finalHp":           156,
		"finalMp":           108,
		"finalSp":           150,
		"finalAttack":       52,
		"finalMAttack":      29,
		"finalDefence":      53,
		"finalMDefence":     76,
		"finalHit":          101,
		"finalCritical":     1,
		"finalDodge":        1,
		"finalSpeed":        124,
		"finalStrength":     30,
		"finalAgility":      18,
		"finalStamina":      20,
		"finalIntelligence": 15,
		"finalEnergy":       12,
		"attLastPoint":      4,
		"lastPoint":         "4",
		"spirituality":      "0",
	}
	for key, want := range checks {
		if got := cProp[key]; got != want {
			t.Fatalf("cProp[%s] = %v, want %v", key, got, want)
		}
	}
}

func TestBuildOnChooseCharactorPayload_UsesStringGuideFlagAtTopLevel(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 2002
	char.GuideLog = map[int]bool{1: true, 11: true}

	repo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(repo, zap.NewNop())
	h := NewHandler(nil, charService, nil, nil, nil, nil, nil, zap.NewNop())

	payload := h.buildOnChooseCharactorPayload(context.Background(), char)

	guideFlag, ok := payload["guideFlag"].(map[string]bool)
	if !ok {
		t.Fatalf("guideFlag type = %T, want map[string]bool", payload["guideFlag"])
	}
	if !guideFlag["1"] || !guideFlag["11"] {
		t.Fatalf("guideFlag missing expected keys, got %#v", guideFlag)
	}

	starsData, ok := payload["starsData"].(map[string]interface{})
	if !ok {
		t.Fatalf("starsData type = %T, want map[string]interface{}", payload["starsData"])
	}
	if len(starsData) != 0 {
		t.Fatalf("starsData length = %d, want 0", len(starsData))
	}
}

func TestBuildOnChooseCharactorPayload_SetsShowDailyActForNewbie(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 3003
	char.Level = 1

	repo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(repo, zap.NewNop())
	h := NewHandler(nil, charService, nil, nil, nil, nil, nil, zap.NewNop())

	payload := h.buildOnChooseCharactorPayload(context.Background(), char)

	showDailyAct, ok := payload["showDailyAct"].(bool)
	if !ok {
		t.Fatalf("showDailyAct type = %T, want bool", payload["showDailyAct"])
	}
	if !showDailyAct {
		t.Fatal("showDailyAct = false, want true")
	}
}

func TestBuildOnChooseCharactorPayload_DisablesShowDailyActForExperiencedCharacter(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 4004
	char.Level = 60
	char.GuideLog = map[int]bool{1: true}

	repo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(repo, zap.NewNop())
	h := NewHandler(nil, charService, nil, nil, nil, nil, nil, zap.NewNop())

	payload := h.buildOnChooseCharactorPayload(context.Background(), char)

	showDailyAct, ok := payload["showDailyAct"].(bool)
	if !ok {
		t.Fatalf("showDailyAct type = %T, want bool", payload["showDailyAct"])
	}
	if showDailyAct {
		t.Fatal("showDailyAct = true, want false")
	}
}

func TestBuildOnChooseCharactorPayload_IncludesMainActivityStartedEntries(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 4006

	repo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(repo, zap.NewNop())
	h := NewHandler(nil, charService, nil, nil, nil, nil, nil, zap.NewNop())

	payload := h.buildOnChooseCharactorPayload(context.Background(), char)

	startedActList, ok := payload["startedActList"].([]interface{})
	if !ok {
		t.Fatalf("startedActList type = %T, want []interface{}", payload["startedActList"])
	}
	if len(startedActList) != 84 {
		t.Fatalf("startedActList length = %d, want 84", len(startedActList))
	}

	entriesByID := make(map[int]map[string]interface{}, len(startedActList))
	for index, raw := range startedActList {
		entry, entryOK := raw.(map[string]interface{})
		if !entryOK {
			t.Fatalf("startedActList[%d] type = %T, want map[string]interface{}", index, raw)
		}
		id, idOK := entry["id"].(int)
		if !idOK {
			t.Fatalf("startedActList[%d][id] type = %T, want int", index, entry["id"])
		}
		entriesByID[id] = entry
	}

	sendCombineEntry, foundSendCombine := entriesByID[sendCombineActivityID]
	if !foundSendCombine {
		t.Fatalf("startedActList missing send combine entry id=%d", sendCombineActivityID)
	}
	if got := sendCombineEntry["flag"]; got != true {
		t.Fatalf("sendCombineEntry[flag] = %v, want true", got)
	}
	if got := sendCombineEntry["sortType"]; got != sendCombineActivitySortType {
		t.Fatalf("sendCombineEntry[sortType] = %v, want %d", got, sendCombineActivitySortType)
	}

	vipEntry, foundVIP := entriesByID[vipShopActivityID]
	if !foundVIP {
		t.Fatalf("startedActList missing vip entry id=%d", vipShopActivityID)
	}
	if got := vipEntry["flag"]; got != true {
		t.Fatalf("vipEntry[flag] = %v, want true", got)
	}
	if got := vipEntry["sortType"]; got != vipShopActivitySortType {
		t.Fatalf("vipEntry[sortType] = %v, want %d", got, vipShopActivitySortType)
	}

	autoTaskEntry, foundAutoTask := entriesByID[autoTaskActivityID]
	if !foundAutoTask {
		t.Fatalf("startedActList missing auto task entry id=%d", autoTaskActivityID)
	}
	if got := autoTaskEntry["flag"]; got != true {
		t.Fatalf("autoTaskEntry[flag] = %v, want true", got)
	}
	if got := autoTaskEntry["sortType"]; got != autoTaskActivitySortType {
		t.Fatalf("autoTaskEntry[sortType] = %v, want %d", got, autoTaskActivitySortType)
	}

	bossDailyEntry, foundBossDaily := entriesByID[bossDailyActivityID]
	if !foundBossDaily {
		t.Fatalf("startedActList missing boss daily entry id=%d", bossDailyActivityID)
	}
	if got := bossDailyEntry["flag"]; got != true {
		t.Fatalf("bossDailyEntry[flag] = %v, want true", got)
	}
	if got := bossDailyEntry["sortType"]; got != bossDailyActivitySortType {
		t.Fatalf("bossDailyEntry[sortType] = %v, want %d", got, bossDailyActivitySortType)
	}
}

func TestBuildOnChooseCharactorPayload_UsesStartedActivityProvider(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 4010

	repo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(repo, zap.NewNop())
	h := NewHandler(nil, charService, nil, nil, nil, nil, nil, zap.NewNop())
	h.SetStartedActivityListProvider(&authTestStartedActivityProvider{
		items: []interface{}{
			map[string]interface{}{"id": 49, "flag": true, "sortType": 2},
			map[string]interface{}{"id": 12, "flag": false, "sortType": 5},
		},
	})

	payload := h.buildOnChooseCharactorPayload(context.Background(), char)

	startedActList, ok := payload["startedActList"].([]interface{})
	if !ok {
		t.Fatalf("startedActList type = %T, want []interface{}", payload["startedActList"])
	}
	if len(startedActList) != 2 {
		t.Fatalf("startedActList length = %d, want 2", len(startedActList))
	}

	first, ok := startedActList[0].(map[string]interface{})
	if !ok {
		t.Fatalf("startedActList[0] type = %T, want map[string]interface{}", startedActList[0])
	}
	if got := first["id"]; got != 49 {
		t.Fatalf("startedActList[0][id] = %v, want 49", got)
	}
	if got := first["sortType"]; got != 2 {
		t.Fatalf("startedActList[0][sortType] = %v, want 2", got)
	}
}

func TestBuildOnChooseCharactorPayload_IncludesPMLevel(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 4007
	char.VIPType = 1
	expiresAt := time.Now().Add(24 * time.Hour)
	char.VIPExpiresAt = &expiresAt

	repo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(repo, zap.NewNop())
	h := NewHandler(nil, charService, nil, nil, nil, nil, nil, zap.NewNop())

	payload := h.buildOnChooseCharactorPayload(context.Background(), char)
	cData := payload["cData"].(map[string]interface{})

	if got := cData["pmLevel"]; got != 1 {
		t.Fatalf("cData[pmLevel] = %v, want 1", got)
	}
}

func TestBuildOnChooseCharactorPayload_IncludesGMLevel(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 4008
	char.GMLevel = 5

	repo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(repo, zap.NewNop())
	h := NewHandler(nil, charService, nil, nil, nil, nil, nil, zap.NewNop())

	payload := h.buildOnChooseCharactorPayload(context.Background(), char)
	cData := payload["cData"].(map[string]interface{})
	cProp := payload["cProp"].(map[string]interface{})

	if got := cData["gmLevel"]; got != 5 {
		t.Fatalf("cData[gmLevel] = %v, want 5", got)
	}
	if got := cProp["gmLevel"]; got != 5 {
		t.Fatalf("cProp[gmLevel] = %v, want 5", got)
	}
}

func TestSyncCharacterPremiumState_ClearsExpiredVIPAndMirrorLevel(t *testing.T) {
	accountID := uuid.New()
	char := domainchar.NewCharacter(accountID, "tester", 1, 0)
	char.ID = 4008
	char.VIPType = 3
	expiredAt := time.Now().Add(-time.Hour)
	char.VIPExpiresAt = &expiredAt

	charRepo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(charRepo, zap.NewNop())
	accountRepo := &authTestAccountRepo{account: &domainauth.Account{ID: accountID, VIPLevel: 7}}
	h := NewHandler(nil, charService, nil, nil, nil, nil, accountRepo, zap.NewNop())

	if err := h.syncCharacterPremiumState(context.Background(), char); err != nil {
		t.Fatalf("syncCharacterPremiumState() error = %v", err)
	}
	if charRepo.updateCall != 1 {
		t.Fatalf("charRepo.updateCall = %d, want 1", charRepo.updateCall)
	}
	if charRepo.char.VIPType != 0 {
		t.Fatalf("charRepo.char.VIPType = %d, want 0", charRepo.char.VIPType)
	}
	if charRepo.char.VIPExpiresAt != nil {
		t.Fatalf("charRepo.char.VIPExpiresAt = %v, want nil", charRepo.char.VIPExpiresAt)
	}
	if accountRepo.updateCall != 1 {
		t.Fatalf("accountRepo.updateCall = %d, want 1", accountRepo.updateCall)
	}
	if accountRepo.account.VIPLevel != 0 {
		t.Fatalf("accountRepo.account.VIPLevel = %d, want 0", accountRepo.account.VIPLevel)
	}
}

func TestSyncCharacterPremiumState_SyncsActiveMirrorLevelWithoutCharacterWrite(t *testing.T) {
	accountID := uuid.New()
	char := domainchar.NewCharacter(accountID, "tester", 1, 0)
	char.ID = 4009
	char.VIPType = 2
	expiresAt := time.Now().Add(24 * time.Hour)
	char.VIPExpiresAt = &expiresAt
	char.PMExp = 555000

	charRepo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(charRepo, zap.NewNop())
	accountRepo := &authTestAccountRepo{account: &domainauth.Account{ID: accountID, VIPLevel: 0}}
	h := NewHandler(nil, charService, nil, nil, nil, nil, accountRepo, zap.NewNop())

	if err := h.syncCharacterPremiumState(context.Background(), char); err != nil {
		t.Fatalf("syncCharacterPremiumState() error = %v", err)
	}
	if charRepo.updateCall != 0 {
		t.Fatalf("charRepo.updateCall = %d, want 0", charRepo.updateCall)
	}
	if accountRepo.updateCall != 1 {
		t.Fatalf("accountRepo.updateCall = %d, want 1", accountRepo.updateCall)
	}
	if accountRepo.account.VIPLevel != 7 {
		t.Fatalf("accountRepo.account.VIPLevel = %d, want 7", accountRepo.account.VIPLevel)
	}
}

func TestChooseCharacter_GrantsDailyPMLoginExpOncePerDay(t *testing.T) {
	now := time.Date(2026, 4, 19, 9, 0, 0, 0, time.UTC)
	accountID := uuid.New()
	char := domainchar.NewCharacter(accountID, "tester", 1, 0)
	char.ID = 4010
	char.VIPType = 1
	expiresAt := now.Add(30 * 24 * time.Hour)
	char.VIPExpiresAt = &expiresAt
	char.PMExp = 14900

	charRepo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(charRepo, zap.NewNop())
	accountRepo := &authTestAccountRepo{account: &domainauth.Account{ID: accountID, VIPLevel: 1}}
	premiumService := appactivity.NewPremiumService(charRepo, accountRepo, zap.NewNop())
	premiumService.SetNowFunc(func() time.Time { return now })

	h := NewHandler(nil, charService, nil, nil, nil, nil, accountRepo, zap.NewNop())
	h.SetPremiumService(premiumService)

	ctx := &rtmp.RPCContext{
		Context:    context.Background(),
		ConnID:     1,
		AccountID:  accountID.String(),
		Connection: rtmp.NewConnection(1, nil, nil, zap.NewNop()),
	}

	result, err := h.ChooseCharacter(ctx, []interface{}{float64(char.ID)})
	if err != nil {
		t.Fatalf("ChooseCharacter() error = %v", err)
	}
	if result != nil {
		t.Fatalf("ChooseCharacter() result = %#v, want nil", result)
	}
	if charRepo.char.PMExp != 15400 {
		t.Fatalf("charRepo.char.PMExp = %d, want 15400", charRepo.char.PMExp)
	}
	if got := charRepo.char.CurrentPMLevel(now); got != 2 {
		t.Fatalf("charRepo.char.CurrentPMLevel() = %d, want 2", got)
	}
	if accountRepo.account.VIPLevel != 2 {
		t.Fatalf("accountRepo.account.VIPLevel = %d, want 2", accountRepo.account.VIPLevel)
	}

	_, err = h.ChooseCharacter(ctx, []interface{}{float64(char.ID)})
	if err != nil {
		t.Fatalf("second ChooseCharacter() error = %v", err)
	}
	if charRepo.char.PMExp != 15400 {
		t.Fatalf("charRepo.char.PMExp after second login = %d, want 15400", charRepo.char.PMExp)
	}
}

func TestBuildOnChooseCharactorPayload_IncludesPetGuardState(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 4005
	char.PetGuardOut = 0
	char.PetGuardIn = 0
	char.PetGuardData = map[string]interface{}{
		"lvData": map[string]interface{}{
			"0": 2,
			"1": 7,
		},
		"petData": map[string]interface{}{
			"1":  101,
			"12": 202,
		},
	}

	repo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(repo, zap.NewNop())
	h := NewHandler(nil, charService, nil, nil, nil, nil, nil, zap.NewNop())

	payload := h.buildOnChooseCharactorPayload(context.Background(), char)
	cData := payload["cData"].(map[string]interface{})
	petGuardData := payload["petGuardData"].(map[string]interface{})
	lvData := petGuardData["lvData"].(map[string]interface{})
	petData := petGuardData["petData"].(map[string]interface{})

	if got := cData["petguardout"]; got != 0 {
		t.Fatalf("cData[petguardout] = %v, want 0", got)
	}
	if got := cData["petguardin"]; got != 0 {
		t.Fatalf("cData[petguardin] = %v, want 0", got)
	}
	if got := lvData["0"]; got != 2 {
		t.Fatalf("petGuardData.lvData[0] = %v, want 2", got)
	}
	if got := lvData["1"]; got != 7 {
		t.Fatalf("petGuardData.lvData[1] = %v, want 7", got)
	}
	if got := petData["1"]; got != int64(101) {
		t.Fatalf("petGuardData.petData[1] = %v, want 101", got)
	}
	if got := petData["12"]; got != int64(202) {
		t.Fatalf("petGuardData.petData[12] = %v, want 202", got)
	}
	if got := petData["45"]; got != int64(0) {
		t.Fatalf("petGuardData.petData[45] = %v, want 0", got)
	}
}

func TestBuildMoneyPreferenceSettings_DefaultsToBoundCurrencies(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)

	settings := buildMoneyPreferenceSettings(char)

	if got := settings["defaultMoney"]; got != 1 {
		t.Fatalf("defaultMoney = %v, want 1", got)
	}
	if got := settings["defaultGold"]; got != 1 {
		t.Fatalf("defaultGold = %v, want 1", got)
	}
}

func TestBuildMoneyPreferenceSettings_UsesSelectedUnboundTypeForActiveCurrency(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.SelectedGoldType = 4

	settings := buildMoneyPreferenceSettings(char)

	if got := settings["defaultMoney"]; got != 1 {
		t.Fatalf("defaultMoney = %v, want 1", got)
	}
	if got := settings["defaultGold"]; got != 2 {
		t.Fatalf("defaultGold = %v, want 2", got)
	}
}

func TestBuildMoneyPreferenceSettings_UsesIndependentSilverAndGoldSelections(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.SelectedMoneyType = 2
	char.SelectedGoldType = 4

	settings := buildMoneyPreferenceSettings(char)

	if got := settings["defaultMoney"]; got != 2 {
		t.Fatalf("defaultMoney = %v, want 2", got)
	}
	if got := settings["defaultGold"]; got != 2 {
		t.Fatalf("defaultGold = %v, want 2", got)
	}
}

func TestBuildOnChooseCharactorPayload_IncludesPersistedInterfaceSettings(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 4001
	char.PMProcessData[interfaceSettingsPMKey] = map[string]interface{}{
		"sid1": 1201,
		"st1":  52,
		"p2":   33,
		"am":   0,
	}

	petRepo := &authTestPetRepo{
		pets: map[int64]*domainpet.Pet{
			77: {
				ID:          77,
				CharacterID: char.ID,
				IsFollowing: true,
				Property: map[string]interface{}{
					"p6":  44,
					"bt2": 52,
					"bs2": 8801,
				},
			},
		},
	}
	petService := apppet.NewService(petRepo, zap.NewNop())
	h := NewHandler(nil, nil, nil, petService, nil, nil, nil, zap.NewNop())

	payload := h.buildOnChooseCharactorPayload(context.Background(), char)
	interfaceData := payload["interfaceData"].(map[string]interface{})

	if got := interfaceData["sid1"]; got != 1201 {
		t.Fatalf("interfaceData[sid1] = %v, want 1201", got)
	}
	if got := interfaceData["st1"]; got != 52 {
		t.Fatalf("interfaceData[st1] = %v, want 52", got)
	}
	if got := interfaceData["p2"]; got != 33 {
		t.Fatalf("interfaceData[p2] = %v, want 33", got)
	}
	if got := interfaceData["am"]; got != 0 {
		t.Fatalf("interfaceData[am] = %v, want 0", got)
	}
	if got := interfaceData["p6"]; got != 44 {
		t.Fatalf("interfaceData[p6] = %v, want 44", got)
	}
	if got := interfaceData["bt2"]; got != 52 {
		t.Fatalf("interfaceData[bt2] = %v, want 52", got)
	}
	if got := interfaceData["bs2"]; got != 8801 {
		t.Fatalf("interfaceData[bs2] = %v, want 8801", got)
	}
}

func TestBuildOnChooseCharactorPayload_IncludesNormalizedDressInfo(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 4003

	h := NewHandler(nil, nil, nil, nil, nil, nil, nil, zap.NewNop())
	payload := h.buildOnChooseCharactorPayload(context.Background(), char)
	cData := payload["cData"].(map[string]interface{})

	wantDefault, err := domaindress.NewInfo().EncodeClient()
	if err != nil {
		t.Fatalf("encode default dress info: %v", err)
	}
	if got := cData["dressInfo"]; got != wantDefault {
		t.Fatalf("cData[dressInfo] = %v, want %v", got, wantDefault)
	}

	char.DressInfo = "{\"book\":{\"12\":1},\"recipe\":{},\"bag\":{\"crystal\":0,\"jewel\":0},\"extract\":0,\"score\":0}"
	payload = h.buildOnChooseCharactorPayload(context.Background(), char)
	cData = payload["cData"].(map[string]interface{})

	wantStored, err := domaindress.Decode(char.DressInfo)
	if err != nil {
		t.Fatalf("decode stored dress info: %v", err)
	}
	wantStoredEncoded, err := wantStored.EncodeClient()
	if err != nil {
		t.Fatalf("encode stored dress info: %v", err)
	}
	if got := cData["dressInfo"]; got != wantStoredEncoded {
		t.Fatalf("cData[dressInfo] = %v, want %v", got, wantStoredEncoded)
	}

	char.DressInfo = "{\"book\":{\"12\":1}}"
	payload = h.buildOnChooseCharactorPayload(context.Background(), char)
	cData = payload["cData"].(map[string]interface{})

	wantPartial, err := domaindress.Decode(char.DressInfo)
	if err != nil {
		t.Fatalf("decode partial dress info: %v", err)
	}
	wantPartialEncoded, err := wantPartial.EncodeClient()
	if err != nil {
		t.Fatalf("encode partial dress info: %v", err)
	}
	if got := cData["dressInfo"]; got != wantPartialEncoded {
		t.Fatalf("cData[dressInfo] = %v, want %v", got, wantPartialEncoded)
	}

	char.DressInfo = "{\"book\":{\"12\":1},\"recipe\":{},\"bag\":{\"crystal\":0,\"jewel\":0},\"extract\":0,\"score\":0,\"fakeDressId\":0,\"fakeFlyDressId\":0,\"day\":\"2026-04-21\"}"
	payload = h.buildOnChooseCharactorPayload(context.Background(), char)
	cData = payload["cData"].(map[string]interface{})

	wantWithDay, err := domaindress.Decode(char.DressInfo)
	if err != nil {
		t.Fatalf("decode dress info with day: %v", err)
	}
	wantWithDayEncoded, err := wantWithDay.EncodeClient()
	if err != nil {
		t.Fatalf("encode client dress info with day: %v", err)
	}
	if got := cData["dressInfo"]; got != wantWithDayEncoded {
		t.Fatalf("cData[dressInfo] = %v, want %v", got, wantWithDayEncoded)
	}
}

func TestBuildOnChooseCharactorPayload_ShishangdianMirrorsShopGold(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 4004
	char.ShopGold = 12345

	h := NewHandler(nil, nil, nil, nil, nil, nil, nil, zap.NewNop())
	payload := h.buildOnChooseCharactorPayload(context.Background(), char)
	cData := payload["cData"].(map[string]interface{})

	if got := cData["shishangdian"]; got != 12345 {
		t.Fatalf("cData[shishangdian] = %v, want 12345", got)
	}
}

func TestBuildOnChooseCharactorPayload_IncludesAchievementSnapshot(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 4500

	h := NewHandler(nil, nil, nil, nil, nil, nil, nil, zap.NewNop())
	h.SetAchievementSnapshotProvider(&authTestAchievementProvider{
		snapshot: domainachievement.Snapshot{
			AchieveLog: map[string]interface{}{
				"1001": int64(1713693600000),
			},
			AchieveReqLog: map[string]interface{}{
				"1002": map[string]interface{}{"done": 8, "progress": 3},
			},
			TakeAchieveAwardLog: map[string]interface{}{
				"1001": 1,
			},
			AchievementPoints: 12,
		},
	})

	payload := h.buildOnChooseCharactorPayload(context.Background(), char)
	cData := payload["cData"].(map[string]interface{})

	if got := cData["achPnt"]; got != 12 {
		t.Fatalf("cData[achPnt] = %v, want 12", got)
	}
	if got := payload["achieveLog"].(map[string]interface{})["1001"]; got != int64(1713693600000) {
		t.Fatalf("achieveLog[1001] = %v, want 1713693600000", got)
	}
	if got := payload["takeAchieveAwardLog"].(map[string]interface{})["1001"]; got != 1 {
		t.Fatalf("takeAchieveAwardLog[1001] = %v, want 1", got)
	}

	reqLog, ok := payload["achieveReqLog"].(map[string]interface{})["1002"].(map[string]interface{})
	if !ok {
		t.Fatalf("achieveReqLog[1002] type = %T, want map[string]interface{}", payload["achieveReqLog"].(map[string]interface{})["1002"])
	}
	if got := reqLog["done"]; got != 8 {
		t.Fatalf("achieveReqLog[1002][done] = %v, want 8", got)
	}
	if got := reqLog["progress"]; got != 3 {
		t.Fatalf("achieveReqLog[1002][progress] = %v, want 3", got)
	}
}

func TestUpdateSettings_PersistsInterfaceSettingMap(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 4002
	repo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(repo, zap.NewNop())
	h := NewHandler(nil, charService, nil, nil, nil, nil, nil, zap.NewNop())

	ctx := &rtmp.RPCContext{
		Context:     context.Background(),
		ConnID:      1,
		CharacterID: "4002",
		Connection:  rtmp.NewConnection(1, nil, nil, zap.NewNop()),
	}

	if _, err := h.UpdateSettings(ctx, []interface{}{map[string]interface{}{"maxView": float64(88), "am": false}}); err != nil {
		t.Fatalf("UpdateSettings error = %v", err)
	}

	settings := repo.char.PMProcessData[interfaceSettingsPMKey].(map[string]interface{})
	if got := settings["maxView"]; got != 88 {
		t.Fatalf("settings[maxView] = %v, want 88", got)
	}
	if got := settings["am"]; got != false {
		t.Fatalf("settings[am] = %v, want false", got)
	}
}

func TestUpdateInterfaceSetting_PersistsCharacterSetting(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 4003
	repo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(repo, zap.NewNop())
	h := NewHandler(nil, charService, nil, nil, nil, nil, nil, zap.NewNop())

	ctx := &rtmp.RPCContext{
		Context:     context.Background(),
		ConnID:      1,
		CharacterID: "4003",
		Connection:  rtmp.NewConnection(1, nil, nil, zap.NewNop()),
	}

	if _, err := h.UpdateInterfaceSetting(ctx, []interface{}{"flyEffect", true, false}); err != nil {
		t.Fatalf("UpdateInterfaceSetting error = %v", err)
	}

	settings := repo.char.PMProcessData[interfaceSettingsPMKey].(map[string]interface{})
	if got := settings["flyEffect"]; got != true {
		t.Fatalf("settings[flyEffect] = %v, want true", got)
	}
}

func TestSkillSetUserBar_PersistsCharacterSkillSlot(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 4004
	charRepo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(charRepo, zap.NewNop())
	skillRepo := &authTestSkillRepo{
		owned: map[int64]map[int]bool{
			char.ID: {1201: true},
		},
	}
	skillService := appskill.NewService(skillRepo, zap.NewNop())
	h := NewHandler(nil, charService, nil, nil, nil, skillService, nil, zap.NewNop())

	ctx := &rtmp.RPCContext{
		Context:     context.Background(),
		ConnID:      1,
		CharacterID: "4004",
		Connection:  rtmp.NewConnection(1, nil, nil, zap.NewNop()),
	}

	if _, err := h.SkillSetUserBar(ctx, []interface{}{float64(1201), float64(3), float64(2)}); err != nil {
		t.Fatalf("SkillSetUserBar error = %v", err)
	}

	settings := charRepo.char.PMProcessData[interfaceSettingsPMKey].(map[string]interface{})
	if got := settings["st2"]; got != 52 {
		t.Fatalf("settings[st2] = %v, want 52", got)
	}
	if got := settings["sid2"]; got != 1201 {
		t.Fatalf("settings[sid2] = %v, want 1201", got)
	}
}

func TestSkillSetUserBar_AcceptsStringSlot(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 4014
	charRepo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(charRepo, zap.NewNop())
	skillRepo := &authTestSkillRepo{
		owned: map[int64]map[int]bool{
			char.ID: {1201: true},
		},
	}
	skillService := appskill.NewService(skillRepo, zap.NewNop())
	h := NewHandler(nil, charService, nil, nil, nil, skillService, nil, zap.NewNop())

	ctx := &rtmp.RPCContext{
		Context:     context.Background(),
		ConnID:      1,
		CharacterID: "4014",
		Connection:  rtmp.NewConnection(1, nil, nil, zap.NewNop()),
	}

	if _, err := h.SkillSetUserBar(ctx, []interface{}{float64(1201), float64(3), "2"}); err != nil {
		t.Fatalf("SkillSetUserBar error = %v", err)
	}

	settings := charRepo.char.PMProcessData[interfaceSettingsPMKey].(map[string]interface{})
	if got := settings["st2"]; got != 52 {
		t.Fatalf("settings[st2] = %v, want 52", got)
	}
	if got := settings["sid2"]; got != 1201 {
		t.Fatalf("settings[sid2] = %v, want 1201", got)
	}
}

func TestSkillSetBattle_PersistsPetSkillSlot(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 4005
	charRepo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(charRepo, zap.NewNop())
	petRepo := &authTestPetRepo{
		pets: map[int64]*domainpet.Pet{
			88: {
				ID:          88,
				CharacterID: char.ID,
				IsFollowing: true,
				Property: map[string]interface{}{
					"skill1": 8801,
				},
			},
		},
	}
	petService := apppet.NewService(petRepo, zap.NewNop())
	h := NewHandler(nil, charService, nil, petService, nil, nil, nil, zap.NewNop())

	ctx := &rtmp.RPCContext{
		Context:     context.Background(),
		ConnID:      1,
		CharacterID: "4005",
		Connection:  rtmp.NewConnection(1, nil, nil, zap.NewNop()),
	}

	if _, err := h.SkillSetBattle(ctx, []interface{}{float64(8801), float64(1), float64(2), true}); err != nil {
		t.Fatalf("SkillSetBattle error = %v", err)
	}

	pet := petRepo.pets[88]
	if got := pet.Property["bt2"]; got != 52 {
		t.Fatalf("pet.Property[bt2] = %v, want 52", got)
	}
	if got := pet.Property["bs2"]; got != 8801 {
		t.Fatalf("pet.Property[bs2] = %v, want 8801", got)
	}
}

func TestSkillSetBattle_AcceptsStringSlot(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 4015
	charRepo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(charRepo, zap.NewNop())
	petRepo := &authTestPetRepo{
		pets: map[int64]*domainpet.Pet{
			88: {
				ID:          88,
				CharacterID: char.ID,
				IsFollowing: true,
				Property: map[string]interface{}{
					"skill1": 8801,
				},
			},
		},
	}
	petService := apppet.NewService(petRepo, zap.NewNop())
	h := NewHandler(nil, charService, nil, petService, nil, nil, nil, zap.NewNop())

	ctx := &rtmp.RPCContext{
		Context:     context.Background(),
		ConnID:      1,
		CharacterID: "4015",
		Connection:  rtmp.NewConnection(1, nil, nil, zap.NewNop()),
	}

	if _, err := h.SkillSetBattle(ctx, []interface{}{float64(8801), float64(1), "2", true}); err != nil {
		t.Fatalf("SkillSetBattle error = %v", err)
	}

	pet := petRepo.pets[88]
	if got := pet.Property["bt2"]; got != 52 {
		t.Fatalf("pet.Property[bt2] = %v, want 52", got)
	}
	if got := pet.Property["bs2"]; got != 8801 {
		t.Fatalf("pet.Property[bs2] = %v, want 8801", got)
	}
}

func TestSetBp_StoresPlayerFrontPreferenceOnConnection(t *testing.T) {
	h := NewHandler(nil, nil, nil, nil, nil, nil, nil, zap.NewNop())
	conn := rtmp.NewConnection(1, nil, nil, zap.NewNop())
	ctx := &rtmp.RPCContext{
		Context:    context.Background(),
		ConnID:     1,
		Connection: conn,
	}

	if _, err := h.SetBp(ctx, []interface{}{false}); err != nil {
		t.Fatalf("SetBp(false) error = %v", err)
	}
	if conn.IsPlayerInFront() {
		t.Fatalf("IsPlayerInFront() = true, want false")
	}

	if _, err := h.SetBp(ctx, []interface{}{true}); err != nil {
		t.Fatalf("SetBp(true) error = %v", err)
	}
	if !conn.IsPlayerInFront() {
		t.Fatalf("IsPlayerInFront() = false, want true")
	}
}

func TestBuildOnChooseCharactorPayload_IncludesEquippedAppearanceData(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 3003
	char.Ee = "2"
	char.Ef = true

	charRepo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(charRepo, zap.NewNop())
	itemRepo := &authTestItemRepo{items: []*domainitem.Item{
		{ID: 11, CharacterID: char.ID, TemplateID: 2001, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 2, StarLevel: 7},
		{ID: 12, CharacterID: char.ID, TemplateID: 2002, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 13},
	}}
	itemService := appitem.NewService(itemRepo, zap.NewNop())
	manager := gamedata.NewManager(nil, zap.NewNop())
	if err := manager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{
		mustAuthJSON(t, models.EquiptTemplateTemplate{ID: 2001, Position: 3, ResCodeMale: 9101, ResCodeFemale: 9201}),
		mustAuthJSON(t, models.EquiptTemplateTemplate{ID: 2002, Position: 14, ResCode: 9301, WavCode: 9302}),
	}); err != nil {
		t.Fatalf("load equipment templates: %v", err)
	}
	itemService.SetGameDataManager(manager)

	h := NewHandler(nil, charService, itemService, nil, nil, nil, nil, zap.NewNop())
	payload := h.buildOnChooseCharactorPayload(context.Background(), char)
	cData := payload["cData"].(map[string]interface{})

	if got := cData["wp"]; got != int64(9101) {
		t.Fatalf("cData[wp] = %v, want 9101", got)
	}
	if got := cData["flyerResCode"]; got != int64(9301) {
		t.Fatalf("cData[flyerResCode] = %v, want 9301", got)
	}
	if got := cData["flyerFrontResCode"]; got != int64(9302) {
		t.Fatalf("cData[flyerFrontResCode] = %v, want 9302", got)
	}
	if got := cData["star"]; got != 7 {
		t.Fatalf("cData[star] = %v, want 7", got)
	}
	equiptList, ok := cData["equiptList"].(map[string]interface{})
	if !ok {
		t.Fatalf("equiptList type = %T, want map[string]interface{}", cData["equiptList"])
	}
	if _, ok := equiptList["3"]; !ok {
		t.Fatalf("equiptList missing weapon slot: %#v", equiptList)
	}
	if _, ok := equiptList["14"]; !ok {
		t.Fatalf("equiptList missing flyer slot: %#v", equiptList)
	}
}

func TestBuildOnChooseCharactorPayload_UsesFakeDressAndDressHideForLoginAppearance(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 3010
	char.PMProcessData[interfaceSettingsPMKey] = map[string]interface{}{}

	info := domaindress.NewInfo()
	info.FakeDressID = 7001
	encodedDressInfo, err := info.Encode()
	if err != nil {
		t.Fatalf("encode dress info: %v", err)
	}
	char.DressInfo = encodedDressInfo

	charRepo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(charRepo, zap.NewNop())
	itemRepo := &authTestItemRepo{items: []*domainitem.Item{
		{ID: 41, CharacterID: char.ID, TemplateID: 2003, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 20},
	}}
	itemService := appitem.NewService(itemRepo, zap.NewNop())
	manager := gamedata.NewManager(nil, zap.NewNop())
	if err := manager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{
		mustAuthJSON(t, models.EquiptTemplateTemplate{ID: 2003, Position: 21, ResCodeMale: 9301}),
		mustAuthJSON(t, models.EquiptTemplateTemplate{ID: 2004, Position: 21, ResCodeMale: 9401}),
	}); err != nil {
		t.Fatalf("load equipment templates: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableDress, []json.RawMessage{
		mustAuthJSON(t, models.DressTemplate{ID: 7001, EquiptID: 2004}),
	}); err != nil {
		t.Fatalf("load dress templates: %v", err)
	}
	itemService.SetGameDataManager(manager)

	h := NewHandler(nil, charService, itemService, nil, nil, nil, nil, zap.NewNop())
	payload := h.buildOnChooseCharactorPayload(context.Background(), char)
	cData := payload["cData"].(map[string]interface{})

	if got := cData["dressResCode"]; got != int64(9401) {
		t.Fatalf("cData[dressResCode] = %v, want 9401", got)
	}

	char.PMProcessData[interfaceSettingsPMKey] = map[string]interface{}{"dressHide": 1}
	payload = h.buildOnChooseCharactorPayload(context.Background(), char)
	cData = payload["cData"].(map[string]interface{})
	if _, ok := cData["dressResCode"]; ok {
		t.Fatalf("expected hidden dress to omit dressResCode, got %#v", cData["dressResCode"])
	}

	info.FakeDressID = 0
	encodedDressInfo, err = info.Encode()
	if err != nil {
		t.Fatalf("encode dress info without fake dress: %v", err)
	}
	char.DressInfo = encodedDressInfo
	char.PMProcessData[interfaceSettingsPMKey] = map[string]interface{}{}
	payload = h.buildOnChooseCharactorPayload(context.Background(), char)
	cData = payload["cData"].(map[string]interface{})
	if got := cData["dressResCode"]; got != int64(9301) {
		t.Fatalf("cData[dressResCode] = %v, want 9301", got)
	}

	char.PMProcessData["pm13Transform"] = map[string]interface{}{"resCode": 7777}
	payload = h.buildOnChooseCharactorPayload(context.Background(), char)
	cData = payload["cData"].(map[string]interface{})
	if got := cData["resCode"]; got != int64(7777) {
		t.Fatalf("cData[resCode] = %v, want 7777", got)
	}
	if _, ok := cData["dressResCode"]; ok {
		t.Fatalf("expected transformed appearance to omit dressResCode, got %#v", cData["dressResCode"])
	}
}

func TestBuildOnChooseCharactorPayload_UsesFakeFlyerForLoginAppearance(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 3012

	info := domaindress.NewInfo()
	info.FakeFlyDressID = 7002
	encodedDressInfo, err := info.Encode()
	if err != nil {
		t.Fatalf("encode dress info: %v", err)
	}
	char.DressInfo = encodedDressInfo

	charRepo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(charRepo, zap.NewNop())
	itemRepo := &authTestItemRepo{items: []*domainitem.Item{
		{ID: 61, CharacterID: char.ID, TemplateID: 2010, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 13},
	}}
	itemService := appitem.NewService(itemRepo, zap.NewNop())
	manager := gamedata.NewManager(nil, zap.NewNop())
	if err := manager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{
		mustAuthJSON(t, models.EquiptTemplateTemplate{ID: 2010, Position: 14, ResCode: 9301, WavCode: 9302}),
		mustAuthJSON(t, models.EquiptTemplateTemplate{ID: 2011, Position: 14, ResCode: 9401, WavCode: 9402}),
	}); err != nil {
		t.Fatalf("load equipment templates: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableDress, []json.RawMessage{
		mustAuthJSON(t, models.DressTemplate{ID: 7002, EquiptID: 2011}),
	}); err != nil {
		t.Fatalf("load dress templates: %v", err)
	}
	itemService.SetGameDataManager(manager)

	h := NewHandler(nil, charService, itemService, nil, nil, nil, nil, zap.NewNop())
	payload := h.buildOnChooseCharactorPayload(context.Background(), char)
	cData := payload["cData"].(map[string]interface{})

	if got := cData["flyerResCode"]; got != int64(9401) {
		t.Fatalf("cData[flyerResCode] = %v, want 9401", got)
	}
	if got := cData["flyerFrontResCode"]; got != int64(9402) {
		t.Fatalf("cData[flyerFrontResCode] = %v, want 9402", got)
	}
}

func TestBuildOnChooseCharactorPayload_IgnoresFakeDressWithoutEquippedDress(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 3011

	info := domaindress.NewInfo()
	info.FakeDressID = 7001
	encodedDressInfo, err := info.Encode()
	if err != nil {
		t.Fatalf("encode dress info: %v", err)
	}
	char.DressInfo = encodedDressInfo

	charRepo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(charRepo, zap.NewNop())
	itemRepo := &authTestItemRepo{}
	itemService := appitem.NewService(itemRepo, zap.NewNop())
	manager := gamedata.NewManager(nil, zap.NewNop())
	if err := manager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{
		mustAuthJSON(t, models.EquiptTemplateTemplate{ID: 2004, Position: 21, ResCodeMale: 9401}),
	}); err != nil {
		t.Fatalf("load equipment templates: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableDress, []json.RawMessage{
		mustAuthJSON(t, models.DressTemplate{ID: 7001, EquiptID: 2004}),
	}); err != nil {
		t.Fatalf("load dress templates: %v", err)
	}
	itemService.SetGameDataManager(manager)

	h := NewHandler(nil, charService, itemService, nil, nil, nil, nil, zap.NewNop())
	payload := h.buildOnChooseCharactorPayload(context.Background(), char)
	cData := payload["cData"].(map[string]interface{})

	if _, ok := cData["dressResCode"]; ok {
		t.Fatalf("expected no dressResCode without equipped fashion slot, got %#v", cData["dressResCode"])
	}
}

func TestBuildOnChooseCharactorPayload_DerivesCharacterElementFromEquippedItems(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 3004
	char.Ee = "0"
	char.En = 0
	char.Ef = false

	charRepo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(charRepo, zap.NewNop())
	itemRepo := &authTestItemRepo{items: []*domainitem.Item{
		{ID: 21, CharacterID: char.ID, TemplateID: 2001, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 2, Properties: map[string]interface{}{"element": 5}},
		{ID: 22, CharacterID: char.ID, TemplateID: 2002, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 3, Properties: map[string]interface{}{"element": "5"}},
		{ID: 23, CharacterID: char.ID, TemplateID: 2003, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 4, Properties: map[string]interface{}{"element": 2}},
	}}
	itemService := appitem.NewService(itemRepo, zap.NewNop())

	h := NewHandler(nil, charService, itemService, nil, nil, nil, nil, zap.NewNop())
	payload := h.buildOnChooseCharactorPayload(context.Background(), char)
	cData := payload["cData"].(map[string]interface{})
	cProp := payload["cProp"].(map[string]interface{})

	if got := cData["ee"]; got != "5" {
		t.Fatalf("cData[ee] = %v, want 5", got)
	}
	if got := cData["en"]; got != 2 {
		t.Fatalf("cData[en] = %v, want 2", got)
	}
	if got := cData["ef"]; got != false {
		t.Fatalf("cData[ef] = %v, want false", got)
	}
	if got := cProp["ee"]; got != "5" {
		t.Fatalf("cProp[ee] = %v, want 5", got)
	}
	if got := cProp["en"]; got != 2 {
		t.Fatalf("cProp[en] = %v, want 2", got)
	}
}

func TestBuildOnChooseCharactorPayload_UsesLowerElementIDWhenCountsTie(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 3005

	charRepo := &authTestCharacterRepo{char: char}
	charService := appchar.NewService(charRepo, zap.NewNop())
	itemRepo := &authTestItemRepo{items: []*domainitem.Item{
		{ID: 31, CharacterID: char.ID, TemplateID: 2001, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 2, Properties: map[string]interface{}{"element": 5}},
		{ID: 32, CharacterID: char.ID, TemplateID: 2002, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 3, Properties: map[string]interface{}{"element": 2}},
	}}
	itemService := appitem.NewService(itemRepo, zap.NewNop())

	h := NewHandler(nil, charService, itemService, nil, nil, nil, nil, zap.NewNop())
	payload := h.buildOnChooseCharactorPayload(context.Background(), char)
	cData := payload["cData"].(map[string]interface{})

	if got := cData["ee"]; got != "2" {
		t.Fatalf("cData[ee] = %v, want 2", got)
	}
	if got := cData["en"]; got != 1 {
		t.Fatalf("cData[en] = %v, want 1", got)
	}
}

func mustAuthJSON(t *testing.T, value interface{}) json.RawMessage {
	t.Helper()
	data, err := json.Marshal(value)
	if err != nil {
		t.Fatalf("marshal json: %v", err)
	}
	return data
}

func cloneAuthMap(src map[string]interface{}) map[string]interface{} {
	if src == nil {
		return nil
	}
	dst := make(map[string]interface{}, len(src))
	for key, value := range src {
		dst[key] = value
	}
	return dst
}
