// Open-sourced by BaoLT

package magiccrystal

import (
	appmagiccrystal "mcgame-server/internal/application/magiccrystal"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	logger  *zap.Logger
	service *appmagiccrystal.Service
}

func NewHandler(logger *zap.Logger) *Handler {
	return &Handler{logger: logger}
}

func (h *Handler) SetService(service *appmagiccrystal.Service) {
	h.service = service
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("initMagicCrystalData", h.InitMagicCrystalData)
	dispatcher.Register("MagicCrystalActive", h.MagicCrystalActive)
	dispatcher.Register("MagicCrystalUp", h.MagicCrystalUp)
	dispatcher.Register("MagicCrystalAddPower", h.MagicCrystalAddPower)
	dispatcher.Register("MagicCrystalRecovery", h.MagicCrystalRecovery)
}
