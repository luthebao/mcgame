// Open-sourced by BaoLT

package pk

import (
	appbattle "mcgame-server/internal/application/battle"
	appchar "mcgame-server/internal/application/character"
	appcombat "mcgame-server/internal/application/combat"
	apppk "mcgame-server/internal/application/pk"
	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	service       *apppk.Service
	rtmpServer    *rtmp.Server
	settingsRepo  domainchar.InterfaceSettingsRepository
	combatService *appcombat.Service
	charService   *appchar.Service
	battleService *appbattle.Service
	logger        *zap.Logger
}

func NewHandler(service *apppk.Service, rtmpServer *rtmp.Server, logger *zap.Logger) *Handler {
	return &Handler{
		service:    service,
		rtmpServer: rtmpServer,
		logger:     logger,
	}
}

func (h *Handler) SetInterfaceSettingsRepository(repo domainchar.InterfaceSettingsRepository) {
	h.settingsRepo = repo
}

func (h *Handler) SetCombatService(service *appcombat.Service) {
	h.combatService = service
}

func (h *Handler) SetCharacterService(service *appchar.Service) {
	h.charService = service
}

func (h *Handler) SetBattleService(service *appbattle.Service) {
	h.battleService = service
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("PVPStartClient", h.PVPStartClient)
	dispatcher.Register("pkInvite", h.PKInvite)
	dispatcher.Register("pkInviteResp", h.PKInviteResp)
	dispatcher.Register("pkReady", h.PKReady)
	dispatcher.Register("pkAction", h.PKAction)
	dispatcher.Register("pkSurrender", h.PKSurrender)
	dispatcher.Register("pkLeave", h.PKLeave)
}
