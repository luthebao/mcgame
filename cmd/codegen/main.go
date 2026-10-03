// Open-sourced by BaoLT

// Code generator for game data model structs from SQL seed files.
// Analyzes SQL CREATE TABLE statements and generates typed Go structs with validation.
// Creates registry.go with table mappings and factory functions.
package main

import (
	"bufio"
	"flag"
	"fmt"
	"os"
	"path/filepath"
	"regexp"
	"sort"
	"strconv"
	"strings"
)

type FieldInfo struct {
	Name    string
	DBName  string
	GoType  string
	SQLType string
	IsID    bool
}

type TableInfo struct {
	TableID   int
	TableName string
	FileName  string
	GoName    string
	Fields    []FieldInfo
}

func main() {
	sqlDir := flag.String("sql", "./docker-supabase/mcgame/data", "Path to SQL seed data directory")
	outDir := flag.String("out", "./internal/gamedata/models", "Output directory for generated models")
	flag.Parse()

	if err := os.MkdirAll(*outDir, 0755); err != nil {
		fmt.Fprintf(os.Stderr, "Error creating output directory: %v\n", err)
		os.Exit(1)
	}

	// Parse SQL files to get table definitions
	tables, err := parseSQLFiles(*sqlDir)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error parsing SQL files: %v\n", err)
		os.Exit(1)
	}
	fmt.Printf("Parsed %d tables from SQL files\n", len(tables))

	sort.Slice(tables, func(i, j int) bool {
		return tables[i].TableID < tables[j].TableID
	})

	for _, table := range tables {
		if err := generateModelFile(*outDir, &table); err != nil {
			fmt.Fprintf(os.Stderr, "Error generating %s: %v\n", table.GoName, err)
			continue
		}
		fmt.Printf("Generated: %s.go (%d fields)\n", strings.ToLower(snakeCase(table.GoName[:len(table.GoName)-8])), len(table.Fields))
	}

	if err := generateRegistryFile(*outDir, tables); err != nil {
		fmt.Fprintf(os.Stderr, "Error generating registry: %v\n", err)
		os.Exit(1)
	}

	fmt.Printf("\nGenerated %d model files + registry.go\n", len(tables))
}

// parseSQLFiles parses SQL files to extract table definitions
func parseSQLFiles(sqlDir string) ([]TableInfo, error) {
	var tables []TableInfo

	files, err := filepath.Glob(filepath.Join(sqlDir, "*_seed_data_tbl_*.up.sql"))
	if err != nil {
		return nil, err
	}

	// Pattern to match file number and table name from filename
	// e.g., 100_seed_data_tbl_class.up.sql
	filePattern := regexp.MustCompile(`(\d+)_seed_data_(tbl_\w+)\.up\.sql`)

	// Pattern to match CREATE TABLE statements
	// CREATE TABLE IF NOT EXISTS data.data_tbl_class (
	tablePattern := regexp.MustCompile(`CREATE TABLE IF NOT EXISTS data\.data_(tbl_\w+)\s*\(`)

	// Pattern to match Table ID comment: -- Table ID: 11 (TBL_CLASS)
	tableIDPattern := regexp.MustCompile(`-- Table ID: (\d+) \((\w+)\)`)

	// Pattern to match column definitions like: apt_agility NUMERIC NOT NULL,
	columnPattern := regexp.MustCompile(`^\s+(\w+|"(\w+)")\s+(INTEGER|NUMERIC|TEXT)`)

	for _, file := range files {
		// Extract table name from filename
		baseName := filepath.Base(file)
		fileMatches := filePattern.FindStringSubmatch(baseName)
		if fileMatches == nil {
			continue
		}

		f, err := os.Open(file)
		if err != nil {
			continue
		}

		var tableInfo TableInfo
		var fields []FieldInfo
		inCreateTable := false
		scanner := bufio.NewScanner(f)

		for scanner.Scan() {
			line := scanner.Text()

			// Try to extract table ID from comment
			if matches := tableIDPattern.FindStringSubmatch(line); matches != nil {
				tableInfo.TableID, _ = strconv.Atoi(matches[1])
				tableInfo.TableName = matches[2]
				continue
			}

			// Check for CREATE TABLE
			if matches := tablePattern.FindStringSubmatch(line); matches != nil {
				inCreateTable = true
				if tableInfo.TableName == "" {
					tableInfo.TableName = strings.ToUpper(matches[1])
				}
				continue
			}

			if inCreateTable {
				if strings.Contains(line, ");") {
					inCreateTable = false
					continue
				}

				if matches := columnPattern.FindStringSubmatch(line); matches != nil {
					colName := matches[1]
					if matches[2] != "" {
						colName = matches[2] // Use unquoted name
					}
					sqlType := matches[3]

					// Keep original snake_case column name for db tag
					goName := columnToGoName(colName)
					goType := sqlTypeToGoType(sqlType)

					field := FieldInfo{
						Name:    goName,
						DBName:  colName,
						GoType:  goType,
						SQLType: sqlType,
						IsID:    colName == "id",
					}

					// ID field should always be int64
					if field.IsID {
						field.GoType = "int64"
					}

					fields = append(fields, field)
				}
			}
		}
		f.Close()

		if len(fields) > 0 && tableInfo.TableName != "" {
			tableInfo.GoName = tableNameToGoName(tableInfo.TableName)
			tableInfo.FileName = baseName
			tableInfo.Fields = fields
			tables = append(tables, tableInfo)
		}
	}

	return tables, nil
}

