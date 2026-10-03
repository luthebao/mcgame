// Open-sourced by BaoLT

package group

import (
	"context"
	"strconv"

	domaingroup "mcgame-server/internal/domain/group"

	"go.uber.org/zap"
)

func (h *Handler) formatGroupForClient(ctx context.Context, g *domaingroup.Group) (map[string]interface{}, map[string]interface{}, interface{}) {
	if g == nil || len(g.Members) == 0 {
		return map[string]interface{}{}, map[string]interface{}{}, nil
	}

	groupCharactorList := make(map[string]interface{}, len(g.Members))
	groupAKFCidList := make(map[string]interface{})

	var headNode interface{}
	var currentNode interface{}
	memberCount := 0

	for _, member := range g.Members {
		memberData, err := h.groupCharacterPayload(ctx, member.CharID)
		if err != nil {
			h.logger.Warn("Failed to get character info for group member",
				zap.Int64("char_id", member.CharID),
				zap.Error(err))
			continue
		}

		memberData["isLeader"] = member.IsLeader
		memberData["afk"] = member.AFK
		memberData["inGroup"] = true
		memberData["inGroupWithTotal"] = true
		groupCharactorList[strconv.FormatInt(member.CharID, 10)] = memberData

		node := map[string]interface{}{
			"obj": member.CharID,
		}

		if headNode == nil {
			headNode = node
			currentNode = node
		} else {
			if prevNode, ok := currentNode.(map[string]interface{}); ok {
				prevNode["next"] = node
			}
			currentNode = node
		}

		if member.AFK {
			groupAKFCidList[strconv.FormatInt(member.CharID, 10)] = member.CharID
		}
		memberCount++
	}

	if headNode == nil {
		return groupCharactorList, groupAKFCidList, nil
	}

	return groupCharactorList, groupAKFCidList, map[string]interface{}{
		"head": headNode,
		"len":  memberCount,
	}
}

func (h *Handler) BroadcastGroupJoinedByID(ctx context.Context, groupID int64) {
	if h == nil || h.groupService == nil || groupID <= 0 {
		return
	}
	g, err := h.groupService.GetByID(ctx, groupID)
	if err != nil || g == nil {
		return
	}
	h.broadcastGroupJoined(ctx, g)
}

func (h *Handler) broadcastGroupJoined(ctx context.Context, g *domaingroup.Group) {
	if g == nil || h.lookupConnFn == nil {
		return
	}

	groupCharactorList, groupAKFCidList, mList := h.formatGroupForClient(ctx, g)
	callbackData := map[string]interface{}{
		"groupCharactorList": groupCharactorList,
		"groupAKFCidList":    groupAKFCidList,
		"groupafkId":         0,
	}
	if mList != nil {
		callbackData["mList"] = mList
	}

	h.logger.Info("broadcastGroupJoined: sending to members",
		zap.Int("total_members", len(g.Members)),
		zap.Int("member_list_size", len(groupCharactorList)))

	for _, member := range g.Members {
		if conn := h.lookupConnection(member.CharID); conn != nil {
			if err := h.sendCallback(conn, "onGroupJoined", callbackData); err != nil {
				h.logger.Warn("Failed to send onGroupJoined callback",
					zap.Int64("member_id", member.CharID),
					zap.Error(err))
			} else {
				h.logger.Info("Sent onGroupJoined callback to member",
					zap.Int64("member_id", member.CharID),
					zap.Int("member_list_size", len(groupCharactorList)))
			}
		} else {
			h.logger.Debug("Member is offline, skipping callback",
				zap.Int64("member_id", member.CharID))
		}
	}
}

func (h *Handler) broadcastGroupJoinedToRecipients(ctx context.Context, g *domaingroup.Group, recipientIDs []int64) {
	if g == nil || h.lookupConnFn == nil {
		return
	}

	groupCharactorList, groupAKFCidList, mList := h.formatGroupForClient(ctx, g)
	callbackData := map[string]interface{}{
		"groupCharactorList": groupCharactorList,
		"groupAKFCidList":    groupAKFCidList,
		"groupafkId":         0,
	}
	if mList != nil {
		callbackData["mList"] = mList
	}

	for _, recipientID := range recipientIDs {
		if conn := h.lookupConnection(recipientID); conn != nil {
			_ = h.sendCallback(conn, "onGroupJoined", callbackData)
		}
	}
}

