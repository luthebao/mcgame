// Open-sourced by BaoLT

// Game data RTMP handlers.
package gamedata

import (
	appguild "mcgame-server/internal/application/guild"
	appitem "mcgame-server/internal/application/item"
	gamedatamanager "mcgame-server/internal/gamedata"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	gameData     *gamedatamanager.Manager
	guildService *appguild.Service
	itemService  *appitem.Service
	logger       *zap.Logger
}

func NewHandler(gameData *gamedatamanager.Manager, itemService *appitem.Service, logger *zap.Logger) *Handler {
	return &Handler{
		gameData:    gameData,
		itemService: itemService,
		logger:      logger,
	}
}

func (h *Handler) SetGuildService(guildService *appguild.Service) {
	h.guildService = guildService
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("gdc", h.GetDataConfig)
	dispatcher.Register("getDataPackageClient", h.GetDataPackageClient)
	dispatcher.Register("getItemInst_f", h.GetItemInstF)
}
