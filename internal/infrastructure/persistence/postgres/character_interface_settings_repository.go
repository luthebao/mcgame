// Open-sourced by BaoLT

// PostgreSQL persistence for character interface settings.
package postgres

import (
	"context"
	"encoding/json"
	"errors"

	pkgerrors "mcgame-server/pkg/errors"

	"github.com/jackc/pgx/v5"
)

type CharacterInterfaceSettingsRepository struct {
	db *Database
}

func NewCharacterInterfaceSettingsRepository(db *Database) *CharacterInterfaceSettingsRepository {
	return &CharacterInterfaceSettingsRepository{db: db}
}

func (r *CharacterInterfaceSettingsRepository) GetByCharacterID(ctx context.Context, characterID int64) (map[string]interface{}, error) {
	var payload []byte
	err := r.db.pool.QueryRow(ctx, "select player.get_character_interface_settings($1)", characterID).Scan(&payload)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return map[string]interface{}{}, nil
		}
		return nil, pkgerrors.Wrap(err, "failed to load character interface settings")
	}

	settings := map[string]interface{}{}
	if len(payload) == 0 {
		return settings, nil
	}
	if err := json.Unmarshal(payload, &settings); err != nil {
		return nil, pkgerrors.Wrap(err, "failed to decode character interface settings")
	}

	return settings, nil
}

func (r *CharacterInterfaceSettingsRepository) Upsert(ctx context.Context, characterID int64, settings map[string]interface{}) error {
	if settings == nil {
		settings = map[string]interface{}{}
	}

	payload, err := json.Marshal(settings)
	if err != nil {
		return pkgerrors.Wrap(err, "failed to encode character interface settings")
	}

	if _, err := r.db.pool.Exec(ctx,
		"select player.upsert_character_interface_settings($1, $2::jsonb)",
		characterID, payload,
	); err != nil {
		return pkgerrors.Wrap(err, "failed to upsert character interface settings")
	}

	return nil
}
