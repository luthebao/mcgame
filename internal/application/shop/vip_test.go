// Open-sourced by BaoLT

package shop

import (
	"context"
	"encoding/json"
	"errors"
	"strings"
	"sync"
	"testing"
	"time"

	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

func TestGetVIPShopConfigBuildsSelection(t *testing.T) {
	service := newVIPShopTestService(t, newActiveVIPShopCharacter(1001, "vip-config"))

	result, err := service.GetVIPShopConfig(context.Background(), 1001)
	if err != nil {
		t.Fatalf("GetVIPShopConfig returned error: %v", err)
	}
	if !result.Flag {
		t.Fatalf("GetVIPShopConfig returned flag=false")
	}
	if len(result.VIPShop) != vipShopSlotCount {
		t.Fatalf("VIP shop slot count = %d, want %d", len(result.VIPShop), vipShopSlotCount)
	}
	for _, slot := range result.VIPShop {
		if slot["sid"] != vipShopSID {
			t.Fatalf("slot sid = %v, want %d", slot["sid"], vipShopSID)
		}
		if _, ok := slot["itemId"]; !ok {
			t.Fatalf("slot missing itemId: %#v", slot)
		}
		if _, ok := slot["gold"]; !ok {
			t.Fatalf("slot missing gold: %#v", slot)
		}
		if _, ok := slot["priceAll"]; !ok {
			t.Fatalf("slot missing priceAll (un-discounted reference): %#v", slot)
		}
	}
	if result.ReflashTime <= time.Now().UnixMilli() {
		t.Fatalf("reflashTime = %d, want future timestamp", result.ReflashTime)
	}
}

func TestGetVIPShopConfig_TwoCharactersSeeSameSharedRotation(t *testing.T) {
	service := newVIPShopTestService(t,
		newActiveVIPShopCharacter(1100, "alpha"),
		newActiveVIPShopCharacter(1101, "bravo"),
	)

	a, err := service.GetVIPShopConfig(context.Background(), 1100)
	if err != nil {
		t.Fatalf("alpha GetVIPShopConfig: %v", err)
	}
	b, err := service.GetVIPShopConfig(context.Background(), 1101)
	if err != nil {
		t.Fatalf("bravo GetVIPShopConfig: %v", err)
	}

	idsOf := func(slots []map[string]any) []int64 {
		out := make([]int64, 0, len(slots))
		for _, s := range slots {
			out = append(out, s["id"].(int64))
		}
		return out
	}
	aIDs := idsOf(a.VIPShop)
	bIDs := idsOf(b.VIPShop)
	if len(aIDs) != len(bIDs) {
		t.Fatalf("len mismatch: %d vs %d", len(aIDs), len(bIDs))
	}
	for i := range aIDs {
		if aIDs[i] != bIDs[i] {
			t.Fatalf("shared rotation diverged at index %d: %d vs %d", i, aIDs[i], bIDs[i])
		}
	}
	if a.ReflashTime != b.ReflashTime {
		t.Fatalf("reflashTime diverged: %d vs %d", a.ReflashTime, b.ReflashTime)
	}
}

func TestRefreshVIPShopConfig_FirstRefreshIsFree(t *testing.T) {
	charRepo := newVIPShopCharacterRepo(&character.Character{
		ID: 2002, Name: "vip-refresh", Gold: 50,
		VIPType: 1, VIPExpiresAt: vipExpiryFromNow(24 * time.Hour),
	})
	service := newVIPShopTestServiceWithRepo(t, charRepo)

	result, err := service.RefreshVIPShopConfig(context.Background(), 2002)
	if err != nil {
		t.Fatalf("RefreshVIPShopConfig returned error: %v", err)
	}
	if result.SyncGold {
		t.Errorf("SyncGold = true on first (free) refresh; want false")
	}
	if result.Gold != 50 {
		t.Errorf("Gold = %d on first (free) refresh; want 50 (no debit)", result.Gold)
	}
	updated, _ := charRepo.FindByID(context.Background(), 2002)
	if updated.Gold != 50 {
		t.Errorf("character gold = %d after free refresh; want 50", updated.Gold)
	}
}

func TestRefreshVIPShopConfig_SecondRefreshDeducts20Gold(t *testing.T) {
	charRepo := newVIPShopCharacterRepo(&character.Character{
		ID: 2003, Name: "vip-refresh-2", Gold: 100,
		VIPType: 1, VIPExpiresAt: vipExpiryFromNow(24 * time.Hour),
	})
	service := newVIPShopTestServiceWithRepo(t, charRepo)

	if _, err := service.RefreshVIPShopConfig(context.Background(), 2003); err != nil {
		t.Fatalf("first refresh: %v", err)
	}
	result, err := service.RefreshVIPShopConfig(context.Background(), 2003)
	if err != nil {
		t.Fatalf("second refresh: %v", err)
	}
	if !result.SyncGold {
		t.Errorf("SyncGold = false on paid refresh; want true")
	}
	if result.Gold != 80 {
		t.Errorf("Gold = %d after paid refresh; want 80 (100 - 20)", result.Gold)
	}
}

func TestRefreshVIPShopConfig_RejectsAfterDailyCap(t *testing.T) {
	charRepo := newVIPShopCharacterRepo(&character.Character{
		ID: 2004, Name: "vip-refresh-cap", Gold: 1000,
		VIPType: 1, VIPExpiresAt: vipExpiryFromNow(24 * time.Hour),
	})
	service := newVIPShopTestServiceWithRepo(t, charRepo)

	for i := range vipShopRefreshDailyMax {
		if _, err := service.RefreshVIPShopConfig(context.Background(), 2004); err != nil {
			t.Fatalf("refresh #%d: %v", i+1, err)
		}
	}
	_, err := service.RefreshVIPShopConfig(context.Background(), 2004)
	if err != ErrVIPShopRefreshCapReached {
		t.Errorf("expected ErrVIPShopRefreshCapReached, got %v", err)
	}
}

func TestBuyVIPShopItemRejectsInactiveSlot(t *testing.T) {
	service := newVIPShopTestService(t, &character.Character{
		ID: 3003, Name: "vip-buy", Gold: 100,
		VIPType: 1, VIPExpiresAt: vipExpiryFromNow(24 * time.Hour),
	})

	config, err := service.GetVIPShopConfig(context.Background(), 3003)
	if err != nil {
		t.Fatalf("GetVIPShopConfig: %v", err)
	}
	active := make(map[int]bool, len(config.VIPShop))
	for _, slot := range config.VIPShop {
		active[slotID(slot["id"])] = true
	}
	inactiveSlotID := 0
	for id := 5001; id <= 5007; id++ {
		if !active[id] {
			inactiveSlotID = id
			break
		}
	}
	if inactiveSlotID == 0 {
		t.Fatalf("expected one visible slot outside the active VIP selection")
	}

	if _, err := service.BuyVIPShopItem(context.Background(), 3003, inactiveSlotID, 1); err == nil {
		t.Fatalf("BuyVIPShopItem returned nil error for inactive slot")
	} else if !strings.Contains(err.Error(), "not currently available") {
		t.Fatalf("BuyVIPShopItem error = %q, want inactive-slot error", err.Error())
	}
}

func TestGetVIPShopConfigRejectsInactivePremiumMember(t *testing.T) {
	service := newVIPShopTestService(t, &character.Character{ID: 4004, Name: "inactive"})

	_, err := service.GetVIPShopConfig(context.Background(), 4004)
	if err == nil {
		t.Fatal("GetVIPShopConfig returned nil error for inactive premium member")
	}
	if !errors.Is(err, ErrVIPShopMembershipRequired) {
		t.Fatalf("GetVIPShopConfig error = %v, want ErrVIPShopMembershipRequired", err)
	}
}

func newVIPShopTestService(t *testing.T, chars ...*character.Character) ShopService {
	return newVIPShopTestServiceWithRepo(t, newVIPShopCharacterRepo(chars...))
}

func newVIPShopTestServiceWithRepo(t *testing.T, charRepo *vipShopCharacterRepo) ShopService {
	t.Helper()
	service := NewService()
	service.SetGameDataManager(newVIPShopTestManager(t))
	service.SetCharacterRepository(charRepo)
	service.SetVIPShopRepository(newFakeVIPShopRepo())
	return service
}

type vipShopCharacterRepo struct {
	items map[int64]*character.Character
}

func newVIPShopCharacterRepo(chars ...*character.Character) *vipShopCharacterRepo {
	items := make(map[int64]*character.Character, len(chars))
	for _, char := range chars {
		copyChar := *char
		items[char.ID] = &copyChar
	}
	return &vipShopCharacterRepo{items: items}
}

func (r *vipShopCharacterRepo) FindByID(ctx context.Context, id int64) (*character.Character, error) {
	char, ok := r.items[id]
	if !ok {
		return nil, pkgerrors.ErrCharacterNotFound
	}
	copyChar := *char
	return &copyChar, nil
}
func (r *vipShopCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*character.Character, error) {
	return nil, nil
}
func (r *vipShopCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*character.Character, error) {
	return nil, nil
}
func (r *vipShopCharacterRepo) FindByName(ctx context.Context, name string) (*character.Character, error) {
	return nil, pkgerrors.ErrCharacterNotFound
}
func (r *vipShopCharacterRepo) Create(ctx context.Context, char *character.Character) error {
	copyChar := *char
	r.items[char.ID] = &copyChar
	return nil
}
func (r *vipShopCharacterRepo) Update(ctx context.Context, char *character.Character) error {
	copyChar := *char
	r.items[char.ID] = &copyChar
	return nil
}
func (r *vipShopCharacterRepo) Delete(ctx context.Context, id int64) error {
	delete(r.items, id)
	return nil
}
func (r *vipShopCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}
func (r *vipShopCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos character.Position) error {
	return nil
}
func (r *vipShopCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

type fakeVIPShopRepo struct {
	mu        sync.Mutex
	rotation  *VIPShopRotation
	overrides map[int64]*VIPShopOverride
	purchases map[int64]map[int64]map[int32]bool
	counters  map[int64]map[string]int32
}

func newFakeVIPShopRepo() *fakeVIPShopRepo {
	return &fakeVIPShopRepo{
		overrides: make(map[int64]*VIPShopOverride),
		purchases: make(map[int64]map[int64]map[int32]bool),
		counters:  make(map[int64]map[string]int32),
	}
}

func (r *fakeVIPShopRepo) GetOrSeedRotation(ctx context.Context, epoch int64, startsAt, endsAt time.Time, seed int64, slotIDs []int32) (*VIPShopRotation, error) {
	r.mu.Lock()
	defer r.mu.Unlock()
	if r.rotation != nil && r.rotation.RotationEpoch == epoch {
		return cloneRotation(r.rotation, false), nil
	}
	r.rotation = &VIPShopRotation{
		RotationEpoch: epoch, StartsAt: startsAt, EndsAt: endsAt,
		ShopSlotIDs: append([]int32(nil), slotIDs...), Seed: seed,
	}
	for cid, ov := range r.overrides {
		if ov.RotationEpoch != epoch {
			delete(r.overrides, cid)
		}
	}
	for cid, perEpoch := range r.purchases {
		for ep := range perEpoch {
			if ep != epoch {
				delete(perEpoch, ep)
			}
		}
		if len(perEpoch) == 0 {
			delete(r.purchases, cid)
		}
	}
	return cloneRotation(r.rotation, true), nil
}

func (r *fakeVIPShopRepo) GetCharacterOverride(ctx context.Context, characterID int64) (*VIPShopOverride, error) {
	r.mu.Lock()
	defer r.mu.Unlock()
	ov, ok := r.overrides[characterID]
	if !ok {
		return nil, nil
	}
	return &VIPShopOverride{
		RotationEpoch: ov.RotationEpoch,
		SlotIDs:       append([]int32(nil), ov.SlotIDs...),
		RefreshedAt:   ov.RefreshedAt,
	}, nil
}

func (r *fakeVIPShopRepo) GetCharacterPurchaseSlotIDs(ctx context.Context, characterID, rotationEpoch int64) ([]int32, error) {
	r.mu.Lock()
	defer r.mu.Unlock()
	perEpoch, ok := r.purchases[characterID]
	if !ok {
		return nil, nil
	}
	bag, ok := perEpoch[rotationEpoch]
	if !ok {
		return nil, nil
	}
	out := make([]int32, 0, len(bag))
	for id := range bag {
		out = append(out, id)
	}
	return out, nil
}

func (r *fakeVIPShopRepo) RecordPurchase(ctx context.Context, characterID, rotationEpoch int64, slotID, amount int32) (bool, error) {
	r.mu.Lock()
	defer r.mu.Unlock()
	if r.purchases[characterID] == nil {
		r.purchases[characterID] = make(map[int64]map[int32]bool)
	}
	if r.purchases[characterID][rotationEpoch] == nil {
		r.purchases[characterID][rotationEpoch] = make(map[int32]bool)
	}
	if r.purchases[characterID][rotationEpoch][slotID] {
		return false, nil
	}
	r.purchases[characterID][rotationEpoch][slotID] = true
	return true, nil
}

func (r *fakeVIPShopRepo) GetRefreshCount(ctx context.Context, characterID int64, dayBucket time.Time) (int32, error) {
	r.mu.Lock()
	defer r.mu.Unlock()
	if r.counters[characterID] == nil {
		return 0, nil
	}
	return r.counters[characterID][dayKey(dayBucket)], nil
}

func (r *fakeVIPShopRepo) ApplyPersonalRefresh(ctx context.Context, characterID, rotationEpoch int64, slotIDs []int32, dayBucket time.Time, maxPerDay int32) (bool, int32, error) {
	r.mu.Lock()
	defer r.mu.Unlock()
	if r.counters[characterID] == nil {
		r.counters[characterID] = make(map[string]int32)
	}
	key := dayKey(dayBucket)
	count := r.counters[characterID][key]
	if count >= maxPerDay {
		return false, count, nil
	}
	r.counters[characterID][key] = count + 1
	r.overrides[characterID] = &VIPShopOverride{
		RotationEpoch: rotationEpoch,
		SlotIDs:       append([]int32(nil), slotIDs...),
		RefreshedAt:   time.Now(),
	}
	if perEpoch, ok := r.purchases[characterID]; ok {
		delete(perEpoch, rotationEpoch)
	}
	return true, count + 1, nil
}

func cloneRotation(r *VIPShopRotation, reseeded bool) *VIPShopRotation {
	return &VIPShopRotation{
		RotationEpoch: r.RotationEpoch,
		StartsAt:      r.StartsAt,
		EndsAt:        r.EndsAt,
		ShopSlotIDs:   append([]int32(nil), r.ShopSlotIDs...),
		Seed:          r.Seed,
		Reseeded:      reseeded,
	}
}

func dayKey(d time.Time) string {
	return d.Format("2006-01-02")
}

func newVIPShopTestManager(t *testing.T) *gamedata.Manager {
	t.Helper()
	manager := gamedata.NewManager(nil, zap.NewNop())
	records := make([]json.RawMessage, 0, 8)
	for i := range 7 {
		slot := models.ShopSlotTemplate{
			ID:       int64(5001 + i),
			Sid:      vipShopSID,
			St:       0,
			Position: float64(i + 1),
			Type:     29,
			ItemID:   float64(6001 + i),
			Quality:  float64((i % 5) + 1),
			Gold:     float64(100 + i),
			Gt:       1,
			Amount:   -1,
		}
		data, err := json.Marshal(slot)
		if err != nil {
			t.Fatalf("json.Marshal: %v", err)
		}
		records = append(records, data)
	}
	hidden := models.ShopSlotTemplate{
		ID: 5999, Sid: vipShopSID, St: shopSellTypeHide, Position: 99,
		Type: 29, ItemID: 6999, Quality: 1, Gold: 999, Gt: 1, Amount: -1,
	}
	hData, _ := json.Marshal(hidden)
	records = append(records, hData)
	if err := manager.GetCache().LoadTable(models.TableShopSlot, records); err != nil {
		t.Fatalf("LoadTable: %v", err)
	}
	return manager
}

func slotID(value any) int {
	switch typed := value.(type) {
	case int:
		return typed
	case int64:
		return int(typed)
	case float64:
		return int(typed)
	default:
		return 0
	}
}

func newActiveVIPShopCharacter(id int64, name string) *character.Character {
	return &character.Character{
		ID: id, Name: name,
		VIPType: 1, VIPExpiresAt: vipExpiryFromNow(24 * time.Hour),
	}
}

func vipExpiryFromNow(delta time.Duration) *time.Time {
	expiresAt := time.Now().Add(delta)
	return &expiresAt
}
