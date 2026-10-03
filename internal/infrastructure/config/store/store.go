// Open-sourced by BaoLT

// Live config Store backed by Postgres tables under public schema.
// Holds typed snapshots refreshed via LISTEN/NOTIFY for sub-second propagation.
// All accessors are lock-free reads of an immutable snapshot value.
package store

import (
	"context"
	"encoding/json"
	"fmt"
	"strings"
	"sync"
	"time"

	"github.com/jackc/pgx/v5/pgxpool"
	"go.uber.org/zap"
)

type GatewayLineStatusHandler func(line GatewayLine, oldStatus, newStatus string)
type MaintenanceModeHandler func(oldEnabled, newEnabled bool)

type Store struct {
	pool *pgxpool.Pool
	log  *zap.Logger

	mu   sync.RWMutex
	snap snapshot

	handlerMu                sync.Mutex
	gatewayLineStatusHandler GatewayLineStatusHandler
	maintenanceModeHandler   MaintenanceModeHandler

	cancel context.CancelFunc
	done   chan struct{}
}

func New(ctx context.Context, pool *pgxpool.Pool, log *zap.Logger) (*Store, error) {
	s := &Store{
		pool: pool,
		log:  log,
		snap: defaultSnapshot(),
		done: make(chan struct{}),
	}

	if err := s.refreshAll(ctx); err != nil {
		return nil, fmt.Errorf("initial config load: %w", err)
	}

	listenCtx, cancel := context.WithCancel(context.Background())
	s.cancel = cancel
	go s.runListener(listenCtx)

	return s, nil
}

func (s *Store) Close() {
	if s.cancel != nil {
		s.cancel()
	}
	select {
	case <-s.done:
	case <-time.After(2 * time.Second):
	}
}

func (s *Store) read() snapshot {
	s.mu.RLock()
	defer s.mu.RUnlock()
	return s.snap
}

func (s *Store) write(mutate func(*snapshot)) {
	s.mu.Lock()
	defer s.mu.Unlock()
	mutate(&s.snap)
}

func (s *Store) SetGatewayLineStatusHandler(h GatewayLineStatusHandler) {
	s.handlerMu.Lock()
	s.gatewayLineStatusHandler = h
	s.handlerMu.Unlock()
}

func (s *Store) gatewayLineStatusHandlerFn() GatewayLineStatusHandler {
	s.handlerMu.Lock()
	defer s.handlerMu.Unlock()
	return s.gatewayLineStatusHandler
}

func (s *Store) SetMaintenanceModeHandler(h MaintenanceModeHandler) {
	s.handlerMu.Lock()
	s.maintenanceModeHandler = h
	s.handlerMu.Unlock()
}

func (s *Store) maintenanceModeHandlerFn() MaintenanceModeHandler {
	s.handlerMu.Lock()
	defer s.handlerMu.Unlock()
	return s.maintenanceModeHandler
}

func (s *Store) GatewayLines() []GatewayLine {
	snap := s.read()
	out := make([]GatewayLine, len(snap.Lines))
	copy(out, snap.Lines)
	return out
}

func (s *Store) GatewayLine(id int) (GatewayLine, bool) {
	snap := s.read()
	for _, line := range snap.Lines {
		if line.ID == id {
			return line, true
		}
	}
	return GatewayLine{}, false
}

func (s *Store) MaintenanceMode() bool       { return s.read().MaintenanceMode }
func (s *Store) LoginEnabled() bool          { return s.read().LoginEnabled }
func (s *Store) AnnouncementBanner() string  { return s.read().AnnouncementBanner }
func (s *Store) GlobalMaxPlayers() int       { return s.read().GlobalMaxPlayers }
func (s *Store) ExpMultiplier() float64      { return s.read().ExpMultiplier }
func (s *Store) DropMultiplier() float64     { return s.read().DropMultiplier }
func (s *Store) GoldMultiplier() float64     { return s.read().GoldMultiplier }
func (s *Store) ScheduleBossEnabled() bool   { return s.read().ScheduleBossEnabled }
func (s *Store) ScheduleBossTick() time.Duration { return s.read().ScheduleBossTick }
func (s *Store) AuditRetentionDays() int     { return s.read().AuditRetentionDays }

func (s *Store) LoginLockout() (int, time.Duration) {
	snap := s.read()
	return snap.LoginLockoutAttempts, snap.LoginLockoutWindow
}

func (s *Store) FeatureEnabled(name string) bool {
	snap := s.read()
	if v, ok := snap.FeaturesEnabled[strings.ToLower(name)]; ok {
		return v
	}
	return true
}

func (s *Store) refreshAll(ctx context.Context) error {
	if err := s.refreshGateway(ctx); err != nil {
		return fmt.Errorf("gateway_config: %w", err)
	}
	if err := s.refreshKV(ctx, TableServerSettings); err != nil {
		return fmt.Errorf("server_settings: %w", err)
	}
	if err := s.refreshKV(ctx, TableGameTuning); err != nil {
		return fmt.Errorf("game_tuning: %w", err)
	}
	if err := s.refreshKV(ctx, TableGMSettings); err != nil {
		return fmt.Errorf("gm_settings: %w", err)
	}
	return nil
}

