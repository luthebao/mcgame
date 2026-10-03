// Open-sourced by BaoLT

package activity

import (
	"regexp"
	"testing"

	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func TestBossDailyGetData_ReturnsDefaultPayload(t *testing.T) {
	handler := NewHandler(nil, zap.NewNop())

	result, err := handler.BossDailyGetData(&rtmp.RPCContext{ConnID: 11, CharacterID: "42"}, nil)
	if err != nil {
		t.Fatalf("BossDailyGetData() error = %v", err)
	}

	payload, ok := result.(map[string]interface{})
	if !ok {
		t.Fatalf("BossDailyGetData() type = %T, want map[string]interface{}", result)
	}

	total, ok := payload["total"].(int)
	if !ok {
		t.Fatalf("payload.total type = %T, want int", payload["total"])
	}
	if total != bossDailyDefaultTotal {
		t.Fatalf("payload.total = %d, want %d", total, bossDailyDefaultTotal)
	}

	currentTime, ok := payload["t"].(int64)
	if !ok {
		t.Fatalf("payload.t type = %T, want int64", payload["t"])
	}
	if currentTime <= 0 {
		t.Fatalf("payload.t = %d, want > 0", currentTime)
	}

	data, ok := payload["data"].(map[string]interface{})
	if !ok {
		t.Fatalf("payload.data type = %T, want map[string]interface{}", payload["data"])
	}

	day, ok := data["d"].(string)
	if !ok {
		t.Fatalf("payload.data.d type = %T, want string", data["d"])
	}
	if matched := regexp.MustCompile(`^\d+\|\d+\|\d+$`).MatchString(day); !matched {
		t.Fatalf("payload.data.d = %q, want M|D|W format", day)
	}

	used, ok := data["n"].(int)
	if !ok {
		t.Fatalf("payload.data.n type = %T, want int", data["n"])
	}
	if used != 0 {
		t.Fatalf("payload.data.n = %d, want 0", used)
	}

	dataNow, ok := data["now"].(int64)
	if !ok {
		t.Fatalf("payload.data.now type = %T, want int64", data["now"])
	}
	if dataNow != currentTime {
		t.Fatalf("payload.data.now = %d, want payload.t = %d", dataNow, currentTime)
	}

	dfd, ok := data["dfd"].(map[string]interface{})
	if !ok {
		t.Fatalf("payload.data.dfd type = %T, want map[string]interface{}", data["dfd"])
	}
	if len(dfd) != 0 {
		t.Fatalf("len(payload.data.dfd) = %d, want 0", len(dfd))
	}

	perBossData, ok := data["data"].(map[string]interface{})
	if !ok {
		t.Fatalf("payload.data.data type = %T, want map[string]interface{}", data["data"])
	}
	if len(perBossData) != 0 {
		t.Fatalf("len(payload.data.data) = %d, want 0", len(perBossData))
	}
}

func TestBossDailyGetData_InvalidCharacterID(t *testing.T) {
	handler := NewHandler(nil, zap.NewNop())

	_, err := handler.BossDailyGetData(&rtmp.RPCContext{ConnID: 12, CharacterID: "invalid"}, nil)
	if !pkgerrors.Is(err, pkgerrors.ErrInvalidInput) {
		t.Fatalf("BossDailyGetData() error = %v, want ErrInvalidInput", err)
	}
}
