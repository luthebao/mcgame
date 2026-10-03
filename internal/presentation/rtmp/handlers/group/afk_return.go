// Open-sourced by BaoLT

package group

import (
	"errors"
	"strconv"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

const returnTeamTemplateID = 3552

func shouldUseNearbyReturn(args []interface{}) bool {
	if len(args) == 0 {
		return false
	}

	flag, err := parseBoolArg(args[0])
	if err != nil {
		return false
	}

	return flag
}

func (h *Handler) returnFromAFKRemote(ctx *rtmp.RPCContext) (interface{}, error) {
	charID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	g, err := h.groupService.GetGroupByMember(ctx.Context, charID)
	if err != nil {
		return map[string]interface{}{"success": false, "error": err.Error()}, nil
	}
	if g == nil {
		return map[string]interface{}{"success": false, "error": "group not found"}, nil
	}

	targetMapID, targetX, targetY, targetLine, err := h.resolveGroupLeaderReturnPoint(ctx, g.LeaderID)
	if err != nil {
		return map[string]interface{}{"success": false, "error": err.Error()}, nil
	}

	if err := h.consumeReturnTeamItem(ctx, charID); err != nil {
		_ = h.sendCallback(ctx.Connection, "onMidNote", "Cần Sách Hồi Nhóm mới có thể hồi nhóm")
		return map[string]interface{}{"success": false, "error": err.Error()}, nil
	}

	if err := h.teleportCharacterToGroupLeader(ctx, charID, targetMapID, targetX, targetY, targetLine); err != nil {
		return map[string]interface{}{"success": false, "error": err.Error()}, nil
	}

	return h.setAFK(ctx, false, map[string]interface{}{
		"line":     targetLine,
		"posMapId": strconv.Itoa(targetMapID),
	})
}

func (h *Handler) resolveGroupLeaderReturnPoint(ctx *rtmp.RPCContext, leaderID int64) (int, int, int, int, error) {
	leaderChar, err := h.charService.GetByID(ctx.Context, leaderID)
	if err != nil {
		return 0, 0, 0, 0, err
	}

	targetMapID := leaderChar.MapID
	targetX := leaderChar.PosX
	targetY := leaderChar.PosY
	targetLine := ctx.Connection.GetChannelID()

	if leaderConn := h.lookupConnection(leaderID); leaderConn != nil {
		if mapID, _ := leaderConn.GetSceneInfo(); mapID > 0 {
			targetMapID = mapID
		}
		if line := leaderConn.GetChannelID(); line > 0 {
			targetLine = line
		}
	}

	if (targetX <= 0 || targetY <= 0) && h.sceneService != nil {
		targetX, targetY = h.sceneService.GetSafePoint(targetMapID)
	}

	if targetX <= 0 {
		targetX = leaderChar.PosX
	}
	if targetY <= 0 {
		targetY = leaderChar.PosY
	}

	return targetMapID, targetX, targetY, targetLine, nil
}

func (h *Handler) consumeReturnTeamItem(ctx *rtmp.RPCContext, charID int64) error {
	if h.itemService == nil {
		return nil
	}

	consumedItem, _, err := h.itemService.ConsumeItemByTemplateIDs(ctx.Context, charID, []int{returnTeamTemplateID})
	if err != nil {
		return err
	}
	if consumedItem == nil {
		return errors.New("missing return team item")
	}

	h.sendConsumedItemCallback(ctx, consumedItem)

	return nil
}

func (h *Handler) teleportCharacterToGroupLeader(ctx *rtmp.RPCContext, charID int64, mapID int, x int, y int, line int) error {
	oldMapID, _ := ctx.Connection.GetSceneInfo()
	isRoomChange := oldMapID > 0 && oldMapID != mapID

	pos := domainchar.Position{MapID: mapID, X: x, Y: y, Direction: 0}
	if err := h.charService.UpdatePosition(ctx.Context, charID, pos); err != nil {
		return err
	}

	if isRoomChange && h.sceneManager != nil {
		channelID := ctx.Connection.GetChannelID()
		h.sceneManager.BroadcastToScene(channelID, oldMapID, ctx.ConnID, "onCharLeaveScene", charID)
		ctx.Connection.SetSceneInfo(mapID, charID)
		h.sceneManager.MoveToScene(channelID, oldMapID, mapID, ctx.Connection)

		if line > 0 {
			ctx.Connection.SetChannelID(line)
		}

		if err := h.sendSceneResetCallbacks(ctx.Connection); err != nil {
			h.logger.Error("returnFromAFKRemote: failed to send scene reset", zap.Error(err))
		}
		if err := h.sendCallback(ctx.Connection, "onSceneEnter", mapID, x, y, -1); err != nil {
			return err
		}

		char, err := h.charService.GetByID(ctx.Context, charID)
		if err == nil && h.sceneService != nil {
			char.MapID = mapID
			char.PosX = x
			char.PosY = y
			playerData := h.sceneService.GetCharacterForClient(char)
			h.attachGroupShowPetObject(ctx.Context, charID, playerData)
			h.sceneManager.BroadcastToScene(ctx.Connection.GetChannelID(), mapID, ctx.ConnID, "onScenePlayerEntered", playerData)
		}

		return nil
	}

	ctx.Connection.SetSceneInfo(mapID, charID)
	if line > 0 {
		ctx.Connection.SetChannelID(line)
	}

	return h.sendCallback(ctx.Connection, "onSceneTo", x, y)
}

func (h *Handler) sendConsumedItemCallback(ctx *rtmp.RPCContext, consumedItem *domainitem.Item) {
	if ctx == nil || ctx.Connection == nil || consumedItem == nil {
		return
	}

	sid := float64(consumedItem.CalculateSID())
	if consumedItem.StackCount <= 0 {
		_ = h.sendCallback(ctx.Connection, "onDelCharactorSlot", float64(consumedItem.ID), sid)
		return
	}

	_ = h.sendCallback(ctx.Connection, "onUpChaSlotStackNum", float64(consumedItem.ID), float64(consumedItem.StackCount), sid)
}

func (h *Handler) sendSceneResetCallbacks(conn *rtmp.Connection) error {
	if err := h.sendCallback(conn, "onCreateNpcs", map[string]interface{}{}); err != nil {
		return err
	}
	return h.sendCallback(conn, "onCreateBoss", map[string]interface{}{})
}
