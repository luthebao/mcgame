// Open-sourced by BaoLT

// Unit tests for BattleService background battle management worker.
// Tests Start/Stop lifecycle, turn timeouts, and stale battle cleanup.
package battle

import (
	"context"
	"sync"
	"sync/atomic"
	"testing"
	"time"

	"mcgame-server/internal/domain/combat"

	"go.uber.org/zap/zaptest"
)

type mockBattleRepo struct {
	mu      sync.RWMutex
	battles map[string]*combat.Battle
}

func newMockBattleRepo() *mockBattleRepo {
	return &mockBattleRepo{
		battles: make(map[string]*combat.Battle),
	}
}

func (r *mockBattleRepo) GetAllActive() []*combat.Battle {
	r.mu.RLock()
	defer r.mu.RUnlock()
	result := make([]*combat.Battle, 0)
	for _, b := range r.battles {
		if b.IsActive() {
			result = append(result, b)
		}
	}
	return result
}

func (r *mockBattleRepo) GetByID(battleID string) (*combat.Battle, error) {
	r.mu.RLock()
	defer r.mu.RUnlock()
	if b, ok := r.battles[battleID]; ok {
		return b, nil
	}
	return nil, nil
}

func (r *mockBattleRepo) Remove(battleID string) error {
	r.mu.Lock()
	defer r.mu.Unlock()
	delete(r.battles, battleID)
	return nil
}

func (r *mockBattleRepo) Store(b *combat.Battle) {
	r.mu.Lock()
	defer r.mu.Unlock()
	r.battles[b.ID] = b
}

func (r *mockBattleRepo) Count() int {
	r.mu.RLock()
	defer r.mu.RUnlock()
	return len(r.battles)
}

type mockTimeoutHandler struct {
	mu              sync.Mutex
	timeoutCalls    int32
	lastBattleID    string
	lastParticipant string
}

type mockBattleFinisher struct {
	called         int32
	lastBattleID   string
	lastWinner     combat.Side
	lastBattleTime int
}

func (h *mockTimeoutHandler) HandleTurnTimeout(ctx context.Context, battle *combat.Battle, participantID string) (*combat.RoundResult, error) {
	atomic.AddInt32(&h.timeoutCalls, 1)
	h.mu.Lock()
	defer h.mu.Unlock()
	h.lastBattleID = battle.ID
	h.lastParticipant = participantID
	return &combat.RoundResult{Round: battle.CurrentRound}, nil
}

func (h *mockTimeoutHandler) getTimeoutCalls() int {
	return int(atomic.LoadInt32(&h.timeoutCalls))
}

func (m *mockBattleFinisher) EndBattle(ctx context.Context, battle *combat.Battle, winner combat.Side) *combat.BattleResult {
	atomic.AddInt32(&m.called, 1)
	m.lastBattleID = battle.ID
	m.lastWinner = winner
	result := &combat.BattleResult{
		WinnerSide:       winner,
		ItemRewards:      []combat.ItemDrop{},
		PetRewards:       []combat.PetReward{},
		CharacterRewards: map[int64]*combat.CharacterReward{},
	}
	battle.End(result)
	if battle.Result != nil {
		m.lastBattleTime = battle.Result.BattleTime
	}
	return result
}

func (m *mockBattleFinisher) calls() int {
	return int(atomic.LoadInt32(&m.called))
}

func TestNewService(t *testing.T) {
	logger := zaptest.NewLogger(t)
	repo := newMockBattleRepo()
	config := DefaultConfig()

	service := NewService(repo, nil, config, logger)

	if service == nil {
		t.Fatal("NewService returned nil")
	}
	if service.config.TurnTimeout != DefaultTurnTimeout {
		t.Errorf("expected turn timeout %v, got %v", DefaultTurnTimeout, service.config.TurnTimeout)
	}
}

