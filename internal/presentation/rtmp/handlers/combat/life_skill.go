// Open-sourced by BaoLT

package combat

import (
	"errors"

	appskill "mcgame-server/internal/application/skill"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"
)

func (h *Handler) tryUpgradeLifeSkill(ctx *rtmp.RPCContext, characterID int64, skillID int) (interface{}, bool, error) {
	if h.skillService == nil || !h.skillService.CanHandleSkillTemplate(skillID) {
		return nil, false, nil
	}

	charSkill, _, char, err := h.skillService.LearnOrUpgradeLifeSkill(ctx.Context, characterID, skillID)
	if err != nil {
		if msg := combatLifeSkillErrorMessage(err); msg != "" {
			_ = ctx.Connection.SendCallback("onSystemSay", msg)
			return map[string]interface{}{"success": false}, true, nil
		}
		return rtmp.ErrorToResponse(err), true, nil
	}

	rtmputils.SendLifeSkillStateUpdate(ctx, h.logger, h.skillService, char)

	return map[string]interface{}{
		"success": true,
		"skill":   charSkill.ToDTO(),
	}, true, nil
}

func combatLifeSkillErrorMessage(err error) string {
	switch {
	case errors.Is(err, appskill.ErrLifeSkillNotLearned):
		return "Chưa học kỹ năng sống"
	case errors.Is(err, appskill.ErrLifeSkillMaxLevel):
		return "Kỹ năng đã đạt cấp tối đa"
	case errors.Is(err, appskill.ErrLifeSkillMasteryNotEnough):
		return "Độ thành thục không đủ"
	case errors.Is(err, appskill.ErrLifeSkillExperienceNotEnough):
		return "Kinh nghiệm không đủ"
	case errors.Is(err, appskill.ErrLifeSkillContributionMissing):
		return "Điểm cống hiến không đủ"
	case errors.Is(err, appskill.ErrLifeSkillRecipeLevelNotEnough):
		return "Cấp kỹ năng sống không đủ"
	case pkgerrors.Is(err, pkgerrors.ErrInsufficientLevel):
		return "Cấp độ nhân vật không đủ"
	case pkgerrors.Is(err, pkgerrors.ErrInsufficientFunds):
		return "Bạc không đủ"
	default:
		return ""
	}
}
