// Open-sourced by BaoLT

// PostgreSQL implementation of account repository.
// Handles account CRUD operations with nullable field support.
// Used by auth service for user authentication and management.
package postgres

import (
	"context"
	"errors"
	"time"

	"mcgame-server/internal/domain/auth"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/google/uuid"
	"github.com/jackc/pgx/v5"
)

type AccountRepository struct {
	db *Database
}

func NewAccountRepository(db *Database) *AccountRepository {
	return &AccountRepository{db: db}
}

func (r *AccountRepository) FindByID(ctx context.Context, id uuid.UUID) (*auth.Account, error) {
	var account auth.Account
	var email, banReason, secondaryPassword *string
	var banExpiry, lastLogin *time.Time

	err := r.db.pool.QueryRow(ctx, "select * from public.get_account_by_id($1)", id).Scan(
		&account.ID,
		&account.Username,
		&account.PasswordHash,
		&secondaryPassword,
		&email,
		&account.VIPLevel,
		&account.Gold,
		&account.IsBanned,
		&banReason,
		&banExpiry,
		&account.CreatedAt,
		&lastLogin,
	)

	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrAccountNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to find account by ID")
	}

	if secondaryPassword != nil {
		account.SecondaryPassword = *secondaryPassword
	}
	account.SecondaryPassword = account.SecondaryPasswordHash()
	if email != nil {
		account.Email = *email
	}
	if banReason != nil {
		account.BanReason = *banReason
	}
	if lastLogin != nil {
		account.LastLogin = *lastLogin
	}
	account.BanExpiry = banExpiry
	return &account, nil
}

func (r *AccountRepository) FindByUsername(ctx context.Context, username string) (*auth.Account, error) {
	var account auth.Account
	var email, banReason, secondaryPassword *string
	var banExpiry, lastLogin *time.Time

	err := r.db.pool.QueryRow(ctx, "select * from public.get_account_by_username($1)", username).Scan(
		&account.ID,
		&account.Username,
		&account.PasswordHash,
		&secondaryPassword,
		&email,
		&account.VIPLevel,
		&account.Gold,
		&account.IsBanned,
		&banReason,
		&banExpiry,
		&account.CreatedAt,
		&lastLogin,
	)

	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrAccountNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to find account by username")
	}

	if secondaryPassword != nil {
		account.SecondaryPassword = *secondaryPassword
	}
	account.SecondaryPassword = account.SecondaryPasswordHash()
	if email != nil {
		account.Email = *email
	}
	if banReason != nil {
		account.BanReason = *banReason
	}
	if lastLogin != nil {
		account.LastLogin = *lastLogin
	}
	account.BanExpiry = banExpiry
	return &account, nil
}

func (r *AccountRepository) Create(ctx context.Context, account *auth.Account) error {
	var created bool
	err := r.db.pool.QueryRow(ctx,
		"select public.create_account($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12)",
		account.ID,
		account.Username,
		account.PasswordHash,
		account.SecondaryPasswordHash(),
		account.Email,
		account.VIPLevel,
		account.Gold,
		account.IsBanned,
		account.BanReason,
		account.BanExpiry,
		account.CreatedAt,
		account.LastLogin,
	).Scan(&created)

	if err != nil {
		return pkgerrors.Wrap(err, "failed to create account")
	}

	return nil
}

func (r *AccountRepository) Update(ctx context.Context, account *auth.Account) error {
	var updated bool
	err := r.db.pool.QueryRow(ctx,
		"select public.update_account($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)",
		account.ID,
		account.Username,
		account.PasswordHash,
		account.SecondaryPasswordHash(),
		account.Email,
		account.VIPLevel,
		account.Gold,
		account.IsBanned,
		account.BanReason,
		account.BanExpiry,
		account.LastLogin,
	).Scan(&updated)

	if err != nil {
		return pkgerrors.Wrap(err, "failed to update account")
	}

	if !updated {
		return pkgerrors.ErrAccountNotFound
	}

	return nil
}

func (r *AccountRepository) ExistsByUsername(ctx context.Context, username string) (bool, error) {
	var exists bool
	err := r.db.pool.QueryRow(ctx, "select public.account_exists_by_username($1)", username).Scan(&exists)
	if err != nil {
		return false, pkgerrors.Wrap(err, "failed to check username existence")
	}

	return exists, nil
}

func (r *AccountRepository) UpdateLastLogin(ctx context.Context, id uuid.UUID) error {
	_, err := r.db.pool.Exec(ctx, "select public.update_account_last_login($1, $2)", id, time.Now())
	if err != nil {
		return pkgerrors.Wrap(err, "failed to update last login")
	}

	return nil
}
