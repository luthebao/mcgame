// Open-sourced by BaoLT

// Seed sync tool for checking merged GameData.as and moreData.as coverage in supabase/seed.sql and appending missing rows.
package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"os"
	"path/filepath"
	"regexp"
	"sort"
	"strconv"
	"strings"
	"unicode"

	"mcgame-server/internal/gamedata/asparser"
)

type tableSummary struct {
	SQLName      string
	ConstName    string
	ExportCount  int
	SeedCount    int
	MissingCount int
}

type exportedTableFile struct {
	Name        string              `json:"name"`
	RecordCount int                 `json:"recordCount"`
	Records     []map[string]string `json:"records"`
}

var insertHeaderPattern = regexp.MustCompile(`^INSERT INTO "data"\."([a-z0-9_]+)" \((.*)\) VALUES$`)

func main() {
	predefPath := flag.String("predef", "docs/client/predef/GamePredef.as", "Path to GamePredef.as file")
	gamedataPath := flag.String("gamedata", "docs/client/data/GameData.as", "Path to GameData.as file")
	moredataPath := flag.String("moredata", "docs/client/data/moreData.as", "Path to moreData.as overlay file; set empty to compare only GameData.as")
	jsonDir := flag.String("jsondir", "", "Directory containing per-table TBL_*.json exports")
	seedPath := flag.String("seed", "./supabase/seed.sql", "Path to seed.sql file")
	writeChanges := flag.Bool("write", false, "Write missing exported rows into seed.sql")
	flag.Parse()

	mappings, err := asparser.ParseGamePredef(*predefPath)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Failed to parse GamePredef.as: %v\n", err)
		os.Exit(1)
	}
	sort.Slice(mappings, func(i, j int) bool {
		return mappings[i].ID < mappings[j].ID
	})

	var tables map[int]*asparser.TableData
	if strings.TrimSpace(*jsonDir) != "" {
		tables, err = loadTablesFromJSONDir(*jsonDir, mappings)
		if err != nil {
			fmt.Fprintf(os.Stderr, "Failed to load per-table exports: %v\n", err)
			os.Exit(1)
		}
	} else {
		var overlayMisses []asparser.OverlayMiss
		tables, overlayMisses, err = asparser.ParseGameDataWithMoreData(*gamedataPath, *moredataPath)
		if err != nil {
			fmt.Fprintf(os.Stderr, "Failed to parse game data source: %v\n", err)
			os.Exit(1)
		}
		if len(overlayMisses) > 0 {
			fmt.Fprintf(os.Stderr, "Warning: ignored %d moreData.as fields without matching GameData.as records\n", len(overlayMisses))
		}
	}

	original, err := os.ReadFile(*seedPath)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Failed to read seed.sql: %v\n", err)
		os.Exit(1)
	}

	updated, summaries, changed, err := reconcileSeed(string(original), mappings, tables)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Failed to reconcile seed.sql: %v\n", err)
		os.Exit(1)
	}

	missingTables := 0
	missingRows := 0
	for _, summary := range summaries {
		if summary.MissingCount == 0 {
			continue
		}
		missingTables++
		missingRows += summary.MissingCount
		fmt.Printf("%s (%s): exported=%d seed=%d missing=%d\n", summary.ConstName, summary.SQLName, summary.ExportCount, summary.SeedCount, summary.MissingCount)
	}

	if missingTables == 0 {
		if strings.TrimSpace(*jsonDir) != "" {
			fmt.Println("seed.sql already contains all exported JSON rows")
			return
		}
		if strings.TrimSpace(*moredataPath) != "" {
			fmt.Println("seed.sql already contains all exported GameData.as + moreData.as rows")
			return
		}
		fmt.Println("seed.sql already contains all exported GameData.as rows")
		return
	}

	fmt.Printf("Missing coverage: %d tables, %d rows\n", missingTables, missingRows)

	if !*writeChanges {
		fmt.Println("Run with -write to append the missing rows into seed.sql")
		return
	}

	if !changed {
		fmt.Println("No seed.sql changes were required")
		return
	}

	if err := os.WriteFile(*seedPath, []byte(updated), 0644); err != nil {
		fmt.Fprintf(os.Stderr, "Failed to write updated seed.sql: %v\n", err)
		os.Exit(1)
	}

	fmt.Printf("Updated %s with %d missing rows across %d tables\n", *seedPath, missingRows, missingTables)
}

