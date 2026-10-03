// Open-sourced by BaoLT

package magicweapon

import (
	"context"
	"strconv"
	"strings"

	appskill "mcgame-server/internal/application/skill"
	domainitem "mcgame-server/internal/domain/item"
	domainmw "mcgame-server/internal/domain/magicweapon"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

type SkillGranter struct {
	skillService *appskill.Service
	gameData     *gamedata.Manager
	logger       *zap.Logger
}

func NewSkillGranter(skillService *appskill.Service, gameData *gamedata.Manager, logger *zap.Logger) *SkillGranter {
	return &SkillGranter{
		skillService: skillService,
		gameData:     gameData,
		logger:       logger,
	}
}

func (g *SkillGranter) GrantOnEquip(ctx context.Context, charID int64, equip *domainitem.Item) error {
	if g == nil || equip == nil {
		return nil
	}
	tpl := g.gameData.GetEquipment(equip.TemplateID)
	if !domainmw.IsMainTemplate(tpl) {
		return nil
	}
	for _, sid := range collectMWSkillIDs(equip, tpl) {
		if g.skillService == nil {
			continue
		}
		if _, err := g.skillService.GrantSkillUnchecked(ctx, charID, sid); err != nil && g.logger != nil {
			g.logger.Warn("MW grant skill failed",
				zap.Int64("char_id", charID),
				zap.Int("skill_id", sid),
				zap.Error(err))
		}
	}
	return nil
}

func (g *SkillGranter) RevokeSkillByID(ctx context.Context, charID int64, skillID int) error {
	if g == nil || g.skillService == nil || skillID <= 0 {
		return nil
	}
	if g.gameData != nil {
		if tpl := g.gameData.GetSkill(skillID); tpl != nil && int(tpl.UseEnv) != SkillUseEnvMW {
			return nil
		}
	}
	if err := g.skillService.RevokeSkillBySID(ctx, charID, skillID); err != nil && g.logger != nil {
		g.logger.Warn("MW revoke skill by id failed",
			zap.Int64("char_id", charID),
			zap.Int("skill_id", skillID),
			zap.Error(err))
	}
	return nil
}

func (g *SkillGranter) GrantSkillByID(ctx context.Context, charID int64, skillID int) error {
	if g == nil || g.skillService == nil || skillID <= 0 {
		return nil
	}
	if _, err := g.skillService.GrantSkillUnchecked(ctx, charID, skillID); err != nil && g.logger != nil {
		g.logger.Warn("MW grant skill by id failed",
			zap.Int64("char_id", charID),
			zap.Int("skill_id", skillID),
			zap.Error(err))
	}
	return nil
}

func (g *SkillGranter) RevokeOnUnequip(ctx context.Context, charID int64, equip *domainitem.Item) error {
	if g == nil || equip == nil {
		return nil
	}
	tpl := g.gameData.GetEquipment(equip.TemplateID)
	if !domainmw.IsMainTemplate(tpl) {
		return nil
	}
	for _, sid := range collectMWSkillIDs(equip, tpl) {
		_ = g.RevokeSkillByID(ctx, charID, sid)
	}
	return nil
}

func collectMWSkillIDs(equip *domainitem.Item, tpl *models.EquiptTemplateTemplate) []int {
	out := make([]int, 0, 11)
	if tpl != nil {
		for _, sid := range parseArtifactSkill(tpl.ArtifactSkill) {
			if sid > 0 {
				out = append(out, sid)
			}
		}
	}
	for i := 1; i <= 10; i++ {
		v := domainmw.TSlotValue(equip, i)
		if v > 0 {
			out = append(out, v)
		}
	}
	return uniqueInts(out)
}

func parseArtifactSkill(raw string) []int {
	if raw == "" {
		return nil
	}
	parts := strings.Split(raw, "|")
	out := make([]int, 0, len(parts))
	for _, p := range parts {
		p = strings.TrimSpace(p)
		if p == "" {
			continue
		}
		n, err := strconv.Atoi(p)
		if err == nil {
			out = append(out, n)
		}
	}
	return out
}

func uniqueInts(in []int) []int {
	seen := make(map[int]struct{}, len(in))
	out := make([]int, 0, len(in))
	for _, v := range in {
		if _, ok := seen[v]; ok {
			continue
		}
		seen[v] = struct{}{}
		out = append(out, v)
	}
	return out
}
