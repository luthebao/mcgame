// Open-sourced by BaoLT

// Repository interface for quest persistence.
// Handles quest progress CRUD, status queries, and history recording.
// Supports querying active, completed, and all quests per character.
package quest

import (
	"context"
)

type Repository interface {
	Save(ctx context.Context, progress *QuestProgress) error
	FindByID(ctx context.Context, id int64) (*QuestProgress, error)
	FindByCharacterAndQuest(ctx context.Context, characterID int64, questID int) (*QuestProgress, error)
	FindActiveByCharacter(ctx context.Context, characterID int64) ([]*QuestProgress, error)
	FindCompletedByCharacter(ctx context.Context, characterID int64) ([]*QuestProgress, error)
	FindAllByCharacter(ctx context.Context, characterID int64) ([]*QuestProgress, error)
	Update(ctx context.Context, progress *QuestProgress) error
	Delete(ctx context.Context, id int64) error
	RecordHistory(ctx context.Context, history *QuestHistory) error
	GetCompletedQuestIDs(ctx context.Context, characterID int64) ([]int, error)
}
