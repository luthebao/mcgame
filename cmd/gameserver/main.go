// Open-sourced by BaoLT

// MCGame server entry point with multi-gateway architecture support.
// Supports three modes: monolith (single server), main (registry + auth), line (game).
// Wires all dependencies and handles graceful shutdown with signal handling.
package main

import (
	"context"
	"fmt"
	"os"
	"os/signal"
	"syscall"
	"time"

	"go.uber.org/zap"

	appachievement "mcgame-server/internal/application/achievement"
	appactivity "mcgame-server/internal/application/activity"
	appastrology "mcgame-server/internal/application/astrology"
	appauth "mcgame-server/internal/application/auth"
	appawaken "mcgame-server/internal/application/awaken"
	appbattle "mcgame-server/internal/application/battle"
	appbossloot "mcgame-server/internal/application/bossloot"
	appbuff "mcgame-server/internal/application/buff"
	appcenter "mcgame-server/internal/application/center"
	appchar "mcgame-server/internal/application/character"
	appcombat "mcgame-server/internal/application/combat"
	appdailysignin "mcgame-server/internal/application/dailysignin"
	appdress "mcgame-server/internal/application/dress"
	appevents "mcgame-server/internal/application/events"
	appexplorermedal "mcgame-server/internal/application/explorermedal"
	appfairy "mcgame-server/internal/application/fairy"
	appfarm "mcgame-server/internal/application/farm"
	appgroup "mcgame-server/internal/application/group"
	appguild "mcgame-server/internal/application/guild"
	appheiyaoshi "mcgame-server/internal/application/heiyaoshi"
	appitem "mcgame-server/internal/application/item"
	applotto "mcgame-server/internal/application/lotto"
	appmagiccrystal "mcgame-server/internal/application/magiccrystal"
	appmagicweapon "mcgame-server/internal/application/magicweapon"
	appmarriage "mcgame-server/internal/application/marriage"
	appmedal "mcgame-server/internal/application/medal"
	appmonsterheart "mcgame-server/internal/application/monsterheart"
	appmount "mcgame-server/internal/application/mount"
	appmystre "mcgame-server/internal/application/mysterytreasure"
	apppet "mcgame-server/internal/application/pet"
	apppetarena "mcgame-server/internal/application/petarena"
	apppetstone "mcgame-server/internal/application/petstone"
	apppettalent "mcgame-server/internal/application/pettalent"
	apppk "mcgame-server/internal/application/pk"
	appprabuff "mcgame-server/internal/application/prabuff"
	appprs "mcgame-server/internal/application/prs"
	appquest "mcgame-server/internal/application/quest"
	apprune "mcgame-server/internal/application/rune"
	appscene "mcgame-server/internal/application/scene"
	appsb "mcgame-server/internal/application/scheduleboss"
	appshop "mcgame-server/internal/application/shop"
	appskill "mcgame-server/internal/application/skill"
	appsocial "mcgame-server/internal/application/social"
	appsoul "mcgame-server/internal/application/soul"
	appsoultrain "mcgame-server/internal/application/soultrain"
	appstar "mcgame-server/internal/application/star"
	appstarinstance "mcgame-server/internal/application/starinstance"
	appstatfeature "mcgame-server/internal/application/statfeature"
	appstoneseal "mcgame-server/internal/application/stoneseal"
	apptitle "mcgame-server/internal/application/title"
	apptrade "mcgame-server/internal/application/trade"
	appwarsprite "mcgame-server/internal/application/warsprite"
	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/infrastructure/adminhttp"
	"mcgame-server/internal/infrastructure/cache"
	"mcgame-server/internal/infrastructure/config"
	"mcgame-server/internal/infrastructure/config/store"
	"mcgame-server/internal/infrastructure/logger"
	"mcgame-server/internal/infrastructure/metrics"
	"mcgame-server/internal/infrastructure/persistence/memory"
	"mcgame-server/internal/infrastructure/persistence/postgres"
	redisstore "mcgame-server/internal/infrastructure/persistence/redis"
	infraredis "mcgame-server/internal/infrastructure/redis"
	"mcgame-server/internal/infrastructure/rtmp"
	infrasb "mcgame-server/internal/infrastructure/scheduleboss"
	"mcgame-server/internal/presentation/rtmp/chatfmt"
	achievementhandler "mcgame-server/internal/presentation/rtmp/handlers/achievement"
	activityhandler "mcgame-server/internal/presentation/rtmp/handlers/activity"
	astrologyhandler "mcgame-server/internal/presentation/rtmp/handlers/astrology"
	authhandler "mcgame-server/internal/presentation/rtmp/handlers/auth"
	awakenhandler "mcgame-server/internal/presentation/rtmp/handlers/awaken"
	buffhandler "mcgame-server/internal/presentation/rtmp/handlers/buff"
	characterhandler "mcgame-server/internal/presentation/rtmp/handlers/character"
	chathandler "mcgame-server/internal/presentation/rtmp/handlers/chat"
	combathandler "mcgame-server/internal/presentation/rtmp/handlers/combat"
	dailysigninhandler "mcgame-server/internal/presentation/rtmp/handlers/dailysignin"
	dresshandler "mcgame-server/internal/presentation/rtmp/handlers/dress"
	exchangehandler "mcgame-server/internal/presentation/rtmp/handlers/exchange"
	fairyhandler "mcgame-server/internal/presentation/rtmp/handlers/fairy"
	farmhandler "mcgame-server/internal/presentation/rtmp/handlers/farm"
	gamedatahandler "mcgame-server/internal/presentation/rtmp/handlers/gamedata"
	grouphandler "mcgame-server/internal/presentation/rtmp/handlers/group"
	guildhandler "mcgame-server/internal/presentation/rtmp/handlers/guild"
	heiyaoshihandler "mcgame-server/internal/presentation/rtmp/handlers/heiyaoshi"
	itemhandler "mcgame-server/internal/presentation/rtmp/handlers/item"
	lottohandler "mcgame-server/internal/presentation/rtmp/handlers/lotto"
	magiccrystalhandler "mcgame-server/internal/presentation/rtmp/handlers/magiccrystal"
	magicweaponhandler "mcgame-server/internal/presentation/rtmp/handlers/magicweapon"
	marriagehandler "mcgame-server/internal/presentation/rtmp/handlers/marriage"
	medalhandler "mcgame-server/internal/presentation/rtmp/handlers/medal"
	monsterhearthandler "mcgame-server/internal/presentation/rtmp/handlers/monsterheart"
	mounthandler "mcgame-server/internal/presentation/rtmp/handlers/mount"
	mysteryexchangehandler "mcgame-server/internal/presentation/rtmp/handlers/mysteryexchange"
	mysterytreasurehandler "mcgame-server/internal/presentation/rtmp/handlers/mysterytreasure"
	npchandler "mcgame-server/internal/presentation/rtmp/handlers/npc"
	pethandler "mcgame-server/internal/presentation/rtmp/handlers/pet"
	petarenahandler "mcgame-server/internal/presentation/rtmp/handlers/petarena"
	petstonehandler "mcgame-server/internal/presentation/rtmp/handlers/petstone"
	pettalenthandler "mcgame-server/internal/presentation/rtmp/handlers/pettalent"
	pkhandler "mcgame-server/internal/presentation/rtmp/handlers/pk"
	prabuffhandler "mcgame-server/internal/presentation/rtmp/handlers/prabuff"
	prshandler "mcgame-server/internal/presentation/rtmp/handlers/prs"
	questhandler "mcgame-server/internal/presentation/rtmp/handlers/quest"
	rankinghandler "mcgame-server/internal/presentation/rtmp/handlers/ranking"
	runehandler "mcgame-server/internal/presentation/rtmp/handlers/rune"
	scenehandler "mcgame-server/internal/presentation/rtmp/handlers/scene"
	shophandler "mcgame-server/internal/presentation/rtmp/handlers/shop"
	socialhandler "mcgame-server/internal/presentation/rtmp/handlers/social"
	soulhandler "mcgame-server/internal/presentation/rtmp/handlers/soul"
	soultrainhandler "mcgame-server/internal/presentation/rtmp/handlers/soultrain"
	starhandler "mcgame-server/internal/presentation/rtmp/handlers/star"
	starinstancehandler "mcgame-server/internal/presentation/rtmp/handlers/starinstance"
	stonesealhandler "mcgame-server/internal/presentation/rtmp/handlers/stoneseal"
	stubhandler "mcgame-server/internal/presentation/rtmp/handlers/stub"
	titlehandler "mcgame-server/internal/presentation/rtmp/handlers/title"
	tradehandler "mcgame-server/internal/presentation/rtmp/handlers/trade"
	warspritehandler "mcgame-server/internal/presentation/rtmp/handlers/warsprite"
)

