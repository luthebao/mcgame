// Open-sourced by BaoLT

// Long buff entity persisted in player.character_buffs.
// Mirrors the runtime buff sent to the Flash long-buff bar.
package buff

import "time"

const (
	TypeBattle    = 1
	TypeTimed     = 2
	TypePermanent = 3
	TypeUnique    = 10
)

type Buff struct {
	ID            int64
	CharacterID   int64
	BuffID        int
	BuffType      int
	Source        string
	DurationTotal int
	ExpiresAt     *time.Time
	RoundsLeft    *int
	BattlesLeft   *int
	StackCount    int
	CreatedAt     time.Time
}

func (b *Buff) IsExpired(now time.Time) bool {
	if b == nil || b.ExpiresAt == nil {
		return false
	}
	return !b.ExpiresAt.After(now)
}
