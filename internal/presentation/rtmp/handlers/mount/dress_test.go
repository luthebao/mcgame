// Open-sourced by BaoLT

package mount

import (
	"context"
	"encoding/json"
	"net"
	"testing"
	"time"

	appmount "mcgame-server/internal/application/mount"
	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type stubNetConn struct{}

func (s *stubNetConn) Read(b []byte) (int, error)         { return 0, nil }
func (s *stubNetConn) Write(b []byte) (int, error)        { return len(b), nil }
func (s *stubNetConn) Close() error                       { return nil }
func (s *stubNetConn) LocalAddr() net.Addr                { return nil }
func (s *stubNetConn) RemoteAddr() net.Addr               { return &net.TCPAddr{} }
func (s *stubNetConn) SetDeadline(t time.Time) error      { return nil }
func (s *stubNetConn) SetReadDeadline(t time.Time) error  { return nil }
func (s *stubNetConn) SetWriteDeadline(t time.Time) error { return nil }

type fakeFeatureRepo struct {
	states map[int64]map[string]*domainfeature.CharacterFeatureState
}

func (f *fakeFeatureRepo) ListCharacterFeatureStates(_ context.Context, charID int64) ([]*domainfeature.CharacterFeatureState, error) {
	out := []*domainfeature.CharacterFeatureState{}
	for _, st := range f.states[charID] {
		out = append(out, st)
	}
	return out, nil
}
func (f *fakeFeatureRepo) UpsertCharacterFeatureState(_ context.Context, state *domainfeature.CharacterFeatureState) error {
	if f.states == nil {
		f.states = map[int64]map[string]*domainfeature.CharacterFeatureState{}
	}
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

type broadcastSpy struct {
	calls []spyCall
}

type spyCall struct {
	callback string
	payload  map[string]interface{}
}

func (b *broadcastSpy) BroadcastToScene(_, _ int, _ uint32, callback string, args ...any) {
	call := spyCall{callback: callback}
	if len(args) == 1 {
		if m, ok := args[0].(map[string]interface{}); ok {
			call.payload = m
		}
	}
	b.calls = append(b.calls, call)
}

type appearanceStub struct{}

func (appearanceStub) MountDismountAppearance(context.Context, int64) (string, string, bool, string) {
	return "9001", "5", true, "3"
}

func newHandlerService(t *testing.T) *appmount.Service {
	t.Helper()
	mgr := gamedata.NewManager(nil, zap.NewNop())
	load := func(table string, rows []string) {
		raw := make([]json.RawMessage, 0, len(rows))
		for _, r := range rows {
			raw = append(raw, json.RawMessage(r))
		}
		if err := mgr.GetCache().LoadTable(table, raw); err != nil {
			t.Fatalf("LoadTable(%s) error = %v", table, err)
		}
	}
	load(models.TableMount, []string{
		`{"id":21,"level":0,"dress_id":1,"mount_lev_limit":5,"item_num":2,"exp":50,"add_rate":4,"type":2}`,
	})
	load(models.TableMountDress, []string{
		`{"id":1,"type":1,"name":"Bach Ho","gold":0,"effective_time":0,"res_code":2050080010005}`,
		`{"id":2,"type":1,"name":"U Linh Ho","gold":0,"effective_time":0,"res_code":2050080010004}`,
	})
	return appmount.NewService(&fakeFeatureRepo{}, nil, mgr, zap.NewNop())
}

func newCtx(t *testing.T, charID string) *rtmp.RPCContext {
	t.Helper()
	conn := rtmp.NewConnection(1, &stubNetConn{}, nil, zap.NewNop())
	return &rtmp.RPCContext{Context: context.Background(), CharacterID: charID, Connection: conn, ConnID: 1}
}

func TestBeginMounting_OwnedBroadcastsOnMountOn(t *testing.T) {
	h := NewHandler(newHandlerService(t), zap.NewNop())
	spy := &broadcastSpy{}
	h.SetSceneBroadcaster(spy)
	ctx := newCtx(t, "42")

	if _, err := h.BeginMounting(ctx, []interface{}{float64(1)}); err != nil {
		t.Fatalf("BeginMounting error = %v", err)
	}
	if len(spy.calls) != 1 || spy.calls[0].callback != "onMountOn" {
		t.Fatalf("expected one onMountOn broadcast, got %+v", spy.calls)
	}
	p := spy.calls[0].payload
	if p["cid"] != int64(42) {
		t.Fatalf("onMountOn cid = %v, want int64 42", p["cid"])
	}
	if p["resCode"] != int64(2050080010005) {
		t.Fatalf("onMountOn resCode = %v, want 2050080010005", p["resCode"])
	}
	if _, ok := p["wp"]; !ok {
		t.Fatalf("onMountOn missing wp field: %+v", p)
	}
}

func TestBeginMounting_UnownedDoesNotBroadcast(t *testing.T) {
	h := NewHandler(newHandlerService(t), zap.NewNop())
	spy := &broadcastSpy{}
	h.SetSceneBroadcaster(spy)
	ctx := newCtx(t, "42")

	// dress 2 not owned by a fresh upLv=0 char -> no broadcast (parent falls through).
	if _, err := h.BeginMounting(ctx, []interface{}{float64(2)}); err != nil {
		t.Fatalf("BeginMounting error = %v", err)
	}
	if len(spy.calls) != 0 {
		t.Fatalf("unowned dress must not broadcast, got %+v", spy.calls)
	}
	if h.IsOwnedDress(ctx, 2) {
		t.Fatalf("IsOwnedDress(2) = true, want false")
	}
	if !h.IsOwnedDress(ctx, 1) {
		t.Fatalf("IsOwnedDress(1) = false, want true")
	}
}

func TestStopMounting_BroadcastsOnMountOffWithAppearance(t *testing.T) {
	h := NewHandler(newHandlerService(t), zap.NewNop())
	spy := &broadcastSpy{}
	h.SetSceneBroadcaster(spy)
	h.SetDismountAppearance(appearanceStub{})
	ctx := newCtx(t, "42")

	// Equip first so there is an active dress to remove.
	if _, err := h.BeginMounting(ctx, []interface{}{float64(1)}); err != nil {
		t.Fatalf("BeginMounting error = %v", err)
	}
	if !h.HasActiveMountDress(ctx) {
		t.Fatalf("expected active mount-dress after begin")
	}

	spy.calls = nil
	if _, err := h.StopMounting(ctx, nil); err != nil {
		t.Fatalf("StopMounting error = %v", err)
	}
	if len(spy.calls) != 1 || spy.calls[0].callback != "onMountOff" {
		t.Fatalf("expected one onMountOff broadcast, got %+v", spy.calls)
	}
	p := spy.calls[0].payload
	if p["cid"] != int64(42) || p["isMountOn"] != false {
		t.Fatalf("onMountOff cid/isMountOn wrong: %+v", p)
	}
	if p["wp"] != "9001" || p["ee"] != "5" || p["ef"] != true || p["star"] != "3" {
		t.Fatalf("onMountOff appearance fields wrong: %+v", p)
	}
	if h.HasActiveMountDress(ctx) {
		t.Fatalf("dress still active after StopMounting")
	}
}

func TestStopMounting_NoActiveDressNoBroadcast(t *testing.T) {
	h := NewHandler(newHandlerService(t), zap.NewNop())
	spy := &broadcastSpy{}
	h.SetSceneBroadcaster(spy)
	ctx := newCtx(t, "42")

	if _, err := h.StopMounting(ctx, nil); err != nil {
		t.Fatalf("StopMounting error = %v", err)
	}
	if len(spy.calls) != 0 {
		t.Fatalf("no active dress -> no broadcast; parent routes to pet-riding. got %+v", spy.calls)
	}
}

func TestRegisterRiding_OwnedDressRoutesToMount(t *testing.T) {
	h := NewHandler(newHandlerService(t), zap.NewNop())
	spy := &broadcastSpy{}
	h.SetSceneBroadcaster(spy)

	d := rtmp.NewRPCDispatcher(zap.NewNop())
	petCalls := 0
	h.RegisterRiding(d, func(*rtmp.RPCContext, []interface{}) (interface{}, error) {
		petCalls++
		return nil, nil
	}, nil)

	conn := rtmp.NewConnection(1, &stubNetConn{}, nil, zap.NewNop())
	conn.SetCharacter("42")
	if _, err := d.Dispatch(conn, "beginMounting", []interface{}{float64(1)}); err != nil {
		t.Fatalf("dispatch owned dress: %v", err)
	}
	if petCalls != 0 {
		t.Fatalf("owned dress must not fall through to pet, petCalls=%d", petCalls)
	}
	if len(spy.calls) != 1 || spy.calls[0].callback != "onMountOn" {
		t.Fatalf("owned dress should broadcast onMountOn, got %+v", spy.calls)
	}
}

func TestRegisterRiding_NonDressFallsThroughToPet(t *testing.T) {
	h := NewHandler(newHandlerService(t), zap.NewNop())
	spy := &broadcastSpy{}
	h.SetSceneBroadcaster(spy)

	d := rtmp.NewRPCDispatcher(zap.NewNop())
	petCalls := 0
	h.RegisterRiding(d, func(*rtmp.RPCContext, []interface{}) (interface{}, error) {
		petCalls++
		return nil, nil
	}, nil)

	conn := rtmp.NewConnection(1, &stubNetConn{}, nil, zap.NewNop())
	conn.SetCharacter("42")
	if _, err := d.Dispatch(conn, "beginMounting", []interface{}{float64(987654)}); err != nil {
		t.Fatalf("dispatch pet id: %v", err)
	}
	if petCalls != 1 {
		t.Fatalf("non-dress id must fall through to petRide exactly once, petCalls=%d", petCalls)
	}
	if len(spy.calls) != 0 {
		t.Fatalf("pet fallback must not broadcast a mount-dress event, got %+v", spy.calls)
	}
}
