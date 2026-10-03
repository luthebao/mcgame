// Open-sourced by BaoLT

// Parser for extracting table mappings and merged records from GamePredef.as and moreData.as.
package asparser

import (
	"bufio"
	"fmt"
	"os"
	"regexp"
	"sort"
	"strconv"
	"strings"
)

type TableMapping struct {
	ID        int
	ConstName string
	TableName string
	SQLName   string
}

type TableData struct {
	TableID       int
	Records       []map[string]string
	RecordIndices []int
	Columns       []string
}

type OverlayMiss struct {
	TableID     int
	RecordIndex int
	Field       string
}

func ParseGamePredef(path string) ([]TableMapping, error) {
	content, err := os.ReadFile(path)
	if err != nil {
		return nil, fmt.Errorf("failed to read file: %w", err)
	}

	pattern := regexp.MustCompile(`public\s+static\s+const\s+(TBL_[A-Z0-9_]+)\s*:\s*(?:uint|int)\s*=\s*(\d+)\s*;`)
	matches := pattern.FindAllStringSubmatch(string(content), -1)

	mappings := make([]TableMapping, 0, len(matches))
	for _, match := range matches {
		if len(match) != 3 {
			continue
		}

		id, err := strconv.Atoi(match[2])
		if err != nil {
			continue
		}

		constName := match[1]
		mappings = append(mappings, TableMapping{
			ID:        id,
			ConstName: constName,
			TableName: strings.ToLower(constName),
			SQLName:   "data_" + strings.ToLower(constName),
		})
	}

	return mappings, nil
}

func ParseGameData(path string) (map[int]*TableData, error) {
	return parseTableAssignments(path, regexp.MustCompile(`d\[(\d+)\]\[(0x[0-9A-Fa-f]+|\d+)\]\s*=\s*\{`), true)
}

func ParseMoreData(path string) (map[int]map[int]map[string]string, error) {
	tables, err := parseTableAssignments(path, regexp.MustCompile(`fields\[(\d+)\]\[(0x[0-9A-Fa-f]+|\d+)\]\s*=\s*\{`), false)
	if err != nil {
		return nil, err
	}

	overlays := make(map[int]map[int]map[string]string, len(tables))
	for tableID, table := range tables {
		if table == nil || len(table.Records) == 0 {
			continue
		}

		recordsByIndex := make(map[int]map[string]string, len(table.Records))
		for idx, record := range table.Records {
			if idx >= len(table.RecordIndices) {
				continue
			}

			copied := make(map[string]string, len(record))
			for key, value := range record {
				copied[key] = value
			}
			recordsByIndex[table.RecordIndices[idx]] = copied
		}

		if len(recordsByIndex) > 0 {
			overlays[tableID] = recordsByIndex
		}
	}

	return overlays, nil
}

func ParseGameDataWithMoreData(gameDataPath, moreDataPath string) (map[int]*TableData, []OverlayMiss, error) {
	tables, err := ParseGameData(gameDataPath)
	if err != nil {
		return nil, nil, err
	}

	if strings.TrimSpace(moreDataPath) == "" {
		return tables, nil, nil
	}

	overlays, err := ParseMoreData(moreDataPath)
	if err != nil {
		return nil, nil, err
	}

	misses := MergeMoreData(tables, overlays)
	return tables, misses, nil
}

func MergeMoreData(tables map[int]*TableData, overlays map[int]map[int]map[string]string) []OverlayMiss {
	misses := make([]OverlayMiss, 0)

	for tableID, overlayRecords := range overlays {
		table := tables[tableID]
		if table == nil || len(table.Records) == 0 {
			for recordIndex, fields := range overlayRecords {
				for field := range fields {
					misses = append(misses, OverlayMiss{TableID: tableID, RecordIndex: recordIndex, Field: field})
				}
			}
			continue
		}

		recordsByIndex := make(map[int]map[string]string, len(table.Records))
		for idx, record := range table.Records {
			if idx >= len(table.RecordIndices) {
				continue
			}
			recordsByIndex[table.RecordIndices[idx]] = record
		}

		tableChanged := false
		for recordIndex, fields := range overlayRecords {
			record := recordsByIndex[recordIndex]
			if record == nil {
				for field := range fields {
					misses = append(misses, OverlayMiss{TableID: tableID, RecordIndex: recordIndex, Field: field})
				}
				continue
			}

			for field, value := range fields {
				record[field] = value
			}
			tableChanged = true
		}

		if tableChanged {
			table.Columns = extractColumnOrder(table.Records)
		}
	}

	sort.Slice(misses, func(i, j int) bool {
		if misses[i].TableID != misses[j].TableID {
			return misses[i].TableID < misses[j].TableID
		}
		if misses[i].RecordIndex != misses[j].RecordIndex {
			return misses[i].RecordIndex < misses[j].RecordIndex
		}
		return misses[i].Field < misses[j].Field
	})

	return misses
}

