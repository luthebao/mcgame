// Open-sourced by BaoLT

// Auth service handles authentication and session management use cases.
// Provides login, registration, session validation, and logout operations.
// Manages account state including ban status and last login tracking.
// Login rehashes legacy MD5 password rows to bcrypt(storedMD5) on first
// successful login (F1.5 hardening, 2026-05-03) so a stolen DB row is no
// longer a working credential on its own. The Flash client keeps sending
// MD5(plaintext); after rehash the bcrypt branch wins on the next login.
package auth

import (
	"context"

	"github.com/google/uuid"
	"go.uber.org/zap"
	"golang.org/x/crypto/bcrypt"

	"mcgame-server/internal/domain/auth"
	pkgerrors "mcgame-server/pkg/errors"
)

type Service struct {
	accountRepo auth.AccountRepository
	sessionRepo auth.SessionRepository
	logger      *zap.Logger
}

func NewService(
	accountRepo auth.AccountRepository,
	sessionRepo auth.SessionRepository,
	logger *zap.Logger,
) *Service {
	return &Service{
		accountRepo: accountRepo,
		sessionRepo: sessionRepo,
		logger:      logger,
	}
}

type LoginRequest struct {
	Username  string
	Password  string
	IPAddress string
}

type LoginResponse struct {
	SessionID string
	AccountID string
	Username  string
}

func (s *Service) Login(ctx context.Context, req *LoginRequest) (*LoginResponse, error) {
	account, err := s.accountRepo.FindByUsername(ctx, req.Username)
	if err != nil {
		if pkgerrors.Is(err, pkgerrors.ErrAccountNotFound) {
			s.logger.Debug("Login failed: account not found",
				zap.String("username", req.Username))
			return nil, pkgerrors.ErrInvalidCredentials
		}
		return nil, err
	}

	if !account.CheckPassword(req.Password) {
		s.logger.Debug("Login failed: invalid password",
			zap.String("username", req.Username))
		return nil, pkgerrors.ErrInvalidCredentials
	}

	if !auth.IsBcryptHash(account.PasswordHash) {
		s.rehashLegacyPassword(ctx, account)
	}

	if account.IsBannedNow() {
		s.logger.Debug("Login failed: account banned",
			zap.String("username", req.Username))
		return nil, pkgerrors.ErrAccountBanned
	}

	_ = s.sessionRepo.DeleteByAccountID(ctx, account.ID)

	session, err := auth.NewSession(account.ID, account.Username, req.IPAddress)
	if err != nil {
		return nil, err
	}

	if err := s.sessionRepo.Save(ctx, session); err != nil {
		return nil, err
	}

	_ = s.accountRepo.UpdateLastLogin(ctx, account.ID)

	s.logger.Info("User logged in",
		zap.String("username", account.Username),
		zap.String("session_id", session.ID))

	return &LoginResponse{
		SessionID: session.ID,
		AccountID: account.ID.String(),
		Username:  account.Username,
	}, nil
}

type RegisterRequest struct {
	Username string
	Password string
	Email    string
}

func (s *Service) Register(ctx context.Context, req *RegisterRequest) error {
	exists, err := s.accountRepo.ExistsByUsername(ctx, req.Username)
	if err != nil {
		return err
	}
	if exists {
		return pkgerrors.ErrAlreadyExists
	}

	account, err := auth.NewAccount(req.Username, req.Password, req.Email)
	if err != nil {
		return err
	}

	if err := s.accountRepo.Create(ctx, account); err != nil {
		return err
	}

	s.logger.Info("Account created",
		zap.String("username", account.Username),
		zap.String("account_id", account.ID.String()))

	return nil
}

func (s *Service) ValidateSession(ctx context.Context, sessionID string) (*auth.Session, error) {
	session, err := s.sessionRepo.Get(ctx, sessionID)
	if err != nil {
		return nil, pkgerrors.ErrSessionExpired
	}

	if session.IsExpired() {
		_ = s.sessionRepo.Delete(ctx, sessionID)
		return nil, pkgerrors.ErrSessionExpired
	}

	_ = s.sessionRepo.Refresh(ctx, sessionID)

	return session, nil
}

func (s *Service) Logout(ctx context.Context, sessionID string) error {
	if err := s.sessionRepo.Delete(ctx, sessionID); err != nil {
		return err
	}

	s.logger.Debug("Session terminated", zap.String("session_id", sessionID))
	return nil
}

func (s *Service) GetAccount(ctx context.Context, accountID uuid.UUID) (*auth.Account, error) {
	return s.accountRepo.FindByID(ctx, accountID)
}

func (s *Service) rehashLegacyPassword(ctx context.Context, account *auth.Account) {
	rehashed, err := bcrypt.GenerateFromPassword([]byte(account.PasswordHash), bcrypt.DefaultCost)
	if err != nil {
		s.logger.Warn("legacy MD5 rehash failed",
			zap.String("username", account.Username),
			zap.Error(err))
		return
	}

	account.PasswordHash = string(rehashed)
	if err := s.accountRepo.Update(ctx, account); err != nil {
		s.logger.Warn("legacy MD5 rehash persist failed",
			zap.String("username", account.Username),
			zap.Error(err))
		return
	}

	s.logger.Info("legacy MD5 rehashed to bcrypt",
		zap.String("username", account.Username))
}
