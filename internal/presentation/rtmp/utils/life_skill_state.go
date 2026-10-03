// Open-sourced by BaoLT

package utils

import (
	"strconv"

	appskill "mcgame-server/internal/application/skill"
	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func SendLifeSkillLearnedUpdate(ctx *rtmp.RPCContext, logger *zap.Logger, skillService *appskill.Service, char *domainchar.Character, skillID int) {
	SendLifeSkillStateUpdate(ctx, logger, skillService, char)
	if ctx == nil || ctx.Connection == nil || skillID <= 0 {
		return
	}

	_ = ctx.Connection.SendCallback("onUpdateLearnedSkill", strconv.Itoa(skillID))
}

func SendLifeSkillStateUpdate(ctx *rtmp.RPCContext, logger *zap.Logger, skillService *appskill.Service, char *domainchar.Character) {
	if ctx == nil || ctx.Connection == nil || skillService == nil || char == nil {
		return
	}

	skills, err := skillService.GetSkillsForCallback(ctx.Context, char.ID)
	if err != nil {
		if logger != nil {
			logger.Warn("Failed to build life skill callback payload",
				zap.Uint32("conn_id", ctx.ConnID),
				zap.Int64("character_id", char.ID),
				zap.Error(err))
		}
		skills = []map[string]interface{}{}
	}

	prevExpSkill := ctx.Connection.GetExpSkill()
	_ = ctx.Connection.SendCallback("onSkillUpdate", skills)
	_ = ctx.Connection.SendCallback("onMWeaponSkillUpdate", skills, true)
	for propName, value := range skillService.LifeSkillPropertyValues(char) {
		_ = ctx.Connection.SendCallback("onUpdateLifeDex", map[string]interface{}{
			"prop":  propName,
			"value": value,
		})
	}
	uppData := buildLifeSkillUPPPayload(prevExpSkill, char)
	if _, ok := uppData["expSkill"]; ok {
		ctx.Connection.SetExpSkill(char.Experience)
	}
	_ = ctx.Connection.SendCallback("onUPP", uppData)
}

func buildLifeSkillUPPPayload(previousExpSkill int64, char *domainchar.Character) map[string]interface{} {
	uppData := map[string]interface{}{
		"cookDex":       char.CookDex,
		"fishDex":       char.FishDex,
		"herbDex":       char.HerbDex,
		"plantDex":      char.PlantDex,
		"medicineDex":   char.MedicineDex,
		"money":         char.Money,
		"guildContrib":  char.GuildContrib,
		"donateContrib": char.DonateContrib,
	}
	if previousExpSkill != char.Experience {
		uppData["expSkill"] = char.Experience
	}
	return uppData
}
