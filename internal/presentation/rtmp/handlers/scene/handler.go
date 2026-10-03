// Open-sourced by BaoLT

// Scene handler core: dependency wiring, registration, and shared callback helpers.
package scene

import (
	"context"

	appchar "mcgame-server/internal/application/character"
	appfarm "mcgame-server/internal/application/farm"
	appgroup "mcgame-server/internal/application/group"
	appitem "mcgame-server/internal/application/item"
	apppet "mcgame-server/internal/application/pet"
	appquest "mcgame-server/internal/application/quest"
	appsb "mcgame-server/internal/application/scheduleboss"
	appscene "mcgame-server/internal/application/scene"
	"mcgame-server/internal/gamedata"
	redisstore "mcgame-server/internal/infrastructure/persistence/redis"
	"mcgame-server/internal/infrastructure/rtmp"
	questhandler "mcgame-server/internal/presentation/rtmp/handlers/quest"

	"go.uber.org/zap"
)

type Handler struct {
	charService         *appchar.Service
	itemService         *appitem.Service
	farmService         *appfarm.Service
	petService          *apppet.Service
	sceneService        *appscene.Service
	questService        *appquest.Service
	groupService        *appgroup.Service
	scheduleBoss        *appsb.Service
	activityHandler     onlineRewardSender
	gameData            *gamedata.Manager
	sceneManager        *rtmp.SceneManager
	rtmpServer          *rtmp.Server
	presenceStore       *redisstore.SocialPresenceStore
	questNotify         *questhandler.QuestNotifyHelper
	logger              *zap.Logger
	sendCallbackFn      func(conn *rtmp.Connection, method string, args ...interface{}) error
	lookupConnFn        func(characterID string) *rtmp.Connection
	groupStateRefresher func(ctx context.Context, groupID int64)
}

type onlineRewardSender interface {
	SendNextOnlineReward(conn *rtmp.Connection, charID int64)
}

func NewHandler(charService *appchar.Service, sceneService *appscene.Service, sceneManager *rtmp.SceneManager, logger *zap.Logger) *Handler {
	h := &Handler{
		charService:  charService,
		sceneService: sceneService,
		sceneManager: sceneManager,
		logger:       logger,
	}
	h.sendCallbackFn = func(conn *rtmp.Connection, method string, args ...interface{}) error {
		return conn.SendCallback(method, args...)
	}
	return h
}

func (h *Handler) SetQuestService(questService *appquest.Service) {
	h.questService = questService
}

func (h *Handler) SetItemService(itemService *appitem.Service) {
	h.itemService = itemService
	if h.sceneService != nil {
		h.sceneService.SetAppearanceProvider(itemService)
	}
}

func (h *Handler) SetFarmService(farmService *appfarm.Service) {
	h.farmService = farmService
}

func (h *Handler) SetPetService(petService *apppet.Service) {
	h.petService = petService
}

func (h *Handler) SetQuestNotifyHelper(qnh *questhandler.QuestNotifyHelper) {
	h.questNotify = qnh
}

func (h *Handler) SetGroupService(groupService *appgroup.Service) {
	h.groupService = groupService
}

func (h *Handler) SetGroupStateRefresher(fn func(ctx context.Context, groupID int64)) {
	h.groupStateRefresher = fn
}

func (h *Handler) SetActivityHandler(activityHandler onlineRewardSender) {
	h.activityHandler = activityHandler
}

func (h *Handler) SetGameDataManager(gameData *gamedata.Manager) {
	h.gameData = gameData
}

func (h *Handler) SetRTMPServer(rtmpServer *rtmp.Server) {
	h.rtmpServer = rtmpServer
	if rtmpServer == nil {
		h.lookupConnFn = nil
		return
	}
	h.lookupConnFn = func(characterID string) *rtmp.Connection {
		return rtmpServer.GetConnectionByCharacterID(characterID)
	}
}

func (h *Handler) SetPresenceStore(store *redisstore.SocialPresenceStore) {
	h.presenceStore = store
}

func (h *Handler) SetScheduleBossService(sb *appsb.Service) {
	h.scheduleBoss = sb
}

func (h *Handler) sendSceneResetCallbacks(conn *rtmp.Connection) error {
	if err := h.sendCallback(conn, "onCreateNpcs", map[string]interface{}{}); err != nil {
		return err
	}
	return h.sendCallback(conn, "onCreateBoss", map[string]interface{}{})
}

func (h *Handler) sendCallback(conn *rtmp.Connection, method string, args ...interface{}) error {
	if h.sendCallbackFn != nil {
		return h.sendCallbackFn(conn, method, args...)
	}
	return conn.SendCallback(method, args...)
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("sceneLogin", h.SceneLogin)
	dispatcher.Register("sceneChange", h.SceneChange)
	dispatcher.Register("udcp", h.UpdatePosition)
	dispatcher.Register("udcr", h.UpdatePositionRun)
	dispatcher.Register("createChars", h.CreateChars)
	dispatcher.Register("createNpcs", h.CreateNpcs)
	dispatcher.Register("createBoss", h.CreateBoss)
	dispatcher.Register("clickBoss", h.ClickBoss)
	dispatcher.Register("canEnterWbMap", h.CanEnterWbMap)
	dispatcher.Register("createSceneItems", h.CreateSceneItems)
	dispatcher.Register("toMovable", h.ToMovable)
	dispatcher.Register("toSafe", h.ToSafe)
	dispatcher.Register("checkNetDelay", h.CheckNetDelay)
	dispatcher.Register("beginFlying", h.BeginFlying)
	dispatcher.Register("stopFlying", h.StopFlying)
	dispatcher.Register("getCharStateClient", h.GetCharStateClient)
	dispatcher.Register("getCharAttributes", h.GetCharAttributes)
	dispatcher.Register("setNpcState", h.SetNpcState)
}
