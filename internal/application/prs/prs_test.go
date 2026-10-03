// Open-sourced by BaoLT

package prs

import (
	"context"
	"encoding/json"
	"errors"
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
}

func newFakeRepo() *fakeFeatureRepo {
	return &fakeFeatureRepo{charStates: map[int64][]*domainfeature.CharacterFeatureState{}}
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
	return nil, nil
}
func (r *fakeFeatureRepo) UpsertPetFeatureState(ctx context.Context, state *domainfeature.PetFeatureState) error {
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
	load := func(table string, rows ...string) {
		raw := make([]json.RawMessage, 0, len(rows))
		for _, r := range rows {
			raw = append(raw, json.RawMessage(r))
		}
		if err := mgr.GetCache().LoadTable(table, raw); err != nil {
			t.Fatalf("LoadTable(%s): %v", table, err)
		}
	}
	load(models.TablePrsTree,
		`{"id":1,"cost_stone":100,"next_id":2,"level":1}`,
		`{"id":2,"cost_stone":200,"next_id":3,"level":2}`)
	load(models.TablePrsChip,
		`{"id":5001,"cost_crystal":50,"show_id":8001}`,
		`{"id":5002,"cost_crystal":80,"show_id":8002}`)
	load(models.TablePrsShow,
		`{"id":8001,"need_chip_id":5001,"need_num":10,"limit_type":0}`,
		`{"id":8002,"need_chip_id":5002,"need_num":5,"limit_type":1,"limit_time":3600000}`)

	charRepo := &fakeCharRepo{chars: map[int64]*domainchar.Character{}}
	if char != nil {
		charRepo.chars[char.ID] = char
	}
	return NewService(newFakeRepo(), charRepo, mgr, zap.NewNop()), charRepo
}

func TestState_RoundTripThroughJSON(t *testing.T) {
	s := defaultState()
	s.Tid = "5"
	s.ActArr[0] = 8001
	s.ActLimitObj[8002] = 1700000000000
	s.UseSid = 8001
	s.UseID = 8001
	s.ChipBag[1] = ChipSlot{ChipID: 5001, ChipNum: 7}
	s.ExcBag[2] = ChipSlot{ChipID: 5002, ChipNum: 1}
	s.IsShow = 1

	raw, err := json.Marshal(s.toPersist())
	if err != nil {
		t.Fatalf("marshal: %v", err)
	}
	var decoded map[string]interface{}
	if err := json.Unmarshal(raw, &decoded); err != nil {
		t.Fatalf("unmarshal: %v", err)
	}
	got := stateFromMap(decoded)

	if got.Tid != "5" || got.UseSid != 8001 || got.UseID != 8001 || got.IsShow != 1 {
		t.Fatalf("scalar round-trip mismatch: %+v", got)
	}
	if got.ActArr[0] != 8001 {
		t.Fatalf("actArr round-trip = %v, want 8001", got.ActArr[0])
	}
	if got.ActLimitObj[8002] != 1700000000000 {
		t.Fatalf("actLimitObj round-trip = %v, want 1700000000000", got.ActLimitObj[8002])
	}
	if got.ChipBag[1].ChipID != 5001 || got.ChipBag[1].ChipNum != 7 {
		t.Fatalf("chipBag round-trip mismatch: %+v", got.ChipBag[1])
	}
	if got.ExcBag[2].ChipID != 5002 {
		t.Fatalf("excBag round-trip mismatch: %+v", got.ExcBag[2])
	}
}

func TestState_ToPersistHasLoginKeys(t *testing.T) {
	persist := defaultState().toPersist()
	for _, key := range []string{"tid", "actArr", "actLimitObj", "useSid", "chipBag", "excBag", "isShow", "useId"} {
		if _, ok := persist[key]; !ok {
			t.Fatalf("toPersist missing login key %q", key)
		}
	}
}

func TestAddSoulTreeLvl_ProgressesAndCaps(t *testing.T) {
	char := &domainchar.Character{ID: 1, RealSoulStone: 1000}
	svc, charRepo := newTestService(t, char)
	ctx := context.Background()

	data, err := svc.AddSoulTreeLvl(ctx, 1)
	if err != nil {
		t.Fatalf("AddSoulTreeLvl 1: %v", err)
	}
	if data["tid"] != "1" {
		t.Fatalf("tid = %v, want \"1\"", data["tid"])
	}
	if charRepo.chars[1].RealSoulStone != 900 {
		t.Fatalf("stone after lvl1 = %d, want 900 (1000-100)", charRepo.chars[1].RealSoulStone)
	}

	if _, err := svc.AddSoulTreeLvl(ctx, 1); err != nil {
		t.Fatalf("AddSoulTreeLvl 2: %v", err)
	}
	if charRepo.chars[1].RealSoulStone != 700 {
		t.Fatalf("stone after lvl2 = %d, want 700 (900-200)", charRepo.chars[1].RealSoulStone)
	}

	if _, err := svc.AddSoulTreeLvl(ctx, 1); !errors.Is(err, ErrMaxTree) {
		t.Fatalf("past max tree: want ErrMaxTree, got %v", err)
	}
}

