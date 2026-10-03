// Open-sourced by BaoLT

package heiyaoshi

import (
	"context"
	"errors"
	"os"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"

	"go.uber.org/zap"
)

func TestMain(m *testing.M) {
	blob, err := os.ReadFile("testdata/heiyaoshi_config.json")
	if err != nil {
		panic("heiyaoshi test: read testdata: " + err.Error())
	}
	if err := InitFromConfigBlob(blob); err != nil {
		panic("heiyaoshi test: init config: " + err.Error())
	}
	os.Exit(m.Run())
}

type fakeRepo struct {
	state map[string]any
}

func (f *fakeRepo) GetCharacterProgression(_ context.Context, _ int64) (*domainfeature.CharacterProgression, error) {
	return nil, nil
}

func (f *fakeRepo) ListCharacterFeatureStates(_ context.Context, _ int64) ([]*domainfeature.CharacterFeatureState, error) {
	if f.state == nil {
		return nil, nil
	}
	return []*domainfeature.CharacterFeatureState{
		{FeatureKey: domainfeature.FeatureHeiyaoshi, State: f.state},
	}, nil
}

func (f *fakeRepo) UpsertCharacterSoulProgression(_ context.Context, _ int64, _ int, _ int64) error {
	return nil
}

func (f *fakeRepo) UpsertCharacterFeatureState(_ context.Context, st *domainfeature.CharacterFeatureState) error {
	f.state = st.State
	return nil
}

func (f *fakeRepo) ListPetFeatureStates(_ context.Context, _ int64) ([]*domainfeature.PetFeatureState, error) {
	return nil, nil
}

func (f *fakeRepo) UpsertPetFeatureState(_ context.Context, _ *domainfeature.PetFeatureState) error {
	return nil
}

func (f *fakeRepo) GetActiveMount(_ context.Context, _ int64) (*domainfeature.ActiveMount, error) {
	return nil, nil
}

func (f *fakeRepo) PPVEChallengeNextFloor(_ context.Context, _ int64, _ int, _ int, _ string) (*domainfeature.PPVEChallengeResult, error) {
	return nil, nil
}

type fakeChar struct {
	chars map[int64]*domainchar.Character
}

func newFakeChar(chars ...*domainchar.Character) *fakeChar {
	m := make(map[int64]*domainchar.Character, len(chars))
	for _, c := range chars {
		m[c.ID] = c
	}
	return &fakeChar{chars: m}
}

func (f *fakeChar) GetByID(_ context.Context, id int64) (*domainchar.Character, error) {
	c, ok := f.chars[id]
	if !ok {
		return nil, errors.New("not found")
	}
	return c, nil
}

func (f *fakeChar) Save(_ context.Context, _ *domainchar.Character) error {
	return nil
}

func newSvc(char *domainchar.Character) (*Service, *fakeRepo) {
	repo := &fakeRepo{}
	return NewService(repo, newFakeChar(char), zap.NewNop()), repo
}

func TestLoadPanel_DefaultsLastActFigureToMinFigure(t *testing.T) {
	svc, _ := newSvc(&domainchar.Character{ID: 1})
	panel, err := svc.LoadPanel(context.Background(), 1)
	if err != nil {
		t.Fatalf("LoadPanel: %v", err)
	}
	if panel.State.LastActFigure != MinFigure {
		t.Fatalf("expected LastActFigure=%d, got %d", MinFigure, panel.State.LastActFigure)
	}
	if len(panel.TriangleFigure) == 0 {
		t.Fatalf("expected TRIANGLE_FIGURE in panel data")
	}
}

func TestActivatePoint_RejectsInvalidFigure(t *testing.T) {
	svc, _ := newSvc(&domainchar.Character{ID: 1, HeiyaoshiPoint: 1000})
	if _, err := svc.ActivatePoint(context.Background(), 1, 0, 1, false); !errors.Is(err, ErrInvalidFigure) {
		t.Fatalf("expected ErrInvalidFigure for figure 0, got %v", err)
	}
	if _, err := svc.ActivatePoint(context.Background(), 1, 21, 1, false); !errors.Is(err, ErrInvalidFigure) {
		t.Fatalf("expected ErrInvalidFigure for figure 21, got %v", err)
	}
}

