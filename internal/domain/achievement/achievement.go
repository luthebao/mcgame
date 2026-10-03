// Open-sourced by BaoLT

// Achievement domain models represent per-character progress and login snapshots.
package achievement

import "time"

type Progress struct {
	ID            int64
	CharacterID   int64
	AchievementID int64
	Progress      int
	Target        int
	IsCompleted   bool
	IsClaimed     bool
	CompletedAt   *time.Time
	ClaimedAt     *time.Time
}

type CompletionEntry struct {
	AchievementID int64
	DoneAt        int64
}

type RequirementProgress struct {
	RequirementID int64
	Done          int
	Progress      int
}

type Snapshot struct {
	AchieveLog          map[string]interface{}
	AchieveReqLog       map[string]interface{}
	TakeAchieveAwardLog map[string]interface{}
	AchievementPoints   int
}
