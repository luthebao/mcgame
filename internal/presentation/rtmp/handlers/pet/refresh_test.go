// Open-sourced by BaoLT

package pet

import (
	"context"
	"testing"

	apppet "mcgame-server/internal/application/pet"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func TestGetFinalPraDefPetReturnsScalarValue(t *testing.T) {
	repo := &managementTestPetRepo{
		pets: map[int64]*domainpet.Pet{
			101: {
				ID:          101,
				CharacterID: 77,
				Property: map[string]interface{}{
					"state":       int(domainpet.PetStateBattle),
					"finalPraDef": 12,
				},
			},
		},
	}
	service := apppet.NewService(repo, zap.NewNop())
	handler := NewHandler(service, nil, zap.NewNop())

	result, err := handler.GetFinalPraDefPet(&rtmp.RPCContext{
		Context:     context.Background(),
		CharacterID: "77",
	}, nil)
	if err != nil {
		t.Fatalf("GetFinalPraDefPet() error = %v", err)
	}

	value, ok := result.(float64)
	if !ok {
		t.Fatalf("GetFinalPraDefPet() type = %T, want float64", result)
	}
	if value < 0 {
		t.Fatalf("GetFinalPraDefPet() = %v, want non-negative scalar", value)
	}
}

func TestGetFinalPraDefPetReturnsKeyedValueWhenLabelProvided(t *testing.T) {
	repo := &managementTestPetRepo{
		pets: map[int64]*domainpet.Pet{
			101: {
				ID:          101,
				CharacterID: 77,
				Property: map[string]interface{}{
					"state":       int(domainpet.PetStateBattle),
					"finalPraDef": 12,
				},
			},
		},
	}
	service := apppet.NewService(repo, zap.NewNop())
	handler := NewHandler(service, nil, zap.NewNop())

	result, err := handler.GetFinalPraDefPet(&rtmp.RPCContext{
		Context:     context.Background(),
		CharacterID: "77",
	}, []interface{}{"finalPraDef", 0, 77})
	if err != nil {
		t.Fatalf("GetFinalPraDefPet() error = %v", err)
	}

	payload, ok := result.(map[string]interface{})
	if !ok {
		t.Fatalf("GetFinalPraDefPet() type = %T, want map[string]interface{}", result)
	}
	if got := payload["key"]; got != "finalPraDef" {
		t.Fatalf("payload[key] = %#v, want finalPraDef", got)
	}
	value, ok := payload["value"].(float64)
	if !ok {
		t.Fatalf("payload[value] type = %T, want float64", payload["value"])
	}
	if value < 0 {
		t.Fatalf("payload[value] = %v, want non-negative scalar", value)
	}
}
