// Open-sourced by BaoLT

package item

import (
	"context"
	"encoding/json"
	"testing"

	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

type fakeMedalGranter struct {
	calls [][3]int
}

func (f *fakeMedalGranter) AddMedalToBag(ctx context.Context, charID int64, tid, count int) (int, int, error) {
	f.calls = append(f.calls, [3]int{int(charID), tid, count})
	return 1, count, nil
}

func medalAwardTestManager(t *testing.T) *gamedata.Manager {
	t.Helper()
	mgr := gamedata.NewManager(nil, zap.NewNop())
	if err := mgr.GetCache().LoadTable(models.TableMedal, []json.RawMessage{
		json.RawMessage(`{"id":12345}`),
	}); err != nil {
		t.Fatalf("LoadTable(TBL_MEDAL): %v", err)
	}
	return mgr
}

func TestGrantMedalAward_GrantsValidMedal(t *testing.T) {
	granter := &fakeMedalGranter{}
	h := &awardEffectHandler{gameData: medalAwardTestManager(t), itemService: &Service{medalGranter: granter}}
	granted, slot, total, err := h.grantMedalAward(context.Background(), 1001, 12345, 2)
	if err != nil || !granted {
		t.Fatalf("grantMedalAward valid medal: granted=%v err=%v", granted, err)
	}
	if slot != 1 || total != 2 {
		t.Fatalf("grantMedalAward slot/total = %d/%d, want 1/2", slot, total)
	}
	if len(granter.calls) != 1 || granter.calls[0] != [3]int{1001, 12345, 2} {
		t.Fatalf("granter calls = %+v, want one {1001,12345,2}", granter.calls)
	}
}

func TestGrantMedalAward_SkipsNonMedalTemplate(t *testing.T) {
	granter := &fakeMedalGranter{}
	h := &awardEffectHandler{gameData: medalAwardTestManager(t), itemService: &Service{medalGranter: granter}}
	granted, _, _, err := h.grantMedalAward(context.Background(), 1001, 99999, 1)
	if err != nil || granted {
		t.Fatalf("non-medal award id: granted=%v err=%v, want false/nil", granted, err)
	}
	if len(granter.calls) != 0 {
		t.Fatalf("granter must not be called for a non-medal award id, calls=%+v", granter.calls)
	}
}

func TestGrantMedalAward_NoGranterIsSafe(t *testing.T) {
	h := &awardEffectHandler{gameData: medalAwardTestManager(t), itemService: &Service{}}
	granted, _, _, err := h.grantMedalAward(context.Background(), 1001, 12345, 1)
	if err != nil || granted {
		t.Fatalf("nil granter: granted=%v err=%v, want false/nil", granted, err)
	}
}
