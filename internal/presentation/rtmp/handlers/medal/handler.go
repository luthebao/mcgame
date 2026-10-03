// Open-sourced by BaoLT

// Medal (Ấn Chương) RPC handler.
// getMedalInfo and arrangeMedalBag reply via the inline Responder result
// (getMedalInfo -> {medalExp,medalBag,petBuff,charBuff}; arrangeMedalBag -> the
// re-keyed medalBag object). moveMedal / upMedal / breakMedal use a null responder
// and push named callbacks (onMoveMedal / onUpMedal / onBreakMedal) carrying the
// updateMedalInfoByOpr deltas {del, pa, ba} (+ medalExp on up/break, +
// type/joinTid/petJoinTid on move). The server-award updateMedalInBag push is out of
// scope (see internal/application/medal and the panel-writer research doc).
package medal

import (
	"strconv"

	appmedal "mcgame-server/internal/application/medal"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	service *appmedal.Service
	logger  *zap.Logger
}

func NewHandler(service *appmedal.Service, logger *zap.Logger) *Handler {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Handler{service: service, logger: logger}
}

func (h *Handler) RegisterHandlers(d *rtmp.RPCDispatcher) {
	d.Register("getMedalInfo", h.GetInfo)
	d.Register("moveMedal", h.MoveMedal)
	d.Register("arrangeMedalBag", h.ArrangeBag)
	d.Register("upMedal", h.UpMedal)
	d.Register("breakMedal", h.BreakMedal)
}

func emptyInfo() map[string]interface{} {
	return map[string]interface{}{
		"medalExp": 0,
		"medalBag": map[string]interface{}{},
		"petBuff":  map[string]interface{}{"t": 0},
		"charBuff": map[string]interface{}{"t": 0},
	}
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

func intArg(args []interface{}, idx int) (int, bool) {
	if idx < 0 || idx >= len(args) {
		return 0, false
	}
	switch v := args[idx].(type) {
	case float64:
		return int(v), true
	case int:
		return v, true
	case int64:
		return int(v), true
	case string:
		n, err := strconv.Atoi(v)
		if err != nil {
			return 0, false
		}
		return n, true
	}
	return 0, false
}

func (h *Handler) push(ctx *rtmp.RPCContext, method string, payload interface{}) {
	if ctx == nil || ctx.Connection == nil {
		return
	}
	if err := ctx.Connection.SendCallback(method, payload); err != nil {
		h.logger.Warn("medal push failed", zap.String("method", method), zap.Error(err))
	}
}
