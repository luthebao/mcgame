// Open-sourced by BaoLT

// Monster Heart panel RPC handler dispatch surface.
package monsterheart

import (
	"context"
	"strconv"

	appmonsterheart "mcgame-server/internal/application/monsterheart"
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
	service     *appmonsterheart.Service
	itemService rtmputils.StatRefreshService
	chars       characterLoader
}

func NewHandler(service *appmonsterheart.Service, logger *zap.Logger) *Handler {
	return &Handler{
		logger:  logger,
		service: service,
	}
}

func (h *Handler) SetItemService(svc rtmputils.StatRefreshService) {
	h.itemService = svc
}

func (h *Handler) SetCharacterService(loader characterLoader) {
	h.chars = loader
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("initMonsterHeartData", h.InitMonsterHeartData)
	dispatcher.Register("monsterHeartSet", h.MonsterHeartSet)
	dispatcher.Register("monsterHeartReMove", h.MonsterHeartReMove)
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