func TestService_StartStop(t *testing.T) {
	logger := zaptest.NewLogger(t)
	repo := newMockBattleRepo()
	config := Config{
		TurnTimeout:     100 * time.Millisecond,
		CheckInterval:   50 * time.Millisecond,
		StaleTimeout:    1 * time.Minute,
		CleanupInterval: 1 * time.Minute,
	}

	service := NewService(repo, nil, config, logger)
	ctx := context.Background()
	service.Start(ctx)

	time.Sleep(80 * time.Millisecond)
	service.Stop()

	time.Sleep(50 * time.Millisecond)
}

func TestService_StopIdempotent(t *testing.T) {
	logger := zaptest.NewLogger(t)
	repo := newMockBattleRepo()
	config := DefaultConfig()

	service := NewService(repo, nil, config, logger)
	ctx := context.Background()
	service.Start(ctx)

	service.Stop()
	service.Stop()
	service.Stop()
}

func TestService_ContextCancellation(t *testing.T) {
	logger := zaptest.NewLogger(t)
	repo := newMockBattleRepo()
	config := Config{
		TurnTimeout:     100 * time.Millisecond,
		CheckInterval:   50 * time.Millisecond,
		StaleTimeout:    1 * time.Minute,
		CleanupInterval: 1 * time.Minute,
	}

	service := NewService(repo, nil, config, logger)
	ctx, cancel := context.WithCancel(context.Background())
	service.Start(ctx)

	time.Sleep(50 * time.Millisecond)
	cancel()

	time.Sleep(50 * time.Millisecond)
}

func TestService_SetAndClearDeadline(t *testing.T) {
	logger := zaptest.NewLogger(t)
	repo := newMockBattleRepo()
	config := Config{
		TurnTimeout:     5 * time.Second,
		CheckInterval:   50 * time.Millisecond,
		StaleTimeout:    1 * time.Minute,
		CleanupInterval: 1 * time.Minute,
	}

	service := NewService(repo, nil, config, logger)

	service.SetTurnDeadline("battle1", "player1")
	remaining := service.GetRemainingTime("battle1", "player1")

	if remaining <= 0 || remaining > 5*time.Second {
		t.Errorf("expected remaining time between 0 and 5s, got %v", remaining)
	}

	service.ClearTurnDeadline("battle1", "player1")
	remaining = service.GetRemainingTime("battle1", "player1")

	if remaining != 0 {
		t.Errorf("expected remaining time 0 after clear, got %v", remaining)
	}
}

func TestService_TurnTimeout(t *testing.T) {
	logger := zaptest.NewLogger(t)
	repo := newMockBattleRepo()
	handler := &mockTimeoutHandler{}
	config := Config{
		TurnTimeout:     50 * time.Millisecond,
		CheckInterval:   30 * time.Millisecond,
		StaleTimeout:    1 * time.Minute,
		CleanupInterval: 1 * time.Minute,
	}

	battle := combat.NewBattle(combat.BattleTypePVE, 1)
	battle.Start()
	repo.Store(battle)

	service := NewService(repo, handler, config, logger)
	ctx := context.Background()
	service.Start(ctx)

	service.SetTurnDeadline(battle.ID, "player1")

	time.Sleep(150 * time.Millisecond)

	service.Stop()

	if handler.getTimeoutCalls() < 1 {
		t.Error("expected at least 1 timeout call")
	}
}

func TestService_CleanupStaleBattles(t *testing.T) {
	logger := zaptest.NewLogger(t)
	repo := newMockBattleRepo()
	config := Config{
		TurnTimeout:     100 * time.Millisecond,
		CheckInterval:   50 * time.Millisecond,
		StaleTimeout:    50 * time.Millisecond,
		CleanupInterval: 30 * time.Millisecond,
	}

	battle := combat.NewBattle(combat.BattleTypePVE, 1)
	battle.Start()
	repo.Store(battle)

	if repo.Count() != 1 {
		t.Fatalf("expected 1 battle in repo, got %d", repo.Count())
	}

	service := NewService(repo, nil, config, logger)
	ctx := context.Background()
	service.Start(ctx)

	time.Sleep(200 * time.Millisecond)

	service.Stop()

	if repo.Count() != 0 {
		t.Errorf("expected stale battle to be cleaned up, got %d remaining", repo.Count())
	}
}

