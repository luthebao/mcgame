// Open-sourced by BaoLT

package starinstance

import (
	"context"
	"testing"
	"time"

	"github.com/google/uuid"

	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"
)

type fakeFeatureRepo struct {
	states map[int64][]*domainfeature.CharacterFeatureState
}

func newFakeFeatureRepo() *fakeFeatureRepo {
	return &fakeFeatureRepo{states: map[int64][]*domainfeature.CharacterFeatureState{}}
}

func (r *fakeFeatureRepo) GetCharacterProgression(ctx context.Context, charID int64) (*domainfeature.CharacterProgression, error) {
	return &domainfeature.CharacterProgression{CharacterID: charID}, nil
}

func (r *fakeFeatureRepo) ListCharacterFeatureStates(ctx context.Context, charID int64) ([]*domainfeature.CharacterFeatureState, error) {
	return r.states[charID], nil
}

func (r *fakeFeatureRepo) UpsertCharacterSoulProgression(_ context.Context, _ int64, _ int, _ int64) error {
	return nil
}

func (r *fakeFeatureRepo) UpsertCharacterFeatureState(ctx context.Context, state *domainfeature.CharacterFeatureState) error {
	existing := r.states[state.CharacterID]
	for i, s := range existing {
		if s.FeatureKey == state.FeatureKey {
			existing[i] = state
			r.states[state.CharacterID] = existing
			return nil
		}
	}
	r.states[state.CharacterID] = append(existing, state)
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

func (r *fakeFeatureRepo) PPVEChallengeNextFloor(_ context.Context, _ int64, _ int, _ int, _ string) (*domainfeature.PPVEChallengeResult, error) {
	return nil, nil
}

type fakeCharRepo struct {
	chars map[int64]*domainchar.Character
}

func newFakeCharRepo(chars ...*domainchar.Character) *fakeCharRepo {
	r := &fakeCharRepo{chars: map[int64]*domainchar.Character{}}
	for _, c := range chars {
		r.chars[c.ID] = c
	}
	return r
}

func (r *fakeCharRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	return r.chars[id], nil
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
func (r *fakeCharRepo) Update(ctx context.Context, c *domainchar.Character) error {
	r.chars[c.ID] = c
	return nil
}
func (r *fakeCharRepo) Delete(ctx context.Context, id int64) error { return nil }
func (r *fakeCharRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}

func (r *fakeCharRepo) UpdatePosition(ctx context.Context, id int64, pos domainchar.Position) error {
	return nil
}

func (r *fakeCharRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

func fixedTime(year, month, day int) func() time.Time {
	t := time.Date(year, time.Month(month), day, 12, 0, 0, 0, time.UTC)
	return func() time.Time { return t }
}

func newTestService(charRepo *fakeCharRepo, featureRepo *fakeFeatureRepo, nowFn func() time.Time) *Service {
	svc := NewService(charRepo, featureRepo, nil, nil)
	svc.SetNowFunc(nowFn)
	return svc
}

func TestGetWarMap_DefaultState(t *testing.T) {
	charRepo := newFakeCharRepo(&domainchar.Character{ID: 1})
	featureRepo := newFakeFeatureRepo()
	svc := newTestService(charRepo, featureRepo, fixedTime(2026, 5, 11))

	state, err := svc.GetWarMap(context.Background(), 1)
	if err != nil {
		t.Fatalf("GetWarMap: %v", err)
	}
	if state.DailyMax != WarMapMinSmax {
		t.Errorf("DailyMax: got %d, want %d", state.DailyMax, WarMapMinSmax)
	}
	if state.DailyUsed != 0 {
		t.Errorf("DailyUsed: got %d, want 0", state.DailyUsed)
	}
	if len(state.Scores) != WarMapLevelMax {
		t.Errorf("Scores levels: got %d, want %d", len(state.Scores), WarMapLevelMax)
	}
	for lvl := WarMapLevelMin; lvl <= WarMapLevelMax; lvl++ {
		if len(state.Scores[lvl]) != WarMapSidMax {
			t.Errorf("Scores[%d] length: got %d, want %d", lvl, len(state.Scores[lvl]), WarMapSidMax)
		}
	}
}

func TestGetWarMap_LazyReset(t *testing.T) {
	charRepo := newFakeCharRepo(&domainchar.Character{ID: 1})
	featureRepo := newFakeFeatureRepo()

	day1 := fixedTime(2026, 5, 10)
	svc := newTestService(charRepo, featureRepo, day1)

	state, _ := svc.GetWarMap(context.Background(), 1)
	state.DailyUsed = 3
	state.DailyMax = 7
	if err := svc.saveState(context.Background(), 1, state); err != nil {
		t.Fatalf("save: %v", err)
	}

	day2 := fixedTime(2026, 5, 11)
	svc.SetNowFunc(day2)

	state2, err := svc.GetWarMap(context.Background(), 1)
	if err != nil {
		t.Fatalf("GetWarMap day2: %v", err)
	}
	if state2.DailyUsed != 0 {
		t.Errorf("after reset DailyUsed: got %d, want 0", state2.DailyUsed)
	}
	if state2.DailyMax != WarMapMinSmax {
		t.Errorf("after reset DailyMax: got %d, want %d", state2.DailyMax, WarMapMinSmax)
	}
}

func TestAddWarMapTime_HappyPath(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 1000}
	charRepo := newFakeCharRepo(char)
	featureRepo := newFakeFeatureRepo()
	svc := newTestService(charRepo, featureRepo, fixedTime(2026, 5, 11))

	_, _ = svc.GetWarMap(context.Background(), 1)

	newMax, err := svc.AddWarMapTime(context.Background(), 1, 5)
	if err != nil {
		t.Fatalf("AddWarMapTime: %v", err)
	}
	if newMax != 6 {
		t.Errorf("newMax: got %d, want 6", newMax)
	}
	updated := charRepo.chars[1]
	expectedCost := int64((5 - 4) * 10)
	expectedGold := int64(1000) - expectedCost
	if updated.Gold != expectedGold {
		t.Errorf("gold after buy: got %d, want %d", updated.Gold, expectedGold)
	}
}

func TestAddWarMapTime_CapReached(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 10000}
	charRepo := newFakeCharRepo(char)
	featureRepo := newFakeFeatureRepo()
	svc := newTestService(charRepo, featureRepo, fixedTime(2026, 5, 11))

	state := defaultWarMapState(20260511)
	state.DailyMax = WarMapMaxSmax
	_ = svc.saveState(context.Background(), 1, state)

	_, err := svc.AddWarMapTime(context.Background(), 1, WarMapMaxSmax)
	if err == nil {
		t.Fatal("expected error at cap, got nil")
	}
}

func TestAddWarMapTime_InsufficientGold(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 0}
	charRepo := newFakeCharRepo(char)
	featureRepo := newFakeFeatureRepo()
	svc := newTestService(charRepo, featureRepo, fixedTime(2026, 5, 11))

	_, _ = svc.GetWarMap(context.Background(), 1)

	_, err := svc.AddWarMapTime(context.Background(), 1, 5)
	if err == nil {
		t.Fatal("expected error for insufficient gold, got nil")
	}
}