func main() {
	cfg, err := config.Load()
	if err != nil {
		panic("Failed to load config: " + err.Error())
	}

	log, err := logger.New(cfg.Logging)
	if err != nil {
		panic("Failed to create logger: " + err.Error())
	}
	defer log.Sync()

	mode := cfg.Gateway.Mode
	if mode == "" {
		mode = config.ModeMonolith
	}
	switch mode {
	case config.ModeMonolith, config.ModeLine:
	default:
		log.Fatal("Unknown gateway mode", zap.String("mode", string(mode)))
	}

	log.Info("Starting MCGame Server",
		zap.String("environment", cfg.Server.Environment),
		zap.String("name", cfg.Server.Name),
		zap.String("mode", string(mode)),
		zap.Int("line_id", cfg.Gateway.LineID))

	metrics.StartMetricsServer("2112", log)

	runGameServer(cfg, log, mode)
}

func runGameServer(cfg *config.Config, log *zap.Logger, mode config.ServerMode) {
	authDb, err := postgres.NewDatabase(cfg.AuthDatabase, log)
	if err != nil {
		log.Fatal("Failed to connect to auth database", zap.Error(err))
	}
	defer authDb.Close()

	gameDb, err := postgres.NewDatabase(cfg.Database, log)
	if err != nil {
		log.Fatal("Failed to connect to game database", zap.Error(err))
	}
	defer gameDb.Close()

	ctx := context.Background()
	configStore, err := store.New(ctx, gameDb.Pool(), log)
	if err != nil {
		log.Fatal("Failed to load runtime config from database", zap.Error(err))
	}
	defer configStore.Close()

	if mode == config.ModeLine {
		if _, ok := configStore.GatewayLine(cfg.Gateway.LineID); !ok {
			log.Fatal("Line mode requires gateway_config row matching MCGAME_GATEWAY_LINE_ID",
				zap.Int("line_id", cfg.Gateway.LineID))
		}
	}

	redisClient, err := infraredis.NewClient(cfg.Redis, log)
	if err != nil {
		log.Fatal("Failed to connect to redis", zap.Error(err))
	}
	defer redisClient.Close()

	gameDataRepo := postgres.NewGameDataRepository(gameDb)
	gameDataManager := gamedata.NewManager(gameDataRepo, log)
	if err := gameDataManager.LoadAll(ctx); err != nil {
		log.Warn("Failed to load game data (may need to run dataimport first)", zap.Error(err))
	} else {
		stats := gameDataManager.Stats()
		log.Info("Game data loaded", zap.Any("stats", stats))
	}

	if err := appheiyaoshi.InitFromGameData(gameDataManager); err != nil {
		log.Warn("failed to initialize heiyaoshi config", zap.Error(err))
	}

	accountRepo := postgres.NewAccountRepository(authDb)
	sessionRepo := postgres.NewInMemorySessionRepository()

	characterRepoBase := postgres.NewCharacterRepository(gameDb)
	characterInterfaceSettingsRepo := postgres.NewCharacterInterfaceSettingsRepository(gameDb)
	npcRepo := postgres.NewNPCRepository(gameDb)
	sceneItemRepo := postgres.NewSceneItemRepository(gameDb)
	itemRepoBase := postgres.NewItemRepository(gameDb)
	skillRepoBase := postgres.NewSkillRepository(gameDb)
	battleRepo := postgres.NewInMemoryBattleRepository()
	battleLogRepo := postgres.NewBattleLogRepository(gameDb)
	petRepoBase := postgres.NewPetRepository(gameDb)
	petArenaRepo := postgres.NewPetArenaRepository(gameDb)
	questRepoBase := postgres.NewQuestRepository(gameDb)
	questLoopRepo := postgres.NewQuestLoopRepository(gameDb)
	relationshipRepo := postgres.NewRelationshipRepository(gameDb)
	marriageRepo := postgres.NewMarriageRepository(gameDb)
	farmRepo := postgres.NewFarmRepository(gameDb)
	magicEstateRepo := postgres.NewMagicEstateRepository(gameDb)
	marriageStore := redisstore.NewMarriageStore(redisClient)
	presenceStore := redisstore.NewSocialPresenceStore(redisClient)

	playerCache := cache.NewPlayerCache(characterRepoBase, itemRepoBase, skillRepoBase, petRepoBase, questRepoBase, redisClient, log)
	if cfg.Performance.DebugLogPlayerData {
		playerCache.StartDebugLogger()
	}
	characterRepo := cache.NewCachedCharacterRepository(playerCache, characterRepoBase)
	itemRepo := cache.NewCachedItemRepository(playerCache, itemRepoBase)
	skillRepo := cache.NewCachedSkillRepository(playerCache, skillRepoBase)
	petRepo := cache.NewCachedPetRepository(playerCache, petRepoBase)
	questRepo := cache.NewCachedQuestRepository(playerCache, questRepoBase)
	eventBus := appevents.NewBus(log)

	centerService := appcenter.NewService(playerCache, 60*time.Second, log)
	centerService.Start(ctx)
	defer centerService.Stop()

	authService := appauth.NewService(accountRepo, sessionRepo, log)
	charService := appchar.NewService(characterRepo, log)
	charService.SetGameDataManager(gameDataManager)
	premiumService := appactivity.NewPremiumService(characterRepo, accountRepo, log)
	premiumService.SetGameDataManager(gameDataManager)
	offlineDelegationService := appactivity.NewOfflineDelegationService(characterRepo, petRepo, log)
	bossDailyService := appactivity.NewBossDailyService(characterRepo, log)
	startedActivityService := appactivity.NewStartedActivityService(postgres.NewActivityRepository(gameDb))

	// Title system: repository + service
	titleRepo := postgres.NewTitleRepository(gameDb)
	titleService := apptitle.NewService(titleRepo, log)
	titleService.SetGameDataProvider(gameDataManager)
	achievementRepo := postgres.NewAchievementRepository(gameDb)
	achievementService := appachievement.NewService(achievementRepo, log)
	achievementService.SetGameDataManager(gameDataManager)
	achievementService.SetEventBus(eventBus)

	sceneService := appscene.NewService(characterRepo, npcRepo, sceneItemRepo, titleRepo, log)
	sceneService.SetGameDataManager(gameDataManager)
	itemService := appitem.NewService(itemRepo, log)
	itemService.SetCharacterRepository(characterRepo)
	itemService.SetGameDataManager(gameDataManager)
	itemService.SetTitleService(titleService)
	statFeatureRepo := postgres.NewStatFeatureRepository(gameDb)
	statFeatureService := appstatfeature.NewService(statFeatureRepo, log)
	statFeatureService.SetGameDataManager(gameDataManager)
	itemService.SetCharacterBonusProvider(statFeatureService)
	buffRepo := postgres.NewBuffRepository(gameDb)
	buffService := appbuff.NewService(buffRepo, gameDataManager, log)
	itemService.SetBuffService(buffService)
	itemService.AddCharacterBonusProvider(buffService)
	farmService := appfarm.NewService(farmRepo, characterRepo, itemService, log)
	farmService.SetGameDataManager(gameDataManager)
	magicEstateService := appfarm.NewMagicEstateService(magicEstateRepo, characterRepo, relationshipRepo, gameDataManager, log)
	tradeService := apptrade.NewService(characterRepo, itemRepo, petRepo, log)

	combatService := appcombat.NewService(battleRepo, battleLogRepo, skillRepo, characterRepo, npcRepo, petRepo, log)
	combatService.SetGameDataManager(gameDataManager)
	combatService.SetEquipmentStatsProvider(itemService)
	timeoutHandler := appbattle.NewTimeoutHandler(log)
	timeoutHandler.SetSkillGetter(appcombat.NewGamedataSkillAdapter(gameDataManager))
	battleService := appbattle.NewService(battleRepo, timeoutHandler, appbattle.DefaultConfig(), log)
	battleService.SetBattleFinisher(combatService)
	battleService.Start(ctx)
	petService := apppet.NewService(petRepo, log)
	petService.SetCharacterRepository(characterRepo)
	petService.SetItemRepository(itemRepo)
	petService.SetGameDataManager(gameDataManager)
	petService.SetFeatureBonusProvider(statFeatureService)
	itemService.SetPetService(petService)
	petArenaService := apppetarena.NewService(petArenaRepo, petRepo, log)
	petArenaService.SetCharacterRepository(characterRepo)
	questService := appquest.NewService(questRepo, log)
	questService.SetGameDataManager(gameDataManager)
	questService.SetCharacterRepository(characterRepo)
	questService.SetItemService(itemService)
	questService.SetPetService(petService)
	questService.SetLoopRepository(questLoopRepo)
	itemService.SetQuestService(questService)
	combatService.SetItemService(itemService)
	combatService.SetPetService(petService)
	combatService.SetQuestService(questService)
	skillService := appskill.NewService(skillRepo, log)
	skillService.SetCharacterRepository(characterRepo)
	skillService.SetGameDataManager(gameDataManager)
	itemService.SetSkillService(skillService)
	charService.SetSkillLearner(skillService)

	socialService := appsocial.NewService(relationshipRepo, relationshipRepo, log)
	marriageService := appmarriage.NewService(characterRepo, marriageRepo, marriageStore, log)
	pkService := apppk.NewService(apppk.DefaultConfig(), log)

	dispatcher := rtmp.NewRPCDispatcher(log)

	rtmpServer := rtmp.NewServer(cfg.RTMP, log, dispatcher)
	rtmpServer.SetPlayerCache(playerCache)
	rtmpServer.SetChatLinkResolver(chatfmt.NewGameDataLinkResolver(gameDataManager, itemRepo))

	var sbService *appsb.Service
	if configStore.ScheduleBossEnabled() {
		sbConfigRepo := postgres.NewScheduleBossConfigRepository(gameDb)
		sbStateRepo := postgres.NewScheduleBossStateRepository(gameDb)
		sbConfigs, err := sbConfigRepo.List(ctx)
		if err != nil {
			log.Fatal("load schedule boss configs", zap.Error(err))
		}
		sbCache := appsb.NewConfigCache(sbConfigs)
		sbPayloads := infrasb.NewPayloadBuilder(gameDataManager)
		sbService = appsb.New(sbStateRepo, sbCache, rtmpServer.GetSceneManager(), sbPayloads, log)
		gatewayLines := configStore.GatewayLines()
		sbChannelIDs := make([]int, 0, len(gatewayLines))
		for _, line := range gatewayLines {
			sbChannelIDs = append(sbChannelIDs, line.ID)
		}
		if err := appsb.Bootstrap(ctx, sbStateRepo, sbConfigs, sbChannelIDs, time.Now); err != nil {
			log.Fatal("schedule boss bootstrap", zap.Error(err))
		}
		combatService.SetScheduleBossService(sbService)
		sbSched := appsb.NewScheduler(sbService, sbStateRepo, log).WithInterval(configStore.ScheduleBossTick())
		sbSched.Start(ctx)
		defer sbSched.Stop()
	}

	bossLootRepo := postgres.NewBossLootConfigRepository(gameDb)
	bossLootService := appbossloot.NewService(bossLootRepo, bossLootRepo, log)
	if err := bossLootService.Load(ctx); err != nil {
		log.Warn("Failed to load boss loot config", zap.Error(err))
	}
	combatService.SetBossLootService(bossLootService)
	bossDailyService.SetBossLootResolver(bossLootService)

	var groupHandler *grouphandler.Handler
	var mwService *appmagicweapon.Service
	rtmpServer.SetCharacterDisconnectHandler(func(ctx context.Context, conn *rtmp.Connection, charID int64) {
		battleID, _, err := combatService.HandleCharacterDisconnect(ctx, charID)
		if err != nil {
			log.Warn("Failed to clean up combat state on disconnect",
				zap.Int64("character_id", charID),
				zap.Error(err))
			return
		}
		if battleID != "" {
			battleService.ClearBattleDeadlines(battleID)
		}
		if presenceStore != nil {
			if err := presenceStore.Delete(ctx, charID); err != nil {
				log.Warn("Failed to delete social presence on disconnect",
					zap.Int64("character_id", charID),
					zap.Error(err))
			}
		}
		if groupHandler != nil {
			groupHandler.HandleCharacterDisconnect(ctx, charID)
		}
		if mwService != nil {
			mwService.ClearPending(charID)
		}
	})

	dbLineProvider := rtmp.NewDBLineProvider(configStore, rtmpServer)
	rtmpServer.SetLineListProvider(dbLineProvider)
	log.Info("Configured DB-backed line provider",
		zap.Int("line_count", len(configStore.GatewayLines())))

	configStore.SetGatewayLineStatusHandler(func(line store.GatewayLine, oldStatus, newStatus string) {
		if newStatus != "offline" && newStatus != "maintenance" {
			return
		}
		log.Info("Gateway line went offline, kicking sessions",
			zap.Int("line_id", line.ID),
			zap.String("line_name", line.Name),
			zap.String("old_status", oldStatus),
			zap.String("new_status", newStatus))
		rtmpServer.KickChannel(line.ID, "line "+newStatus)
	})

	configStore.SetMaintenanceModeHandler(func(oldEnabled, newEnabled bool) {
		if !newEnabled {
			return
		}
		log.Info("Maintenance mode enabled, kicking all sessions",
			zap.Bool("old_enabled", oldEnabled),
			zap.Bool("new_enabled", newEnabled))
		rtmpServer.KickAll("server entering maintenance")
	})

	authHandler := authhandler.NewHandler(authService, charService, itemService, petService, questService, skillService, accountRepo, log)
	authHandler.SetSceneManager(rtmpServer.GetSceneManager())
	authHandler.SetRTMPServer(rtmpServer)
	authHandler.SetPresenceStore(presenceStore)
	authHandler.SetPlayerCache(&playerCacheLoaderAdapter{cache: playerCache})
	authHandler.SetMagicEstateService(magicEstateService)
	authHandler.SetInterfaceSettingsRepository(characterInterfaceSettingsRepo)
	authHandler.SetStartedActivityListProvider(startedActivityService)
	authHandler.SetLoginStateProvider(statFeatureService)
	authHandler.SetLoginEventEmitter(eventBus)
	authHandler.SetAchievementSnapshotProvider(achievementService)
	authHandler.SetPremiumService(premiumService)
	authHandler.SetBuffService(buffService)
	authHandler.SetLineListProvider(dbLineProvider)
	authHandler.SetConfigStore(configStore)
	authHandler.SetSocialService(socialService)
	authHandler.RegisterHandlers(dispatcher)

	questNotify := questhandler.NewQuestNotifyHelper(questService, gameDataManager, log)

	sceneHandler := scenehandler.NewHandler(charService, sceneService, rtmpServer.GetSceneManager(), log)
	sceneHandler.SetRTMPServer(rtmpServer)
	sceneHandler.SetPresenceStore(presenceStore)
	sceneHandler.SetItemService(itemService)
	sceneHandler.SetPetService(petService)
	sceneHandler.SetQuestService(questService)
	sceneHandler.SetFarmService(farmService)
	sceneHandler.SetGameDataManager(gameDataManager)
	sceneHandler.SetQuestNotifyHelper(questNotify)
	sceneHandler.SetScheduleBossService(sbService)
	sceneHandler.RegisterHandlers(dispatcher)

	itemHandler := itemhandler.NewHandler(itemService, sceneService, charService, rtmpServer.GetSceneManager(), gameDataManager, log)
	itemHandler.SetAccountRepository(accountRepo)
	itemHandler.SetInterfaceSettingsRepository(characterInterfaceSettingsRepo)
	itemHandler.SetPetService(petService)
	itemHandler.SetRTMPServer(rtmpServer)
	itemHandler.SetPresenceStore(presenceStore)
	itemHandler.SetSkillService(skillService)
	itemHandler.SetBuffService(buffService)
	itemHandler.SetQuestService(questService)
	itemHandler.RegisterHandlers(dispatcher)

	mwService = appmagicweapon.NewService(itemService, itemRepo, characterRepo, gameDataManager, log)
	mwSkillGranter := appmagicweapon.NewSkillGranter(skillService, gameDataManager, log)
	mwService.SetSkillGranter(mwSkillGranter)
	mwHandler := magicweaponhandler.NewHandler(mwService, itemService, charService, gameDataManager, log)
	mwHandler.SetSkillService(skillService)
	mwHandler.SetAccountRepository(accountRepo)
	mwHandler.RegisterHandlers(dispatcher)
	itemHandler.SetMWSkillGranter(mwSkillGranter)
	itemHandler.SetMWSkillUpdatePusher(func(ctx context.Context, conn *rtmp.Connection, charID int64) {
		if conn == nil {
			return
		}
		skills, err := skillService.GetSkillsForCallback(ctx, charID)
		if err != nil {
			skills = []map[string]interface{}{}
		}
		_ = conn.SendCallback("onMWeaponSkillUpdate", skills, true)
	})

	farmRPCHandler := farmhandler.NewHandler(farmService, magicEstateService, itemService, charService, log)
	farmRPCHandler.RegisterHandlers(dispatcher)

	pkHandler := pkhandler.NewHandler(pkService, rtmpServer, log)
	pkHandler.SetInterfaceSettingsRepository(characterInterfaceSettingsRepo)
	pkHandler.SetCombatService(combatService)
	pkHandler.SetCharacterService(charService)
	pkHandler.SetBattleService(battleService)
	pkHandler.RegisterHandlers(dispatcher)

	petHandler := pethandler.NewHandler(petService, accountRepo, log)
	petHandler.SetSceneManager(rtmpServer.GetSceneManager())
	petHandler.SetGameDataManager(gameDataManager)
	petHandler.RegisterHandlers(dispatcher)

	buffHandler := buffhandler.NewHandler(buffService, characterRepo, itemService, log)
	buffHandler.RegisterHandlers(dispatcher)

	titleHandler := titlehandler.NewHandler(titleService, rtmpServer.GetSceneManager(), log)
	titleHandler.RegisterHandlers(dispatcher)

	achievementHandler := achievementhandler.NewHandler(achievementService, titleService, gameDataManager, log)
	achievementHandler.SetItemService(itemService)
	achievementHandler.SetCharacterService(charService)
	achievementHandler.RegisterHandlers(dispatcher)

	dressService := appdress.NewService(characterRepo, gameDataManager, log)
	itemService.AddCharacterBonusProvider(dressService)
	dressHandler := dresshandler.NewHandler(dressService, charService, itemService, rtmpServer.GetSceneManager(), log)
	decoHoleService := appdress.NewDecoHoleService(statFeatureRepo, characterRepo, gameDataManager, log)
	dressHandler.SetDecoHoleService(decoHoleService)
	authHandler.SetDecoHoleService(decoHoleService)
	dressHandler.RegisterHandlers(dispatcher)

	groupRepo := memory.NewGroupRepository()
	groupService := appgroup.NewService(groupRepo)
	groupHandler = grouphandler.NewHandler(log, groupService)
	groupHandler.SetCharService(charService)
	groupHandler.SetItemService(itemService)
	groupHandler.SetSceneService(sceneService)
	groupHandler.SetSceneManager(rtmpServer.GetSceneManager())
	groupHandler.SetPetService(petService)
	groupHandler.SetRTMPServer(rtmpServer)
	groupHandler.RegisterHandlers(dispatcher)
	itemHandler.SetGroupService(groupService)
	itemHandler.SetGroupStateRefresher(groupHandler.BroadcastGroupJoinedByID)
	itemHandler.SetGroupPersonalLeaveHandler(groupHandler.LeaveGroupForPersonalTransport)

	combatHandler := combathandler.NewHandler(combatService, sceneService, charService, battleService, questService, rtmpServer.GetSceneManager(), accountRepo, log)
	combatHandler.SetGameDataManager(gameDataManager)
	combatHandler.SetGroupService(groupService)
	combatHandler.SetRTMPServer(rtmpServer)
	combatHandler.SetQuestNotifyHelper(questNotify)
	combatHandler.SetSkillService(skillService)
	combatHandler.SetItemService(itemService)
	combatHandler.SetPetService(petService)
	combatHandler.RegisterHandlers(dispatcher)

	npcHandler := npchandler.NewHandler(sceneService, charService, questService, rtmpServer.GetSceneManager(), accountRepo, log)
	npcHandler.SetGameDataManager(gameDataManager)
	npcHandler.SetCombatService(combatService)
	npcHandler.SetGroupService(groupService)
	npcHandler.SetItemService(itemService)
	npcHandler.SetPetService(petService)
	npcHandler.SetFarmService(farmService)
	npcHandler.SetSkillService(skillService)
	npcHandler.SetRTMPServer(rtmpServer)
	npcHandler.SetPresenceStore(presenceStore)
	npcHandler.SetGroupStateRefresher(groupHandler.BroadcastGroupJoinedByID)
	npcHandler.RegisterHandlers(dispatcher)

	sceneHandler.SetGroupService(groupService)
	sceneHandler.SetGroupStateRefresher(groupHandler.BroadcastGroupJoinedByID)

	// Guild service
	guildRepo := postgres.NewGuildRepository(gameDb)
	guildService := appguild.NewService(guildRepo, charService, log)
	guildService.SetQuestService(questService)
	questService.SetGuildMembership(guildMembershipAdapter{guildService: guildService})
	authHandler.SetGuildService(guildService)
	npcHandler.SetGuildService(guildService)
	guildHandler := guildhandler.NewHandler(log)
	guildHandler.SetCharacterService(charService)
	guildHandler.SetGuildService(guildService)
	guildHandler.SetItemService(itemService)
	guildHandler.SetRTMPServer(rtmpServer)
	guildHandler.SetGameDataManager(gameDataManager)
	guildHandler.RegisterHandlers(dispatcher)

	petArenaHandler := petarenahandler.NewHandler(petArenaService, log)
	petArenaHandler.RegisterHandlers(dispatcher)

	questHandler := questhandler.NewHandler(questService, log)
	questHandler.SetCharacterService(charService)
	questHandler.SetEventBus(eventBus)
	questHandler.SetItemService(itemService)
	questHandler.SetPetService(petService)
	questHandler.SetGameDataManager(gameDataManager)
	questHandler.SetQuestNotifyHelper(questNotify)
	questHandler.RegisterHandlers(dispatcher)

	shopService := appshop.NewService()
	shopService.SetCharacterRepository(characterRepo)
	shopService.SetGameDataManager(gameDataManager)
	shopService.SetItemService(itemService)
	shopService.SetVIPShopRepository(postgres.NewVIPShopRepository(gameDb))
	shopService.SetLogger(log)
	shopHandler := shophandler.NewHandler(log, shopService)
	shopHandler.SetAccountRepository(accountRepo)
	shopHandler.SetQuestService(questService)
	shopHandler.SetQuestNotifyHelper(questNotify)
	shopHandler.RegisterHandlers(dispatcher)

	runeService := apprune.NewService(statFeatureRepo, log)
	runeService.SetDecoRuneSlotWriter(decoHoleService)
	runeService.SetRuneGameData(runeGameDataAdapter{gd: gameDataManager})
	runeService.SetRuneCharProvider(runeCharProviderAdapter{repo: characterRepo})
	runeRPCHandler := runehandler.NewHandler(runeService, log)
	runeRPCHandler.RegisterHandlers(dispatcher)

	stoneSealService := appstoneseal.NewService(statFeatureRepo, characterRepo, itemService, log)
	stoneSealHandler := stonesealhandler.NewHandler(stoneSealService, log)
	stoneSealHandler.RegisterHandlers(dispatcher)

	prsService := appprs.NewService(statFeatureRepo, characterRepo, gameDataManager, log)
	prsService.SetItemConsumer(itemService)
	prsHandler := prshandler.NewHandler(prsService, log)
	prsHandler.RegisterHandlers(dispatcher)

	medalService := appmedal.NewService(statFeatureRepo, gameDataManager, log)
	medalHandler := medalhandler.NewHandler(medalService, log)
	medalHandler.RegisterHandlers(dispatcher)
	itemService.SetMedalGranter(medalService)

	praBuffService := appprabuff.NewService(statFeatureRepo, characterRepo, log)
	praBuffHandler := prabuffhandler.NewHandler(praBuffService, log)
	praBuffHandler.RegisterHandlers(dispatcher)

	awakenService := appawaken.NewService(statFeatureRepo, gameDataManager, log)
	awakenService.SetCharacterRepository(characterRepo)
	awakenService.SetItemPort(itemService)
	awakenService.SetProgressionWriter(awakenProgressionAdapter{repo: characterRepo})
	awakenHandler := awakenhandler.NewHandler(awakenService, log)
	awakenHandler.RegisterHandlers(dispatcher)

	petTalentService := apppettalent.NewService(statFeatureRepo, characterRepo, itemService, gameDataManager, log)
	petTalentHandler := pettalenthandler.NewHandler(petTalentService, log)
	petTalentHandler.RegisterHandlers(dispatcher)

	petStoneService := apppetstone.NewService(statFeatureRepo, characterRepo, itemService, gameDataManager, log)
	petStoneHandler := petstonehandler.NewHandler(petStoneService, log)
	petStoneHandler.RegisterHandlers(dispatcher)

	fairyService := appfairy.NewService(statFeatureRepo, characterRepo, itemService, gameDataManager, log)
	fairyService.SetSkillData(gameDataManager)
	fairyHandler := fairyhandler.NewHandler(fairyService, log)
	fairyHandler.RegisterHandlers(dispatcher)
	npcHandler.SetFairyService(fairyService)

	mysteryTreasureService := appmystre.NewService(statFeatureRepo, log)
	mysteryTreasureService.SetChipBagProvider(runeService)
	mysteryTreasureService.SetGameData(gameDataManager)
	mysteryTreasureService.SetItemBag(itemService)
	authHandler.SetMysteryTreasureService(mysteryTreasureService)
	mysteryTreasureHandler := mysterytreasurehandler.NewHandler(mysteryTreasureService, runeService, log)
	mysteryTreasureHandler.SetCharacterService(charService)
	mysteryTreasureHandler.RegisterHandlers(dispatcher)

	mysteryExchangeHandler := mysteryexchangehandler.NewHandler(accountRepo, mysteryTreasureService, log)
	mysteryExchangeHandler.SetCharacterService(charService)
	mysteryExchangeHandler.SetInventoryService(itemService)
	mysteryExchangeHandler.RegisterHandlers(dispatcher)

	magicCrystalService := appmagiccrystal.NewService(statFeatureRepo, charService, log)
	magicCrystalHandler := magiccrystalhandler.NewHandler(log)
	magicCrystalHandler.SetService(magicCrystalService)
	magicCrystalHandler.RegisterHandlers(dispatcher)

	heiyaoshiService := appheiyaoshi.NewService(statFeatureRepo, charService, log)
	heiyaoshiHandler := heiyaoshihandler.NewHandler(heiyaoshiService, log)
	heiyaoshiHandler.SetItemService(itemService)
	heiyaoshiHandler.SetCharacterService(charService)
	heiyaoshiHandler.RegisterHandlers(dispatcher)

	soulProgressionAdapter := appsoultrain.NewProgressionAdapter(statFeatureRepo)
	soulTrainService := appsoultrain.NewService(charService, soulProgressionAdapter, gameDataManager)
	soulTrainHandler := soultrainhandler.NewHandler(log)
	soulTrainHandler.SetService(soulTrainService)
	soulTrainHandler.SetCharacterService(charService)
	soulTrainHandler.SetItemService(itemService)
	soulTrainHandler.RegisterHandlers(dispatcher)

	warSpriteService := appwarsprite.NewService(statFeatureRepo, charService, gameDataManager, log)
	warSpriteHandler := warspritehandler.NewHandler(warSpriteService, log)
	warSpriteHandler.SetItemService(itemService)
	warSpriteHandler.RegisterHandlers(dispatcher)

	monsterHeartService := appmonsterheart.NewService(statFeatureRepo, log)
	monsterHeartHandler := monsterhearthandler.NewHandler(monsterHeartService, log)
	monsterHeartHandler.SetItemService(itemService)
	monsterHeartHandler.SetCharacterService(charService)
	monsterHeartHandler.RegisterHandlers(dispatcher)
	charService.SetWarSpriteInitializer(warSpriteService)

	starService := appstar.NewService(statFeatureRepo, characterRepo, gameDataManager, log)
	starService.SetItemService(itemService)
	starHandler := starhandler.NewHandler(starService, log)
	starHandler.SetItemService(itemService)
	starHandler.RegisterHandlers(dispatcher)
	authHandler.SetStarService(starService)
	authHandler.SetMagicCrystalService(magicCrystalService)
	authHandler.SetStatFeatureService(statFeatureService)
	authHandler.SetTitleService(titleService)

	astrologyService := appastrology.NewService(statFeatureRepo, characterRepo, log)
	astrologyHandler := astrologyhandler.NewHandler(astrologyService, log)
	astrologyHandler.RegisterHandlers(dispatcher)

	starInstanceService := appstarinstance.NewService(characterRepo, statFeatureRepo, starService, log)
	authHandler.SetStarInstanceService(starInstanceService)
	starInstanceHandler := starinstancehandler.NewHandler(starInstanceService, starService, characterRepo, log)
	starInstanceHandler.SetGroupService(groupService)
	starInstanceHandler.RegisterHandlers(dispatcher)
	combatHandler.SetStarInstanceService(starInstanceService)

	mountService := appmount.NewService(statFeatureRepo, characterRepo, gameDataManager, log)
	mountService.SetItemService(itemService)
	authHandler.SetMountService(mountService)
	mountHandler := mounthandler.NewHandler(mountService, log)
	mountHandler.RegisterHandlers(dispatcher)
	mountHandler.SetSceneBroadcaster(rtmpServer.GetSceneManager())
	mountHandler.RegisterRiding(dispatcher, petHandler.BeginMounting, nil)

	lottoService := applotto.NewService(statFeatureRepo, log)
	lottoService.SetItemService(itemService)
	lottoService.SetGameData(gameDataManager)
	lottoService.SetCharRepository(characterRepo)
	authHandler.SetLottoService(lottoService)
	lottoHandler := lottohandler.NewHandler(lottoService, log)
	lottoHandler.RegisterHandlers(dispatcher)

	soulService := appsoul.NewService(statFeatureRepo, characterRepo, gameDataManager, log)
	authHandler.SetSoulService(soulService)
	petService.SetSoulProvider(soulService)
	soulHandler := soulhandler.NewHandler(soulService, log)
	soulHandler.RegisterHandlers(dispatcher)

	tradeHandler := tradehandler.NewHandler(tradeService, charService, rtmpServer, log)
	tradeHandler.SetAccountRepository(accountRepo)
	tradeHandler.RegisterHandlers(dispatcher)

	socialHandler := socialhandler.NewHandler(socialService, log)
	socialHandler.SetRTMPServer(rtmpServer)
	socialHandler.RegisterHandlers(dispatcher)

	marriageHandler := marriagehandler.NewHandler(marriageService, log)
	marriageHandler.RegisterHandlers(dispatcher)

	chatHandler := chathandler.NewHandler(charService, itemService, rtmpServer.GetSceneManager(), rtmpServer, gameDataManager, log)
	chatHandler.SetGroupService(groupService)
	chatHandler.SetGuildService(guildService)
	chatHandler.SetSkillService(skillService)
	chatHandler.RegisterHandlers(dispatcher)

	explorerMedalService := appexplorermedal.NewService(statFeatureRepo, gameDataManager)

	ppveService := apppet.NewPPVEService(statFeatureRepo, characterRepo, log)
	ppveService.SetGameData(gameDataManager)
	ppveService.SetRankProvider(statFeatureRepo)

	activityHandler := NewActivityHandler(itemService, log)
	activityHandler.SetPremiumService(premiumService)
	activityHandler.SetOfflineDelegationService(offlineDelegationService)
	activityHandler.SetBossDailyService(bossDailyService)
	activityHandler.SetCombatService(combatService)
	activityHandler.SetBattleService(battleService)
	activityHandler.SetCharacterRepository(characterRepo)
	activityHandler.SetStatFeatureRepository(statFeatureRepo)
	activityHandler.SetBuffService(buffService)
	activityHandler.SetGameDataManager(gameDataManager)
	activityHandler.SetExplorerMedalService(explorerMedalService)
	activityHandler.SetRTMPServer(rtmpServer)
	activityHandler.SetStartedActivityService(startedActivityService)
	activityHandler.SetEventBus(eventBus)
	activityHandler.SetPPVEService(ppveService)
	activityHandler.RegisterHandlers(dispatcher)
	sceneHandler.SetActivityHandler(activityHandler)

	dailySigninRepo := postgres.NewDailySigninRepository(gameDb)
	dailySigninRewardRepo := postgres.NewDailySigninRewardRepository(gameDb)
	dailySigninLuckyTierRepo := postgres.NewDailySigninLuckyTierRepository(gameDb)
	dailySigninService := appdailysignin.NewService(dailySigninRepo, dailySigninRewardRepo, dailySigninLuckyTierRepo, characterRepo, itemService, log)
	dailySigninHandler := dailysigninhandler.NewHandler(dailySigninService, log)
	dailySigninHandler.SetCharacterRepository(characterRepo)
	dailySigninHandler.RegisterHandlers(dispatcher)

	dailyActRepo := postgres.NewDailyActRepository(gameDb)
	dailyActAwardRepo := postgres.NewDailyActAwardRepository(gameDb)
	dailyActService := appactivity.NewDailyActService(
		dailyActRepo,
		dailyActAwardRepo,
		itemService,
		gameDataManager,
		log,
	)
	dailyActService.SetBroadcaster(rtmpServer)
	activityHandler.SetDailyActService(dailyActService)
	eventBus.Register(dailyActService)
	eventBus.Register(appactivity.NewLevelUpActivityPusher(startedActivityService, rtmpServer, log))

	gamedataHandler := gamedatahandler.NewHandler(gameDataManager, itemService, log)
	gamedataHandler.SetGuildService(guildService)
	gamedataHandler.RegisterHandlers(dispatcher)

	charHandler := characterhandler.NewHandler(charService, log)
	charHandler.SetAccountRepository(accountRepo)
	charHandler.SetItemService(itemService)
	charHandler.SetEventBus(eventBus)
	charHandler.RegisterHandlers(dispatcher)

	exchangeHandler := exchangehandler.NewHandler(accountRepo, log)
	exchangeHandler.RegisterHandlers(dispatcher)

	stubHandler := stubhandler.NewHandler(log)
	stubHandler.RegisterHandlers(dispatcher)

	rankingHandler := rankinghandler.NewHandler(log)
	rankingHandler.RegisterHandlers(dispatcher)

	socialService.SetOnlineChecker(rtmpServer)
	marriageService.SetOnlineChecker(rtmpServer)

	serverErr := make(chan error, 1)
	go func() {
		if err := rtmpServer.Start(); err != nil {
			serverErr <- err
		}
	}()

	adminServer := adminhttp.NewServer(cfg.AdminHTTP, cfg.Server.Environment, log, rtmpServer, playerCache, characterRepo, characterRepo, playerCache, sceneHandler, itemRepo, itemRepo, itemService, petRepo, playerCache, statFeatureRepo, relationshipRepo, startedActivityService)
	adminErr := make(chan error, 1)
	go func() {
		if err := adminServer.Start(); err != nil {
			adminErr <- err
		}
	}()

	log.Info("Monolith server started",
		zap.String("rtmp_address", cfg.RTMP.Address()),
		zap.String("admin_http_address", cfg.AdminHTTP.Address()))

	quit := make(chan os.Signal, 1)
	signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)

	select {
	case <-quit:
		log.Info("Received shutdown signal")
	case err := <-serverErr:
		log.Error("Server error", zap.Error(err))
	case err := <-adminErr:
		log.Error("Admin HTTP server error", zap.Error(err))
	}

	log.Info("Shutting down server...")

	ctx, cancel := context.WithTimeout(context.Background(), 30*time.Second)
	defer cancel()

	if err := rtmpServer.Stop(); err != nil {
		log.Error("Error stopping RTMP server", zap.Error(err))
	}

	adminServer.Stop()

	if err := authDb.HealthCheck(ctx); err != nil {
		log.Warn("Auth database health check failed on shutdown", zap.Error(err))
	}
	if err := gameDb.HealthCheck(ctx); err != nil {
		log.Warn("Game database health check failed on shutdown", zap.Error(err))
	}

	log.Info("Server stopped")
}