func TestActivatePoint_RejectsFigureMismatch(t *testing.T) {
	svc, _ := newSvc(&domainchar.Character{ID: 1, HeiyaoshiPoint: 1000})
	if _, err := svc.ActivatePoint(context.Background(), 1, 2, 1, false); !errors.Is(err, ErrFigureMismatch) {
		t.Fatalf("expected ErrFigureMismatch when LastActFigure=1 and request=2, got %v", err)
	}
}

func TestActivatePoint_RejectsInvalidPoint(t *testing.T) {
	svc, _ := newSvc(&domainchar.Character{ID: 1, HeiyaoshiPoint: 1000})
	if _, err := svc.ActivatePoint(context.Background(), 1, 1, 9999, false); !errors.Is(err, ErrInvalidPoint) {
		t.Fatalf("expected ErrInvalidPoint, got %v", err)
	}
}

func TestActivatePoint_StarterPointAutoSeeded(t *testing.T) {
	char := &domainchar.Character{ID: 1, HeiyaoshiPoint: 1000}
	svc, _ := newSvc(char)
	if _, err := svc.ActivatePoint(context.Background(), 1, 1, 1, false); !errors.Is(err, ErrPointAlreadyActive) {
		t.Fatalf("expected ErrPointAlreadyActive for auto-seeded starter, got %v", err)
	}
}

func TestActivatePoint_PaidPointDeducts(t *testing.T) {
	char := &domainchar.Character{ID: 1, HeiyaoshiPoint: 100}
	svc, _ := newSvc(char)
	res, err := svc.ActivatePoint(context.Background(), 1, 1, 2, false)
	if err != nil {
		t.Fatalf("paid point: %v", err)
	}
	if char.HeiyaoshiPoint != 0 {
		t.Fatalf("expected wallet=0 after spending 100, got %d", char.HeiyaoshiPoint)
	}
	if len(res.WalletDeltas) != 1 || res.WalletDeltas[0].NewTotal != 0 {
		t.Fatalf("unexpected wallet deltas %+v", res.WalletDeltas)
	}
}

func TestActivatePoint_RejectsInsufficient(t *testing.T) {
	char := &domainchar.Character{ID: 1, HeiyaoshiPoint: 50}
	svc, _ := newSvc(char)
	if _, err := svc.ActivatePoint(context.Background(), 1, 1, 2, false); !errors.Is(err, ErrInsufficientStone) {
		t.Fatalf("expected ErrInsufficientStone, got %v", err)
	}
	if char.HeiyaoshiPoint != 50 {
		t.Fatalf("expected wallet unchanged after rejection, got %d", char.HeiyaoshiPoint)
	}
}

func TestActivatePoint_RejectsAlreadyActive(t *testing.T) {
	char := &domainchar.Character{ID: 1, HeiyaoshiPoint: 1000}
	svc, _ := newSvc(char)
	if _, err := svc.ActivatePoint(context.Background(), 1, 1, 2, false); err != nil {
		t.Fatalf("first: %v", err)
	}
	if _, err := svc.ActivatePoint(context.Background(), 1, 1, 2, false); !errors.Is(err, ErrPointAlreadyActive) {
		t.Fatalf("expected ErrPointAlreadyActive, got %v", err)
	}
}

func TestActivatePoint_AreaCompletionAdvancesFigure(t *testing.T) {
	char := &domainchar.Character{ID: 1, HeiyaoshiPoint: 1000}
	svc, _ := newSvc(char)
	for _, p := range []int{2, 3} {
		if _, err := svc.ActivatePoint(context.Background(), 1, 1, p, false); err != nil {
			t.Fatalf("activate point %d: %v", p, err)
		}
	}
	res, err := svc.ActivatePoint(context.Background(), 1, 1, 4, false)
	if err != nil {
		t.Fatalf("activate point 4: %v", err)
	}
	if !res.FigureCompleted {
		t.Fatalf("figure 1 should complete after points 2,3,4 (auto-starter 1 closes area 1; 4 closes area 2)")
	}
	if res.State.LastActFigure != 2 {
		t.Fatalf("expected LastActFigure to advance to 2, got %d", res.State.LastActFigure)
	}
	if len(res.State.Buff) == 0 {
		t.Fatalf("expected buff totals after figure completion")
	}
	if !res.State.HasPoint(1) {
		t.Fatalf("expected starter of figure 2 auto-seeded after advance")
	}
}

