// Open-sourced by BaoLT

// Game data export tool for writing merged GameData.as and moreData.as tables to JSON files.
package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"os"
	"path/filepath"
	"sort"
	"strings"
	"time"

	"mcgame-server/internal/gamedata/asparser"
)

type tableExport struct {
	Name        string            `json:"name"`
	RecordCount int               `json:"recordCount"`
	Records     []json.RawMessage `json:"records"`
}

type exportPayload struct {
	ExportedAt  string        `json:"exportedAt"`
	Source      string        `json:"source"`
	TableCount  int           `json:"tableCount"`
	RecordCount int           `json:"recordCount"`
	Tables      []tableExport `json:"tables"`
}

type singleTablePayload struct {
	ExportedAt  string            `json:"exportedAt"`
	Source      string            `json:"source"`
	Name        string            `json:"name"`
	RecordCount int               `json:"recordCount"`
	Records     []json.RawMessage `json:"records"`
}

func main() {
	_ = flag.String("config", "", "Deprecated; export now reads from GameData.as instead of the database")
	predefPath := flag.String("predef", "docs/client/predef/GamePredef.as", "Path to GamePredef.as file")
	gamedataPath := flag.String("gamedata", "docs/client/data/GameData.as", "Path to GameData.as file")
	moredataPath := flag.String("moredata", "docs/client/data/moreData.as", "Path to moreData.as overlay file; set empty to export only GameData.as")
	outPath := flag.String("out", "./docs/data/game_data_export.json", "Output JSON file path")
	outDir := flag.String("outdir", "", "Output directory for per-table JSON files (writes one <TBL_*.json> file per exported table)")
	tablesFlag := flag.String("tables", "", "Comma-separated table names to export (defaults to all tables)")
	flag.Parse()

	mappings, err := asparser.ParseGamePredef(*predefPath)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Failed to parse GamePredef.as: %v\n", err)
		os.Exit(1)
	}
	sort.Slice(mappings, func(i, j int) bool {
		return mappings[i].ID < mappings[j].ID
	})

	selectedTables, err := normalizeSelectedTables(*tablesFlag, mappings)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Invalid table selection: %v\n", err)
		os.Exit(1)
	}

	tablesByID, overlayMisses, err := asparser.ParseGameDataWithMoreData(*gamedataPath, *moredataPath)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Failed to parse game data source: %v\n", err)
		os.Exit(1)
	}

	sourceLabel := *gamedataPath
	if strings.TrimSpace(*moredataPath) != "" {
		sourceLabel = *gamedataPath + " + " + *moredataPath
	}
	if len(overlayMisses) > 0 {
		fmt.Fprintf(os.Stderr, "Warning: ignored %d moreData.as fields without matching GameData.as records\n", len(overlayMisses))
	}

	exportedAt := time.Now().UTC().Format(time.RFC3339)
	payload := exportPayload{
		ExportedAt: exportedAt,
		Source:     sourceLabel,
		Tables:     make([]tableExport, 0, len(mappings)),
	}
	writtenFiles := 0
	writePerTable := strings.TrimSpace(*outDir) != ""
	if writePerTable {
		if err := os.MkdirAll(*outDir, 0755); err != nil {
			fmt.Fprintf(os.Stderr, "Failed to create output directory %s: %v\n", *outDir, err)
			os.Exit(1)
		}
	}

	for _, mapping := range mappings {
		if len(selectedTables) > 0 {
			if _, ok := selectedTables[mapping.ConstName]; !ok {
				continue
			}
		}

		table := tablesByID[mapping.ID]
		records := make([]json.RawMessage, 0)
		if table != nil {
			records = make([]json.RawMessage, 0, len(table.Records))
			for _, record := range table.Records {
				encoded, err := json.Marshal(record)
				if err != nil {
					fmt.Fprintf(os.Stderr, "Failed to encode table %s record: %v\n", mapping.ConstName, err)
					os.Exit(1)
				}
				records = append(records, encoded)
			}
		}

		payload.Tables = append(payload.Tables, tableExport{
			Name:        mapping.ConstName,
			RecordCount: len(records),
			Records:     records,
		})
		payload.RecordCount += len(records)

		if writePerTable {
			tablePayload := singleTablePayload{
				ExportedAt:  exportedAt,
				Source:      sourceLabel,
				Name:        mapping.ConstName,
				RecordCount: len(records),
				Records:     records,
			}
			if err := writeJSONFile(filepath.Join(*outDir, mapping.ConstName+".json"), tablePayload); err != nil {
				fmt.Fprintf(os.Stderr, "Failed to write table export for %s: %v\n", mapping.ConstName, err)
				os.Exit(1)
			}
			writtenFiles++
		}
	}

	payload.TableCount = len(payload.Tables)

	if strings.TrimSpace(*outPath) != "" {
		if err := writeJSONFile(*outPath, payload); err != nil {
			fmt.Fprintf(os.Stderr, "Failed to write export file %s: %v\n", *outPath, err)
			os.Exit(1)
		}
	}

	if writePerTable && strings.TrimSpace(*outPath) != "" {
		fmt.Printf("Game data export complete: %s and %s (%d tables, %d records, %d per-table files)\n", *outPath, *outDir, payload.TableCount, payload.RecordCount, writtenFiles)
		return
	}
	if writePerTable {
		fmt.Printf("Game data export complete: %s (%d tables, %d records, %d per-table files)\n", *outDir, payload.TableCount, payload.RecordCount, writtenFiles)
		return
	}
	fmt.Printf("Game data export complete: %s (%d tables, %d records)\n", *outPath, payload.TableCount, payload.RecordCount)
}

func writeJSONFile(path string, value interface{}) error {
	if err := os.MkdirAll(filepath.Dir(path), 0755); err != nil {
		return err
	}
	encoded, err := json.MarshalIndent(value, "", "  ")
	if err != nil {
		return err
	}
	return os.WriteFile(path, append(encoded, '\n'), 0644)
}

func normalizeSelectedTables(raw string, mappings []asparser.TableMapping) (map[string]struct{}, error) {
	if strings.TrimSpace(raw) == "" {
		return nil, nil
	}

	availableSet := make(map[string]struct{}, len(mappings))
	for _, mapping := range mappings {
		availableSet[mapping.ConstName] = struct{}{}
	}

	selected := make(map[string]struct{})
	for _, part := range strings.Split(raw, ",") {
		tableName := strings.ToUpper(strings.TrimSpace(part))
		if tableName == "" {
			continue
		}
		if _, ok := availableSet[tableName]; !ok {
			return nil, fmt.Errorf("unknown table %q", tableName)
		}
		selected[tableName] = struct{}{}
	}

	if len(selected) == 0 {
		return nil, nil
	}

	return selected, nil
}
