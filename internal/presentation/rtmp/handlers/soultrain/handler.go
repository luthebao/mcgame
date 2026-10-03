// Open-sourced by BaoLT

// Soul training RPC handler wires the trainSoul inbound call to the soultrain
// application service and emits the required client callbacks.
package soultrain

import (
	"context"
	"strconv"

	appsoultrain "mcgame-server/internal/application/soultrain"
	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"

	"go.uber.org/zap"
)

type characterLoader interface {
	GetByID(ctx context.Context, characterID int64) (*domainchar.Character, error)
}

type Handler struct {
	logger      *zap.Logger
	service     *appsoultrain.Service
	itemService rtmputils.StatRefreshService
	chars       characterLoader
}

func NewHandler(logger *zap.Logger) *Handler {
	return &Handler{logger: logger}
}

func (h *Handler) SetService(svc *appsoultrain.Service) {
	h.service = svc
}

func (h *Handler) SetItemService(svc rtmputils.StatRefreshService) {
	h.itemService = svc
}

func (h *Handler) SetCharacterService(loader characterLoader) {
	h.chars = loader
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("trainSoul", h.TrainSoul)
}

func (h *Handler) charIDFromCtx(ctx *rtmp.RPCContext) (int64, bool) {
	if ctx == nil || ctx.CharacterID == "" {
		return 0, false
	}
	id, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return 0, false
	}
	return id, true
}

func (h *Handler) pushViewProps(ctx *rtmp.RPCContext, charID int64) {
	if ctx == nil || ctx.Connection == nil || h.chars == nil {
		return
	}
	char, err := h.chars.GetByID(ctx.Context, charID)
	if err != nil || char == nil {
		return
	}
	rtmputils.SendInitViewProp(ctx, h.itemService, char)
}

func (h *Handler) emitMinusMoneyNew(ctx *rtmp.RPCContext, charID int64, remaining int) {
	_ = rtmputils.SendMinusMoneyNew(ctx.Connection, charID, []rtmputils.MinusMoneyEntry{
		{
			CurrentNum: int64(remaining),
			MoneyType:  "mysteryCrystal",
			Num:        appsoultrain.TrainCostMysteryCrystal,
			Type:       rtmputils.MinusMoneyTypeMysteryCrystal,
		},
	})
}
