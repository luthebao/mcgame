// Open-sourced by BaoLT

// Buff RPC handler. Currently exposes delBuffClient (player removes a buff via
// right click on the LongBuffCanvas).
package buff

import (
	"errors"
	"strconv"

	appbuff "mcgame-server/internal/application/buff"
	appitem "mcgame-server/internal/application/item"
	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type Handler struct {
	buffService   *appbuff.Service
	characterRepo domainchar.Repository
	itemService   *appitem.Service
	logger        *zap.Logger
}

func NewHandler(buffService *appbuff.Service, characterRepo domainchar.Repository, itemService *appitem.Service, logger *zap.Logger) *Handler {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Handler{buffService: buffService, characterRepo: characterRepo, itemService: itemService, logger: logger}
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	if dispatcher == nil {
		return
	}
	dispatcher.Register("delBuffClient", h.DelBuffClient)
}

func (h *Handler) DelBuffClient(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if h == nil || h.buffService == nil {
		return nil, nil
	}
	charID, err := h.characterID(ctx)
	if err != nil {
		return nil, err
	}
	if len(args) == 0 {
		return nil, pkgerrors.ErrInvalidInput
	}
	id, ok := parseBuffID(args[0])
	if !ok || id <= 0 {
		return nil, pkgerrors.ErrInvalidInput
	}

	removed, err := h.buffService.RemoveByClient(ctx.Context, charID, id)
	if err != nil {
		switch {
		case errors.Is(err, appbuff.ErrBuffNotRemovable):
			h.logger.Info("delBuffClient: refused non-removable buff",
				zap.Int64("character_id", charID),
				zap.Int64("buff_id", id))
		case errors.Is(err, appbuff.ErrBuffNotFound), errors.Is(err, appbuff.ErrBuffWrongOwner):
			_ = ctx.Connection.SendCallback("delBuff", id)
		default:
			h.logger.Warn("delBuffClient: failed",
				zap.Int64("character_id", charID),
				zap.Int64("buff_id", id),
				zap.Error(err))
		}
		return nil, nil
	}

	_ = ctx.Connection.SendCallback("delBuff", removed.ID)

	if h.characterRepo != nil && h.itemService != nil {
		char, ferr := h.characterRepo.FindByID(ctx.Context, charID)
		if ferr == nil && char != nil {
			rtmputils.SendStatRefreshUPP(ctx, h.itemService, char)
		}
	}

	return nil, nil
}

func (h *Handler) characterID(ctx *rtmp.RPCContext) (int64, error) {
	if ctx == nil || ctx.CharacterID == "" {
		return 0, pkgerrors.ErrUnauthorized
	}
	id, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return 0, pkgerrors.ErrInvalidInput
	}
	return id, nil
}

func parseBuffID(arg interface{}) (int64, bool) {
	switch v := arg.(type) {
	case float64:
		return int64(v), true
	case int:
		return int64(v), true
	case int64:
		return v, true
	case string:
		id, err := strconv.ParseInt(v, 10, 64)
		if err != nil {
			return 0, false
		}
		return id, true
	default:
		return 0, false
	}
}
