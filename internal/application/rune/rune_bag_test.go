// Open-sourced by BaoLT

package rune

import (
	"context"
	"encoding/json"
	"testing"

	domainfeature "mcgame-server/internal/domain/statfeature"

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

// jsonRepo wraps fakeFeatureRepo so persisted state survives a JSON round-trip,
// forcing every numeric field through float64 on read — exactly how the real
// jsonb/AMF read-path delivers it to decodeRuneBag.
type jsonRepo struct {
	*fakeFeatureRepo
}

func newJSONRepo() *jsonRepo {
	return &jsonRepo{fakeFeatureRepo: newFakeRepo()}
}

func (r *jsonRepo) UpsertCharacterFeatureState(ctx context.Context, state *domainfeature.CharacterFeatureState) error {
	raw, err := json.Marshal(state.State)
	if err != nil {
		return err
	}
	var decoded map[string]interface{}
	if err := json.Unmarshal(raw, &decoded); err != nil {
		return err
	}
	clone := &domainfeature.CharacterFeatureState{
		CharacterID: state.CharacterID,
		FeatureKey:  state.FeatureKey,
		State:       decoded,
	}
	return r.fakeFeatureRepo.UpsertCharacterFeatureState(ctx, clone)
}

func newService(repo domainfeature.Repository) *Service {
	return NewService(repo, zap.NewNop())
}

const testCharID int64 = 1

func TestSaveRuneBag_RoundTripViaGetRuneBag(t *testing.T) {
	svc := newService(newJSONRepo())
	ctx := context.Background()

	want := RuneBag{
		ChaBag: map[string]RuneSlot{
			"0": {N: 3, R: 11901},
			"2": {N: 1, R: 11905},
		},
		PetBag: map[string]RuneSlot{
			"0": {N: 7, R: 11920},
		},
		UpLvlHole: 11999,
	}
	if err := svc.SaveRuneBag(ctx, testCharID, want); err != nil {
		t.Fatalf("SaveRuneBag: %v", err)
	}

	got, err := svc.GetRuneBag(ctx, testCharID)
	if err != nil {
		t.Fatalf("GetRuneBag: %v", err)
	}
	if got.UpLvlHole != 11999 {
		t.Fatalf("upLvlHole = %d, want 11999", got.UpLvlHole)
	}
	if got.ChaBag["0"] != (RuneSlot{N: 3, R: 11901}) {
		t.Fatalf("chaBag[0] = %+v, want {3,11901}", got.ChaBag["0"])
	}
	if got.ChaBag["2"] != (RuneSlot{N: 1, R: 11905}) {
		t.Fatalf("chaBag[2] = %+v, want {1,11905}", got.ChaBag["2"])
	}
	if got.PetBag["0"] != (RuneSlot{N: 7, R: 11920}) {
		t.Fatalf("petBag[0] = %+v, want {7,11920}", got.PetBag["0"])
	}
}

func TestRuneMove_BagToUpLvlHole(t *testing.T) {
	svc := newService(newJSONRepo())
	ctx := context.Background()
	seed := RuneBag{
		ChaBag:    map[string]RuneSlot{"1": {N: 1, R: 11901}},
		PetBag:    map[string]RuneSlot{},
		UpLvlHole: 0,
	}
	if err := svc.SaveRuneBag(ctx, testCharID, seed); err != nil {
		t.Fatalf("seed: %v", err)
	}

	bag, err := svc.RuneMove(ctx, testCharID, 1, UpLvlHolePos, BagTypeCha)
	if err != nil {
		t.Fatalf("RuneMove: %v", err)
	}
	if bag.UpLvlHole != 11901 {
		t.Fatalf("upLvlHole = %d, want 11901", bag.UpLvlHole)
	}
	if _, taken := bag.ChaBag["1"]; taken {
		t.Fatalf("chaBag[1] still present after move to upLvlHole")
	}

	reloaded, _ := svc.GetRuneBag(ctx, testCharID)
	if reloaded.UpLvlHole != 11901 || len(reloaded.ChaBag) != 0 {
		t.Fatalf("persisted state mismatch: %+v", reloaded)
	}
}

func TestRuneMove_UpLvlHoleToBag(t *testing.T) {
	svc := newService(newJSONRepo())
	ctx := context.Background()
	seed := RuneBag{
		ChaBag:    map[string]RuneSlot{},
		PetBag:    map[string]RuneSlot{},
		UpLvlHole: 11901,
	}
	if err := svc.SaveRuneBag(ctx, testCharID, seed); err != nil {
		t.Fatalf("seed: %v", err)
	}

	bag, err := svc.RuneMove(ctx, testCharID, UpLvlHolePos, 5, BagTypeCha)
	if err != nil {
		t.Fatalf("RuneMove: %v", err)
	}
	if bag.UpLvlHole != 0 {
		t.Fatalf("upLvlHole = %d, want 0 after move out", bag.UpLvlHole)
	}
	if bag.ChaBag["5"] != (RuneSlot{N: 1, R: 11901}) {
		t.Fatalf("chaBag[5] = %+v, want {1,11901}", bag.ChaBag["5"])
	}
}

func TestRuneMove_SlotSwap(t *testing.T) {
	svc := newService(newJSONRepo())
	ctx := context.Background()
	seed := RuneBag{
		ChaBag: map[string]RuneSlot{
			"0": {N: 1, R: 11901},
			"3": {N: 2, R: 11905},
		},
		PetBag:    map[string]RuneSlot{},
		UpLvlHole: 0,
	}
	if err := svc.SaveRuneBag(ctx, testCharID, seed); err != nil {
		t.Fatalf("seed: %v", err)
	}

	bag, err := svc.RuneMove(ctx, testCharID, 0, 3, BagTypeCha)
	if err != nil {
		t.Fatalf("RuneMove swap: %v", err)
	}
	if bag.ChaBag["0"] != (RuneSlot{N: 2, R: 11905}) {
		t.Fatalf("chaBag[0] = %+v, want {2,11905}", bag.ChaBag["0"])
	}
	if bag.ChaBag["3"] != (RuneSlot{N: 1, R: 11901}) {
		t.Fatalf("chaBag[3] = %+v, want {1,11901}", bag.ChaBag["3"])
	}
}

func TestRuneMove_SlotMoveToEmpty(t *testing.T) {
	svc := newService(newJSONRepo())
	ctx := context.Background()
	seed := RuneBag{
		ChaBag:    map[string]RuneSlot{"0": {N: 1, R: 11901}},
		PetBag:    map[string]RuneSlot{},
		UpLvlHole: 0,
	}
	if err := svc.SaveRuneBag(ctx, testCharID, seed); err != nil {
		t.Fatalf("seed: %v", err)
	}

	bag, err := svc.RuneMove(ctx, testCharID, 0, 4, BagTypeCha)
	if err != nil {
		t.Fatalf("RuneMove to empty: %v", err)
	}
	if _, taken := bag.ChaBag["0"]; taken {
		t.Fatalf("chaBag[0] still present after move to empty slot")
	}
	if bag.ChaBag["4"] != (RuneSlot{N: 1, R: 11901}) {
		t.Fatalf("chaBag[4] = %+v, want {1,11901}", bag.ChaBag["4"])
	}
}

func TestArrangeRuneBag_DensePacks(t *testing.T) {
	svc := newService(newJSONRepo())
	ctx := context.Background()
	seed := RuneBag{
		ChaBag: map[string]RuneSlot{
			"0": {N: 1, R: 11901},
			"3": {N: 2, R: 11905},
			"7": {N: 5, R: 11910},
		},
		PetBag:    map[string]RuneSlot{},
		UpLvlHole: 0,
	}
	if err := svc.SaveRuneBag(ctx, testCharID, seed); err != nil {
		t.Fatalf("seed: %v", err)
	}

	bag, err := svc.ArrangeRuneBag(ctx, testCharID, BagTypeCha)
	if err != nil {
		t.Fatalf("ArrangeRuneBag: %v", err)
	}
	if len(bag.ChaBag) != 3 {
		t.Fatalf("packed bag size = %d, want 3", len(bag.ChaBag))
	}
	if bag.ChaBag["0"] != (RuneSlot{N: 1, R: 11901}) {
		t.Fatalf("packed[0] = %+v, want {1,11901}", bag.ChaBag["0"])
	}
	if bag.ChaBag["1"] != (RuneSlot{N: 2, R: 11905}) {
		t.Fatalf("packed[1] = %+v, want {2,11905}", bag.ChaBag["1"])
	}
	if bag.ChaBag["2"] != (RuneSlot{N: 5, R: 11910}) {
		t.Fatalf("packed[2] = %+v, want {5,11910}", bag.ChaBag["2"])
	}
	if _, taken := bag.ChaBag["3"]; taken {
		t.Fatalf("sparse key 3 should be gone after dense-pack")
	}
}

func TestAddRuneToBag_FirstFreeSlotThenStacks(t *testing.T) {
	svc := newService(newJSONRepo())
	ctx := context.Background()

	bag, err := svc.AddRuneToBag(ctx, testCharID, BagTypeCha, 11901, 2)
	if err != nil {
		t.Fatalf("AddRuneToBag (first): %v", err)
	}
	if bag.ChaBag["0"] != (RuneSlot{N: 2, R: 11901}) {
		t.Fatalf("chaBag[0] = %+v, want {2,11901}", bag.ChaBag["0"])
	}

	bag, err = svc.AddRuneToBag(ctx, testCharID, BagTypeCha, 11905, 1)
	if err != nil {
		t.Fatalf("AddRuneToBag (second): %v", err)
	}
	if bag.ChaBag["1"] != (RuneSlot{N: 1, R: 11905}) {
		t.Fatalf("chaBag[1] = %+v, want {1,11905}", bag.ChaBag["1"])
	}

	bag, err = svc.AddRuneToBag(ctx, testCharID, BagTypeCha, 11901, 3)
	if err != nil {
		t.Fatalf("AddRuneToBag (stack): %v", err)
	}
	if bag.ChaBag["0"] != (RuneSlot{N: 5, R: 11901}) {
		t.Fatalf("chaBag[0] after stack = %+v, want {5,11901}", bag.ChaBag["0"])
	}
	if len(bag.ChaBag) != 2 {
		t.Fatalf("bag size after stack = %d, want 2", len(bag.ChaBag))
	}
}

func TestAddRuneToBag_PetBagTargeting(t *testing.T) {
	svc := newService(newJSONRepo())
	ctx := context.Background()

	bag, err := svc.AddRuneToBag(ctx, testCharID, BagTypePet, 11920, 4)
	if err != nil {
		t.Fatalf("AddRuneToBag pet: %v", err)
	}
	if bag.PetBag["0"] != (RuneSlot{N: 4, R: 11920}) {
		t.Fatalf("petBag[0] = %+v, want {4,11920}", bag.PetBag["0"])
	}
	if len(bag.ChaBag) != 0 {
		t.Fatalf("chaBag should be untouched, got %+v", bag.ChaBag)
	}
}
