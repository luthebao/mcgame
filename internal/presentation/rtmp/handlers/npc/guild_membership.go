// Open-sourced by BaoLT

package npc

import "context"

func (h *Handler) hasGuildMembership(ctx context.Context, characterID int64) (bool, error) {
	char, err := h.charService.GetByID(ctx, characterID)
	if err != nil {
		return false, err
	}
	if char != nil && char.GuildID != nil && *char.GuildID > 0 {
		return true, nil
	}
	if h.guildService == nil {
		return false, nil
	}
	guildItem, err := h.guildService.GetGuildByMember(ctx, characterID)
	if err != nil {
		return false, err
	}
	return guildItem != nil, nil
}