func reconcileSeed(seedSQL string, mappings []asparser.TableMapping, tables map[int]*asparser.TableData) (string, []tableSummary, bool, error) {
	mappingBySQL := make(map[string]asparser.TableMapping, len(mappings))
	tableBySQL := make(map[string]*asparser.TableData, len(mappings))
	for _, mapping := range mappings {
		mappingBySQL[mapping.SQLName] = mapping
		if table := tables[mapping.ID]; table != nil {
			tableBySQL[mapping.SQLName] = table
		}
	}

	lines := strings.Split(seedSQL, "\n")
	seenTables := make(map[string]struct{})
	for _, line := range lines {
		matches := insertHeaderPattern.FindStringSubmatch(line)
		if matches != nil {
			seenTables[matches[1]] = struct{}{}
		}
	}

	missingWholeTables := make([]asparser.TableMapping, 0)
	for _, mapping := range mappings {
		table := tableBySQL[mapping.SQLName]
		if table == nil || len(table.Records) == 0 {
			continue
		}
		if _, ok := seenTables[mapping.SQLName]; ok {
			continue
		}
		missingWholeTables = append(missingWholeTables, mapping)
	}

	summaries := make([]tableSummary, 0)
	var output strings.Builder
	insertedWholeTables := false
	changed := false

	for i := 0; i < len(lines); i++ {
		line := lines[i]
		if !insertedWholeTables && len(missingWholeTables) > 0 && (strings.HasPrefix(line, `INSERT INTO "public".`) || strings.HasPrefix(line, `INSERT INTO "player".`)) {
			for _, mapping := range missingWholeTables {
				table := tableBySQL[mapping.SQLName]
				if table == nil || len(table.Records) == 0 {
					continue
				}
				output.WriteString(generateWholeTableBlock(mapping, table))
				summaries = append(summaries, tableSummary{
					SQLName:      mapping.SQLName,
					ConstName:    mapping.ConstName,
					ExportCount:  len(table.Records),
					SeedCount:    0,
					MissingCount: len(table.Records),
				})
				changed = true
			}
			insertedWholeTables = true
		}

		matches := insertHeaderPattern.FindStringSubmatch(line)
		if matches == nil {
			output.WriteString(line)
			output.WriteString("\n")
			continue
		}

		sqlName := matches[1]
		columns := parseColumns(matches[2])
		output.WriteString(line)
		output.WriteString("\n")

		tupleLines, endIndex, err := consumeInsertBlock(lines, i+1)
		if err != nil {
			return "", nil, false, fmt.Errorf("%s: %w", sqlName, err)
		}
		i = endIndex

		mapping, hasMapping := mappingBySQL[sqlName]
		table := tableBySQL[sqlName]
		if !hasMapping || table == nil || len(table.Records) == 0 {
			for _, tupleLine := range tupleLines {
				output.WriteString(tupleLine)
				output.WriteString("\n")
			}
			continue
		}

		existingIDs, err := parseExistingIDs(columns, tupleLines)
		if err != nil {
			return "", nil, false, fmt.Errorf("%s: %w", sqlName, err)
		}

		missingRecords := collectMissingRecords(table, existingIDs)
		summaries = append(summaries, tableSummary{
			SQLName:      sqlName,
			ConstName:    mapping.ConstName,
			ExportCount:  len(table.Records),
			SeedCount:    len(existingIDs),
			MissingCount: len(missingRecords),
		})

		if len(missingRecords) == 0 {
			for _, tupleLine := range tupleLines {
				output.WriteString(tupleLine)
				output.WriteString("\n")
			}
			continue
		}

		changed = true
		lastTupleLineIndex := -1
		semicolonLineIndex := -1
		for idx, tupleLine := range tupleLines {
			trimmed := strings.TrimSpace(tupleLine)
			if trimmed == "" {
				continue
			}
			if trimmed == ";" {
				semicolonLineIndex = idx
				continue
			}
			lastTupleLineIndex = idx
		}
		for idx, tupleLine := range tupleLines {
			if idx == semicolonLineIndex {
				continue
			}
			trimmed := tupleLine
			if idx == lastTupleLineIndex {
				trimmed = strings.TrimSuffix(trimmed, ";")
				trimmed = strings.TrimSuffix(trimmed, ",")
				trimmed = trimmed + ","
			}
			output.WriteString(trimmed)
			output.WriteString("\n")
		}

		numericCols := inferNumericColumns(table)
		for idx, record := range missingRecords {
			terminator := ","
			if idx == len(missingRecords)-1 {
				terminator = ";"
			}
			output.WriteString("\t(")
			output.WriteString(strings.Join(formatRecord(sqlName, record, columns, numericCols), ", "))
			output.WriteString(")")
			output.WriteString(terminator)
			output.WriteString("\n")
		}
	}

	if !insertedWholeTables && len(missingWholeTables) > 0 {
		for _, mapping := range missingWholeTables {
			table := tableBySQL[mapping.SQLName]
			if table == nil || len(table.Records) == 0 {
				continue
			}
			output.WriteString(generateWholeTableBlock(mapping, table))
			summaries = append(summaries, tableSummary{
				SQLName:      mapping.SQLName,
				ConstName:    mapping.ConstName,
				ExportCount:  len(table.Records),
				SeedCount:    0,
				MissingCount: len(table.Records),
			})
			changed = true
		}
	}

	sort.Slice(summaries, func(i, j int) bool {
		if summaries[i].MissingCount == summaries[j].MissingCount {
			return summaries[i].SQLName < summaries[j].SQLName
		}
		return summaries[i].MissingCount > summaries[j].MissingCount
	})

	return strings.TrimSuffix(output.String(), "\n") + "\n", summaries, changed, nil
}