func (s *Store) refreshGateway(ctx context.Context) error {
	rows, err := s.pool.Query(ctx, `select * from public.list_gateway_config()`)
	if err != nil {
		return err
	}
	defer rows.Close()

	lines := make([]GatewayLine, 0, 8)
	for rows.Next() {
		var (
			id         int16
			name       string
			url        string
			maxClients int32
			auction    bool
			guild      bool
			status     string
			sortOrder  int16
			createdAt  time.Time
			updatedAt  time.Time
		)
		if err := rows.Scan(&id, &name, &url, &maxClients, &auction, &guild, &status, &sortOrder, &createdAt, &updatedAt); err != nil {
			return err
		}
		lines = append(lines, GatewayLine{
			ID:         int(id),
			Name:       name,
			URL:        url,
			MaxClients: int(maxClients),
			Auction:    auction,
			Guild:      guild,
			Status:     status,
			SortOrder:  int(sortOrder),
			UpdatedAt:  updatedAt,
		})
	}
	if err := rows.Err(); err != nil {
		return err
	}

	oldByID := make(map[int]GatewayLine, len(lines))
	for _, l := range s.read().Lines {
		oldByID[l.ID] = l
	}

	s.write(func(snap *snapshot) {
		snap.Lines = lines
	})

	handler := s.gatewayLineStatusHandlerFn()
	if handler != nil {
		for _, newLine := range lines {
			oldLine, hadPrev := oldByID[newLine.ID]
			if !hadPrev {
				continue
			}
			if oldLine.Status == newLine.Status {
				continue
			}
			go handler(newLine, oldLine.Status, newLine.Status)
		}
	}

	return nil
}

func (s *Store) refreshKV(ctx context.Context, table string) error {
	fn := ""
	switch table {
	case TableServerSettings:
		fn = "public.list_server_settings"
	case TableGameTuning:
		fn = "public.list_game_tuning"
	case TableGMSettings:
		fn = "public.list_gm_settings"
	default:
		return fmt.Errorf("unknown kv table: %s", table)
	}

	rows, err := s.pool.Query(ctx, `select * from `+fn+`()`)
	if err != nil {
		return err
	}
	defer rows.Close()

	values := make(map[string]json.RawMessage, 16)
	for rows.Next() {
		var (
			key       string
			value     json.RawMessage
			category  string
			desc      *string
			updatedAt time.Time
		)
		if table == TableGameTuning {
			if err := rows.Scan(&key, &value, &category, &desc, &updatedAt); err != nil {
				return err
			}
		} else {
			if err := rows.Scan(&key, &value, &desc, &updatedAt); err != nil {
				return err
			}
		}
		values[key] = value
	}
	if err := rows.Err(); err != nil {
		return err
	}

	oldSnap := s.read()

	defaults := defaultSnapshot()
	s.write(func(snap *snapshot) {
		switch table {
		case TableServerSettings:
			snap.MaintenanceMode = decodeBool(values["maintenance_mode"], defaults.MaintenanceMode)
			snap.LoginEnabled = decodeBool(values["login_enabled"], defaults.LoginEnabled)
			snap.AnnouncementBanner = decodeString(values["announcement_banner"], defaults.AnnouncementBanner)
			snap.GlobalMaxPlayers = decodeInt(values["global_max_players"], defaults.GlobalMaxPlayers)
		case TableGameTuning:
			snap.ExpMultiplier = decodeFloat(values["exp_multiplier"], defaults.ExpMultiplier)
			snap.DropMultiplier = decodeFloat(values["drop_multiplier"], defaults.DropMultiplier)
			snap.GoldMultiplier = decodeFloat(values["gold_multiplier"], defaults.GoldMultiplier)
			snap.ScheduleBossEnabled = decodeBool(values["schedule_boss_enabled"], defaults.ScheduleBossEnabled)
			tickSeconds := decodeInt(values["schedule_boss_tick_seconds"], int(defaults.ScheduleBossTick/time.Second))
			if tickSeconds <= 0 {
				tickSeconds = int(defaults.ScheduleBossTick / time.Second)
			}
			snap.ScheduleBossTick = time.Duration(tickSeconds) * time.Second

			features := make(map[string]bool, len(values))
			for key, raw := range values {
				if !strings.HasPrefix(key, "feature_") {
					continue
				}
				name := strings.TrimPrefix(key, "feature_")
				name = strings.TrimSuffix(name, "_enabled")
				features[strings.ToLower(name)] = decodeBool(raw, true)
			}
			snap.FeaturesEnabled = features
		case TableGMSettings:
			snap.AuditRetentionDays = decodeInt(values["audit_retention_days"], defaults.AuditRetentionDays)
			snap.LoginLockoutAttempts = decodeInt(values["login_lockout_attempts"], defaults.LoginLockoutAttempts)
			lockoutMin := decodeInt(values["login_lockout_minutes"], int(defaults.LoginLockoutWindow/time.Minute))
			if lockoutMin <= 0 {
				lockoutMin = int(defaults.LoginLockoutWindow / time.Minute)
			}
			snap.LoginLockoutWindow = time.Duration(lockoutMin) * time.Minute
		}
	})

	newSnap := s.read()
	if oldSnap.MaintenanceMode != newSnap.MaintenanceMode {
		if h := s.maintenanceModeHandlerFn(); h != nil {
			go h(oldSnap.MaintenanceMode, newSnap.MaintenanceMode)
		}
	}

	return nil
}

func (s *Store) refreshByTable(ctx context.Context, table string) error {
	switch table {
	case TableGateway:
		return s.refreshGateway(ctx)
	case TableServerSettings, TableGameTuning, TableGMSettings:
		return s.refreshKV(ctx, table)
	default:
		return s.refreshAll(ctx)
	}
}
