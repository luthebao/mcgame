// Open-sourced by BaoLT

package auth

import (
	"testing"

	"mcgame-server/internal/domain/character"
)

func TestApplyM6CDataScalars_EmitsActiveAndSpecialTitle(t *testing.T) {
	cData := map[string]interface{}{}
	applyM6CDataScalars(cData, &character.Character{}, false, 153, 202, "ct-str", "cts-str")

	if cData["t"] != "153" {
		t.Fatalf("t = %v, want \"153\" (active title, string)", cData["t"])
	}
	// actT is the active SPECIAL title, emitted as int (hs.json:2297 actT:202) — distinct
	// from t (forever title, string). Was previously never emitted.
	if cData["actT"] != 202 {
		t.Fatalf("actT = %v (%T), want 202 (int)", cData["actT"], cData["actT"])
	}
	if cData["ct"] != "ct-str" || cData["cts"] != "cts-str" {
		t.Fatalf("ct/cts = %v / %v", cData["ct"], cData["cts"])
	}
}

func TestApplyM6CDataScalars_NoSpecialTitleEmitsZero(t *testing.T) {
	cData := map[string]interface{}{}
	applyM6CDataScalars(cData, &character.Character{}, false, 0, 0, "", "")
	if cData["actT"] != 0 {
		t.Fatalf("actT (none) = %v, want 0", cData["actT"])
	}
}
