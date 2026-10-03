// Open-sourced by BaoLT

package activity

import (
	"testing"

	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func TestGetTodayAward_ReturnsStarterPayload(t *testing.T) {
	handler := NewHandler(nil, zap.NewNop())

	result, err := handler.GetTodayAward(&rtmp.RPCContext{ConnID: 7, CharacterID: "1"}, nil)
	if err != nil {
		t.Fatalf("GetTodayAward() error = %v", err)
	}

	payload, ok := result.(map[string]interface{})
	if !ok {
		t.Fatalf("GetTodayAward() type = %T, want map[string]interface{}", result)
	}

	if payload["dailyAward"] != 0 {
		t.Fatalf("dailyAward = %v, want 0", payload["dailyAward"])
	}
	if payload["dailyDisc"] != 0 {
		t.Fatalf("dailyDisc = %v, want 0", payload["dailyDisc"])
	}

	contiLoginDay, ok := payload["contiLoginDay"].([]interface{})
	if !ok {
		t.Fatalf("contiLoginDay type = %T, want []interface{}", payload["contiLoginDay"])
	}
	if len(contiLoginDay) != 2 {
		t.Fatalf("len(contiLoginDay) = %d, want 2", len(contiLoginDay))
	}
}

func TestGetCurrentFeast_ReturnsNoActiveFeast(t *testing.T) {
	handler := NewHandler(nil, zap.NewNop())

	result, err := handler.GetCurrentFeast(&rtmp.RPCContext{ConnID: 8, CharacterID: "2"}, nil)
	if err != nil {
		t.Fatalf("GetCurrentFeast() error = %v", err)
	}

	payload, ok := result.(map[string]interface{})
	if !ok {
		t.Fatalf("GetCurrentFeast() type = %T, want map[string]interface{}", result)
	}

	if payload["id"] != 0 {
		t.Fatalf("id = %v, want 0", payload["id"])
	}
	if payload["enable"] != 0 {
		t.Fatalf("enable = %v, want 0", payload["enable"])
	}
}

func TestGetDailyPanelAwardState_EnablesGameIntroBadge(t *testing.T) {
	handler := NewHandler(nil, zap.NewNop())

	result, err := handler.GetDailyPanelAwardState(&rtmp.RPCContext{ConnID: 9, CharacterID: "3"}, nil)
	if err != nil {
		t.Fatalf("GetDailyPanelAwardState() error = %v", err)
	}

	payload, ok := result.(map[string]interface{})
	if !ok {
		t.Fatalf("GetDailyPanelAwardState() type = %T, want map[string]interface{}", result)
	}

	gameintro, ok := payload["gameintro"].(bool)
	if !ok {
		t.Fatalf("gameintro type = %T, want bool", payload["gameintro"])
	}
	if !gameintro {
		t.Fatal("gameintro = false, want true")
	}
}

func TestGetSendCombineAct_ReturnsRealPayloadShape(t *testing.T) {
	handler := NewHandler(nil, zap.NewNop())

	result, err := handler.GetSendCombineAct(&rtmp.RPCContext{ConnID: 10, CharacterID: "3"}, nil)
	if err != nil {
		t.Fatalf("GetSendCombineAct() error = %v", err)
	}

	payload, ok := result.(map[string]interface{})
	if !ok {
		t.Fatalf("GetSendCombineAct() type = %T, want map[string]interface{}", result)
	}
	if len(payload) != 5 {
		t.Fatalf("len(payload) = %d, want 5", len(payload))
	}

	firstRaw, exists := payload["0"]
	if !exists {
		t.Fatal("payload missing key 0")
	}

	first, ok := firstRaw.(map[string]interface{})
	if !ok {
		t.Fatalf("payload[0] type = %T, want map[string]interface{}", firstRaw)
	}
	if got := first["id"]; got != "0" {
		t.Fatalf("payload[0][id] = %v, want 0", got)
	}
	if got := first["currency"]; got != "gold" {
		t.Fatalf("payload[0][currency] = %v, want gold", got)
	}
	if got := first["limit"]; got != 5 {
		t.Fatalf("payload[0][limit] = %v, want 5", got)
	}

	awardRaw, ok := first["award"].(map[string]interface{})
	if !ok {
		t.Fatalf("payload[0][award] type = %T, want map[string]interface{}", first["award"])
	}
	if len(awardRaw) != 3 {
		t.Fatalf("len(payload[0][award]) = %d, want 3", len(awardRaw))
	}

	award0Raw, exists := awardRaw["0"]
	if !exists {
		t.Fatal("payload[0][award] missing key 0")
	}
	award0, ok := award0Raw.(map[string]interface{})
	if !ok {
		t.Fatalf("payload[0][award][0] type = %T, want map[string]interface{}", award0Raw)
	}
	if got := award0["itemId"]; got != "6861" {
		t.Fatalf("payload[0][award][0][itemId] = %v, want 6861", got)
	}
	if got := award0["itemType"]; got != 29 {
		t.Fatalf("payload[0][award][0][itemType] = %v, want 29", got)
	}
	if got := award0["binded"]; got != 1 {
		t.Fatalf("payload[0][award][0][binded] = %v, want 1", got)
	}
	if got := award0["checkable"]; got != "true" {
		t.Fatalf("payload[0][award][0][checkable] = %v, want true", got)
	}
}
