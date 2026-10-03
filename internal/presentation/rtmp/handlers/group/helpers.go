// Open-sourced by BaoLT

package group

import (
	"context"
	"strconv"

	domaingroup "mcgame-server/internal/domain/group"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"
)

func parseInt64Arg(arg interface{}) (int64, error) {
	switch v := arg.(type) {
	case float64:
		return int64(v), nil
	case int:
		return int64(v), nil
	case int64:
		return v, nil
	default:
		return 0, pkgerrors.ErrInvalidArgs
	}
}

func parseBoolArg(arg interface{}) (bool, error) {
	switch v := arg.(type) {
	case bool:
		return v, nil
	case float64:
		return v != 0, nil
	case int:
		return v != 0, nil
	case int64:
		return v != 0, nil
	default:
		return false, pkgerrors.ErrInvalidArgs
	}
}

func currentCharacterID(ctx *rtmp.RPCContext) (int64, error) {
	charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return 0, pkgerrors.ErrUnauthorized
	}
	return charID, nil
}

func successGroupResponse(g *domaingroup.Group) map[string]interface{} {
	return map[string]interface{}{
		"success": true,
		"group":   groupDTO(g),
	}
}

func groupDTO(g *domaingroup.Group) interface{} {
	if g == nil {
		return nil
	}
	return g.ToDTO()
}

func (h *Handler) sendCallback(conn *rtmp.Connection, method string, args ...interface{}) error {
	if h.sendCallbackFn != nil {
		return h.sendCallbackFn(conn, method, args...)
	}
	return conn.SendCallback(method, args...)
}

func (h *Handler) lookupConnection(characterID int64) *rtmp.Connection {
	if h.lookupConnFn == nil {
		return nil
	}
	return h.lookupConnFn(strconv.FormatInt(characterID, 10))
}

func (h *Handler) sendCallbackToCharacter(characterID int64, method string, args ...interface{}) error {
	conn := h.lookupConnection(characterID)
	if conn == nil {
		return nil
	}
	return h.sendCallback(conn, method, args...)
}

func (h *Handler) currentCharacter(ctx *rtmp.RPCContext) (int64, map[string]interface{}, error) {
	charID, err := currentCharacterID(ctx)
	if err != nil {
		return 0, nil, err
	}
	char, err := h.charService.GetByID(ctx.Context, charID)
	if err != nil {
		return 0, nil, err
	}
	return charID, map[string]interface{}{
		"cid":     char.ID,
		"name":    char.Name,
		"level":   char.Level,
		"classId": char.ClassID,
	}, nil
}

func (h *Handler) roomParticipantDTO(ctx context.Context, characterID int64) (map[string]interface{}, error) {
	char, err := h.charService.GetByID(ctx, characterID)
	if err != nil {
		return nil, err
	}
	return map[string]interface{}{
		"cid":     char.ID,
		"name":    char.Name,
		"level":   char.Level,
		"classId": char.ClassID,
	}, nil
}
