// Open-sourced by BaoLT

package prabuff

import (
	"context"
	"encoding/json"
	"errors"
	"math/rand"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"

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

func newTestService(char *domainchar.Character) (*Service, *fakeCharRepo) {
	return newTestServiceSeed(char, noCritSeed)
}

func newTestServiceSeed(char *domainchar.Character, seed int64) (*Service, *fakeCharRepo) {
	charRepo := &fakeCharRepo{chars: map[int64]*domainchar.Character{}}
	if char != nil {
		charRepo.chars[char.ID] = char
	}
	svc := NewService(newFakeRepo(), charRepo, zap.NewNop())
	svc.SetRandSource(rand.NewSource(seed))
	return svc, charRepo
}

const (
	noCritSeed = int64(1)
	critSeed   = int64(9)
)

func TestState_RoundTripThroughJSON(t *testing.T) {
	s := defaultState()
	s.setTrack(1, Track{Level: 3, Exp: 1500})
	s.setTrack(5, Track{Level: 1, Exp: 300})

	raw, err := json.Marshal(s.toPersist())
	if err != nil {
		t.Fatalf("marshal: %v", err)
	}
	var decoded map[string]interface{}
	if err := json.Unmarshal(raw, &decoded); err != nil {
		t.Fatalf("unmarshal: %v", err)
	}
	got := stateFromMap(decoded)
	if got.track(1).Level != 3 || got.track(1).Exp != 1500 {
		t.Fatalf("track 1 round-trip = %+v, want {3,1500}", got.track(1))
	}
	if got.track(5).Level != 1 || got.track(5).Exp != 300 {
		t.Fatalf("track 5 round-trip = %+v, want {1,300}", got.track(5))
	}
}

func TestState_ToPersistHasAll16Keys(t *testing.T) {
	persist := defaultState().toPersist()
	keys := []string{
		"def", "defExp", "magicDef", "magicDefExp",
		"petDef", "petDefExp", "petMagicDef", "petMagicDefExp",
		"peoAttack", "peoAttackExp", "petAttack", "petAttackExp",
		"peoSpeed", "peoSpeedExp", "petSpeed", "petSpeedExp",
	}
	if len(persist) != 16 {
		t.Fatalf("toPersist key count = %d, want 16", len(persist))
	}
	for _, k := range keys {
		if _, ok := persist[k]; !ok {
			t.Fatalf("toPersist missing key %q", k)
		}
	}
}

func TestGetMagicArrayData_ElementByPraType(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 500, ElementPoint: 111, YijieElement: 222}
	svc, _ := newTestService(char)
	ctx := context.Background()

	charData, err := svc.GetMagicArrayData(ctx, 1, 1)
	if err != nil {
		t.Fatalf("GetMagicArrayData(1): %v", err)
	}
	if charData["elementNum"] != 111 || charData["goldNum"] != int64(500) {
		t.Fatalf("praType 1 wire = %+v, want elementNum=111 goldNum=500", charData)
	}
	petData, err := svc.GetMagicArrayData(ctx, 1, 5)
	if err != nil {
		t.Fatalf("GetMagicArrayData(5): %v", err)
	}
	if petData["elementNum"] != 222 {
		t.Fatalf("praType 5 elementNum = %v, want 222 (yijieElement)", petData["elementNum"])
	}
}

func TestAddPracticeExp_DeductsElementAndGainsExp(t *testing.T) {
	char := &domainchar.Character{ID: 1, ElementPoint: 100}
	svc, charRepo := newTestService(char)
	ctx := context.Background()

	wire, err := svc.AddPracticeExp(ctx, 1, 1, false)
	if err != nil {
		t.Fatalf("AddPracticeExp: %v", err)
	}
	if charRepo.chars[1].ElementPoint != 90 {
		t.Fatalf("element after = %d, want 90 (100-10)", charRepo.chars[1].ElementPoint)
	}
	if wire["addExp"] != addExp[0] || wire["exp"] != addExp[0] {
		t.Fatalf("wire = %+v, want addExp/exp = %d", wire, addExp[0])
	}
	if wire["buff"] != 0 {
		t.Fatalf("buff = %v, want 0 (not enough exp to level)", wire["buff"])
	}
	if wire["critMulit"] != false {
		t.Fatalf("critMulit = %v, want false (noCritSeed)", wire["critMulit"])
	}
}

