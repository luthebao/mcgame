// Open-sourced by BaoLT

package group

import (
	"context"

	domaingroup "mcgame-server/internal/domain/group"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) GroupLeave(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("GroupLeave called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	memberID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	memberChar, err := h.charService.GetByID(ctx.Context, memberID)
	if err != nil {
		return nil, err
	}

	g, oldGroup, err := h.groupService.Leave(ctx.Context, memberID)
	if err != nil {
		return map[string]interface{}{"success": false, "error": err.Error()}, nil
	}

	if g == nil && oldGroup != nil {
		h.broadcastGroupDismiss(ctx.Context, oldGroup)
	} else if g != nil {
		h.broadcastGroupLeave(ctx.Context, g, memberID, memberChar.Name, memberID)
	}

	return successGroupResponse(g), nil
}

func (h *Handler) LeaveGroupForPersonalTransport(ctx context.Context, charID int64) {
	if h == nil || h.groupService == nil || charID <= 0 {
		return
	}

	existing, _ := h.groupService.GetGroupByMember(ctx, charID)
	if existing == nil || existing.RoomOpen {
		return
	}

	memberChar, err := h.charService.GetByID(ctx, charID)
	if err != nil {
		return
	}

	g, oldGroup, err := h.groupService.Leave(ctx, charID)
	if err != nil {
		return
	}

	if g == nil && oldGroup != nil {
		h.broadcastGroupDismiss(ctx, oldGroup)
		return
	}
	if g != nil {
		h.broadcastGroupLeave(ctx, g, charID, memberChar.Name, charID)
	}
}

func (h *Handler) GroupKick(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("GroupKick called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	targetID, err := parseInt64Arg(args[0])
	if err != nil {
		return nil, err
	}
	targetChar, err := h.charService.GetByID(ctx.Context, targetID)
	if err != nil {
		return nil, err
	}
	leaderID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	g, oldGroup, err := h.groupService.Kick(ctx.Context, leaderID, targetID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	if g == nil && oldGroup != nil {
		h.broadcastGroupDismiss(ctx.Context, oldGroup)

		h.logger.Info("GroupKick: group disbanded after kick (only 1 member left)",
			zap.Int64("leader_id", leaderID),
			zap.Int64("target_id", targetID))

		return successGroupResponse(nil), nil
	}

	if g != nil {
		h.broadcastGroupLeave(ctx.Context, g, targetID, targetChar.Name, targetID)
	}

	h.logger.Info("GroupKick: successfully kicked member",
		zap.Int64("leader_id", leaderID),
		zap.Int64("target_id", targetID),
		zap.Int("remaining_members", len(g.Members)))

	return successGroupResponse(g), nil
}

func (h *Handler) GroupAFK(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("GroupAFK called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	return h.setAFK(ctx, true, nil)
}

func (h *Handler) UnGroupAFK(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("UnGroupAFK called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	if shouldUseNearbyReturn(args) {
		return h.setAFK(ctx, false, nil)
	}
	return h.returnFromAFKRemote(ctx)
}

func (h *Handler) GroupListOfMap(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("GroupListOfMap called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	mapID := 0
	if len(args) > 0 {
		mapIDValue, err := parseInt64Arg(args[0])
		if err != nil {
			return map[string]interface{}{"success": false, "error": err.Error()}, nil
		}
		mapID = int(mapIDValue)
	}

	groups, err := h.groupService.ListByMap(ctx.Context, mapID)
	if err != nil {
		return map[string]interface{}{"success": false, "error": err.Error()}, nil
	}

	groupDTOs := make([]interface{}, 0, len(groups))
	for _, g := range groups {
		groupDTOs = append(groupDTOs, g.ToDTO())
	}

	return map[string]interface{}{
		"success": true,
		"groups":  groupDTOs,
	}, nil
}

func (h *Handler) GetGroupMemberPosition(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("GetGroupMemberPosition called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))

	targetID, err := h.resolvePositionTargetID(ctx, args)
	if err != nil {
		return map[string]interface{}{"success": false, "error": err.Error()}, nil
	}

	char, err := h.charService.GetByID(ctx.Context, targetID)
	if err != nil {
		h.logger.Warn("GetGroupMemberPosition: character not found",
			zap.Int64("target_id", targetID),
			zap.Error(err))
		return map[string]interface{}{"success": false, "error": "character not found"}, nil
	}

	return map[string]interface{}{
		"success": true,
		"map":     char.MapID,
		"x":       char.PosX,
		"y":       char.PosY,
	}, nil
}

func (h *Handler) setAFK(ctx *rtmp.RPCContext, flag bool, extras map[string]interface{}) (interface{}, error) {
	charID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	g, err := h.groupService.SetAFK(ctx.Context, charID, flag)
	if err != nil {
		return map[string]interface{}{"success": false, "error": err.Error()}, nil
	}

	h.broadcastGroupAFK(ctx.Context, g, charID, flag, extras)

	return successGroupResponse(g), nil
}

func (h *Handler) resolvePositionTargetID(ctx *rtmp.RPCContext, args []interface{}) (int64, error) {
	if len(args) > 0 {
		return parseInt64Arg(args[0])
	}
	return currentCharacterID(ctx)
}

func (h *Handler) broadcastGroupAFK(ctx context.Context, g *domaingroup.Group, charID int64, afk bool, extras map[string]interface{}) {
	if g == nil || h.lookupConnFn == nil {
		return
	}

	_, _, mList := h.formatGroupForClient(ctx, g)
	afkData := map[string]interface{}{
		"cid":   charID,
		"mList": mList,
	}
	for key, value := range extras {
		afkData[key] = value
	}
	callbackName := "setCharactorAfk"
	if !afk {
		callbackName = "unSetCharactorAfk"
	}

	for _, member := range g.Members {
		if conn := h.lookupConnection(member.CharID); conn != nil {
			_ = h.sendCallback(conn, callbackName, afkData)
		}
	}
}
