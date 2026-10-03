// Open-sourced by BaoLT

// Skill entities for character and template skill data.
// CharacterSkill tracks learned skills with levels and cooldowns.
// SkillTemplate defines base skill properties and requirements.
package skill

import (
	"time"
)

type SkillType int

const (
	SkillTypePhysical SkillType = 1
	SkillTypeMagic    SkillType = 2
	SkillTypeHeal     SkillType = 3
	SkillTypeBuff     SkillType = 4
	SkillTypeDebuff   SkillType = 5
	SkillTypePassive  SkillType = 6
)

type TargetType int

const (
	TargetTypeSelf     TargetType = 1
	TargetTypeSingle   TargetType = 2
	TargetTypeAllEnemy TargetType = 3
	TargetTypeAlly     TargetType = 4
	TargetTypeAllAlly  TargetType = 5
	TargetTypeAOE      TargetType = 6
)

const (
	MaxSkillLevel   = 10
	MaxSkillSlots   = 8
	DefaultCooldown = 0
)

type SkillTemplate struct {
	ID            int
	Name          string
	SkillType     SkillType
	TargetType    TargetType
	AttackCount   int
	FrontEffID    int
	AttackEffID   int
	SkillEffID    int
	BulletID      int
	BaseDamage    int
	Multiplier    float64
	MPCost        int
	SPCost        int
	Cooldown      int
	CastTime      int
	Range         int
	RequiredLevel int
	RequiredClass int
	MaxLevel      int
	Description   string
}

type CharacterSkill struct {
	ID           int64
	CharacterID  int64
	SkillID      int
	Level        int
	Exp          int
	SlotPosition *int
	IsAuto       bool
	CooldownEnd  *time.Time
	CreatedAt    time.Time
}

func NewCharacterSkill(charID int64, skillID int) *CharacterSkill {
	return &CharacterSkill{
		CharacterID: charID,
		SkillID:     skillID,
		Level:       1,
		Exp:         0,
		IsAuto:      false,
		CreatedAt:   time.Now(),
	}
}

func (s *CharacterSkill) IsOnCooldown() bool {
	if s.CooldownEnd == nil {
		return false
	}
	return time.Now().Before(*s.CooldownEnd)
}

func (s *CharacterSkill) GetRemainingCooldown() int {
	if s.CooldownEnd == nil {
		return 0
	}
	remaining := time.Until(*s.CooldownEnd)
	if remaining < 0 {
		return 0
	}
	return int(remaining.Seconds())
}

func (s *CharacterSkill) StartCooldown(seconds int) {
	end := time.Now().Add(time.Duration(seconds) * time.Second)
	s.CooldownEnd = &end
}

func (s *CharacterSkill) ClearCooldown() {
	s.CooldownEnd = nil
}

func (s *CharacterSkill) SetSlot(slot int) {
	s.SlotPosition = &slot
}

func (s *CharacterSkill) ClearSlot() {
	s.SlotPosition = nil
}

func (s *CharacterSkill) CanLevelUp(maxLevel int) bool {
	return s.Level < maxLevel
}

func (s *CharacterSkill) LevelUp() bool {
	if s.Level >= MaxSkillLevel {
		return false
	}
	s.Level++
	s.Exp = 0
	return true
}

func (s *CharacterSkill) ToDTO() map[string]interface{} {
	dto := map[string]interface{}{
		"id":       s.SkillID,
		"entryId":  s.ID,
		"skillId":  s.SkillID,
		"sid":      s.SkillID,
		"level":    s.Level,
		"exp":      s.Exp,
		"isAuto":   s.IsAuto,
		"cooldown": s.GetRemainingCooldown(),
	}
	if s.SlotPosition != nil {
		dto["slot"] = *s.SlotPosition
	}
	return dto
}

func SkillTemplateToDTO(t *SkillTemplate) map[string]interface{} {
	return map[string]interface{}{
		"id":          t.ID,
		"name":        t.Name,
		"type":        int(t.SkillType),
		"targetType":  int(t.TargetType),
		"attackCount": t.AttackCount,
		"frontEffId":  t.FrontEffID,
		"attackEffId": t.AttackEffID,
		"skillEffId":  t.SkillEffID,
		"bulletId":    t.BulletID,
		"baseDamage":  t.BaseDamage,
		"multiplier":  t.Multiplier,
		"mpCost":      t.MPCost,
		"spCost":      t.SPCost,
		"cooldown":    t.Cooldown,
		"castTime":    t.CastTime,
		"range":       t.Range,
		"reqLevel":    t.RequiredLevel,
		"reqClass":    t.RequiredClass,
		"maxLevel":    t.MaxLevel,
		"description": t.Description,
	}
}

var DefaultSkillTemplates = map[int]*SkillTemplate{
	1001: {
		ID:            1001,
		Name:          "Basic Attack",
		SkillType:     SkillTypePhysical,
		TargetType:    TargetTypeSingle,
		AttackCount:   1,
		BaseDamage:    10,
		Multiplier:    1.0,
		MPCost:        0,
		Cooldown:      0,
		Range:         1,
		RequiredLevel: 1,
		MaxLevel:      10,
		Description:   "A basic physical attack",
	},
	1002: {
		ID:            1002,
		Name:          "Power Strike",
		SkillType:     SkillTypePhysical,
		TargetType:    TargetTypeSingle,
		AttackCount:   1,
		BaseDamage:    25,
		Multiplier:    1.5,
		MPCost:        10,
		Cooldown:      3,
		Range:         1,
		RequiredLevel: 5,
		MaxLevel:      10,
		Description:   "A powerful physical attack",
	},
	1003: {
		ID:            1003,
		Name:          "Fireball",
		SkillType:     SkillTypeMagic,
		TargetType:    TargetTypeSingle,
		AttackCount:   1,
		BaseDamage:    30,
		Multiplier:    1.8,
		MPCost:        20,
		Cooldown:      5,
		Range:         2,
		RequiredLevel: 10,
		MaxLevel:      10,
		Description:   "Launches a fireball at the enemy",
	},
	1004: {
		ID:            1004,
		Name:          "Heal",
		SkillType:     SkillTypeHeal,
		TargetType:    TargetTypeSelf,
		AttackCount:   1,
		BaseDamage:    50,
		Multiplier:    0.5,
		MPCost:        30,
		Cooldown:      10,
		Range:         2,
		RequiredLevel: 5,
		MaxLevel:      10,
		Description:   "Restores HP",
	},
	1005: {
		ID:            1005,
		Name:          "Whirlwind",
		SkillType:     SkillTypePhysical,
		TargetType:    TargetTypeAllEnemy,
		AttackCount:   1,
		BaseDamage:    15,
		Multiplier:    0.8,
		MPCost:        25,
		Cooldown:      8,
		Range:         1,
		RequiredLevel: 15,
		MaxLevel:      10,
		Description:   "Attacks all enemies",
	},
}

func GetSkillTemplate(skillID int) *SkillTemplate {
	return DefaultSkillTemplates[skillID]
}
