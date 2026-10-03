// Open-sourced by BaoLT

// Battle replay service methods for retrieving completed battle logs.
package combat

import (
	"context"
	"fmt"

	pkgerrors "mcgame-server/pkg/errors"
)

func (s *Service) GetBattleReplay(ctx context.Context, battleID int64) (map[string]interface{}, error) {
	log, err := s.battleLogRepo.FindByID(ctx, battleID)
	if err != nil {
		return nil, err
	}
	if log == nil {
		return nil, pkgerrors.ErrNotFound
	}

	participants := make([]map[string]interface{}, len(log.Participants))
	for i, p := range log.Participants {
		participants[i] = map[string]interface{}{
			"id":      p.ID,
			"name":    p.Name,
			"side":    p.Side,
			"isNpc":   p.IsNPC,
			"level":   p.Level,
			"maxHp":   p.MaxHP,
			"finalHp": p.FinalHP,
		}
	}

	actions := make([]map[string]interface{}, len(log.Actions))
	for i, a := range log.Actions {
		actions[i] = map[string]interface{}{
			"round":      a.Round,
			"actorId":    a.ActorID,
			"actionType": a.ActionType,
			"skillId":    a.SkillID,
			"targetId":   a.TargetID,
			"damage":     a.Damage,
			"isCritical": a.IsCritical,
			"isMiss":     a.IsMiss,
		}
	}

	result := map[string]interface{}{
		"winner":     log.Result.WinnerSide,
		"exp":        log.Result.ExpReward,
		"money":      log.Result.MoneyReward,
		"items":      log.Result.ItemRewards,
		"pets":       log.Result.PetRewards,
		"battleTime": log.Result.BattleTime,
	}

	return map[string]interface{}{
		"id":           log.ID,
		"battleType":   int(log.BattleType),
		"participants": participants,
		"actions":      actions,
		"result":       result,
		"createdAt":    log.CreatedAt,
	}, nil
}

func (s *Service) GetRecentBattles(ctx context.Context, charID int64, limit int) ([]map[string]interface{}, error) {
	if limit <= 0 {
		limit = 20
	}
	if limit > 100 {
		limit = 100
	}

	logs, err := s.battleLogRepo.FindByParticipant(ctx, fmt.Sprintf("%d", charID), limit)
	if err != nil {
		return nil, err
	}

	summaries := make([]map[string]interface{}, len(logs))
	for i, log := range logs {
		participants := make([]map[string]interface{}, len(log.Participants))
		for j, p := range log.Participants {
			participants[j] = map[string]interface{}{
				"id":    p.ID,
				"name":  p.Name,
				"side":  p.Side,
				"isNpc": p.IsNPC,
				"level": p.Level,
			}
		}

		summaries[i] = map[string]interface{}{
			"id":           log.ID,
			"battleType":   int(log.BattleType),
			"participants": participants,
			"winner":       log.Result.WinnerSide,
			"battleTime":   log.Result.BattleTime,
			"createdAt":    log.CreatedAt,
		}
	}

	return summaries, nil
}
