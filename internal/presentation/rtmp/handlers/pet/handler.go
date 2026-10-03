// Open-sourced by BaoLT

package pet

import (
	apppet "mcgame-server/internal/application/pet"
	"mcgame-server/internal/domain/auth"
	gamedatamanager "mcgame-server/internal/gamedata"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	petService      *apppet.Service
	accountRepo     auth.AccountRepository
	sceneManager    *rtmp.SceneManager
	gameDataManager *gamedatamanager.Manager
	logger          *zap.Logger
}

func NewHandler(petService *apppet.Service, accountRepo auth.AccountRepository, logger *zap.Logger) *Handler {
	return &Handler{
		petService:  petService,
		accountRepo: accountRepo,
		logger:      logger,
	}
}

func (h *Handler) SetSceneManager(sceneManager *rtmp.SceneManager) {
	h.sceneManager = sceneManager
}

func (h *Handler) SetGameDataManager(gdm *gamedatamanager.Manager) {
	h.gameDataManager = gdm
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("initViewPetMngP", h.InitViewPetMngP)
	dispatcher.Register("getPetDetailData", h.GetPetDetailData)
	dispatcher.Register("startPetFollow", h.StartPetFollow)
	dispatcher.Register("cancelPetFollow", h.CancelPetFollow)
	dispatcher.Register("changePetName", h.ChangePetName)
	dispatcher.Register("changePetProperty", h.ChangePetProperty)
	dispatcher.Register("bindedPetByPlayer", h.BindedPetByPlayer)
	dispatcher.Register("petEat", h.PetEat)
	dispatcher.Register("ensurePetEat", h.EnsurePetEat)
	dispatcher.Register("petStar", h.PetStar)
	dispatcher.Register("contractPet", h.ContractPet)
	dispatcher.Register("changePetState", h.ChangePetState)
	dispatcher.Register("petStarClear", h.PetStarClear)
	dispatcher.Register("toPetFeather", h.ToPetFeather)
	dispatcher.Register("toPetFeatherNextStep", h.ToPetFeatherNextStep)
	dispatcher.Register("toPetEnvolution", h.ToPetEnvolution)
	dispatcher.Register("petJoin", h.PetJoin)
	dispatcher.Register("seniorPetJoin", h.SeniorPetJoin)
	dispatcher.Register("petXd", h.PetXd)
	dispatcher.Register("petPzXsd", h.PetPzXsd)
	dispatcher.Register("petXsd", h.PetXsd)
	dispatcher.Register("petBook", h.PetBook)
	dispatcher.Register("petDelSkill", h.PetDelSkill)
	dispatcher.Register("petOpenSkill", h.PetOpenSkill)
	dispatcher.Register("petEquipOn", h.PetEquipOn)
	dispatcher.Register("petEquipOff", h.PetEquipOff)
	dispatcher.Register("petOpenSlot", h.PetOpenSlot)
	dispatcher.Register("getPetGuardData", h.GetPetGuardData)
	dispatcher.Register("putDownPet", h.PutDownPet)
	dispatcher.Register("movePetToPetGuardSid", h.MovePetToPetGuardSid)
	dispatcher.Register("upGuardSid", h.UpGuardSid)
	dispatcher.Register("finalPraMagDefPet", h.FinalPraMagDefPet)
	dispatcher.Register("getFinalPraDefPet", h.GetFinalPraDefPet)
	dispatcher.Register("delPetByClient", h.DelPetByClient)
	dispatcher.Register("activePet", h.ActivePet)
}
