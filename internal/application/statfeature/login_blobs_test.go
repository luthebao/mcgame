// Open-sourced by BaoLT

package statfeature

import (
	"encoding/json"
	"testing"
)

func TestBuildPetPVEDataJSON_PopulatedAndEmpty(t *testing.T) {
	if got := buildPetPVEDataJSON(nil); got != `{"mlv":0,"p":{},"ppveConfig":{}}` {
		t.Fatalf("empty petPVEData = %s", got)
	}

	state := map[string]interface{}{
		"mlv":        float64(48),
		"p":          map[string]interface{}{"s0": map[string]interface{}{"0": float64(1120)}},
		"ppveConfig": map[string]interface{}{"1": map[string]interface{}{"pid": float64(3)}},
		"kp":         float64(999),
	}
	var out map[string]interface{}
	if err := json.Unmarshal([]byte(buildPetPVEDataJSON(state)), &out); err != nil {
		t.Fatalf("unmarshal: %v", err)
	}
	if out["mlv"].(float64) != 48 {
		t.Fatalf("mlv = %v", out["mlv"])
	}
	if _, ok := out["p"].(map[string]interface{})["s0"]; !ok {
		t.Fatalf("p.s0 missing: %v", out["p"])
	}
	if _, leaked := out["kp"]; leaked {
		t.Fatalf("kp must not appear in petPVEData wire: %v", out)
	}
}

func TestBuildPetTalentInfoJSON_PreservesWireShape(t *testing.T) {
	if got := buildPetTalentInfoJSON(nil); got != `{"b":{},"inTal":{},"tal":{}}` {
		t.Fatalf("empty petTalentInfo = %s", got)
	}
	state := map[string]interface{}{
		"tal":   map[string]interface{}{"10001": float64(6)},
		"inTal": map[string]interface{}{"10010": float64(70)},
		"b":     map[string]interface{}{"1": map[string]interface{}{"t": float64(70), "n": float64(3)}},
	}
	var out map[string]interface{}
	if err := json.Unmarshal([]byte(buildPetTalentInfoJSON(state)), &out); err != nil {
		t.Fatalf("unmarshal: %v", err)
	}
	if _, ok := out["tal"].(map[string]interface{})["10001"]; !ok {
		t.Fatalf("tal entry missing: %v", out["tal"])
	}
	if _, ok := out["b"].(map[string]interface{})["1"]; !ok {
		t.Fatalf("bag entry missing: %v", out["b"])
	}
}

func TestBuildPetStoneBagJSON_SparseArrayAndGaps(t *testing.T) {
	if got := buildPetStoneBagJSON(nil); got != "[]" {
		t.Fatalf("empty petStoneBag = %s", got)
	}
	state := map[string]interface{}{
		"b": map[string]interface{}{
			"0": map[string]interface{}{"g": float64(87), "n": float64(20), "s": float64(0)},
			"2": map[string]interface{}{"g": float64(30), "n": float64(1), "s": float64(0)},
		},
	}
	got := buildPetStoneBagJSON(state)
	if got != `[[87,20,0],null,[30,1,0]]` {
		t.Fatalf("sparse petStoneBag = %s, want [[87,20,0],null,[30,1,0]]", got)
	}
}

func TestBuildPetStoneBagJSON_SkipsInvalidEntries(t *testing.T) {
	state := map[string]interface{}{
		"b": map[string]interface{}{
			"0": map[string]interface{}{"g": float64(0), "n": float64(5), "s": float64(0)},
			"1": map[string]interface{}{"g": float64(12), "n": float64(0), "s": float64(0)},
		},
	}
	if got := buildPetStoneBagJSON(state); got != "[]" {
		t.Fatalf("invalid entries should be skipped, got %s", got)
	}
}