func TestService_GetStats(t *testing.T) {
	logger := zaptest.NewLogger(t)
	repo := newMockBattleRepo()
	config := DefaultConfig()

	service := NewService(repo, nil, config, logger)

	battle := combat.NewBattle(combat.BattleTypePVE, 1)
	battle.Start()
	repo.Store(battle)

	stats := service.GetStats()

	if stats.ActiveBattles != 1 {
		t.Errorf("expected 1 active battle, got %d", stats.ActiveBattles)
	}
}

func TestService_OnRoundProcessed(t *testing.T) {
	logger := zaptest.NewLogger(t)
	repo := newMockBattleRepo()
	config := DefaultConfig()

	service := NewService(repo, nil, config, logger)

	for i := 0; i < 5; i++ {
		service.OnRoundProcessed()
	}

	stats := service.GetStats()
	if stats.ProcessedRounds != 5 {
		t.Errorf("expected 5 processed rounds, got %d", stats.ProcessedRounds)
	}
}

func TestService_ClearBattleDeadlines(t *testing.T) {
	logger := zaptest.NewLogger(t)
	repo := newMockBattleRepo()
	config := DefaultConfig()

	service := NewService(repo, nil, config, logger)

	service.SetTurnDeadline("battle1", "player1")
	service.SetTurnDeadline("battle1", "player2")
	service.SetTurnDeadline("battle2", "player3")

	service.ClearBattleDeadlines("battle1")

	if service.GetRemainingTime("battle1", "player1") != 0 {
		t.Error("expected battle1:player1 deadline to be cleared")
	}
	if service.GetRemainingTime("battle1", "player2") != 0 {
		t.Error("expected battle1:player2 deadline to be cleared")
	}
	if service.GetRemainingTime("battle2", "player3") == 0 {
		t.Error("expected battle2:player3 deadline to still exist")
	}
}

func TestSplitKey(t *testing.T) {
	tests := []struct {
		key      string
		expected []string
	}{
		{"battle:player", []string{"battle", "player"}},
		{"battle-id:player-id", []string{"battle-id", "player-id"}},
		{"uuid-with-colons:123:456:player", []string{"uuid-with-colons:123:456", "player"}},
		{"nodelimiter", []string{"nodelimiter"}},
	}

	for _, tt := range tests {
		result := splitKey(tt.key)
		if len(result) != len(tt.expected) {
			t.Errorf("splitKey(%s) = %v, expected %v", tt.key, result, tt.expected)
			continue
		}
		for i := range result {
			if result[i] != tt.expected[i] {
				t.Errorf("splitKey(%s)[%d] = %s, expected %s", tt.key, i, result[i], tt.expected[i])
			}
		}
	}
}

func TestDefaultConfig(t *testing.T) {
	config := DefaultConfig()

	if config.TurnTimeout != DefaultTurnTimeout {
		t.Errorf("expected TurnTimeout %v, got %v", DefaultTurnTimeout, config.TurnTimeout)
	}
	if config.CheckInterval != DefaultCheckInterval {
		t.Errorf("expected CheckInterval %v, got %v", DefaultCheckInterval, config.CheckInterval)
	}
	if config.StaleTimeout != DefaultStaleTimeout {
		t.Errorf("expected StaleTimeout %v, got %v", DefaultStaleTimeout, config.StaleTimeout)
	}
	if config.CleanupInterval != DefaultCleanupInterval {
		t.Errorf("expected CleanupInterval %v, got %v", DefaultCleanupInterval, config.CleanupInterval)
	}
}

type TurnTimeoutHandlerFunc func(ctx context.Context, battle *combat.Battle, participantID string) (*combat.RoundResult, error)

func (fn TurnTimeoutHandlerFunc) HandleTurnTimeout(ctx context.Context, battle *combat.Battle, participantID string) (*combat.RoundResult, error) {
	return fn(ctx, battle, participantID)
}
