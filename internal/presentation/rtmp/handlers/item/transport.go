// Open-sourced by BaoLT

package item

import (
	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const (
	itemTransportRegular         = 1036
	itemTransportMonth           = 1363
	itemTransportHalfMonth       = 2946
	itemTransportWeek            = 1515
	itemTransportSenior          = 2947
	itemTransportSeniorWeek      = 2948
	itemTransportSeniorHalfMonth = 2949
	itemTransportSeniorMonth     = 2950
	itemTransportSeniorWeekTrue  = 3722
	itemTransportSeniorHalfDay   = 4941
	itemTransportSeniorDay       = 4942
)

const (
	transportRegularGoldCost int64 = 3
	transportSeniorGoldCost  int64 = 5
)

var transportSeniorPriority = []int{
	itemTransportSenior,
	itemTransportSeniorWeek,
	itemTransportSeniorHalfMonth,
	itemTransportSeniorMonth,
	itemTransportSeniorWeekTrue,
	itemTransportSeniorHalfDay,
	itemTransportSeniorDay,
}

var transportRegularPriority = append([]int{
	itemTransportRegular,
	itemTransportMonth,
	itemTransportHalfMonth,
	itemTransportWeek,
}, transportSeniorPriority...)

func (h *Handler) UseTransport(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	return h.handleTransport(ctx, args, transportRegularPriority, transportRegularGoldCost, false)
}

func (h *Handler) UseTransportGroup(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, nil
	}

	characterID, err := currentItemCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	isLeader := false
	if h.groupService != nil {
		leader, lerr := h.groupService.IsGroupLeader(ctx.Context, characterID)
		if lerr == nil {
			isLeader = leader
		}
	}

	if !isLeader {
		return h.handleTransport(ctx, args, transportRegularPriority, transportRegularGoldCost, false)
	}

	return h.handleTransport(ctx, args, transportSeniorPriority, transportSeniorGoldCost, true)
}

func (h *Handler) handleTransport(
	ctx *rtmp.RPCContext,
	args []interface{},
	itemPriority []int,
	goldCost int64,
	isGroupTransport bool,
) (interface{}, error) {
	if len(args) < 1 {
		return nil, nil
	}

	mapIDRaw, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, nil
	}
	newMapID := int(mapIDRaw)

	characterID, err := currentItemCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	return h.chargeAndTransport(ctx, characterID, newMapID, itemPriority, goldCost, isGroupTransport)
}

func (h *Handler) chargeAndTransport(
	ctx *rtmp.RPCContext,
	characterID int64,
	newMapID int,
	itemPriority []int,
	goldCost int64,
	isGroupTransport bool,
) (interface{}, error) {
	if !h.isTeleportableMap(newMapID) {
		return nil, nil
	}

	consumedItem, templateID, err := h.consumePreferredItem(ctx, characterID, itemPriority)
	if err != nil {
		return nil, err
	}

	var paidWithGold bool
	var char *character.Character
	if consumedItem == nil {
		char, err = h.charService.GetByID(ctx.Context, characterID)
		if err != nil || char == nil {
			return nil, err
		}
		if !charHasGold(char, goldCost) {
			_ = ctx.Connection.SendCallback("onSystemMidMsgOrNote", "Bạn không có Tiêu Diêu Phù và không đủ Vàng để dịch chuyển.")
			return nil, nil
		}
		charDeductGold(char, goldCost)
		if err := h.charService.Update(ctx.Context, char); err != nil {
			return nil, err
		}
		paidWithGold = true
	}

	if err := h.performTransport(ctx, characterID, newMapID, isGroupTransport, templateID); err != nil {
		return nil, err
	}

	h.sendTransportCostCallback(ctx, consumedItem, char, paidWithGold)

	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) sendTransportCostCallback(ctx *rtmp.RPCContext, consumedItem *domainitem.Item, char *character.Character, paidWithGold bool) {
	if consumedItem != nil {
		h.sendConsumedItemCallback(ctx, consumedItem)
		return
	}
	if paidWithGold && char != nil {
		_ = ctx.Connection.SendCallback("onUPP", charGoldUpdatePayload(char))
	}
}

func (h *Handler) isTeleportableMap(mapID int) bool {
	if mapID <= 0 || h.gameData == nil {
		return false
	}
	tpl := h.gameData.GetMap(mapID)
	if tpl == nil {
		return false
	}
	return tpl.T > 0
}

func (h *Handler) performTransport(
	ctx *rtmp.RPCContext,
	characterID int64,
	newMapID int,
	isGroupTransport bool,
	templateID int,
) error {
	if newMapID <= 0 {
		return pkgerrors.ErrInvalidArgs
	}

	if !isGroupTransport {
		h.removeSelfFromPlainGroup(ctx.Context, characterID)
	}

	oldRoomID, _ := ctx.Connection.GetSceneInfo()
	safeX, safeY := h.sceneService.GetSafePoint(newMapID)

	h.logger.Info("performTransport teleport",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("char_id", characterID),
		zap.Int("tid", templateID),
		zap.Bool("group_transport", isGroupTransport),
		zap.Int("old_room_id", oldRoomID),
		zap.Int("new_room_id", newMapID),
		zap.Int("dest_x", safeX),
		zap.Int("dest_y", safeY))

	channelID := ctx.Connection.GetChannelID()
	if oldRoomID != 0 && oldRoomID != newMapID {
		h.sceneManager.BroadcastToScene(channelID, oldRoomID, ctx.ConnID, "onCharLeaveScene", characterID)
		ctx.Connection.SetSceneInfo(newMapID, characterID)
		h.sceneManager.MoveToScene(channelID, oldRoomID, newMapID, ctx.Connection)
	} else if oldRoomID == 0 {
		ctx.Connection.SetSceneInfo(newMapID, characterID)
		h.sceneManager.AddToScene(channelID, newMapID, ctx.Connection)
	}

	h.charService.UpdatePosition(ctx.Context, characterID, character.Position{MapID: newMapID, X: safeX, Y: safeY})
	_ = rtmputils.UpsertSocialPresence(ctx.Context, h.presenceStore, characterID, "", newMapID, safeX, safeY, channelID)
	if err := h.sendSceneResetCallbacks(ctx.Connection); err != nil {
		h.logger.Error("Failed to send scene reset callbacks", zap.Error(err))
	}
	ctx.Connection.ResetSceneEntryRateLimits()

	if err := ctx.Connection.SendCallback("onSceneEnter", newMapID, safeX, safeY, -1); err != nil {
		h.logger.Error("Failed to send onSceneEnter callback", zap.Error(err))
	}

	h.scenePopulationDeps().PushOnCreateChars(ctx.Context, ctx.Connection, channelID, newMapID, characterID)

	if oldRoomID != 0 && oldRoomID != newMapID {
		char, err := h.charService.GetByID(ctx.Context, characterID)
		if err == nil {
			char.MapID = newMapID
			char.PosX = safeX
			char.PosY = safeY
			playerData := h.sceneService.GetCharacterForClient(char)
			h.sceneManager.BroadcastToScene(channelID, newMapID, ctx.ConnID, "onScenePlayerEntered", playerData)
		}

		if isGroupTransport {
			h.groupTransportDeps().FollowLeaderToMap(ctx.Context, characterID, oldRoomID, newMapID, safeX, safeY)
		}
	}

	return nil
}
