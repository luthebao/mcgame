// Open-sourced by BaoLT

package awaken

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
	prog       *domainfeature.CharacterProgression
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
func (r *fakeFeatureRepo) GetCharacterProgression(ctx context.Context, charID int64) (*domainfeature.CharacterProgression, error) {
	return r.prog, nil
}
func (r *fakeFeatureRepo) ListPetFeatureStates(ctx context.Context, petID int64) ([]*domainfeature.PetFeatureState, error) {
	return nil, nil
}
func (r *fakeFeatureRepo) UpsertPetFeatureState(ctx context.Context, state *domainfeature.PetFeatureState) error {
	return nil
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

func newTestService(t *testing.T, prog *domainfeature.CharacterProgression) *Service {
	t.Helper()
	mgr := gamedata.NewManager(nil, zap.NewNop())
	rows := []string{
		`{"id":501,"cost_points":2,"max_level":3,"req_points":0,"skill_code_name":"codeA|x"}`,
		`{"id":502,"cost_points":1,"max_level":5,"req_points":5,"skill_code_name":"codeB|y"}`,
	}
	raw := make([]json.RawMessage, 0, len(rows))
	for _, r := range rows {
		raw = append(raw, json.RawMessage(r))
	}
	if err := mgr.GetCache().LoadTable(models.TableAwakeningSkill, raw); err != nil {
		t.Fatalf("LoadTable(TBL_AWAKENING_SKILL): %v", err)
	}
	repo := &fakeFeatureRepo{charStates: map[int64][]*domainfeature.CharacterFeatureState{}, prog: prog}
	return NewService(repo, mgr, zap.NewNop())
}

func TestState_RoundTripThroughJSON(t *testing.T) {
	s := defaultState()
	s.Point = 8
	s.PointUsed = 4
	s.PointDict["codeA"] = 2

	raw, err := json.Marshal(s.toPersist())
	if err != nil {
		t.Fatalf("marshal: %v", err)
	}
	var decoded map[string]interface{}
	if err := json.Unmarshal(raw, &decoded); err != nil {
		t.Fatalf("unmarshal: %v", err)
	}
	got := stateFromMap(decoded)
	if got.Point != 8 || got.PointUsed != 4 || got.PointDict["codeA"] != 2 {
		t.Fatalf("round-trip mismatch: %+v", got)
	}
}

func TestAddPoint_AllocatesAndDeducts(t *testing.T) {
	svc := newTestService(t, nil)
	ctx := context.Background()
	if err := svc.AddAwakenPoints(ctx, 1, 10); err != nil {
		t.Fatalf("seed: %v", err)
	}
	wire, err := svc.AddPoint(ctx, 1, 501)
	if err != nil {
		t.Fatalf("AddPoint: %v", err)
	}
	if wire["awakenPoint"] != 8 || wire["awakenPointUsed"] != 2 {
		t.Fatalf("wire = %+v, want point=8 used=2 (cost 2)", wire)
	}
	dict := wire["awakenDict"].(map[string]interface{})
	if dict["codeA"] != 1 {
		t.Fatalf("dict codeA = %v, want 1", dict["codeA"])
	}
}

func TestAddPoint_InitsFromProgression(t *testing.T) {
	svc := newTestService(t, &domainfeature.CharacterProgression{AwakenPoints: 7})
	ctx := context.Background()
	wire, err := svc.AddPoint(ctx, 1, 501)
	if err != nil {
		t.Fatalf("AddPoint: %v", err)
	}
	if wire["awakenPoint"] != 5 {
		t.Fatalf("awakenPoint = %v, want 5 (7 from progression - 2)", wire["awakenPoint"])
	}
}

func TestAddPoint_InsufficientPoints(t *testing.T) {
	svc := newTestService(t, nil)
	ctx := context.Background()
	_ = svc.AddAwakenPoints(ctx, 1, 1)
	if _, err := svc.AddPoint(ctx, 1, 501); !errors.Is(err, ErrInsufficientPoints) {
		t.Fatalf("want ErrInsufficientPoints, got %v", err)
	}
}

func TestAddPoint_MaxSkillLevel(t *testing.T) {
	svc := newTestService(t, nil)
	ctx := context.Background()
	_ = svc.AddAwakenPoints(ctx, 1, 100)
	for i := 0; i < 3; i++ {
		if _, err := svc.AddPoint(ctx, 1, 501); err != nil {
			t.Fatalf("AddPoint #%d: %v", i, err)
		}
	}
	if _, err := svc.AddPoint(ctx, 1, 501); !errors.Is(err, ErrMaxSkillLevel) {
		t.Fatalf("want ErrMaxSkillLevel after 3 allocations (max_level=3), got %v", err)
	}
}

func TestAddPoint_ReqPointsGate(t *testing.T) {
	svc := newTestService(t, nil)
	ctx := context.Background()
	_ = svc.AddAwakenPoints(ctx, 1, 100)
	if _, err := svc.AddPoint(ctx, 1, 502); !errors.Is(err, ErrReqNotMet) {
		t.Fatalf("skill 502 needs req_points=5 used: want ErrReqNotMet, got %v", err)
	}
}

func TestReducePoint_RefundsAndRemoves(t *testing.T) {
	svc := newTestService(t, nil)
	ctx := context.Background()
	_ = svc.AddAwakenPoints(ctx, 1, 10)
	if _, err := svc.AddPoint(ctx, 1, 501); err != nil {
		t.Fatalf("AddPoint: %v", err)
	}
	wire, err := svc.ReducePoint(ctx, 1, 501)
	if err != nil {
		t.Fatalf("ReducePoint: %v", err)
	}
	if wire["awakenPoint"] != 10 || wire["awakenPointUsed"] != 0 {
		t.Fatalf("after reduce wire = %+v, want point=10 used=0", wire)
	}
	dict := wire["awakenDict"].(map[string]interface{})
	if _, ok := dict["codeA"]; ok {
		t.Fatalf("codeA should be removed at level 0, dict=%+v", dict)
	}
}

func TestReducePoint_NotLearned(t *testing.T) {
	svc := newTestService(t, nil)
	if _, err := svc.ReducePoint(context.Background(), 1, 501); !errors.Is(err, ErrNotLearned) {
		t.Fatalf("want ErrNotLearned, got %v", err)
	}
}

func TestAddPoint_UnknownSkill(t *testing.T) {
	svc := newTestService(t, nil)
	if _, err := svc.AddPoint(context.Background(), 1, 99999); !errors.Is(err, ErrUnknownSkill) {
		t.Fatalf("want ErrUnknownSkill, got %v", err)
	}
}
