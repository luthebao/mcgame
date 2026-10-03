// Open-sourced by BaoLT

package pet

import "testing"

func TestToDTO_NormalizesElementValues(t *testing.T) {
	p := &Pet{
		Element:  9,
		Property: map[string]interface{}{},
		CreatureData: map[string]interface{}{
			"element": "7",
			"name":    "sample",
		},
	}

	dtoWrapper := p.ToDTO()
	dto := dtoWrapper["data"].(map[string]interface{})

	if got := dto["element"]; got != 0 {
		t.Fatalf("element = %v, want 0", got)
	}

	creatureData, ok := dto["creatureData"].(map[string]interface{})
	if !ok {
		t.Fatalf("creatureData type = %T, want map[string]interface{}", dto["creatureData"])
	}

	if got := creatureData["element"]; got != "0" {
		t.Fatalf("creatureData.element = %v, want 0", got)
	}

	if original := p.CreatureData["element"]; original != "7" {
		t.Fatalf("original creatureData.element = %v, want 7", original)
	}
}
