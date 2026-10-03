// Open-sourced by BaoLT

// Scheduler ticks every TickInterval and spawns due boss rows.
// Broadcasts onBossOn to (channel, map) for each spawn that actually flipped from dead to alive.
package scheduleboss

import (
	"context"
	"sync"
	"time"

	"go.uber.org/zap"

	domain "mcgame-server/internal/domain/scheduleboss"
)

type Scheduler struct {
	svc      *Service
	state    domain.StateRepo
	logger   *zap.Logger
	interval time.Duration

	startOnce sync.Once
	stopOnce  sync.Once
	stopCh    chan struct{}
	wg        sync.WaitGroup
}

func NewScheduler(svc *Service, state domain.StateRepo, logger *zap.Logger) *Scheduler {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Scheduler{
		svc:      svc,
		state:    state,
		logger:   logger,
		interval: 30 * time.Second,
		stopCh:   make(chan struct{}),
	}
}

func (s *Scheduler) WithInterval(d time.Duration) *Scheduler {
	if d > 0 {
		s.interval = d
	}
	return s
}

func (s *Scheduler) Start(ctx context.Context) {
	s.startOnce.Do(func() {
		s.wg.Add(1)
		go s.run(ctx)
	})
}

func (s *Scheduler) Stop() {
	s.stopOnce.Do(func() { close(s.stopCh) })
	s.wg.Wait()
}

func (s *Scheduler) run(ctx context.Context) {
	defer s.wg.Done()
	t := time.NewTicker(s.interval)
	defer t.Stop()
	for {
		select {
		case <-ctx.Done():
			return
		case <-s.stopCh:
			return
		case <-t.C:
			if err := s.tickOnce(ctx); err != nil {
				s.logger.Warn("scheduleboss tick error", zap.Error(err))
			}
		}
	}
}

func (s *Scheduler) tickOnce(ctx context.Context) error {
	now := s.svc.clock()
	due, err := s.state.FetchDueSpawns(ctx, now)
	if err != nil {
		return err
	}
	for _, row := range due {
		cfg, ok := s.svc.configs.LookupConfig(row.NID)
		if !ok || !cfg.Eligible() {
			continue
		}
		changed, err := s.state.MarkAlive(ctx, row.NID, row.ChannelID, now)
		if err != nil {
			s.logger.Warn("MarkAlive failed", zap.Int("nid", row.NID), zap.Error(err))
			continue
		}
		if !changed {
			continue
		}
		if s.svc.scene == nil || s.svc.payloads == nil {
			continue
		}
		payload := s.svc.payloads.BuildBossOn(*cfg)
		s.svc.scene.BroadcastToScene(row.ChannelID, cfg.MapID, 0, CallbackBossOn, payload)
	}
	return nil
}
