// Open-sourced by BaoLT

// BattleService runs background tasks for battle management.
// Periodically checks for turn timeouts, processes NPC turns, and cleans up stale battles.
// Uses ticker pattern with graceful shutdown via stopChan.
package battle

import (
	"context"
	"sync"
	"time"

	"mcgame-server/internal/domain/combat"

	"go.uber.org/zap"
)

const (
	DefaultTurnTimeout     = 30 * time.Second
	DefaultPVPTurnTimeout  = 25 * time.Second
	DefaultCheckInterval   = 5 * time.Second
	DefaultStaleTimeout    = 10 * time.Minute
	DefaultCleanupInterval = 1 * time.Minute
)

type BattleRepositoryInterface interface {
	GetAllActive() []*combat.Battle
	GetByID(battleID string) (*combat.Battle, error)
	Remove(battleID string) error
}

type TurnTimeoutHandler interface {
	HandleTurnTimeout(ctx context.Context, battle *combat.Battle, participantID string) (*combat.RoundResult, error)
}

type BattleFinisher interface {
	EndBattle(ctx context.Context, battle *combat.Battle, winner combat.Side) *combat.BattleResult
}

type ConnectionSender interface {
	SendCallback(method string, args ...interface{}) error
}

type BattleStats struct {
	ActiveBattles   int
	TimeoutCount    int
	CleanedUpCount  int
	ProcessedRounds int
}

type Config struct {
	TurnTimeout     time.Duration
	CheckInterval   time.Duration
	StaleTimeout    time.Duration
	CleanupInterval time.Duration
}

func DefaultConfig() Config {
	return Config{
		TurnTimeout:     DefaultTurnTimeout,
		CheckInterval:   DefaultCheckInterval,
		StaleTimeout:    DefaultStaleTimeout,
		CleanupInterval: DefaultCleanupInterval,
	}
}

type deadlineEntry struct {
	deadline time.Time
	conn     ConnectionSender
}

type Service struct {
	battleRepo     BattleRepositoryInterface
	timeoutHandler TurnTimeoutHandler
	battleFinisher BattleFinisher
	config         Config
	stopChan       chan struct{}
	stopOnce       sync.Once
	logger         *zap.Logger

	mu    sync.RWMutex
	stats BattleStats

	turnDeadlines map[string]deadlineEntry
	deadlineMu    sync.RWMutex
}

func NewService(
	repo BattleRepositoryInterface,
	timeoutHandler TurnTimeoutHandler,
	config Config,
	logger *zap.Logger,
) *Service {
	return &Service{
		battleRepo:     repo,
		timeoutHandler: timeoutHandler,
		config:         config,
		stopChan:       make(chan struct{}),
		logger:         logger,
		turnDeadlines:  make(map[string]deadlineEntry),
	}
}

func (s *Service) SetBattleFinisher(finisher BattleFinisher) {
	s.battleFinisher = finisher
}

func (s *Service) Start(ctx context.Context) {
	checkTicker := time.NewTicker(s.config.CheckInterval)
	cleanupTicker := time.NewTicker(s.config.CleanupInterval)

	go func() {
		defer checkTicker.Stop()
		defer cleanupTicker.Stop()

		for {
			select {
			case <-checkTicker.C:
				s.checkTurnTimeouts(ctx)
			case <-cleanupTicker.C:
				s.cleanupStaleBattles(ctx)
			case <-s.stopChan:
				s.logger.Info("BattleService stopping")
				return
			case <-ctx.Done():
				s.logger.Info("BattleService context cancelled")
				return
			}
		}
	}()

	s.logger.Info("BattleService started",
		zap.Duration("check_interval", s.config.CheckInterval),
		zap.Duration("turn_timeout", s.config.TurnTimeout),
		zap.Duration("stale_timeout", s.config.StaleTimeout))
}

func (s *Service) Stop() {
	s.stopOnce.Do(func() {
		close(s.stopChan)
	})
}

