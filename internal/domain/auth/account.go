// Open-sourced by BaoLT

// Account entity represents a user account with authentication data.
// Supports bcrypt and legacy MD5 password hashing for Flash client compatibility.
// Handles account bans with optional expiration times.
// Password compares use crypto/subtle.ConstantTimeCompare (F1 hardening, 2026-05-03).
// Legacy MD5 password rows are migrated to bcrypt(MD5) by auth.Service.Login (F1.5).
package auth

import (
	"crypto/subtle"
	"time"

	"github.com/google/uuid"
	"golang.org/x/crypto/bcrypt"
)

const DefaultSecondaryPasswordMD5 = "e10adc3949ba59abbe56e057f20f883e"

func IsBcryptHash(hash string) bool {
	return len(hash) > 4 && hash[0] == '$' && hash[1] == '2'
}

type Account struct {
	ID                uuid.UUID
	Username          string
	PasswordHash      string
	SecondaryPassword string
	Email             string
	VIPLevel          int
	Gold              int
	IsBanned          bool
	BanReason         string
	BanExpiry         *time.Time
	CreatedAt         time.Time
	LastLogin         time.Time
}

func NewAccount(username, password, email string) (*Account, error) {
	hash, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
	if err != nil {
		return nil, err
	}

	now := time.Now()
	return &Account{
		ID:                uuid.New(),
		Username:          username,
		PasswordHash:      string(hash),
		SecondaryPassword: DefaultSecondaryPasswordMD5,
		Email:             email,
		VIPLevel:          0,
		Gold:              0,
		IsBanned:          false,
		CreatedAt:         now,
		LastLogin:         now,
	}, nil
}

func (a *Account) CheckPassword(password string) bool {
	if IsBcryptHash(a.PasswordHash) {
		err := bcrypt.CompareHashAndPassword([]byte(a.PasswordHash), []byte(password))
		return err == nil
	}
	if a.PasswordHash == "" || password == "" {
		return false
	}
	return subtle.ConstantTimeCompare([]byte(a.PasswordHash), []byte(password)) == 1
}

func (a *Account) CheckSecondaryPassword(passwordMD5 string) bool {
	if passwordMD5 == "" {
		return false
	}
	stored := a.SecondaryPasswordHash()
	return subtle.ConstantTimeCompare([]byte(stored), []byte(passwordMD5)) == 1
}

func (a *Account) SetPassword(password string) error {
	hash, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
	if err != nil {
		return err
	}
	a.PasswordHash = string(hash)
	return nil
}

func (a *Account) SetSecondaryPassword(passwordMD5 string) {
	if passwordMD5 == "" {
		a.SecondaryPassword = DefaultSecondaryPasswordMD5
		return
	}
	a.SecondaryPassword = passwordMD5
}

func (a *Account) SecondaryPasswordHash() string {
	if a.SecondaryPassword == "" {
		return DefaultSecondaryPasswordMD5
	}
	return a.SecondaryPassword
}

func (a *Account) IsBannedNow() bool {
	if !a.IsBanned {
		return false
	}
	if a.BanExpiry == nil {
		return true
	}
	return time.Now().Before(*a.BanExpiry)
}

func (a *Account) Ban(reason string, duration *time.Duration) {
	a.IsBanned = true
	a.BanReason = reason
	if duration != nil {
		expiry := time.Now().Add(*duration)
		a.BanExpiry = &expiry
	} else {
		a.BanExpiry = nil
	}
}

func (a *Account) Unban() {
	a.IsBanned = false
	a.BanReason = ""
	a.BanExpiry = nil
}
