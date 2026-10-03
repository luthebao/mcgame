// Open-sourced by BaoLT

package adminhttp

import (
	"bytes"
	"context"
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"

	"go.uber.org/zap"

	appactivity "mcgame-server/internal/application/activity"
	domainactivity "mcgame-server/internal/domain/activity"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"
)

type broadcastCall struct {
	method string
	data   interface{}
}

type fakeBroadcaster struct {
	calls []broadcastCall
}

func (f *fakeBroadcaster) GetOnlineSessionSnapshots() []rtmp.OnlineSessionSnapshot {
	return nil
}

func (f *fakeBroadcaster) GetConnectionByCharacterID(string) *rtmp.Connection {
	return nil
}

func (f *fakeBroadcaster) BroadcastToAll(method string, data interface{}) {
	f.calls = append(f.calls, broadcastCall{method: method, data: data})
}

type fakeActivityRepo struct {
	configs []*domainactivity.ActivityConfig
}

func (r *fakeActivityRepo) List(context.Context) ([]*domainactivity.ActivityConfig, error) {
	return r.configs, nil
}

func (r *fakeActivityRepo) Get(_ context.Context, id int) (*domainactivity.ActivityConfig, error) {
	for _, c := range r.configs {
		if c != nil && c.ID == id {
			return c, nil
		}
	}
	return nil, pkgerrors.ErrNotFound
}

func newTestServerForBroadcast(repo *fakeActivityRepo) (*Server, *fakeBroadcaster) {
	broadcaster := &fakeBroadcaster{}
	srv := &Server{
		logger:          zap.NewNop(),
		sessionProvider: broadcaster,
		activityService: appactivity.NewStartedActivityService(repo),
	}
	return srv, broadcaster
}

func postBroadcast(t *testing.T, srv *Server, body any) *httptest.ResponseRecorder {
	t.Helper()
	buf, err := json.Marshal(body)
	if err != nil {
		t.Fatalf("marshal body: %v", err)
	}
	req := httptest.NewRequest(http.MethodPost, "/api/admin/activities/broadcast", bytes.NewReader(buf))
	rr := httptest.NewRecorder()
	srv.handleActivityBroadcast(rr, req)
	return rr
}

func TestActivityBroadcast_UpdateEnabledRowSendsFlagOne(t *testing.T) {
	repo := &fakeActivityRepo{
		configs: []*domainactivity.ActivityConfig{
			{ID: 12, SortType: 3, Enable: true, Type: 0, Flag: 1},
		},
	}
	srv, broadcaster := newTestServerForBroadcast(repo)

	rr := postBroadcast(t, srv, map[string]any{"action": "update", "id": 12})

	if rr.Code != http.StatusOK {
		t.Fatalf("status = %d, want 200, body=%s", rr.Code, rr.Body.String())
	}
	if len(broadcaster.calls) != 1 {
		t.Fatalf("broadcast calls = %d, want 1", len(broadcaster.calls))
	}
	call := broadcaster.calls[0]
	if call.method != "updateActivityState" {
		t.Fatalf("method = %s, want updateActivityState", call.method)
	}
	entry, ok := call.data.(map[string]interface{})
	if !ok {
		t.Fatalf("data type = %T, want map", call.data)
	}
	if entry["id"] != 12 {
		t.Fatalf("entry[id] = %v, want 12", entry["id"])
	}
	if entry["sortType"] != 3 {
		t.Fatalf("entry[sortType] = %v, want 3", entry["sortType"])
	}
	if entry["flag"] != 1 {
		t.Fatalf("entry[flag] = %v, want 1 (show)", entry["flag"])
	}
}

func TestActivityBroadcast_UpdateDisabledRowSendsFlagZero(t *testing.T) {
	repo := &fakeActivityRepo{
		configs: []*domainactivity.ActivityConfig{
			{ID: 7, SortType: 7, Enable: false, Type: 0, Flag: 1},
		},
	}
	srv, broadcaster := newTestServerForBroadcast(repo)

	rr := postBroadcast(t, srv, map[string]any{"action": "update", "id": 7})

	if rr.Code != http.StatusOK {
		t.Fatalf("status = %d, want 200", rr.Code)
	}
	if len(broadcaster.calls) != 1 {
		t.Fatalf("broadcast calls = %d, want 1", len(broadcaster.calls))
	}
	entry := broadcaster.calls[0].data.(map[string]interface{})
	if entry["flag"] != 0 {
		t.Fatalf("entry[flag] = %v, want 0 (hide)", entry["flag"])
	}
}

