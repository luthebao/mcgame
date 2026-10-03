// Open-sourced by BaoLT

// Session entity represents an authenticated user session.
// Tracks session state through connection, authentication, and gameplay phases.
// Generates secure random tokens for session identification.
package auth

import (
	"crypto/rand"
	"encoding/hex"
	"time"

	"github.com/google/uuid"
)

type Session struct {
	ID          string
	AccountID   uuid.UUID
	CharacterID uuid.UUID
	Username    string
	CreatedAt   time.Time
	ExpiresAt   time.Time
	LastActive  time.Time
	IPAddress   string
	State       SessionState
}

type SessionState int

const (
	StateConnected SessionState = iota
	StateAuthenticated
	StateCharacterSelected
	StateInScene
	StateInBattle
)

const SessionDuration = 24 * time.Hour

func NewSession(accountID uuid.UUID, username, ipAddress string) (*Session, error) {
	token, err := generateToken(32)
	if err != nil {
		return nil, err
	}

	now := time.Now()
	return &Session{
		ID:         token,
		AccountID:  accountID,
		Username:   username,
		CreatedAt:  now,
		ExpiresAt:  now.Add(SessionDuration),
		LastActive: now,
		IPAddress:  ipAddress,
		State:      StateAuthenticated,
	}, nil
}

func (s *Session) IsExpired() bool {
	return time.Now().After(s.ExpiresAt)
}

func (s *Session) Refresh() {
	s.LastActive = time.Now()
	s.ExpiresAt = s.LastActive.Add(SessionDuration)
}

func (s *Session) SetCharacter(characterID uuid.UUID) {
	s.CharacterID = characterID
	s.State = StateCharacterSelected
}

func (s *Session) EnterScene() {
	s.State = StateInScene
}

func (s *Session) EnterBattle() {
	s.State = StateInBattle
}

func (s *Session) LeaveBattle() {
	s.State = StateInScene
}

func (s *Session) HasCharacter() bool {
	return s.CharacterID != uuid.Nil
}

func generateToken(length int) (string, error) {
	bytes := make([]byte, length)
	if _, err := rand.Read(bytes); err != nil {
		return "", err
	}
	return hex.EncodeToString(bytes), nil
}
