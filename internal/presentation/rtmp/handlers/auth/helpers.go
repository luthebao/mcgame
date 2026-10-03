// Open-sourced by BaoLT

package auth

import (
	"strconv"
	"strings"

	appquest "mcgame-server/internal/application/quest"
	"mcgame-server/internal/infrastructure/rtmp"
)

func buildQuestLogString(questService *appquest.Service, ctx *rtmp.RPCContext, charID int64) string {
	if questService == nil || ctx == nil {
		return "|"
	}
	completed, err := questService.GetCompletedQuestIDs(ctx.Context, charID)
	if err != nil || len(completed) == 0 {
		return "|"
	}
	var b strings.Builder
	b.WriteByte('|')
	for _, id := range completed {
		b.WriteString(strconv.Itoa(id))
		b.WriteByte('|')
	}
	return b.String()
}

func lastInt64Arg(args []interface{}) (int64, bool) {
	for i := len(args) - 1; i >= 0; i-- {
		if value, ok := parseInt64Arg(args[i]); ok {
			return value, true
		}
	}
	return 0, false
}

func parseIntArg(arg interface{}) (int, bool) {
	switch value := arg.(type) {
	case float64:
		return int(value), true
	case int:
		return value, true
	case int64:
		return int(value), true
	case string:
		parsed, err := strconv.Atoi(strings.TrimSpace(value))
		if err != nil {
			return 0, false
		}
		return parsed, true
	default:
		return 0, false
	}
}

func parseInt64Arg(arg interface{}) (int64, bool) {
	switch value := arg.(type) {
	case float64:
		return int64(value), true
	case int:
		return int64(value), true
	case int64:
		return value, true
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
