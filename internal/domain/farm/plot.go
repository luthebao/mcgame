// Open-sourced by BaoLT

// Farm domain entities represent planted plots owned by a character.
package farm

import "time"

type Plot struct {
	ID                    int64
	CharacterID           int64
	PlotNPCID             int
	CropNPCID             int
	HarvestItemTemplateID int
	HarvestCount          int
	TotalHarvestCount     int
	SharedHarvesterIDs    []int64
	PlantedAt             time.Time
	ReadyAt               time.Time
	CreatedAt             time.Time
	UpdatedAt             time.Time
}
