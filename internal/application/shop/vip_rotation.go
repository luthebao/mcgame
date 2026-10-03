// Open-sourced by BaoLT

// Pure helpers for the shared 4-hour VIP shop rotation. Boundary math runs in
// the project-wide game timezone (UTC+7); the deterministic slot selection
// uses an FNV-seeded RNG so every server replica picks the same 6 slots for
// a given epoch.
package shop

import (
	"fmt"
	"hash/fnv"
	"math/rand"
	"sort"
	"time"

	"mcgame-server/internal/gamedata/models"
)

const vipShopRotationHours = 4

func vipShopEpochAt(now time.Time) (epoch int64, startsAt, endsAt time.Time) {
	local := now.In(models.GameTimezone)
	bucketHour := (local.Hour() / vipShopRotationHours) * vipShopRotationHours
	startsAt = time.Date(local.Year(), local.Month(), local.Day(), bucketHour, 0, 0, 0, models.GameTimezone)
	endsAt = startsAt.Add(vipShopRotationHours * time.Hour)
	epoch = startsAt.UnixMilli()
	return epoch, startsAt, endsAt
}

func vipShopRotationSeed(epoch int64) int64 {
	hasher := fnv.New64a()
	_, _ = fmt.Fprintf(hasher, "vip_shop_global:%d", epoch)
	return int64(hasher.Sum64())
}

func selectVIPShopSlotIDs(pool []*models.ShopSlotTemplate, seed int64, count int) []int32 {
	if count <= 0 || len(pool) == 0 {
		return nil
	}
	sorted := append([]*models.ShopSlotTemplate(nil), pool...)
	sort.SliceStable(sorted, func(i, j int) bool {
		return sorted[i].ID < sorted[j].ID
	})

	if count > len(sorted) {
		count = len(sorted)
	}
	order := rand.New(rand.NewSource(seed)).Perm(len(sorted))
	picked := make([]int32, 0, count)
	for _, idx := range order[:count] {
		picked = append(picked, int32(sorted[idx].ID))
	}
	return picked
}
