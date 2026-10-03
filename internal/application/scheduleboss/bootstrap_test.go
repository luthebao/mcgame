// Open-sourced by BaoLT

// Bootstrap creates missing (nid, channel) state rows with next_spawn_at=boot_time+cooldown.
package scheduleboss

import (
	"context"
	"testing"
	"time"

	domain "mcgame-server/internal/domain/scheduleboss"
)

func TestBootstrap_CreatesMissingRowsOnly(t *testing.T) {
	cfg := domain.BossConfig{NID: 706, Level: 5, Kind: domain.Ground, Tier: domain.TierNormal, ChannelScope: "all", IsActive: true}
	state := newMemStateRepo()
	state.existing[domain.BossKey{NID: 706, ChannelID: 1}] = struct{}{}
	now := time.Date(2026, 5, 14, 12, 0, 0, 0, time.UTC)

	if err := Bootstrap(context.Background(), state, []domain.BossConfig{cfg}, []int{1, 2, 3}, func() time.Time { return now }); err != nil {
		t.Fatalf("Bootstrap: %v", err)
	}

	if _, ok := state.inserted[domain.BossKey{NID: 706, ChannelID: 1}]; ok {
		t.Fatalf("should not insert existing row (706, 1)")
	}
	if _, ok := state.inserted[domain.BossKey{NID: 706, ChannelID: 2}]; !ok {
		t.Fatalf("expected insert for (706, 2)")
	}
	if _, ok := state.inserted[domain.BossKey{NID: 706, ChannelID: 3}]; !ok {
		t.Fatalf("expected insert for (706, 3)")
	}
	got := state.inserted[domain.BossKey{NID: 706, ChannelID: 2}].NextSpawnAt
	if !got.Equal(now.Add(8 * time.Hour)) {
		t.Fatalf("next_spawn_at(706,2)=%s want %s", got, now.Add(8*time.Hour))
	}
}
