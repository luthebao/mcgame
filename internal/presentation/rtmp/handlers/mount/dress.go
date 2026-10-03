// Open-sourced by BaoLT

// Mount-dress equip/unequip RPC handlers and zone broadcasts.
//
// RegisterRiding owns the shared beginMounting/stopMounting RPCs. The decompiled
// client only ever sends these for a mount-dress (a TBL_MOUNT_DRESS id 1-20), but
// the router still routes through IsOwnedDress so pet-riding is preserved for any
// other id (it falls through to the pet handler). BeginMounting persists the dress
// and broadcasts onMountOn{cid,resCode,wp}; StopMounting clears it and broadcasts
// onMountOff{cid,isMountOn,wp,ee,ef,star}. onUpdateDressList(action,dressId,expiry)
// is pushed to the caller on acquire/expire.
//
// DismountAppearance supplies the weapon/effect/star fields the client re-applies
// (Creature.equipOn) when a mount-dress is removed; the parent may bind it to the
// scene appearance builder (currently unbound -> StopMounting emits "0" defaults).
// wp/ee/star are wire strings, ef is the enchant-glow bool, matching the onMountOff
// callback's positional reads.
package mount

import (
	"context"

	appmount "mcgame-server/internal/application/mount"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type DismountAppearance interface {
	MountDismountAppearance(ctx context.Context, charID int64) (wp string, ee string, ef bool, star string)
}

type SceneBroadcaster interface {
	BroadcastToScene(channelID, mapID int, excludeConnID uint32, callback string, args ...any)
}

func (h *Handler) SetSceneBroadcaster(b SceneBroadcaster) {
	h.scene = b
}

func (h *Handler) SetDismountAppearance(p DismountAppearance) {
	h.appearance = p
}

func (h *Handler) Service() *appmount.Service {
	return h.service
}

func (h *Handler) IsOwnedDress(ctx *rtmp.RPCContext, dressID int) bool {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return false
	}
	owned, err := h.service.IsOwnedDress(ctx.Context, charID, dressID)
	if err != nil {
		h.logger.Error("mount IsOwnedDress failed", zap.Int64("char_id", charID), zap.Int("dress_id", dressID), zap.Error(err))
		return false
	}
	return owned
}

func (h *Handler) HasActiveMountDress(ctx *rtmp.RPCContext) bool {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return false
	}
	_, active, err := h.service.ActiveMountDress(ctx.Context, charID)
	if err != nil {
		h.logger.Error("mount ActiveMountDress failed", zap.Int64("char_id", charID), zap.Error(err))
		return false
	}
	return active
}

func (h *Handler) BeginMounting(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	if len(args) < 1 {
		return nil, nil
	}
	dressID, err := parseIntArg(args[0])
	if err != nil {
		return nil, nil
	}

	resCode, ok, err := h.service.BeginMountDress(ctx.Context, charID, dressID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}
	if !ok {
		return nil, nil
	}

	mountOn := map[string]interface{}{
		"cid":     charID,
		"resCode": resCode,
		"wp":      0,
	}
	h.broadcastScene(ctx, "onMountOn", mountOn)
	return nil, nil
}

func (h *Handler) StopMounting(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	wasActive, err := h.service.StopMountDress(ctx.Context, charID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}
	if !wasActive {
		return nil, nil
	}

	wp, ee, ef, star := "0", "0", false, "0"
	if h.appearance != nil {
		wp, ee, ef, star = h.appearance.MountDismountAppearance(ctx.Context, charID)
	}
	mountOff := map[string]interface{}{
		"cid":       charID,
		"isMountOn": false,
		"wp":        wp,
		"ee":        ee,
		"ef":        ef,
		"star":      star,
	}
	h.broadcastScene(ctx, "onMountOff", mountOff)
	return nil, nil
}

// RegisterRiding wires the shared beginMounting/stopMounting RPCs with mount-dress
// vs pet-ride routing. The decompiled client only ever sends these for a mount-dress
// (a TBL_MOUNT_DRESS id 1-20), but routing through the owned-dress predicate keeps
// pet-riding intact for any other id: beginMounting on a non-owned-dress id falls
// through to petRide, and stopMounting with no active dress falls through to
// petDismount (pass nil for a no-op when the pet handler has no dismount RPC).
func (h *Handler) RegisterRiding(d *rtmp.RPCDispatcher, petRide, petDismount rtmp.HandlerFunc) {
	d.Register("beginMounting", func(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
		if len(args) >= 1 {
			if dressID, err := parseIntArg(args[0]); err == nil && h.IsOwnedDress(ctx, dressID) {
				return h.BeginMounting(ctx, args)
			}
		}
		if petRide != nil {
			return petRide(ctx, args)
		}
		return nil, nil
	})
	d.Register("stopMounting", func(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
		if h.HasActiveMountDress(ctx) {
			return h.StopMounting(ctx, args)
		}
		if petDismount != nil {
			return petDismount(ctx, args)
		}
		return nil, nil
	})
}

func (h *Handler) PushUpdateDressList(conn *rtmp.Connection, action, dressID int, expiryMs int64) {
	if conn == nil {
		return
	}
	if err := conn.SendCallback("onUpdateDressList", action, dressID, expiryMs); err != nil {
		h.logger.Error("onUpdateDressList push failed", zap.Int("dress_id", dressID), zap.Error(err))
	}
}

func (h *Handler) broadcastScene(ctx *rtmp.RPCContext, callback string, payload map[string]interface{}) {
	if ctx == nil || ctx.Connection == nil {
		return
	}
	if h.scene == nil {
		_ = ctx.Connection.SendCallback(callback, payload)
		return
	}
	channelID := ctx.Connection.GetChannelID()
	mapID, _ := ctx.Connection.GetSceneInfo()
	h.scene.BroadcastToScene(channelID, mapID, 0, callback, payload)
}
