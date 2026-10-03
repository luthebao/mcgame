// Open-sourced by BaoLT

// Unit tests for CenterService background persistence worker.
// Tests Start/Stop lifecycle, periodic saves, and graceful shutdown.
package center

import (
	"context"
	"sync"
	"sync/atomic"
	"testing"
	"time"

	"go.uber.org/zap/zaptest"
)

type mockPlayerCache struct {
	mu            sync.Mutex
	saveCallCount int32
	stats         map[string]int
	saveErr       error
	saveDelay     time.Duration
}

func newMockPlayerCache() *mockPlayerCache {
	return &mockPlayerCache{
		stats: map[string]int{"cached_players": 0, "dirty_players": 0},
	}
}

func (m *mockPlayerCache) SaveAllDirty(ctx context.Context) (*SaveStats, error) {
	if m.saveDelay > 0 {
		time.Sleep(m.saveDelay)
	}
	atomic.AddInt32(&m.saveCallCount, 1)
	if m.saveErr != nil {
		return nil, m.saveErr
	}
	return &SaveStats{
		TotalCached: 1,
		DirtyCount:  1,
		SavedCount:  1,
	}, nil
}

func (m *mockPlayerCache) Stats() map[string]int {
	m.mu.Lock()
	defer m.mu.Unlock()
	return m.stats
}

func (m *mockPlayerCache) getSaveCallCount() int {
	return int(atomic.LoadInt32(&m.saveCallCount))
}

func TestNewService(t *testing.T) {
	logger := zaptest.NewLogger(t)
	cache := newMockPlayerCache()

	service := NewService(cache, 60*time.Second, logger)

	if service == nil {
		t.Fatal("NewService returned nil")
	}
	if service.persistInterval != 60*time.Second {
		t.Errorf("expected persist interval 60s, got %v", service.persistInterval)
	}
}

func TestService_StartStop(t *testing.T) {
	logger := zaptest.NewLogger(t)
	cache := newMockPlayerCache()

	service := NewService(cache, 50*time.Millisecond, logger)

	ctx := context.Background()
	service.Start(ctx)

	time.Sleep(80 * time.Millisecond)

	service.Stop()

	time.Sleep(50 * time.Millisecond)

	if cache.getSaveCallCount() < 1 {
		t.Error("expected at least 1 save call on stop (final save)")
	}
}

func TestService_PeriodicSave(t *testing.T) {
	logger := zaptest.NewLogger(t)
	cache := newMockPlayerCache()

	service := NewService(cache, 50*time.Millisecond, logger)

	ctx := context.Background()
	service.Start(ctx)

	time.Sleep(180 * time.Millisecond)

	service.Stop()

	callCount := cache.getSaveCallCount()
	if callCount < 3 {
		t.Errorf("expected at least 3 save calls (2 periodic + 1 final), got %d", callCount)
	}
}

func TestService_ContextCancellation(t *testing.T) {
	logger := zaptest.NewLogger(t)
	cache := newMockPlayerCache()

	service := NewService(cache, 100*time.Millisecond, logger)

	ctx, cancel := context.WithCancel(context.Background())
	service.Start(ctx)

	time.Sleep(50 * time.Millisecond)
	cancel()

	time.Sleep(50 * time.Millisecond)

	if cache.getSaveCallCount() < 1 {
		t.Error("expected at least 1 save call on context cancellation")
	}
}

func TestService_StopIdempotent(t *testing.T) {
	logger := zaptest.NewLogger(t)
	cache := newMockPlayerCache()

	service := NewService(cache, 100*time.Millisecond, logger)

	ctx := context.Background()
	service.Start(ctx)

	service.Stop()
	service.Stop()
	service.Stop()
}

func TestService_SaveError(t *testing.T) {
	logger := zaptest.NewLogger(t)
	cache := newMockPlayerCache()
	cache.saveErr = context.DeadlineExceeded

	service := NewService(cache, 50*time.Millisecond, logger)

	ctx := context.Background()
	service.Start(ctx)

	time.Sleep(80 * time.Millisecond)

	service.Stop()

	if cache.getSaveCallCount() < 1 {
		t.Error("expected save to be attempted even with errors")
	}
}

func TestService_FinalSaveOnStop(t *testing.T) {
	logger := zaptest.NewLogger(t)
	cache := newMockPlayerCache()

	service := NewService(cache, 10*time.Second, logger)

	ctx := context.Background()
	service.Start(ctx)

	time.Sleep(50 * time.Millisecond)

	countBefore := cache.getSaveCallCount()
	service.Stop()

	time.Sleep(50 * time.Millisecond)

	countAfter := cache.getSaveCallCount()
	if countAfter <= countBefore {
		t.Error("expected final save on stop")
	}
}

func TestSaveStats(t *testing.T) {
	stats := &SaveStats{
		TotalCached: 10,
		DirtyCount:  5,
		SavedCount:  3,
	}

	if stats.TotalCached != 10 {
		t.Errorf("expected TotalCached 10, got %d", stats.TotalCached)
	}
	if stats.DirtyCount != 5 {
		t.Errorf("expected DirtyCount 5, got %d", stats.DirtyCount)
	}
	if stats.SavedCount != 3 {
		t.Errorf("expected SavedCount 3, got %d", stats.SavedCount)
	}
}
