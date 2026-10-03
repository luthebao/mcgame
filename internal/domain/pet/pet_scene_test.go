// Open-sourced by BaoLT

package pet

import "testing"

func TestPetToSceneDTOIncludesSceneFields(t *testing.T) {
	p := &Pet{
		ID:              3,
		CharacterID:     11581,
		TemplateID:      32,
		Name:            "Tiểu Nấm Yêu",
		Level:           12,
		CurrentHP:       512,
		CurrentMP:       128,
		MaxHP:           700,
		MaxMP:           260,
		Element:         1,
		AptStrength:     180,
		AptAgility:      150,
		AptStamina:      200,
		AptIntelligence: 110,
		AptEnergy:       120,
		Property: map[string]interface{}{
			"state":   2,
			"finalHp": 700,
			"equ7":    int64(7007),
			"equ8":    int64(7008),
		},
		CreatureData: map[string]interface{}{
			"name":       "Nấm Yêu",
			"resCode":    "2302",
			"iconCode":   "140627834",
			"colorCode":  "0",
			"brightCode": "0",
			"classId":    "12",
			"catchable":  "1",
			"qLevel":     "0",
			"life":       "9999",
			"growBase":   "0.80",
		},
	}

	got := p.ToSceneDTO()

	if got["id"] != int64(3) {
		t.Fatalf("id = %v, want 3", got["id"])
	}
	if got["cid"] != int64(11581) {
		t.Fatalf("cid = %v, want 11581", got["cid"])
	}
	if got["tid"] != 32 {
		t.Fatalf("tid = %v, want 32", got["tid"])
	}
	if got["name"] != "Tiểu Nấm Yêu" {
		t.Fatalf("name = %v, want Tiểu Nấm Yêu", got["name"])
	}
	if got["resCode"] != int64(2302) {
		t.Fatalf("resCode = %v, want 2302", got["resCode"])
	}
	if got["iconCode"] != int64(140627834) {
		t.Fatalf("iconCode = %v, want 140627834", got["iconCode"])
	}
	if got["growBase"] != 0.8 {
		t.Fatalf("growBase = %v, want 0.8", got["growBase"])
	}
	if got["equ7"] != int64(7007) {
		t.Fatalf("equ7 = %v, want 7007", got["equ7"])
	}
	if got["equ8"] != int64(7008) {
		t.Fatalf("equ8 = %v, want 7008", got["equ8"])
	}

	property, ok := got["property"].(map[string]interface{})
	if !ok {
		t.Fatalf("property type = %T, want map[string]interface{}", got["property"])
	}
	if property["state"] != 2 {
		t.Fatalf("property.state = %v, want 2", property["state"])
	}
	if property["finalHp"] != 700 {
		t.Fatalf("property.finalHp = %v, want 700", property["finalHp"])
	}
}