func (h *Handler) broadcastGroupDismiss(ctx context.Context, g *domaingroup.Group) {
	if g == nil || h.lookupConnFn == nil {
		return
	}

	callbackData := h.groupDismissPayload(ctx, g)
	for _, member := range g.Members {
		if conn := h.lookupConnection(member.CharID); conn != nil {
			if err := h.sendCallback(conn, "onGroupDismiss", callbackData); err != nil {
				h.logger.Warn("Failed to send onGroupDismiss callback",
					zap.Int64("member_id", member.CharID),
					zap.Error(err))
			} else {
				h.logger.Info("Sent onGroupDismiss callback to member",
					zap.Int64("member_id", member.CharID))
			}
		}
	}
}

func (h *Handler) broadcastGroupDismissToRecipients(ctx context.Context, g *domaingroup.Group, recipientIDs []int64) {
	if g == nil || h.lookupConnFn == nil {
		return
	}

	callbackData := h.groupDismissPayload(ctx, g)
	for _, recipientID := range recipientIDs {
		if conn := h.lookupConnection(recipientID); conn != nil {
			_ = h.sendCallback(conn, "onGroupDismiss", callbackData)
		}
	}
}

func (h *Handler) broadcastGroupLeave(ctx context.Context, g *domaingroup.Group, departedID int64, departedName string, extraRecipientID int64) {
	if g == nil || h.lookupConnFn == nil {
		return
	}

	_, _, mList := h.formatGroupForClient(ctx, g)
	payload := map[string]interface{}{
		"sid":   departedID,
		"name":  departedName,
		"mList": mList,
	}

	recipientIDs := make(map[int64]struct{}, len(g.Members)+1)
	for _, member := range g.Members {
		recipientIDs[member.CharID] = struct{}{}
	}
	if extraRecipientID > 0 {
		recipientIDs[extraRecipientID] = struct{}{}
	}

	for recipientID := range recipientIDs {
		if conn := h.lookupConnection(recipientID); conn != nil {
			if err := h.sendCallback(conn, "onGroupLeave", payload); err != nil {
				h.logger.Warn("Failed to send onGroupLeave callback",
					zap.Int64("recipient_id", recipientID),
					zap.Int64("departed_id", departedID),
					zap.Error(err))
			}
		}
	}
}

func (h *Handler) broadcastGroupLeaveToRecipients(ctx context.Context, g *domaingroup.Group, departedID int64, departedName string, recipientIDs []int64) {
	if g == nil || h.lookupConnFn == nil {
		return
	}

	_, _, mList := h.formatGroupForClient(ctx, g)
	payload := map[string]interface{}{
		"sid":   departedID,
		"name":  departedName,
		"mList": mList,
	}

	for _, recipientID := range recipientIDs {
		if conn := h.lookupConnection(recipientID); conn != nil {
			_ = h.sendCallback(conn, "onGroupLeave", payload)
		}
	}
}

func (h *Handler) sendGroupDismissToCharacter(ctx context.Context, targetID int64, g *domaingroup.Group) {
	if g == nil || h.lookupConnFn == nil {
		return
	}

	if targetConn := h.lookupConnection(targetID); targetConn != nil {
		callbackData := h.groupDismissPayload(ctx, g)
		if err := h.sendCallback(targetConn, "onGroupDismiss", callbackData); err != nil {
			h.logger.Warn("Failed to send onGroupDismiss callback to kicked member",
				zap.Int64("target_id", targetID),
				zap.Error(err))
		} else {
			h.logger.Info("Sent onGroupDismiss to kicked member",
				zap.Int64("target_id", targetID))
		}
	}
}

func (h *Handler) broadcastGroupGiveLeader(ctx context.Context, g *domaingroup.Group, oldLeaderID int64, oldLeaderName string, newLeaderID int64, newLeaderName string, wasAFK bool) {
	if g == nil || h.lookupConnFn == nil {
		return
	}

	_, _, mList := h.formatGroupForClient(ctx, g)
	giveLeaderData := map[string]interface{}{
		"sid":     oldLeaderID,
		"oName":   oldLeaderName,
		"tid":     newLeaderID,
		"nName":   newLeaderName,
		"afkflag": wasAFK,
	}
	if mList != nil {
		giveLeaderData["mList"] = mList
	}

	for _, member := range g.Members {
		if conn := h.lookupConnection(member.CharID); conn != nil {
			if err := h.sendCallback(conn, "onGroupGiveLeader", giveLeaderData); err != nil {
				h.logger.Warn("Failed to send onGroupGiveLeader callback",
					zap.Int64("member_id", member.CharID),
					zap.Error(err))
			}
		}
	}
}

func (h *Handler) groupDismissPayload(ctx context.Context, g *domaingroup.Group) map[string]interface{} {
	_, _, mList := h.formatGroupForClient(ctx, g)
	if mListMap, ok := mList.(map[string]interface{}); ok {
		return mListMap
	}
	return map[string]interface{}{}
}
