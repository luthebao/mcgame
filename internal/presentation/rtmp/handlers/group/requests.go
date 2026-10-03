// Open-sourced by BaoLT

package group

import (
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) GroupInvite(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	targetID, err := parseInt64Arg(args[0])
	if err != nil {
		return nil, err
	}

	leaderID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	if targetID == leaderID {
		return nil, pkgerrors.ErrInvalidInput
	}

	leaderChar, err := h.charService.GetByID(ctx.Context, leaderID)
	if err != nil {
		h.logger.Warn("GroupInvite: leader character not found",
			zap.Int64("leader_id", leaderID),
			zap.Error(err))
		return nil, err
	}

	targetChar, err := h.charService.GetByID(ctx.Context, targetID)
	if err != nil {
		h.logger.Warn("GroupInvite: target character not found",
			zap.Int64("target_id", targetID),
			zap.Error(err))
		return nil, err
	}

	g, err := h.groupService.Invite(ctx.Context, leaderID, targetID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Group invite sent",
		zap.Int64("leader_id", leaderID),
		zap.String("leader_name", leaderChar.Name),
		zap.Int64("target_id", targetID),
		zap.String("target_name", targetChar.Name))

	inviteSentData := map[string]interface{}{
		"pid":  targetID,
		"name": targetChar.Name,
	}
	if err := h.sendCallback(ctx.Connection, "onGroupInviteSent", inviteSentData); err != nil {
		h.logger.Warn("Failed to send onGroupInviteSent callback to inviter",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	if targetConn := h.lookupConnection(targetID); targetConn != nil {
		dis := ""
		if leaderChar.MapID != targetChar.MapID {
			dis = "far"
		}

		invitedData := map[string]interface{}{
			"pid":  leaderID,
			"name": leaderChar.Name,
		}
		if dis != "" {
			invitedData["dis"] = dis
		}

		if err := h.sendCallback(targetConn, "onGroupInvited", invitedData); err != nil {
			h.logger.Warn("Failed to send onGroupInvited callback to target",
				zap.Int64("target_id", targetID),
				zap.Error(err))
		} else {
			h.logger.Info("Group invite notification sent to target",
				zap.Int64("target_id", targetID),
				zap.Int64("leader_id", leaderID))
		}
	} else {
		h.logger.Debug("GroupInvite: target player is offline",
			zap.Int64("target_id", targetID))
	}

	return successGroupResponse(g), nil
}

func (h *Handler) GroupJoin(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("GroupJoin called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	if len(args) < 1 {
		return map[string]interface{}{"success": false}, nil
	}

	leaderID, err := parseInt64Arg(args[0])
	if err != nil {
		return map[string]interface{}{"success": false}, nil
	}
	joinerID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	h.logger.Info("GroupJoin: attempting to join group",
		zap.Int64("joiner_id", joinerID),
		zap.Int64("leader_id", leaderID))

	g, err := h.groupService.Join(ctx.Context, leaderID, joinerID)
	if err != nil {
		h.logger.Warn("GroupJoin: failed to join group",
			zap.Int64("joiner_id", joinerID),
			zap.Int64("leader_id", leaderID),
			zap.Error(err))
		return map[string]interface{}{"success": false, "error": err.Error()}, nil
	}

	h.logger.Info("GroupJoin: successfully joined group",
		zap.Int64("joiner_id", joinerID),
		zap.Int64("leader_id", leaderID),
		zap.Int64("group_id", g.ID),
		zap.Int("member_count", len(g.Members)))

	h.broadcastGroupJoined(ctx.Context, g)

	return successGroupResponse(g), nil
}

func (h *Handler) GroupReqDeny(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("GroupReqDeny called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	if len(args) < 1 {
		return map[string]interface{}{"success": false}, nil
	}

	targetID, err := parseInt64Arg(args[0])
	if err != nil {
		return map[string]interface{}{"success": false, "error": err.Error()}, nil
	}

	currentID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	currentChar, err := h.charService.GetByID(ctx.Context, currentID)
	if err != nil {
		return map[string]interface{}{"success": false, "error": err.Error()}, nil
	}

	targetConn := h.lookupConnection(targetID)
	if targetConn != nil {
		callbackName := "onGroupDeny"
		if isLeader, leaderErr := h.groupService.IsGroupLeader(ctx.Context, currentID); leaderErr == nil && isLeader {
			callbackName = "onGroupRequestDeny"
		}

		payload := map[string]interface{}{
			"cid":  currentID,
			"name": currentChar.Name,
		}

		if err := h.sendCallback(targetConn, callbackName, payload); err != nil {
			h.logger.Warn("GroupReqDeny: failed to send deny callback",
				zap.Int64("source_id", currentID),
				zap.Int64("target_id", targetID),
				zap.String("callback", callbackName),
				zap.Error(err))
		}
	}

	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) GroupAdd(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("GroupAdd called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	if len(args) < 1 {
		return map[string]interface{}{"success": false}, nil
	}

	targetID, err := parseInt64Arg(args[0])
	if err != nil {
		return map[string]interface{}{"success": false}, nil
	}
	leaderID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	g, err := h.groupService.Join(ctx.Context, leaderID, targetID)
	if err != nil {
		h.logger.Warn("GroupAdd: failed to add member to group",
			zap.Int64("leader_id", leaderID),
			zap.Int64("target_id", targetID),
			zap.Error(err))
		return map[string]interface{}{"success": false, "error": err.Error()}, nil
	}

	h.logger.Info("GroupAdd: successfully added member to group",
		zap.Int64("leader_id", leaderID),
		zap.Int64("target_id", targetID),
		zap.Int64("group_id", g.ID))

	h.broadcastGroupJoined(ctx.Context, g)

	return successGroupResponse(g), nil
}

func (h *Handler) GroupRequest(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("GroupRequest called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	if len(args) < 1 {
		return map[string]interface{}{"success": false}, nil
	}

	leaderID, err := parseInt64Arg(args[0])
	if err != nil {
		return map[string]interface{}{"success": false}, nil
	}
	joinerID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	if leaderID == joinerID {
		return map[string]interface{}{"success": false, "error": "cannot request to join own group"}, nil
	}

	g, err := h.groupService.GetGroupByMember(ctx.Context, leaderID)
	if err != nil || g == nil {
		h.logger.Warn("GroupRequest: leader has no group",
			zap.Int64("leader_id", leaderID),
			zap.Error(err))
		return map[string]interface{}{"success": false, "error": "leader has no group"}, nil
	}

	existingGroup, _ := h.groupService.GetGroupByMember(ctx.Context, joinerID)
	if existingGroup != nil {
		h.logger.Warn("GroupRequest: joiner already in a group",
			zap.Int64("joiner_id", joinerID))
		return map[string]interface{}{"success": false, "error": "already in a group"}, nil
	}

	joinerChar, err := h.charService.GetByID(ctx.Context, joinerID)
	if err != nil {
		h.logger.Warn("GroupRequest: joiner character not found",
			zap.Int64("joiner_id", joinerID),
			zap.Error(err))
		return map[string]interface{}{"success": false, "error": "character not found"}, nil
	}

	if leaderConn := h.lookupConnection(leaderID); leaderConn != nil {
		requestData := map[string]interface{}{
			"id":      joinerID,
			"name":    joinerChar.Name,
			"exp":     joinerChar.Experience,
			"classId": joinerChar.ClassID,
		}

		if err := h.sendCallback(leaderConn, "onGroupRequest", requestData); err != nil {
			h.logger.Warn("Failed to send onGroupRequest callback to leader",
				zap.Int64("leader_id", leaderID),
				zap.Int64("joiner_id", joinerID),
				zap.Error(err))
		} else {
			h.logger.Info("Sent onGroupRequest to leader",
				zap.Int64("leader_id", leaderID),
				zap.Int64("joiner_id", joinerID),
				zap.String("joiner_name", joinerChar.Name))
		}
	} else {
		h.logger.Debug("Leader is offline, cannot send onGroupRequest",
			zap.Int64("leader_id", leaderID))
	}

	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) ReqAddGroup(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("ReqAddGroup called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	if len(args) < 1 {
		return map[string]interface{}{"success": true}, nil
	}

	leaderID, err := parseInt64Arg(args[0])
	if err != nil {
		return map[string]interface{}{"success": false}, nil
	}
	joinerID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	g, err := h.groupService.Join(ctx.Context, leaderID, joinerID)
	if err != nil {
		return map[string]interface{}{"success": false, "error": err.Error()}, nil
	}

	h.broadcastGroupJoined(ctx.Context, g)

	return successGroupResponse(g), nil
}

func (h *Handler) GroupReqSuccNotice(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("GroupReqSuccNotice called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	return map[string]interface{}{"success": true}, nil
}
