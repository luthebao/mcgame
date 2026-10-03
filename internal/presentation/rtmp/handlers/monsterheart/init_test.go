// Open-sourced by BaoLT

package monsterheart

import (
	"testing"

	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func TestInitMonsterHeartData_ReturnsEmptyCollections(t *testing.T) {
	handler := NewHandler(nil, zap.NewNop())

	result, err := handler.InitMonsterHeartData(&rtmp.RPCContext{ConnID: 13, CharacterID: "5"}, nil)
	if err != nil {
		t.Fatalf("InitMonsterHeartData() error = %v", err)
	}

	payload, ok := result.(map[string]interface{})
	if !ok {
		t.Fatalf("result type = %T, want map[string]interface{}", result)
	}
	if _, ok := payload["data"].(map[string]interface{}); !ok {
		t.Fatalf("data type = %T, want map[string]interface{}", payload["data"])
	}
	if _, ok := payload["bag"].(map[string]interface{}); !ok {
		t.Fatalf("bag type = %T, want map[string]interface{}", payload["bag"])
	}
}
