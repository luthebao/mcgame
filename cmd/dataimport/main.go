// Open-sourced by BaoLT

// Data import tool for loading JSON game data into PostgreSQL.
// Reads JSON files with format ID_TABLENAME.json and upserts to data schema.
// Supports dry-run mode and single-table imports for testing.
package main

import (
	"context"
	"encoding/json"
	"flag"
	"fmt"
	"os"
	"path/filepath"
	"strconv"
	"strings"
	"time"

	"go.uber.org/zap"

	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/infrastructure/config"
	"mcgame-server/internal/infrastructure/logger"
	"mcgame-server/internal/infrastructure/persistence/postgres"
)

func main() {
	dataDir := flag.String("data", "./docs/data", "Path to JSON data directory")
	dryRun := flag.Bool("dry-run", false, "Show what would be imported without actually importing")
	tableName := flag.String("table", "", "Import only this specific table (e.g., TBL_CLASSS)")
	flag.Parse()

	cfg, err := config.Load()
	if err != nil {
		fmt.Fprintf(os.Stderr, "Failed to load config: %v\n", err)
		os.Exit(1)
	}

	log, err := logger.New(cfg.Logging)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Failed to create logger: %v\n", err)
		os.Exit(1)
	}
	defer log.Sync()

	log.Info("Starting game data import",
		zap.String("data_dir", *dataDir),
		zap.Bool("dry_run", *dryRun))

	var repo gamedata.Repository
	if !*dryRun {
		db, err := postgres.NewDatabase(cfg.Database, log)
		if err != nil {
			log.Fatal("Failed to connect to database", zap.Error(err))
		}
		defer db.Close()
		repo = postgres.NewGameDataRepository(db)
	}

	files, err := filepath.Glob(filepath.Join(*dataDir, "*.json"))
	if err != nil {
		log.Fatal("Failed to read data directory", zap.Error(err))
	}

	log.Info("Found JSON files", zap.Int("count", len(files)))

	ctx := context.Background()
	totalRecords := 0
	totalTables := 0
	startTime := time.Now()

	for _, file := range files {
		baseName := filepath.Base(file)
		baseName = strings.TrimSuffix(baseName, ".json")
		parts := strings.SplitN(baseName, "_", 2)
		if len(parts) != 2 {
			log.Warn("Skipping file with invalid name format", zap.String("file", baseName))
			continue
		}

		tblName := parts[1]

		if *tableName != "" && tblName != *tableName {
			continue
		}

		data, err := os.ReadFile(file)
		if err != nil {
			log.Error("Failed to read file", zap.String("file", file), zap.Error(err))
			continue
		}

		var jsonData struct {
			Data []json.RawMessage `json:"data"`
		}
		if err := json.Unmarshal(data, &jsonData); err != nil {
			log.Error("Failed to parse JSON", zap.String("file", file), zap.Error(err))
			continue
		}

		if len(jsonData.Data) == 0 {
			log.Warn("Empty data array", zap.String("file", file))
			continue
		}

		records := make([]gamedata.Record, 0, len(jsonData.Data))
		for _, rawRecord := range jsonData.Data {
			var idHolder struct {
				ID interface{} `json:"id"`
			}
			if err := json.Unmarshal(rawRecord, &idHolder); err != nil {
				log.Error("Failed to parse record ID", zap.Error(err))
				continue
			}

			var recordID int
			switch v := idHolder.ID.(type) {
			case float64:
				recordID = int(v)
			case string:
				recordID, err = strconv.Atoi(v)
				if err != nil {
					log.Warn("Invalid record ID", zap.String("id", v))
					continue
				}
			default:
				log.Warn("Unknown ID type", zap.Any("id", idHolder.ID))
				continue
			}

			records = append(records, gamedata.Record{
				ID:   recordID,
				Data: rawRecord,
			})
		}

		if *dryRun {
			log.Info("Would import table",
				zap.String("table", tblName),
				zap.Int("records", len(records)))
		} else {
			batchSize := 1000
			for i := 0; i < len(records); i += batchSize {
				end := i + batchSize
				if end > len(records) {
					end = len(records)
				}
				batch := records[i:end]

				if err := repo.UpsertBatch(ctx, tblName, batch); err != nil {
					log.Error("Failed to import batch",
						zap.String("table", tblName),
						zap.Int("batch_start", i),
						zap.Error(err))
					continue
				}
			}

			log.Info("Imported table",
				zap.String("table", tblName),
				zap.Int("records", len(records)))
		}

		totalRecords += len(records)
		totalTables++
	}

	elapsed := time.Since(startTime)
	log.Info("Import complete",
		zap.Int("tables", totalTables),
		zap.Int("total_records", totalRecords),
		zap.Duration("elapsed", elapsed))
}
