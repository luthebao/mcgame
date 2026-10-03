// Open-sourced by BaoLT

package auth

import (
	"context"

	appactivity "mcgame-server/internal/application/activity"
	appauth "mcgame-server/internal/application/auth"
	appbuff "mcgame-server/internal/application/buff"
	appchar "mcgame-server/internal/application/character"
	appdress "mcgame-server/internal/application/dress"
	appfarm "mcgame-server/internal/application/farm"
	appguild "mcgame-server/internal/application/guild"
	appitem "mcgame-server/internal/application/item"
	applotto "mcgame-server/internal/application/lotto"
	appmagiccrystal "mcgame-server/internal/application/magiccrystal"
	appmount "mcgame-server/internal/application/mount"
	appmystre "mcgame-server/internal/application/mysterytreasure"
	apppet "mcgame-server/internal/application/pet"
	appquest "mcgame-server/internal/application/quest"
	appskill "mcgame-server/internal/application/skill"
	appsoul "mcgame-server/internal/application/soul"
	appstar "mcgame-server/internal/application/star"
	appstarinstance "mcgame-server/internal/application/starinstance"
	appstatfeature "mcgame-server/internal/application/statfeature"
	domainachievement "mcgame-server/internal/domain/achievement"
	domainauth "mcgame-server/internal/domain/auth"
	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/cache"
	"mcgame-server/internal/infrastructure/config/store"
	redisstore "mcgame-server/internal/infrastructure/persistence/redis"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type LineListProvider interface {
	GetLineList(ctx context.Context) ([]map[string]interface{}, error)
}

type PlayerCacheLoader interface {
	LoadPlayer(ctx context.Context, charID int64) error
	LoadHotState(ctx context.Context, charID int64) (*cache.HotStateBuffer, error)
	SaveAndEvictHotState(ctx context.Context, charID int64) error
}

type StartedActivityListProvider interface {
	BuildStartedActList(ctx context.Context) ([]interface{}, error)
}

type LoginStateProvider interface {
	BuildCharacterLoginState(ctx context.Context, charID int64) (map[string]interface{}, error)
}

type LoginEventEmitter interface {
	EmitLogin(ctx context.Context, charID int64)
}

type AchievementSnapshotProvider interface {
	LoadSnapshot(ctx context.Context, charID int64) (domainachievement.Snapshot, error)
}

type BlacklistProvider interface {
	GetBlacklistForLogin(ctx context.Context, characterID int64) ([]interface{}, error)
}

type TitleDataProvider interface {
	GetActiveTitle(ctx context.Context, characterID int64) (int, error)
	GetActiveSpecialTitle(ctx context.Context, characterID int64) (int, error)
	GetTitleList(ctx context.Context, characterID int64) (map[string]any, error)
}

type Handler struct {
	authService         *appauth.Service
	charService         *appchar.Service
	itemService         *appitem.Service
	magicEstateService  *appfarm.MagicEstateService
	petService          *apppet.Service
	questService        *appquest.Service
	skillService        *appskill.Service
	guildService        *appguild.Service
	starService         *appstar.Service
	starInstanceService *appstarinstance.Service
	mountService        *appmount.Service
	lottoService        *applotto.Service
	soulService         *appsoul.Service
	mysteryService      *appmystre.Service
	decoHoleService     *appdress.DecoHoleService
	magicCrystalService *appmagiccrystal.Service
	statFeatureService  *appstatfeature.Service
	titleService        TitleDataProvider
	settingsRepo        domainchar.InterfaceSettingsRepository
	sceneManager        *rtmp.SceneManager
	rtmpServer          *rtmp.Server
	presenceStore       *redisstore.SocialPresenceStore
	lineListProvider    LineListProvider
	playerCache         PlayerCacheLoader
	activityList        StartedActivityListProvider
	loginState          LoginStateProvider
	loginEvents         LoginEventEmitter
	achievementState    AchievementSnapshotProvider
	premiumService      *appactivity.PremiumService
	buffService         *appbuff.Service
	configStore         *store.Store
	accountRepo         domainauth.AccountRepository
	socialService       BlacklistProvider
	logger              *zap.Logger
}

func NewHandler(
	authService *appauth.Service,
	charService *appchar.Service,
	itemService *appitem.Service,
	petService *apppet.Service,
	questService *appquest.Service,
	skillService *appskill.Service,
	accountRepo domainauth.AccountRepository,
	logger *zap.Logger,
) *Handler {
	return &Handler{
		authService:  authService,
		charService:  charService,
		itemService:  itemService,
		petService:   petService,
		questService: questService,
		skillService: skillService,
		accountRepo:  accountRepo,
		logger:       logger,
	}
}

func (h *Handler) SetLineListProvider(provider LineListProvider) {
	h.lineListProvider = provider
}

func (h *Handler) SetSceneManager(sm *rtmp.SceneManager) {
	h.sceneManager = sm
}

func (h *Handler) SetRTMPServer(server *rtmp.Server) {
	h.rtmpServer = server
}

func (h *Handler) SetPresenceStore(store *redisstore.SocialPresenceStore) {
	h.presenceStore = store
}

func (h *Handler) SetMagicEstateService(service *appfarm.MagicEstateService) {
	h.magicEstateService = service
}

func (h *Handler) SetGuildService(service *appguild.Service) {
	h.guildService = service
}

func (h *Handler) SetPlayerCache(cache PlayerCacheLoader) {
	h.playerCache = cache
}

func (h *Handler) SetInterfaceSettingsRepository(repo domainchar.InterfaceSettingsRepository) {
	h.settingsRepo = repo
}

func (h *Handler) SetStartedActivityListProvider(provider StartedActivityListProvider) {
	h.activityList = provider
}

func (h *Handler) SetLoginStateProvider(provider LoginStateProvider) {
	h.loginState = provider
}

func (h *Handler) SetLoginEventEmitter(emitter LoginEventEmitter) {
	h.loginEvents = emitter
}

func (h *Handler) SetAchievementSnapshotProvider(provider AchievementSnapshotProvider) {
	h.achievementState = provider
}

func (h *Handler) SetPremiumService(service *appactivity.PremiumService) {
	h.premiumService = service
}

func (h *Handler) SetBuffService(service *appbuff.Service) {
	h.buffService = service
}

func (h *Handler) SetStarService(service *appstar.Service) {
	h.starService = service
}

func (h *Handler) SetStarInstanceService(service *appstarinstance.Service) {
	h.starInstanceService = service
}

func (h *Handler) SetMountService(service *appmount.Service) {
	h.mountService = service
}

func (h *Handler) SetLottoService(service *applotto.Service) {
	h.lottoService = service
}

func (h *Handler) SetSoulService(service *appsoul.Service) {
	h.soulService = service
}

func (h *Handler) SetMysteryTreasureService(service *appmystre.Service) {
	h.mysteryService = service
}

func (h *Handler) SetDecoHoleService(service *appdress.DecoHoleService) {
	h.decoHoleService = service
}

func (h *Handler) SetMagicCrystalService(service *appmagiccrystal.Service) {
	h.magicCrystalService = service
}

func (h *Handler) SetStatFeatureService(service *appstatfeature.Service) {
	h.statFeatureService = service
}

func (h *Handler) SetTitleService(provider TitleDataProvider) {
	h.titleService = provider
}

func (h *Handler) SetConfigStore(s *store.Store) {
	h.configStore = s
}

func (h *Handler) SetSocialService(provider BlacklistProvider) {
	h.socialService = provider
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("onConnectAuth", h.OnConnectAuth)
	dispatcher.Register("sendCharList", h.SendCharList)
	dispatcher.Register("chooseCharactor", h.ChooseCharacter)
	dispatcher.Register("getLineInfo", h.GetLineInfo)
	dispatcher.Register("showChaInfo", h.ShowCharacterInfo)
	dispatcher.Register("newChar", h.NewChar)
	dispatcher.Register("backToCharSelect", h.BackToCharSelect)
	dispatcher.Register("icl", h.SendCharList)
	dispatcher.Register("us", h.UpdateSettings)
	dispatcher.Register("uif", h.UpdateInterfaceSetting)
	dispatcher.Register("skillSetUserBar", h.SkillSetUserBar)
	dispatcher.Register("skillSetBattle", h.SkillSetBattle)
	dispatcher.Register("getTodayOnlineTime", h.GetTodayOnlineTime)
	dispatcher.Register("setBp", h.SetBp)
	dispatcher.Register("changeLine", h.ChangeLine)
	dispatcher.Register("saveGuideLog", h.SaveGuideLog)
	dispatcher.Register("setDeletePass", h.SetDeletePass)
}