func loadTablesFromJSONDir(dir string, mappings []asparser.TableMapping) (map[int]*asparser.TableData, error) {
	mappingByConst := make(map[string]asparser.TableMapping, len(mappings))
	for _, mapping := range mappings {
		mappingByConst[mapping.ConstName] = mapping
	}

	entries, err := os.ReadDir(dir)
	if err != nil {
		return nil, err
	}

	tables := make(map[int]*asparser.TableData)
	for _, entry := range entries {
		if entry.IsDir() {
			continue
		}
		if filepath.Ext(entry.Name()) != ".json" {
			continue
		}

		path := filepath.Join(dir, entry.Name())
		content, err := os.ReadFile(path)
		if err != nil {
			return nil, err
		}

		var tableFile exportedTableFile
		if err := json.Unmarshal(content, &tableFile); err != nil {
			return nil, fmt.Errorf("%s: %w", entry.Name(), err)
		}
		if tableFile.Name == "" {
			return nil, fmt.Errorf("%s: missing table name", entry.Name())
		}

		mapping, ok := mappingByConst[tableFile.Name]
		if !ok {
			return nil, fmt.Errorf("%s: unknown table %q", entry.Name(), tableFile.Name)
		}

		tables[mapping.ID] = &asparser.TableData{
			TableID: mapping.ID,
			Records: tableFile.Records,
			Columns: inferColumnsFromRecords(tableFile.Records),
		}
	}

	return tables, nil
}

func inferColumnsFromRecords(records []map[string]string) []string {
	columnSet := make(map[string]struct{})
	for _, record := range records {
		for column := range record {
			columnSet[column] = struct{}{}
		}
	}

	columns := make([]string, 0, len(columnSet))
	for column := range columnSet {
		if column == "id" {
			continue
		}
		columns = append(columns, column)
	}
	sort.Strings(columns)
	if _, ok := columnSet["id"]; ok {
		return append([]string{"id"}, columns...)
	}
	return columns
}

