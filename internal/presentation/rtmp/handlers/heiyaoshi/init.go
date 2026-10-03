// Open-sourced by BaoLT

// Heiyaoshi panel init RPC: returns TRIANGLE_FIGURE topology and the player's persisted state.
package heiyaoshi

import (
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) InitHeiyaoshiPanelData(ctx *rtmp.RPCContext, args []any) (any, error) {
	h.logger.Info("InitHeiyaoshiPanelData called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	charID, ok := characterIDFromCtx(ctx)
	if !ok {
		return panelToWire(nil), nil
	}
	panel, err := h.service.LoadPanel(ctx.Context, charID)
	if err != nil {
		h.logger.Error("InitHeiyaoshiPanelData: load failed", zap.Int64("character_id", charID), zap.Error(err))
		return panelToWire(nil), nil
	}
	return panelToWire(panel), nil
}