func TestClickWarMap_SoloAccept(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "Hero"}
	charRepo := newFakeCharRepo(char)
	featureRepo := newFakeFeatureRepo()
	svc := newTestService(charRepo, featureRepo, fixedTime(2026, 5, 11))

	_, _ = svc.GetWarMap(context.Background(), 1)

	result, err := svc.ClickWarMap(context.Background(), 1, nil, 1, 1)
	if err != nil {
		t.Fatalf("ClickWarMap: %v", err)
	}
	if result.Code != 1 {
		t.Errorf("Code: got %d, want 1", result.Code)
	}

	state, _ := svc.loadState(context.Background(), 1)
	if state.DailyUsed != 1 {
		t.Errorf("DailyUsed after click: got %d, want 1", state.DailyUsed)
	}
}

func TestClickWarMap_OutOfAttempts(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "Hero"}
	charRepo := newFakeCharRepo(char)
	featureRepo := newFakeFeatureRepo()
	svc := newTestService(charRepo, featureRepo, fixedTime(2026, 5, 11))

	state := defaultWarMapState(20260511)
	state.DailyUsed = state.DailyMax
	_ = svc.saveState(context.Background(), 1, state)

	result, err := svc.ClickWarMap(context.Background(), 1, nil, 1, 1)
	if err != nil {
		t.Fatalf("ClickWarMap: %v", err)
	}
	if result.Code != -3 {
		t.Errorf("Code: got %d, want -3 (out of attempts)", result.Code)
	}
}

