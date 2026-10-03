// Open-sourced by BaoLT

// PostgreSQL implementation of title repository.
// Handles title CRUD operations using pgx driver.
// Supports title ownership, activation, and expiration management.
package postgres

import (
	"context"
	"errors"
	"fmt"

	pkgerrors "mcgame-server/pkg/errors"

	"github.com/jackc/pgx/v5"
)

// TitleRepository handles title data persistence using PostgreSQL.
type TitleRepository struct {
	db *Database
}

// NewTitleRepository creates a new title repository.
func NewTitleRepository(db *Database) *TitleRepository {
	return &TitleRepository{db: db}
}

// GetCharacterTitles retrieves all regular titles owned by a character.
func (r *TitleRepository) GetCharacterTitles(ctx context.Context, characterID int64) ([]int, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_character_titles($1)", characterID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to query character titles")
	}
	defer rows.Close()

	var titles []int
	for rows.Next() {
		var titleID int
		if err := rows.Scan(&titleID); err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan title ID")
		}
		titles = append(titles, titleID)
	}

	if err := rows.Err(); err != nil {
		return nil, pkgerrors.Wrap(err, "rows iteration failed")
	}

	return titles, nil
}

// GetCharacterSpecialTitles retrieves all special titles owned by a character.
// Special titles are typically event-based or achievement titles (s IN (1, 2)).
func (r *TitleRepository) GetCharacterSpecialTitles(ctx context.Context, characterID int64) ([]int, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_character_special_titles($1)", characterID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to query special titles")
	}
	defer rows.Close()

	var titles []int
	for rows.Next() {
		var titleID int
		if err := rows.Scan(&titleID); err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan special title ID")
		}
		titles = append(titles, titleID)
	}

	if err := rows.Err(); err != nil {
		return nil, pkgerrors.Wrap(err, "rows iteration failed")
	}

	return titles, nil
}

// HasTitle checks if a character owns a specific title.
func (r *TitleRepository) HasTitle(ctx context.Context, characterID int64, titleID int) (bool, error) {
	var exists bool
	err := r.db.pool.QueryRow(ctx, "select player.has_title($1, $2)", characterID, titleID).Scan(&exists)
	if err != nil {
		return false, pkgerrors.Wrap(err, "failed to check title ownership")
	}

	return exists, nil
}

func (r *TitleRepository) AddTitle(ctx context.Context, characterID int64, titleID int) error {
	_, err := r.db.pool.Exec(ctx, "select player.add_character_title($1, $2)", characterID, titleID)
	if err != nil {
		return pkgerrors.Wrap(err, "failed to insert character title")
	}

	return nil
}

// GetActiveTitle retrieves the currently active title for a character.
// Returns 0 if no title is active.
func (r *TitleRepository) GetActiveTitle(ctx context.Context, characterID int64) (int, error) {
	var titleID int
	err := r.db.pool.QueryRow(ctx, "select * from player.get_active_title($1)", characterID).Scan(&titleID)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return 0, nil
		}
		return 0, pkgerrors.Wrap(err, "failed to get active title")
	}

	return titleID, nil
}

// GetActiveSpecialTitle retrieves the currently active special title for a character.
// Returns 0 if no special title is active.
func (r *TitleRepository) GetActiveSpecialTitle(ctx context.Context, characterID int64) (int, error) {
	var titleID int
	err := r.db.pool.QueryRow(ctx, "select * from player.get_active_special_title($1)", characterID).Scan(&titleID)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return 0, nil
		}
		return 0, pkgerrors.Wrap(err, "failed to get active special title")
	}

	return titleID, nil
}

// SetActiveTitle sets the active title for a character.
// If titleID is -1 or 0, all titles are deactivated.
func (r *TitleRepository) SetActiveTitle(ctx context.Context, characterID int64, titleID int) error {
	var updated bool
	err := r.db.pool.QueryRow(ctx, "select player.set_active_title($1, $2)", characterID, titleID).Scan(&updated)
	if err != nil {
		return pkgerrors.Wrap(err, "failed to set active title")
	}

	if !updated {
		return fmt.Errorf("title not found or expired")
	}

	return nil
}

// SetActiveSpecialTitle sets the active special title for a character.
// If titleID is -1 or 0, all special titles are deactivated.
func (r *TitleRepository) SetActiveSpecialTitle(ctx context.Context, characterID int64, titleID int) error {
	var updated bool
	err := r.db.pool.QueryRow(ctx, "select player.set_active_special_title($1, $2)", characterID, titleID).Scan(&updated)
	if err != nil {
		return pkgerrors.Wrap(err, "failed to set active special title")
	}

	if !updated {
		return fmt.Errorf("special title not found or expired")
	}

	return nil
}
