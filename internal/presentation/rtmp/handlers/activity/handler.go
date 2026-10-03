// Open-sourced by BaoLT

// Activity handler core: struct, constructor, registration, and shared helpers.
package activity

import (
	"strconv"
	"strings"
	"sync"
	"time"

	appactivity "mcgame-server/internal/application/activity"
	appbattle "mcgame-server/internal/application/battle"
	appbuff "mcgame-server/internal/application/buff"
	appcombat "mcgame-server/internal/application/combat"
	appevents "mcgame-server/internal/application/events"
	appexplorermedal "mcgame-server/internal/application/explorermedal"
	appitem "mcgame-server/internal/application/item"
	apppet "mcgame-server/internal/application/pet"
	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type OnlineRewardConfig struct {
	Duration int
	ItemID   int
	Quantity int
	IsBound  bool
}

type PlayerRewardState struct {
	StepIndex     int
	StartTime     time.Time
	IsClaimedDate string
}

var onlineRewardSteps = []OnlineRewardConfig{
	{Duration: 60, ItemID: 1001, Quantity: 5, IsBound: true},
	{Duration: 300, ItemID: 1002, Quantity: 5, IsBound: true},
	{Duration: 900, ItemID: 2001, Quantity: 1, IsBound: true},
	{Duration: 1800, ItemID: 2002, Quantity: 1, IsBound: true},
	{Duration: 3600, ItemID: 2003, Quantity: 1, IsBound: true},
}

type Handler struct {
	itemService      *appitem.Service
	characterRepo    domainchar.Repository
	statFeatureRepo  domainfeature.Repository
	offlineService   *appactivity.OfflineDelegationService
	premiumService   *appactivity.PremiumService
	bossDailyService *appactivity.BossDailyService
	dailyActService  *appactivity.DailyActService
	combatService    *appcombat.Service
	battleService    *appbattle.Service
	buffService      *appbuff.Service
	gameData         *gamedata.Manager
	explorerMedalSvc *appexplorermedal.Service
	ppveService      *apppet.PPVEService
	logger           *zap.Logger
	rewardStates     sync.Map
	sendCombineMu    sync.Mutex
	sendCombineBuy   map[int64]map[string]int
	rtmpServer       *rtmp.Server
	startedActSvc    *appactivity.StartedActivityService
	eventBus         *appevents.Bus
}

func NewHandler(itemService *appitem.Service, logger *zap.Logger) *Handler {
	return &Handler{
		itemService:    itemService,
		logger:         logger,
		rewardStates:   sync.Map{},
		sendCombineBuy: make(map[int64]map[string]int),
	}
}

func (h *Handler) SetRTMPServer(server *rtmp.Server) {
	h.rtmpServer = server
}

func (h *Handler) SetPremiumService(service *appactivity.PremiumService) {
	h.premiumService = service
}

func (h *Handler) SetOfflineDelegationService(service *appactivity.OfflineDelegationService) {
	h.offlineService = service
}

func (h *Handler) SetBossDailyService(service *appactivity.BossDailyService) {
	h.bossDailyService = service
}

func (h *Handler) SetDailyActService(service *appactivity.DailyActService) {
	h.dailyActService = service
}

func (h *Handler) SetCombatService(service *appcombat.Service) {
	h.combatService = service
}

func (h *Handler) SetBattleService(service *appbattle.Service) {
	h.battleService = service
}

func (h *Handler) SetCharacterRepository(repo domainchar.Repository) {
	h.characterRepo = repo
}

func (h *Handler) SetStatFeatureRepository(repo domainfeature.Repository) {
	h.statFeatureRepo = repo
}

func (h *Handler) SetBuffService(service *appbuff.Service) {
	h.buffService = service
}

func (h *Handler) SetGameDataManager(gameData *gamedata.Manager) {
	h.gameData = gameData
}

func (h *Handler) SetExplorerMedalService(svc *appexplorermedal.Service) {
	h.explorerMedalSvc = svc
}

func (h *Handler) SetStartedActivityService(service *appactivity.StartedActivityService) {
	h.startedActSvc = service
}

func (h *Handler) SetEventBus(bus *appevents.Bus) {
	h.eventBus = bus
}

func (h *Handler) SetPPVEService(service *apppet.PPVEService) {
	h.ppveService = service
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("bossDailyGetData", h.BossDailyGetData)
	dispatcher.Register("bossDailyBattle", h.BossDailyBattle)
	dispatcher.Register("bossDailyFinishByCard", h.BossDailyFinishByCard)
	dispatcher.Register("getJXHDList", h.GetJXHDList)
	dispatcher.Register("initPmData", h.InitPmData)
	dispatcher.Register("getSendCombineAct", h.GetSendCombineAct)
	dispatcher.Register("buySendCombine", h.BuySendCombine)
	dispatcher.Register("buyPm", h.BuyPm)
	dispatcher.Register("doPmOperation", h.DoPmOperation)
	dispatcher.Register("getTodayAward", h.GetTodayAward)
	dispatcher.Register("getCurrentFeast", h.GetCurrentFeast)
	dispatcher.Register("getCharDiaryData", h.GetCharDiaryData)
	dispatcher.Register("getDailyActAward", h.GetDailyActAward)
	dispatcher.Register("getDailyPanelAwardState", h.GetDailyPanelAwardState)
	dispatcher.Register("getNineBossRankByClient", h.GetNineBossRankByClient)
	dispatcher.Register("getGuildWarRank", h.GetGuildWarRank)
	dispatcher.Register("getStageConsumeAwardList", h.GetStageConsumeAwardList)
	dispatcher.Register("getConsumeAwardList", h.GetConsumeAwardList)
	dispatcher.Register("getPointAward", h.GetPointAward)
	dispatcher.Register("searchGameGift", h.SearchGameGift)
	dispatcher.Register("getShopAward", h.GetShopAward)
	dispatcher.Register("checkDoubleExpTime", h.CheckDoubleExpTime)
	dispatcher.Register("getTodayOnlineTime", h.GetTodayOnlineTime)
	dispatcher.Register("takeNewGift", h.TakeNewGift)
	dispatcher.Register("takeSPGift", h.TakeSPGift)
	dispatcher.Register("getOfflineExp", h.GetOfflineExp)
	dispatcher.Register("getPetOfflineExp", h.GetPetOfflineExp)
	dispatcher.Register("getXCDSData", h.GetXCDSData)
	dispatcher.Register("XCDSGetRank", h.XCDSGetRank)
	dispatcher.Register("getConsumeNoticeData", h.GetConsumeNoticeData)
	dispatcher.Register("initPPVEPanel", h.InitPPVEPanel)
	dispatcher.Register("getPPVERank", h.GetPPVERank)
	dispatcher.Register("challengeNextFloor", h.ChallengeNextFloor)
	dispatcher.Register("savePPVEConf", h.SavePPVEConf)
	dispatcher.Register("increaseChallengeTimeByGold", h.IncreaseChallengeTimeByGold)
	dispatcher.Register("exchangeKP", h.ExchangeKP)
	dispatcher.Register("exchangeKPByGold", h.ExchangeKPByGold)
	dispatcher.Register("getShowTimeInfo", h.GetShowTimeInfo)
	dispatcher.Register("initEMPanel", h.InitEMPanel)
	dispatcher.Register("levelUpEMedal", h.LevelUpEMedal)
	dispatcher.Register("getMCZDData", h.GetMCZDData)
	dispatcher.Register("getMYTCDataView", h.GetMYTCDataView)
	dispatcher.Register("getHMTXLSData", h.GetHMTXLSData)
	dispatcher.Register("enterPubRoom", h.EnterPubRoom)
	dispatcher.Register("getTXKCData", h.GetTXKCData)
	h.registerLegacyActivityBacklogHandlers(dispatcher)
}

func (h *Handler) characterID(ctx *rtmp.RPCContext, method string) (string, int64, error) {
	charIDStr := ctx.CharacterID
	if charIDStr == "" {
		h.logger.Warn(method+": no character ID in session", zap.Uint32("conn_id", ctx.ConnID))
		return "", 0, pkgerrors.ErrUnauthorized
	}

	characterID, err := strconv.ParseInt(charIDStr, 10, 64)
	if err != nil {
		h.logger.Warn(method+": invalid character ID",
			zap.String("char_id", charIDStr),
			zap.Error(err))
		return charIDStr, 0, pkgerrors.ErrInvalidInput
	}

	return charIDStr, characterID, nil
}

func parseIntArg(arg interface{}) (int, bool) {
	switch value := arg.(type) {
	case float64:
		return int(value), true
	case int:
		return value, true
	case int64:
		return int(value), true
	case string:
		parsed, err := strconv.Atoi(strings.TrimSpace(value))
		if err != nil {
			return 0, false
		}
		return parsed, true
	default:
		return 0, false
	}
}
