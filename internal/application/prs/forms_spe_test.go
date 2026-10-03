// Open-sourced by BaoLT

// Tests for ActiveShowSpe (tab=1 divine-form activation via inventory item consumption).
package prs

import (
	"context"
	"encoding/json"
	"errors"
	"testing"
	"time"

	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	domainchar "mcgame-server/internal/domain/character"

	"go.uber.org/zap"
)

type fakeItemConsumer struct {
	consumed  map[int]int
	fail      bool
	notEnough bool
}

func (f *fakeItemConsumer) ConsumeItemsByTemplateID(_ context.Context, _ int64, templateID int, count int) (bool, error) {
	if f.fail {
		return false, errors.New("db error")
	}
	if f.notEnough {
		return false, nil
	}
	if f.consumed == nil {
		f.consumed = map[int]int{}
	}
	f.consumed[templateID] += count
	return true, nil
}

func newTestServiceSpe(t *testing.T) (*Service, *fakeItemConsumer) {
	t.Helper()
	mgr := gamedata.NewManager(nil, zap.NewNop())
	load := func(table string, rows ...string) {
		raw := make([]json.RawMessage, 0, len(rows))
		for _, r := range rows {
			raw = append(raw, json.RawMessage(r))
		}
		if err := mgr.GetCache().LoadTable(table, raw); err != nil {
			t.Fatalf("LoadTable(%s): %v", table, err)
		}
	}
	load(models.TablePrsShow,
		`{"id":8001,"need_chip_id":5001,"need_num":10,"limit_type":0,"tab":0}`,
		`{"id":11,"need_chip_id":5303,"need_num":1,"limit_type":1,"limit_time":10080,"tab":1}`,
		`{"id":15,"need_chip_id":5351,"need_num":30,"limit_type":1,"limit_time":43200,"tab":1}`)
	load(models.TablePrsTree)
	load(models.TablePrsChip)

	charRepo := &fakeCharRepo{chars: map[int64]*domainchar.Character{
		1: {ID: 1},
	}}
	svc := NewService(newFakeRepo(), charRepo, mgr, zap.NewNop())
	ic := &fakeItemConsumer{}
	svc.SetItemConsumer(ic)
	return svc, ic
}

func TestActiveShowSpe_SuccessConsumesItemAndSetsExpiry(t *testing.T) {
	svc, ic := newTestServiceSpe(t)
	ctx := context.Background()

	before := nowMs()
	data, err := svc.ActiveShowSpe(ctx, 1, 11)
	after := nowMs()
	if err != nil {
		t.Fatalf("ActiveShowSpe: %v", err)
	}

	if ic.consumed[5303] != 1 {
		t.Fatalf("consumed[5303] = %d, want 1", ic.consumed[5303])
	}

	state, _ := svc.loadState(ctx, 1)
	expiry, ok := state.ActLimitObj[11]
	if !ok || expiry <= 0 {
		t.Fatalf("actLimitObj[11] not set, got %d", expiry)
	}
	wantMin := before + int64(10080)*60000
	wantMax := after + int64(10080)*60000
	if expiry < wantMin || expiry > wantMax {
		t.Fatalf("actLimitObj[11] = %d, want in [%d, %d]", expiry, wantMin, wantMax)
	}

	actLimitObj, ok := data["actLimitObj"].(map[string]interface{})
	if !ok {
		t.Fatalf("toWire actLimitObj type %T", data["actLimitObj"])
	}
	if len(actLimitObj) != 1 {
		t.Fatalf("wire actLimitObj len = %d, want 1", len(actLimitObj))
	}
}

func TestActiveShowSpe_Tab0Rejected(t *testing.T) {
	svc, _ := newTestServiceSpe(t)
	if _, err := svc.ActiveShowSpe(context.Background(), 1, 8001); !errors.Is(err, ErrUnknownShow) {
		t.Fatalf("tab=0 show: want ErrUnknownShow, got %v", err)
	}
}

func TestActiveShowSpe_UnknownShowRejected(t *testing.T) {
	svc, _ := newTestServiceSpe(t)
	if _, err := svc.ActiveShowSpe(context.Background(), 1, 9999); !errors.Is(err, ErrUnknownShow) {
		t.Fatalf("unknown show: want ErrUnknownShow, got %v", err)
	}
}

func TestActiveShowSpe_AlreadyActivated(t *testing.T) {
	svc, _ := newTestServiceSpe(t)
	ctx := context.Background()
	seed := defaultState()
	seed.ActLimitObj[11] = 9999999999999
	_ = svc.saveState(ctx, 1, seed)

	if _, err := svc.ActiveShowSpe(ctx, 1, 11); !errors.Is(err, ErrAlreadyActivated) {
		t.Fatalf("re-activate: want ErrAlreadyActivated, got %v", err)
	}
}

func TestActiveShowSpe_InsufficientItems(t *testing.T) {
	svc, ic := newTestServiceSpe(t)
	ic.notEnough = true
	if _, err := svc.ActiveShowSpe(context.Background(), 1, 11); !errors.Is(err, ErrInsufficientItems) {
		t.Fatalf("want ErrInsufficientItems, got %v", err)
	}
}

func TestActiveShowSpe_NilConsumerSkipsConsumption(t *testing.T) {
	mgr := gamedata.NewManager(nil, zap.NewNop())
	raw := []json.RawMessage{json.RawMessage(`{"id":11,"need_chip_id":5303,"need_num":1,"limit_type":1,"limit_time":10080,"tab":1}`)}
	_ = mgr.GetCache().LoadTable(models.TablePrsShow, raw)
	_ = mgr.GetCache().LoadTable(models.TablePrsTree, nil)
	_ = mgr.GetCache().LoadTable(models.TablePrsChip, nil)
	charRepo := &fakeCharRepo{chars: map[int64]*domainchar.Character{1: {ID: 1}}}
	svc := NewService(newFakeRepo(), charRepo, mgr, zap.NewNop())

	data, err := svc.ActiveShowSpe(context.Background(), 1, 11)
	if err != nil {
		t.Fatalf("nil consumer: %v", err)
	}
	state, _ := svc.loadState(context.Background(), 1)
	if _, ok := state.ActLimitObj[11]; !ok {
		t.Fatalf("actLimitObj[11] should be set when consumer is nil")
	}
	if data == nil {
		t.Fatal("expected non-nil wire data")
	}
}

func TestActiveShowSpe_LargeNeedNum(t *testing.T) {
	svc, ic := newTestServiceSpe(t)
	ctx := context.Background()

	data, err := svc.ActiveShowSpe(ctx, 1, 15)
	if err != nil {
		t.Fatalf("ActiveShowSpe needNum=30: %v", err)
	}
	if ic.consumed[5351] != 30 {
		t.Fatalf("consumed[5351] = %d, want 30", ic.consumed[5351])
	}
	state, _ := svc.loadState(ctx, 1)
	if _, ok := state.ActLimitObj[15]; !ok {
		t.Fatalf("actLimitObj[15] not set after 30-day activation")
	}
	if data == nil {
		t.Fatal("expected non-nil wire data")
	}
}

func nowMs() int64 {
	return time.Now().UnixMilli()
}
