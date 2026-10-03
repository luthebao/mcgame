// Open-sourced by BaoLT

package character

import (
	"context"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"
)

func TestGetFinalPraDef_AggregatesEquipmentAndFeatureBonuses(t *testing.T) {
	char := newDetailTestCharacter(55, "tester")
	char.FinalPraDef = 0.1

	bonuses := domainchar.NewEquipmentStatBonuses()
	bonuses.AddFloat(domainchar.PropFinalPhysReduce, 0.5)

	handler := newDetailTestHandler(
		map[int64]domainchar.EquipmentStatBonuses{55: bonuses},
		map[int64]domainchar.EquipmentStatBonuses{},
		char,
	)

	result, err := handler.GetFinalPraDef(&rtmp.RPCContext{
		Context:     context.Background(),
		CharacterID: "55",
	}, nil)
	if err != nil {
		t.Fatalf("GetFinalPraDef() error = %v", err)
	}

	got, ok := result.(float64)
	if !ok {
		t.Fatalf("GetFinalPraDef() type = %T, want float64", result)
	}
	if got <= char.FinalPraDef {
		t.Fatalf("GetFinalPraDef() = %v, want > %v (equipment bonus must be included)", got, char.FinalPraDef)
	}
}

func TestGetFinalPraDef_ReturnsKeyValueWhenArgPresent(t *testing.T) {
	char := newDetailTestCharacter(56, "tester")

	handler := newDetailTestHandler(
		map[int64]domainchar.EquipmentStatBonuses{},
		map[int64]domainchar.EquipmentStatBonuses{},
		char,
	)

	result, err := handler.GetFinalPraDef(&rtmp.RPCContext{
		Context:     context.Background(),
		CharacterID: "56",
	}, []interface{}{"finalPraDef"})
	if err != nil {
		t.Fatalf("GetFinalPraDef() error = %v", err)
	}

	payload, ok := result.(map[string]interface{})
	if !ok {
		t.Fatalf("GetFinalPraDef() type = %T, want map[string]interface{}", result)
	}
	if _, ok := payload["key"]; !ok {
		t.Fatalf("GetFinalPraDef() missing 'key' in response map")
	}
	if _, ok := payload["value"]; !ok {
		t.Fatalf("GetFinalPraDef() missing 'value' in response map")
	}
}

func TestFinalPraMagDef_AggregatesEquipmentAndFeatureBonuses(t *testing.T) {
	char := newDetailTestCharacter(57, "tester")
	char.FinalPraMagDef = 0.2

	bonuses := domainchar.NewEquipmentStatBonuses()
	bonuses.AddFloat(domainchar.PropFinalMagicReduce, 0.3)

	handler := newDetailTestHandler(
		map[int64]domainchar.EquipmentStatBonuses{57: bonuses},
		map[int64]domainchar.EquipmentStatBonuses{},
		char,
	)

	result, err := handler.FinalPraMagDef(&rtmp.RPCContext{
		Context:     context.Background(),
		CharacterID: "57",
	}, nil)
	if err != nil {
		t.Fatalf("FinalPraMagDef() error = %v", err)
	}

	got, ok := result.(float64)
	if !ok {
		t.Fatalf("FinalPraMagDef() type = %T, want float64", result)
	}
	if got <= char.FinalPraMagDef {
		t.Fatalf("FinalPraMagDef() = %v, want > %v (equipment bonus must be included)", got, char.FinalPraMagDef)
	}
}
