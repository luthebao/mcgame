// Open-sourced by BaoLT

// Battle replay and history handlers for retrieving completed battle logs.
package combat

import (
	"strconv"

	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) GetBattleReplay(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	var battleID int64
	switch v := args[0].(type) {
	case float64:
		battleID = int64(v)
	case string:
		parsed, err := strconv.ParseInt(v, 10, 64)
		if err != nil {
			return nil, pkgerrors.ErrInvalidArgs
		}
		battleID = parsed
	default:
		return nil, pkgerrors.ErrInvalidArgs
	}

	replayData, err := h.combatService.GetBattleReplay(ctx.Context, battleID)
	if err != nil {
		h.logger.Warn("Failed to get battle replay",
			zap.Int64("battle_id", battleID),
			zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}

	return map[string]interface{}{
		"success": true,
		"replay":  replayData,
	}, nil
}

func (h *Handler) GetRecentBattles(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	limit := 20
	if len(args) >= 1 {
		switch v := args[0].(type) {
		case float64:
			limit = int(v)
		case int:
			limit = v
		}
	}

	battles, err := h.combatService.GetRecentBattles(ctx.Context, characterID, limit)
	if err != nil {
		h.logger.Warn("Failed to get recent battles",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}

	return map[string]interface{}{
		"success": true,
		"battles": battles,
	}, nil
}