func TestReset_RequiresGM(t *testing.T) {
	requester := &domainchar.Character{ID: 10, GMLevel: 0}
	target := &domainchar.Character{ID: 11}
	svc := NewService(&fakeRepo{}, newFakeChar(requester, target), zap.NewNop())
	if _, err := svc.Reset(context.Background(), 10, 11); !errors.Is(err, ErrPermissionDenied) {
		t.Fatalf("expected ErrPermissionDenied, got %v", err)
	}
}

func TestReset_GMClearsState(t *testing.T) {
	requester := &domainchar.Character{ID: 10, GMLevel: 9}
	target := &domainchar.Character{ID: 11}
	repo := &fakeRepo{state: map[string]any{
		"lastActFigure": 5,
		"actPoint":      map[string]any{"1": []any{1, 2, 3}},
		"Buff":          map[string]any{"1": 300},
	}}
	svc := NewService(repo, newFakeChar(requester, target), zap.NewNop())
	panel, err := svc.Reset(context.Background(), 10, 11)
	if err != nil {
		t.Fatalf("Reset: %v", err)
	}
	if panel.State.LastActFigure != MinFigure {
		t.Fatalf("expected LastActFigure reset, got %d", panel.State.LastActFigure)
	}
	if len(panel.State.Buff) != 0 {
		t.Fatalf("expected Buff cleared, got %v", panel.State.Buff)
	}
}

func TestStatePartiallyEncoded_RoundTrip(t *testing.T) {
	state := NewState()
	state.LastActFigure = 3
	state.AddPoint(1)
	state.AddPoint(2)
	state.MarkArea(1)
	state.MarkLine(5)
	state.Buff[1] = 600
	state.Buff[13] = 0.32

	encoded := state.Encode()
	decoded := DecodeState(encoded)

	if decoded.LastActFigure != 3 {
		t.Fatalf("LastActFigure round-trip failed: %d", decoded.LastActFigure)
	}
	if !decoded.HasPoint(1) || !decoded.HasPoint(2) {
		t.Fatalf("ActPoint round-trip failed: %+v", decoded.ActPoint)
	}
	if !decoded.HasArea(1) {
		t.Fatalf("ActArea round-trip failed")
	}
	if !decoded.HasLine(5) {
		t.Fatalf("ActLine round-trip failed")
	}
	if decoded.Buff[1] != 600 || decoded.Buff[13] != 0.32 {
		t.Fatalf("Buff round-trip failed: %+v", decoded.Buff)
	}
}

func TestActivatePoint_FigureCompleteResetsCurrentFigureState(t *testing.T) {
	char := &domainchar.Character{ID: 1, HeiyaoshiPoint: 1000}
	svc, _ := newSvc(char)
	for _, p := range []int{2, 3} {
		if _, err := svc.ActivatePoint(context.Background(), 1, 1, p, false); err != nil {
			t.Fatalf("activate point %d: %v", p, err)
		}
	}
	res, err := svc.ActivatePoint(context.Background(), 1, 1, 4, false)
	if err != nil {
		t.Fatalf("activate final point: %v", err)
	}
	if !res.FigureCompleted {
		t.Fatalf("expected figure complete after auto-seeded 1 + points 2,3,4")
	}
	if len(res.State.ActPoint) != 1 || res.State.ActPoint[0] != 1 {
		t.Fatalf("expected ActPoint=[1] (starter of next figure), got %v", res.State.ActPoint)
	}
	if len(res.State.ActArea) != 0 {
		t.Fatalf("expected ActArea cleared after figure advance, got %v", res.State.ActArea)
	}
	if len(res.State.ActLine) != 0 {
		t.Fatalf("expected ActLine cleared after figure advance, got %v", res.State.ActLine)
	}
	if res.State.LastActFigure != 2 {
		t.Fatalf("expected LastActFigure=2, got %d", res.State.LastActFigure)
	}
}

