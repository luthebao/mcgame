// Open-sourced by BaoLT

// Heiyaoshi RPC handler shared helpers: arg coercion, response builders, character ID extraction.
package heiyaoshi

import (
	"errors"
	"strconv"

	appheiyaoshi "mcgame-server/internal/application/heiyaoshi"
	"mcgame-server/internal/infrastructure/rtmp"
)

const genericFailureMessage = "operation failed"

func notifyActivateError(ctx *rtmp.RPCContext, err error) {
	if ctx == nil || ctx.Connection == nil || err == nil {
		return
	}
	msg := userMessageForActivateError(err)
	if msg == "" {
		return
	}
	_ = ctx.Connection.SendCallback("onSystemSay", msg)
}

func userMessageForActivateError(err error) string {
	switch {
	case errors.Is(err, appheiyaoshi.ErrInvalidPoint):
		return "Vị trí Hắc Diệu Thạch không hợp lệ"
	case errors.Is(err, appheiyaoshi.ErrInvalidFigure):
		return "Bản đồ Hắc Diệu Thạch không hợp lệ"
	case errors.Is(err, appheiyaoshi.ErrFigureMismatch):
		return "Tiến trình Hắc Diệu Thạch không khớp, vui lòng mở lại bảng"
	case errors.Is(err, appheiyaoshi.ErrPointAlreadyActive):
		return "Điểm này đã được kích hoạt"
	case errors.Is(err, appheiyaoshi.ErrPointNotAdjacent):
		return "Vị trí này phải nằm cạnh điểm đã kích hoạt"
	case errors.Is(err, appheiyaoshi.ErrInsufficientStone):
		return "Không đủ Hắc Diệu Thạch"
	case errors.Is(err, appheiyaoshi.ErrInsufficientGold):
		return "Không đủ vàng"
	case errors.Is(err, appheiyaoshi.ErrCharacterNotFound):
		return ""
	default:
		return ""
	}
}

func toInt(arg any) (int, bool) {
	switch v := arg.(type) {
	case float64:
		return int(v), true
	case float32:
		return int(v), true
	case int:
		return v, true
	case int32:
		return int(v), true
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

func toInt64(arg any) (int64, bool) {
	switch v := arg.(type) {
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

func errResponse(msg string) map[string]any {
	return map[string]any{"success": false, "error": msg}
}

func successResponse(extras map[string]any) map[string]any {
	resp := map[string]any{"success": true}
	for k, v := range extras {
		resp[k] = v
	}
	return resp
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

func buffToWire(buff map[int]float64) map[string]any {
	out := make(map[string]any, len(buff))
	for propID, value := range buff {
		if value == float64(int64(value)) {
			out[strconv.Itoa(propID)] = int64(value)
			continue
		}
		out[strconv.Itoa(propID)] = value
	}
	return out
}

func areasToWire(unlocks []appheiyaoshi.AreaUnlock) map[string]any {
	out := make(map[string]any, len(unlocks))
	for _, u := range unlocks {
		out[strconv.Itoa(u.AreaID)] = 1
	}
	return out
}

func linesToWire(unlocks []appheiyaoshi.LineUnlock) map[string]any {
	out := make(map[string]any, len(unlocks))
	for _, u := range unlocks {
		out[strconv.Itoa(u.LineID)] = 1
	}
	return out
}

func panelToWire(panel *appheiyaoshi.PanelData) map[string]any {
	if panel == nil {
		empty := appheiyaoshi.NewState()
		empty.LastActFigure = appheiyaoshi.MinFigure
		return map[string]any{
			"TRIANGLE_FIGURE": appheiyaoshi.TriangleFigureForPanel(),
			"data":            empty.Encode(),
		}
	}
	return map[string]any{
		"TRIANGLE_FIGURE": panel.TriangleFigure,
		"data":            panel.State.Encode(),
	}
}
