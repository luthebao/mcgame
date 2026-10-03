// Open-sourced by BaoLT

package chat

import (
	appchar "mcgame-server/internal/application/character"
	appgroup "mcgame-server/internal/application/group"
	appguild "mcgame-server/internal/application/guild"
	appitem "mcgame-server/internal/application/item"
	appskill "mcgame-server/internal/application/skill"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

const (
	ChatChannelLocal   = 0
	ChatChannelGlobal  = 1
	ChatChannelGuild   = 2
	ChatChannelTeam    = 3
	ChatChannelWhisper = 4
	ChatChannelBattle  = 4
	ChatChannelArea    = 5
	ChatChannelTop     = 6
)

const (
	TBL_CHARACTOR   = 2
	ITEM_SPEAKER_ID = 719
)

type Handler struct {
	charService    *appchar.Service
	itemService    *appitem.Service
	skillService   *appskill.Service
	groupService   *appgroup.Service
	guildService   *appguild.Service
	sceneManager   *rtmp.SceneManager
	rtmpServer     *rtmp.Server
	gameData       *gamedata.Manager
	logger         *zap.Logger
	sendCallbackFn func(conn *rtmp.Connection, method string, args ...interface{}) error
}

func NewHandler(charService *appchar.Service, itemService *appitem.Service, sceneManager *rtmp.SceneManager, rtmpServer *rtmp.Server, gameData *gamedata.Manager, logger *zap.Logger) *Handler {
	handler := &Handler{
		charService:  charService,
		itemService:  itemService,
		sceneManager: sceneManager,
		rtmpServer:   rtmpServer,
		gameData:     gameData,
		logger:       logger,
	}
	handler.sendCallbackFn = func(conn *rtmp.Connection, method string, args ...interface{}) error {
		return conn.SendCallback(method, args...)
	}
	return handler
}

func (h *Handler) SetGroupService(groupService *appgroup.Service) {
	h.groupService = groupService
}

func (h *Handler) SetGuildService(guildService *appguild.Service) {
	h.guildService = guildService
}

func (h *Handler) SetSkillService(skillService *appskill.Service) {
	h.skillService = skillService
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("say", h.Say)
	dispatcher.Register("createChatPanel", h.CreateChatPanel)
	dispatcher.Register("getChatPanel", h.GetChatPanel)
	dispatcher.Register("chatGM", h.ChatGM)
	dispatcher.Register("p2pWisper", h.P2pWisper)
	dispatcher.Register("wisper", h.Wisper)
}

func (h *Handler) sendCallback(conn *rtmp.Connection, method string, args ...interface{}) error {
	if h.sendCallbackFn != nil {
		return h.sendCallbackFn(conn, method, args...)
	}
	return conn.SendCallback(method, args...)
}

type chatExpSender struct {
	conn *rtmp.Connection
	h    *Handler
}

func (s *chatExpSender) SendCallback(method string, args ...interface{}) error {
	return s.h.sendCallback(s.conn, method, args...)
}

func (s *chatExpSender) AddExpSkill(amount int64) int64 {
	return s.conn.AddExpSkill(amount)
}