func TestLoadPanel_RepairsLegacyZeroLastActFigure(t *testing.T) {
	repo := &fakeRepo{state: map[string]any{
		"lastActFigure": 0,
		"actPoint":      []any{2, 3, 4},
		"actArea":       map[string]any{"2": 1},
		"actLine":       map[string]any{"3": 1, "4": 1, "5": 1},
		"AreaNum":       1,
		"LineNum":       3,
		"Buff":          map[string]any{},
	}}
	char := &domainchar.Character{ID: 1}
	svc := NewService(repo, newFakeChar(char), zap.NewNop())
	panel, err := svc.LoadPanel(context.Background(), 1)
	if err != nil {
		t.Fatalf("LoadPanel: %v", err)
	}
	if panel.State.LastActFigure != 2 {
		t.Fatalf("expected reconcile to advance to figure 2, got %d", panel.State.LastActFigure)
	}
	if len(panel.State.Buff) == 0 {
		t.Fatalf("expected Buff repaired with ALL_HEIYAOSHI[1] bonuses, got empty")
	}
	if !panel.State.HasPoint(1) {
		t.Fatalf("expected starter of figure 2 seeded after advance")
	}
	if repo.state == nil {
		t.Fatalf("expected repo to be repaired and persisted")
	}
	persistedFigure, _ := intFromAny(repo.state["lastActFigure"])
	if persistedFigure != 2 {
		t.Fatalf("expected persisted lastActFigure=2, got %v", repo.state["lastActFigure"])
	}
	if persistedBuff, ok := repo.state["Buff"].(map[string]any); !ok || len(persistedBuff) == 0 {
		t.Fatalf("expected persisted Buff non-empty, got %v", repo.state["Buff"])
	}
}

func TestLoadPanel_FreshStateSeedsStarterAndPersists(t *testing.T) {
	char := &domainchar.Character{ID: 1}
	svc, repo := newSvc(char)
	panel, err := svc.LoadPanel(context.Background(), 1)
	if err != nil {
		t.Fatalf("LoadPanel: %v", err)
	}
	if panel.State.LastActFigure != MinFigure {
		t.Fatalf("expected LastActFigure=%d, got %d", MinFigure, panel.State.LastActFigure)
	}
	if !panel.State.HasPoint(1) {
		t.Fatalf("expected starter point 1 seeded for fresh figure 1")
	}
	if repo.state == nil {
		t.Fatalf("expected fresh state persisted (starter seed counts as repair)")
	}
}

func TestActivatePoint_RejectsNonAdjacent(t *testing.T) {
	char := &domainchar.Character{ID: 1, HeiyaoshiPoint: 1000}
	svc, _ := newSvc(char)
	if _, err := svc.ActivatePoint(context.Background(), 1, 1, 4, false); !errors.Is(err, ErrPointNotAdjacent) {
		t.Fatalf("expected ErrPointNotAdjacent for figure 1 point 4 (around=[2,3]) with only auto-seeded point 1, got %v", err)
	}
	if char.HeiyaoshiPoint != 1000 {
		t.Fatalf("expected wallet unchanged after adjacency rejection, got %d", char.HeiyaoshiPoint)
	}
}

func TestActivatePoint_AllowsAdjacentAfterPrior(t *testing.T) {
	char := &domainchar.Character{ID: 1, HeiyaoshiPoint: 1000}
	svc, _ := newSvc(char)
	if _, err := svc.ActivatePoint(context.Background(), 1, 1, 2, false); err != nil {
		t.Fatalf("activate point 2 (adjacent to starter 1): %v", err)
	}
	if _, err := svc.ActivatePoint(context.Background(), 1, 1, 4, false); err != nil {
		t.Fatalf("activate point 4 (now adjacent via 2): %v", err)
	}
}

