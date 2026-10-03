// Open-sourced by BaoLT

package utils

import (
	"testing"

	domainchar "mcgame-server/internal/domain/character"
)

type expTestSender struct {
	calls []expTestCall
}

type expTestCall struct {
	method string
	args   []interface{}
}

func (s *expTestSender) SendCallback(method string, args ...interface{}) error {
	copiedArgs := make([]interface{}, len(args))
	copy(copiedArgs, args)
	s.calls = append(s.calls, expTestCall{method: method, args: copiedArgs})
	return nil
}

func (s *expTestSender) AddExpSkill(amount int64) int64 {
	return amount
}

func TestSendExpAndLevelUpCallbacksWithEquipment_UsesEffectiveMaxStats(t *testing.T) {
	char := &domainchar.Character{
		Level:        10,
		Strength:     30,
		Agility:      18,
		Stamina:      20,
		Intelligence: 15,
		Spirit:       12,
	}
	char.RecalculateStats()
	effectiveMaxHP := char.MaxHP + 1000
	char.CurrentHP = effectiveMaxHP

	bonuses := domainchar.NewEquipmentStatBonuses()
	bonuses.AddFlat(domainchar.PropMaxHP, 1000)

	sender := &expTestSender{}
	SendExpAndLevelUpCallbacksWithEquipment(sender, char, 0, false, &bonuses)

	if len(sender.calls) == 0 {
		t.Fatal("no callbacks sent")
	}

	payload, ok := sender.calls[0].args[0].(map[string]interface{})
	if !ok {
		t.Fatalf("callback payload = %T, want map[string]interface{}", sender.calls[0].args[0])
	}
	if got := payload["currentHp"]; got != effectiveMaxHP {
		t.Fatalf("currentHp = %v, want %d", got, effectiveMaxHP)
	}

	property, ok := payload["property"].(map[string]interface{})
	if !ok {
		t.Fatalf("property payload = %T, want map[string]interface{}", payload["property"])
	}
	if got := property["finalHp"]; got != effectiveMaxHP {
		t.Fatalf("property.finalHp = %v, want %d", got, effectiveMaxHP)
	}
	if got := property["hpMax"]; got != effectiveMaxHP {
		t.Fatalf("property.hpMax = %v, want %d", got, effectiveMaxHP)
	}
}
