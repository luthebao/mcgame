// Open-sourced by BaoLT

package star

import (
	"encoding/json"
	"testing"
)

func TestStarFlagLoginJSON_EmbedsWarMap(t *testing.T) {
	warMap := map[string]interface{}{
		"8": map[string]interface{}{"1": 60.77, "2": 100},
	}
	out := StarFlagLoginJSON(StarsState{}, warMap)

	var parsed map[string]interface{}
	if err := json.Unmarshal([]byte(out), &parsed); err != nil {
		t.Fatalf("unmarshal starFlag: %v", err)
	}
	wm, ok := parsed["warMap"].(map[string]interface{})
	if !ok {
		t.Fatalf("warMap = %v, want object", parsed["warMap"])
	}
	lvl8, ok := wm["8"].(map[string]interface{})
	if !ok {
		t.Fatalf("warMap[8] = %v, want object", wm["8"])
	}
	if lvl8["1"] != 60.77 {
		t.Fatalf("warMap[8][1] = %v, want 60.77", lvl8["1"])
	}
}

func TestStarFlagLoginJSON_NilWarMapIsEmptyObject(t *testing.T) {
	out := StarFlagLoginJSON(StarsState{}, nil)

	var parsed map[string]interface{}
	if err := json.Unmarshal([]byte(out), &parsed); err != nil {
		t.Fatalf("unmarshal starFlag: %v", err)
	}
	wm, ok := parsed["warMap"].(map[string]interface{})
	if !ok || len(wm) != 0 {
		t.Fatalf("warMap = %v, want empty object", parsed["warMap"])
	}
}
