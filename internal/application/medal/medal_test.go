// Open-sourced by BaoLT

package medal

import (
	"context"
	"encoding/json"
	"errors"
	"testing"

	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

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

func newTestService(t *testing.T) *Service {
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
	load(models.TableMedal,
		`{"id":701,"basic_tid":701,"level":1,"up_exp":100,"exp":20,"q":1,"sid":1}`,
		`{"id":702,"basic_tid":701,"level":2,"up_exp":300,"exp":50,"q":1,"sid":1}`,
		`{"id":900,"basic_tid":900,"level":1,"up_exp":100,"exp":40,"q":4,"sid":2}`)
	return NewService(newFakeRepo(), mgr, zap.NewNop())
}

func TestState_RoundTripThroughJSON(t *testing.T) {
	s := defaultState()
	s.Exp = 1234
	s.Bag[3] = BagEntry{I: 3, T: 701, N: 2}
	s.Bag[1001] = BagEntry{I: 1001, T: 702, N: 1}
	s.PetBuffT = 705
	s.CharBuffT = 706
	s.CheckFlag = true

	raw, err := json.Marshal(s.toPersist())
	if err != nil {
		t.Fatalf("marshal: %v", err)
	}
	var decoded map[string]interface{}
	if err := json.Unmarshal(raw, &decoded); err != nil {
		t.Fatalf("unmarshal: %v", err)
	}
	got := stateFromMap(decoded)

	if got.Exp != 1234 {
		t.Fatalf("exp round-trip = %d, want 1234", got.Exp)
	}
	if got.Bag[3].T != 701 || got.Bag[3].N != 2 || got.Bag[3].I != 3 {
		t.Fatalf("bag[3] round-trip = %+v", got.Bag[3])
	}
	if got.Bag[1001].T != 702 {
		t.Fatalf("equip bag[1001] round-trip = %+v", got.Bag[1001])
	}
	if got.PetBuffT != 705 || got.CharBuffT != 706 {
		t.Fatalf("buff round-trip pet=%d char=%d, want 705/706", got.PetBuffT, got.CharBuffT)
	}
	if !got.CheckFlag {
		t.Fatalf("checkFlag round-trip = false, want true")
	}
}

func TestToPersist_HasLoginKeys(t *testing.T) {
	persist := defaultState().toPersist()
	for _, key := range []string{"exp", "bag", "petBuff", "charBuff", "checkFlag"} {
		if _, ok := persist[key]; !ok {
			t.Fatalf("toPersist missing login key %q", key)
		}
	}
	if _, ok := persist["checkFlag"].(bool); !ok {
		t.Fatalf("checkFlag must be a bool, got %T", persist["checkFlag"])
	}
	pb, ok := persist["petBuff"].(map[string]interface{})
	if !ok {
		t.Fatalf("petBuff must be a map, got %T", persist["petBuff"])
	}
	if _, ok := pb["t"]; !ok {
		t.Fatalf("petBuff missing key t")
	}
}

func TestCheckFlag_PreservedVerbatim(t *testing.T) {
	svc := newTestService(t)
	ctx := context.Background()
	seed := defaultState()
	seed.CheckFlag = true
	seed.Bag[1] = BagEntry{I: 1, T: 701, N: 1}
	if err := svc.saveState(ctx, 1, seed); err != nil {
		t.Fatalf("seed: %v", err)
	}
	if _, _, err := svc.AddMedalToBag(ctx, 1, 701, 1); err != nil {
		t.Fatalf("AddMedalToBag: %v", err)
	}
	state, _ := svc.loadState(ctx, 1)
	if !state.CheckFlag {
		t.Fatalf("checkFlag should survive an unrelated write")
	}
}

func TestAddMedalToBag_StacksAndPlaces(t *testing.T) {
	svc := newTestService(t)
	ctx := context.Background()

	if _, _, err := svc.AddMedalToBag(ctx, 1, 701, 1); err != nil {
		t.Fatalf("AddMedalToBag 1: %v", err)
	}
	state, _ := svc.loadState(ctx, 1)
	if state.Bag[1].T != 701 || state.Bag[1].N != 1 || state.Bag[1].I != 1 {
		t.Fatalf("first place = %+v, want {1,701,1}", state.Bag[1])
	}

	if _, _, err := svc.AddMedalToBag(ctx, 1, 701, 2); err != nil {
		t.Fatalf("AddMedalToBag stack: %v", err)
	}
	state, _ = svc.loadState(ctx, 1)
	if state.Bag[1].N != 3 {
		t.Fatalf("stack count = %d, want 3", state.Bag[1].N)
	}

	if _, _, err := svc.AddMedalToBag(ctx, 1, 702, 1); err != nil {
		t.Fatalf("AddMedalToBag new tid: %v", err)
	}
	state, _ = svc.loadState(ctx, 1)
	if state.Bag[2].T != 702 {
		t.Fatalf("second medal should land in slot 2, got %+v", state.Bag[2])
	}

	if _, _, err := svc.AddMedalToBag(ctx, 1, 0, 1); !errors.Is(err, ErrInvalidArgs) {
		t.Fatalf("invalid tid: want ErrInvalidArgs, got %v", err)
	}
}

func TestMoveMedal_InventoryToEquip(t *testing.T) {
	svc := newTestService(t)
	ctx := context.Background()
	seed := defaultState()
	seed.Bag[5] = BagEntry{I: 5, T: 701, N: 1}
	_ = svc.saveState(ctx, 1, seed)

	res, err := svc.MoveMedal(ctx, 1, 5, 1001)
	if err != nil {
		t.Fatalf("MoveMedal inv->equip: %v", err)
	}
	if !res.HasDel || res.Del != 5 {
		t.Fatalf("del should report cleared source 5, got HasDel=%v Del=%d", res.HasDel, res.Del)
	}
	if e := res.ChangedPA[1001]; e.T != 701 || e.I != 1001 {
		t.Fatalf("pa[1001] = %+v, want {1001,701,_}", e)
	}
	if res.Type != moveTypePet {
		t.Fatalf("move into pet equip slot should set type=pet(%d), got %d", moveTypePet, res.Type)
	}
	state, _ := svc.loadState(ctx, 1)
	if _, ok := state.Bag[5]; ok {
		t.Fatalf("source slot 5 should be empty after move")
	}
	if state.Bag[1001].T != 701 {
		t.Fatalf("equip slot 1001 = %+v, want t=701", state.Bag[1001])
	}
}

func TestMoveMedal_ToEngraveSetsBuff(t *testing.T) {
	svc := newTestService(t)
	ctx := context.Background()
	seed := defaultState()
	seed.Bag[2001] = BagEntry{I: 2001, T: 702, N: 1}
	_ = svc.saveState(ctx, 1, seed)

	res, err := svc.MoveMedal(ctx, 1, 2001, charEngrave)
	if err != nil {
		t.Fatalf("MoveMedal char-equip->char-engrave: %v", err)
	}
	if res.Type != moveTypeChar || res.JoinTid != 702 {
		t.Fatalf("char engrave: type=%d joinTid=%d, want %d/702", res.Type, res.JoinTid, moveTypeChar)
	}
	if !res.HasDel || res.Del != 2001 {
		t.Fatalf("engrave should del source 2001, got HasDel=%v Del=%d", res.HasDel, res.Del)
	}
	state, _ := svc.loadState(ctx, 1)
	if state.CharBuffT != 702 {
		t.Fatalf("charBuff.t = %d, want 702", state.CharBuffT)
	}
	if _, ok := state.Bag[charEngrave]; ok {
		t.Fatalf("engrave slot must NOT be stored as a bag entry")
	}

	seed2 := defaultState()
	seed2.Bag[3] = BagEntry{I: 3, T: 701, N: 1}
	_ = svc.saveState(ctx, 2, seed2)
	res2, err := svc.MoveMedal(ctx, 2, 3, petEngrave)
	if err != nil {
		t.Fatalf("MoveMedal inv->pet-engrave: %v", err)
	}
	if res2.Type != moveTypePet || res2.PetJoinTid != 701 {
		t.Fatalf("pet engrave: type=%d petJoinTid=%d, want %d/701", res2.Type, res2.PetJoinTid, moveTypePet)
	}
	state2, _ := svc.loadState(ctx, 2)
	if state2.PetBuffT != 701 {
		t.Fatalf("petBuff.t = %d, want 701", state2.PetBuffT)
	}
}

func TestMoveMedal_Errors(t *testing.T) {
	svc := newTestService(t)
	ctx := context.Background()
	if _, err := svc.MoveMedal(ctx, 1, 5, 5); !errors.Is(err, ErrInvalidArgs) {
		t.Fatalf("same slot: want ErrInvalidArgs, got %v", err)
	}
	if _, err := svc.MoveMedal(ctx, 1, 5, 1001); !errors.Is(err, ErrSlotEmpty) {
		t.Fatalf("empty source: want ErrSlotEmpty, got %v", err)
	}
}

func TestArrangeBag_DensePacks(t *testing.T) {
	svc := newTestService(t)
	ctx := context.Background()
	seed := defaultState()
	seed.Bag[2] = BagEntry{I: 2, T: 701, N: 1}
	seed.Bag[5] = BagEntry{I: 5, T: 702, N: 3}
	seed.Bag[9] = BagEntry{I: 9, T: 701, N: 1}
	seed.Bag[1001] = BagEntry{I: 1001, T: 702, N: 1}
	_ = svc.saveState(ctx, 1, seed)

	bag, err := svc.ArrangeBag(ctx, 1)
	if err != nil {
		t.Fatalf("ArrangeBag: %v", err)
	}
	if _, ok := bag["1"]; !ok {
		t.Fatalf("inventory should re-key from 1, got %v", bag)
	}
	if _, ok := bag["2"]; !ok {
		t.Fatalf("expected dense slot 2")
	}
	if _, ok := bag["3"]; !ok {
		t.Fatalf("expected dense slot 3")
	}
	if _, ok := bag["1001"]; !ok {
		t.Fatalf("equip slot 1001 must be preserved by arrange, got %v", bag)
	}
	state, _ := svc.loadState(ctx, 1)
	if state.Bag[1].I != 1 || state.Bag[2].I != 2 || state.Bag[3].I != 3 {
		t.Fatalf("re-keyed entries must carry matching i: %+v %+v %+v", state.Bag[1], state.Bag[2], state.Bag[3])
	}
	for slot := 4; slot <= bagMaxID; slot++ {
		if _, ok := state.Bag[slot]; ok {
			t.Fatalf("slot %d should be empty after dense-pack of 3 items", slot)
		}
	}
}

func TestUpMedal_DeductsExpAndAdvances(t *testing.T) {
	svc := newTestService(t)
	ctx := context.Background()
	seed := defaultState()
	seed.Exp = 250
	seed.Bag[1] = BagEntry{I: 1, T: 701, N: 1}
	_ = svc.saveState(ctx, 1, seed)

	res, err := svc.UpMedal(ctx, 1, 1)
	if err != nil {
		t.Fatalf("UpMedal: %v", err)
	}
	if res.MedalExp != 150 {
		t.Fatalf("medalExp after up = %d, want 150 (250-100)", res.MedalExp)
	}
	if res.BA[1].T != 702 {
		t.Fatalf("upgraded entry should advance 701->702, got %+v", res.BA[1])
	}
	state, _ := svc.loadState(ctx, 1)
	if state.Bag[1].T != 702 || state.Exp != 150 {
		t.Fatalf("persisted up: bag=%+v exp=%d", state.Bag[1], state.Exp)
	}

	seedPoor := defaultState()
	seedPoor.Exp = 50
	seedPoor.Bag[1] = BagEntry{I: 1, T: 701, N: 1}
	_ = svc.saveState(ctx, 2, seedPoor)
	if _, err := svc.UpMedal(ctx, 2, 1); !errors.Is(err, ErrInsufficient) {
		t.Fatalf("701 up_exp=100 > exp=50: want ErrInsufficient, got %v", err)
	}

	seed3 := defaultState()
	seed3.Exp = 10000
	seed3.Bag[1] = BagEntry{I: 1, T: 702, N: 1}
	_ = svc.saveState(ctx, 3, seed3)
	if _, err := svc.UpMedal(ctx, 3, 1); !errors.Is(err, ErrMaxLevel) {
		t.Fatalf("702 has no level-3 family member: want ErrMaxLevel, got %v", err)
	}
}

func TestBreakMedal_CreditsExpAndReduces(t *testing.T) {
	svc := newTestService(t)
	ctx := context.Background()
	seed := defaultState()
	seed.Exp = 5
	seed.Bag[1] = BagEntry{I: 1, T: 701, N: 3}
	_ = svc.saveState(ctx, 1, seed)

	res, err := svc.BreakMedal(ctx, 1, 1, 2, 2)
	if err != nil {
		t.Fatalf("BreakMedal partial: %v", err)
	}
	if res.MedalExp != 45 {
		t.Fatalf("medalExp = %d, want 45 (5 + 20*2)", res.MedalExp)
	}
	if res.BA[1].N != 1 {
		t.Fatalf("remaining count = %d, want 1", res.BA[1].N)
	}
	if res.HasDel {
		t.Fatalf("partial break should not del the slot")
	}

	res, err = svc.BreakMedal(ctx, 1, 1, 5, 2)
	if err != nil {
		t.Fatalf("BreakMedal remainder: %v", err)
	}
	if !res.HasDel || res.Del != 1 {
		t.Fatalf("breaking all should del slot 1, got HasDel=%v Del=%d", res.HasDel, res.Del)
	}
	if res.MedalExp != 65 {
		t.Fatalf("medalExp after full = %d, want 65 (45 + 20*1)", res.MedalExp)
	}
	state, _ := svc.loadState(ctx, 1)
	if _, ok := state.Bag[1]; ok {
		t.Fatalf("slot 1 should be gone")
	}
}

func TestBreakMedal_RareReturnsBan(t *testing.T) {
	svc := newTestService(t)
	ctx := context.Background()
	seed := defaultState()
	seed.Bag[1] = BagEntry{I: 1, T: 900, N: 1}
	_ = svc.saveState(ctx, 1, seed)

	if _, err := svc.BreakMedal(ctx, 1, 1, 1, 1); !errors.Is(err, ErrRareProtected) {
		t.Fatalf("rare q>=4 break: want ErrRareProtected, got %v", err)
	}
}
