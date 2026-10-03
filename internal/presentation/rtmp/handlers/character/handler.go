// Open-sourced by BaoLT

package character

import (
	appchar "mcgame-server/internal/application/character"
	appevents "mcgame-server/internal/application/events"
	appitem "mcgame-server/internal/application/item"
	domainauth "mcgame-server/internal/domain/auth"
	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"

	"go.uber.org/zap"
)

type Handler struct {
	charService *appchar.Service
	itemService *appitem.Service
	accountRepo domainauth.AccountRepository
	eventBus    *appevents.Bus
	logger      *zap.Logger
}

func NewHandler(charService *appchar.Service, logger *zap.Logger) *Handler {
	return &Handler{
		charService: charService,
		logger:      logger,
	}
}

func (h *Handler) SetAccountRepository(accountRepo domainauth.AccountRepository) {
	h.accountRepo = accountRepo
}

func (h *Handler) SetItemService(itemService *appitem.Service) {
	h.itemService = itemService
}

func (h *Handler) SetEventBus(bus *appevents.Bus) {
	h.eventBus = bus
}

func (h *Handler) sendExpCallbacksWithEquipment(ctx *rtmp.RPCContext, char *domainchar.Character, expGained int64, leveledUp bool) {
	if h.itemService != nil {
		h.itemService.ApplyCharacterElementState(ctx.Context, char)
		h.itemService.ApplyCharacterMakerSetState(ctx.Context, char)
		bonuses := h.itemService.AggregateEquipmentStats(ctx.Context, char.ID)
		rtmputils.SendExpAndLevelUpCallbacksWithEquipment(ctx.Connection, char, expGained, leveledUp, &bonuses)
	} else {
		rtmputils.SendExpAndLevelUpCallbacks(ctx.Connection, char, expGained, leveledUp)
	}
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("lvUp", h.LvUp)
	dispatcher.Register("getFinalPraDef", h.GetFinalPraDef)
	dispatcher.Register("finalPraMagDef", h.FinalPraMagDef)
	dispatcher.Register("getCharDetailData", h.GetCharDetailData)
	dispatcher.Register("changeProperty", h.ChangeProperty)
}
