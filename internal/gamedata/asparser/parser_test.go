// Open-sourced by BaoLT

package asparser

import (
	"os"
	"path/filepath"
	"testing"
)

func TestParseMoreDataUsesASRecordIndices(t *testing.T) {
	tempDir := t.TempDir()
	moreDataPath := filepath.Join(tempDir, "moreData.as")
	content := "fields[29][0x0200] = {\"description\":\"Merged\",\"info\":\"Overlay\"};\n"

	if err := os.WriteFile(moreDataPath, []byte(content), 0644); err != nil {
		t.Fatalf("write moreData.as: %v", err)
	}

	overlays, err := ParseMoreData(moreDataPath)
	if err != nil {
		t.Fatalf("ParseMoreData returned error: %v", err)
	}

	tableOverlays := overlays[29]
	if tableOverlays == nil {
		t.Fatalf("expected overlays for table 29")
	}

	record := tableOverlays[512]
	if record == nil {
		t.Fatalf("expected overlay for AS index 512")
	}
	if record["description"] != "Merged" {
		t.Fatalf("expected description overlay, got %q", record["description"])
	}
	if record["info"] != "Overlay" {
		t.Fatalf("expected info overlay, got %q", record["info"])
	}
}

func TestParseGameDataWithMoreDataMergesByASIndex(t *testing.T) {
	tempDir := t.TempDir()
	gameDataPath := filepath.Join(tempDir, "GameData.as")
	moreDataPath := filepath.Join(tempDir, "moreData.as")

	gameData := "d[29][0x0200] = {\n\"id\":999,\n\"name\":\"Base Item\"\n};\n"
	moreData := "fields[29][0x0200] = {\"description\":\"Merged text\"};\nfields[29][777] = {\"info\":\"Missing\"};\n"

	if err := os.WriteFile(gameDataPath, []byte(gameData), 0644); err != nil {
		t.Fatalf("write GameData.as: %v", err)
	}
	if err := os.WriteFile(moreDataPath, []byte(moreData), 0644); err != nil {
		t.Fatalf("write moreData.as: %v", err)
	}

	tables, misses, err := ParseGameDataWithMoreData(gameDataPath, moreDataPath)
	if err != nil {
		t.Fatalf("ParseGameDataWithMoreData returned error: %v", err)
	}

	table := tables[29]
	if table == nil || len(table.Records) != 1 {
		t.Fatalf("expected one record for table 29")
	}

	record := table.Records[0]
	if record["id"] != "999" {
		t.Fatalf("expected base id to remain 999, got %q", record["id"])
	}
	if record["description"] != "Merged text" {
		t.Fatalf("expected overlay description, got %q", record["description"])
	}

	if len(misses) != 1 {
		t.Fatalf("expected one missing overlay field, got %d", len(misses))
	}
	if misses[0].TableID != 29 || misses[0].RecordIndex != 777 || misses[0].Field != "info" {
		t.Fatalf("unexpected miss: %+v", misses[0])
	}

	if table.RecordIndices[0] != 512 {
		t.Fatalf("expected AS record index 512, got %d", table.RecordIndices[0])
	}
	if len(table.Columns) < 3 {
		t.Fatalf("expected merged columns to include overlay field, got %v", table.Columns)
	}
}
