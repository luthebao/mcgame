// Open-sourced by BaoLT

// PostgreSQL implementation of farm plot persistence.
package postgres

import (
	"context"
	"errors"

	domainfarm "mcgame-server/internal/domain/farm"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/jackc/pgx/v5"
)

type FarmRepository struct {
	db *Database
}

func NewFarmRepository(db *Database) *FarmRepository {
	return &FarmRepository{db: db}
}

func (r *FarmRepository) FindByCharacter(ctx context.Context, characterID int64) ([]*domainfarm.Plot, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_character_farm_plots($1)", characterID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to query character farm plots")
	}
	defer rows.Close()

	plots := make([]*domainfarm.Plot, 0)
	for rows.Next() {
		plot, err := scanFarmPlot(rows)
		if err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan character farm plot")
		}
		plots = append(plots, plot)
	}

	return plots, nil
}

func (r *FarmRepository) FindByCharacterAndPlot(ctx context.Context, characterID int64, plotNPCID int) (*domainfarm.Plot, error) {
	plot, err := scanFarmPlot(r.db.pool.QueryRow(ctx, "select * from player.get_character_farm_plot($1, $2)", characterID, plotNPCID))
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, nil
		}
		return nil, pkgerrors.Wrap(err, "failed to query character farm plot by npc id")
	}

	return plot, nil
}

func (r *FarmRepository) FindByPlot(ctx context.Context, plotNPCID int) (*domainfarm.Plot, error) {
	plot, err := scanFarmPlot(r.db.pool.QueryRow(ctx, "select * from player.get_latest_farm_plot($1)", plotNPCID))
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, nil
		}
		return nil, pkgerrors.Wrap(err, "failed to query farm plot by npc id")
	}

	return plot, nil
}

func (r *FarmRepository) FindByPlots(ctx context.Context, plotNPCIDs []int) ([]*domainfarm.Plot, error) {
	if len(plotNPCIDs) == 0 {
		return []*domainfarm.Plot{}, nil
	}

	plotIDList := make([]int32, 0, len(plotNPCIDs))
	for _, plotNPCID := range plotNPCIDs {
		plotIDList = append(plotIDList, int32(plotNPCID))
	}

	rows, err := r.db.pool.Query(ctx, "select * from player.get_farm_plots_by_npc_ids($1::int4[])", plotIDList)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to query farm plots by npc ids")
	}
	defer rows.Close()

	plots := make([]*domainfarm.Plot, 0, len(plotNPCIDs))
	for rows.Next() {
		plot, err := scanFarmPlot(rows)
		if err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan farm plot by npc ids")
		}
		plots = append(plots, plot)
	}

	return plots, nil
}

func (r *FarmRepository) Upsert(ctx context.Context, plot *domainfarm.Plot) error {
	if plot.SharedHarvesterIDs == nil {
		plot.SharedHarvesterIDs = []int64{}
	}

	err := r.db.pool.QueryRow(
		ctx,
		"select * from player.upsert_character_farm_plot($1, $2, $3, $4, $5, $6, $7, $8, $9)",
		plot.CharacterID,
		plot.PlotNPCID,
		plot.CropNPCID,
		plot.HarvestItemTemplateID,
		plot.HarvestCount,
		plot.TotalHarvestCount,
		plot.SharedHarvesterIDs,
		plot.PlantedAt,
		plot.ReadyAt,
	).Scan(&plot.ID, &plot.CreatedAt, &plot.UpdatedAt)
	if err != nil {
		return pkgerrors.Wrap(err, "failed to upsert character farm plot")
	}

	return nil
}

func (r *FarmRepository) Delete(ctx context.Context, characterID int64, plotNPCID int) error {
	_, err := r.db.pool.Exec(ctx, "select player.delete_character_farm_plot($1, $2)", characterID, plotNPCID)
	if err != nil {
		return pkgerrors.Wrap(err, "failed to delete character farm plot")
	}
	return nil
}

type farmPlotScanner interface {
	Scan(dest ...interface{}) error
}

func scanFarmPlot(scanner farmPlotScanner) (*domainfarm.Plot, error) {
	plot := &domainfarm.Plot{}
	if err := scanner.Scan(
		&plot.ID,
		&plot.CharacterID,
		&plot.PlotNPCID,
		&plot.CropNPCID,
		&plot.HarvestItemTemplateID,
		&plot.HarvestCount,
		&plot.TotalHarvestCount,
		&plot.SharedHarvesterIDs,
		&plot.PlantedAt,
		&plot.ReadyAt,
		&plot.CreatedAt,
		&plot.UpdatedAt,
	); err != nil {
		return nil, err
	}

	return plot, nil
}
