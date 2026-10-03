// Open-sourced by BaoLT

package adminhttp

import (
	"context"
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/google/uuid"
	"go.uber.org/zap"

	"mcgame-server/internal/domain/character"
)

type stubCharacterUpdater struct {
	updated *character.Character
	err     error
}

func (s *stubCharacterUpdater) Update(_ context.Context, char *character.Character) error {
	if s.err != nil {
		return s.err
	}
	snapshot := *char
	s.updated = &snapshot
	return nil
}

func TestExecuteSetCombatStats_RejectsDerivedStatOverrides(t *testing.T) {
	server := &Server{logger: zap.NewNop()}
	recorder := httptest.NewRecorder()

	server.executeSetCombatStats(recorder, context.Background(), character.NewCharacter(uuid.New(), "tester", 1, 0), json.RawMessage(`{"maxHp":1234}`))

	if recorder.Code != http.StatusBadRequest {
		t.Fatalf("status = %d, want %d", recorder.Code, http.StatusBadRequest)
	}
}

func TestExecuteSetCombatStats_RecalculatesDerivedStats(t *testing.T) {
	updater := &stubCharacterUpdater{}
	server := &Server{
		logger:           zap.NewNop(),
		characterUpdater: updater,
	}

	char := character.NewCharacter(uuid.New(), "tester", 1, 0)
	char.Level = 12
	char.Strength = 40
	char.Agility = 28
	char.Stamina = 35
	char.Intelligence = 22
	char.Spirit = 18
	char.AptStrength = 6
	char.AptAgility = 4
	char.AptStamina = 5
	char.AptIntelligence = 3
	char.AptEnergy = 2
	char.ClassAptStrength = 20
	char.ClassAptAgility = 15
	char.ClassAptStamina = 25
	char.ClassAptIntelligence = 10
	char.ClassAptEnergy = 12
	char.RecalculateStats()
	wantMaxHP := char.MaxHP
	wantAttack := char.Attack

	char.CurrentHP = wantMaxHP + 999
	char.CurrentMP = char.MaxMP + 999
	char.CurrentSP = char.MaxSP + 999
	char.MaxHP = 1
	char.MaxMP = 1
	char.MaxSP = 1
	char.Attack = 1

	recorder := httptest.NewRecorder()
	server.executeSetCombatStats(recorder, context.Background(), char, json.RawMessage(`{"refresh":true}`))

	if recorder.Code != http.StatusOK {
		t.Fatalf("status = %d, want %d", recorder.Code, http.StatusOK)
	}
	if updater.updated == nil {
		t.Fatal("expected character update to be persisted")
	}
	if updater.updated.MaxHP != wantMaxHP {
		t.Fatalf("max hp = %d, want %d", updater.updated.MaxHP, wantMaxHP)
	}
	if updater.updated.Attack != wantAttack {
		t.Fatalf("attack = %d, want %d", updater.updated.Attack, wantAttack)
	}
	if updater.updated.CurrentHP != updater.updated.MaxHP {
		t.Fatalf("current hp = %d, want clamped max hp %d", updater.updated.CurrentHP, updater.updated.MaxHP)
	}
	if updater.updated.CurrentMP != updater.updated.MaxMP {
		t.Fatalf("current mp = %d, want clamped max mp %d", updater.updated.CurrentMP, updater.updated.MaxMP)
	}
	if updater.updated.CurrentSP != updater.updated.MaxSP {
		t.Fatalf("current sp = %d, want clamped max sp %d", updater.updated.CurrentSP, updater.updated.MaxSP)
	}
}
