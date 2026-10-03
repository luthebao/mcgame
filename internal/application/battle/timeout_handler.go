// Open-sourced by BaoLT

// TurnTimeoutHandler processes battles when players fail to submit commands in time.
// Submits a timeout action and processes the round automatically.
// Returns the RoundResult so callers can send battle callbacks.
package battle

import (
	"context"
	"errors"

	"mcgame-server/internal/domain/combat"

	"go.uber.org/zap"
)

type TimeoutHandler struct {
	skillGetter combat.SkillGetter
	logger      *zap.Logger
}

func NewTimeoutHandler(logger *zap.Logger) *TimeoutHandler {
	return &TimeoutHandler{logger: logger}
}

func (h *TimeoutHandler) SetSkillGetter(sg combat.SkillGetter) {
	h.skillGetter = sg
}

func (h *TimeoutHandler) HandleTurnTimeout(
	ctx context.Context,
	battle *combat.Battle,
	participantID string,
) (*combat.RoundResult, error) {
	if battle == nil {
		return nil, errors.New("battle is nil")
	}
	if participantID == "" {
		return nil, errors.New("participantID is empty")
	}

	processor := combat.NewTurnProcessor(battle, h.skillGetter)
	for _, command := range battle.GetPendingCommands() {
		processor.SetCommand(command)
	}

	missingActors := battle.MissingPlayerCommandActors(battle.GetPendingCommands())
	for _, actorID := range missingActors {
		processor.SetCommand(&combat.BattleCommand{
			ActorID:    actorID,
			ActionType: combat.ClientActionTimeout,
		})
	}

	battle.ClearPendingCommands()
	result := processor.ProcessRound()

	h.logger.Info("Turn timeout processed",
		zap.String("battle_id", battle.ID),
		zap.String("participant_id", participantID),
		zap.Int("round", result.Round),
		zap.Bool("battle_ended", result.BattleEnded))

	return result, nil
}
