// Open-sourced by BaoLT

// PostgreSQL implementation of the quest-loop-state repository.
// Backs internal/domain/quest.LoopRepository via the
// player.character_quest_loops table and its three schema functions.
package postgres

import (
	"context"

	"mcgame-server/internal/domain/quest"
	pkgerrors "mcgame-server/pkg/errors"
)

type QuestLoopRepository struct {
	db *Database
}

func NewQuestLoopRepository(db *Database) *QuestLoopRepository {
	return &QuestLoopRepository{db: db}
}

type loopStateScanner interface {
	Scan(dest ...interface{}) error
}

func scanLoopState(row loopStateScanner) (*quest.LoopState, error) {
	state := &quest.LoopState{}
	var activeQuestID *int

	if err := row.Scan(
		&state.ID, &state.CharacterID, &state.LoopID, &state.Ft,
		&state.TakeDateMs, &state.Active, &activeQuestID, &state.UpdatedAt,
	); err != nil {
		return nil, pkgerrors.Wrap(err, "failed to scan quest loop state")
	}
	if activeQuestID != nil {
		state.ActiveQuestID = *activeQuestID
	}
	return state, nil
}

func (r *QuestLoopRepository) GetAll(ctx context.Context, characterID int64) ([]*quest.LoopState, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_character_quest_loops($1)", characterID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to get character quest loops")
	}
	defer rows.Close()

	states := make([]*quest.LoopState, 0)
	for rows.Next() {
		state, err := scanLoopState(rows)
		if err != nil {
			return nil, err
		}
		states = append(states, state)
	}
	return states, rows.Err()
}

func (r *QuestLoopRepository) Upsert(ctx context.Context, state *quest.LoopState) (*quest.LoopState, error) {
	var activeQuestID *int
	if state.ActiveQuestID > 0 {
		id := state.ActiveQuestID
		activeQuestID = &id
	}

	row := r.db.pool.QueryRow(ctx,
		"select * from player.upsert_character_quest_loop($1, $2, $3, $4, $5, $6)",
		state.CharacterID, state.LoopID, state.Ft, state.TakeDateMs, state.Active, activeQuestID,
	)
	return scanLoopState(row)
}

func (r *QuestLoopRepository) Deactivate(ctx context.Context, characterID int64, loopID int) (bool, error) {
	var deactivated bool
	if err := r.db.pool.QueryRow(ctx, "select player.deactivate_character_quest_loop($1, $2)", characterID, loopID).Scan(&deactivated); err != nil {
		return false, pkgerrors.Wrap(err, "failed to deactivate quest loop")
	}
	return deactivated, nil
}