func TestActivityBroadcast_UpdateGatedRowFallsBackToFullList(t *testing.T) {
	repo := &fakeActivityRepo{
		configs: []*domainactivity.ActivityConfig{
			{ID: 5, SortType: 5, Enable: true, Type: 2, Flag: 30},
			{ID: 6, SortType: 6, Enable: true, Type: 0, Flag: 1},
		},
	}
	srv, broadcaster := newTestServerForBroadcast(repo)

	rr := postBroadcast(t, srv, map[string]any{"action": "update", "id": 5})

	if rr.Code != http.StatusOK {
		t.Fatalf("status = %d, want 200, body=%s", rr.Code, rr.Body.String())
	}
	if len(broadcaster.calls) != 1 {
		t.Fatalf("broadcast calls = %d, want 1", len(broadcaster.calls))
	}
	call := broadcaster.calls[0]
	if call.method != "updateActivityList" {
		t.Fatalf("method = %s, want updateActivityList (gated row should trigger full reload)", call.method)
	}
}

func TestActivityBroadcast_CreatePushesFullList(t *testing.T) {
	repo := &fakeActivityRepo{
		configs: []*domainactivity.ActivityConfig{
			{ID: 1, SortType: 1, Enable: true, Flag: 1},
			{ID: 2, SortType: 2, Enable: true, Flag: 1},
		},
	}
	srv, broadcaster := newTestServerForBroadcast(repo)

	rr := postBroadcast(t, srv, map[string]any{"action": "create", "id": 2})

	if rr.Code != http.StatusOK {
		t.Fatalf("status = %d, want 200, body=%s", rr.Code, rr.Body.String())
	}
	if len(broadcaster.calls) != 1 {
		t.Fatalf("broadcast calls = %d, want 1", len(broadcaster.calls))
	}
	call := broadcaster.calls[0]
	if call.method != "updateActivityList" {
		t.Fatalf("method = %s, want updateActivityList", call.method)
	}
	list, ok := call.data.([]interface{})
	if !ok {
		t.Fatalf("data type = %T, want []interface{}", call.data)
	}
	if len(list) != 2 {
		t.Fatalf("list length = %d, want 2", len(list))
	}
}

func TestActivityBroadcast_DeletePushesFullList(t *testing.T) {
	repo := &fakeActivityRepo{
		configs: []*domainactivity.ActivityConfig{
			{ID: 1, SortType: 1, Enable: true, Flag: 1},
		},
	}
	srv, broadcaster := newTestServerForBroadcast(repo)

	rr := postBroadcast(t, srv, map[string]any{"action": "delete", "id": 99})

	if rr.Code != http.StatusOK {
		t.Fatalf("status = %d, want 200, body=%s", rr.Code, rr.Body.String())
	}
	if len(broadcaster.calls) != 1 || broadcaster.calls[0].method != "updateActivityList" {
		t.Fatalf("broadcast = %+v, want one updateActivityList call", broadcaster.calls)
	}
}

func TestActivityBroadcast_UpdateMissingIDIs404(t *testing.T) {
	repo := &fakeActivityRepo{configs: nil}
	srv, broadcaster := newTestServerForBroadcast(repo)

	rr := postBroadcast(t, srv, map[string]any{"action": "update", "id": 999})

	if rr.Code != http.StatusNotFound {
		t.Fatalf("status = %d, want 404, body=%s", rr.Code, rr.Body.String())
	}
	if len(broadcaster.calls) != 0 {
		t.Fatalf("broadcast calls = %d, want 0 on 404", len(broadcaster.calls))
	}
}

func TestActivityBroadcast_UnknownActionIs400(t *testing.T) {
	repo := &fakeActivityRepo{configs: nil}
	srv, broadcaster := newTestServerForBroadcast(repo)

	rr := postBroadcast(t, srv, map[string]any{"action": "explode", "id": 1})

	if rr.Code != http.StatusBadRequest {
		t.Fatalf("status = %d, want 400", rr.Code)
	}
	if len(broadcaster.calls) != 0 {
		t.Fatalf("broadcast calls = %d, want 0 on bad action", len(broadcaster.calls))
	}
}

func TestActivityBroadcast_NonPostIs405(t *testing.T) {
	repo := &fakeActivityRepo{configs: nil}
	srv, _ := newTestServerForBroadcast(repo)

	req := httptest.NewRequest(http.MethodGet, "/api/admin/activities/broadcast", nil)
	rr := httptest.NewRecorder()
	srv.handleActivityBroadcast(rr, req)

	if rr.Code != http.StatusMethodNotAllowed {
		t.Fatalf("status = %d, want 405", rr.Code)
	}
}
