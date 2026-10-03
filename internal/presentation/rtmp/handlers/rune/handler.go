// Open-sourced by BaoLT

// Rune panel RPC handler.
// Inbound: getRuneBagData, exchangeRune, runeMove, arrangeRuneBag.
// Outbound: updateRuneChipBag (push after chip-bag mutations),
// onRuneBagUpdate (push of the full runeInfo after a bag move/arrange).
package rune

import (
	apprune "mcgame-server/internal/application/rune"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	logger  *zap.Logger
	service *apprune.Service
}

func NewHandler(service *apprune.Service, logger *zap.Logger) *Handler {
	return &Handler{service: service, logger: logger}
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("getRuneBagData", h.GetRuneBagData)
	dispatcher.Register("exchangeRune", h.ExchangeRune)
	dispatcher.Register("runeMove", h.RuneMove)
	dispatcher.Register("arrangeRuneBag", h.ArrangeRuneBag)
	dispatcher.Register("runeSet", h.RuneSet)
	dispatcher.Register("runeRemove", h.RuneRemove)
	dispatcher.Register("runeUpLvl", h.RuneUpLvl)
	dispatcher.Register("runeResolve", h.RuneResolve)
}
