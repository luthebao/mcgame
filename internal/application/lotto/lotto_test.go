// Open-sourced by BaoLT

package lotto

import (
	"context"
	"testing"

	domainfeature "mcgame-server/internal/domain/statfeature"

	"go.uber.org/zap"
)

type fakeFeatureRepo struct {
	states map[int64][]*domainfeature.CharacterFeatureState
}

func newFakeRepo() *fakeFeatureRepo {
	return &fakeFeatureRepo{states: map[int64][]*domainfeature.CharacterFeatureState{}}
}

func (r *fakeFeatureRepo) ListCharacterFeatureStates(ctx context.Context, charID int64) ([]*domainfeature.CharacterFeatureState, error) {
	return r.states[charID], nil
}

func (r *fakeFeatureRepo) UpsertCharacterFeatureState(ctx context.Context, state *domainfeature.CharacterFeatureState) error {
	list := r.states[state.CharacterID]
	for i, st := range list {
		if st.FeatureKey == state.FeatureKey {
			list[i] = state
			r.states[state.CharacterID] = list
			return nil
		}
	}
	r.states[state.CharacterID] = append(list, state)
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

func TestLottoState_RoundTrip(t *testing.T) {
	s := defaultLottoState()
	s.Lotto = []LottoEntry{{Ti: "29", Ii: "5", N: 54, B: 1, Q: "0.00"}, {Ti: "29", Ii: "16", N: 27, B: 1, Q: "1.00"}}
	s.Lottery = []LottoEntry{{Ti: "27", Ii: "900", N: 1, B: 0, Q: "2.50"}}

	got := lottoStateFromMap(s.ToMap())
	if len(got.Lotto) != 2 || len(got.Lottery) != 1 || len(got.LuckDraw) != 0 {
		t.Fatalf("bag sizes: lotto=%d lottery=%d luckDraw=%d", len(got.Lotto), len(got.Lottery), len(got.LuckDraw))
	}
	e := got.Lotto[0]
	if e.Ti != "29" || e.Ii != "5" || e.N != 54 || e.B != 1 || e.Q != "0.00" {
		t.Fatalf("entry round-trip mismatch: %+v", e)
	}
}

func TestService_AddToBag_And_Lengths(t *testing.T) {
	svc := NewService(newFakeRepo(), zap.NewNop())
	ctx := context.Background()

	for i := 0; i < 28; i++ {
		if err := svc.AddToBag(ctx, 1, BagLotto, LottoEntry{Ti: "29", Ii: "5", N: 1, B: 1, Q: "0.00"}); err != nil {
			t.Fatalf("AddToBag lotto: %v", err)
		}
	}
	if err := svc.AddToBag(ctx, 1, BagLottery, LottoEntry{Ti: "29", Ii: "6", N: 1, B: 1, Q: "0.00"}); err != nil {
		t.Fatalf("AddToBag lottery: %v", err)
	}

	lottoLen, lotteryLen := svc.BagLengths(ctx, 1)
	if lottoLen != 28 {
		t.Fatalf("lotooBagLength = %d, want 28", lottoLen)
	}
	if lotteryLen != 1 {
		t.Fatalf("lotteryBagLength = %d, want 1", lotteryLen)
	}
}

func TestService_ThrowAll_Clears(t *testing.T) {
	svc := NewService(newFakeRepo(), zap.NewNop())
	ctx := context.Background()
	_ = svc.AddToBag(ctx, 1, BagLotto, LottoEntry{Ti: "29", Ii: "5", N: 1, B: 1, Q: "0.00"})

	bag, err := svc.ThrowAll(ctx, 1, BagLotto)
	if err != nil {
		t.Fatalf("ThrowAll: %v", err)
	}
	if len(bag) != 0 {
		t.Fatalf("after ThrowAll bag len = %d, want 0", len(bag))
	}
	lottoLen, _ := svc.BagLengths(ctx, 1)
	if lottoLen != 0 {
		t.Fatalf("persisted length after ThrowAll = %d, want 0", lottoLen)
	}
}

func TestService_ClaimSingle_OutOfBounds_NoOp(t *testing.T) {
	svc := NewService(newFakeRepo(), zap.NewNop())
	ctx := context.Background()
	_ = svc.AddToBag(ctx, 1, BagLotto, LottoEntry{Ti: "29", Ii: "5", N: 1, B: 1, Q: "0.00"})

	bag, err := svc.ClaimSingle(ctx, 1, BagLotto, 99)
	if err != nil {
		t.Fatalf("ClaimSingle out-of-bounds should be a no-op, got err %v", err)
	}
	if len(bag) != 1 {
		t.Fatalf("out-of-bounds claim changed bag: len=%d, want 1", len(bag))
	}
}