func TestAddSoulTreeLvl_InsufficientStone(t *testing.T) {
	svc, _ := newTestService(t, &domainchar.Character{ID: 1, RealSoulStone: 50})
	if _, err := svc.AddSoulTreeLvl(context.Background(), 1); !errors.Is(err, ErrInsufficientStone) {
		t.Fatalf("want ErrInsufficientStone, got %v", err)
	}
}

func TestExchangeChip_DeductsAndStacks(t *testing.T) {
	char := &domainchar.Character{ID: 1, RealSoulCrystal: 500}
	svc, charRepo := newTestService(t, char)
	ctx := context.Background()

	state, reward, err := svc.ExchangeChip(ctx, 1, 5001)
	if err != nil {
		t.Fatalf("ExchangeChip: %v", err)
	}
	if charRepo.chars[1].RealSoulCrystal != 450 {
		t.Fatalf("crystal after = %d, want 450 (500-50)", charRepo.chars[1].RealSoulCrystal)
	}
	if reward.TableID != 127 || reward.ID != 5001 || reward.Num != 1 {
		t.Fatalf("reward = %+v, want {127,5001,1}", reward)
	}
	if total := chipTotal(state.ChipBag, 5001); total != 1 {
		t.Fatalf("chip 5001 total = %d, want 1", total)
	}

	if _, _, err := svc.ExchangeChip(ctx, 1, 5001); err != nil {
		t.Fatalf("ExchangeChip 2: %v", err)
	}
	state, _ = svc.loadState(ctx, 1)
	if total := chipTotal(state.ChipBag, 5001); total != 2 {
		t.Fatalf("chip 5001 total after 2nd = %d, want 2 (stacked)", total)
	}

	if _, _, err := svc.ExchangeChip(ctx, 1, 9999); !errors.Is(err, ErrUnknownChip) {
		t.Fatalf("unknown chip: want ErrUnknownChip, got %v", err)
	}
}

func TestExchangeChip_InsufficientCrystal(t *testing.T) {
	svc, _ := newTestService(t, &domainchar.Character{ID: 1, RealSoulCrystal: 10})
	if _, _, err := svc.ExchangeChip(context.Background(), 1, 5001); !errors.Is(err, ErrInsufficientCrystal) {
		t.Fatalf("want ErrInsufficientCrystal, got %v", err)
	}
}

func TestMoveChip_BetweenBags(t *testing.T) {
	svc, _ := newTestService(t, &domainchar.Character{ID: 1})
	ctx := context.Background()
	seed := defaultState()
	seed.ChipBag[1] = ChipSlot{ChipID: 5001, ChipNum: 3}
	if err := svc.saveState(ctx, 1, seed); err != nil {
		t.Fatalf("seed: %v", err)
	}

	state, err := svc.MoveChip(ctx, 1, 1, 1, directionToExc)
	if err != nil {
		t.Fatalf("MoveChip to exc: %v", err)
	}
	if _, ok := state.ChipBag[1]; ok {
		t.Fatalf("chipBag[1] should be empty after move to exc")
	}
	if state.ExcBag[1].ChipID != 5001 || state.ExcBag[1].ChipNum != 3 {
		t.Fatalf("excBag[1] = %+v, want {5001,3}", state.ExcBag[1])
	}

	state, err = svc.MoveChip(ctx, 1, 1, 1, directionToChip)
	if err != nil {
		t.Fatalf("MoveChip to chip: %v", err)
	}
	if state.ChipBag[1].ChipID != 5001 || len(state.ExcBag) != 0 {
		t.Fatalf("move back failed: chipBag=%+v excBag=%+v", state.ChipBag[1], state.ExcBag)
	}
}

