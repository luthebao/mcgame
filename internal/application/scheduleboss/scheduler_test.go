// Open-sourced by BaoLT

// Tests for the scheduler tick: due rows are marked alive and broadcast when state flipped.
package scheduleboss

import (
	"context"
	"sync"
	"testing"

	domain "mcgame-server/internal/domain/scheduleboss"
)

type capturingBroadcaster struct {
	mu    sync.Mutex
	calls []string
}

func (c *capturingBroadcaster) BroadcastToScene(channelID, mapID int, exclude uint32, callback string, args ...any) {
	c.mu.Lock()
	defer c.mu.Unlock()
	c.calls = append(c.calls, callback)
}

type stubPayloads struct{}

func (stubPayloads) BuildBossOn(cfg domain.BossConfig) map[string]any {
	return map[string]any{"nid": cfg.NID}
}

func TestScheduler_TickSpawnsDueAndBroadcasts(t *testing.T) {
	cfg := domain.BossConfig{NID: 706, MapID: 3, Level: 5, Kind: domain.Ground, Tier: domain.TierNormal, Name: "Thất Sắc Kê", IsActive: true}
	state := newMemStateRepo()
	state.due = []domain.BossState{{NID: 706, ChannelID: 3}}
	bc := &capturingBroadcaster{}
	svc := New(state, mapConfigGetter{706: cfg}, bc, stubPayloads{}, nil)
	sched := NewScheduler(svc, state, nil)

	if err := sched.tickOnce(context.Background()); err != nil {
		t.Fatalf("tickOnce: %v", err)
	}

	if !state.alive[domain.BossKey{NID: 706, ChannelID: 3}] {
		t.Fatalf("expected MarkAlive(706,3) to be called")
	}
	if len(bc.calls) != 1 || bc.calls[0] != CallbackBossOn {
		t.Fatalf("expected single onBossOn broadcast, got %v", bc.calls)
	}
}

func TestScheduler_TickSkipsBroadcastWhenNoChange(t *testing.T) {
	cfg := domain.BossConfig{NID: 706, MapID: 3, Level: 5, Kind: domain.Ground, Tier: domain.TierNormal, IsActive: true}
	state := newMemStateRepo()
	state.due = []domain.BossState{{NID: 706, ChannelID: 3}}
	state.markAliveChanged = false
	bc := &capturingBroadcaster{}
	svc := New(state, mapConfigGetter{706: cfg}, bc, stubPayloads{}, nil)
	sched := NewScheduler(svc, state, nil)

	if err := sched.tickOnce(context.Background()); err != nil {
		t.Fatalf("tickOnce: %v", err)
	}

	if len(bc.calls) != 0 {
		t.Fatalf("expected no broadcast when MarkAlive was a no-op, got %v", bc.calls)
	}
}