func (s *Service) SetTurnDeadline(battleID string, participantID string, conn ...ConnectionSender) {
	s.SetTurnDeadlineWithDuration(battleID, participantID, s.config.TurnTimeout, conn...)
}

func (s *Service) SetTurnDeadlineWithDuration(battleID string, participantID string, duration time.Duration, conn ...ConnectionSender) {
	s.deadlineMu.Lock()
	defer s.deadlineMu.Unlock()

	key := battleID + ":" + participantID
	entry := deadlineEntry{deadline: time.Now().Add(duration)}
	if len(conn) > 0 {
		entry.conn = conn[0]
	}
	s.turnDeadlines[key] = entry
}

func (s *Service) ClearTurnDeadline(battleID string, participantID string) {
	s.deadlineMu.Lock()
	defer s.deadlineMu.Unlock()

	key := battleID + ":" + participantID
	delete(s.turnDeadlines, key)
}

func (s *Service) ClearBattleDeadlines(battleID string) {
	s.deadlineMu.Lock()
	defer s.deadlineMu.Unlock()

	for key := range s.turnDeadlines {
		if len(key) > len(battleID) && key[:len(battleID)+1] == battleID+":" {
			delete(s.turnDeadlines, key)
		}
	}
}

func (s *Service) GetRemainingTime(battleID string, participantID string) time.Duration {
	s.deadlineMu.RLock()
	defer s.deadlineMu.RUnlock()

	key := battleID + ":" + participantID
	entry, exists := s.turnDeadlines[key]
	if !exists {
		return 0
	}

	remaining := time.Until(entry.deadline)
	if remaining < 0 {
		return 0
	}
	return remaining
}

func (s *Service) checkTurnTimeouts(ctx context.Context) {
	s.deadlineMu.Lock()
	now := time.Now()
	timedOut := make(map[string]struct {
		battleID      string
		participantID string
		conn          ConnectionSender
	})

	for key, entry := range s.turnDeadlines {
		if now.After(entry.deadline) {
			parts := splitKey(key)
			if len(parts) == 2 {
				if _, exists := timedOut[parts[0]]; !exists {
					timedOut[parts[0]] = struct {
						battleID      string
						participantID string
						conn          ConnectionSender
					}{parts[0], parts[1], entry.conn}
				}
			}
			delete(s.turnDeadlines, key)
		}
	}
	s.deadlineMu.Unlock()

	for _, t := range timedOut {
		battle, err := s.battleRepo.GetByID(t.battleID)
		if err != nil {
			continue
		}

		if !battle.IsActive() {
			continue
		}

		if s.timeoutHandler != nil {
			result, err := s.timeoutHandler.HandleTurnTimeout(ctx, battle, t.participantID)
			if err != nil {
				s.logger.Warn("Failed to handle turn timeout",
					zap.String("battle_id", t.battleID),
					zap.String("participant_id", t.participantID),
					zap.Error(err))
				continue
			}

			s.incrementTimeoutCount()
			s.logger.Debug("Turn timeout handled",
				zap.String("battle_id", t.battleID),
				zap.String("participant_id", t.participantID))

			if t.conn != nil && result != nil {
				s.sendTimeoutBattlePlayList(t.conn, battle, result)
			}
		}
	}
}

func (s *Service) ProcessPendingRound(ctx context.Context, battle *combat.Battle, participantID string) error {
	if battle == nil || !battle.IsActive() || s.timeoutHandler == nil {
		return nil
	}

	result, err := s.timeoutHandler.HandleTurnTimeout(ctx, battle, participantID)
	if err != nil {
		return err
	}
	if result == nil {
		return nil
	}

	s.sendTimeoutBattlePlayList(nil, battle, result)
	return nil
}

func (s *Service) finalizeTimedOutBattle(ctx context.Context, battle *combat.Battle, result *combat.RoundResult) {
	if battle == nil || result == nil || !result.BattleEnded {
		return
	}

	if s.battleFinisher != nil {
		s.battleFinisher.EndBattle(ctx, battle, result.Winner)
	} else if battle.Result == nil {
		battle.End(&combat.BattleResult{
			WinnerSide:       result.Winner,
			ItemRewards:      []combat.ItemDrop{},
			PetRewards:       []combat.PetReward{},
			CharacterRewards: map[int64]*combat.CharacterReward{},
		})
	}

	battle.SetRoundComplete()
	s.ClearBattleDeadlines(battle.ID)
}

