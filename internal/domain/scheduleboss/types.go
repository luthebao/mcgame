// Open-sourced by BaoLT

// Types and constants for the Schedule Boss system.
// BossConfig is seeded from data.data_tbl_schedule_boss.
// BossState is the runtime row in player.schedule_boss_state.
package scheduleboss

import "time"

type Kind string

const (
	Ground Kind = "ground"
	Flying Kind = "flying"
)

type Tier string

const (
	TierNormal  Tier = "normal"
	TierMythic  Tier = "mythic"
	TierSpecial Tier = "special"
)

type BossConfig struct {
	NID          int
	Name         string
	MapID        int
	Level        int
	Kind         Kind
	Tier         Tier
	ChannelScope string
	Description  string
	IsActive     bool
}

func (c BossConfig) Eligible() bool {
	return c.IsActive && c.Tier == TierNormal
}

type BossState struct {
	NID          int
	ChannelID    int
	IsAlive      bool
	LastKilledAt *time.Time
	LastKillerID *int64
	NextSpawnAt  time.Time
	SpawnCount   int
	UpdatedAt    time.Time
}
