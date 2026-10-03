// Open-sourced by BaoLT

package group

import (
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) GroupGiveLeader(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("GroupGiveLeader called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	newLeaderID, err := parseInt64Arg(args[0])
	if err != nil {
		return nil, err
	}
	leaderID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	if newLeaderID == leaderID {
		h.logger.Warn("GroupGiveLeader: cannot transfer leadership to self",
			zap.Int64("leader_id", leaderID))
		return map[string]interface{}{
			"success": false,
			"error":   "cannot transfer leadership to yourself",
		}, nil
	}

	oldLeaderChar, err := h.charService.GetByID(ctx.Context, leaderID)
	if err != nil {
		h.logger.Warn("GroupGiveLeader: current leader character not found",
			zap.Int64("leader_id", leaderID),
			zap.Error(err))
		return map[string]interface{}{
			"success": false,
			"error":   "current leader not found",
		}, nil
	}

	newLeaderChar, err := h.charService.GetByID(ctx.Context, newLeaderID)
	if err != nil {
		h.logger.Warn("GroupGiveLeader: new leader character not found",
			zap.Int64("new_leader_id", newLeaderID),
			zap.Error(err))
		return map[string]interface{}{
			"success": false,
			"error":   "new leader not found",
		}, nil
	}

	oldGroup, _ := h.groupService.GetGroupByMember(ctx.Context, leaderID)
	wasAFK := false
	if oldGroup != nil {
		for _, member := range oldGroup.Members {
			if member.CharID == newLeaderID {
				wasAFK = member.AFK
				break
			}
		}
	}

	g, err := h.groupService.GiveLeader(ctx.Context, leaderID, newLeaderID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.broadcastGroupJoined(ctx.Context, g)
	h.broadcastGroupGiveLeader(ctx.Context, g, leaderID, oldLeaderChar.Name, newLeaderID, newLeaderChar.Name, wasAFK)

	h.logger.Info("GroupGiveLeader: successfully transferred leadership",
		zap.Int64("old_leader_id", leaderID),
		zap.String("old_leader_name", oldLeaderChar.Name),
		zap.Int64("new_leader_id", newLeaderID),
		zap.String("new_leader_name", newLeaderChar.Name),
		zap.Bool("was_afk", wasAFK),
		zap.Int64("group_id", g.ID))

	return successGroupResponse(g), nil
}
