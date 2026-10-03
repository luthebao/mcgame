// Open-sourced by BaoLT

package group

import (
	"context"
	"errors"

	appgroup "mcgame-server/internal/application/group"
	domaingroup "mcgame-server/internal/domain/group"
)

func groupMemberIDsExcept(groupInfo *domaingroup.Group, excludeID int64) []int64 {
	if groupInfo == nil {
		return nil
	}

	ids := make([]int64, 0, len(groupInfo.Members))
	for _, member := range groupInfo.Members {
		if member.CharID == excludeID {
			continue
		}
		ids = append(ids, member.CharID)
	}

	return ids
}

func (h *Handler) HandleCharacterDisconnect(ctx context.Context, characterID int64) error {
	if h == nil || h.groupService == nil {
		return nil
	}

	beforeGroup, err := h.groupService.GetGroupByMember(ctx, characterID)
	if err != nil || beforeGroup == nil {
		return nil
	}

	disconnectedName := ""
	if h.charService != nil {
		if char, charErr := h.charService.GetByID(ctx, characterID); charErr == nil && char != nil {
			disconnectedName = char.Name
		}
	}

	if beforeGroup.RoomOpen {
		return h.handleRoomDisconnect(ctx, beforeGroup, characterID, disconnectedName)
	}

	return h.handlePlainGroupDisconnect(ctx, beforeGroup, characterID, disconnectedName)
}

func (h *Handler) handlePlainGroupDisconnect(ctx context.Context, beforeGroup *domaingroup.Group, characterID int64, disconnectedName string) error {
	updatedGroup, oldGroup, err := h.groupService.Leave(ctx, characterID)
	if err != nil {
		if errors.Is(err, appgroup.ErrGroupNotFound) {
			return nil
		}
		return err
	}

	recipients := groupMemberIDsExcept(beforeGroup, characterID)
	if updatedGroup == nil && oldGroup != nil {
		h.broadcastGroupDismissToRecipients(ctx, oldGroup, recipients)
		return nil
	}
	if updatedGroup != nil {
		h.broadcastGroupLeaveToRecipients(ctx, updatedGroup, characterID, disconnectedName, recipients)
	}
	return nil
}

func (h *Handler) handleRoomDisconnect(ctx context.Context, beforeGroup *domaingroup.Group, characterID int64, disconnectedName string) error {
	updatedGroup, oldGroup, err := h.groupService.LeaveRoom(ctx, characterID)
	if err != nil {
		if errors.Is(err, appgroup.ErrGroupNotFound) || errors.Is(err, appgroup.ErrRoomNotFound) {
			return nil
		}
		return err
	}

	recipients := groupMemberIDsExcept(beforeGroup, characterID)
	memberPayload := map[string]interface{}{
		"cid":  characterID,
		"name": disconnectedName,
	}
	if updatedGroup != nil {
		memberPayload["leaderId"] = updatedGroup.LeaderID
	}

	for _, recipientID := range recipients {
		_ = h.sendCallbackToCharacter(recipientID, "onMemberLeave", memberPayload)
	}

	if updatedGroup == nil && oldGroup != nil {
		h.broadcastGroupDismissToRecipients(ctx, oldGroup, recipients)
		return nil
	}

	if updatedGroup != nil {
		h.broadcastGroupJoinedToRecipients(ctx, updatedGroup, recipients)
		if beforeGroup.LeaderID == characterID && updatedGroup.LeaderID != characterID {
			for _, recipientID := range recipients {
				_ = h.sendCallbackToCharacter(recipientID, "onSetRoomHost", int(updatedGroup.LeaderID))
			}
		}
	}
	return nil
}
