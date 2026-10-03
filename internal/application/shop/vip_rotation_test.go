// Open-sourced by BaoLT

package shop

import (
	"testing"
	"time"

	"mcgame-server/internal/gamedata/models"
)

func TestVipShopEpochAt_FourHourBoundaries(t *testing.T) {
	cases := []struct {
		name       string
		nowLocal   string
		wantStarts string
		wantEnds   string
	}{
		{"midnight rolls to 00-04 bucket", "2026-05-12 00:00:00", "2026-05-12 00:00:00", "2026-05-12 04:00:00"},
		{"03:59:59 still in 00-04 bucket", "2026-05-12 03:59:59", "2026-05-12 00:00:00", "2026-05-12 04:00:00"},
		{"04:00:00 starts 04-08 bucket", "2026-05-12 04:00:00", "2026-05-12 04:00:00", "2026-05-12 08:00:00"},
		{"19:30 falls in 16-20 bucket", "2026-05-12 19:30:00", "2026-05-12 16:00:00", "2026-05-12 20:00:00"},
		{"23:59 falls in 20-24 bucket", "2026-05-12 23:59:00", "2026-05-12 20:00:00", "2026-05-13 00:00:00"},
	}
	for _, c := range cases {
		t.Run(c.name, func(t *testing.T) {
			now, err := time.ParseInLocation("2006-01-02 15:04:05", c.nowLocal, models.GameTimezone)
			if err != nil {
				t.Fatalf("parse now: %v", err)
			}
			wantStarts, _ := time.ParseInLocation("2006-01-02 15:04:05", c.wantStarts, models.GameTimezone)
			wantEnds, _ := time.ParseInLocation("2006-01-02 15:04:05", c.wantEnds, models.GameTimezone)

			epoch, starts, ends := vipShopEpochAt(now)
			if !starts.Equal(wantStarts) {
				t.Errorf("startsAt = %v, want %v", starts, wantStarts)
			}
			if !ends.Equal(wantEnds) {
				t.Errorf("endsAt   = %v, want %v", ends, wantEnds)
			}
			if epoch != wantStarts.UnixMilli() {
				t.Errorf("epoch    = %d, want %d", epoch, wantStarts.UnixMilli())
			}
			if got := ends.Sub(starts); got != 4*time.Hour {
				t.Errorf("window length = %v, want 4h", got)
			}
		})
	}
}

func TestVipShopRotationSeed_StableForEpoch(t *testing.T) {
	a := vipShopRotationSeed(1747008000000)
	b := vipShopRotationSeed(1747008000000)
	if a != b {
		t.Errorf("seed not stable for same epoch: %d vs %d", a, b)
	}
	if vipShopRotationSeed(1747008000000) == vipShopRotationSeed(1747022400000) {
		t.Errorf("seeds should differ across epochs")
	}
}

func makePool(ids ...int) []*models.ShopSlotTemplate {
	out := make([]*models.ShopSlotTemplate, 0, len(ids))
	for _, id := range ids {
		out = append(out, &models.ShopSlotTemplate{ID: int64(id)})
	}
	return out
}

func TestSelectVIPShopSlotIDs_DeterministicForSeed(t *testing.T) {
	pool := makePool(101, 102, 103, 104, 105, 106, 107, 108, 109, 110)
	seed := vipShopRotationSeed(1747008000000)

	a := selectVIPShopSlotIDs(pool, seed, 6)
	b := selectVIPShopSlotIDs(pool, seed, 6)
	if len(a) != 6 || len(b) != 6 {
		t.Fatalf("expected 6 slots, got %d / %d", len(a), len(b))
	}
	for i := range a {
		if a[i] != b[i] {
			t.Errorf("non-deterministic at index %d: %d vs %d", i, a[i], b[i])
		}
	}
}

func TestSelectVIPShopSlotIDs_DiffersAcrossSeeds(t *testing.T) {
	pool := makePool(101, 102, 103, 104, 105, 106, 107, 108, 109, 110)

	a := selectVIPShopSlotIDs(pool, vipShopRotationSeed(1747008000000), 6)
	b := selectVIPShopSlotIDs(pool, vipShopRotationSeed(1747022400000), 6)

	identical := true
	for i := range a {
		if a[i] != b[i] {
			identical = false
			break
		}
	}
	if identical {
		t.Errorf("two different epochs picked the same selection: %v", a)
	}
}

func TestSelectVIPShopSlotIDs_PoolSmallerThanCount(t *testing.T) {
	pool := makePool(1, 2, 3)
	got := selectVIPShopSlotIDs(pool, 42, 6)
	if len(got) != 3 {
		t.Errorf("expected 3 slots when pool=3 count=6, got %d", len(got))
	}
}

