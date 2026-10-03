// Open-sourced by BaoLT

package pk

import (
	"context"
	"fmt"
	"sync"
	"time"

	domainpk "mcgame-server/internal/domain/pk"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

// Config controls PK behavior. Values are in milliseconds to match existing config style.
type Config struct {
	InviteTimeout time.Duration
	MatchTimeout  time.Duration
	Cooldown      time.Duration
	AllowedMaps   map[int]struct{}
}

// DefaultConfig returns safe defaults if no external config is provided.
func DefaultConfig() Config {
	return Config{
		InviteTimeout: 30 * time.Second,
		MatchTimeout:  5 * time.Minute,
		Cooldown:      10 * time.Second,
		AllowedMaps:   nil, // nil means allow all maps
	}
}

// Service manages PK invitations and simple match lifecycle in-memory.
type Service struct {
	cfg         Config
	logger      *zap.Logger
	mu          sync.Mutex
	invites     map[string]*domainpk.Invite
	matches     map[string]*domainpk.Match
	playerToMid map[int64]string // quick lookup: player -> matchID
	playerCD    map[int64]time.Time
}

func NewService(cfg Config, logger *zap.Logger) *Service {
	return &Service{
		cfg:         cfg,
		logger:      logger,
		invites:     make(map[string]*domainpk.Invite),
		matches:     make(map[string]*domainpk.Match),
		playerToMid: make(map[int64]string),
		playerCD:    make(map[int64]time.Time),
	}
}

// Invite creates a new PK invitation.
func (s *Service) Invite(ctx context.Context, fromCID, toCID int64, mapID int) (*domainpk.Invite, error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	now := time.Now()

	if fromCID == 0 || toCID == 0 || fromCID == toCID {
		return nil, pkgerrors.ErrInvalidArgs
	}

	if len(s.cfg.AllowedMaps) > 0 {
		if _, ok := s.cfg.AllowedMaps[mapID]; !ok {
			return nil, pkgerrors.ErrInvalidInput
		}
	}

	if mid, ok := s.playerToMid[fromCID]; ok && s.isActiveMatch(mid) {
		return nil, pkgerrors.ErrInBattle
	}
	if mid, ok := s.playerToMid[toCID]; ok && s.isActiveMatch(mid) {
		return nil, pkgerrors.ErrInBattle
	}

	if cd, ok := s.playerCD[fromCID]; ok && now.Before(cd) {
		return nil, pkgerrors.ErrRateLimited
	}

	matchID := uuid.New().String()
	inv := &domainpk.Invite{
		MatchID:   matchID,
		FromCID:   fromCID,
		ToCID:     toCID,
		MapID:     mapID,
		CreatedAt: now,
		ExpiresAt: now.Add(s.cfg.InviteTimeout),
	}
	s.invites[matchID] = inv
	s.playerCD[fromCID] = now.Add(s.cfg.Cooldown)

	s.logger.Info("PK invite created",
		zap.String("match_id", matchID),
		zap.Int64("from", fromCID),
		zap.Int64("to", toCID),
		zap.Int("map_id", mapID))

	return inv, nil
}

// Respond handles accept/decline of an invite.
func (s *Service) Respond(ctx context.Context, matchID string, responder int64, accept bool) (*domainpk.Match, error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	now := time.Now()
	inv, ok := s.invites[matchID]
	if !ok {
		return nil, pkgerrors.ErrNotFound
	}
	if now.After(inv.ExpiresAt) {
		delete(s.invites, matchID)
		return nil, pkgerrors.ErrInvalidInput
	}
	if inv.ToCID != responder {
		return nil, pkgerrors.ErrUnauthorized
	}

	if !accept {
		delete(s.invites, matchID)
		return nil, nil
	}

	m := &domainpk.Match{
		ID:      matchID,
		PlayerA: inv.FromCID,
		PlayerB: inv.ToCID,
		MapID:   inv.MapID,
		State:   domainpk.StateReady,
	}
	s.matches[matchID] = m
	s.playerToMid[inv.FromCID] = matchID
	s.playerToMid[inv.ToCID] = matchID
	delete(s.invites, matchID)

	return m, nil
}

// Ready marks player ready; returns match and whether fight just started.
func (s *Service) Ready(ctx context.Context, matchID string, cid int64) (*domainpk.Match, bool, error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	m, ok := s.matches[matchID]
	if !ok {
		return nil, false, pkgerrors.ErrNotFound
	}

	if m.State == domainpk.StateFinished {
		return m, false, pkgerrors.ErrInvalidInput
	}

	if cid != m.PlayerA && cid != m.PlayerB {
		return nil, false, pkgerrors.ErrUnauthorized
	}

	if cid == m.PlayerA {
		m.ReadyA = true
	}
	if cid == m.PlayerB {
		m.ReadyB = true
	}

	started := false
	if m.ReadyA && m.ReadyB && m.State != domainpk.StateFighting {
		m.State = domainpk.StateFighting
		m.StartAt = time.Now()
		started = true
	}
	m.UpdatedAt = time.Now()
	return m, started, nil
}

// Action only records heartbeat/last action for now; real combat handled elsewhere.
func (s *Service) Action(ctx context.Context, matchID string, actor int64) (*domainpk.Match, error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	m, ok := s.matches[matchID]
	if !ok {
		return nil, pkgerrors.ErrNotFound
	}
	if m.State != domainpk.StateFighting {
		return nil, pkgerrors.ErrInvalidInput
	}
	if actor != m.PlayerA && actor != m.PlayerB {
		return nil, pkgerrors.ErrUnauthorized
	}
	m.UpdatedAt = time.Now()
	return m, nil
}

// Surrender ends match with opponent as winner.
func (s *Service) Surrender(ctx context.Context, matchID string, cid int64, reason string) (*domainpk.Match, error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	m, ok := s.matches[matchID]
	if !ok {
		return nil, pkgerrors.ErrNotFound
	}
	if m.State == domainpk.StateFinished {
		return m, nil
	}
	if cid != m.PlayerA && cid != m.PlayerB {
		return nil, pkgerrors.ErrUnauthorized
	}

	if cid == m.PlayerA {
		m.WinnerCID = m.PlayerB
	} else {
		m.WinnerCID = m.PlayerA
	}
	m.State = domainpk.StateFinished
	m.EndAt = time.Now()
	m.Reason = reason
	s.cleanupMatchLocked(m)
	return m, nil
}

// LeaveForfeit handles disconnect/leave events.
func (s *Service) LeaveForfeit(ctx context.Context, matchID string, cid int64, reason string) (*domainpk.Match, error) {
	return s.Surrender(ctx, matchID, cid, reason)
}

// MatchByPlayer returns active match ID if present.
func (s *Service) MatchByPlayer(cid int64) (string, bool) {
	s.mu.Lock()
	defer s.mu.Unlock()

	if mid, ok := s.playerToMid[cid]; ok && s.isActiveMatch(mid) {
		return mid, true
	}
	return "", false
}

func (s *Service) isActiveMatch(matchID string) bool {
	m, ok := s.matches[matchID]
	if !ok {
		return false
	}
	return m.State != domainpk.StateFinished
}

func (s *Service) cleanupMatchLocked(m *domainpk.Match) {
	delete(s.playerToMid, m.PlayerA)
	delete(s.playerToMid, m.PlayerB)
}

// ExpireInvites removes expired invites; cheap sweep to be called opportunistically.
func (s *Service) ExpireInvites() {
	s.mu.Lock()
	defer s.mu.Unlock()

	now := time.Now()
	for id, inv := range s.invites {
		if now.After(inv.ExpiresAt) {
			delete(s.invites, id)
		}
	}
}

// DebugSnapshot returns a shallow copy for debugging/testing.
func (s *Service) DebugSnapshot() (int, int) {
	s.mu.Lock()
	defer s.mu.Unlock()
	return len(s.invites), len(s.matches)
}

// FindPendingInviteForPlayer finds an active invite where the player is the target (ToCID).
// Returns the invite and matchID if found, nil otherwise.
func (s *Service) FindPendingInviteForPlayer(toCID int64) (*domainpk.Invite, string) {
	s.mu.Lock()
	defer s.mu.Unlock()

	now := time.Now()
	for matchID, inv := range s.invites {
		if inv.ToCID == toCID && now.Before(inv.ExpiresAt) {
			return inv, matchID
		}
	}
	return nil, ""
}

// ValidateAllowedMap returns error if map not allowed.
func (s *Service) ValidateAllowedMap(mapID int) error {
	if len(s.cfg.AllowedMaps) == 0 {
		return nil
	}
	if _, ok := s.cfg.AllowedMaps[mapID]; !ok {
		return fmt.Errorf("map %d not allowed for PK", mapID)
	}
	return nil
}
