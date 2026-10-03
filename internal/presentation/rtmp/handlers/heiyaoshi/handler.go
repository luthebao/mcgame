// Open-sourced by BaoLT

// Heiyaoshi (Hắc Diệu Thạch) panel RPC handler dispatch surface.
package heiyaoshi

import (
	"context"

	appheiyaoshi "mcgame-server/internal/application/heiyaoshi"
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
	service     *appheiyaoshi.Service
	itemService rtmputils.StatRefreshService
	chars       characterLoader
}

func NewHandler(service *appheiyaoshi.Service, logger *zap.Logger) *Handler {
	return &Handler{logger: logger, service: service}
}

func (h *Handler) SetItemService(svc rtmputils.StatRefreshService) {
	h.itemService = svc
}

func (h *Handler) SetCharacterService(loader characterLoader) {
	h.chars = loader
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("initHeiyaoshiPanelData", h.InitHeiyaoshiPanelData)
	dispatcher.Register("lightHeiyaoshiPoint", h.LightHeiyaoshiPoint)
	dispatcher.Register("activateHeiyaoshiPoint", h.ActivateHeiyaoshiPoint)
	dispatcher.Register("resetHeiyaoshi", h.ResetHeiyaoshi)
}

func (h *Handler) pushStatRefresh(ctx *rtmp.RPCContext, charID int64) {
	if h == nil || ctx == nil || ctx.Connection == nil || h.itemService == nil || h.chars == nil {
		return
	}
	char, err := h.chars.GetByID(ctx.Context, charID)
	if err != nil || char == nil {
		return
	}
	rtmputils.SendStatRefreshUPP(ctx, h.itemService, char)
}

func (h *Handler) pushViewProps(ctx *rtmp.RPCContext, charID int64) {
	if h == nil || ctx == nil || ctx.Connection == nil || h.chars == nil {
		return
	}
	char, err := h.chars.GetByID(ctx.Context, charID)
	if err != nil || char == nil {
		return
	}
	rtmputils.SendInitViewProp(ctx, h.itemService, char)
}
