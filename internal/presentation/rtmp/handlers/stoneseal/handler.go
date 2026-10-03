// Open-sourced by BaoLT

// Stone Seal (Ấn Thạch DURRAS) RPC handler. All methods reply via the inline
// Responder result, not a CallBack push: stoneSealGetData -> {data,watch,equip,slot};
// the six mutators -> {flag:bool, data:<stone map>}. The server-initiated
// stoneSealOnEquipChange push (equip loadout change) is out of scope here.
package stoneseal

import (
	"strconv"

	appstoneseal "mcgame-server/internal/application/stoneseal"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	service *appstoneseal.Service
	logger  *zap.Logger
}

func NewHandler(service *appstoneseal.Service, logger *zap.Logger) *Handler {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Handler{service: service, logger: logger}
}

func (h *Handler) RegisterHandlers(d *rtmp.RPCDispatcher) {
	d.Register("stoneSealGetData", h.GetData)
	d.Register("stoneSealSetStone", h.SetStone)
	d.Register("stoneSealRemoveStone", h.RemoveStone)
	d.Register("stoneSealRemoveAllStone", h.RemoveAllStone)
	d.Register("stoneSealSwapStone", h.SwapStone)
	d.Register("stoneSealBore", h.Bore)
	d.Register("stoneSealSuccinct", h.Succinct)
}

func okResp(data map[string]interface{}) map[string]interface{} {
	return map[string]interface{}{"flag": true, "data": data}
}

func failResp() map[string]interface{} {
	return map[string]interface{}{"flag": false}
}

func getDataResp(data map[string]interface{}) map[string]interface{} {
	if data == nil {
		data = map[string]interface{}{}
	}
	return map[string]interface{}{
		"data":  data,
		"watch": false,
		"equip": nil,
		"slot":  nil,
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

func int64Arg(args []interface{}, idx int) (int64, bool) {
	if idx < 0 || idx >= len(args) {
		return 0, false
	}
	switch v := args[idx].(type) {
	case float64:
		return int64(v), true
	case int:
		return int64(v), true
	case int64:
		return v, true
	case string:
		n, err := strconv.ParseInt(v, 10, 64)
		if err != nil {
			return 0, false
		}
		return n, true
	}
	return 0, false
}
