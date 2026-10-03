// Open-sourced by BaoLT

package mount

import (
	"context"
	"encoding/json"
	"testing"

	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

func loadTable(t *testing.T, mgr *gamedata.Manager, table string, rows []string) {
	t.Helper()
	raw := make([]json.RawMessage, 0, len(rows))
	for _, r := range rows {
		raw = append(raw, json.RawMessage(r))
	}
	if err := mgr.GetCache().LoadTable(table, raw); err != nil {
		t.Fatalf("LoadTable(%s) error = %v", table, err)
	}
}

type fakeFeatureRepo struct {
	states map[int64]map[string]*domainfeature.CharacterFeatureState
}

func newFakeFeatureRepo() *fakeFeatureRepo {
	return &fakeFeatureRepo{states: map[int64]map[string]*domainfeature.CharacterFeatureState{}}
}

func (f *fakeFeatureRepo) ListCharacterFeatureStates(_ context.Context, charID int64) ([]*domainfeature.CharacterFeatureState, error) {
	out := []*domainfeature.CharacterFeatureState{}
	for _, st := range f.states[charID] {
		out = append(out, st)
	}
	return out, nil
}

func (f *fakeFeatureRepo) UpsertCharacterFeatureState(_ context.Context, state *domainfeature.CharacterFeatureState) error {
	if f.states[state.CharacterID] == nil {
		f.states[state.CharacterID] = map[string]*domainfeature.CharacterFeatureState{}
	}
	f.states[state.CharacterID][state.FeatureKey] = state
	return nil
}

func (f *fakeFeatureRepo) GetCharacterProgression(context.Context, int64) (*domainfeature.CharacterProgression, error) {
	return nil, nil
}
func (f *fakeFeatureRepo) UpsertCharacterSoulProgression(context.Context, int64, int, int64) error {
	return nil
}
func (f *fakeFeatureRepo) ListPetFeatureStates(context.Context, int64) ([]*domainfeature.PetFeatureState, error) {
	return nil, nil
}
func (f *fakeFeatureRepo) UpsertPetFeatureState(context.Context, *domainfeature.PetFeatureState) error {
	return nil
}
func (f *fakeFeatureRepo) GetActiveMount(context.Context, int64) (*domainfeature.ActiveMount, error) {
	return nil, nil
}
func (f *fakeFeatureRepo) PPVEChallengeNextFloor(context.Context, int64, int, int, string) (*domainfeature.PPVEChallengeResult, error) {
	return nil, nil
}

func newDressTestService(t *testing.T) (*Service, *fakeFeatureRepo) {
	t.Helper()
	mgr := gamedata.NewManager(nil, zap.NewNop())

	mountRows := []string{
		`{"id":21,"level":0,"dress_id":1,"mount_lev_limit":5,"item_num":2,"exp":50,"add_rate":4,"type":2}`,
		`{"id":22,"level":1,"dress_id":1,"mount_lev_limit":9,"item_num":5,"exp":40,"add_rate":3,"type":2}`,
		`{"id":23,"level":2,"dress_id":2,"mount_lev_limit":13,"item_num":8,"exp":30,"add_rate":2,"type":2}`,
	}
	loadTable(t, mgr, models.TableMount, mountRows)

	dressRows := []string{
		`{"id":1,"type":1,"name":"Bach Ho","gold":0,"effective_time":0,"res_code":2050080010005}`,
		`{"id":2,"type":1,"name":"U Linh Ho","gold":0,"effective_time":0,"res_code":2050080010004}`,
		`{"id":20,"type":1,"name":"Burin","gold":588,"effective_time":720,"res_code":2050080010021}`,
	}
	loadTable(t, mgr, models.TableMountDress, dressRows)

	repo := newFakeFeatureRepo()
	svc := NewService(repo, nil, mgr, zap.NewNop())
	return svc, repo
}

func TestDressResCode(t *testing.T) {
	svc, _ := newDressTestService(t)
	if got := svc.DressResCode(1); got != 2050080010005 {
		t.Fatalf("DressResCode(1) = %d, want 2050080010005", got)
	}
	if got := svc.DressResCode(999); got != 0 {
		t.Fatalf("DressResCode(unknown) = %d, want 0", got)
	}
}

func TestIsOwnedDress_RoutingPredicate(t *testing.T) {
	svc, repo := newDressTestService(t)
	ctx := context.Background()
	const charID = int64(7)

	// Fresh char (upLv=0) owns the type=2 level-0 dress (dress_id=1) and nothing else.
	owned, err := svc.IsOwnedDress(ctx, charID, 1)
	if err != nil || !owned {
		t.Fatalf("IsOwnedDress(1) = %v,%v want true,nil", owned, err)
	}
	if owned, _ := svc.IsOwnedDress(ctx, charID, 2); owned {
		t.Fatalf("IsOwnedDress(2) = true, want false (upLv 0 does not unlock dress 2)")
	}

	// Out-of-range ids (pet instance id space) must report not-owned WITHOUT
	// persisting anything, so the parent falls through to pet-riding.
	for _, id := range []int{0, 21, 5000001} {
		if owned, _ := svc.IsOwnedDress(ctx, charID, id); owned {
			t.Fatalf("IsOwnedDress(%d) = true, want false (outside dress id space)", id)
		}
	}
	if _, exists := repo.states[charID]; exists {
		t.Fatalf("IsOwnedDress must not write feature state")
	}

	// A granted timed dress becomes owned.
	if err := svc.GrantDress(ctx, charID, 20, 0); err != nil {
		t.Fatalf("GrantDress error = %v", err)
	}
	if owned, _ := svc.IsOwnedDress(ctx, charID, 20); !owned {
		t.Fatalf("IsOwnedDress(20) = false after grant, want true")
	}
}

func TestBeginStopMountDress(t *testing.T) {
	svc, _ := newDressTestService(t)
	ctx := context.Background()
	const charID = int64(11)

	// Not owned -> (0, false) and no state change so the caller can fall through.
	resCode, ok, err := svc.BeginMountDress(ctx, charID, 2)
	if err != nil || ok || resCode != 0 {
		t.Fatalf("BeginMountDress(unowned) = %d,%v,%v want 0,false,nil", resCode, ok, err)
	}
	if _, active, _ := svc.ActiveMountDress(ctx, charID); active {
		t.Fatalf("unowned begin must not set an active dress")
	}

	// Owned -> resCode + active persisted.
	resCode, ok, err = svc.BeginMountDress(ctx, charID, 1)
	if err != nil || !ok {
		t.Fatalf("BeginMountDress(1) = %d,%v,%v want resCode,true,nil", resCode, ok, err)
	}
	if resCode != 2050080010005 {
		t.Fatalf("BeginMountDress resCode = %d, want 2050080010005", resCode)
	}
	id, active, _ := svc.ActiveMountDress(ctx, charID)
	if !active || id != 1 {
		t.Fatalf("ActiveMountDress = %d,%v want 1,true", id, active)
	}

	// Stop clears it and reports wasActive.
	wasActive, err := svc.StopMountDress(ctx, charID)
	if err != nil || !wasActive {
		t.Fatalf("StopMountDress = %v,%v want true,nil", wasActive, err)
	}
	if _, active, _ := svc.ActiveMountDress(ctx, charID); active {
		t.Fatalf("dress still active after stop")
	}

	// Stop again is a no-op (nothing to dismount).
	if wasActive, _ := svc.StopMountDress(ctx, charID); wasActive {
		t.Fatalf("second StopMountDress should report false")
	}
}

func TestExpireDress_ClearsWornDress(t *testing.T) {
	svc, _ := newDressTestService(t)
	ctx := context.Background()
	const charID = int64(13)

	if err := svc.GrantDress(ctx, charID, 20, 1700000000000); err != nil {
		t.Fatalf("GrantDress error = %v", err)
	}
	if _, ok, err := svc.BeginMountDress(ctx, charID, 20); err != nil || !ok {
		t.Fatalf("BeginMountDress(20) = %v,%v want true,nil", ok, err)
	}

	cleared, err := svc.ExpireDress(ctx, charID, 20)
	if err != nil || !cleared {
		t.Fatalf("ExpireDress = %v,%v want true,nil (expiring the worn dress)", cleared, err)
	}
	if owned, _ := svc.IsOwnedDress(ctx, charID, 20); owned {
		t.Fatalf("dress 20 still owned after expire")
	}
	if _, active, _ := svc.ActiveMountDress(ctx, charID); active {
		t.Fatalf("worn dress not cleared on expire")
	}
}
