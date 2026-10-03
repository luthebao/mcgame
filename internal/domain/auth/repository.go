// Open-sourced by BaoLT

// Repository interfaces for account and session persistence.
// AccountRepository handles account storage in the auth database.
// SessionRepository handles session storage (typically in-memory or Redis).
package auth

import (
	"context"

	"github.com/google/uuid"
)

type AccountRepository interface {
	FindByID(ctx context.Context, id uuid.UUID) (*Account, error)
	FindByUsername(ctx context.Context, username string) (*Account, error)
	Create(ctx context.Context, account *Account) error
	Update(ctx context.Context, account *Account) error
	ExistsByUsername(ctx context.Context, username string) (bool, error)
	UpdateLastLogin(ctx context.Context, id uuid.UUID) error
}

type SessionRepository interface {
	Get(ctx context.Context, sessionID string) (*Session, error)
	GetByAccountID(ctx context.Context, accountID uuid.UUID) (*Session, error)
	Save(ctx context.Context, session *Session) error
	Delete(ctx context.Context, sessionID string) error
	DeleteByAccountID(ctx context.Context, accountID uuid.UUID) error
	Refresh(ctx context.Context, sessionID string) error
}
