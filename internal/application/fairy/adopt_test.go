// Open-sourced by BaoLT

package fairy

import (
	"context"
	"encoding/json"
	"errors"
	"testing"

	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

func TestAdopt_CreatesFreeFairyAndRefusesDuplicate(t *testing.T) {
	svc, repo, _, _, _ := newTestService(nil)
	ctx := context.Background()

	dto, err := svc.Adopt(ctx, 1, FreeFairyTid)
	if err != nil {
		t.Fatalf("Adopt: %v", err)
	}
	if dto["id"].(int64) != 1 {
		t.Fatalf("adopted id = %v, want 1", dto["id"])
	}
	if dto["tid"].(int) != FreeFairyTid {
		t.Fatalf("adopted tid = %v, want %d", dto["tid"], FreeFairyTid)
	}
	flag, _ := dto["flag"].(map[string]interface{})
	if flag["gnum"].(int) != dailyCultivations || flag["en"].(int) != dailyFruitFeeds {
		t.Fatalf("daily counters = %v, want gnum=%d en=%d", flag, dailyCultivations, dailyFruitFeeds)
	}

	states := repo.charStates[1]
	if len(states) != 1 || states[0].FeatureKey != rosterFeatureKey {
		t.Fatalf("expected one persisted roster state, got %+v", states)
	}

	if _, err := svc.Adopt(ctx, 1, FreeFairyTid); !errors.Is(err, ErrFairyAlreadyOwned) {
		t.Fatalf("duplicate adopt err = %v, want ErrFairyAlreadyOwned", err)
	}
}

func TestAdopt_PopulatesTemplateStats(t *testing.T) {
	svc, _, _, _, _ := newTestService(nil)
	mgr := gamedata.NewManager(nil, zap.NewNop())
	if err := mgr.GetCache().LoadTable(models.TableFairyTempalte, []json.RawMessage{
		json.RawMessage(`{"id":1,"name":"Thiên Sứ Poli","agi":5,"agi_g":5,"sta":5,"sta_g":5,"ste":5,"ste_g":5,"inte":5,"inte_g":5,"ener":5,"ener_g":5,"cc":0}`),
	}); err != nil {
		t.Fatalf("LoadTable(TBL_FAIRY_TEMPALTE): %v", err)
	}
	svc.gameData = mgr
	ctx := context.Background()

	dto, err := svc.Adopt(ctx, 7, FreeFairyTid)
	if err != nil {
		t.Fatalf("Adopt: %v", err)
	}
	if dto["name"].(string) != "Thiên Sứ Poli" {
		t.Fatalf("name = %v, want 'Thiên Sứ Poli'", dto["name"])
	}
	if dto["sta"].(float64) != 5 {
		t.Fatalf("sta = %v, want 5", dto["sta"])
	}
}
