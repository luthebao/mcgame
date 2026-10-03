// Open-sourced by BaoLT

package star

import (
	"context"
	"encoding/json"
	"testing"
	"time"

	"github.com/google/uuid"
	"go.uber.org/zap"

	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
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

func newFakeCharRepo(c *domainchar.Character) *fakeCharRepo {
	return &fakeCharRepo{chars: map[int64]*domainchar.Character{c.ID: c}}
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
func (r *fakeCharRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error { return nil }

func loadStarManager(t *testing.T, rows []map[string]interface{}) *gamedata.Manager {
	t.Helper()
	manager := gamedata.NewManager(nil, zap.NewNop())
	payloads := make([]json.RawMessage, 0, len(rows))
	for _, row := range rows {
		raw, err := json.Marshal(row)
		if err != nil {
			t.Fatalf("marshal: %v", err)
		}
		payloads = append(payloads, raw)
	}
	if err := manager.GetCache().LoadTable(models.TableStarsTemplate, payloads); err != nil {
		t.Fatalf("LoadTable: %v", err)
	}
	return manager
}

func TestStarBeginFinishLifecycle(t *testing.T) {
	now := time.Date(2026, 5, 5, 12, 0, 0, 0, time.UTC)
	tplLevel1 := map[string]interface{}{
		"id": 1, "type": 1, "level": 1, "add_prop": "hp", "add_value": 1000,
		"req_level": 80, "req_money": 300, "req_seconds": 30, "req_star_level": 0,
	}
	mgr := loadStarManager(t, []map[string]interface{}{tplLevel1})
	char := &domainchar.Character{ID: 42, Level: 80, Gold: 1000}
	repo := newFakeFeatureRepo()
	charRepo := newFakeCharRepo(char)

	svc := NewService(repo, charRepo, mgr, zap.NewNop())
	svc.now = func() time.Time { return now }

	state, err := svc.Begin(context.Background(), 42, 1)
	if err != nil {
		t.Fatalf("Begin: %v", err)
	}
	slot := state[1]
	if slot == nil || slot.Tid != 1 || slot.Level != 0 {
		t.Fatalf("unexpected slot after Begin: %+v", slot)
	}
	wantFinish := now.Add(30 * time.Second).UnixMilli()
	if slot.FinishDate != wantFinish {
		t.Fatalf("FinishDate = %d, want %d", slot.FinishDate, wantFinish)
	}
	if char.Gold != 700 {
		t.Fatalf("Gold = %d, want 700", char.Gold)
	}

	if _, err := svc.Finish(context.Background(), 42, 1); err == nil {
		t.Fatal("Finish should fail before timer elapses")
	}

	svc.now = func() time.Time { return now.Add(31 * time.Second) }
	state, err = svc.Finish(context.Background(), 42, 1)
	if err != nil {
		t.Fatalf("Finish: %v", err)
	}
	slot = state[1]
	if slot.Level != 1 || slot.FinishDate != 0 {
		t.Fatalf("unexpected slot after Finish: %+v", slot)
	}
}

func TestStarBeginRejectsConcurrentUpgrade(t *testing.T) {
	now := time.Date(2026, 5, 5, 12, 0, 0, 0, time.UTC)
	rows := []map[string]interface{}{
		{"id": 1, "type": 1, "level": 1, "req_level": 1, "req_money": 0, "req_seconds": 30, "req_star_level": 0},
		{"id": 13, "type": 2, "level": 1, "req_level": 1, "req_money": 0, "req_seconds": 30, "req_star_level": 0},
	}
	mgr := loadStarManager(t, rows)
	char := &domainchar.Character{ID: 42, Level: 80, Gold: 1000}
	svc := NewService(newFakeFeatureRepo(), newFakeCharRepo(char), mgr, zap.NewNop())
	svc.now = func() time.Time { return now }

	if _, err := svc.Begin(context.Background(), 42, 1); err != nil {
		t.Fatalf("Begin type 1: %v", err)
	}
	if _, err := svc.Begin(context.Background(), 42, 13); err == nil {
		t.Fatal("Begin type 2 while type 1 in progress should fail")
	}
}

func TestStarBeginRejectsLevelMismatch(t *testing.T) {
	mgr := loadStarManager(t, []map[string]interface{}{
		{"id": 5, "type": 1, "level": 5, "req_level": 1, "req_money": 0, "req_seconds": 30, "req_star_level": 0},
	})
	char := &domainchar.Character{ID: 42, Level: 80, Gold: 1000}
	svc := NewService(newFakeFeatureRepo(), newFakeCharRepo(char), mgr, zap.NewNop())

	if _, err := svc.Begin(context.Background(), 42, 5); err == nil {
		t.Fatal("Begin to level 5 from current level 0 should fail")
	}
}

func TestStarCancelClearsInProgress(t *testing.T) {
	now := time.Date(2026, 5, 5, 12, 0, 0, 0, time.UTC)
	mgr := loadStarManager(t, []map[string]interface{}{
		{"id": 1, "type": 1, "level": 1, "req_level": 1, "req_money": 0, "req_seconds": 30, "req_star_level": 0},
	})
	char := &domainchar.Character{ID: 42, Level: 80, Gold: 1000}
	svc := NewService(newFakeFeatureRepo(), newFakeCharRepo(char), mgr, zap.NewNop())
	svc.now = func() time.Time { return now }

	if _, err := svc.Begin(context.Background(), 42, 1); err != nil {
		t.Fatalf("Begin: %v", err)
	}
	state, err := svc.Cancel(context.Background(), 42, 1)
	if err != nil {
		t.Fatalf("Cancel: %v", err)
	}
	if state[1].FinishDate != 0 {
		t.Fatal("Cancel did not clear FinishDate")
	}
	if state[1].Level != 0 {
		t.Fatal("Cancel should not change level")
	}
}
