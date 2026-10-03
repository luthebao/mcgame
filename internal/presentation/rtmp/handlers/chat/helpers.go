// Open-sourced by BaoLT

package chat

import (
	"strconv"
	"strings"

	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"
)

func parseInt64Arg(arg interface{}) (int64, bool) {
	switch value := arg.(type) {
	case float64:
		return int64(value), true
	case float32:
		return int64(value), true
	case int:
		return int64(value), true
	case int32:
		return int64(value), true
	case int64:
		return value, true
	case uint:
		return int64(value), true
	case uint32:
		return int64(value), true
	case uint64:
		return int64(value), true
	case string:
		parsed, err := strconv.ParseInt(strings.TrimSpace(value), 10, 64)
		if err != nil {
			return 0, false
		}
		return parsed, true
	default:
		return 0, false
	}
}

func currentCharacterID(ctx *rtmp.RPCContext) (int64, error) {
	charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return 0, pkgerrors.ErrUnauthorized
	}
	return charID, nil
}

func currentRoomID(ctx *rtmp.RPCContext, char *character.Character) int {
	roomID, _ := ctx.Connection.GetSceneInfo()
	if roomID == 0 {
		roomID = char.MapID
	}
	return roomID
}

func parseSayPayload(args []any) (int, string) {
	if len(args) < 4 {
		return 0, ""
	}

	channelID := 0
	if parsedChannelID, ok := parseInt64Arg(args[2]); ok {
		channelID = int(parsedChannelID)
	}

	message, _ := args[3].(string)
	return channelID, message
}

func splitNonEmpty(input string) []string {
	return strings.Fields(strings.TrimSpace(input))
}
