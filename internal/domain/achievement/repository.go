// Open-sourced by BaoLT

// Achievement repository ports expose per-character achievement persistence.
package achievement

import (
	"context"
	"time"
)

type Repository interface {
	GetProgressByCharacter(ctx context.Context, characterID int64) ([]*Progress, error)
	UpsertProgress(ctx context.Context, progress *Progress) (*Progress, error)
	MarkCompleted(ctx context.Context, characterID, achievementID int64, completedAt time.Time) (*Progress, error)
	MarkClaimed(ctx context.Context, characterID, achievementID int64, claimedAt time.Time) (*Progress, error)
	ListClaimedCounts(ctx context.Context, characterID int64) (map[int64]int, error)
}
