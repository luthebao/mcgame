// Open-sourced by BaoLT

package petarena

import (
	"fmt"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) PetArenaFight(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if err := ensureArgs(args, 1); err != nil {
		return nil, err
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	opponentID, err := parseInt64Arg(args[0])
	if err != nil {
		return nil, err
	}

	battle, result, err := h.arenaService.Fight(ctx.Context, characterID, opponentID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Pet arena fight completed",
		zap.Int64("character_id", characterID),
		zap.Int64("opponent_id", opponentID),
		zap.Bool("won", result.AttackerWon))

	enemies, _ := h.arenaService.GetEnemies(ctx.Context, characterID)
	payload := map[string]interface{}{
		"guest":  false,
		"g_cid":  opponentID,
		"g_name": fmt.Sprintf("%d", opponentID),
		"result": mapArenaResult(result.AttackerWon),
		"pnt":    result.AttackerRatingChange,
		"bid":    fmt.Sprintf("%d", battle.ID),
		"enemy":  enemies,
	}
	if err := ctx.Connection.SendCallback("onPetArenaFight", payload); err != nil {
		h.logger.Warn("Failed to send onPetArenaFight callback", zap.Error(err))
	}

	return payload, nil
}

func (h *Handler) PetArenaFightActivity(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	return h.PetArenaFight(ctx, args)
}

func (h *Handler) PetFightResult(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if err := ensureArgs(args, 1); err != nil {
		return nil, err
	}

	battleID, err := parseInt64Arg(args[0])
	if err != nil {
		return nil, err
	}

	battle, err := h.arenaService.GetBattle(ctx.Context, battleID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	payload := battle.ToDTO()
	if resultMap, ok := payload["result"].(map[string]interface{}); ok {
		payload["result"] = resultMap["winner"]
	}
	if err := ctx.Connection.SendCallback("onPetFightResult", payload); err != nil {
		h.logger.Warn("Failed to send onPetFightResult callback", zap.Error(err))
	}
	return payload, nil
}

func (h *Handler) AddPetFightNum(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	amount := 5
	if len(args) >= 1 {
		parsedAmount, err := parseIntArg(args[0])
		if err == nil {
			amount = parsedAmount
		}
	}

	if err := h.arenaService.AddTickets(ctx.Context, characterID, amount); err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	tickets, maxTickets, _ := h.arenaService.GetTickets(ctx.Context, characterID)

	h.logger.Info("Pet arena tickets added",
		zap.Int64("character_id", characterID),
		zap.Int("amount", amount))

	return map[string]interface{}{
		"success":    true,
		"tickets":    tickets,
		"maxTickets": maxTickets,
	}, nil
}

func (h *Handler) ClearArenaCD(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	if err := h.arenaService.ClearCooldown(ctx.Context, characterID); err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	tickets, maxTickets, _ := h.arenaService.GetTickets(ctx.Context, characterID)

	h.logger.Info("Pet arena cooldown cleared",
		zap.Int64("character_id", characterID))

	return map[string]interface{}{
		"success":    true,
		"cost":       100,
		"tickets":    tickets,
		"maxTickets": maxTickets,
	}, nil
}

func (h *Handler) ReplayPetFight(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if err := ensureArgs(args, 1); err != nil {
		return nil, err
	}

	battleID, err := parseInt64Arg(args[0])
	if err != nil {
		return nil, err
	}

	battle, err := h.arenaService.GetBattle(ctx.Context, battleID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	return map[string]interface{}{
		"battleLog": battle.ToDTO()["battleLog"],
	}, nil
}

func (h *Handler) ReplayPetPVEFight(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	return h.ReplayPetFight(ctx, args)
}

func mapArenaResult(attackerWon bool) int {
	if attackerWon {
		return 1
	}
	return 2
}
