// Open-sourced by BaoLT

package dailyact

import (
	"context"
	"time"
)

type Repository interface {
	Get(ctx context.Context, characterID int64, day time.Time) (*DailyActRecord, error)
	TouchLogin(ctx context.Context, characterID int64, day time.Time, now time.Time) (firstToday bool, firstLoginAt time.Time, err error)
	IncrementTask(ctx context.Context, characterID int64, day time.Time, taskID string, countDelta int, actDelta int) (newCount int, totalAct int, awardClaimed bool, err error)
	ClaimAward(ctx context.Context, characterID int64, day time.Time, tier int16) (success bool, vitalityPoints int, err error)
	RevertAward(ctx context.Context, characterID int64, day time.Time, tier int16) (bool, error)
}

type AwardRepository interface {
	List(ctx context.Context) ([]*AwardTier, error)
}
