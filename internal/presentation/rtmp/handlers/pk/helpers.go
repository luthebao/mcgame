// Open-sourced by BaoLT

package pk

import (
	"strconv"

	domainpk "mcgame-server/internal/domain/pk"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"
)

func currentCharacterID(ctx *rtmp.RPCContext) (int64, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return 0, pkgerrors.ErrUnauthorized
	}
	return characterID, nil
}

func toInt64(v interface{}) (int64, error) {
	switch t := v.(type) {
	case float64:
		return int64(t), nil
	case int64:
		return t, nil
	case int:
		return int64(t), nil
	default:
		return 0, pkgerrors.ErrInvalidArgs
	}
}

func toInt(v interface{}) int {
	switch t := v.(type) {
	case float64:
		return int(t)
	case int:
		return t
	case int64:
		return int(t)
	default:
		return 0
	}
}

func toBool(v interface{}) bool {
	switch t := v.(type) {
	case bool:
		return t
	case float64:
		return t != 0
	case int:
		return t != 0
	default:
		return false
	}
}

func (h *Handler) broadcastMatchEvent(match *domainpk.Match, fn func(conn *rtmp.Connection)) {
	if match == nil {
		return
	}
	for _, cid := range []int64{match.PlayerA, match.PlayerB} {
		if cid == 0 {
			continue
		}
		if conn := h.rtmpServer.GetConnectionByCharacterID(strconv.FormatInt(cid, 10)); conn != nil {
			fn(conn)
		}
	}
}
