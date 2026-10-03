// Open-sourced by BaoLT

// Achievement handlers expose Flash-compatible reward claim RPCs.
package achievement

import (
	appachievement "mcgame-server/internal/application/achievement"
	appchar "mcgame-server/internal/application/character"
	appitem "mcgame-server/internal/application/item"
	apptitle "mcgame-server/internal/application/title"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	achievementService *appachievement.Service
	titleService       *apptitle.Service
	itemService        *appitem.Service
	charService        *appchar.Service
	gameDataManager    *gamedata.Manager
	logger             *zap.Logger
}

func NewHandler(achievementService *appachievement.Service, titleService *apptitle.Service, gameDataManager *gamedata.Manager, logger *zap.Logger) *Handler {
	return &Handler{
		achievementService: achievementService,
		titleService:       titleService,
		gameDataManager:    gameDataManager,
		logger:             logger,
	}
}

func (h *Handler) SetItemService(svc *appitem.Service) {
	h.itemService = svc
}

func (h *Handler) SetCharacterService(svc *appchar.Service) {
	h.charService = svc
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("getAchieveAward", h.GetAchieveAward)
}