func TestAddPracticeExp_GoldPath(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 100, ElementPoint: 100}
	svc, charRepo := newTestService(char)
	ctx := context.Background()

	if _, err := svc.AddPracticeExp(ctx, 1, 1, true); err != nil {
		t.Fatalf("AddPracticeExp gold: %v", err)
	}
	if charRepo.chars[1].Gold != 93 {
		t.Fatalf("gold after = %d, want 93 (100-7)", charRepo.chars[1].Gold)
	}
	if charRepo.chars[1].ElementPoint != 100 {
		t.Fatalf("element should be untouched on gold path, got %d", charRepo.chars[1].ElementPoint)
	}
}

func TestAddPracticeExp_YijieElementForPetTracks(t *testing.T) {
	char := &domainchar.Character{ID: 1, YijieElement: 100, ElementPoint: 100}
	svc, charRepo := newTestService(char)
	ctx := context.Background()

	if _, err := svc.AddPracticeExp(ctx, 1, 5, false); err != nil {
		t.Fatalf("AddPracticeExp(5): %v", err)
	}
	if charRepo.chars[1].YijieElement != 90 {
		t.Fatalf("yijieElement after = %d, want 90", charRepo.chars[1].YijieElement)
	}
	if charRepo.chars[1].ElementPoint != 100 {
		t.Fatalf("elementPoint should be untouched for pet track, got %d", charRepo.chars[1].ElementPoint)
	}
}

func TestAddPracticeExp_LevelUpAcrossThresholds(t *testing.T) {
	char := &domainchar.Character{ID: 1, ElementPoint: 1000}
	svc, _ := newTestService(char)
	ctx := context.Background()
	seed := defaultState()
	seed.setTrack(1, Track{Level: 0, Exp: levelExp[1] - addExp[0]})
	if err := svc.saveState(ctx, 1, seed); err != nil {
		t.Fatalf("seed: %v", err)
	}

	wire, err := svc.AddPracticeExp(ctx, 1, 1, false)
	if err != nil {
		t.Fatalf("AddPracticeExp: %v", err)
	}
	if wire["exp"] != levelExp[1] {
		t.Fatalf("exp = %v, want %d", wire["exp"], levelExp[1])
	}
	if wire["buff"] != 2 {
		t.Fatalf("buff = %v, want 2 (crossed levelExp[0] and levelExp[1])", wire["buff"])
	}
}

func TestAddPracticeExp_MaxLevel(t *testing.T) {
	char := &domainchar.Character{ID: 1, ElementPoint: 1000}
	svc, _ := newTestService(char)
	ctx := context.Background()
	seed := defaultState()
	seed.setTrack(1, Track{Level: MaxLevel, Exp: levelExp[MaxLevel-1]})
	_ = svc.saveState(ctx, 1, seed)

	if _, err := svc.AddPracticeExp(ctx, 1, 1, false); !errors.Is(err, ErrMaxLevel) {
		t.Fatalf("want ErrMaxLevel, got %v", err)
	}
}

func TestAddPracticeExp_InsufficientElement(t *testing.T) {
	svc, _ := newTestService(&domainchar.Character{ID: 1, ElementPoint: 5})
	if _, err := svc.AddPracticeExp(context.Background(), 1, 1, false); !errors.Is(err, ErrInsufficientElement) {
		t.Fatalf("want ErrInsufficientElement, got %v", err)
	}
}

func TestValidation_InvalidPraType(t *testing.T) {
	svc, _ := newTestService(&domainchar.Character{ID: 1, ElementPoint: 100})
	ctx := context.Background()
	if _, err := svc.GetMagicArrayData(ctx, 1, 0); !errors.Is(err, ErrInvalidPraType) {
		t.Fatalf("praType 0: want ErrInvalidPraType, got %v", err)
	}
	if _, err := svc.AddPracticeExp(ctx, 1, 9, false); !errors.Is(err, ErrInvalidPraType) {
		t.Fatalf("praType 9: want ErrInvalidPraType, got %v", err)
	}
}

func TestApplyCrit_Formula(t *testing.T) {
	cases := []struct {
		name     string
		baseGain int
		roll     int
		wantGain int
		wantCrit bool
	}{
		{"roll below rate crits", 5, critRatePercent - 1, 5 * critExpMultiplier, true},
		{"roll at rate boundary no crit", 5, critRatePercent, 5, false},
		{"roll above rate no crit", 5, 99, 5, false},
		{"roll zero crits", 4, 0, 4 * critExpMultiplier, true},
		{"zero base never crits", 0, 0, 0, false},
		{"negative base never crits", -3, 0, -3, false},
	}
	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			gain, crit := applyCrit(tc.baseGain, tc.roll)
			if gain != tc.wantGain || crit != tc.wantCrit {
				t.Fatalf("applyCrit(%d,%d) = (%d,%v), want (%d,%v)", tc.baseGain, tc.roll, gain, crit, tc.wantGain, tc.wantCrit)
			}
		})
	}
}

