// Open-sourced by BaoLT

// PostgreSQL implementation of quest repository.
// Handles quest progress CRUD with JSON objectives storage.
// Supports history tracking and completion queries.
package postgres

import (
	"context"
	"encoding/json"
	"errors"
	"time"

	"mcgame-server/internal/domain/quest"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/jackc/pgx/v5"
)

type QuestRepository struct {
	db *Database
}

func NewQuestRepository(db *Database) *QuestRepository {
	return &QuestRepository{db: db}
}

func (r *QuestRepository) Save(ctx context.Context, qp *quest.QuestProgress) error {
	if qp.ID == 0 {
		return r.create(ctx, qp)
	}
	return r.Update(ctx, qp)
}

func (r *QuestRepository) create(ctx context.Context, qp *quest.QuestProgress) error {
	objectivesJSON, err := json.Marshal(qp.Objectives)
	if err != nil {
		objectivesJSON = []byte("[]")
	}

	err = r.db.pool.QueryRow(ctx,
		"select player.create_quest_progress($1, $2, $3, $4::jsonb, $5, $6, $7, $8, $9)",
		qp.CharacterID, qp.QuestID, int(qp.Status), objectivesJSON,
		qp.StartedAt, qp.CompletedAt, qp.ExpiresAt,
		qp.CompletionCount, qp.LastReset,
	).Scan(&qp.ID)

	if err != nil {
		return pkgerrors.Wrap(err, "failed to create quest progress")
	}

	return nil
}

func (r *QuestRepository) Update(ctx context.Context, qp *quest.QuestProgress) error {
	objectivesJSON, err := json.Marshal(qp.Objectives)
	if err != nil {
		objectivesJSON = []byte("[]")
	}

	var updated bool
	err = r.db.pool.QueryRow(ctx,
		"select player.update_quest_progress($1, $2, $3::jsonb, $4, $5, $6, $7)",
		qp.ID,
		int(qp.Status), objectivesJSON,
		qp.CompletedAt, qp.ExpiresAt,
		qp.CompletionCount, qp.LastReset,
	).Scan(&updated)

	if err != nil {
		return pkgerrors.Wrap(err, "failed to update quest progress")
	}

	if !updated {
		return pkgerrors.ErrNotFound
	}

	return nil
}

func (r *QuestRepository) FindByID(ctx context.Context, id int64) (*quest.QuestProgress, error) {
	qp := &quest.QuestProgress{}
	var objectivesJSON []byte
	var status int

	err := r.db.pool.QueryRow(ctx, "select * from player.get_quest_progress_by_id($1)", id).Scan(
		&qp.ID, &qp.CharacterID, &qp.QuestID, &status, &objectivesJSON,
		&qp.StartedAt, &qp.CompletedAt, &qp.ExpiresAt,
		&qp.CompletionCount, &qp.LastReset,
	)

	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to find quest progress by ID")
	}

	qp.Status = quest.QuestStatus(status)
	if len(objectivesJSON) > 0 {
		if err := json.Unmarshal(objectivesJSON, &qp.Objectives); err != nil {
			qp.Objectives = []quest.Objective{}
		}
	} else {
		qp.Objectives = []quest.Objective{}
	}

	return qp, nil
}

func (r *QuestRepository) FindByCharacterAndQuest(ctx context.Context, characterID int64, questID int) (*quest.QuestProgress, error) {
	qp := &quest.QuestProgress{}
	var objectivesJSON []byte
	var status int

	err := r.db.pool.QueryRow(ctx, "select * from player.get_quest_progress_by_character($1, $2)", characterID, questID).Scan(
		&qp.ID, &qp.CharacterID, &qp.QuestID, &status, &objectivesJSON,
		&qp.StartedAt, &qp.CompletedAt, &qp.ExpiresAt,
		&qp.CompletionCount, &qp.LastReset,
	)

	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to find quest by character and quest ID")
	}

	qp.Status = quest.QuestStatus(status)
	if len(objectivesJSON) > 0 {
		if err := json.Unmarshal(objectivesJSON, &qp.Objectives); err != nil {
			qp.Objectives = []quest.Objective{}
		}
	} else {
		qp.Objectives = []quest.Objective{}
	}

	return qp, nil
}

