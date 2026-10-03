// Open-sourced by BaoLT

package activity

import (
	"encoding/json"
	"testing"
	"time"

	domainchar "mcgame-server/internal/domain/character"
)

func decodeVipInfo(t *testing.T, raw string) map[string]interface{} {
	t.Helper()
	var got map[string]interface{}
	if err := json.Unmarshal([]byte(raw), &got); err != nil {
		t.Fatalf("vipInfo is not valid JSON: %v (%s)", err, raw)
	}
	return got
}

func TestVipInfoLoginJSONActiveEntitlement(t *testing.T) {
	now := time.Date(2026, 6, 14, 0, 0, 0, 0, time.UTC)
	expires := now.Add(360 * 24 * time.Hour)
	char := &domainchar.Character{
		ID:           1,
		VIPType:      3,
		VIPExpiresAt: &expires,
		PMExp:        988277,
	}

	got := decodeVipInfo(t, VipInfoLoginJSON(char, now))

	if got["activeType"].(float64) != 3 {
		t.Fatalf("activeType = %v, want 3", got["activeType"])
	}
	if got["pmExp"].(float64) != 988277 {
		t.Fatalf("pmExp = %v, want 988277", got["pmExp"])
	}
	if keepDay := got["keepDay"].(float64); keepDay <= 359 || keepDay > 360 {
		t.Fatalf("keepDay = %v, want ~360", keepDay)
	}
	if got["activeTime"].(float64) != float64(now.UnixMilli()) {
		t.Fatalf("activeTime = %v, want %d", got["activeTime"], now.UnixMilli())
	}
}

func TestVipInfoLoginJSONNoEntitlement(t *testing.T) {
	now := time.Date(2026, 6, 14, 0, 0, 0, 0, time.UTC)
	char := &domainchar.Character{ID: 1, PMExp: 5000}

	got := decodeVipInfo(t, VipInfoLoginJSON(char, now))

	if got["activeType"].(float64) != 0 {
		t.Fatalf("activeType = %v, want 0 for inactive VIP", got["activeType"])
	}
	if got["keepDay"].(float64) != 0 {
		t.Fatalf("keepDay = %v, want 0 for inactive VIP", got["keepDay"])
	}
	if got["pmExp"].(float64) != 5000 {
		t.Fatalf("pmExp = %v, want 5000 (surfaced even without active entitlement)", got["pmExp"])
	}
}

func TestVipInfoLoginJSONNilChar(t *testing.T) {
	if got := VipInfoLoginJSON(nil, time.Now()); got != vipInfoFallbackJSON {
		t.Fatalf("nil char vipInfo = %s, want fallback %s", got, vipInfoFallbackJSON)
	}
}
