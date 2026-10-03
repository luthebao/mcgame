// Open-sourced by BaoLT

package adminhttp

import (
	"context"
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/google/uuid"
	"go.uber.org/zap"

	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/statfeature"
)

type fakeStatFeatureStore struct {
	listResult   []*statfeature.CharacterFeatureState
	listErr      error
	upserted     *statfeature.CharacterFeatureState
	upsertErr    error
	upsertCalled bool
}

func (f *fakeStatFeatureStore) ListCharacterFeatureStates(_ context.Context, _ int64) ([]*statfeature.CharacterFeatureState, error) {
	return f.listResult, f.listErr
}

func (f *fakeStatFeatureStore) UpsertCharacterFeatureState(_ context.Context, state *statfeature.CharacterFeatureState) error {
	f.upsertCalled = true
	if f.upsertErr != nil {
		return f.upsertErr
	}
	snapshot := *state
	f.upserted = &snapshot
	return nil
}

func newFeatureStateChar() *character.Character {
	return character.NewCharacter(uuid.New(), "tester", 1, 0)
}

func TestExecuteGetFeatureStates_FiltersToAllowList(t *testing.T) {
	store := &fakeStatFeatureStore{
		listResult: []*statfeature.CharacterFeatureState{
			{FeatureKey: "monster_heart", State: map[string]interface{}{"level": float64(3)}},
			{FeatureKey: "not_allowed", State: map[string]interface{}{"x": float64(1)}},
			{FeatureKey: "rune", State: nil},
		},
	}
	server := &Server{logger: zap.NewNop(), statFeatureStore: store}
	recorder := httptest.NewRecorder()

	server.executeGetFeatureStates(recorder, context.Background(), newFeatureStateChar())

	if recorder.Code != http.StatusOK {
		t.Fatalf("status = %d, want %d", recorder.Code, http.StatusOK)
	}

	var resp struct {
		OK   bool `json:"ok"`
		Data struct {
			States []featureStateView `json:"states"`
		} `json:"data"`
	}
	if err := json.Unmarshal(recorder.Body.Bytes(), &resp); err != nil {
		t.Fatalf("decode response: %v", err)
	}
	if !resp.OK {
		t.Fatal("response ok = false, want true")
	}
	if len(resp.Data.States) != 2 {
		t.Fatalf("states len = %d, want 2 (allow-listed only)", len(resp.Data.States))
	}
	for _, st := range resp.Data.States {
		if !featureStateAllowList[st.FeatureKey] {
			t.Fatalf("returned non-allow-listed key %q", st.FeatureKey)
		}
		if st.State == nil {
			t.Fatalf("state for %q is nil, want non-nil object", st.FeatureKey)
		}
	}
}

func TestExecuteSetFeatureState_RejectsKeyNotInAllowList(t *testing.T) {
	store := &fakeStatFeatureStore{}
	server := &Server{logger: zap.NewNop(), statFeatureStore: store}
	recorder := httptest.NewRecorder()

	server.executeSetFeatureState(recorder, context.Background(), newFeatureStateChar(),
		json.RawMessage(`{"featureKey":"not_allowed","state":{"a":1}}`))

	if recorder.Code != http.StatusBadRequest {
		t.Fatalf("status = %d, want %d", recorder.Code, http.StatusBadRequest)
	}
	if store.upsertCalled {
		t.Fatal("upsert was called for a rejected feature key")
	}
}

func TestExecuteSetFeatureState_RejectsNonObjectState(t *testing.T) {
	store := &fakeStatFeatureStore{}
	server := &Server{logger: zap.NewNop(), statFeatureStore: store}
	recorder := httptest.NewRecorder()

	server.executeSetFeatureState(recorder, context.Background(), newFeatureStateChar(),
		json.RawMessage(`{"featureKey":"rune","state":[1,2,3]}`))

	if recorder.Code != http.StatusBadRequest {
		t.Fatalf("status = %d, want %d", recorder.Code, http.StatusBadRequest)
	}
	if store.upsertCalled {
		t.Fatal("upsert was called for a non-object state")
	}
}

func TestExecuteSetFeatureState_UpsertsHappyPath(t *testing.T) {
	store := &fakeStatFeatureStore{}
	server := &Server{logger: zap.NewNop(), statFeatureStore: store}
	char := newFeatureStateChar()
	recorder := httptest.NewRecorder()

	server.executeSetFeatureState(recorder, context.Background(), char,
		json.RawMessage(`{"featureKey":"monster_heart","state":{"level":5,"slots":{"1":true}}}`))

	if recorder.Code != http.StatusOK {
		t.Fatalf("status = %d, want %d", recorder.Code, http.StatusOK)
	}
	if store.upserted == nil {
		t.Fatal("expected feature state to be upserted")
	}
	if store.upserted.CharacterID != char.ID {
		t.Fatalf("upserted characterId = %d, want %d", store.upserted.CharacterID, char.ID)
	}
	if store.upserted.FeatureKey != "monster_heart" {
		t.Fatalf("upserted featureKey = %q, want monster_heart", store.upserted.FeatureKey)
	}
	if store.upserted.State["level"] != float64(5) {
		t.Fatalf("upserted state level = %v, want 5", store.upserted.State["level"])
	}

	var resp struct {
		OK           bool   `json:"ok"`
		DeliveryMode string `json:"deliveryMode"`
		Data         struct {
			FeatureKey string                 `json:"featureKey"`
			State      map[string]interface{} `json:"state"`
		} `json:"data"`
	}
	if err := json.Unmarshal(recorder.Body.Bytes(), &resp); err != nil {
		t.Fatalf("decode response: %v", err)
	}
	if !resp.OK {
		t.Fatal("response ok = false, want true")
	}
	if resp.DeliveryMode != "database_only" {
		t.Fatalf("deliveryMode = %q, want database_only", resp.DeliveryMode)
	}
	if resp.Data.FeatureKey != "monster_heart" {
		t.Fatalf("data.featureKey = %q, want monster_heart", resp.Data.FeatureKey)
	}
}
