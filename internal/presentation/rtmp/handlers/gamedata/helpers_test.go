// Open-sourced by BaoLT

package gamedata

import (
	"context"
	"encoding/json"
	"fmt"
	"testing"

	appitem "mcgame-server/internal/application/item"
	domainitem "mcgame-server/internal/domain/item"
	gamedatastore "mcgame-server/internal/gamedata"
	"mcgame-server/internal/infrastructure/rtmp"
)

type stubRepo struct {
	records map[string]json.RawMessage
}

func (s stubRepo) GetByTableAndID(_ context.Context, tableName string, recordID int) (json.RawMessage, error) {
	return s.records[fmt.Sprintf("%s:%d", tableName, recordID)], nil
}

func (s stubRepo) GetAllByTable(context.Context, string) ([]json.RawMessage, error) {
	return nil, nil
}

func (s stubRepo) Upsert(context.Context, string, int, json.RawMessage) error {
	return nil
}

func (s stubRepo) UpsertBatch(context.Context, string, []gamedatastore.Record) error {
	return nil
}

func (s stubRepo) DeleteByTableAndID(context.Context, string, int) error {
	return nil
}

func (s stubRepo) DeleteAllByTable(context.Context, string) error {
	return nil
}

func (s stubRepo) CountByTable(context.Context, string) (int, error) {
	return 0, nil
}

func (s stubRepo) GetTableNames(context.Context) ([]string, error) {
	return nil, nil
}

type stubItemRepo struct {
	items map[int64]*domainitem.Item
}

func (s stubItemRepo) FindByID(_ context.Context, id int64) (*domainitem.Item, error) {
	if item, ok := s.items[id]; ok {
		return item, nil
	}
	return nil, fmt.Errorf("not found")
}

func (s stubItemRepo) FindByCharacterID(context.Context, int64) ([]*domainitem.Item, error) {
	return nil, nil
}

func (s stubItemRepo) FindByCharacterAndSlotType(context.Context, int64, domainitem.SlotType) ([]*domainitem.Item, error) {
	return nil, nil
}

func (s stubItemRepo) FindBySlot(context.Context, int64, domainitem.SlotType, int) (*domainitem.Item, error) {
	return nil, fmt.Errorf("not found")
}

func (s stubItemRepo) FindEquipped(context.Context, int64) ([]*domainitem.Item, error) {
	return nil, nil
}

func (s stubItemRepo) Create(context.Context, *domainitem.Item) error {
	return nil
}

func (s stubItemRepo) Update(context.Context, *domainitem.Item) error {
	return nil
}

func (s stubItemRepo) Delete(context.Context, int64) error {
	return nil
}

func (s stubItemRepo) DeleteByCharacterID(context.Context, int64) error {
	return nil
}

func (s stubItemRepo) MoveItem(context.Context, int64, domainitem.SlotType, int) error {
	return nil
}

func (s stubItemRepo) UpdateStack(context.Context, int64, int) error {
	return nil
}

func (s stubItemRepo) FindFirstEmptySlot(context.Context, int64, domainitem.SlotType, int) (int, error) {
	return 0, nil
}

func (s stubItemRepo) CountBySlotType(context.Context, int64, domainitem.SlotType) (int, error) {
	return 0, nil
}

func TestApplyEquipmentDisplayFields_UsesQualityPrefix(t *testing.T) {
	recordData := map[string]interface{}{
		"q":         10.0,
		"colorCode": 2.0,
	}

	applyEquipmentDisplayFields(recordData, nil)

	if got := safeInterfaceToInt(recordData["preNameType"]); got != 5 {
		t.Fatalf("expected preNameType 5 from q=10, got %d", got)
	}

	if got := safeInterfaceToInt(recordData["colorCode"]); got != 2 {
		t.Fatalf("expected colorCode 2, got %d", got)
	}
	if got := safeInterfaceToInt(recordData["color"]); got != 1 {
		t.Fatalf("expected display color 1, got %d", got)
	}
}

