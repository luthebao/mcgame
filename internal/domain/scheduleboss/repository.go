// Open-sourced by BaoLT

// Repository interfaces for Schedule Boss persistence.
// ConfigRepo is read-only (seeded from XML).
// StateRepo handles per-(nid, channel) runtime rows.
package scheduleboss

import (
	"context"
	"time"
)

type ConfigRepo interface {
	List(ctx context.Context) ([]BossConfig, error)
}

type BossKey struct {
	NID       int
	ChannelID int
}

type StateRepo interface {
	Upsert(ctx context.Context, s BossState) error
	Get(ctx context.Context, nid, channelID int) (*BossState, error)
	FetchDueSpawns(ctx context.Context, now time.Time) ([]BossState, error)
	MarkAlive(ctx context.Context, nid, channelID int, now time.Time) (bool, error)
	MarkKilled(ctx context.Context, nid, channelID int, killerID int64, nextSpawnAt time.Time, now time.Time) (bool, error)
	ListAliveByChannel(ctx context.Context, channelID int) ([]BossState, error)
	ListExistingKeys(ctx context.Context) (map[BossKey]struct{}, error)
	InsertMissing(ctx context.Context, rows []BossState) error
}
