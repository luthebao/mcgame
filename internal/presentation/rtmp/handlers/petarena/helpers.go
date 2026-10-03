// Open-sourced by BaoLT

package petarena

import (
	"strconv"

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

func parseIntArg(arg interface{}) (int, error) {
	switch v := arg.(type) {
	case float64:
		return int(v), nil
	case int:
		return v, nil
	case int64:
		return int(v), nil
	default:
		return 0, pkgerrors.ErrInvalidArgs
	}
}

func parseInt64Arg(arg interface{}) (int64, error) {
	switch v := arg.(type) {
	case float64:
		return int64(v), nil
	case int:
		return int64(v), nil
	case int64:
		return v, nil
	case string:
		value, err := strconv.ParseInt(v, 10, 64)
		if err != nil {
			return 0, pkgerrors.ErrInvalidArgs
		}
		return value, nil
	default:
		return 0, pkgerrors.ErrInvalidArgs
	}
}