// sqlTypeToGoType converts SQL type to Go type
func sqlTypeToGoType(sqlType string) string {
	switch sqlType {
	case "INTEGER":
		return "int64"
	case "NUMERIC":
		return "float64"
	default:
		return "string"
	}
}

func tableNameToGoName(tableName string) string {
	name := strings.TrimPrefix(tableName, "TBL_")

	parts := strings.Split(strings.ToLower(name), "_")
	for i, part := range parts {
		if len(part) > 0 {
			parts[i] = strings.ToUpper(part[:1]) + part[1:]
		}
	}

	return strings.Join(parts, "") + "Template"
}

// columnToGoName converts snake_case SQL column name to PascalCase Go field name
func columnToGoName(colName string) string {
	if len(colName) == 0 {
		return colName
	}

	// Handle common abbreviations
	abbrevs := map[string]string{
		"id":   "ID",
		"hp":   "HP",
		"mp":   "MP",
		"sp":   "SP",
		"npc":  "NPC",
		"url":  "URL",
		"api":  "API",
		"uuid": "UUID",
	}

	lower := strings.ToLower(colName)
	if abbrev, ok := abbrevs[lower]; ok {
		return abbrev
	}

	// Convert snake_case to PascalCase
	parts := strings.Split(lower, "_")
	for i, part := range parts {
		if len(part) > 0 {
			// Check if part is an abbreviation
			if abbrev, ok := abbrevs[part]; ok {
				parts[i] = abbrev
			} else {
				parts[i] = strings.ToUpper(part[:1]) + part[1:]
			}
		}
	}

	return strings.Join(parts, "")
}

func inferGoType(_ string, _ interface{}) string {
	return "string"
}

func generateModelFile(outDir string, table *TableInfo) error {
	fileName := strings.ToLower(snakeCase(table.GoName[:len(table.GoName)-8])) + ".go"
	filePath := filepath.Join(outDir, fileName)

	var sb strings.Builder

	hasPipeField := false
	for _, field := range table.Fields {
		if field.GoType == "string" && (strings.Contains(strings.ToLower(field.Name), "class") ||
			strings.Contains(strings.ToLower(field.Name), "skill") ||
			strings.Contains(strings.ToLower(field.Name), "item")) {
			hasPipeField = true
			break
		}
	}

	// Check if we need strconv import (only for string types needing parsing)
	needsStrconv := hasPipeField

	sb.WriteString("// Open-sourced by BaoLT\n\n// Code generated by cmd/codegen. DO NOT EDIT.\n")
	sb.WriteString("package models\n\n")
	sb.WriteString("import (\n")
	sb.WriteString("\t\"fmt\"\n")
	if needsStrconv {
		sb.WriteString("\t\"strconv\"\n")
	}
	if hasPipeField {
		sb.WriteString("\t\"strings\"\n")
	}
	sb.WriteString(")\n\n")

	sb.WriteString(fmt.Sprintf("// %s represents %s (table_id=%d)\n", table.GoName, table.TableName, table.TableID))
	sb.WriteString(fmt.Sprintf("type %s struct {\n", table.GoName))
	for _, field := range table.Fields {
		sb.WriteString(fmt.Sprintf("\t%s %s `json:\"%s\" db:\"%s\"`\n", field.Name, field.GoType, field.DBName, field.DBName))
	}
	sb.WriteString("}\n\n")

	fmt.Fprintf(&sb, "// TableName returns the table name for this template\n")
	sb.WriteString(fmt.Sprintf("func (t *%s) TableName() string {\n", table.GoName))
	sb.WriteString(fmt.Sprintf("\treturn \"%s\"\n", table.TableName))
	sb.WriteString("}\n\n")

	fmt.Fprintf(&sb, "// TableID returns the table ID for this template\n")
	sb.WriteString(fmt.Sprintf("func (t *%s) TableID() int {\n", table.GoName))
	sb.WriteString(fmt.Sprintf("\treturn %d\n", table.TableID))
	sb.WriteString("}\n\n")

	fmt.Fprintf(&sb, "// GetID returns the record ID as int\n")
	sb.WriteString(fmt.Sprintf("func (t *%s) GetID() int {\n", table.GoName))
	sb.WriteString("\treturn int(t.ID)\n")
	sb.WriteString("}\n\n")

	fmt.Fprintf(&sb, "// Validate checks if the template data is valid\n")
	sb.WriteString(fmt.Sprintf("func (t *%s) Validate() error {\n", table.GoName))
	sb.WriteString("\tif t.ID <= 0 {\n")
	sb.WriteString(fmt.Sprintf("\t\treturn fmt.Errorf(\"invalid %s ID: %%d\", t.ID)\n", table.TableName))
	sb.WriteString("\t}\n")
	sb.WriteString("\treturn nil\n")
	sb.WriteString("}\n\n")

	fmt.Fprintf(&sb, "// ToDTO converts to client-compatible format\n")
	sb.WriteString(fmt.Sprintf("func (t *%s) ToDTO() map[string]interface{} {\n", table.GoName))
	sb.WriteString("\treturn map[string]interface{}{\n")
	for _, field := range table.Fields {
		sb.WriteString(fmt.Sprintf("\t\t\"%s\": t.%s,\n", field.DBName, field.Name))
	}
	sb.WriteString("\t}\n")
	sb.WriteString("}\n\n")

	if hasPipeField {
		fmt.Fprintf(&sb, "// ParsePipeDelimitedInts parses a pipe-delimited string like \"|1|2|3|\" into []int\n")
		sb.WriteString(fmt.Sprintf("func (t *%s) ParsePipeDelimitedInts(s string) []int {\n", table.GoName))
		sb.WriteString("\tif s == \"\" || s == \"|\" {\n")
		sb.WriteString("\t\treturn nil\n")
		sb.WriteString("\t}\n")
		sb.WriteString("\ts = strings.Trim(s, \"|\")\n")
		sb.WriteString("\tparts := strings.Split(s, \"|\")\n")
		sb.WriteString("\tresult := make([]int, 0, len(parts))\n")
		sb.WriteString("\tfor _, p := range parts {\n")
		sb.WriteString("\t\tif p == \"\" {\n")
		sb.WriteString("\t\t\tcontinue\n")
		sb.WriteString("\t\t}\n")
		sb.WriteString("\t\tif n, err := strconv.Atoi(p); err == nil {\n")
		sb.WriteString("\t\t\tresult = append(result, n)\n")
		sb.WriteString("\t\t}\n")
		sb.WriteString("\t}\n")
		sb.WriteString("\treturn result\n")
		sb.WriteString("}\n")
	}

	return os.WriteFile(filePath, []byte(sb.String()), 0644)
}

