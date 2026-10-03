// Open-sourced by BaoLT

// PostgreSQL stat feature repository persists generic character and pet feature state alongside progression snapshots.
package postgres

import (
	"context"
	"encoding/json"
	"errors"
	"fmt"

	"mcgame-server/internal/domain/statfeature"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/jackc/pgx/v5"
)

type StatFeatureRepository struct {
	db *Database
}

func NewStatFeatureRepository(db *Database) *StatFeatureRepository {
	return &StatFeatureRepository{db: db}
}

func (r *StatFeatureRepository) GetCharacterProgression(ctx context.Context, charID int64) (*statfeature.CharacterProgression, error) {
	progression := &statfeature.CharacterProgression{}
	err := r.db.pool.QueryRow(ctx, "select * from player.get_character_progression($1)", charID).Scan(
		&progression.CharacterID,
		&progression.AwakenLevel,
		&progression.AwakenPoints,
		&progression.AwakenPointsUsed,
		&progression.SoulLevel,
		&progression.SoulExp,
		&progression.SoulPoints,
	)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, nil
		}
		return nil, pkgerrors.Wrap(err, "failed to load character progression")
	}

	return progression, nil
}

func (r *StatFeatureRepository) UpsertCharacterSoulProgression(ctx context.Context, charID int64, soulLevel int, soulExp int64) error {
	var stored bool
	if err := r.db.pool.QueryRow(
		ctx,
		"select player.upsert_character_soul_progression($1, $2, $3)",
		charID,
		soulLevel,
		soulExp,
	).Scan(&stored); err != nil {
		return pkgerrors.Wrap(err, "failed to upsert character soul progression")
	}
	return nil
}

func (r *StatFeatureRepository) ListCharacterFeatureStates(ctx context.Context, charID int64) ([]*statfeature.CharacterFeatureState, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.list_character_feature_states($1)", charID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to list character stat features")
	}
	defer rows.Close()

	states := make([]*statfeature.CharacterFeatureState, 0)
	for rows.Next() {
		state := &statfeature.CharacterFeatureState{CharacterID: charID}
		var raw []byte
		if err := rows.Scan(&state.FeatureKey, &raw); err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan character stat feature")
		}
		state.State = unmarshalFeatureState(raw)
		states = append(states, state)
	}

	return states, nil
}

func (r *StatFeatureRepository) UpsertCharacterFeatureState(ctx context.Context, state *statfeature.CharacterFeatureState) error {
	if state == nil {
		return nil
	}

	raw, err := json.Marshal(normalizeFeatureState(state.State))
	if err != nil {
		return pkgerrors.Wrap(err, "failed to marshal character stat feature state")
	}

	var stored bool
	if err := r.db.pool.QueryRow(
		ctx,
		"select player.upsert_character_feature_state($1, $2, $3::jsonb)",
		state.CharacterID,
		state.FeatureKey,
		raw,
	).Scan(&stored); err != nil {
		return pkgerrors.Wrap(err, "failed to upsert character stat feature state")
	}

	return nil
}

func (r *StatFeatureRepository) ListPetFeatureStates(ctx context.Context, petID int64) ([]*statfeature.PetFeatureState, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.list_pet_feature_states($1)", petID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to list pet stat features")
	}
	defer rows.Close()

	states := make([]*statfeature.PetFeatureState, 0)
	for rows.Next() {
		state := &statfeature.PetFeatureState{PetID: petID}
		var raw []byte
		if err := rows.Scan(&state.FeatureKey, &raw); err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan pet stat feature")
		}
		state.State = unmarshalFeatureState(raw)
		states = append(states, state)
	}

	return states, nil
}

func (r *StatFeatureRepository) UpsertPetFeatureState(ctx context.Context, state *statfeature.PetFeatureState) error {
	if state == nil {
		return nil
	}

	raw, err := json.Marshal(normalizeFeatureState(state.State))
	if err != nil {
		return pkgerrors.Wrap(err, "failed to marshal pet stat feature state")
	}

	var stored bool
	if err := r.db.pool.QueryRow(
		ctx,
		"select player.upsert_pet_feature_state($1, $2, $3::jsonb)",
		state.PetID,
		state.FeatureKey,
		raw,
	).Scan(&stored); err != nil {
		return pkgerrors.Wrap(err, "failed to upsert pet stat feature state")
	}

	return nil
}

