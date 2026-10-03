// Open-sourced by BaoLT

// Bootstrap ensures every (eligible boss, channel) pair has a state row.
// Missing rows are seeded with is_alive=false and next_spawn_at = clock() + Cooldown.
package scheduleboss

import (
	"context"
	"time"

	domain "mcgame-server/internal/domain/scheduleboss"
)

func Bootstrap(ctx context.Context, state domain.StateRepo, configs []domain.BossConfig, channelIDs []int, clock func() time.Time) error {
	if clock == nil {
		clock = time.Now
	}
	existing, err := state.ListExistingKeys(ctx)
	if err != nil {
		return err
	}
	now := clock()
	missing := make([]domain.BossState, 0)
	for _, cfg := range configs {
		if !cfg.Eligible() {
			continue
		}
		next := now.Add(domain.Cooldown(cfg.Level, cfg.Kind))
		for _, ch := range channelIDs {
			key := domain.BossKey{NID: cfg.NID, ChannelID: ch}
			if _, ok := existing[key]; ok {
				continue
			}
			missing = append(missing, domain.BossState{
				NID:         cfg.NID,
				ChannelID:   ch,
				IsAlive:     false,
				NextSpawnAt: next,
			})
		}
	}
	return state.InsertMissing(ctx, missing)
}
