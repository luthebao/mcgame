// Open-sourced by BaoLT

// Quest progress entity tracks character progress on quests.
// Manages objectives, completion status, and repeatable quest resets.
// Supports quest history recording for completed quests.
package quest

import (
	"time"
)

type QuestStatus int

const (
	QuestStatusActive    QuestStatus = 0
	QuestStatusCompleted QuestStatus = 1
	QuestStatusFailed    QuestStatus = 2
)

type QuestProgress struct {
	ID              int64
	CharacterID     int64
	QuestID         int
	Status          QuestStatus
	Objectives      []Objective
	StartedAt       time.Time
	CompletedAt     *time.Time
	ExpiresAt       *time.Time
	CompletionCount int
	LastReset       *time.Time
}

func NewQuestProgress(characterID int64, questID int, objectives []Objective) *QuestProgress {
	now := time.Now()
	return &QuestProgress{
		CharacterID:     characterID,
		QuestID:         questID,
		Status:          QuestStatusActive,
		Objectives:      objectives,
		StartedAt:       now,
		CompletionCount: 0,
	}
}

func (qp *QuestProgress) UpdateObjective(objType ObjectiveType, target int, amount int) bool {
	for i := range qp.Objectives {
		obj := &qp.Objectives[i]
		if obj.Type == objType && obj.Target == target && !obj.IsComplete() {
			obj.AddProgress(amount)
			return true
		}
	}
	return false
}

func (qp *QuestProgress) IsComplete() bool {
	for _, obj := range qp.Objectives {
		if !obj.IsComplete() {
			return false
		}
	}
	return true
}

func (qp *QuestProgress) CanComplete() bool {
	return qp.Status == QuestStatusActive && qp.IsComplete()
}

func (qp *QuestProgress) Complete() {
	now := time.Now()
	qp.Status = QuestStatusCompleted
	qp.CompletedAt = &now
	qp.CompletionCount++
}

func (qp *QuestProgress) Fail() {
	qp.Status = QuestStatusFailed
}

func (qp *QuestProgress) Reset(objectives []Objective) {
	now := time.Now()
	qp.Status = QuestStatusActive
	qp.Objectives = objectives
	qp.CompletedAt = nil
	qp.LastReset = &now
}

func (qp *QuestProgress) IsExpired() bool {
	if qp.ExpiresAt == nil {
		return false
	}
	return time.Now().After(*qp.ExpiresAt)
}

func (qp *QuestProgress) ToDTO() map[string]interface{} {
	objectives := make([]map[string]interface{}, len(qp.Objectives))
	for i, obj := range qp.Objectives {
		objectives[i] = obj.ToDTO()
	}

	// Map internal status to client status
	// ST_QUEST_ISTAKE: 103, ST_QUEST_CANFINISH: 104
	state := 103
	if qp.IsComplete() {
		state = 104
	}

	dto := map[string]interface{}{
		"qid":        qp.QuestID,
		"state":      state,
		"objectives": objectives,
		"takeDate":   qp.StartedAt.Unix(),
		"c":          0, // Dummy color index
		"pos": map[string]interface{}{
			"map":  1,
			"x":    1000,
			"y":    1000,
			"name": "Unknown",
		},
		// Added clsData for repeatable quest info
		"clsData": map[string]interface{}{
			"num": qp.CompletionCount,
		},
	}

	if qp.CompletedAt != nil {
		dto["completedAt"] = qp.CompletedAt.Unix()
	}
	if qp.ExpiresAt != nil {
		dto["expiresAt"] = qp.ExpiresAt.Unix()
	}

	return dto
}

type QuestHistory struct {
	ID             int64
	CharacterID    int64
	QuestID        int
	CompletedAt    time.Time
	RewardsClaimed map[string]interface{}
}
