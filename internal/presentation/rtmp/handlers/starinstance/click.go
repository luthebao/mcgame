// Open-sourced by BaoLT

// ClickWarMap handler initiates a star instance battle with validation for all party members.
package starinstance

import (
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) ClickWarMap(ctx *rtmp.RPCContext, args []any) (any, error) {
	h.logger.Info("ClickWarMap called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	charID, ok := characterIDFromCtx(ctx)
	if !ok {
		return map[string]any{"c": 0}, nil
	}

	if len(args) < 2 {
		return map[string]any{"c": 0}, nil
	}
	sid, err := parseIntArg(args[0])
	if err != nil || sid < 1 || sid > 12 {
		return map[string]any{"c": 0}, nil
	}
	level, err := parseIntArg(args[1])
	if err != nil || level < 1 || level > 12 {
		return map[string]any{"c": 0}, nil
	}

	partyIDs := h.resolvePartyMembers(ctx, charID)

	result, err := h.service.ClickWarMap(ctx.Context, charID, partyIDs, sid, level)
	if err != nil {
		h.logger.Error("ClickWarMap: service error",
			zap.Int64("char_id", charID),
			zap.Error(err))
		return map[string]any{"c": 0}, nil
	}

	if result.Code != 1 {
		resp := map[string]any{
			"c": result.Code,
			"d": map[string]any{
				"id":   result.OffenderID,
				"name": result.OffenderName,
			},
		}
		h.logger.Warn("ClickWarMap: validation failed",
			zap.Int64("char_id", charID),
			zap.Int("code", result.Code),
			zap.Int64("offender_id", result.OffenderID),
			zap.String("offender_name", result.OffenderName))
		return resp, nil
	}

	if ctx.Connection != nil {
		_ = ctx.Connection.SendCallback("updateWarMapStatus", map[string]any{
			"snum": 1,
		})
	}

	h.logger.Info("ClickWarMap: success — battle pending",
		zap.Int64("char_id", charID),
		zap.Int("sid", sid),
		zap.Int("level", level))

	return map[string]any{"c": 1}, nil
}

func (h *Handler) resolvePartyMembers(ctx *rtmp.RPCContext, leaderID int64) []int64 {
	if h.groupService == nil {
		return nil
	}
	group, err := h.groupService.GetGroupByMember(ctx.Context, leaderID)
	if err != nil || group == nil || group.LeaderID != leaderID {
		return nil
	}
	ids := make([]int64, 0, len(group.Members))
	for _, m := range group.Members {
		if m.AFK || m.CharID == leaderID {
			continue
		}
		ids = append(ids, m.CharID)
	}
	return ids
}