func TestActivatePoint_PartialFigureAddsAreaAttributes(t *testing.T) {
	char := &domainchar.Character{ID: 1, HeiyaoshiPoint: 1000}
	svc, _ := newSvc(char)
	res, err := svc.ActivatePoint(context.Background(), 1, 1, 2, false)
	if err != nil {
		t.Fatalf("activate point 2: %v", err)
	}
	if res.FigureCompleted {
		t.Fatalf("expected figure not yet complete after one point")
	}
	if len(res.NewAreas) == 0 {
		return
	}
	areaID := res.NewAreas[0].AreaID
	area, ok := AreaAttributes(1, areaID)
	if !ok {
		t.Fatalf("AreaAttributes(1, %d) not found", areaID)
	}
	for propID, want := range area.Attribute {
		if got := res.State.Buff[propID]; got != want {
			t.Fatalf("Buff[%d] = %v, want %v (area attribute)", propID, got, want)
		}
	}
}

func TestActivatePoint_FigureCompleteAppliesExactFullFigureBuff(t *testing.T) {
	char := &domainchar.Character{ID: 1, HeiyaoshiPoint: 1000}
	svc, _ := newSvc(char)
	for _, p := range []int{2, 3} {
		if _, err := svc.ActivatePoint(context.Background(), 1, 1, p, false); err != nil {
			t.Fatalf("activate point %d: %v", p, err)
		}
	}
	res, err := svc.ActivatePoint(context.Background(), 1, 1, 4, false)
	if err != nil {
		t.Fatalf("activate final point: %v", err)
	}
	if !res.FigureCompleted {
		t.Fatalf("expected figure complete")
	}
	want := make(map[int]float64)
	for _, area := range AreasInFigure(1) {
		for propID, v := range area.Attribute {
			want[propID] += v
		}
	}
	for propID, v := range FullFigureBuffs(1) {
		want[propID] += v
	}
	if !buffsEqual(res.State.Buff, want) {
		t.Fatalf("Buff mismatch after figure 1 complete: got=%v want=%v", res.State.Buff, want)
	}
}

func TestComputeBuffs_AccumulatesAcrossMultipleCompletedFigures(t *testing.T) {
	state := NewState()
	state.LastActFigure = 3
	got := computeBuffs(state, 3)
	want := make(map[int]float64)
	for _, fig := range []int{1, 2} {
		for _, area := range AreasInFigure(fig) {
			for propID, v := range area.Attribute {
				want[propID] += v
			}
		}
		for propID, v := range FullFigureBuffs(fig) {
			want[propID] += v
		}
	}
	if !buffsEqual(got, want) {
		t.Fatalf("multi-figure accumulation mismatch: got=%v want=%v", got, want)
	}
}

func TestComputeBuffs_AddsActAreaAttributes(t *testing.T) {
	state := NewState()
	state.LastActFigure = 1
	state.ActArea = map[int]bool{1: true}
	got := computeBuffs(state, 1)
	area, ok := AreaAttributes(1, 1)
	if !ok {
		t.Skip("area 1 of figure 1 not in config, skipping")
	}
	for propID, want := range area.Attribute {
		if got[propID] != want {
			t.Fatalf("Buff[%d] = %v, want %v from area attribute", propID, got[propID], want)
		}
	}
	for propID := range got {
		if _, ok := area.Attribute[propID]; !ok {
			t.Fatalf("unexpected propID %d in Buff (not from area 1 attribute)", propID)
		}
	}
}

func TestComputeBuffs_MixesCompletedFigureAndCurrentFigureAreas(t *testing.T) {
	state := NewState()
	state.LastActFigure = 2
	state.ActArea = map[int]bool{1: true}
	got := computeBuffs(state, 2)

	want := make(map[int]float64)
	for _, area := range AreasInFigure(1) {
		for propID, v := range area.Attribute {
			want[propID] += v
		}
	}
	for propID, v := range FullFigureBuffs(1) {
		want[propID] += v
	}
	area2, ok := AreaAttributes(2, 1)
	if !ok {
		t.Skip("area 1 of figure 2 not in config, skipping")
	}
	for propID, v := range area2.Attribute {
		want[propID] += v
	}
	if !buffsEqual(got, want) {
		t.Fatalf("mixed buff mismatch: got=%v want=%v", got, want)
	}
}

