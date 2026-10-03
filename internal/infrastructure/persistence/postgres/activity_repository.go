// Open-sourced by BaoLT

// PostgreSQL implementation of activity config repository.
package postgres

import (
	"context"
	"errors"

	"github.com/jackc/pgx/v5"

	domainactivity "mcgame-server/internal/domain/activity"
	pkgerrors "mcgame-server/pkg/errors"
)

type ActivityRepository struct {
	db *Database
}

func NewActivityRepository(db *Database) *ActivityRepository {
	return &ActivityRepository{db: db}
}

func (r *ActivityRepository) List(ctx context.Context) ([]*domainactivity.ActivityConfig, error) {
	rows, err := r.db.pool.Query(ctx, "select * from data.list_activity_configs()")
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to query activity configs")
	}
	defer rows.Close()

	configs := make([]*domainactivity.ActivityConfig, 0)
	for rows.Next() {
		config := &domainactivity.ActivityConfig{}
		if err := rows.Scan(
			&config.ID,
			&config.Name,
			&config.StyleName,
			&config.PanelKey,
			&config.FeatureKey,
			&config.SortType,
			&config.Enable,
			&config.Type,
			&config.Flag,
			&config.Note,
		); err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan activity config")
		}
		configs = append(configs, config)
	}

	if err := rows.Err(); err != nil {
		return nil, pkgerrors.Wrap(err, "activity config rows iteration failed")
	}

	return configs, nil
}

func (r *ActivityRepository) Get(ctx context.Context, id int) (*domainactivity.ActivityConfig, error) {
	row := r.db.pool.QueryRow(ctx, "select * from data.get_activity_config($1)", id)

	config := &domainactivity.ActivityConfig{}
	if err := row.Scan(
		&config.ID,
		&config.Name,
		&config.StyleName,
		&config.PanelKey,
		&config.FeatureKey,
		&config.SortType,
		&config.Enable,
		&config.Type,
		&config.Flag,
		&config.Note,
	); err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to query activity config by id")
	}

	return config, nil
}