func (r *QuestRepository) FindActiveByCharacter(ctx context.Context, characterID int64) ([]*quest.QuestProgress, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_character_quests_by_status($1, $2)", characterID, int(quest.QuestStatusActive))
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to find active quests")
	}
	defer rows.Close()

	return r.scanQuestRows(rows)
}

func (r *QuestRepository) FindCompletedByCharacter(ctx context.Context, characterID int64) ([]*quest.QuestProgress, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_character_quests_by_status($1, $2)", characterID, int(quest.QuestStatusCompleted))
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to find completed quests")
	}
	defer rows.Close()

	return r.scanQuestRows(rows)
}

func (r *QuestRepository) FindAllByCharacter(ctx context.Context, characterID int64) ([]*quest.QuestProgress, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_character_quests($1)", characterID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to find all quests")
	}
	defer rows.Close()

	return r.scanQuestRows(rows)
}

func (r *QuestRepository) Delete(ctx context.Context, id int64) error {
	var deleted bool
	if err := r.db.pool.QueryRow(ctx, "select player.delete_character_quest($1)", id).Scan(&deleted); err != nil {
		return pkgerrors.Wrap(err, "failed to delete quest progress")
	}

	if !deleted {
		return pkgerrors.ErrNotFound
	}

	return nil
}

func (r *QuestRepository) RecordHistory(ctx context.Context, history *quest.QuestHistory) error {
	rewardsJSON, err := json.Marshal(history.RewardsClaimed)
	if err != nil {
		rewardsJSON = []byte("{}")
	}

	if history.CompletedAt.IsZero() {
		history.CompletedAt = time.Now()
	}

	err = r.db.pool.QueryRow(ctx,
		"select player.record_quest_history($1, $2, $3, $4::jsonb)",
		history.CharacterID, history.QuestID, history.CompletedAt, rewardsJSON,
	).Scan(&history.ID)

	if err != nil {
		return pkgerrors.Wrap(err, "failed to record quest history")
	}

	return nil
}

func (r *QuestRepository) GetCompletedQuestIDs(ctx context.Context, characterID int64) ([]int, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_completed_quest_ids($1)", characterID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to get completed quest IDs")
	}
	defer rows.Close()

	questIDs := make([]int, 0)
	for rows.Next() {
		var questID int
		if err := rows.Scan(&questID); err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan quest ID")
		}
		questIDs = append(questIDs, questID)
	}

	return questIDs, nil
}

func (r *QuestRepository) GetCompletedQuestIDsWithDate(ctx context.Context, characterID int64) (map[int]time.Time, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_completed_quest_ids_with_date($1)", characterID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to get completed quest IDs with date")
	}
	defer rows.Close()

	result := make(map[int]time.Time)
	for rows.Next() {
		var questID int
		var completedAt time.Time
		if err := rows.Scan(&questID, &completedAt); err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan completed quest id with date")
		}
		result[questID] = completedAt
	}
	return result, rows.Err()
}

func (r *QuestRepository) scanQuestRows(rows pgx.Rows) ([]*quest.QuestProgress, error) {
	quests := make([]*quest.QuestProgress, 0)
	for rows.Next() {
		qp := &quest.QuestProgress{}
		var objectivesJSON []byte
		var status int

		err := rows.Scan(
			&qp.ID, &qp.CharacterID, &qp.QuestID, &status, &objectivesJSON,
			&qp.StartedAt, &qp.CompletedAt, &qp.ExpiresAt,
			&qp.CompletionCount, &qp.LastReset,
		)
		if err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan quest row")
		}

		qp.Status = quest.QuestStatus(status)
		if len(objectivesJSON) > 0 {
			if err := json.Unmarshal(objectivesJSON, &qp.Objectives); err != nil {
				qp.Objectives = []quest.Objective{}
			}
		} else {
			qp.Objectives = []quest.Objective{}
		}

		quests = append(quests, qp)
	}

	return quests, nil
}
