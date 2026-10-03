// Open-sourced by BaoLT

// Stub handler core for placeholder RPC registrations.
package stub

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
	methods := []string{
		"getRepeatSysMsg",
		"getHeadline",
		"closeAuction",
		"getCharStateClient",
		"fixFlyState",
		"addMail",
		"getMail",
		"auctionSearch",
		"submitAddict",
		"callGm",
		"shopClosePanel",
		"getLimitTimeShop",
		"product",
		"uc",
		"gtg",
		"ex",
		"gg",
		"getGuildInfo",
		"getGuildList",
		"getDailyOnlineAct",
		"getActivityInfo",
		"inInstanceMap",
		"onlineReport",
	}

	for _, method := range methods {
		dispatcher.Register(method, h.stubHandler(method))
	}
}

func (h *Handler) stubHandler(_ string) rtmp.HandlerFunc {
	return func(_ *rtmp.RPCContext, _ []interface{}) (interface{}, error) {
		return nil, nil
	}
}
