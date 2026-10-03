// Open-sourced by BaoLT

// Script to generate SQL seed data files from merged GameData.as and moreData.as tables.
// Parses GamePredef.as to extract table mappings and merges moreData.as onto GameData.as.
// Generates SQL files with CREATE TABLE and INSERT statements.
//
// Usage: go run cmd/seedgen/main.go [options]
//
// Options:
//   -predef string   Path to GamePredef.as file
//   -gamedata string Path to GameData.as file
//   -moredata string Path to moreData.as file
//   -out string      Output directory for SQL files (default: ./docker-supabase/mcgame/data-new)
//   -start int       Starting file number for SQL files (default: 100)

package main

import (
	"flag"
	"fmt"
	"os"
	"path/filepath"
	"sort"
	"strconv"
	"strings"
	"unicode"

	"mcgame-server/internal/gamedata/asparser"
)

type TableMapping = asparser.TableMapping

type TableData = asparser.TableData

type ColumnInfo struct {
	Name       string
	SQLName    string
	IsNumeric  bool
	IsNullable bool
}

func main() {
	predefPath := flag.String("predef", "docs/client/predef/GamePredef.as", "Path to GamePredef.as file")
	gamedataPath := flag.String("gamedata", "docs/client/data/GameData.as", "Path to GameData.as file")
	moredataPath := flag.String("moredata", "docs/client/data/moreData.as", "Path to moreData.as overlay file; set empty to use only GameData.as")
	outDir := flag.String("out", "./docker-supabase/mcgame/data-new", "Output directory for SQL files")
	startNum := flag.Int("start", 100, "Starting file number for SQL files")
	flag.Parse()

	// Parse GamePredef.as to get table mappings
	tableMappings, err := asparser.ParseGamePredef(*predefPath)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error parsing GamePredef.as: %v\n", err)
		os.Exit(1)
	}
	fmt.Printf("Found %d table mappings in GamePredef.as\n", len(tableMappings))

	// Parse GameData.as and merge moreData.as overlays
	tables, overlayMisses, err := asparser.ParseGameDataWithMoreData(*gamedataPath, *moredataPath)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error parsing game data source: %v\n", err)
		os.Exit(1)
	}
	if strings.TrimSpace(*moredataPath) != "" {
		fmt.Printf("Found %d tables with data in merged GameData.as + moreData.as\n", len(tables))
	} else {
		fmt.Printf("Found %d tables with data in GameData.as\n", len(tables))
	}
	if len(overlayMisses) > 0 {
		fmt.Fprintf(os.Stderr, "Warning: ignored %d moreData.as fields without matching GameData.as records\n", len(overlayMisses))
	}

	// Ensure output directory exists
	if err := os.MkdirAll(*outDir, 0755); err != nil {
		fmt.Fprintf(os.Stderr, "Error creating output directory: %v\n", err)
		os.Exit(1)
	}

	// Sort tables by ID
	tableIDs := make([]int, 0, len(tables))
	for id := range tables {
		tableIDs = append(tableIDs, id)
	}
	sort.Ints(tableIDs)

	// Process each table
	fileNum := *startNum
	successCount := 0

	for _, tableID := range tableIDs {
		tableData := tables[tableID]
		if len(tableData.Records) == 0 {
			continue
		}

		// Find table mapping
		var mapping *TableMapping
		for _, m := range tableMappings {
			if m.ID == tableID {
				mapping = &m
				break
			}
		}

		if mapping == nil {
			fmt.Printf("Skipping table ID %d: no mapping found in GamePredef.as\n", tableID)
			continue
		}

		// Analyze columns to determine types
		columns := analyzeColumns(tableData)
		if len(columns) == 0 {
			fmt.Printf("Skipping table %s: no columns found\n", mapping.SQLName)
			continue
		}

		// Generate SQL file
		sqlFileName := fmt.Sprintf("%03d_seed_%s.up.sql", fileNum, mapping.SQLName)
		sqlFilePath := filepath.Join(*outDir, sqlFileName)

		if err := generateSQLFile(sqlFilePath, mapping, tableData, columns); err != nil {
			fmt.Fprintf(os.Stderr, "Error generating %s: %v\n", sqlFileName, err)
			continue
		}

		fmt.Printf("Generated: %s (%d records, %d columns)\n", sqlFileName, len(tableData.Records), len(columns))
		fileNum++
		successCount++
	}

	fmt.Printf("\nSuccessfully generated %d SQL seed files\n", successCount)
}

