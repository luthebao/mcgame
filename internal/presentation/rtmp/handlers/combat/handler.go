// Open-sourced by BaoLT

// Combat RTMP handlers.
package combat

import (
	appbattle "mcgame-server/internal/application/battle"
	appchar "mcgame-server/internal/application/character"
	appcombat "mcgame-server/internal/application/combat"
	appgroup "mcgame-server/internal/application/group"
	appitem "mcgame-server/internal/application/item"
	apppet "mcgame-server/internal/application/pet"
	appquest "mcgame-server/internal/application/quest"
	appscene "mcgame-server/internal/application/scene"
	appskill "mcgame-server/internal/application/skill"
	appstarinstance "mcgame-server/internal/application/starinstance"
	"mcgame-server/internal/domain/auth"
	combatdomain "mcgame-server/internal/domain/combat"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/infrastructure/rtmp"
	questhandler "mcgame-server/internal/presentation/rtmp/handlers/quest"

	"go.uber.org/zap"
)

type Handler struct {
	combatService       *appcombat.Service
	sceneService        *appscene.Service
	charService         *appchar.Service
	battleService       *appbattle.Service
	groupService        *appgroup.Service
	questService        *appquest.Service
	skillService        *appskill.Service
	itemService         *appitem.Service
	petService          *apppet.Service
	starInstanceService *appstarinstance.Service
	skillAdapter        combatdomain.SkillGetter
	skillOwnership      skillOwnershipChecker
	sceneManager        *rtmp.SceneManager
	rtmpServer          *rtmp.Server
	gameData            *gamedata.Manager
	questNotify         *questhandler.QuestNotifyHelper
	accountRepo         auth.AccountRepository
	battleInfoLookup    func(string) (*combatdomain.Battle, error)
	logger              *zap.Logger
}

func NewHandler(combatService *appcombat.Service, sceneService *appscene.Service, charService *appchar.Service, battleService *appbattle.Service, questService *appquest.Service, sceneManager *rtmp.SceneManager, accountRepo auth.AccountRepository, logger *zap.Logger) *Handler {
	return &Handler{
		combatService: combatService,
		sceneService:  sceneService,
		charService:   charService,
		battleService: battleService,
		questService:  questService,
		sceneManager:  sceneManager,
		accountRepo:   accountRepo,
		logger:        logger,
	}
}

func (h *Handler) SetQuestNotifyHelper(qnh *questhandler.QuestNotifyHelper) {
	h.questNotify = qnh
}

func (h *Handler) SetSkillService(skillService *appskill.Service) {
	h.skillService = skillService
	h.skillOwnership = skillService
}

func (h *Handler) SetGameDataManager(manager *gamedata.Manager) {
	h.gameData = manager
	if manager != nil {
		h.skillAdapter = appcombat.NewGamedataSkillAdapter(manager)
	}
}

func (h *Handler) SetGroupService(groupService *appgroup.Service) {
	h.groupService = groupService
}

func (h *Handler) SetRTMPServer(server *rtmp.Server) {
	h.rtmpServer = server
}

func (h *Handler) SetItemService(itemService *appitem.Service) {
	h.itemService = itemService
}

func (h *Handler) SetPetService(petService *apppet.Service) {
	h.petService = petService
}

func (h *Handler) SetStarInstanceService(svc *appstarinstance.Service) {
	h.starInstanceService = svc
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("hitNpc", h.HitNpc)
	dispatcher.Register("clickBoss", h.HitNpc)
	dispatcher.Register("clickNpc", h.HitNpc)
	dispatcher.Register("cbom", h.CheckBattleOnMove)
	dispatcher.Register("battleFieldGetInfo", h.GetBattleInfo)
	dispatcher.Register("battlePlayEnd", h.EndBattle)
	dispatcher.Register("battleReplayEnd", h.BattleReplayEnd)
	dispatcher.Register("getBattleReplay", h.GetBattleReplay)
	dispatcher.Register("getRecentBattles", h.GetRecentBattles)
	dispatcher.Register("battleUpdateCmd", h.BattleUpdateCmd)
	dispatcher.Register("skillLearnByClient", h.LearnSkill)
	dispatcher.Register("reliveSwitch", h.ReliveSwitch)
	dispatcher.Register("mazeRecover", h.MazeRecover)
	dispatcher.Register("useBloodBag", h.UseBloodBag)
	dispatcher.Register("bbGoldRelive", h.BBGoldRelive)
	dispatcher.Register("bbNormalRelive", h.BBNormalRelive)
	dispatcher.Register("freeRelive", h.FreeRelive)
	dispatcher.Register("reliveUseItem", h.ReliveUseItem)
	dispatcher.Register("quitWatch", h.QuitWatch)
	dispatcher.Register("watchBattle", h.WatchBattle)
}
