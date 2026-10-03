// Open-sourced by BaoLT

package soul

import (
	"context"
	"encoding/json"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

type fakeFeatureRepo struct {
	charStates map[int64][]*domainfeature.CharacterFeatureState
	petStates  map[int64][]*domainfeature.PetFeatureState
}

func newFakeRepo() *fakeFeatureRepo {
	return &fakeFeatureRepo{
		charStates: map[int64][]*domainfeature.CharacterFeatureState{},
		petStates:  map[int64][]*domainfeature.PetFeatureState{},
	}
}

func (r *fakeFeatureRepo) ListCharacterFeatureStates(ctx context.Context, charID int64) ([]*domainfeature.CharacterFeatureState, error) {
	return r.charStates[charID], nil
}

func (r *fakeFeatureRepo) UpsertCharacterFeatureState(ctx context.Context, state *domainfeature.CharacterFeatureState) error {
	list := r.charStates[state.CharacterID]
	for i, st := range list {
		if st.FeatureKey == state.FeatureKey {
			list[i] = state
			r.charStates[state.CharacterID] = list
			return nil
		}
	}
	r.charStates[state.CharacterID] = append(list, state)
	return nil
}

func (r *fakeFeatureRepo) ListPetFeatureStates(ctx context.Context, petID int64) ([]*domainfeature.PetFeatureState, error) {
	return r.petStates[petID], nil
}

func (r *fakeFeatureRepo) UpsertPetFeatureState(ctx context.Context, state *domainfeature.PetFeatureState) error {
	list := r.petStates[state.PetID]
	for i, st := range list {
		if st.FeatureKey == state.FeatureKey {
			list[i] = state
			r.petStates[state.PetID] = list
			return nil
		}
	}
	r.petStates[state.PetID] = append(list, state)
	return nil
}

func (r *fakeFeatureRepo) GetCharacterProgression(ctx context.Context, charID int64) (*domainfeature.CharacterProgression, error) {
	return nil, nil
}
func (r *fakeFeatureRepo) UpsertCharacterSoulProgression(ctx context.Context, charID int64, soulLevel int, soulExp int64) error {
	return nil
}
func (r *fakeFeatureRepo) GetActiveMount(ctx context.Context, charID int64) (*domainfeature.ActiveMount, error) {
	return nil, nil
}
func (r *fakeFeatureRepo) PPVEChallengeNextFloor(ctx context.Context, charID int64, maxFloor int, freeChallenges int, today string) (*domainfeature.PPVEChallengeResult, error) {
	return nil, nil
}

type fakeCharRepo struct {
	chars map[int64]*domainchar.Character
}

func (r *fakeCharRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	return r.chars[id], nil
}
func (r *fakeCharRepo) Update(ctx context.Context, c *domainchar.Character) error {
	r.chars[c.ID] = c
	return nil
}
func (r *fakeCharRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*domainchar.Character, error) {
	return nil, nil
}
func (r *fakeCharRepo) FindByMapID(ctx context.Context, mapID int) ([]*domainchar.Character, error) {
	return nil, nil
}
func (r *fakeCharRepo) FindByName(ctx context.Context, name string) (*domainchar.Character, error) {
	return nil, nil
}
func (r *fakeCharRepo) Create(ctx context.Context, c *domainchar.Character) error { return nil }
func (r *fakeCharRepo) Delete(ctx context.Context, id int64) error                { return nil }
func (r *fakeCharRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}
func (r *fakeCharRepo) UpdatePosition(ctx context.Context, id int64, pos domainchar.Position) error {
	return nil
}
func (r *fakeCharRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error { return nil }

func newTestService(t *testing.T, char *domainchar.Character) (*Service, *fakeCharRepo) {
	t.Helper()
	mgr := gamedata.NewManager(nil, zap.NewNop())
	rows := []string{
		`{"id":94,"type":1,"level":1,"up_exp":500,"chip":3}`,
		`{"id":95,"type":1,"level":2,"up_exp":1200,"chip":7}`,
	}
	raw := make([]json.RawMessage, 0, len(rows))
	for _, r := range rows {
		raw = append(raw, json.RawMessage(r))
	}
	if err := mgr.GetCache().LoadTable(models.TablePetSoul, raw); err != nil {
		t.Fatalf("LoadTable(TBL_PET_SOUL) error = %v", err)
	}
	charRepo := &fakeCharRepo{chars: map[int64]*domainchar.Character{}}
	if char != nil {
		charRepo.chars[char.ID] = char
	}
	return NewService(newFakeRepo(), charRepo, mgr, zap.NewNop()), charRepo
}

func TestCharSoulState_RoundTrip(t *testing.T) {
	s := defaultCharSoulState()
	s.Open = 3
	s.Slots[1] = SoulSlot{Sid: 94, Exp: 250, Lock: true}
	s.Slots[2] = SoulSlot{Sid: 95, Exp: 0, Lock: false}

	got := charSoulStateFromMap(s.ToMap())
	if got.Open != 3 || len(got.Slots) != 2 {
		t.Fatalf("open/slots mismatch: open=%d slots=%d", got.Open, len(got.Slots))
	}
	if got.Slots[1].Sid != 94 || got.Slots[1].Exp != 250 || !got.Slots[1].Lock {
		t.Fatalf("slot 1 round-trip mismatch: %+v", got.Slots[1])
	}
	if got.Slots[2].Sid != 95 || got.Slots[2].Lock {
		t.Fatalf("slot 2 round-trip mismatch: %+v", got.Slots[2])
	}
}

func TestCharSoulState_CrystalSidRoundTrip(t *testing.T) {
	s := defaultCharSoulState()
	s.CrystalSid = 4
	got := charSoulStateFromMap(s.ToMap())
	if got.CrystalSid != 4 {
		t.Fatalf("crystalSid round-trip = %d, want 4", got.CrystalSid)
	}
	if _, leaked := s.LoginObj()["crystalSid"]; leaked {
		t.Fatalf("crystalSid must not leak into soulBagData (it is a sibling top-level field)")
	}
}

func TestService_SetAndGetCrystalSid(t *testing.T) {
	svc, _ := newTestService(t, &domainchar.Character{ID: 1})
	if got := svc.CrystalSidForLogin(context.Background(), 1); got != 0 {
		t.Fatalf("default crystalSid = %d, want 0", got)
	}
	if err := svc.SetCrystalSid(context.Background(), 1, 5); err != nil {
		t.Fatalf("SetCrystalSid: %v", err)
	}
	if got := svc.CrystalSidForLogin(context.Background(), 1); got != 5 {
		t.Fatalf("crystalSid after set = %d, want 5", got)
	}
	if err := svc.SetCrystalSid(context.Background(), 1, -3); err != nil {
		t.Fatalf("SetCrystalSid negative: %v", err)
	}
	if got := svc.CrystalSidForLogin(context.Background(), 1); got != 0 {
		t.Fatalf("negative crystalSid should clamp to 0, got %d", got)
	}
}

func TestPetSoulState_LoginObj_WireOffset(t *testing.T) {
	s := defaultPetSoulState()
	s.OpenNum = 5
	s.OpenNum2 = 2
	s.Slots[1] = SoulSlot{Sid: 94, Exp: 10}

	obj := s.LoginObj()
	if obj["openNum"].(int) != 5 || obj["openNum2"].(int) != 2 {
		t.Fatalf("openNum fields mismatch: %+v", obj)
	}
	data := obj["data"].(map[string]any)
	slot := data["1"].(map[string]any)
	if slot["s"].(int) != 101 {
		t.Fatalf("pet wire s = %v, want slot+100=101", slot["s"])
	}

	char := defaultCharSoulState()
	char.Slots[1] = SoulSlot{Sid: 94}
	cs := char.LoginObj()["data"].(map[string]any)["1"].(map[string]any)
	if cs["s"].(int) != 1 {
		t.Fatalf("char wire s = %v, want slot=1", cs["s"])
	}
}

func TestService_OpenBag(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 25}
	svc, charRepo := newTestService(t, char)
	ctx := context.Background()

	idx, err := svc.OpenBag(ctx, 1)
	if err != nil {
		t.Fatalf("OpenBag: %v", err)
	}
	if idx != 1 {
		t.Fatalf("first open index = %d, want 1", idx)
	}
	if charRepo.chars[1].Gold != 15 {
		t.Fatalf("gold after open = %d, want 15", charRepo.chars[1].Gold)
	}

	charRepo.chars[1].Gold = 0
	if _, err := svc.OpenBag(ctx, 1); err != ErrInsufficientGold {
		t.Fatalf("expected ErrInsufficientGold, got %v", err)
	}
}

func TestService_LockSoul_Toggle(t *testing.T) {
	svc, _ := newTestService(t, &domainchar.Character{ID: 1, Gold: 0})
	ctx := context.Background()
	if err := svc.AddSoulToSlot(ctx, 1, 1, 94, 0); err != nil {
		t.Fatalf("AddSoulToSlot: %v", err)
	}

	locked, err := svc.LockSoul(ctx, 1, 1)
	if err != nil || !locked {
		t.Fatalf("first lock: locked=%v err=%v", locked, err)
	}
	locked, err = svc.LockSoul(ctx, 1, 1)
	if err != nil || locked {
		t.Fatalf("second lock toggle: locked=%v err=%v", locked, err)
	}

	if _, err := svc.LockSoul(ctx, 1, 9); err != ErrSlotEmpty {
		t.Fatalf("lock empty slot: want ErrSlotEmpty, got %v", err)
	}
}

func TestService_SoulLevelUp_MovesExpFromPoolToGem(t *testing.T) {
	char := &domainchar.Character{ID: 1, SoulExp: 600}
	svc, charRepo := newTestService(t, char)
	ctx := context.Background()
	_ = svc.AddSoulToSlot(ctx, 1, 1, 94, 0)

	soulData, soulExp, err := svc.SoulLevelUp(ctx, 1, 1)
	if err != nil {
		t.Fatalf("SoulLevelUp: %v", err)
	}
	if soulExp != 100 {
		t.Fatalf("remaining soulExp = %d, want 100 (600-500)", soulExp)
	}
	if charRepo.chars[1].SoulExp != 100 {
		t.Fatalf("persisted soulExp = %d, want 100", charRepo.chars[1].SoulExp)
	}
	if soulData["exp"].(int64) != 500 {
		t.Fatalf("gem exp = %v, want 500", soulData["exp"])
	}

	if _, _, err := svc.SoulLevelUp(ctx, 1, 1); err != ErrInsufficientExp {
		t.Fatalf("expected ErrInsufficientExp after pool drained, got %v", err)
	}
}

func TestService_TransformExp_DissolveYield(t *testing.T) {
	char := &domainchar.Character{ID: 1, SoulExp: 0, SoulPoints: 0}
	svc, charRepo := newTestService(t, char)
	ctx := context.Background()
	_ = svc.AddSoulToSlot(ctx, 1, 1, 94, 250)

	payload, err := svc.TransformExp(ctx, 1, 1)
	if err != nil {
		t.Fatalf("TransformExp: %v", err)
	}
	if charRepo.chars[1].SoulExp != 250 {
		t.Fatalf("soulExp after dissolve = %d, want 250 (recovered gem exp)", charRepo.chars[1].SoulExp)
	}
	if charRepo.chars[1].SoulPoints != 3 {
		t.Fatalf("chip after dissolve = %d, want 3 (TBL_PET_SOUL.chip)", charRepo.chars[1].SoulPoints)
	}
	if payload["index"].(int) != 1 {
		t.Fatalf("dissolve index = %v, want 1", payload["index"])
	}

	state, _ := svc.loadCharState(ctx, 1)
	if _, exists := state.Slots[1]; exists {
		t.Fatalf("slot 1 should be cleared after dissolve")
	}
}

func TestService_TransformExp_LockedBlocked(t *testing.T) {
	svc, _ := newTestService(t, &domainchar.Character{ID: 1})
	ctx := context.Background()
	_ = svc.AddSoulToSlot(ctx, 1, 1, 94, 100)
	_, _ = svc.LockSoul(ctx, 1, 1)

	if _, err := svc.TransformExp(ctx, 1, 1); err != ErrSlotLocked {
		t.Fatalf("dissolve locked: want ErrSlotLocked, got %v", err)
	}
}