func consumeInsertBlock(lines []string, start int) ([]string, int, error) {
	tupleLines := make([]string, 0)
	inTuple := false
	for i := start; i < len(lines); i++ {
		line := lines[i]
		tupleLines = append(tupleLines, line)
		trimmed := strings.TrimSpace(line)
		if trimmed == ";" {
			return tupleLines, i, nil
		}
		if !inTuple && strings.HasPrefix(trimmed, "(") {
			inTuple = true
		}
		if inTuple && (strings.HasSuffix(trimmed, "),") || strings.HasSuffix(trimmed, ");")) {
			inTuple = false
			if strings.HasSuffix(trimmed, ");") {
				return tupleLines, i, nil
			}
		}
	}
	return nil, 0, fmt.Errorf("unterminated insert block")
}

func parseColumns(raw string) []string {
	parts := strings.Split(raw, ",")
	columns := make([]string, 0, len(parts))
	for _, part := range parts {
		columns = append(columns, strings.Trim(strings.TrimSpace(part), `"`))
	}
	return columns
}

func parseExistingIDs(columns []string, tupleLines []string) (map[string]struct{}, error) {
	idx := -1
	for i, column := range columns {
		if column == "id" {
			idx = i
			break
		}
	}
	if idx < 0 {
		return nil, fmt.Errorf("id column not found")
	}

	logicalTuples, err := collectLogicalTuples(tupleLines)
	if err != nil {
		return nil, err
	}

	ids := make(map[string]struct{}, len(logicalTuples))
	for _, tupleLine := range logicalTuples {
		trimmed := strings.TrimSpace(tupleLine)
		if trimmed == "" || !strings.HasPrefix(trimmed, "(") {
			continue
		}
		values, err := splitTupleValues(trimmed)
		if err != nil {
			return nil, err
		}
		if idx >= len(values) {
			return nil, fmt.Errorf("tuple shorter than id column")
		}
		ids[normalizeSQLScalar(values[idx])] = struct{}{}
	}
	return ids, nil
}

func collectLogicalTuples(lines []string) ([]string, error) {
	logical := make([]string, 0)
	var current strings.Builder
	inTuple := false

	for _, line := range lines {
		trimmed := strings.TrimSpace(line)
		if trimmed == "" {
			continue
		}
		if trimmed == ";" {
			if !inTuple || current.Len() == 0 {
				continue
			}
			current.WriteString(";")
			logical = append(logical, current.String())
			current.Reset()
			inTuple = false
			continue
		}
		if !inTuple {
			if !strings.HasPrefix(trimmed, "(") {
				continue
			}
			inTuple = true
		}
		if current.Len() > 0 {
			current.WriteByte('\n')
		}
		current.WriteString(trimmed)
		if strings.HasSuffix(trimmed, "),") || strings.HasSuffix(trimmed, ");") {
			logical = append(logical, current.String())
			current.Reset()
			inTuple = false
		}
	}

	if inTuple || current.Len() > 0 {
		return nil, fmt.Errorf("unterminated tuple sequence")
	}

	return logical, nil
}

func splitTupleValues(line string) ([]string, error) {
	trimmed := strings.TrimSpace(line)
	trimmed = strings.TrimSuffix(trimmed, ",")
	trimmed = strings.TrimSuffix(trimmed, ";")
	if !strings.HasPrefix(trimmed, "(") || !strings.HasSuffix(trimmed, ")") {
		return nil, fmt.Errorf("invalid tuple line")
	}
	body := trimmed[1 : len(trimmed)-1]
	values := make([]string, 0)
	var current strings.Builder
	inString := false
	for i := 0; i < len(body); i++ {
		ch := body[i]
		if inString {
			current.WriteByte(ch)
			if ch == '\'' {
				if i+1 < len(body) && body[i+1] == '\'' {
					current.WriteByte(body[i+1])
					i++
					continue
				}
				inString = false
			}
			continue
		}

		switch ch {
		case '\'':
			inString = true
			current.WriteByte(ch)
		case ',':
			values = append(values, strings.TrimSpace(current.String()))
			current.Reset()
		default:
			current.WriteByte(ch)
		}
	}
	values = append(values, strings.TrimSpace(current.String()))
	return values, nil
}

