// Open-sourced by BaoLT

// War sprite RPC handler shared helpers: arg coercion, error mapping, and string-keyed buff serialization.
package warsprite

import (
	"errors"
	"strconv"

	domainwsp "mcgame-server/internal/domain/warsprite"
	"mcgame-server/internal/infrastructure/rtmp"
)

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

func parseIndex(args []any) (int, error) {
	if len(args) == 0 {
		return 0, domainwsp.ErrInvalidIndex
	}
	idx, ok := toInt(args[0])
	if !ok || !domainwsp.ValidIndex(idx) {
		return 0, domainwsp.ErrInvalidIndex
	}
	return idx, nil
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

func notifyUpgradeError(ctx *rtmp.RPCContext, err error) {
	if ctx == nil || ctx.Connection == nil || err == nil {
		return
	}
	msg := userMessageForUpgradeError(err)
	if msg == "" {
		return
	}
	_ = ctx.Connection.SendCallback("onSystemSay", msg)
}

func userMessageForUpgradeError(err error) string {
	switch {
	case errors.Is(err, domainwsp.ErrInvalidIndex):
		return "Vị trí Chiến Hồn không hợp lệ"
	case errors.Is(err, domainwsp.ErrInvalidKind):
		return "Loại Chiến Hồn không hợp lệ"
	case errors.Is(err, domainwsp.ErrMaxLevel):
		return "Chiến Hồn đã đạt cấp tối đa"
	case errors.Is(err, domainwsp.ErrInsufficientStone):
		return "Không đủ đá Chiến Hồn"
	case errors.Is(err, domainwsp.ErrInsufficientGold):
		return "Không đủ vàng"
	case errors.Is(err, domainwsp.ErrTemplateNotFound):
		return "Dữ liệu Chiến Hồn không hợp lệ"
	default:
		return ""
	}
}

func buffToWire(totals map[int]int64) map[string]any {
	out := make(map[string]any, len(totals))
	for propID, value := range totals {
		out[strconv.Itoa(propID)] = value
	}
	return out
}