func parseTableAssignments(path string, startPattern *regexp.Regexp, setDefaultID bool) (map[int]*TableData, error) {
	file, err := os.Open(path)
	if err != nil {
		return nil, fmt.Errorf("failed to open file: %w", err)
	}
	defer file.Close()

	tables := make(map[int]*TableData)
	kvPattern := regexp.MustCompile(`"([^"]+)"\s*:\s*(?:"([^"]*)"|'([^']*)'|(-?\d+(?:\.\d+)?))`)

	scanner := bufio.NewScanner(file)
	buf := make([]byte, 0, 64*1024)
	scanner.Buffer(buf, 10*1024*1024)

	var currentTableID int
	var currentRecordID int
	var inRecord bool
	var recordLines strings.Builder

	for scanner.Scan() {
		line := scanner.Text()

		if !inRecord {
			matches := startPattern.FindStringSubmatch(line)
			if matches == nil {
				continue
			}

			currentTableID, _ = strconv.Atoi(matches[1])
			currentRecordID, _ = parseASIndex(matches[2])
			inRecord = true
			recordLines.Reset()

			idx := strings.Index(line, "{")
			if idx >= 0 {
				recordLines.WriteString(line[idx+1:])
			}
			if strings.Contains(line, "};") {
				inRecord = false
				appendParsedRecord(tables, kvPattern, currentTableID, currentRecordID, recordLines.String(), setDefaultID)
			}
			continue
		}

		recordLines.WriteString(line)
		if !strings.Contains(line, "};") {
			continue
		}

		inRecord = false
		appendParsedRecord(tables, kvPattern, currentTableID, currentRecordID, recordLines.String(), setDefaultID)
	}

	if err := scanner.Err(); err != nil {
		return nil, fmt.Errorf("error reading file: %w", err)
	}

	for _, table := range tables {
		if len(table.Records) > 0 {
			table.Columns = extractColumnOrder(table.Records)
		}
	}

	return tables, nil
}

func appendParsedRecord(tables map[int]*TableData, kvPattern *regexp.Regexp, tableID, recordIndex int, rawRecord string, setDefaultID bool) {
	record := make(map[string]string)
	for _, match := range kvPattern.FindAllStringSubmatch(rawRecord, -1) {
		value := ""
		switch {
		case match[2] != "":
			value = match[2]
		case match[3] != "":
			value = match[3]
		case match[4] != "":
			value = match[4]
		}
		record[match[1]] = value
	}

	if len(record) == 0 {
		return
	}

	if setDefaultID {
		if _, ok := record["id"]; !ok {
			record["id"] = strconv.Itoa(recordIndex)
		}
	}

	table := tables[tableID]
	if table == nil {
		table = &TableData{TableID: tableID, Records: make([]map[string]string, 0), RecordIndices: make([]int, 0)}
		tables[tableID] = table
	}
	table.Records = append(table.Records, record)
	table.RecordIndices = append(table.RecordIndices, recordIndex)
}

func parseASIndex(value string) (int, error) {
	if strings.HasPrefix(value, "0x") || strings.HasPrefix(value, "0X") {
		parsed, err := strconv.ParseInt(value[2:], 16, 64)
		if err != nil {
			return 0, err
		}
		return int(parsed), nil
	}

	parsed, err := strconv.Atoi(value)
	if err != nil {
		return 0, err
	}

	return parsed, nil
}

func extractColumnOrder(records []map[string]string) []string {
	columnSet := make(map[string]bool)
	columnOrder := make([]string, 0)

	for _, record := range records {
		if _, ok := record["id"]; ok && !columnSet["id"] {
			columnSet["id"] = true
			columnOrder = append(columnOrder, "id")
			break
		}
	}

	allCols := make(map[string]bool)
	for _, record := range records {
		for key := range record {
			allCols[key] = true
		}
	}

	cols := make([]string, 0, len(allCols))
	for key := range allCols {
		if key != "id" {
			cols = append(cols, key)
		}
	}
	sort.Strings(cols)

	for _, col := range cols {
		if columnSet[col] {
			continue
		}
		columnSet[col] = true
		columnOrder = append(columnOrder, col)
	}

	return columnOrder
}
