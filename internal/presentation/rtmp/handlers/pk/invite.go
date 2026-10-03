// Open-sourced by BaoLT

package pk

import (
	"fmt"

	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) PKInvite(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	targetCID, err := toInt64(args[0])
	if err != nil {
		return nil, pkgerrors.ErrInvalidArgs
	}
	mapID := 0
	if len(args) >= 2 {
		mapID = toInt(args[1])
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	if pendingInv, matchID := h.service.FindPendingInviteForPlayer(characterID); pendingInv != nil {
		if pendingInv.FromCID == targetCID {
			h.logger.Info("Auto-accepting pending invite via PVPStartClient",
				zap.String("match_id", matchID),
				zap.Int64("accepter", characterID),
				zap.Int64("inviter", targetCID))

			match, err := h.service.Respond(ctx.Context, matchID, characterID, true)
			if err != nil {
				return rtmp.ErrorToResponse(err), nil
			}

			h.broadcastMatchEvent(match, func(conn *rtmp.Connection) {
				_ = conn.SendCallback("onPkMatchReady", map[string]interface{}{
					"matchId": match.ID,
					"mapId":   match.MapID,
					"players": []map[string]interface{}{
						{"cid": match.PlayerA},
						{"cid": match.PlayerB},
					},
				})
			})

			return map[string]interface{}{
				"success":  true,
				"accepted": true,
				"matchId":  match.ID,
			}, nil
		}
	}

	if err := h.service.ValidateAllowedMap(mapID); err != nil {
		return nil, err
	}

	inv, err := h.service.Invite(ctx.Context, characterID, targetCID, mapID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	_ = ctx.Connection.SendCallback("onMidNote", fmt.Sprintf("Đã gửi lời mời PK tới người chơi %d (match %s)", targetCID, inv.MatchID))

	if targetConn := h.rtmpServer.GetConnectionByCharacterID(fmt.Sprintf("%d", targetCID)); targetConn != nil {
		_ = targetConn.SendCallback("onForcePVP", characterID)
	}

	return map[string]interface{}{
		"success":  true,
		"matchId":  inv.MatchID,
		"expireAt": inv.ExpiresAt.UnixMilli(),
	}, nil
}

func (h *Handler) PKInviteResp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	matchID, ok := args[0].(string)
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	accept := toBool(args[1])

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	match, err := h.service.Respond(ctx.Context, matchID, characterID, accept)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	if !accept || match == nil {
		if match != nil {
			h.broadcastMatchEvent(match, func(conn *rtmp.Connection) {
				_ = conn.SendCallback("onPkInviteExpired", matchID)
			})
		}
		return map[string]interface{}{"success": true, "accepted": false}, nil
	}

	h.broadcastMatchEvent(match, func(conn *rtmp.Connection) {
		_ = conn.SendCallback("onPkMatchReady", map[string]interface{}{
			"matchId": match.ID,
			"mapId":   match.MapID,
			"players": []map[string]interface{}{
				{"cid": match.PlayerA},
				{"cid": match.PlayerB},
			},
		})
	})

	return map[string]interface{}{"success": true, "accepted": true, "matchId": match.ID}, nil
}
