// Open-sourced by BaoLT

// Soul Gem (Mệnh Hồn) RPC handlers. Registers the deterministic + exp-pool slot
// operations (openBag, lockSoul, soulLevelUp 1-arg char / 2-arg pet, putInToExp,
// transformExp single + bulk) plus the acquisition + movement operations in
// acquire_handlers.go (preySoul gacha, exchangeSoul, putSoulToBag single + all,
// openPetSoulBag, and the moveSoul drag-swap). preySoul / putSoulToBag / moveSoul are
// push-style (null responder → SendCallback); exchangeSoul / openPetSoulBag are
// Responder-result (return the result map). See internal/application/soul.
package soul

import (
	"errors"
	"strconv"

	appsoul "mcgame-server/internal/application/soul"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	service        *appsoul.Service
	logger         *zap.Logger
	sendCallbackFn func(conn *rtmp.Connection, method string, args ...interface{}) error
}

func NewHandler(service *appsoul.Service, logger *zap.Logger) *Handler {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Handler{service: service, logger: logger}
}

func (h *Handler) sendCallback(conn *rtmp.Connection, method string, args ...interface{}) error {
	if h.sendCallbackFn != nil {
		return h.sendCallbackFn(conn, method, args...)
	}
	return conn.SendCallback(method, args...)
}

func (h *Handler) RegisterHandlers(d *rtmp.RPCDispatcher) {
	d.Register("openBag", h.OpenBag)
	d.Register("lockSoul", h.LockSoul)
	d.Register("soulLevelUp", h.SoulLevelUp)
	d.Register("putInToExp", h.PutInToExp)
	d.Register("transformExp", h.TransformExp)
	d.Register("preySoul", h.PreySoul)
	d.Register("exchangeSoul", h.ExchangeSoul)
	d.Register("putSoulToBag", h.PutSoulToBag)
	d.Register("openPetSoulBag", h.OpenPetSoulBag)
	d.Register("moveSoul", h.MoveSoul)
}

func (h *Handler) OpenBag(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	index, err := h.service.OpenBag(ctx.Context, charID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}
	_ = ctx.Connection.SendCallback("onOpenBag", map[string]interface{}{"index": index})
	return nil, nil
}

func (h *Handler) LockSoul(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	if len(args) < 1 {
		return nil, nil
	}
	slot, err := parseIntArg(args[0])
	if err != nil {
		return nil, nil
	}
	locked, err := h.service.LockSoul(ctx.Context, charID, slot)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}
	_ = ctx.Connection.SendCallback("onLockSoul", map[string]interface{}{"index": slot, "lock": locked})
	return nil, nil
}

func (h *Handler) SoulLevelUp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	if len(args) < 1 {
		return nil, nil
	}
	slot, err := parseIntArg(args[0])
	if err != nil {
		return nil, nil
	}
	if petID, isPet := petIDArg(args); isPet {
		soulData, soulExp, levErr := h.service.SoulLevelUpPet(ctx.Context, charID, petID, slot)
		if levErr != nil {
			return rtmp.ErrorToResponse(levErr), nil
		}
		_ = ctx.Connection.SendCallback("onSoulLevelUp", map[string]interface{}{
			"soulData": soulData,
			"soulExp":  soulExp,
			"pid":      petID,
		})
		return nil, nil
	}
	soulData, soulExp, levErr := h.service.SoulLevelUp(ctx.Context, charID, slot)
	if levErr != nil {
		return rtmp.ErrorToResponse(levErr), nil
	}
	_ = ctx.Connection.SendCallback("onSoulLevelUp", map[string]interface{}{
		"soulData": soulData,
		"soulExp":  soulExp,
	})
	return nil, nil
}

func (h *Handler) PutInToExp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	if len(args) < 2 {
		return nil, nil
	}
	slot, err := parseIntArg(args[0])
	if err != nil {
		return nil, nil
	}
	amount, err := parseInt64Arg(args[1])
	if err != nil {
		return nil, nil
	}
	soulData, soulExp, opErr := h.service.PutInToExp(ctx.Context, charID, slot, amount)
	if opErr != nil {
		return rtmp.ErrorToResponse(opErr), nil
	}
	_ = ctx.Connection.SendCallback("onPutInToExp", map[string]interface{}{
		"soulData": soulData,
		"soulExp":  soulExp,
	})
	return nil, nil
}

func (h *Handler) TransformExp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	if len(args) < 1 {
		return nil, nil
	}
	if boolArg(args, 1) {
		payload, err := h.service.TransformAllExp(ctx.Context, charID)
		if err != nil {
			return rtmp.ErrorToResponse(err), nil
		}
		_ = ctx.Connection.SendCallback("onTransAllExp", payload)
		return nil, nil
	}
	slot, err := parseIntArg(args[0])
	if err != nil {
		return nil, nil
	}
	payload, err := h.service.TransformExp(ctx.Context, charID, slot)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}
	_ = ctx.Connection.SendCallback("onTransformExp", payload)
	return nil, nil
}

func petIDArg(args []interface{}) (int64, bool) {
	if len(args) < 2 {
		return 0, false
	}
	id, err := parseInt64Arg(args[1])
	if err != nil || id <= 0 {
		return 0, false
	}
	return id, true
}

func boolArg(args []interface{}, idx int) bool {
	if idx >= len(args) {
		return false
	}
	switch v := args[idx].(type) {
	case bool:
		return v
	case float64:
		return v != 0
	case int:
		return v != 0
	case string:
		return v == "true" || v == "1"
	}
	return false
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

func parseInt64Arg(value any) (int64, error) {
	switch typed := value.(type) {
	case float64:
		return int64(typed), nil
	case int:
		return int64(typed), nil
	case int64:
		return typed, nil
	case string:
		return strconv.ParseInt(typed, 10, 64)
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
