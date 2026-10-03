// Open-sourced by BaoLT

// praBuff — "Ma Pháp Bí Trận" (Magic Formation Array) RPC handler.
// getMagicArrayData(praType) replies via the inline Responder result (the client
// routes it to updatePraView); addPracticeExp(praType, isGold) uses a null responder
// and pushes updatePraView with the post-train track state. Both reply/push the same
// {praType, buff, exp, goldNum, elementNum} shape (addPracticeExp adds addExp).
package prabuff

import (
	"strconv"

	appprabuff "mcgame-server/internal/application/prabuff"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	service *appprabuff.Service
	logger  *zap.Logger
}

func NewHandler(service *appprabuff.Service, logger *zap.Logger) *Handler {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Handler{service: service, logger: logger}
}

func (h *Handler) RegisterHandlers(d *rtmp.RPCDispatcher) {
	d.Register("getMagicArrayData", h.GetMagicArrayData)
	d.Register("addPracticeExp", h.AddPracticeExp)
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

func boolArg(args []interface{}, idx int) bool {
	if idx < 0 || idx >= len(args) {
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
