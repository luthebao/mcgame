// Open-sourced by BaoLT

// Ranking handler registers RPC handlers for player ranking queries.
// rankGet returns a correctly-shaped top-10 list for a named category.
// getRankList is a no-op stub until a ranking persistence layer exists.
package ranking

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
	dispatcher.Register("rankGet", h.RankGet)
	dispatcher.Register("getRankList", h.GetRankList)
}
