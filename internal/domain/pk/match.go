// Open-sourced by BaoLT

package pk

import "time"

// State represents lifecycle of a PK match.
type State string

const (
	StateInvited  State = "invited"
	StateReady    State = "ready"
	StateFighting State = "fighting"
	StateFinished State = "finished"
)

// Invite holds pending PK invitation metadata.
type Invite struct {
	MatchID   string
	FromCID   int64
	ToCID     int64
	MapID     int
	ExpiresAt time.Time
	CreatedAt time.Time
}

// Match holds PK match runtime data (kept in-memory for now).
type Match struct {
	ID        string
	PlayerA   int64
	PlayerB   int64
	MapID     int
	State     State
	StartAt   time.Time
	EndAt     time.Time
	WinnerCID int64
	Reason    string
	ReadyA    bool
	ReadyB    bool
	UpdatedAt time.Time
}

// Participants returns both participant IDs.
func (m *Match) Participants() (int64, int64) {
	return m.PlayerA, m.PlayerB
}
