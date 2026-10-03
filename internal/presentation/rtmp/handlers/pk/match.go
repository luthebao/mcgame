// Open-sourced by BaoLT

package pk

import (
	"time"

	domainpk "mcgame-server/internal/domain/pk"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"
)

func (h *Handler) PKReady(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	matchID, ok := args[0].(string)
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	match, started, err := h.service.Ready(ctx.Context, matchID, characterID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	if started {
		h.broadcastMatchEvent(match, func(conn *rtmp.Connection) {
			_ = conn.SendCallback("onPkStart", map[string]interface{}{
				"matchId": match.ID,
				"startAt": time.Now().UnixMilli(),
			})
		})
	}

	return map[string]interface{}{"success": true, "started": started}, nil
}

func (h *Handler) PKAction(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	matchID, ok := args[0].(string)
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	match, err := h.service.Action(ctx.Context, matchID, characterID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	var actionObj interface{}
	if len(args) >= 2 {
		actionObj = args[1]
	}

	h.broadcastMatchEvent(match, func(conn *rtmp.Connection) {
		_ = conn.SendCallback("onPkActionResult", map[string]interface{}{
			"matchId":   match.ID,
			"actorCid":  characterID,
			"payload":   actionObj,
			"timestamp": time.Now().UnixMilli(),
		})
	})

	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) PKSurrender(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	matchID, ok := args[0].(string)
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	match, err := h.service.Surrender(ctx.Context, matchID, characterID, "surrender")
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}
	h.emitResult(match)
	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) PKLeave(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	matchID, ok := args[0].(string)
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	match, err := h.service.LeaveForfeit(ctx.Context, matchID, characterID, "leave")
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}
	h.emitResult(match)
	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) emitResult(match *domainpk.Match) {
	if match == nil {
		return
	}
	h.broadcastMatchEvent(match, func(conn *rtmp.Connection) {
		_ = conn.SendCallback("onPkResult", map[string]interface{}{
			"matchId": match.ID,
			"winner":  match.WinnerCID,
			"reason":  match.Reason,
			"endAt":   match.EndAt.UnixMilli(),
			"mapId":   match.MapID,
			"state":   match.State,
		})
		_ = conn.SendCallback("onPkEnd", match.ID)
	})
}
