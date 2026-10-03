// Open-sourced by BaoLT

package item

import (
	"context"
	"errors"
	"strconv"

	appskill "mcgame-server/internal/application/skill"
	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type pendingBookUse struct {
	lifeSkillEntryID      int64
	lifeSkillTemplateID   int
	lifeSkillMessage      string
	recipeSkillEntryID    int64
	recipeSkillTemplateID int
}

func (h *Handler) prepareBookUse(ctx *rtmp.RPCContext, characterID int64, item *domainitem.Item) (*pendingBookUse, interface{}, bool) {
	if item == nil {
		return nil, nil, false
	}

	pending := &pendingBookUse{}

	if lifeSkillType, ok := lifeSkillTypeForBookTemplate(item.TemplateID); ok {
		if h.skillService == nil {
			return nil, rtmp.ErrorToResponse(pkgerrors.ErrSystemError), true
		}

		learnedSkill, template, err := h.skillService.LearnLifeSkillByBook(ctx.Context, characterID, lifeSkillType)
		if err != nil {
			switch {
			case pkgerrors.Is(err, pkgerrors.ErrAlreadyExists):
				_ = ctx.Connection.SendCallback("onSystemMidMsgOrNote", "Bạn đã học kỹ năng này.")
				return nil, map[string]interface{}{
					"success": true,
					"itemId":  item.ID,
					"effects": []interface{}{},
				}, true
			case pkgerrors.Is(err, pkgerrors.ErrInsufficientLevel):
				_ = ctx.Connection.SendCallback("onSystemMidMsgOrNote", "Cấp độ không đủ!")
				return nil, nil, true
			default:
				return nil, rtmp.ErrorToResponse(err), true
			}
		}

		pending.lifeSkillEntryID = learnedSkill.ID
		pending.lifeSkillTemplateID = int(template.ID)
		pending.lifeSkillMessage = lifeSkillLearnMessage(lifeSkillType)
	}

	if h.gameData != nil {
		if tpl := h.gameData.GetItem(item.TemplateID); tpl != nil && int(tpl.Type) == 516 {
			if h.skillService == nil {
				return nil, rtmp.ErrorToResponse(pkgerrors.ErrSystemError), true
			}

			learnedSkill, template, err := h.skillService.LearnRecipeSkillByFormulaName(ctx.Context, characterID, tpl.Name)
			if err != nil {
				switch {
				case pkgerrors.Is(err, pkgerrors.ErrAlreadyExists):
					_ = ctx.Connection.SendCallback("onSystemMidMsgOrNote", "Bạn đã học công thức này.")
					return nil, map[string]interface{}{
						"success": true,
						"itemId":  item.ID,
						"effects": []interface{}{},
					}, true
				case errors.Is(err, appskill.ErrLifeSkillRecipeLevelNotEnough):
					_ = ctx.Connection.SendCallback("onSystemMidMsgOrNote", "Cấp kỹ năng sống không đủ.")
					return nil, nil, true
				default:
					return nil, rtmp.ErrorToResponse(err), true
				}
			}

			pending.recipeSkillEntryID = learnedSkill.ID
			pending.recipeSkillTemplateID = int(template.ID)
		}
	}

	if pending.lifeSkillEntryID == 0 && pending.recipeSkillEntryID == 0 {
		return nil, nil, false
	}

	return pending, nil, false
}

func (h *Handler) rollbackBookUse(ctx context.Context, characterID int64, pending *pendingBookUse) {
	if h == nil || h.skillService == nil || pending == nil {
		return
	}

	if pending.lifeSkillEntryID > 0 {
		if err := h.skillService.DeleteSkill(ctx, pending.lifeSkillEntryID); err != nil {
			h.logger.Error("UseItem: failed to rollback life skill learn",
				zap.Int64("character_id", characterID),
				zap.Int64("skill_entry_id", pending.lifeSkillEntryID),
				zap.Error(err))
		}
	}

	if pending.recipeSkillEntryID > 0 {
		if err := h.skillService.DeleteSkill(ctx, pending.recipeSkillEntryID); err != nil {
			h.logger.Error("UseItem: failed to rollback recipe skill learn",
				zap.Int64("character_id", characterID),
				zap.Int64("skill_entry_id", pending.recipeSkillEntryID),
				zap.Error(err))
		}
	}
}

func (h *Handler) finalizeBookUse(ctx *rtmp.RPCContext, char *character.Character, result map[string]interface{}, pending *pendingBookUse) {
	if pending == nil {
		return
	}

	if pending.lifeSkillTemplateID > 0 {
		if pending.lifeSkillMessage != "" {
			result["message"] = pending.lifeSkillMessage
		}
		rtmputils.SendLifeSkillLearnedUpdate(ctx, h.logger, h.skillService, char, pending.lifeSkillTemplateID)
	}

	if pending.recipeSkillTemplateID > 0 {
		result["message"] = "Đã học công thức."
		_ = ctx.Connection.SendCallback("onUpdateLearnedSkill", strconv.Itoa(pending.recipeSkillTemplateID))
	}
}

func lifeSkillTypeForBookTemplate(templateID int) (int, bool) {
	switch templateID {
	case appskill.PlantSkillBookTemplateID:
		return appskill.PlantSkillType, true
	case appskill.CookSkillBookTemplateID:
		return appskill.CookSkillType, true
	case appskill.MedicineSkillBookTemplateID:
		return appskill.MedicineSkillType, true
	default:
		return 0, false
	}
}

func lifeSkillLearnMessage(skillType int) string {
	switch skillType {
	case appskill.PlantSkillType:
		return "Đã học kỹ năng Trồng Trọt."
	case appskill.CookSkillType:
		return "Đã học kỹ năng Nấu Ăn."
	case appskill.MedicineSkillType:
		return "Đã học kỹ năng Chế Thuốc."
	default:
		return "Đã học kỹ năng sống."
	}
}
