// Open-sourced by BaoLT

package guild

import (
	"sync"

	appchar "mcgame-server/internal/application/character"
	appguild "mcgame-server/internal/application/guild"
	appitem "mcgame-server/internal/application/item"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	logger       *zap.Logger
	charService  *appchar.Service
	guildService *appguild.Service
	itemService  *appitem.Service
	rtmpServer   *rtmp.Server
	gameData     *gamedata.Manager
	buildMu      sync.RWMutex
	buildStates  map[int]*constructionState
}

func NewHandler(logger *zap.Logger) *Handler {
	return &Handler{
		logger:      logger,
		buildStates: make(map[int]*constructionState),
	}
}

func (h *Handler) SetCharacterService(charService *appchar.Service) {
	h.charService = charService
}

func (h *Handler) SetGuildService(guildService *appguild.Service) {
	h.guildService = guildService
}

func (h *Handler) SetItemService(itemService *appitem.Service) {
	h.itemService = itemService
}

func (h *Handler) SetRTMPServer(rtmpServer *rtmp.Server) {
	h.rtmpServer = rtmpServer
}

func (h *Handler) SetGameDataManager(gameData *gamedata.Manager) {
	h.gameData = gameData
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("initViewGuildP", h.InitViewGuildP)
	dispatcher.Register("getGuildMemberList", h.GetGuildMemberList)
	dispatcher.Register("initGuildList", h.InitGuildList)
	dispatcher.Register("clickBuild", h.ClickBuild)
	dispatcher.Register("execBuildFunc", h.ExecBuildFunc)
	dispatcher.Register("constructBuild", h.ConstructBuild)
	dispatcher.Register("finishCreate", h.FinishCreate)
	dispatcher.Register("finishUpgrade", h.FinishUpgrade)
	dispatcher.Register("resetConstruction", h.ResetConstruction)
	dispatcher.Register("createGuildBuildings", h.CreateGuildBuildings)
	dispatcher.Register("getInitGuildSlot", h.GetInitGuildSlot)
	dispatcher.Register("addGuild", h.AddGuild)
	dispatcher.Register("addGuildMember", h.AddGuildMember)
	dispatcher.Register("quitGuild", h.QuitGuild)
	dispatcher.Register("confirmGuildApply", h.ConfirmGuildApply)
	dispatcher.Register("refuseGuildMember", h.RefuseGuildMember)
	dispatcher.Register("kickGuildMember", h.KickGuildMember)
	dispatcher.Register("demiseTo", h.DemiseTo)
	dispatcher.Register("updateGuildMember", h.UpdateGuildMember)
	dispatcher.Register("updateGuildRank", h.UpdateGuildRank)
	dispatcher.Register("updateGuildNotice", h.UpdateGuildNotice)
	dispatcher.Register("changeGuildName", h.ChangeGuildName)
	dispatcher.Register("delGuild", h.DelGuild)
	dispatcher.Register("guildLevelUp", h.GuildLevelUp)
	dispatcher.Register("addGuildBankSlotNum", h.AddGuildBankSlotNum)
	dispatcher.Register("addMaxGuildMemberNum", h.AddMaxGuildMemberNum)
	dispatcher.Register("getGuildPrivateSkillData", h.GetGuildPrivateSkillData)
	dispatcher.Register("contribMoney", h.ContribMoney)
	dispatcher.Register("contribMaterial", h.ContribMaterial)
	dispatcher.Register("moveGuildItem", h.MoveGuildItem)
	dispatcher.Register("dropGuildItem", h.DropGuildItem)
	dispatcher.Register("developSkill", h.DevelopSkill)
}
