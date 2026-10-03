// Open-sourced by BaoLT

// Pet arena entry entities back the registration list shown in the Flash panel.
package petarena

import (
	"context"
	"time"
)

type Entry struct {
	CharacterID      int64
	Season           int
	TeamName         string
	ConfData         map[string]interface{}
	MaxFights        int
	UsedFights       int
	CooldownEndsAtMS int64
	LastRank         int
	CreatedAt        time.Time
	UpdatedAt        time.Time
}

type EntryRepository interface {
	GetEntry(ctx context.Context, characterID int64, season int) (*Entry, error)
	SaveEntry(ctx context.Context, entry *Entry) error
	ListEntries(ctx context.Context, season int, limit int) ([]*Entry, error)
}