func TestActiveShow_ConsumesChipsAndActivates(t *testing.T) {
	svc, _ := newTestService(t, &domainchar.Character{ID: 1})
	ctx := context.Background()
	seed := defaultState()
	seed.ChipBag[1] = ChipSlot{ChipID: 5001, ChipNum: 12}
	_ = svc.saveState(ctx, 1, seed)

	data, err := svc.ActiveShow(ctx, 1, 8001)
	if err != nil {
		t.Fatalf("ActiveShow: %v", err)
	}
	actArr := data["actArr"].(map[string]interface{})
	if len(actArr) != 1 {
		t.Fatalf("actArr len = %d, want 1", len(actArr))
	}
	state, _ := svc.loadState(ctx, 1)
	if total := chipTotal(state.ChipBag, 5001); total != 2 {
		t.Fatalf("chip 5001 remaining = %d, want 2 (12-10)", total)
	}
	if !state.hasActivated(8001) {
		t.Fatalf("8001 should be activated")
	}

	if _, err := svc.ActiveShow(ctx, 1, 8001); !errors.Is(err, ErrAlreadyActivated) {
		t.Fatalf("re-activate: want ErrAlreadyActivated, got %v", err)
	}
	if _, err := svc.ActiveShow(ctx, 1, 9999); !errors.Is(err, ErrUnknownShow) {
		t.Fatalf("unknown show: want ErrUnknownShow, got %v", err)
	}
}

func TestActiveShow_InsufficientChips(t *testing.T) {
	svc, _ := newTestService(t, &domainchar.Character{ID: 1})
	ctx := context.Background()
	seed := defaultState()
	seed.ChipBag[1] = ChipSlot{ChipID: 5001, ChipNum: 5}
	_ = svc.saveState(ctx, 1, seed)

	if _, err := svc.ActiveShow(ctx, 1, 8001); !errors.Is(err, ErrInsufficientChips) {
		t.Fatalf("want ErrInsufficientChips, got %v", err)
	}
}

func TestActiveShow_TimeLimited(t *testing.T) {
	svc, _ := newTestService(t, &domainchar.Character{ID: 1})
	ctx := context.Background()
	seed := defaultState()
	seed.ChipBag[1] = ChipSlot{ChipID: 5002, ChipNum: 5}
	_ = svc.saveState(ctx, 1, seed)

	if _, err := svc.ActiveShow(ctx, 1, 8002); err != nil {
		t.Fatalf("ActiveShow time-limited: %v", err)
	}
	state, _ := svc.loadState(ctx, 1)
	if state.ActLimitObj[8002] <= 0 {
		t.Fatalf("actLimitObj[8002] = %d, want a positive expiry", state.ActLimitObj[8002])
	}
	if len(state.ActArr) != 0 {
		t.Fatalf("time-limited form should not go in actArr")
	}
}

func TestReplaceAndCancelShow(t *testing.T) {
	svc, _ := newTestService(t, &domainchar.Character{ID: 1})
	ctx := context.Background()
	seed := defaultState()
	seed.ActArr[0] = 8001
	_ = svc.saveState(ctx, 1, seed)

	useID, err := svc.ReplaceShow(ctx, 1, 8001)
	if err != nil || useID != 8001 {
		t.Fatalf("ReplaceShow: useID=%d err=%v", useID, err)
	}
	state, _ := svc.loadState(ctx, 1)
	if state.UseSid != 8001 || state.UseID != 8001 {
		t.Fatalf("useSid/useId = %d/%d, want 8001/8001", state.UseSid, state.UseID)
	}

	if _, err := svc.ReplaceShow(ctx, 1, 9999); !errors.Is(err, ErrNotActivated) {
		t.Fatalf("replace non-activated: want ErrNotActivated, got %v", err)
	}

	if _, err := svc.CancelShow(ctx, 1); err != nil {
		t.Fatalf("CancelShow: %v", err)
	}
	state, _ = svc.loadState(ctx, 1)
	if state.UseSid != 0 || state.UseID != 0 {
		t.Fatalf("after cancel useSid/useId = %d/%d, want 0/0", state.UseSid, state.UseID)
	}
}

func TestUpdateActiveShow_DropsExpiredAndClearsEquipped(t *testing.T) {
	svc, _ := newTestService(t, &domainchar.Character{ID: 1})
	ctx := context.Background()
	seed := defaultState()
	seed.ActLimitObj[8002] = 1700000000000
	seed.UseSid = 8002
	seed.UseID = 8002
	_ = svc.saveState(ctx, 1, seed)

	if err := svc.UpdateActiveShow(ctx, 1, []int{8002}); err != nil {
		t.Fatalf("UpdateActiveShow: %v", err)
	}
	state, _ := svc.loadState(ctx, 1)
	if _, ok := state.ActLimitObj[8002]; ok {
		t.Fatalf("expired 8002 should be removed from actLimitObj")
	}
	if state.UseSid != 0 || state.UseID != 0 {
		t.Fatalf("equipped expired form should clear useSid/useId, got %d/%d", state.UseSid, state.UseID)
	}
}

func chipTotal(bag map[int]ChipSlot, chipID int) int {
	total := 0
	for _, slot := range bag {
		if slot.ChipID == chipID {
			total += slot.ChipNum
		}
	}
	return total
}