func normalizeSQLScalar(value string) string {
	trimmed := strings.TrimSpace(value)
	trimmed = strings.Trim(trimmed, `'`)
	return strings.ReplaceAll(trimmed, `''`, `'`)
}

func collectMissingRecords(table *asparser.TableData, existingIDs map[string]struct{}) []map[string]string {
	missing := make([]map[string]string, 0)
	for _, record := range table.Records {
		id := record["id"]
		if _, ok := existingIDs[id]; ok {
			continue
		}
		missing = append(missing, record)
	}
	return missing
}

func inferNumericColumns(table *asparser.TableData) map[string]bool {
	numeric := make(map[string]bool, len(table.Columns))
	for _, column := range table.Columns {
		numeric[camelToSnake(column)] = true
	}
	for _, record := range table.Records {
		for column, value := range record {
			if value == "" {
				continue
			}
			sqlName := camelToSnake(column)
			if sqlName == "id" {
				numeric[sqlName] = true
				continue
			}
			if !isNumeric(value) {
				numeric[sqlName] = false
			}
		}
	}
	return numeric
}

func formatRecord(sqlName string, record map[string]string, columns []string, numericCols map[string]bool) []string {
	values := make([]string, 0, len(columns))
	bySQLName := make(map[string]string, len(record))
	for key, value := range record {
		bySQLName[camelToSnake(key)] = value
	}
	for _, column := range columns {
		value, exists := bySQLName[column]
		if !exists {
			values = append(values, "NULL")
			continue
		}
		if sqlName == "data_tbl_shop_slot" && column == "sid" && value == "" {
			value = "0"
		}
		values = append(values, formatValue(value, numericCols[column]))
	}
	return values
}

func generateWholeTableBlock(mapping asparser.TableMapping, table *asparser.TableData) string {
	numericCols := inferNumericColumns(table)
	columns := make([]string, 0, len(table.Columns))
	for _, column := range table.Columns {
		columns = append(columns, camelToSnake(column))
	}

	var builder strings.Builder
	builder.WriteString("--\n")
	builder.WriteString(fmt.Sprintf("-- Data for Name: %s; Type: TABLE DATA; Schema: data; Owner: postgres\n", mapping.SQLName))
	builder.WriteString("--\n\n")
	builder.WriteString(fmt.Sprintf("INSERT INTO \"data\".\"%s\" (", mapping.SQLName))
	formattedColumns := make([]string, 0, len(columns))
	for _, column := range columns {
		formattedColumns = append(formattedColumns, fmt.Sprintf("\"%s\"", column))
	}
	builder.WriteString(strings.Join(formattedColumns, ", "))
	builder.WriteString(") VALUES\n")
	for idx, record := range table.Records {
		terminator := ","
		if idx == len(table.Records)-1 {
			terminator = ";"
		}
		builder.WriteString("\t(")
		builder.WriteString(strings.Join(formatRecord(mapping.SQLName, record, columns, numericCols), ", "))
		builder.WriteString(")")
		builder.WriteString(terminator)
		builder.WriteString("\n")
	}
	builder.WriteString("\n")
	return builder.String()
}

func formatValue(value string, numeric bool) string {
	if value == "" {
		return "NULL"
	}
	if numeric && isNumeric(value) {
		return value
	}
	escaped := strings.ReplaceAll(value, "'", "''")
	return fmt.Sprintf("'%s'", escaped)
}

func isNumeric(value string) bool {
	value = strings.TrimSpace(value)
	if value == "" {
		return false
	}
	if _, err := strconv.ParseInt(value, 10, 64); err == nil {
		return true
	}
	_, err := strconv.ParseFloat(value, 64)
	return err == nil
}

func camelToSnake(value string) string {
	var builder strings.Builder
	for i, r := range value {
		if unicode.IsUpper(r) {
			if i > 0 {
				builder.WriteRune('_')
			}
			builder.WriteRune(unicode.ToLower(r))
			continue
		}
		builder.WriteRune(r)
	}
	return builder.String()
}
