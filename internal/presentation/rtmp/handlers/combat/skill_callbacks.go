// Open-sourced by BaoLT

package combat

import (
	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"

	"go.uber.org/zap"
)

type skillCallbackSender interface {
	SendCallback(method string, args ...interface{}) error
}

type battleProgressCallbackSender interface {
	rtmputils.ExpCallbackSender
	skillCallbackSender
}

func sendBattleCharacterProgressCallbacks(sender battleProgressCallbackSender, char *domainchar.Character, expGained int64, leveledUp bool, bonuses *domainchar.EquipmentStatBonuses, skills []map[string]interface{}) {
	if sender == nil || char == nil {
		return
	}

	if bonuses != nil {
		rtmputils.SendExpAndLevelUpCallbacksWithEquipment(sender, char, expGained, leveledUp, bonuses)
	} else {
		rtmputils.SendExpAndLevelUpCallbacks(sender, char, expGained, leveledUp)
	}

	if leveledUp {
		sendSkillCallbackUpdates(sender, skills)
	}
}

func sendSkillCallbackUpdates(sender skillCallbackSender, skills []map[string]interface{}) {
	if sender == nil {
		return
	}
	_ = sender.SendCallback("onSkillUpdate", skills)
	_ = sender.SendCallback("onMWeaponSkillUpdate", skills, true)
}

func (h *Handler) sendSkillStateUpdate(ctx *rtmp.RPCContext, characterID int64) {
	if h == nil || h.skillService == nil || ctx == nil || ctx.Connection == nil {
		return
	}

	skills, err := h.skillService.GetSkillsForCallback(ctx.Context, characterID)
	if err != nil {
		if h.logger != nil {
			h.logger.Warn("Failed to build skill callback payload",
				zap.Uint32("conn_id", ctx.ConnID),
				zap.Int64("character_id", characterID),
				zap.Error(err))
		}
		skills = []map[string]interface{}{}
	}

	sendSkillCallbackUpdates(ctx.Connection, skills)
}
