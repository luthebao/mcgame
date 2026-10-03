// Open-sourced by BaoLT

package quest

import (
	appchar "mcgame-server/internal/application/character"
	appevents "mcgame-server/internal/application/events"
	appitem "mcgame-server/internal/application/item"
	apppet "mcgame-server/internal/application/pet"
	appquest "mcgame-server/internal/application/quest"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	questService    *appquest.Service
	charService     *appchar.Service
	itemService     *appitem.Service
	petService      *apppet.Service
	gameDataManager *gamedata.Manager
	questNotify     *QuestNotifyHelper
	eventBus        *appevents.Bus
	logger          *zap.Logger
}

func NewHandler(questService *appquest.Service, logger *zap.Logger) *Handler {
	return &Handler{questService: questService, logger: logger}
}

func (h *Handler) SetCharacterService(charService *appchar.Service) {
	h.charService = charService
}

func (h *Handler) SetItemService(itemService *appitem.Service) {
	h.itemService = itemService
}

func (h *Handler) SetPetService(petService *apppet.Service) {
	h.petService = petService
}

func (h *Handler) SetGameDataManager(manager *gamedata.Manager) {
	h.gameDataManager = manager
}

func (h *Handler) SetQuestNotifyHelper(qnh *QuestNotifyHelper) {
	h.questNotify = qnh
}

func (h *Handler) SetEventBus(bus *appevents.Bus) {
	h.eventBus = bus
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("initQuestManager", h.InitQuestManager)
	dispatcher.Register("takeQuest", h.TakeQuest)
	dispatcher.Register("takeBuildQuest", h.TakeBuildQuest)
	dispatcher.Register("finishQuest", h.FinishQuest)
	dispatcher.Register("getLoopQuestStartTime", h.GetLoopQuestStartTime)
	dispatcher.Register("canQuest", h.CanQuest)
	dispatcher.Register("initCB", h.InitCB)
	dispatcher.Register("initCBByItem", h.InitCBByItem)
	dispatcher.Register("takeCBQuest", h.TakeCBQuest)
	dispatcher.Register("cancelQuest", h.CancelQuest)
	dispatcher.Register("takeLoop", h.TakeLoop)
	dispatcher.Register("cancelLoop", h.CancelLoop)
	dispatcher.Register("loopRepaire", h.LoopRepaire)
}
