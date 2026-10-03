// Open-sourced by BaoLT

// Social handler core: dependency wiring and registration.
package social

import (
	appsocial "mcgame-server/internal/application/social"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	socialService *appsocial.Service
	rtmpServer    *rtmp.Server
	logger        *zap.Logger
}

func NewHandler(socialService *appsocial.Service, logger *zap.Logger) *Handler {
	return &Handler{
		socialService: socialService,
		logger:        logger,
	}
}

func (h *Handler) SetRTMPServer(rtmpServer *rtmp.Server) {
	h.rtmpServer = rtmpServer
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("initViewImC", h.InitViewImC)
	dispatcher.Register("getFriendList", h.GetFriendList)
	dispatcher.Register("getBlackList", h.GetBlackList)
	dispatcher.Register("addRelationByName", h.AddRelationByName)
	dispatcher.Register("delRelationship", h.DelRelationship)
	dispatcher.Register("initTS", h.InitTS)
	dispatcher.Register("findTeacher", h.FindTeacher)
	dispatcher.Register("findStudent", h.FindStudent)
	dispatcher.Register("reportTS", h.ReportTS)
	dispatcher.Register("delST", h.DelST)
}
