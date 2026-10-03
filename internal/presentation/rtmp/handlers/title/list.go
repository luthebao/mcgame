// Open-sourced by BaoLT

// Title list handlers.
package title

import (
	"context"
	"strconv"

	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) GetTitleList(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Debug("GetTitleList called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		h.logger.Error("Invalid character ID",
			zap.String("character_id", ctx.CharacterID),
			zap.Error(err))
		return map[string]interface{}{"ct": "", "cts": ""}, nil
	}

	result, err := h.titleService.GetTitleList(context.Background(), charID)
	if err != nil {
		h.logger.Error("Failed to get title list",
			zap.Int64("character_id", charID),
			zap.Error(err))
		return map[string]interface{}{"ct": "", "cts": ""}, nil
	}

	return result, nil
}
