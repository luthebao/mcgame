// Open-sourced by BaoLT

package mysterytreasure

import (
	"context"
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
	r.charStates[state.CharacterID] = []*domainfeature.CharacterFeatureState{state}
	return nil
}
func (r *fakeFeatureRepo) GetCharacterProgression(ctx context.Context, charID int64) (*domainfeature.CharacterProgression, error) {
	return nil, nil
}
func (r *fakeFeatureRepo) UpsertCharacterSoulProgression(ctx context.Context, charID int64, soulLevel int, soulExp int64) error {
	return nil
}
func (r *fakeFeatureRepo) ListPetFeatureStates(ctx context.Context, petID int64) ([]*domainfeature.PetFeatureState, error) {
	return nil, nil
}
func (r *fakeFeatureRepo) UpsertPetFeatureState(ctx context.Context, state *domainfeature.PetFeatureState) error {
	return nil
}
func (r *fakeFeatureRepo) GetActiveMount(ctx context.Context, charID int64) (*domainfeature.ActiveMount, error) {
	return nil, nil
}
func (r *fakeFeatureRepo) PPVEChallengeNextFloor(ctx context.Context, charID int64, maxFloor int, freeChallenges int, today string) (*domainfeature.PPVEChallengeResult, error) {
	return nil, nil
}

type fakeChipProvider struct {
	wire map[string]interface{}
}

func (p *fakeChipProvider) ChipBagLoginWire(ctx context.Context, charID int64) map[string]interface{} {
	return p.wire
}

func TestBuildLoginBlob_RealStateAndChipBag(t *testing.T) {
	repo := newFakeRepo()
	svc := NewService(repo, zap.NewNop())
	ctx := context.Background()

	st := DefaultState()
	st.Bag["3"] = BagSlot{Mid: 12301, Num: 4}
	st.LearnedRec["501"] = 501
	st.SkilLvl = 5
	st.SkiPt = 120
	if err := svc.Save(ctx, 1, st); err != nil {
		t.Fatalf("Save: %v", err)
	}

	svc.SetChipBagProvider(&fakeChipProvider{wire: map[string]interface{}{
		"1": map[string]interface{}{"chipId": "12401", "num": float64(2)},
	}})

	blob := svc.BuildLoginBlob(ctx, 1)

	for _, key := range []string{"mysBag", "chipBag", "makeData", "activeObj", "addTimes", "makeLimitTimes", "mysBook"} {
		if _, ok := blob[key]; !ok {
			t.Fatalf("login blob missing key %q", key)
		}
	}

	mysBag := blob["mysBag"].(map[string]interface{})
	slot := mysBag["3"].(map[string]interface{})
	if slot["mid"].(float64) != 12301 || slot["num"].(float64) != 4 {
		t.Fatalf("mysBag slot mismatch: %+v", slot)
	}

	makeData := blob["makeData"].(map[string]interface{})
	if makeData["skiLvl"].(float64) != 5 || makeData["skiPt"].(float64) != 120 {
		t.Fatalf("makeData scalars mismatch: %+v", makeData)
	}
	if makeData["learnedRec"].(map[string]interface{})["501"].(float64) != 501 {
		t.Fatalf("learnedRec mismatch: %+v", makeData["learnedRec"])
	}

	chipBag := blob["chipBag"].(map[string]interface{})
	if chipBag["1"].(map[string]interface{})["chipId"] != "12401" {
		t.Fatalf("chipBag mismatch: %+v", chipBag)
	}

	addTimes := blob["addTimes"].(map[string]interface{})
	if addTimes["t"] != "0|0" {
		t.Fatalf("addTimes default mismatch: %+v", addTimes)
	}
}

func TestBuildLoginBlob_NoChipProvider_EmptyChipBag(t *testing.T) {
	svc := NewService(newFakeRepo(), zap.NewNop())
	blob := svc.BuildLoginBlob(context.Background(), 1)
	chipBag, ok := blob["chipBag"].(map[string]interface{})
	if !ok || len(chipBag) != 0 {
		t.Fatalf("chipBag with no provider should be empty map, got %#v", blob["chipBag"])
	}
	makeData := blob["makeData"].(map[string]interface{})
	if makeData["skiLvl"].(float64) != 1 {
		t.Fatalf("default skiLvl = %v, want 1", makeData["skiLvl"])
	}
}