func (r *StatFeatureRepository) PPVEChallengeNextFloor(ctx context.Context, charID int64, maxFloor int, freeChallenges int, today string) (*statfeature.PPVEChallengeResult, error) {
	var raw []byte
	err := r.db.pool.QueryRow(
		ctx,
		"select player.ppve_challenge_next_floor($1, $2, $3, $4)",
		charID,
		maxFloor,
		freeChallenges,
		today,
	).Scan(&raw)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "ppve_challenge_next_floor: db call failed")
	}

	result := unmarshalFeatureState(raw)

	if errVal, hasErr := result["error"]; hasErr {
		errStr, _ := errVal.(string)
		switch errStr {
		case "max_floor":
			return nil, statfeature.ErrPPVEMaxFloor
		case "no_free_challenges":
			return nil, statfeature.ErrPPVENoFreeChallenges
		}
		return nil, pkgerrors.Wrap(fmt.Errorf("ppve: unknown db error: %s", errStr), "ppve_challenge_next_floor")
	}

	floor, _ := toInt64(result["ppvefloor"])
	freeTime, _ := toInt64(result["freeTime"])
	todayFloor, _ := toInt64(result["todayFloor"])
	lastReset, _ := result["lastResetDay"].(string)

	return &statfeature.PPVEChallengeResult{
		NewFloor:     int(floor),
		FreeTime:     int(freeTime),
		TodayFloor:   int(todayFloor),
		LastResetDay: lastReset,
	}, nil
}

func (r *StatFeatureRepository) PPVEGetRank(ctx context.Context, charID int64, limit int) (*statfeature.PPVERankResult, error) {
	var raw []byte
	err := r.db.pool.QueryRow(ctx, "select player.get_ppve_rank($1, $2)", charID, limit).Scan(&raw)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "get_ppve_rank: db call failed")
	}

	var payload struct {
		Rank []struct {
			CID      string `json:"cid"`
			Name     string `json:"name"`
			ClassID  string `json:"classId"`
			Level    int    `json:"level"`
			FloorNum int    `json:"floorNum"`
		} `json:"rank"`
		MyRank int `json:"myRank"`
	}
	payload.MyRank = -1
	if len(raw) > 0 {
		if err := json.Unmarshal(raw, &payload); err != nil {
			return nil, pkgerrors.Wrap(err, "get_ppve_rank: decode failed")
		}
	}

	entries := make([]statfeature.PPVERankRow, 0, len(payload.Rank))
	for _, e := range payload.Rank {
		entries = append(entries, statfeature.PPVERankRow{
			CID:      e.CID,
			Name:     e.Name,
			ClassID:  e.ClassID,
			Level:    e.Level,
			FloorNum: e.FloorNum,
		})
	}
	return &statfeature.PPVERankResult{Entries: entries, MyRank: payload.MyRank}, nil
}

func (r *StatFeatureRepository) GetActiveMount(ctx context.Context, charID int64) (*statfeature.ActiveMount, error) {
	active := &statfeature.ActiveMount{}
	err := r.db.pool.QueryRow(ctx, "select * from player.get_active_mount($1)", charID).Scan(
		&active.CharacterID,
		&active.MountID,
		&active.Level,
		&active.Experience,
		&active.IsActive,
	)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, nil
		}
		return nil, pkgerrors.Wrap(err, "failed to load active mount")
	}

	return active, nil
}

func normalizeFeatureState(state map[string]interface{}) map[string]interface{} {
	if state == nil {
		return map[string]interface{}{}
	}
	return state
}

func unmarshalFeatureState(raw []byte) map[string]interface{} {
	if len(raw) == 0 {
		return map[string]interface{}{}
	}

	state := make(map[string]interface{})
	if err := json.Unmarshal(raw, &state); err != nil {
		return map[string]interface{}{}
	}

	return state
}

func toInt64(v interface{}) (int64, bool) {
	switch n := v.(type) {
	case float64:
		return int64(n), true
	case int64:
		return n, true
	case int:
		return int64(n), true
	}
	return 0, false
}