func TestStage2Multiplier(t *testing.T) {
	cases := []struct {
		propID int
		want   float64
	}{
		{1, 2.0},
		{4, 1.0}, {5, 1.0}, {6, 1.0}, {7, 1.0}, {11, 1.0}, {14, 1.0}, {61, 1.0},
		{13, 1.5}, {31, 1.5}, {59, 1.5}, {60, 1.5}, {62, 1.5}, {63, 1.5},
		{34, 0.5},
		{99, 1.0},
	}
	for _, tc := range cases {
		if got := stage2Multiplier(tc.propID); got != tc.want {
			t.Errorf("stage2Multiplier(%d) = %v, want %v", tc.propID, got, tc.want)
		}
	}
}

func TestComputeBuffs_AllStagesComplete(t *testing.T) {
	state := NewState()
	state.LastActFigure = MaxFigure + 1
	got := computeBuffs(state, MaxFigure+1)

	want := map[int]float64{
		1:  180000,
		4:  30000,
		5:  24080,
		6:  96000,
		7:  96000,
		11: 12000,
		13: 30,
		14: 10,
		31: 30,
		34: 18,
		61: 10,
		59: 0.25, 60: 0.25, 62: 0.25, 63: 0.25,
	}
	const eps = 1e-9
	for propID, wantVal := range want {
		gotVal := got[propID]
		diff := gotVal - wantVal
		if diff < -eps || diff > eps {
			t.Errorf("prop %d: got %v, want %v (diff %v)", propID, gotVal, wantVal, diff)
		}
	}
	for propID := range got {
		if _, ok := want[propID]; !ok {
			t.Errorf("unexpected prop %d in result: %v", propID, got[propID])
		}
	}
}

func TestComputeBuffs_Stage2CompletedFigureContribution(t *testing.T) {
	// LastActFigure=12 means figs 1..11 are complete, 12 is in progress (no ActArea).
	// Completed loop iterates fig 1..11:
	//   figs 1..10: stage 1 (sourceFig = fig, scaled = false)
	//   fig 11:     stage 2 (sourceFig = 1, scaled = true)
	state := NewState()
	state.LastActFigure = 12
	got := computeBuffs(state, 12)

	want := make(map[int]float64)
	for fig := 1; fig <= 10; fig++ {
		for _, area := range AreasInFigure(fig) {
			for propID, v := range area.Attribute {
				want[propID] += v
			}
		}
		for propID, v := range FullFigureBuffs(fig) {
			want[propID] += v
		}
	}
	for _, area := range AreasInFigure(1) {
		for propID, v := range area.Attribute {
			want[propID] += v * stage2Multiplier(propID)
		}
	}
	for propID, v := range FullFigureBuffs(1) {
		want[propID] += v * stage2Multiplier(propID)
	}

	if !buffsEqual(got, want) {
		t.Fatalf("stage2 partial mismatch:\ngot =%v\nwant=%v", got, want)
	}

	// HP spot check: P1_HP(60000) + (tri[1].HP+ALL_H[1].HP)*2.0 = 60000 + 600*2 = 61200
	wantHP := 61200.0
	if got[1] != wantHP {
		t.Fatalf("HP after fig 11 complete: got %v, want %v", got[1], wantHP)
	}
}

func TestLoadPanel_AlreadyConsistentNoWrite(t *testing.T) {
	char := &domainchar.Character{ID: 1}
	state := NewState()
	state.LastActFigure = MinFigure
	seedStarters(state, state.LastActFigure)
	repo := &fakeRepo{state: state.Encode()}
	svc := NewService(repo, newFakeChar(char), zap.NewNop())

	repo.state["__sentinel"] = "untouched"
	if _, err := svc.LoadPanel(context.Background(), 1); err != nil {
		t.Fatalf("LoadPanel: %v", err)
	}
	if _, ok := repo.state["__sentinel"]; !ok {
		t.Fatalf("expected no rewrite on already-consistent state")
	}
}
