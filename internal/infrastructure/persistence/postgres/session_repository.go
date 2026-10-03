// Open-sourced by BaoLT

// In-memory session repository with automatic cleanup.
// Thread-safe storage for user sessions with expiration handling.
// For production, consider Redis for distributed session management.
package postgres

import (
	"context"
	"sync"
	"time"

	"github.com/google/uuid"
	"mcgame-server/internal/domain/auth"
	pkgerrors "mcgame-server/pkg/errors"
)

type InMemorySessionRepository struct {
	sessions   map[string]*auth.Session
	byAccount  map[uuid.UUID]string
	mutex      sync.RWMutex
	cleanupTTL time.Duration
}

func NewInMemorySessionRepository() *InMemorySessionRepository {
	repo := &InMemorySessionRepository{
		sessions:   make(map[string]*auth.Session),
		byAccount:  make(map[uuid.UUID]string),
		cleanupTTL: 5 * time.Minute,
	}

	go repo.cleanupLoop()

	return repo
}

func (r *InMemorySessionRepository) Get(ctx context.Context, sessionID string) (*auth.Session, error) {
	r.mutex.RLock()
	defer r.mutex.RUnlock()

	session, exists := r.sessions[sessionID]
	if !exists {
		return nil, pkgerrors.ErrSessionExpired
	}

	if session.IsExpired() {
		return nil, pkgerrors.ErrSessionExpired
	}

	return session, nil
}

func (r *InMemorySessionRepository) GetByAccountID(ctx context.Context, accountID uuid.UUID) (*auth.Session, error) {
	r.mutex.RLock()
	sessionID, exists := r.byAccount[accountID]
	r.mutex.RUnlock()

	if !exists {
		return nil, pkgerrors.ErrSessionExpired
	}

	return r.Get(ctx, sessionID)
}

func (r *InMemorySessionRepository) Save(ctx context.Context, session *auth.Session) error {
	r.mutex.Lock()
	defer r.mutex.Unlock()

	r.sessions[session.ID] = session
	r.byAccount[session.AccountID] = session.ID

	return nil
}

func (r *InMemorySessionRepository) Delete(ctx context.Context, sessionID string) error {
	r.mutex.Lock()
	defer r.mutex.Unlock()

	if session, exists := r.sessions[sessionID]; exists {
		delete(r.byAccount, session.AccountID)
		delete(r.sessions, sessionID)
	}

	return nil
}

func (r *InMemorySessionRepository) DeleteByAccountID(ctx context.Context, accountID uuid.UUID) error {
	r.mutex.Lock()
	defer r.mutex.Unlock()

	if sessionID, exists := r.byAccount[accountID]; exists {
		delete(r.sessions, sessionID)
		delete(r.byAccount, accountID)
	}

	return nil
}

func (r *InMemorySessionRepository) Refresh(ctx context.Context, sessionID string) error {
	r.mutex.Lock()
	defer r.mutex.Unlock()

	session, exists := r.sessions[sessionID]
	if !exists {
		return pkgerrors.ErrSessionExpired
	}

	session.Refresh()
	return nil
}

func (r *InMemorySessionRepository) cleanupLoop() {
	ticker := time.NewTicker(r.cleanupTTL)
	defer ticker.Stop()

	for range ticker.C {
		r.cleanup()
	}
}

func (r *InMemorySessionRepository) cleanup() {
	r.mutex.Lock()
	defer r.mutex.Unlock()

	now := time.Now()
	for sessionID, session := range r.sessions {
		if now.After(session.ExpiresAt) {
			delete(r.byAccount, session.AccountID)
			delete(r.sessions, sessionID)
		}
	}
}

func (r *InMemorySessionRepository) Count() int {
	r.mutex.RLock()
	defer r.mutex.RUnlock()
	return len(r.sessions)
}