func TestEnrichInstanceRecordData_ParsesStringProperties(t *testing.T) {
	repo := stubRepo{
		records: map[string]json.RawMessage{
			"TBL_EQUIPT_TEMPLATE:1001": json.RawMessage(`{"id":1001,"t":3,"color":2}`),
		},
	}
	recordData := map[string]interface{}{
		"id":         77.0,
		"templateId": 1001.0,
		"slotType":   0.0,
		"slotIndex":  4.0,
		"colorCode":  2.0,
		"properties": `{"q":10,"preNameType":5,"element":6,"endureLeft":88,"endureMax":88}`,
	}

	enrichInstanceRecordData(context.Background(), repo, 18, recordData, true)

	if got := safeInterfaceToInt(recordData["q"]); got != 10 {
		t.Fatalf("expected q 10, got %d", got)
	}
	if got := safeInterfaceToInt(recordData["preNameType"]); got != 5 {
		t.Fatalf("expected preNameType 5, got %d", got)
	}
	if got := safeInterfaceToInt(recordData["element"]); got != 6 {
		t.Fatalf("expected element 6, got %d", got)
	}
	if got := safeInterfaceToInt(recordData["endureLeft"]); got != 88 {
		t.Fatalf("expected endureLeft 88, got %d", got)
	}
	if got := safeInterfaceToInt(recordData["endureMax"]); got != 88 {
		t.Fatalf("expected endureMax 88, got %d", got)
	}
	if got := safeInterfaceToInt(recordData["sid"]); got != 2105 {
		t.Fatalf("expected sid 2105, got %d", got)
	}
	if _, ok := recordData["properties"]; ok {
		t.Fatalf("expected properties to be flattened and removed, got %#v", recordData["properties"])
	}
}

func TestEnrichInstanceRecordData_LoadsTemplateFromRepositoryAliases(t *testing.T) {
	repo := stubRepo{
		records: map[string]json.RawMessage{
			"TBL_EQUIPT_TEMPLATE:757": json.RawMessage(`{"id":757,"t":6,"color":3}`),
		},
	}
	recordData := map[string]interface{}{
		"id":         5.0,
		"itemId":     5.0,
		"tplId":      757.0,
		"tid":        757.0,
		"giid":       757.0,
		"slotType":   0.0,
		"slotIndex":  4.0,
		"colorCode":  2.0,
		"properties": `{"q":10,"preNameType":5,"mainProp1":17,"mainPropNum1":123}`,
	}

	enrichInstanceRecordData(context.Background(), repo, 18, recordData, false)

	if got := safeInterfaceToInt(recordData["t"]); got != 6 {
		t.Fatalf("expected template t 6, got %d", got)
	}
	if got := safeInterfaceToInt(recordData["mainProp1"]); got != 17 {
		t.Fatalf("expected mainProp1 17, got %d", got)
	}
	if got := safeInterfaceToInt(recordData["mainPropNum1"]); got != 123 {
		t.Fatalf("expected mainPropNum1 123, got %d", got)
	}
	if got := safeInterfaceToInt(recordData["preNameType"]); got != 5 {
		t.Fatalf("expected preNameType 5, got %d", got)
	}
	if got := safeInterfaceToInt(recordData["colorCode"]); got != 2 {
		t.Fatalf("expected colorCode 2, got %d", got)
	}
	if got := safeInterfaceToInt(recordData["color"]); got != 1 {
		t.Fatalf("expected display color 1, got %d", got)
	}
}

func TestGetCurrentCharacterItemInstanceJSON_UsesLiveCachedItem(t *testing.T) {
	itemService := appitem.NewService(stubItemRepo{items: map[int64]*domainitem.Item{
		5: {
			ID:          5,
			CharacterID: 1,
			TemplateID:  757,
			ItemType:    domainitem.ItemTypeEquipment,
			SlotType:    domainitem.SlotTypeBag,
			SlotIndex:   4,
			StackCount:  1,
			ColorCode:   2,
			Properties: map[string]interface{}{
				"q":           10,
				"quality":     10,
				"preNameType": 5,
				"element":     3,
			},
		},
	}}, nil)
	h := &Handler{itemService: itemService}
	rpcCtx := &rtmp.RPCContext{Context: context.Background(), CharacterID: "1"}

	recordJSON, err := h.getCurrentCharacterItemInstanceJSON(rpcCtx, 18, 5)
	if err != nil {
		t.Fatalf("getCurrentCharacterItemInstanceJSON() error = %v", err)
	}
	if recordJSON == nil {
		t.Fatalf("expected live record JSON, got nil")
	}

	recordData, err := normalizeJSONRecord(recordJSON)
	if err != nil {
		t.Fatalf("normalizeJSONRecord() error = %v", err)
	}

	if got := safeInterfaceToInt(recordData["q"]); got != 10 {
		t.Fatalf("expected q 10, got %d", got)
	}
	if got := safeInterfaceToInt(recordData["preNameType"]); got != 5 {
		t.Fatalf("expected preNameType 5, got %d", got)
	}
	if got := safeInterfaceToInt(recordData["element"]); got != 3 {
		t.Fatalf("expected element 3, got %d", got)
	}
}