type awakenProgressionAdapter struct {
	repo domainchar.Repository
}

func (a awakenProgressionAdapter) UpsertCharacterAwakenProgression(ctx context.Context, charID int64, awakenLevel, awakenPoints, awakenPointsUsed int) error {
	c, err := a.repo.FindByID(ctx, charID)
	if err != nil {
		return err
	}
	if c == nil {
		return fmt.Errorf("awaken progression: character %d not found", charID)
	}
	c.AwakenLevel = awakenLevel
	c.AwakenPoints = awakenPoints
	c.AwakenPointsUsed = awakenPointsUsed
	return a.repo.Update(ctx, c)
}

type guildMembershipAdapter struct {
	guildService *appguild.Service
}

func (a guildMembershipAdapter) IsInGuild(ctx context.Context, characterID int64) (bool, error) {
	g, err := a.guildService.GetGuildByMember(ctx, characterID)
	if err != nil {
		return false, err
	}
	return g != nil, nil
}

type runeGameDataAdapter struct {
	gd *gamedata.Manager
}

func (a runeGameDataAdapter) GetDecoRune(id int) *apprune.RuneTemplate {
	m := a.gd.GetDecoRune(id)
	if m == nil {
		return nil
	}
	return &apprune.RuneTemplate{
		ID:       int(m.ID),
		Kind:     int(m.Kind),
		NextID:   int(m.NextID),
		Exp:      int(m.Exp),
		UpExp:    int(m.UpExp),
		PropType: int(m.PropType),
		PropNum:  int(m.PropNum),
	}
}

