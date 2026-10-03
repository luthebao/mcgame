// Open-sourced by BaoLT

// CenterService runs background tasks for player data persistence.
// Periodically saves dirty player data from cache to database.
// Uses ticker pattern with graceful shutdown via stopChan.
package center

import (
	"context"
	"sync"
	"time"

	"go.uber.org/zap"
)

type PlayerCacheInterface interface {
	SaveAllDirty(ctx context.Context) (*SaveStats, error)
	Stats() map[string]int
}

type SaveStats struct {
	TotalCached int
	DirtyCount  int
	SavedCount  int
}

type Service struct {
	playerCache     PlayerCacheInterface
	persistInterval time.Duration
	stopChan        chan struct{}
	stopOnce        sync.Once
	logger          *zap.Logger
}

func NewService(cache PlayerCacheInterface, interval time.Duration, logger *zap.Logger) *Service {
	return &Service{
		playerCache:     cache,
		persistInterval: interval,
		stopChan:        make(chan struct{}),
		logger:          logger,
	}
}

func (s *Service) Start(ctx context.Context) {
	ticker := time.NewTicker(s.persistInterval)
	go func() {
		defer ticker.Stop()
		for {
			select {
			case <-ticker.C:
				s.persistAllCachedPlayers(ctx)
			case <-s.stopChan:
				s.logger.Info("CenterService stopping, performing final save")
				s.persistAllCachedPlayers(context.Background())
				return
			case <-ctx.Done():
				s.logger.Info("CenterService context cancelled, performing final save")
				s.persistAllCachedPlayers(context.Background())
				return
			}
		}
	}()
	s.logger.Info("CenterService started",
		zap.Duration("persist_interval", s.persistInterval))
}

func (s *Service) Stop() {
	s.stopOnce.Do(func() {
		close(s.stopChan)
	})
}

func (s *Service) persistAllCachedPlayers(ctx context.Context) {
	stats, err := s.playerCache.SaveAllDirty(ctx)
	if err != nil {
		s.logger.Error("Failed to persist cached players", zap.Error(err))
		return
	}
	if stats.SavedCount > 0 || stats.DirtyCount > 0 {
		s.logger.Info("Periodic persistence completed",
			zap.Int("total_cached", stats.TotalCached),
			zap.Int("dirty_count", stats.DirtyCount),
			zap.Int("saved_count", stats.SavedCount))
	}
}
