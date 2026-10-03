// Open-sourced by BaoLT

// GamedataSkillAdapter bridges the gamedata skill templates to the combat domain SkillGetter interface.
// Maps models.SkillTemplate fields to SkillInfo used by TurnProcessor.
// Falls back to hardcoded DefaultSkillTemplates for basic skills (1001-1005).
package combat

import (
	"mcgame-server/internal/domain/combat"
	"mcgame-server/internal/domain/skill"
	"mcgame-server/internal/gamedata"
	gamedatamodels "mcgame-server/internal/gamedata/models"
)

const (
	gamedataTypeClose       = 1
	gamedataTypeRemote      = 2
	gamedataTypeMagic       = 3
	gamedataTypeMagicBullet = 4
	gamedataTypeMagicHeal   = 5
	gamedataTypeStateAdd    = 6
	gamedataTypeStateDel    = 7
	gamedataTypeFuncHurt    = 8
	gamedataTypeFuncRecover = 9
	gamedataTypeDefender    = 10

	defaultObservedImpactEffect = 2080130010008
)

type GamedataSkillAdapter struct {
	manager *gamedata.Manager
}

func NewGamedataSkillAdapter(manager *gamedata.Manager) *GamedataSkillAdapter {
	return &GamedataSkillAdapter{manager: manager}
}

func (a *GamedataSkillAdapter) GetSkillInfo(skillID int) *combat.SkillInfo {
	if a.manager == nil {
		return a.fallbackSkillInfo(skillID)
	}

	tpl := a.manager.GetSkill(skillID)
	if tpl == nil {
		return a.fallbackSkillInfo(skillID)
	}

	return buildSkillInfoFromGamedata(tpl)
}

func buildSkillInfoFromGamedata(tpl *gamedatamodels.SkillTemplate) *combat.SkillInfo {
	skillEffID := int(tpl.SkillEffID)
	if skillEffID == 0 {
		skillEffID = resolveSkillEffectID(int(tpl.Type))
	}
	st := &skill.SkillTemplate{
		ID:            int(tpl.ID),
		Name:          tpl.Name,
		SkillType:     mapSkillType(int(tpl.Type)),
		TargetType:    mapTargetType(int(tpl.TargetType)),
		AttackCount:   resolveAttackCount(tpl.AttackNum),
		FrontEffID:    int(tpl.FrontEffID),
		AttackEffID:   int(tpl.AttackEffID),
		SkillEffID:    skillEffID,
		BulletID:      int(tpl.BulletID),
		BaseDamage:    resolveBaseDamage(tpl.ExpSkill),
		Multiplier:    resolveMultiplier(tpl.DexSkill),
		MPCost:        int(tpl.UseMP),
		SPCost:        int(tpl.UseSP),
		Cooldown:      0,
		Range:         mapSkillRange(int(tpl.Type)),
		RequiredLevel: int(tpl.ReqLevel),
		Description:   tpl.Description,
	}

	if st.BaseDamage == 0 && st.Multiplier == 0 {
		st.BaseDamage = 10
		st.Multiplier = 1.0
	}

	return &combat.SkillInfo{
		Template:     st,
		CombatTarget: mapCombatTargetType(int(tpl.TargetType)),
		AreaType:     mapAreaType(int(tpl.AreaAttack)),
		AreaSize:     resolveAreaSize(int(tpl.TargetNum)),
		BuffID:       int(tpl.BuffID),
		BuffRate:     tpl.BuffRate / 100.0,
		BuffDuration: int(tpl.BuffRound),
	}
}

func (a *GamedataSkillAdapter) GetCreatureSkillIDs(creatureTemplateID int) []int {
	if a.manager == nil || creatureTemplateID <= 0 {
		return nil
	}
	entries := a.manager.GetCreatureSkills(creatureTemplateID)
	if len(entries) == 0 {
		return nil
	}
	ids := make([]int, 0, len(entries))
	for _, entry := range entries {
		skillID := int(entry.Sid)
		if skillID <= 0 {
			continue
		}
		ids = append(ids, skillID)
	}
	return ids
}

