// Open-sourced by BaoLT

package petarena

import (
	apppetarena "mcgame-server/internal/application/petarena"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	arenaService *apppetarena.Service
	logger       *zap.Logger
}

func NewHandler(arenaService *apppetarena.Service, logger *zap.Logger) *Handler {
	return &Handler{arenaService: arenaService, logger: logger}
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("getPetArenaData", h.GetPetArenaData)
	dispatcher.Register("getPetArenaActivityInfo", h.GetPetArenaActivityInfo)
	dispatcher.Register("getPetArenaDataActivity", h.GetPetArenaDataActivity)
	dispatcher.Register("getPetArenaRank", h.GetPetArenaRank)
	dispatcher.Register("getPetRankAward", h.GetPetRankAward)
	dispatcher.Register("getPetArenaSysMsg", h.GetPetArenaSysMsg)
	dispatcher.Register("getPetArenaConf", h.GetPetArenaConf)
	dispatcher.Register("getPetConf", h.GetPetConf)
	dispatcher.Register("petFightConf", h.PetFightConf)
	dispatcher.Register("petArenaFight", h.PetArenaFight)
	dispatcher.Register("petArenaFightActivity", h.PetArenaFightActivity)
	dispatcher.Register("petArenaTicket", h.PetArenaTicket)
	dispatcher.Register("petFightResult", h.PetFightResult)
	dispatcher.Register("addPetFightNum", h.AddPetFightNum)
	dispatcher.Register("clearArenaCD", h.ClearArenaCD)
	dispatcher.Register("replayPetFight", h.ReplayPetFight)
	dispatcher.Register("replayPetPVEFight", h.ReplayPetPVEFight)
	dispatcher.Register("getLastPetArenaRank", h.GetLastPetArenaRank)
}