func generateRegistryFile(outDir string, tables []TableInfo) error {
	filePath := filepath.Join(outDir, "registry.go")

	var sb strings.Builder

	sb.WriteString("// Open-sourced by BaoLT\n\n// Code generated by cmd/codegen. DO NOT EDIT.\n")
	sb.WriteString("package models\n\n")

	sb.WriteString("// Table name constants\n")
	sb.WriteString("const (\n")
	for _, table := range tables {
		constName := strings.ToUpper(snakeCase(table.GoName[:len(table.GoName)-8]))
		sb.WriteString(fmt.Sprintf("\tTable%s = \"%s\"\n", table.GoName[:len(table.GoName)-8], table.TableName))
		_ = constName
	}
	sb.WriteString(")\n\n")

	sb.WriteString("// TableIDToName maps table IDs to table names\n")
	sb.WriteString("var TableIDToName = map[int]string{\n")
	for _, table := range tables {
		sb.WriteString(fmt.Sprintf("\t%d: \"%s\",\n", table.TableID, table.TableName))
	}
	sb.WriteString("}\n\n")

	sb.WriteString("// TableNameToID maps table names to table IDs\n")
	sb.WriteString("var TableNameToID = map[string]int{\n")
	for _, table := range tables {
		sb.WriteString(fmt.Sprintf("\t\"%s\": %d,\n", table.TableName, table.TableID))
	}
	sb.WriteString("}\n\n")

	sb.WriteString("// Template is the interface implemented by all game data templates\n")
	sb.WriteString("type Template interface {\n")
	sb.WriteString("\tTableName() string\n")
	sb.WriteString("\tTableID() int\n")
	sb.WriteString("\tGetID() int\n")
	sb.WriteString("\tValidate() error\n")
	sb.WriteString("\tToDTO() map[string]interface{}\n")
	sb.WriteString("}\n\n")

	sb.WriteString("// NewTemplate creates a new template instance by table name\n")
	sb.WriteString("func NewTemplate(tableName string) Template {\n")
	sb.WriteString("\tswitch tableName {\n")
	for _, table := range tables {
		sb.WriteString(fmt.Sprintf("\tcase \"%s\":\n", table.TableName))
		sb.WriteString(fmt.Sprintf("\t\treturn &%s{}\n", table.GoName))
	}
	sb.WriteString("\tdefault:\n")
	sb.WriteString("\t\treturn nil\n")
	sb.WriteString("\t}\n")
	sb.WriteString("}\n")

	return os.WriteFile(filePath, []byte(sb.String()), 0644)
}

func snakeCase(s string) string {
	var result strings.Builder
	re := regexp.MustCompile("([A-Z])")
	snake := re.ReplaceAllString(s, "_$1")
	snake = strings.ToLower(strings.TrimPrefix(snake, "_"))
	result.WriteString(snake)
	return result.String()
}