func TestOnBattleEnd_MonotonicScore(t *testing.T) {
	char := &domainchar.Character{ID: 1, StarPnt: 0}
	charRepo := newFakeCharRepo(char)
	featureRepo := newFakeFeatureRepo()
	svc := newTestService(charRepo, featureRepo, fixedTime(2026, 5, 11))

	res1, err := svc.OnBattleEnd(context.Background(), 1, 1, 1, 0, 0, true)
	if err != nil {
		t.Fatalf("OnBattleEnd first: %v", err)
	}
	if res1.Score < 50 {
		t.Errorf("score too low: %d", res1.Score)
	}

	state, _ := svc.loadState(context.Background(), 1)
	firstScore := state.Scores[1][1]

	res2, err := svc.OnBattleEnd(context.Background(), 1, 1, 1, 5, 60, true)
	if err != nil {
		t.Fatalf("OnBattleEnd second: %v", err)
	}

	state2, _ := svc.loadState(context.Background(), 1)
	if state2.Scores[1][1] < firstScore {
		t.Errorf("score regressed: was %v, now %v (res2.Score=%d)", firstScore, state2.Scores[1][1], res2.Score)
	}
}

func TestOnBattleEnd_Loss(t *testing.T) {
	char := &domainchar.Character{ID: 1, StarPnt: 0}
	charRepo := newFakeCharRepo(char)
	featureRepo := newFakeFeatureRepo()
	svc := newTestService(charRepo, featureRepo, fixedTime(2026, 5, 11))

	res, err := svc.OnBattleEnd(context.Background(), 1, 1, 1, 0, 0, false)
	if err != nil {
		t.Fatalf("OnBattleEnd: %v", err)
	}
	if res.Win {
		t.Error("expected Win=false")
	}
	if charRepo.chars[1].StarPnt != 0 {
		t.Errorf("starPnt should not change on loss, got %d", charRepo.chars[1].StarPnt)
	}
}

func TestStarPntForLevel(t *testing.T) {
	cases := [][2]int{{1, 10}, {6, 60}, {12, 120}}
	for _, c := range cases {
		if got := StarPntForLevel(c[0]); got != c[1] {
			t.Errorf("StarPntForLevel(%d): got %d, want %d", c[0], got, c[1])
		}
	}
}

func TestComputeScore(t *testing.T) {
	if s := ComputeScore(0, 0); s != 100 {
		t.Errorf("0 deaths 0s: got %d, want 100", s)
	}
	if s := ComputeScore(5, 0); s != 0 {
		t.Errorf("5 deaths: got %d, want 0", s)
	}
	if s := ComputeScore(0, 300); s < 0 {
		t.Errorf("large elapsed: got %d, should be >= 0", s)
	}
	s := ComputeScore(1, 30)
	expected := 100 - 20 - 10
	if s != expected {
		t.Errorf("1 death 30s: got %d, want %d", s, expected)
	}
}
