// Open-sourced by BaoLT

// Package craft handles RTMP requests for crafting/make-limit panel RPCs.
// onGetMakeLimitTimes returns the player's remaining make/craft limit count and reset date.
// Backing data lives in the mysTreasure JSONB blob; until that blob is fully modelled and
// persisted the handler returns the documented empty-correct shape {n:0, t:"0|0"}.
package craft

import (
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	logger *zap.Logger
}

func NewHandler(logger *zap.Logger) *Handler {
	return &Handler{logger: logger}
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("onGetMakeLimitTimes", h.GetMakeLimitTimes)
}
