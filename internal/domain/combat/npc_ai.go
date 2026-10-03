// Open-sourced by BaoLT

// NPC AI command selection for battle.
// Generates commands for NPC participants with basic priority:
// heal when low HP, use skills when available, attack frontline by default.
package combat

import (
	"math/rand"
)

const (
	npcHealThreshold  = 0.3
	npcSkillUseChance = 0.3
	npcSkillHealID    = 1004
	npcBasicAttackID  = 1001
)

type NPCAISelector struct {
	skillGetter SkillGetter
}

func NewNPCAISelector(skillGetter SkillGetter) *NPCAISelector {
	return &NPCAISelector{skillGetter: skillGetter}
}

func (ai *NPCAISelector) SelectCommand(npc *Participant, battle *Battle) *BattleCommand {
	return ai.buildAttackCommand(npc, battle)
}

func (ai *NPCAISelector) shouldHeal(npc *Participant) bool {
	if npc.MaxHP <= 0 {
		return false
	}
	hpRatio := float64(npc.CurrentHP) / float64(npc.MaxHP)
	return hpRatio < npcHealThreshold && npc.CurrentMP >= 30
}

func (ai *NPCAISelector) buildHealCommand(npc *Participant) *BattleCommand {
	return &BattleCommand{
		ActorID:    npc.ID,
		TargetID:   npc.ID,
		ActionType: ClientActionSkill,
		SkillID:    npcSkillHealID,
	}
}

func (ai *NPCAISelector) trySkillCommand(npc *Participant, battle *Battle) *BattleCommand {
	target := SelectFrontlineTarget(battle, SidePlayer)
	if target == nil {
		target = SelectRandomTarget(battle, SidePlayer)
	}
	if target == nil {
		return nil
	}

	skillIDs := ai.resolveSkillPool(npc)
	rand.Shuffle(len(skillIDs), func(i, j int) {
		skillIDs[i], skillIDs[j] = skillIDs[j], skillIDs[i]
	})

	for _, sid := range skillIDs {
		info := ai.skillGetter.GetSkillInfo(sid)
		if info == nil || info.Template == nil {
			continue
		}
		if info.CombatTarget == TargetSelf || info.CombatTarget == TargetTeam || info.CombatTarget == TargetAllTeam {
			continue
		}
		if npc.CurrentMP < info.Template.MPCost {
			continue
		}
		return &BattleCommand{
			ActorID:    npc.ID,
			TargetID:   target.ID,
			ActionType: ClientActionSkill,
			SkillID:    sid,
		}
	}

	return nil
}

func (ai *NPCAISelector) resolveSkillPool(npc *Participant) []int {
	if ai.skillGetter != nil && npc != nil {
		if ids := ai.skillGetter.GetCreatureSkillIDs(int(npc.EntityID)); len(ids) > 0 {
			pool := make([]int, len(ids))
			copy(pool, ids)
			return pool
		}
	}
	return []int{1002, 1003, 1005}
}

func (ai *NPCAISelector) buildAttackCommand(npc *Participant, battle *Battle) *BattleCommand {
	target := SelectFrontlineTarget(battle, SidePlayer)
	if target == nil {
		target = SelectRandomTarget(battle, SidePlayer)
	}
	if target == nil {
		return &BattleCommand{
			ActorID:    npc.ID,
			ActionType: ClientActionTimeout,
		}
	}

	return &BattleCommand{
		ActorID:    npc.ID,
		TargetID:   target.ID,
		ActionType: ClientActionAttack,
		SkillID:    0,
	}
}
