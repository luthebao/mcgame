// Open-sourced by BaoLT

// Star instance RTMP handlers for Tinh Giới Thập Nhị Cung (12x12 zodiac PvE grid).
// Registers: getWarMap, clickWarMap, addWarMapTime.
package starinstance

import (
	"errors"
	"strconv"

	appgroup "mcgame-server/internal/application/group"
	appstar "mcgame-server/internal/application/star"
	appstarinstance "mcgame-server/internal/application/starinstance"
	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	service      *appstarinstance.Service
	starService  *appstar.Service
	groupService *appgroup.Service
	charRepo     domainchar.Repository
	logger       *zap.Logger
}

func NewHandler(service *appstarinstance.Service, starService *appstar.Service, charRepo domainchar.Repository, logger *zap.Logger) *Handler {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Handler{
		service:     service,
		starService: starService,
		charRepo:    charRepo,
		logger:      logger,
	}
}

func (h *Handler) SetGroupService(svc *appgroup.Service) {
	h.groupService = svc
}

func (h *Handler) RegisterHandlers(d *rtmp.RPCDispatcher) {
	d.Register("getWarMap", h.GetWarMap)
	d.Register("clickWarMap", h.ClickWarMap)
	d.Register("addWarMapTime", h.AddWarMapTime)
}

func parseIntArg(value any) (int, error) {
	switch typed := value.(type) {
	case float64:
		return int(typed), nil
	case int:
		return typed, nil
	case int64:
		return int(typed), nil
	case string:
		return strconv.Atoi(typed)
	}
	return 0, errors.New("unsupported argument type")
}

func characterIDFromCtx(ctx *rtmp.RPCContext) (int64, bool) {
	if ctx == nil || ctx.CharacterID == "" {
		return 0, false
	}
	id, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return 0, false
	}
	return id, true
}
