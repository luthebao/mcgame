// Open-sourced by BaoLT

package prs

import (
	"context"
	"encoding/json"
	"errors"
	"math/rand"
	"testing"
	"time"

	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

func newCollectService(t *testing.T, char *domainchar.Character) (*Service, *fakeCharRepo) {
	t.Helper()
	mgr := gamedata.NewManager(nil, zap.NewNop())
	raw := make([]json.RawMessage, 0, 10)
	for id := 1; id <= 10; id++ {
		raw = append(raw, json.RawMessage(
			`{"id":`+itoa(id)+`,"cost_crystal":`+itoa(id*200)+`,"show_id":`+itoa(id)+`}`))
	}
	if err := mgr.GetCache().LoadTable(models.TablePrsChip, raw); err != nil {
		t.Fatalf("LoadTable: %v", err)
	}
	charRepo := &fakeCharRepo{chars: map[int64]*domainchar.Character{}}
	if char != nil {
		charRepo.chars[char.ID] = char
	}
	svc := NewService(newFakeRepo(), charRepo, mgr, zap.NewNop())
	svc.SetRandSource(rand.NewSource(42))
	svc.SetNowFunc(func() time.Time { return time.Date(2026, 6, 15, 10, 0, 0, 0, time.UTC) })
	return svc, charRepo
}

func itoa(n int) string {
	if n == 0 {
		return "0"
	}
	neg := n < 0
	if neg {
		n = -n
	}
	buf := [20]byte{}
	i := len(buf)
	for n > 0 {
		i--
		buf[i] = byte('0' + n%10)
		n /= 10
	}
	if neg {
		i--
		buf[i] = '-'
	}
	return string(buf[i:])
}

func bagTotal(bag map[int]ChipSlot) int {
	total := 0
	for _, slot := range bag {
		total += slot.ChipNum
	}
	return total
}

func TestFreeCollect_DrawsAndIsDailyGated(t *testing.T) {
	svc, _ := newCollectService(t, &domainchar.Character{ID: 1})
	ctx := context.Background()

	for i := 0; i < freeCollectDailyLimit; i++ {
		state, rewards, err := svc.FreeCollect(ctx, 1)
		if err != nil {
			t.Fatalf("FreeCollect %d: %v", i, err)
		}
		if len(rewards) != 1 || rewards[0].Num != 1 {
			t.Fatalf("FreeCollect %d rewards = %+v, want one chip num=1", i, rewards)
		}
		if rewards[0].TableID != 127 {
			t.Fatalf("reward TableID = %d, want 127", rewards[0].TableID)
		}
		if rewards[0].ID < 1 || rewards[0].ID > 10 {
			t.Fatalf("reward chip id = %d, want 1..10", rewards[0].ID)
		}
		if bagTotal(state.ChipBag) != i+1 {
			t.Fatalf("bag total after draw %d = %d, want %d", i, bagTotal(state.ChipBag), i+1)
		}
	}

	if _, _, err := svc.FreeCollect(ctx, 1); !errors.Is(err, ErrFreeCollectLimit) {
		t.Fatalf("over daily limit: want ErrFreeCollectLimit, got %v", err)
	}
}

func TestFreeCollect_ResetsNextDay(t *testing.T) {
	svc, _ := newCollectService(t, &domainchar.Character{ID: 1})
	ctx := context.Background()

	for i := 0; i < freeCollectDailyLimit; i++ {
		if _, _, err := svc.FreeCollect(ctx, 1); err != nil {
			t.Fatalf("seed draw %d: %v", i, err)
		}
	}
	if _, _, err := svc.FreeCollect(ctx, 1); !errors.Is(err, ErrFreeCollectLimit) {
		t.Fatalf("want limit hit, got %v", err)
	}

	svc.SetNowFunc(func() time.Time { return time.Date(2026, 6, 16, 0, 5, 0, 0, time.UTC) })
	state, _, err := svc.FreeCollect(ctx, 1)
	if err != nil {
		t.Fatalf("next-day FreeCollect: %v", err)
	}
	if state.FreeCollectN != 1 {
		t.Fatalf("next-day counter = %d, want 1 (reset)", state.FreeCollectN)
	}
	if state.FreeCollectDay != "2026-06-16" {
		t.Fatalf("day = %q, want 2026-06-16", state.FreeCollectDay)
	}
}

func TestFreeCollect_GatePersistsButNotInLoginWire(t *testing.T) {
	svc, _ := newCollectService(t, &domainchar.Character{ID: 1})
	ctx := context.Background()
	if _, _, err := svc.FreeCollect(ctx, 1); err != nil {
		t.Fatalf("FreeCollect: %v", err)
	}

	state, _ := svc.loadState(ctx, 1)
	if state.FreeCollectDay != "2026-06-15" || state.FreeCollectN != 1 {
		t.Fatalf("gate not persisted: day=%q n=%d", state.FreeCollectDay, state.FreeCollectN)
	}

	if _, ok := state.toWire()["freeCollect"]; ok {
		t.Fatalf("freeCollect must NOT appear in the client wire object")
	}
	if _, ok := state.toPersist()["freeCollect"]; !ok {
		t.Fatalf("freeCollect must persist in the stored object")
	}
}

func TestGoldCollect_DeductsGoldAndDrawsOne(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 1000}
	svc, charRepo := newCollectService(t, char)
	ctx := context.Background()

	state, rewards, err := svc.GoldCollect(ctx, 1)
	if err != nil {
		t.Fatalf("GoldCollect: %v", err)
	}
	if charRepo.chars[1].Gold != 1000-goldCollectCost {
		t.Fatalf("gold = %d, want %d", charRepo.chars[1].Gold, 1000-goldCollectCost)
	}
	if rewards[0].Num != 1 {
		t.Fatalf("draw should yield 1, got %+v", rewards)
	}
	if bagTotal(state.ChipBag) != 1 {
		t.Fatalf("bag total = %d, want 1", bagTotal(state.ChipBag))
	}
}