func TestAddPracticeExp_CritDoublesGainAndExp(t *testing.T) {
	char := &domainchar.Character{ID: 1, ElementPoint: 100}
	svc, _ := newTestServiceSeed(char, critSeed)
	ctx := context.Background()

	wire, err := svc.AddPracticeExp(ctx, 1, 1, false)
	if err != nil {
		t.Fatalf("AddPracticeExp: %v", err)
	}
	wantGain := addExp[0] * critExpMultiplier
	if wire["critMulit"] != true {
		t.Fatalf("critMulit = %v, want true (critSeed)", wire["critMulit"])
	}
	if wire["addExp"] != wantGain {
		t.Fatalf("addExp = %v, want %d (base %d x %d)", wire["addExp"], wantGain, addExp[0], critExpMultiplier)
	}
	if wire["exp"] != wantGain {
		t.Fatalf("exp = %v, want %d (granted exp must equal reported addExp)", wire["exp"], wantGain)
	}
}

func TestAddPracticeExp_CritCanCrossLevelThreshold(t *testing.T) {
	char := &domainchar.Character{ID: 1, ElementPoint: 100}
	svc, _ := newTestServiceSeed(char, critSeed)
	ctx := context.Background()
	seed := defaultState()
	seed.setTrack(1, Track{Level: 0, Exp: levelExp[0] - addExp[0]})
	if err := svc.saveState(ctx, 1, seed); err != nil {
		t.Fatalf("seed: %v", err)
	}

	wire, err := svc.AddPracticeExp(ctx, 1, 1, false)
	if err != nil {
		t.Fatalf("AddPracticeExp: %v", err)
	}
	if wire["critMulit"] != true {
		t.Fatalf("critMulit = %v, want true", wire["critMulit"])
	}
	if wire["buff"] != 1 {
		t.Fatalf("buff = %v, want 1 (doubled gain crossed levelExp[0])", wire["buff"])
	}
	if wire["exp"] != levelExp[0]-addExp[0]+addExp[0]*critExpMultiplier {
		t.Fatalf("exp = %v, want %d", wire["exp"], levelExp[0]-addExp[0]+addExp[0]*critExpMultiplier)
	}
}

func TestGetMagicArrayData_CarriesNoCritFields(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 10, ElementPoint: 50}
	svc, _ := newTestService(char)
	data, err := svc.GetMagicArrayData(context.Background(), 1, 1)
	if err != nil {
		t.Fatalf("GetMagicArrayData: %v", err)
	}
	if _, ok := data["critMulit"]; ok {
		t.Fatalf("GetMagicArrayData must not carry critMulit (login-parity read path); got %+v", data)
	}
	if _, ok := data["addExp"]; ok {
		t.Fatalf("GetMagicArrayData must not carry addExp; got %+v", data)
	}
}

func TestAddPracticeExp_CritInvariantOverManySeeds(t *testing.T) {
	ctx := context.Background()
	critCount := 0
	const runs = 400
	for seed := int64(0); seed < runs; seed++ {
		char := &domainchar.Character{ID: 1, ElementPoint: 100}
		svc, _ := newTestServiceSeed(char, seed)
		wire, err := svc.AddPracticeExp(ctx, 1, 1, false)
		if err != nil {
			t.Fatalf("seed %d: AddPracticeExp: %v", seed, err)
		}
		gain := wire["addExp"].(int)
		crit := wire["critMulit"].(bool)
		if wire["exp"].(int) != gain {
			t.Fatalf("seed %d: granted exp %v != reported addExp %d", seed, wire["exp"], gain)
		}
		if crit {
			critCount++
			if gain != addExp[0]*critExpMultiplier {
				t.Fatalf("seed %d: crit gain %d, want %d", seed, gain, addExp[0]*critExpMultiplier)
			}
		} else if gain != addExp[0] {
			t.Fatalf("seed %d: non-crit gain %d, want %d", seed, gain, addExp[0])
		}
	}
	if critCount == 0 || critCount == runs {
		t.Fatalf("crit fired %d/%d times — RNG path looks degenerate", critCount, runs)
	}
}