// analyzeColumns determines column types based on data values
func analyzeColumns(table *TableData) []ColumnInfo {
	columns := make([]ColumnInfo, 0, len(table.Columns))

	for _, colName := range table.Columns {
		info := ColumnInfo{
			Name:       colName,
			SQLName:    camelToSnake(colName),
			IsNumeric:  true,
			IsNullable: false,
		}

		// Check all values to determine type
		for _, record := range table.Records {
			val, exists := record[colName]
			if !exists || val == "" {
				info.IsNullable = true
				continue
			}

			// Check if value is numeric
			if !isNumeric(val) {
				info.IsNumeric = false
			}
		}

		// Special case: id should always be numeric
		if colName == "id" {
			info.IsNumeric = true
			info.IsNullable = false
		}

		columns = append(columns, info)
	}

	return columns
}

// isNumeric checks if a string represents a number
func isNumeric(s string) bool {
	if s == "" {
		return false
	}

	s = strings.TrimSpace(s)
	if s == "" {
		return false
	}

	// Check for integer or float
	_, errInt := strconv.ParseInt(s, 10, 64)
	if errInt == nil {
		return true
	}

	_, errFloat := strconv.ParseFloat(s, 64)
	return errFloat == nil
}

// camelToSnake converts camelCase to snake_case
func camelToSnake(s string) string {
	var result strings.Builder
	for i, r := range s {
		if unicode.IsUpper(r) {
			if i > 0 {
				result.WriteRune('_')
			}
			result.WriteRune(unicode.ToLower(r))
		} else {
			result.WriteRune(r)
		}
	}
	return result.String()
}

// generateSQLFile generates a SQL file with CREATE TABLE and INSERT statements
func generateSQLFile(sqlPath string, mapping *TableMapping, table *TableData, columns []ColumnInfo) error {
	var sb strings.Builder

	// Write header
	sb.WriteString("-- ============================================\n")
	sb.WriteString(fmt.Sprintf("-- Seed Data for %s\n", mapping.SQLName))
	sb.WriteString(fmt.Sprintf("-- Table ID: %d (%s)\n", mapping.ID, mapping.ConstName))
	sb.WriteString(fmt.Sprintf("-- Records: %d\n", len(table.Records)))
	sb.WriteString("-- ============================================\n\n")

	// Generate DROP TABLE and CREATE TABLE
	sb.WriteString(fmt.Sprintf("DROP TABLE IF EXISTS data.%s CASCADE;\n", mapping.SQLName))
	sb.WriteString(fmt.Sprintf("CREATE TABLE IF NOT EXISTS data.%s (\n", mapping.SQLName))

	columnDefs := make([]string, len(columns))
	for i, col := range columns {
		var typeDef string
		if col.Name == "id" {
			typeDef = "INTEGER PRIMARY KEY"
		} else if col.IsNumeric {
			if col.IsNullable {
				typeDef = "NUMERIC"
			} else {
				typeDef = "NUMERIC NOT NULL"
			}
		} else {
			typeDef = "TEXT"
		}

		sqlColName := formatColumnName(col.SQLName)
		columnDefs[i] = fmt.Sprintf("    %s %s", sqlColName, typeDef)
	}
	sb.WriteString(strings.Join(columnDefs, ",\n"))
	sb.WriteString("\n);\n\n")

	// Generate INSERT statements
	sqlColNames := make([]string, len(columns))
	for i, col := range columns {
		sqlColNames[i] = formatColumnName(col.SQLName)
	}
	columnList := strings.Join(sqlColNames, ", ")

	for _, record := range table.Records {
		values := make([]string, len(columns))
		for i, col := range columns {
			val := record[col.Name]
			values[i] = formatValue(val, col.IsNumeric)
		}

		valueList := strings.Join(values, ", ")
		sb.WriteString(fmt.Sprintf("INSERT INTO data.%s (%s) VALUES (%s) ON CONFLICT (id) DO NOTHING;\n",
			mapping.SQLName, columnList, valueList))
	}

	// Write SQL file
	if err := os.WriteFile(sqlPath, []byte(sb.String()), 0644); err != nil {
		return fmt.Errorf("failed to write SQL file: %w", err)
	}

	return nil
}

// formatColumnName formats a column name, quoting reserved words
func formatColumnName(col string) string {
	reservedWords := map[string]bool{
		"check": true, "desc": true, "name": true, "type": true,
		"level": true, "order": true, "group": true, "key": true,
		"index": true, "value": true, "default": true, "column": true,
		"table": true, "from": true, "to": true, "user": true,
		"all": true, "select": true, "where": true, "and": true,
		"or": true, "not": true, "null": true, "true": true, "false": true,
	}

	if reservedWords[col] {
		return fmt.Sprintf("\"%s\"", col)
	}
	return col
}

// formatValue formats a value for SQL INSERT statement
func formatValue(val string, isNumeric bool) string {
	if val == "" {
		return "NULL"
	}

	if isNumeric {
		// Validate it's actually a number
		if _, err := strconv.ParseFloat(val, 64); err == nil {
			return val
		}
		// If not a valid number, treat as text
	}

	// Escape single quotes
	escaped := strings.ReplaceAll(val, "'", "''")
	return fmt.Sprintf("'%s'", escaped)
}
