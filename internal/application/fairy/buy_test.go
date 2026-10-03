// Open-sourced by BaoLT

package fairy

import (
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

func loadFairyTemplates(t *testing.T, ids ...int) *gamedata.Manager {
	t.Helper()
	mgr := gamedata.NewManager(nil, zap.NewNop())
	raw := make([]json.RawMessage, 0, len(ids))
	for _, id := range ids {
		raw = append(raw, json.RawMessage(fmt.Sprintf(
			`{"id":%d,"name":"Fairy%d","agi":5,"agi_g":5,"sta":5,"sta_g":5,"ste":5,"ste_g":5,"inte":5,"inte_g":5,"ener":5,"ener_g":5,"cc":0}`, id, id)))
	}
	if err := mgr.GetCache().LoadTable(models.TableFairyTempalte, raw); err != nil {
		t.Fatalf("LoadTable(TBL_FAIRY_TEMPALTE): %v", err)
	}
	return mgr
}

func TestBuyFairy_DeductsGoldAndGrants(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 1000}
	svc, repo, charRepo, _, _ := newTestService(char)
	svc.gameData = loadFairyTemplates(t, 1, 2, 3)
	ctx := context.Background()

	dto, err := svc.BuyFairy(ctx, 1, 2)
	if err != nil {
		t.Fatalf("BuyFairy: %v", err)
	}
	if dto["tid"].(int) != 2 {
		t.Fatalf("bought tid = %v, want 2", dto["tid"])
	}
	if dto["name"].(string) != "Fairy2" {
		t.Fatalf("name = %v, want Fairy2", dto["name"])
	}
	if charRepo.chars[1].Gold != 1000-FairyBuyGoldCost {
		t.Fatalf("gold after buy = %d, want %d", charRepo.chars[1].Gold, 1000-FairyBuyGoldCost)
	}
	states := repo.charStates[1]
	if len(states) != 1 || states[0].FeatureKey != rosterFeatureKey {
		t.Fatalf("expected one persisted roster state, got %+v", states)
	}
}

func TestBuyFairy_RejectsFreeAndUnknownWithoutCharging(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 1000}
	svc, _, charRepo, _, _ := newTestService(char)
	svc.gameData = loadFairyTemplates(t, 1, 2)
	ctx := context.Background()

	if _, err := svc.BuyFairy(ctx, 1, FreeFairyTid); !errors.Is(err, ErrFairyMissing) {
		t.Fatalf("buy free tid err = %v, want ErrFairyMissing", err)
	}
	if _, err := svc.BuyFairy(ctx, 1, 999); !errors.Is(err, ErrFairyMissing) {
		t.Fatalf("buy unknown tid err = %v, want ErrFairyMissing", err)
	}
	if charRepo.chars[1].Gold != 1000 {
		t.Fatalf("gold should be untouched, got %d", charRepo.chars[1].Gold)
	}
}

func TestBuyFairy_AlreadyOwnedChargedOnce(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 2000}
	svc, _, charRepo, _, _ := newTestService(char)
	svc.gameData = loadFairyTemplates(t, 1, 2)
	ctx := context.Background()

	if _, err := svc.BuyFairy(ctx, 1, 2); err != nil {
		t.Fatalf("first buy: %v", err)
	}
	if _, err := svc.BuyFairy(ctx, 1, 2); !errors.Is(err, ErrFairyAlreadyOwned) {
		t.Fatalf("second buy err = %v, want ErrFairyAlreadyOwned", err)
	}
	if charRepo.chars[1].Gold != 2000-FairyBuyGoldCost {
		t.Fatalf("gold = %d, want exactly one charge %d", charRepo.chars[1].Gold, 2000-FairyBuyGoldCost)
	}
}

func TestBuyFairy_InsufficientGold(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: FairyBuyGoldCost - 1}
	svc, repo, charRepo, _, _ := newTestService(char)
	svc.gameData = loadFairyTemplates(t, 1, 2)
	ctx := context.Background()

	if _, err := svc.BuyFairy(ctx, 1, 2); !errors.Is(err, ErrInsufficientGold) {
		t.Fatalf("buy err = %v, want ErrInsufficientGold", err)
	}
	if charRepo.chars[1].Gold != FairyBuyGoldCost-1 {
		t.Fatalf("gold should be untouched, got %d", charRepo.chars[1].Gold)
	}
	if len(repo.charStates[1]) != 0 {
		t.Fatalf("no fairy should be persisted on failed buy, got %+v", repo.charStates[1])
	}
}

func TestPurchasableFairies_ExcludesFreeAndSorts(t *testing.T) {
	svc, _, _, _, _ := newTestService(nil)
	svc.gameData = loadFairyTemplates(t, 3, 1, 2)

	list := svc.PurchasableFairies()
	if len(list) != 2 {
		t.Fatalf("purchasable count = %d, want 2 (free angel excluded)", len(list))
	}
	if list[0].Tid != 2 || list[1].Tid != 3 {
		t.Fatalf("not sorted by tid ascending: %+v", list)
	}
	if list[0].Cost != FairyBuyGoldCost {
		t.Fatalf("cost = %d, want %d", list[0].Cost, FairyBuyGoldCost)
	}
}