func TestGoldCollectThree_DeductsAndDrawsThree(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 1000}
	svc, charRepo := newCollectService(t, char)
	ctx := context.Background()

	state, rewards, err := svc.GoldCollectThree(ctx, 1)
	if err != nil {
		t.Fatalf("GoldCollectThree: %v", err)
	}
	if charRepo.chars[1].Gold != 1000-goldCollectThreeCost {
		t.Fatalf("gold = %d, want %d", charRepo.chars[1].Gold, 1000-goldCollectThreeCost)
	}
	totalNum := 0
	for _, r := range rewards {
		totalNum += r.Num
	}
	if totalNum != goldCollectThreeQty {
		t.Fatalf("total drawn = %d, want %d", totalNum, goldCollectThreeQty)
	}
	if bagTotal(state.ChipBag) != goldCollectThreeQty {
		t.Fatalf("bag total = %d, want %d", bagTotal(state.ChipBag), goldCollectThreeQty)
	}
}

func TestGoldCollect_InsufficientGoldNoDeductNoChip(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 100}
	svc, charRepo := newCollectService(t, char)
	ctx := context.Background()

	if _, _, err := svc.GoldCollect(ctx, 1); !errors.Is(err, ErrInsufficientGold) {
		t.Fatalf("want ErrInsufficientGold, got %v", err)
	}
	if charRepo.chars[1].Gold != 100 {
		t.Fatalf("gold should be untouched, got %d", charRepo.chars[1].Gold)
	}
	state, _ := svc.loadState(ctx, 1)
	if bagTotal(state.ChipBag) != 0 {
		t.Fatalf("no chip should be granted on failure, bag=%d", bagTotal(state.ChipBag))
	}
}

func TestGoldCollect_DoesNotUseArenaPointForGold(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 1000, ArenaPoints: 7}
	svc, charRepo := newCollectService(t, char)
	if _, _, err := svc.GoldCollect(context.Background(), 1); err != nil {
		t.Fatalf("GoldCollect: %v", err)
	}
	if charRepo.chars[1].ArenaPoints != 7 {
		t.Fatalf("ArenaPoints must be untouched (gold!=arena), got %d", charRepo.chars[1].ArenaPoints)
	}
	if charRepo.chars[1].Gold != 1000-goldCollectCost {
		t.Fatalf("gold = %d, want %d", charRepo.chars[1].Gold, 1000-goldCollectCost)
	}
}

func TestSwapChip_RerollsExcSlotNetZero(t *testing.T) {
	svc, _ := newCollectService(t, &domainchar.Character{ID: 1})
	ctx := context.Background()
	seed := defaultState()
	seed.ExcBag[1] = ChipSlot{ChipID: 3, ChipNum: 2}
	seed.ExcBag[2] = ChipSlot{ChipID: 5, ChipNum: 1}
	_ = svc.saveState(ctx, 1, seed)

	state, rewards, err := svc.SwapChip(ctx, 1)
	if err != nil {
		t.Fatalf("SwapChip: %v", err)
	}
	if _, ok := state.ExcBag[1]; ok {
		t.Fatalf("excBag[1] should be drained after swap")
	}
	if state.ExcBag[2].ChipNum != 1 {
		t.Fatalf("only the first exc slot should swap, excBag[2]=%+v", state.ExcBag[2])
	}
	total := 0
	for _, r := range rewards {
		total += r.Num
	}
	if total != 2 {
		t.Fatalf("net-zero: 2 staged chips -> 2 rerolled, got %d", total)
	}
	if bagTotal(state.ChipBag) != 2 {
		t.Fatalf("chipBag total = %d, want 2", bagTotal(state.ChipBag))
	}
}

