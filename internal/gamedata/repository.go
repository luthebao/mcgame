// Open-sourced by BaoLT

package gamedata

import (
	"context"
	"encoding/json"
)

// Repository defines the interface for game data persistence
type Repository interface {
	// GetByTableAndID retrieves a single record by table name and record ID
	GetByTableAndID(ctx context.Context, tableName string, recordID int) (json.RawMessage, error)

	// GetAllByTable retrieves all records for a table
	GetAllByTable(ctx context.Context, tableName string) ([]json.RawMessage, error)

	// Upsert inserts or updates a record
	Upsert(ctx context.Context, tableName string, recordID int, data json.RawMessage) error

	// UpsertBatch inserts or updates multiple records efficiently
	UpsertBatch(ctx context.Context, tableName string, records []Record) error

	// DeleteByTableAndID deletes a single record
	DeleteByTableAndID(ctx context.Context, tableName string, recordID int) error

	// DeleteAllByTable deletes all records for a table
	DeleteAllByTable(ctx context.Context, tableName string) error

	// CountByTable returns the count of records in a table
	CountByTable(ctx context.Context, tableName string) (int, error)

	// GetTableNames returns all table names with data
	GetTableNames(ctx context.Context) ([]string, error)
}

// Record represents a single game data record
type Record struct {
	ID   int
	Data json.RawMessage
}