func (a runeGameDataAdapter) GetRuneChipInfo(chipID int) *apprune.RuneChipInfo {
	m := a.gd.GetRuneChip(chipID)
	if m == nil {
		return nil
	}
	return &apprune.RuneChipInfo{
		ChipID: int(m.ID),
		RuneID: int(m.Rid),
		Num:    int(m.Num),
	}
}

type runeCharProviderAdapter struct {
	repo domainchar.Repository
}

func (a runeCharProviderAdapter) GetRuneExp(ctx context.Context, charID int64) (int, error) {
	c, err := a.repo.FindByID(ctx, charID)
	if err != nil {
		return 0, err
	}
	if c == nil {
		return 0, fmt.Errorf("rune exp: character %d not found", charID)
	}
	return c.RuneExp, nil
}

func (a runeCharProviderAdapter) AddRuneExp(ctx context.Context, charID int64, amount int) error {
	c, err := a.repo.FindByID(ctx, charID)
	if err != nil {
		return err
	}
	if c == nil {
		return fmt.Errorf("rune exp: character %d not found", charID)
	}
	if err := c.AddCurrency(domainchar.CurrencyRuneExp, amount); err != nil {
		return err
	}
	return a.repo.Update(ctx, c)
}

func (a runeCharProviderAdapter) DeductRuneExp(ctx context.Context, charID int64, amount int) error {
	c, err := a.repo.FindByID(ctx, charID)
	if err != nil {
		return err
	}
	if c == nil {
		return fmt.Errorf("rune exp: character %d not found", charID)
	}
	if err := c.DeductCurrency(domainchar.CurrencyRuneExp, amount); err != nil {
		return err
	}
	return a.repo.Update(ctx, c)
}

type playerCacheLoaderAdapter struct {
	cache *cache.PlayerCache
}

func NewActivityHandler(itemService *appitem.Service, logger *zap.Logger) *activityhandler.Handler {
	return activityhandler.NewHandler(itemService, logger)
}

func (a *playerCacheLoaderAdapter) LoadPlayer(ctx context.Context, charID int64) error {
	_, err := a.cache.LoadPlayer(ctx, charID)
	return err
}

func (a *playerCacheLoaderAdapter) LoadHotState(ctx context.Context, charID int64) (*cache.HotStateBuffer, error) {
	return a.cache.LoadHotState(ctx, charID)
}

func (a *playerCacheLoaderAdapter) SaveAndEvictHotState(ctx context.Context, charID int64) error {
	return a.cache.SaveAndEvictHotState(ctx, charID)
}