func TestSwapChipTimes_RerollsAllExcSlots(t *testing.T) {
	svc, _ := newCollectService(t, &domainchar.Character{ID: 1})
	ctx := context.Background()
	seed := defaultState()
	seed.ExcBag[1] = ChipSlot{ChipID: 3, ChipNum: 2}
	seed.ExcBag[2] = ChipSlot{ChipID: 5, ChipNum: 3}
	_ = svc.saveState(ctx, 1, seed)

	state, rewards, err := svc.SwapChipTimes(ctx, 1)
	if err != nil {
		t.Fatalf("SwapChipTimes: %v", err)
	}
	if len(state.ExcBag) != 0 {
		t.Fatalf("all exc slots should be drained, got %+v", state.ExcBag)
	}
	total := 0
	for _, r := range rewards {
		total += r.Num
	}
	if total != 5 {
		t.Fatalf("net-zero: 5 staged -> 5 rerolled, got %d", total)
	}
	if bagTotal(state.ChipBag) != 5 {
		t.Fatalf("chipBag total = %d, want 5", bagTotal(state.ChipBag))
	}
}

func TestSwapChip_EmptyExcBagFails(t *testing.T) {
	svc, _ := newCollectService(t, &domainchar.Character{ID: 1})
	if _, _, err := svc.SwapChip(context.Background(), 1); !errors.Is(err, ErrInsufficientChips) {
		t.Fatalf("empty exc bag: want ErrInsufficientChips, got %v", err)
	}
}

func TestDrawChip_RespectsWeightMap(t *testing.T) {
	svc, _ := newCollectService(t, &domainchar.Character{ID: 1})
	orig := map[int]int{}
	for k, v := range chipDrawWeights {
		orig[k] = v
	}
	t.Cleanup(func() {
		chipDrawWeights = orig
	})
	chipDrawWeights = map[int]int{4: 1}

	for i := 0; i < 200; i++ {
		id, ok := svc.drawChip()
		if !ok {
			t.Fatalf("drawChip not ok")
		}
		if id != 4 {
			t.Fatalf("weight map pins id=4, drew %d", id)
		}
	}
}

func TestDrawChip_SkipsUnloadedAndWeightedDistribution(t *testing.T) {
	svc, _ := newCollectService(t, &domainchar.Character{ID: 1})
	orig := map[int]int{}
	for k, v := range chipDrawWeights {
		orig[k] = v
	}
	t.Cleanup(func() {
		chipDrawWeights = orig
	})
	chipDrawWeights = map[int]int{1: 1, 2: 3, 99: 100}

	counts := map[int]int{}
	const n = 20000
	for i := 0; i < n; i++ {
		id, ok := svc.drawChip()
		if !ok {
			t.Fatalf("drawChip not ok")
		}
		if id == 99 {
			t.Fatalf("id 99 is not loaded and must be skipped")
		}
		counts[id]++
	}
	if counts[1]+counts[2] != n {
		t.Fatalf("only loaded ids 1,2 expected, got %+v", counts)
	}
	ratio := float64(counts[2]) / float64(counts[1])
	if ratio < 2.4 || ratio > 3.6 {
		t.Fatalf("weight 3:1 ratio off: id2/id1 = %.2f (counts %+v)", ratio, counts)
	}
}

func TestCollect_NoChipPoolFails(t *testing.T) {
	mgr := gamedata.NewManager(nil, zap.NewNop())
	charRepo := &fakeCharRepo{chars: map[int64]*domainchar.Character{1: {ID: 1, Gold: 1000}}}
	svc := NewService(newFakeRepo(), charRepo, mgr, zap.NewNop())
	svc.SetRandSource(rand.NewSource(1))
	ctx := context.Background()

	if _, _, err := svc.FreeCollect(ctx, 1); !errors.Is(err, ErrNoChipPool) {
		t.Fatalf("free no-pool: want ErrNoChipPool, got %v", err)
	}
	if _, _, err := svc.GoldCollect(ctx, 1); !errors.Is(err, ErrNoChipPool) {
		t.Fatalf("gold no-pool: want ErrNoChipPool, got %v", err)
	}
	if charRepo.chars[1].Gold != 1000 {
		t.Fatalf("no-pool must not deduct gold, got %d", charRepo.chars[1].Gold)
	}
}

func TestGoldCollect_BagFullRollsBackNothingExtra(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 100000}
	svc, _ := newCollectService(t, char)
	ctx := context.Background()
	seed := defaultState()
	for pos := 1; pos <= maxChipBagSlots; pos++ {
		seed.ChipBag[pos] = ChipSlot{ChipID: 1000 + pos, ChipNum: 1}
	}
	_ = svc.saveState(ctx, 1, seed)

	if _, _, err := svc.GoldCollect(ctx, 1); !errors.Is(err, ErrChipBagFull) {
		t.Fatalf("want ErrChipBagFull on full bag, got %v", err)
	}
}
