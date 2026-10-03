// Open-sourced by BaoLT

// AddWarMapTime handler allows purchasing extra daily attempts with gold.
package starinstance

import (
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) AddWarMapTime(ctx *rtmp.RPCContext, args []any) (any, error) {
	h.logger.Info("AddWarMapTime called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	charID, ok := characterIDFromCtx(ctx)
	if !ok {
		return 0, nil
	}

	if len(args) < 1 {
		return 0, nil
	}
	currentMax, err := parseIntArg(args[0])
	if err != nil {
		return 0, nil
	}

	newMax, err := h.service.AddWarMapTime(ctx.Context, charID, currentMax)
	if err != nil {
		h.logger.Warn("AddWarMapTime: service error",
			zap.Int64("char_id", charID),
			zap.Int("currentMax", currentMax),
			zap.String("reason", wrapWarMapError(err)))
		return 0, nil
	}

	if ctx.Connection != nil {
		_ = ctx.Connection.SendCallback("updateWarMapStatus", map[string]any{
			"smax": newMax,
		})
	}

	h.logger.Info("AddWarMapTime: success",
		zap.Int64("char_id", charID),
		zap.Int("newMax", newMax))

	return newMax, nil
}
