// Open-sourced by BaoLT

// Daily act award handler: claim vitality-chest reward for the current day.
package activity

import (
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) GetDailyActAward(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "GetDailyActAward")
	if err != nil {
		return nil, err
	}

	if len(args) < 1 {
		h.logger.Warn("GetDailyActAward: missing tier arg",
			zap.Int64("character_id", characterID))
		return map[string]interface{}{"f": false}, nil
	}

	tierVal, ok := parseIntArg(args[0])
	if !ok {
		h.logger.Warn("GetDailyActAward: tier not numeric",
			zap.Int64("character_id", characterID),
			zap.Any("arg0", args[0]))
		return map[string]interface{}{"f": false}, nil
	}

	tier := int16(tierVal)

	if h.dailyActService == nil {
		h.logger.Error("GetDailyActAward: service not wired",
			zap.Int64("character_id", characterID))
		return nil, pkgerrors.ErrSystemError
	}

	success, err := h.dailyActService.ClaimAward(ctx.Context, characterID, tier)
	if err != nil {
		h.logger.Warn("GetDailyActAward: claim error",
			zap.Int64("character_id", characterID),
			zap.Int16("tier", tier),
			zap.Error(err))
		return map[string]interface{}{"f": false}, nil
	}

	return map[string]interface{}{"f": success}, nil
}
