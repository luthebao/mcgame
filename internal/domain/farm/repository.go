// Open-sourced by BaoLT

// Repository defines persistence operations for farm plots.
package farm

import "context"

type Repository interface {
	FindByCharacter(ctx context.Context, characterID int64) ([]*Plot, error)
	FindByCharacterAndPlot(ctx context.Context, characterID int64, plotNPCID int) (*Plot, error)
	FindByPlot(ctx context.Context, plotNPCID int) (*Plot, error)
	FindByPlots(ctx context.Context, plotNPCIDs []int) ([]*Plot, error)
	Upsert(ctx context.Context, plot *Plot) error
	Delete(ctx context.Context, characterID int64, plotNPCID int) error
}
