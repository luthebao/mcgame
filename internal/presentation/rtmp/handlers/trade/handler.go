// Open-sourced by BaoLT

// Trade handler core: dependency wiring and registration.
package trade

import (
	appchar "mcgame-server/internal/application/character"
	apptrade "mcgame-server/internal/application/trade"
	domainauth "mcgame-server/internal/domain/auth"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	tradeService *apptrade.Service
	charService  *appchar.Service
	rtmpServer   *rtmp.Server
	accountRepo  domainauth.AccountRepository
	logger       *zap.Logger
}

func NewHandler(tradeService *apptrade.Service, charService *appchar.Service, rtmpServer *rtmp.Server, logger *zap.Logger) *Handler {
	return &Handler{
		tradeService: tradeService,
		charService:  charService,
		rtmpServer:   rtmpServer,
		logger:       logger,
	}
}

func (h *Handler) SetAccountRepository(accountRepo domainauth.AccountRepository) {
	h.accountRepo = accountRepo
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("newTrade", h.NewTrade)
	dispatcher.Register("stopTrade", h.StopTrade)
	dispatcher.Register("tradeLock", h.TradeLock)
	dispatcher.Register("tradeConfirm", h.TradeConfirm)
	dispatcher.Register("tradeAddItem", h.TradeAddItem)
	dispatcher.Register("tradeRemoveItem", h.TradeRemoveItem)
	dispatcher.Register("tradeSetMoney", h.TradeSetMoney)
}
