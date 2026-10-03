// Open-sourced by BaoLT

// Item reward callbacks keep Flash client state in sync after flexible box rewards.
package item

import (
	"strconv"

	appitem "mcgame-server/internal/application/item"
	domainbuff "mcgame-server/internal/domain/buff"
	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"

	"go.uber.org/zap"
)

func (h *Handler) sendStructuredRewardCallbacks(ctx *rtmp.RPCContext, result map[string]interface{}, char *domainchar.Character) {
	if h == nil || ctx == nil || ctx.Connection == nil || result == nil || char == nil {
		return
	}

	if titles, ok := result["granted_titles"].([]appitem.GrantedTitleResult); ok {
		for _, title := range titles {
			if !title.Added {
				continue
			}
			rtmputils.SendTitleGrantedCallback(ctx.Connection, title.TitleID, title.Titles, title.SpecialTitles, title.IsSpecial)
		}
	}

	if buffs, ok := result["granted_buffs"].([]*domainbuff.Buff); ok && h.buffService != nil {
		for _, buff := range buffs {
			if buff == nil {
				continue
			}
			_ = ctx.Connection.SendCallback("upLongBuff", h.buffService.BuildLongBuffPayload(buff))
		}
	}

	if grants, ok := result["granted_currencies"].([]appitem.GrantedCurrencyResult); ok {
		for _, grant := range grants {
			if grant.ClientKey == "" || grant.Delta <= 0 {
				continue
			}
			_ = ctx.Connection.SendCallback(
				"onAddMoney",
				float64(char.ID),
				grant.ClientKey,
				float64(grant.Delta),
				grant.Total,
			)
		}
	}

	if skillIDs, ok := result["granted_skill_ids"].([]int); ok && len(skillIDs) > 0 && h.skillService != nil {
		skills, err := h.skillService.GetSkillsForCallback(ctx.Context, char.ID)
		if err != nil {
			if h.logger != nil {
				h.logger.Warn("Failed to refresh skill callbacks after item reward",
					zap.Uint32("conn_id", ctx.ConnID),
					zap.Int64("character_id", char.ID),
					zap.Error(err))
			}
		} else {
			_ = ctx.Connection.SendCallback("onSkillUpdate", skills)
			_ = ctx.Connection.SendCallback("onMWeaponSkillUpdate", skills, true)
		}
		for _, skillID := range skillIDs {
			_ = ctx.Connection.SendCallback("onUpdateLearnedSkill", strconv.Itoa(skillID))
		}
	}

	if medals, ok := result["granted_medals"].([]appitem.GrantedMedalResult); ok {
		for _, medal := range medals {
			_ = ctx.Connection.SendCallback("updateMedalInBag", map[string]interface{}{
				"i": medal.Slot,
				"t": medal.TemplateID,
				"n": medal.Count,
			})
		}
	}

	if refreshView, _ := result["refresh_character_view"].(bool); refreshView {
		rtmputils.SendStatRefreshUPP(ctx, h.itemService, char)
	}
}
