// Open-sourced by BaoLT

// Title handler core: dependency wiring and registration.
package title

import (
	apptitle "mcgame-server/internal/application/title"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	titleService *apptitle.Service
	sceneManager *rtmp.SceneManager
	logger       *zap.Logger
}

func NewHandler(titleService *apptitle.Service, sceneManager *rtmp.SceneManager, logger *zap.Logger) *Handler {
	return &Handler{
		titleService: titleService,
		sceneManager: sceneManager,
		logger:       logger,
	}
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("gtl", h.GetTitleList)
	dispatcher.Register("setTitle", h.SetTitle)
	dispatcher.Register("setActTitle", h.SetActTitle)
}