func (a *GamedataSkillAdapter) fallbackSkillInfo(skillID int) *combat.SkillInfo {
	tpl := skill.GetSkillTemplate(skillID)
	if tpl == nil {
		return nil
	}
	return &combat.SkillInfo{
		Template:     tpl,
		CombatTarget: combat.TargetEnemy,
		AreaType:     combat.AreaNone,
		AreaSize:     1,
	}
}

func mapSkillType(gamedataType int) skill.SkillType {
	switch gamedataType {
	case gamedataTypeClose, gamedataTypeRemote:
		return skill.SkillTypePhysical
	case gamedataTypeMagic, gamedataTypeMagicBullet:
		return skill.SkillTypeMagic
	case gamedataTypeMagicHeal, gamedataTypeFuncRecover:
		return skill.SkillTypeHeal
	case gamedataTypeStateAdd:
		return skill.SkillTypeBuff
	case gamedataTypeStateDel:
		return skill.SkillTypeDebuff
	case gamedataTypeFuncHurt:
		return skill.SkillTypePhysical
	case gamedataTypeDefender:
		return skill.SkillTypeBuff
	default:
		return skill.SkillTypePhysical
	}
}

func mapTargetType(gamedataTarget int) skill.TargetType {
	switch gamedataTarget {
	case 1:
		return skill.TargetTypeSelf
	case 2, 3:
		return skill.TargetTypeSelf
	case 4, 5, 6, 7:
		return skill.TargetTypeSingle
	case 8, 9, 10:
		return skill.TargetTypeAlly
	case 11:
		return skill.TargetTypeAOE
	case 12:
		return skill.TargetTypeSingle
	default:
		return skill.TargetTypeSingle
	}
}

func mapCombatTargetType(gamedataTarget int) combat.TargetType {
	switch gamedataTarget {
	case 1:
		return combat.TargetSelf
	case 2:
		return combat.TargetSelfPlayer
	case 3:
		return combat.TargetSelfPet
	case 4:
		return combat.TargetEnemy
	case 5:
		return combat.TargetEnemyPlayer
	case 6:
		return combat.TargetEnemyCreature
	case 7:
		return combat.TargetEnemyNoBoss
	case 8:
		return combat.TargetTeam
	case 9:
		return combat.TargetTeamPlayer
	case 10:
		return combat.TargetTeamPet
	case 11:
		return combat.TargetAll
	case 12:
		return combat.TargetPlayer
	default:
		return combat.TargetEnemy
	}
}

func mapAreaType(areaAttack int) combat.AreaType {
	switch areaAttack {
	case 1:
		return combat.AreaVertical
	case 2:
		return combat.AreaHorizontal
	case 3:
		return combat.AreaCross
	case 4:
		return combat.AreaRandom
	default:
		return combat.AreaNone
	}
}

func resolveAreaSize(targetNum int) int {
	if targetNum <= 0 {
		return 1
	}
	return targetNum
}

func resolveBaseDamage(expSkill float64) int {
	if expSkill <= 0 {
		return 0
	}
	return int(expSkill)
}

func resolveMultiplier(dexSkill float64) float64 {
	if dexSkill <= 0 {
		return 0
	}
	if dexSkill > 10 {
		return dexSkill / 100.0
	}
	return dexSkill
}

func resolveAttackCount(attackNum float64) int {
	if attackNum < 1 {
		return 1
	}
	return int(attackNum)
}

func resolveSkillEffectID(gamedataType int) int {
	switch gamedataType {
	case gamedataTypeClose,
		gamedataTypeRemote,
		gamedataTypeMagic,
		gamedataTypeMagicBullet,
		gamedataTypeFuncHurt:
		return defaultObservedImpactEffect
	default:
		return 0
	}
}

func mapSkillRange(gamedataType int) int {
	switch gamedataType {
	case gamedataTypeClose:
		return 1
	case gamedataTypeRemote,
		gamedataTypeMagic,
		gamedataTypeMagicBullet,
		gamedataTypeMagicHeal,
		gamedataTypeStateAdd,
		gamedataTypeStateDel,
		gamedataTypeFuncHurt,
		gamedataTypeFuncRecover,
		gamedataTypeDefender:
		return 2
	default:
		return 0
	}
}
