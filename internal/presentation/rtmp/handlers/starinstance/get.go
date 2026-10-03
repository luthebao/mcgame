// Open-sourced by BaoLT

// GetWarMap handler returns the 12x12 score grid and daily attempt state.
package starinstance

import (
	"strconv"

	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) GetWarMap(ctx *rtmp.RPCContext, args []any) (any, error) {
	h.logger.Info("GetWarMap called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	charID, ok := characterIDFromCtx(ctx)
	if !ok {
		return map[string]any{"status": 0}, nil
	}

	state, err := h.service.GetWarMap(ctx.Context, charID)
	if err != nil {
		h.logger.Error("GetWarMap: service error",
			zap.Int64("char_id", charID),
			zap.Error(err))
		return map[string]any{"status": 0}, nil
	}

	dMap := make(map[string]any, 12)
	for lvl := 1; lvl <= 12; lvl++ {
		inner := make(map[string]any, 12)
		for sid := 1; sid <= 12; sid++ {
			var score float64
			if lvlMap, ok2 := state.Scores[lvl]; ok2 {
				score = lvlMap[sid]
			}
			inner[strconv.Itoa(sid)] = score
		}
		dMap[strconv.Itoa(lvl)] = inner
	}

	return map[string]any{
		"d": dMap,
		"s": map[string]any{
			"smax": state.DailyMax,
			"snum": state.DailyUsed,
		},
	}, nil
}
