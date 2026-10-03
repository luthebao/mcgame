// Open-sourced by BaoLT

// Application service for boss loot.
// Loads rows from data.data_tbl_boss_loot at boot and serves filtered lookups
// at battle-end time. Mirrors the scheduleboss.ConfigCache pattern.
// Daily-id → schedule-nid resolution is cached lazily through MappingRepo so the
// daily boss handler does not need a separate dependency on the canonical registry.
package bossloot

import (
	"context"
	"sync"

	"go.uber.org/zap"

	domain "mcgame-server/internal/domain/bossloot"
)

type Service struct {
	logger    *zap.Logger
	config    domain.ConfigRepo
	mapping   domain.MappingRepo
	byBoss    map[int][]domain.LootEntry
	dailyResolved sync.Map
}

type dailyResolution struct {
	NID  int
	Tier string
}

func NewService(config domain.ConfigRepo, mapping domain.MappingRepo, logger *zap.Logger) *Service {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Service{
		logger:  logger,
		config:  config,
		mapping: mapping,
		byBoss:  make(map[int][]domain.LootEntry),
	}
}

func (s *Service) Load(ctx context.Context) error {
	entries, err := s.config.List(ctx)
	if err != nil {
		return err
	}
	byBoss := make(map[int][]domain.LootEntry, len(entries))
	for _, e := range entries {
		byBoss[e.BossNID] = append(byBoss[e.BossNID], e)
	}
	s.byBoss = byBoss
	s.logger.Info("boss loot loaded",
		zap.Int("entry_count", len(entries)),
		zap.Int("boss_count", len(byBoss)))
	return nil
}

func (s *Service) EntriesForBoss(bossNID int, source domain.Source, tier string) []domain.LootEntry {
	raw := s.byBoss[bossNID]
	if len(raw) == 0 {
		return nil
	}
	out := make([]domain.LootEntry, 0, len(raw))
	for _, e := range raw {
		if !e.MatchesSource(source) || !e.MatchesTier(tier) {
			continue
		}
		out = append(out, e)
	}
	return out
}

func (s *Service) ResolveBossNIDByDailyID(ctx context.Context, dailyBossID int) (int, string, bool) {
	if dailyBossID <= 0 {
		return 0, "", false
	}
	if cached, ok := s.dailyResolved.Load(dailyBossID); ok {
		if res, ok := cached.(dailyResolution); ok && res.NID > 0 {
			return res.NID, res.Tier, true
		}
		return 0, "", false
	}
	if s.mapping == nil {
		return 0, "", false
	}
	nid, tier, found, err := s.mapping.LookupScheduleNIDByDailyID(ctx, dailyBossID)
	if err != nil {
		s.logger.Warn("daily_boss_id lookup failed",
			zap.Int("daily_boss_id", dailyBossID),
			zap.Error(err))
		return 0, "", false
	}
	if !found {
		s.dailyResolved.Store(dailyBossID, dailyResolution{})
		return 0, "", false
	}
	s.dailyResolved.Store(dailyBossID, dailyResolution{NID: nid, Tier: tier})
	return nid, tier, true
}
