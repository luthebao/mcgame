// Open-sourced by BaoLT

// War sprite (Chiến Hồn Bạo Nộ) panel RPC handler dispatch surface.
package warsprite

import (
	appwarsprite "mcgame-server/internal/application/warsprite"
	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"

	"go.uber.org/zap"
)

type Handler struct {
	logger      *zap.Logger
	service     *appwarsprite.Service
	itemService rtmputils.StatRefreshService
}

func NewHandler(service *appwarsprite.Service, logger *zap.Logger) *Handler {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Handler{logger: logger, service: service}
}

func (h *Handler) SetItemService(svc rtmputils.StatRefreshService) {
	h.itemService = svc
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("getSpWarData", h.GetSpWarData)
	dispatcher.Register("addWarSprite", h.AddWarSprite)
	dispatcher.Register("addWarSpriteGold", h.AddWarSpriteGold)
	dispatcher.Register("addBattleSprite", h.AddBattleSprite)
	dispatcher.Register("addBattleSpriteGold", h.AddBattleSpriteGold)
	dispatcher.Register("getWSPBuffList", h.GetWSPBuffList)
}

func (h *Handler) pushPanel(ctx *rtmp.RPCContext, payload map[string]any) {
	if ctx == nil || ctx.Connection == nil {
		return
	}
	_ = ctx.Connection.SendCallback("updateWSPPanel", payload)
}

func (h *Handler) pushStatRefreshFor(ctx *rtmp.RPCContext, char *domainchar.Character) {
	if h == nil || ctx == nil || ctx.Connection == nil || h.itemService == nil || char == nil {
		return
	}
	rtmputils.SendStatRefreshUPP(ctx, h.itemService, char)
}

func (h *Handler) pushWalletDelta(ctx *rtmp.RPCContext, delta appwarsprite.ResourceDelta) {
	if ctx == nil || ctx.Connection == nil || delta.Field == "" {
		return
	}
	_ = ctx.Connection.SendCallback("onUPP", map[string]any{delta.Field: delta.NewTotal})
}
