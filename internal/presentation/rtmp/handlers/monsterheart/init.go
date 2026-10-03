// Open-sourced by BaoLT

// initMonsterHeartData handler: loads panel state from feature store, returns {bag, data} via _result.
package monsterheart

import (
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) InitMonsterHeartData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("InitMonsterHeartData called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	charID, ok := h.charIDFromCtx(ctx)
	if !ok {
		return emptyPanelWire(), nil
	}

	if h.service == nil {
		return emptyPanelWire(), nil
	}

	state, err := h.service.Load(ctx.Context, charID)
	if err != nil {
		h.logger.Error("InitMonsterHeartData: load failed",
			zap.Int64("char_id", charID),
			zap.Error(err))
		return emptyPanelWire(), nil
	}

	return stateToWire(state), nil
}
