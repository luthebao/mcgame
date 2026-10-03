// Open-sourced by BaoLT

// Mount (Thú Cưỡi) RPC handlers. Registers: getMountList, checkHaveMount,
// addMountExp, addMountUpExp, renewMount. onAddMountExp goes to the caller after a
// feed/evolve; renewMount returns the new expiry for refreshMountOvertimeDate.
// The dress equip/ride RPCs (beginMounting/stopMounting, in dress.go) are wired by
// RegisterRiding (called from the composition root with the pet handler's
// beginMounting as the fallback): an owned TBL_MOUNT_DRESS id 1-20 routes to
// mount-dress, anything else falls through to the pet handler so pet-riding is
// preserved. See dress.go.
package mount

import (
	"errors"
	"strconv"

	appmount "mcgame-server/internal/application/mount"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	service    *appmount.Service
	scene      SceneBroadcaster
	appearance DismountAppearance
	logger     *zap.Logger
}

func NewHandler(service *appmount.Service, logger *zap.Logger) *Handler {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Handler{service: service, logger: logger}
}

func (h *Handler) RegisterHandlers(d *rtmp.RPCDispatcher) {
	d.Register("getMountList", h.GetMountList)
	d.Register("checkHaveMount", h.CheckHaveMount)
	d.Register("addMountExp", h.AddMountExp)
	d.Register("addMountUpExp", h.AddMountUpExp)
	d.Register("renewMount", h.RenewMount)
}

func (h *Handler) GetMountList(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return map[string]interface{}{}, nil
	}
	resp, err := h.service.GetMountList(ctx.Context, charID)
	if err != nil {
		h.logger.Error("getMountList failed", zap.Int64("char_id", charID), zap.Error(err))
		return map[string]interface{}{}, nil
	}
	return resp, nil
}

func (h *Handler) CheckHaveMount(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return 0, nil
	}
	code, err := h.service.CheckHaveMount(ctx.Context, charID)
	if err != nil {
		h.logger.Error("checkHaveMount failed", zap.Int64("char_id", charID), zap.Error(err))
		return 0, nil
	}
	return code, nil
}

func (h *Handler) AddMountExp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	count := 1
	if len(args) > 0 {
		if n, err := parseIntArg(args[0]); err == nil {
			count = n
		}
	}
	payload, err := h.service.AddMountExp(ctx.Context, charID, count)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}
	_ = ctx.Connection.SendCallback("onAddMountExp", payload)
	return nil, nil
}

func (h *Handler) AddMountUpExp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	payload, err := h.service.AddMountUpExp(ctx.Context, charID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}
	_ = ctx.Connection.SendCallback("onAddMountExp", payload)
	return nil, nil
}

func (h *Handler) RenewMount(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	if len(args) < 1 {
		return nil, nil
	}
	dressID, err := parseIntArg(args[0])
	if err != nil {
		return nil, nil
	}
	expiry, err := h.service.RenewMount(ctx.Context, charID, dressID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}
	return map[string]interface{}{"id": dressID, "time": expiry}, nil
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

func charIDFromCtx(ctx *rtmp.RPCContext) (int64, bool) {
	if ctx == nil || ctx.CharacterID == "" {
		return 0, false
	}
	id, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return 0, false
	}
	return id, true
}