func (s *Service) sendTimeoutBattlePlayList(conn ConnectionSender, battle *combat.Battle, result *combat.RoundResult) {
	playbackRounds := combat.BuildPlaybackRounds(result.Actions)

	if result.BattleEnded {
		winType := 0
		if result.Winner == combat.SidePlayer {
			winType = 1
		}
		battleResult := 1
		if result.PlayerFled {
			battleResult = 2
		}
		playbackRounds = append(playbackRounds, []map[string]interface{}{{
			"end":    true,
			"type":   winType,
			"result": battleResult,
		}})

		if conn != nil {
			for _, p := range battle.Participants {
				if p.Side != combat.SidePlayer || p.EntityType != combat.ParticipantTypeCharacter {
					continue
				}
				if err := conn.SendCallback("onSetCharState", map[string]interface{}{"cid": p.ID, "state": 1}); err != nil {
					s.logger.Warn("Failed to send onSetCharState after timeout battle end",
						zap.String("battle_id", battle.ID),
						zap.String("cid", p.ID),
						zap.Error(err))
				}
				break
			}
		}
	}

	nestedActions := make([]interface{}, 0, len(playbackRounds))
	for _, round := range playbackRounds {
		nestedActions = append(nestedActions, round)
	}

	if conn != nil {
		if err := conn.SendCallback("onBattlePlayList", nestedActions); err != nil {
			s.logger.Error("Failed to send onBattlePlayList after timeout",
				zap.String("battle_id", battle.ID),
				zap.Error(err))
		}
	}
	battle.BroadcastToWatchers("onBattlePlayList", nestedActions)

	s.logger.Info("Sent onBattlePlayList after timeout",
		zap.String("battle_id", battle.ID),
		zap.Int("actions", len(nestedActions)))
}

func (s *Service) cleanupStaleBattles(ctx context.Context) {
	battles := s.battleRepo.GetAllActive()
	now := time.Now()
	cleanedUp := 0

	for _, battle := range battles {
		if battle.StartedAt == nil {
			continue
		}

		if now.Sub(*battle.StartedAt) > s.config.StaleTimeout {
			battle.Cancel()
			if err := s.battleRepo.Remove(battle.ID); err != nil {
				s.logger.Warn("Failed to remove stale battle",
					zap.String("battle_id", battle.ID),
					zap.Error(err))
				continue
			}

			s.ClearBattleDeadlines(battle.ID)
			cleanedUp++

			s.logger.Info("Stale battle cleaned up",
				zap.String("battle_id", battle.ID),
				zap.Int("round", battle.CurrentRound))
		}
	}

	if cleanedUp > 0 {
		s.mu.Lock()
		s.stats.CleanedUpCount += cleanedUp
		s.mu.Unlock()
	}
}

func (s *Service) incrementTimeoutCount() {
	s.mu.Lock()
	defer s.mu.Unlock()
	s.stats.TimeoutCount++
}

func (s *Service) GetStats() BattleStats {
	s.mu.RLock()
	defer s.mu.RUnlock()

	battles := s.battleRepo.GetAllActive()
	return BattleStats{
		ActiveBattles:   len(battles),
		TimeoutCount:    s.stats.TimeoutCount,
		CleanedUpCount:  s.stats.CleanedUpCount,
		ProcessedRounds: s.stats.ProcessedRounds,
	}
}

func (s *Service) OnRoundProcessed() {
	s.mu.Lock()
	defer s.mu.Unlock()
	s.stats.ProcessedRounds++
}

func splitKey(key string) []string {
	for i := len(key) - 1; i >= 0; i-- {
		if key[i] == ':' {
			return []string{key[:i], key[i+1:]}
		}
	}
	return []string{key}
}
