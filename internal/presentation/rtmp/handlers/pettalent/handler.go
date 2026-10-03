// Open-sourced by BaoLT

// Pet Talent (Thiên Phú Pet) RPC handler.
//
// Responder-result RPCs reply via the inline Responder value: initTalentPanelData
// -> {tal,inTal,b}; upTalentSlotLv -> {sid:newTid}; arrangeTalentBag -> full bag;
// resetTalentSlot / breakTalentStone / upTalentStone -> {a,d} bag delta. The client
// binds resetTalentSlot/upTalentStone via new Responder(onResetTalentSlot /
// onUpTalentStone) (PetTalentFuncPanel.as:1513,2945), so the delta is RETURNED, not
// pushed; on error/invalid input these return (nil, nil) so no _result is sent and
// the client never shows a false success note.
//
// Push RPCs use a null responder and emit a named CallBack carrying the delta:
// fillTalentStone / takeOffTalentStone -> onFillOrTakeTalentStone; moveStoneBagToBag
// -> onMoveStoneBagToBag. Push actions return (nil, nil) and call push().
package pettalent

import (
	"strconv"

	apppettalent "mcgame-server/internal/application/pettalent"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	service *apppettalent.Service
	logger  *zap.Logger
}

func NewHandler(service *apppettalent.Service, logger *zap.Logger) *Handler {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Handler{service: service, logger: logger}
}

func (h *Handler) RegisterHandlers(d *rtmp.RPCDispatcher) {
	d.Register("initTalentPanelData", h.InitPanelData)
	d.Register("upTalentSlotLv", h.UpTalentSlotLv)
	d.Register("arrangeTalentBag", h.ArrangeBag)
	d.Register("resetTalentSlot", h.ResetTalentSlot)
	d.Register("breakTalentStone", h.BreakTalentStone)
	d.Register("fillTalentStone", h.FillTalentStone)
	d.Register("takeOffTalentStone", h.TakeOffTalentStone)
	d.Register("moveStoneBagToBag", h.MoveStoneBagToBag)
	d.Register("upTalentStone", h.UpTalentStone)
}

func emptyPanel() map[string]interface{} {
	return map[string]interface{}{
		"tal":   map[string]interface{}{},
		"inTal": map[string]interface{}{},
		"b":     map[string]interface{}{},
	}
}

func emptyDelta() map[string]interface{} {
	return map[string]interface{}{
		"a": map[string]interface{}{},
		"d": map[string]interface{}{},
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
		return v == "1" || v == "true"
	}
	return false
}

func stringArg(args []interface{}, idx int) (string, bool) {
	if idx < 0 || idx >= len(args) {
		return "", false
	}
	switch v := args[idx].(type) {
	case string:
		return v, true
	case float64:
		return strconv.Itoa(int(v)), true
	case int:
		return strconv.Itoa(v), true
	case int64:
		return strconv.FormatInt(v, 10), true
	}
	return "", false
}

func (h *Handler) push(ctx *rtmp.RPCContext, method string, payload interface{}) {
	if ctx == nil || ctx.Connection == nil {
		return
	}
	if err := ctx.Connection.SendCallback(method, payload); err != nil {
		h.logger.Warn("pettalent push failed", zap.String("method", method), zap.Error(err))
	}
}
