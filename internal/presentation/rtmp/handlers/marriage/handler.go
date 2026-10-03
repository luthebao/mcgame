// Open-sourced by BaoLT

package marriage

import (
	appmarriage "mcgame-server/internal/application/marriage"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	service *appmarriage.Service
	logger  *zap.Logger
}

func NewHandler(service *appmarriage.Service, logger *zap.Logger) *Handler {
	return &Handler{
		service: service,
		logger:  logger,
	}
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("initMarriage", h.InitMarriage)
	dispatcher.Register("marriageSeeking", h.MarriageSeeking)
	dispatcher.Register("marriageRequest", h.MarriageRequest)
	dispatcher.Register("marriageReqFeedback", h.MarriageReqFeedback)
	dispatcher.Register("cancelMarriageSekInfo", h.CancelMarriageSekInfo)
	dispatcher.Register("getCoupleRank", h.GetCoupleRank)
}
