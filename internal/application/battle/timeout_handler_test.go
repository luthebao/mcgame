// Open-sourced by BaoLT

// Unit tests for TurnTimeoutHandler.
// Tests automatic turn processing when players time out.
package battle

import (
	"context"
	"testing"

	"mcgame-server/internal/domain/combat"

	"go.uber.org/zap/zaptest"
)

func TestTimeoutHandler_HandleTurnTimeout(t *testing.T) {
	logger := zaptest.NewLogger(t)
	handler := NewTimeoutHandler(logger)

	battle := combat.NewBattle(combat.BattleTypePVE, 1)
	battle.Start()

	player := combat.NewParticipant("player1", "Test", combat.SidePlayer, false)
	player.MaxHP = 100
	player.CurrentHP = 100
	battle.AddParticipant(player)

	enemy := combat.NewParticipant("enemy1", "Enemy", combat.SideEnemy, true)
	enemy.MaxHP = 100
	enemy.CurrentHP = 100
	battle.AddParticipant(enemy)

	result, err := handler.HandleTurnTimeout(context.Background(), battle, "player1")
	if err != nil {
		t.Errorf("expected no error, got %v", err)
	}
	if result == nil {
		t.Error("expected non-nil result")
	}
}

func TestTimeoutHandler_ImplementsInterface(t *testing.T) {
	logger := zaptest.NewLogger(t)
	handler := NewTimeoutHandler(logger)

	var _ TurnTimeoutHandler = handler
}

func TestTimeoutHandler_NilBattle(t *testing.T) {
	logger := zaptest.NewLogger(t)
	handler := NewTimeoutHandler(logger)

	_, err := handler.HandleTurnTimeout(context.Background(), nil, "player1")
	if err == nil {
		t.Error("expected error for nil battle")
	}
}

func TestTimeoutHandler_EmptyParticipantID(t *testing.T) {
	logger := zaptest.NewLogger(t)
	handler := NewTimeoutHandler(logger)

	battle := combat.NewBattle(combat.BattleTypePVE, 1)
	battle.Start()

	_, err := handler.HandleTurnTimeout(context.Background(), battle, "")
	if err == nil {
		t.Error("expected error for empty participantID")
	}
}

func TestTimeoutHandler_UsesExistingPendingCommandsWhenNoActorsAreMissing(t *testing.T) {
	logger := zaptest.NewLogger(t)
	handler := NewTimeoutHandler(logger)

	battle := combat.NewBattle(combat.BattleTypePVE, 1)
	battle.Start()

	player := combat.NewParticipant("player1", "Test", combat.SidePlayer, false)
	player.EntityType = combat.ParticipantTypeCharacter
	player.Position = 0
	player.MaxHP = 100
	player.CurrentHP = 100
	player.Attack = 80
	player.Hit = 999
	battle.AddParticipant(player)

	enemy := combat.NewParticipant("enemy1", "Enemy", combat.SideEnemy, true)
	enemy.EntityType = combat.ParticipantTypeCreature
	enemy.Position = 10
	enemy.MaxHP = 100
	enemy.CurrentHP = 100
	enemy.Defense = 0
	battle.AddParticipant(enemy)

	battle.SetPendingCommands(map[string]*combat.BattleCommand{
		"player1": {
			ActorID:    "player1",
			ActionType: combat.ClientActionAttack,
			TargetID:   "enemy1",
		},
	})

	result, err := handler.HandleTurnTimeout(context.Background(), battle, "player1")
	if err != nil {
		t.Fatalf("HandleTurnTimeout() error = %v", err)
	}
	if result == nil || len(result.Actions) == 0 {
		t.Fatalf("HandleTurnTimeout() result = %#v, want processed actions", result)
	}
	foundAttack := false
	for _, action := range result.Actions {
		if action.ActionType == combat.ActionTypeAttack {
			foundAttack = true
			break
		}
	}
	if !foundAttack {
		t.Fatalf("result.Actions = %#v, want submitted attack command to be processed", result.Actions)
	}
}
