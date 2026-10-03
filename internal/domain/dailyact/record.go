// Open-sourced by BaoLT

package dailyact

import "time"

type DailyActRecord struct {
	CharacterID          int64
	Day                  time.Time
	VitalityPoints       int
	AwardClaimed         bool
	AwardedTier          *int16
	AwardedAt            *time.Time
	TaskCounts           map[string]int
	FirstLoginAt         *time.Time
	OnlineSecondsOffline int
	UpdatedAt            time.Time
}

func (r *DailyActRecord) TaskCount(taskID string) int {
	if r == nil || r.TaskCounts == nil {
		return 0
	}
	return r.TaskCounts[taskID]
}

func (r *DailyActRecord) Empty() bool {
	if r == nil {
		return true
	}
	return r.VitalityPoints == 0 && !r.AwardClaimed && len(r.TaskCounts) == 0
}
