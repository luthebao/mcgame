// Open-sourced by BaoLT

package pet

import "testing"

func TestToDTO_EmitsClientStateAndPropertyAptitudes(t *testing.T) {
	p := &Pet{
		ID:              3,
		TemplateID:      32,
		Name:            "Tiểu Nấm Yêu",
		Level:           12,
		Experience:      999065,
		AptStrength:     100,
		AptAgility:      110,
		AptStamina:      120,
		AptIntelligence: 130,
		AptEnergy:       140,
		CurrentHP:       500,
		CurrentMP:       250,
		MaxHP:           1000,
		MaxMP:           500,
		Property: map[string]interface{}{
			"finalHp": 1000,
			"finalMp": 500,
			"state":   1,
		},
	}

	dtoWrapper := p.ToDTO()
	dto := dtoWrapper["data"].(map[string]interface{})

	if got := dto["state"]; got != 1 {
		t.Fatalf("dto.state = %v, want 1", got)
	}

	prop := dto["property"].(map[string]interface{})

	if got := prop["state"]; got != 1 {
		t.Fatalf("property.state = %v, want 1", got)
	}
	if got := prop["aptStrength"]; got != 100 {
		t.Fatalf("property.aptStrength = %v, want 100", got)
	}
	if got := prop["aptAgility"]; got != 110 {
		t.Fatalf("property.aptAgility = %v, want 110", got)
	}
	if got := prop["aptStamina"]; got != 120 {
		t.Fatalf("property.aptStamina = %v, want 120", got)
	}
	if got := prop["aptIntelligence"]; got != 130 {
		t.Fatalf("property.aptIntelligence = %v, want 130", got)
	}
	if got := prop["aptEnergy"]; got != 140 {
		t.Fatalf("property.aptEnergy = %v, want 140", got)
	}
}

func TestClientState_FallsBackToFollowingState(t *testing.T) {
	p := &Pet{
		IsFollowing: true,
		Property:    map[string]interface{}{},
	}

	if got := p.ClientState(); got != int(PetStateBattle) {
		t.Fatalf("ClientState() = %d, want %d (following pets report as battle state for client compatibility)", got, PetStateBattle)
	}
}

func TestClientState_ParsesStringStateValue(t *testing.T) {
	p := &Pet{
		Property: map[string]interface{}{
			"state": "1",
		},
	}

	if got := p.ClientState(); got != 1 {
		t.Fatalf("ClientState() = %d, want 1 (string state should be parsed)", got)
	}
}

func TestClientState_StringStateZeroFallsBackToFollowing(t *testing.T) {
	p := &Pet{
		IsFollowing: true,
		Property: map[string]interface{}{
			"state": "0",
		},
	}

	if got := p.ClientState(); got != int(PetStateBattle) {
		t.Fatalf("ClientState() = %d, want %d (string zero should fall through to IsFollowing)", got, PetStateBattle)
	}
}

func TestToDTO_EmitsPetEquipmentIDsAtRoot(t *testing.T) {
	p := &Pet{
		ID:         99,
		TemplateID: 32,
		Name:       "Pet Equip Test",
		Level:      1,
		CurrentHP:  100,
		CurrentMP:  50,
		MaxHP:      100,
		MaxMP:      50,
		Property: map[string]interface{}{
			"equ1": int64(9001),
			"equ8": int64(9008),
		},
	}

	dtoWrapper := p.ToDTO()
	dto := dtoWrapper["data"].(map[string]interface{})

	if got := dto["equ1"]; got != int64(9001) {
		t.Fatalf("dto.equ1 = %v, want 9001", got)
	}
	if got := dto["equ8"]; got != int64(9008) {
		t.Fatalf("dto.equ8 = %v, want 9008", got)
	}
	if got := dto["equ2"]; got != int64(0) {
		t.Fatalf("dto.equ2 = %v, want 0", got)
	}
}

func TestToDTO_UsesStoredPotentialInfoSettings(t *testing.T) {
	p := &Pet{
		ID:         101,
		TemplateID: 32,
		Name:       "Pet PI Test",
		Level:      1,
		CurrentHP:  100,
		CurrentMP:  50,
		MaxHP:      100,
		MaxMP:      50,
		Property: map[string]interface{}{
			"p6":  35,
			"bs2": 8801,
			"bt2": 52,
			"bt6": 29,
		},
	}

	dtoWrapper := p.ToDTO()
	dto := dtoWrapper["data"].(map[string]interface{})
	pi := dto["pi"].(map[string]interface{})

	if got := pi["p6"]; got != 35 {
		t.Fatalf("pi[p6] = %v, want 35", got)
	}
	if got := pi["bs2"]; got != 8801 {
		t.Fatalf("pi[bs2] = %v, want 8801", got)
	}
	if got := pi["bt2"]; got != 52 {
		t.Fatalf("pi[bt2] = %v, want 52", got)
	}
	if got := pi["bt6"]; got != 29 {
		t.Fatalf("pi[bt6] = %v, want 29", got)
	}
	if got := pi["bs10"]; got != 0 {
		t.Fatalf("pi[bs10] = %v, want 0", got)
	}
}
