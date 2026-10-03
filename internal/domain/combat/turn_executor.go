// Open-sourced by BaoLT

// Command execution handlers for each battle action type.
package combat

import (
	"fmt"
	"math/rand"

	"go.uber.org/zap"

	"mcgame-server/internal/domain/skill"
)

func (tp *TurnProcessor) executeCommand(actor *Participant, cmd *BattleCommand) []*BattleAction {
	switch cmd.ActionType {
	case ClientActionAttack:
		return tp.executeAttack(actor, cmd)
	case ClientActionSkill:
		if !tp.statusManager.CanUseSkill(actor.ID) {
			return tp.executeAttack(actor, cmd)
		}
		return tp.executeSkill(actor, cmd)
	case ClientActionDefend:
		return tp.executeDefend(actor)
	case ClientActionEscape:
		return tp.executeEscape(actor, cmd.QueuedLeave)
	case ClientActionItem:
		return tp.executeItem(actor, cmd)
	case ClientActionTimeout:
		return tp.executeTimeout(actor)
	case ClientActionAuto:
		return tp.executeAttack(actor, cmd)
	case ClientActionCatch:
		return tp.executeCatch(actor, cmd)
	case ClientActionReturn:
		return tp.executeReturn(actor)
	case ClientActionPet:
		return tp.executePet(actor, cmd)
	default:
		return tp.executeAttack(actor, cmd)
	}
}

func (tp *TurnProcessor) resolveTarget(actor *Participant, targetID string) *Participant {
	targetSide := getOppositeSide(actor.Side)
	target := chooseTargetCandidate(
		tp.battle.GetParticipant(targetID),
		participantByPositionString(tp.battle, targetID),
		func(p *Participant) bool {
			return p != nil && p.Side == targetSide
		},
		true,
	)
	if target == nil || !target.IsAlive {
		return nil
	}

	redirectedID := tp.statusManager.GetConfusionTarget(tp.battle, actor.ID, target.ID)
	redirectedID = tp.statusManager.GetRebellionTarget(tp.battle, actor.ID, redirectedID)
	if redirectedID != target.ID {
		redirected := tp.battle.GetParticipant(redirectedID)
		if redirected != nil && redirected.IsAlive {
			return redirected
		}
		return nil
	}
	return target
}

func (tp *TurnProcessor) executeAttack(actor *Participant, cmd *BattleCommand) []*BattleAction {
	tp.logger.Debug("Executing attack",
		zap.String("actor_id", actor.ID),
		zap.String("target_id", cmd.TargetID))

	target := tp.resolveTarget(actor, cmd.TargetID)
	if target == nil {
		return []*BattleAction{
			{
				Round:          tp.battle.CurrentRound,
				ActorID:        actor.ID,
				ActorPosition:  actor.Position,
				TargetID:       cmd.TargetID,
				TargetPosition: -1,
				ActionType:     ActionTypeAttack,
				IsMiss:         true,
			},
		}
	}

	tp.logger.Debug("Attack target found",
		zap.String("target_id", target.ID),
		zap.String("name", target.Name),
		zap.Int("hp", target.CurrentHP))

	info := tp.getSkillInfo(1001)
	return tp.buildDamageActions(actor, target, info.Template, ActionTypeAttack, 1001, 0, true, true, true)
}

func (tp *TurnProcessor) executeSkill(actor *Participant, cmd *BattleCommand) []*BattleAction {
	info := tp.getSkillInfo(cmd.SkillID)
	if info == nil {
		return tp.executeAttack(actor, cmd)
	}

	sk := info.Template
	if tp.isSkillOnCooldown(actor.ID, cmd.SkillID) {
		return tp.executeAttack(actor, cmd)
	}
	if !actor.UseMP(sk.MPCost) {
		return tp.executeAttack(actor, cmd)
	}

	if sk.Cooldown > 0 {
		tp.startSkillCooldown(actor.ID, cmd.SkillID, sk.Cooldown)
	}

	if cmd.SkillLevel > 1 {
		sk = applySkillLevelScaling(sk, cmd.SkillLevel)
	}

	if sk.SkillType == skill.SkillTypeHeal {
		return tp.executeHealSkill(actor, cmd, info)
	}

	resolver := NewTargetResolver(tp.battle)
	targets := resolver.ResolveTargets(actor, cmd.TargetID, info.CombatTarget, info.AreaType, info.AreaSize)
	if len(targets) == 0 {
		actions := []*BattleAction{
			{
				Round:         tp.battle.CurrentRound,
				ActorID:       actor.ID,
				ActorPosition: actor.Position,
				ActionType:    ActionTypeSkill,
				SkillID:       cmd.SkillID,
				SkillType:     skillTypeOfTemplate(sk),
				SkillName:     sk.Name,
				IsMiss:        true,
			},
		}
		if shouldTurnBackAfterStationarySkill(sk, false) {
			actions = append(actions, buildTurnBackAction(tp.battle.CurrentRound, actor))
		}
		return actions
	}

	isAoE := len(targets) > 1
	actions := make([]*BattleAction, 0)
	needsMovement := skillRequiresApproach(sk) && !isAoE
	for _, target := range targets {
		damageActions := tp.buildDamageActions(actor, target, sk, ActionTypeSkill, cmd.SkillID, actor.CurrentMP, needsMovement, !isAoE, !isAoE)
		actions = append(actions, damageActions...)
	}

	if info.BuffID > 0 && info.BuffRate > 0 {
		tp.applySkillBuff(actor, targets, info)
	}

	if shouldTurnBackAfterStationarySkill(sk, needsMovement) {
		actions = append(actions, buildTurnBackAction(tp.battle.CurrentRound, actor))
	}

	return actions
}

func (tp *TurnProcessor) executeHealSkill(actor *Participant, cmd *BattleCommand, info *SkillInfo) []*BattleAction {
	sk := info.Template
	resolver := NewTargetResolver(tp.battle)
	targets := resolver.ResolveTargets(actor, cmd.TargetID, info.CombatTarget, info.AreaType, info.AreaSize)
	if len(targets) == 0 {
		targets = []*Participant{actor}
	}

	actions := make([]*BattleAction, 0, len(targets))
	for _, target := range targets {
		heal := CalculateHealing(actor, sk)
		target.Heal(heal)
		actions = append(actions, &BattleAction{
			Round:          tp.battle.CurrentRound,
			ActorID:        actor.ID,
			ActorPosition:  actor.Position,
			ActorNewMP:     actor.CurrentMP,
			TargetID:       target.ID,
			TargetPosition: target.Position,
			ActionType:     ActionTypeSkill,
			SkillID:        cmd.SkillID,
			SkillType:      skillTypeOfTemplate(sk),
			Damage:         -heal,
			TargetNewHP:    target.CurrentHP,
			SkillName:      sk.Name,
		})
	}
	if shouldTurnBackAfterStationarySkill(sk, false) {
		actions = append(actions, buildTurnBackAction(tp.battle.CurrentRound, actor))
	}
	return actions
}

func (tp *TurnProcessor) applySkillBuff(actor *Participant, targets []*Participant, info *SkillInfo) {
	if rand.Float64() >= info.BuffRate {
		return
	}

	effectType := mapBuffIDToStatusEffect(info.BuffID)
	if effectType == StatusNormal {
		return
	}

	for _, target := range targets {
		if !target.IsAlive {
			continue
		}
		effect := NewStatusEffect(effectType, info.BuffDuration, 0, actor.ID)
		tp.statusManager.AddEffect(target.ID, effect)
	}
}

func mapBuffIDToStatusEffect(buffID int) StatusEffectType {
	switch buffID {
	case 1:
		return StatusDizzy
	case 2:
		return StatusConfusion
	case 3:
		return StatusSleep
	case 4:
		return StatusPoison
	case 5:
		return StatusFire
	case 6:
		return StatusIce
	case 7:
		return StatusLight
	case 8:
		return StatusSilence
	case 9:
		return StatusRebellion
	case 10:
		return StatusStone
	default:
		return StatusNormal
	}
}

func (tp *TurnProcessor) executeDefend(actor *Participant) []*BattleAction {
	return []*BattleAction{
		{
			Round:          tp.battle.CurrentRound,
			ActorID:        actor.ID,
			ActorPosition:  actor.Position,
			TargetID:       actor.ID,
			TargetPosition: actor.Position,
			ActionType:     ActionTypeDefend,
		},
	}
}

func (tp *TurnProcessor) executeEscape(actor *Participant, queuedLeave bool) []*BattleAction {
	actions := []*BattleAction{
		{
			Round:          tp.battle.CurrentRound,
			ActorID:        actor.ID,
			ActorPosition:  actor.Position,
			TargetID:       actor.ID,
			TargetPosition: actor.Position,
			ActionType:     ActionTypeFlee,
		},
	}

	tp.logger.Debug("Actor fled",
		zap.String("actor_id", actor.ID),
		zap.Bool("queued_leave", queuedLeave))

	if queuedLeave {
		actions = append(actions, &BattleAction{
			Round:          tp.battle.CurrentRound,
			ActorID:        actor.ID,
			ActorPosition:  actor.Position,
			TargetID:       actor.ID,
			TargetPosition: actor.Position,
			ActionType:     ActionTypeIdle,
			BehaviorID:     10170,
		})
	}

	if actor.Side == SidePlayer && !queuedLeave {
		tp.battle.SetPlayerFled()
		return actions
	}

	actor.CurrentHP = 0
	actor.IsAlive = false

	return actions
}

func (tp *TurnProcessor) executeItem(actor *Participant, cmd *BattleCommand) []*BattleAction {
	hpRestored, mpRestored, consumed := 0, 0, false
	if tp.itemHandler != nil {
		hpRestored, mpRestored, consumed = tp.itemHandler.ExecuteItemUse(actor.ID, cmd.ItemSlot)
	}

	if consumed {
		actor.Heal(hpRestored)
		actor.CurrentMP += mpRestored
		if actor.CurrentMP > actor.MaxMP {
			actor.CurrentMP = actor.MaxMP
		}
		tp.logger.Debug("Item used",
			zap.String("actor_id", actor.ID),
			zap.Int("item_id", cmd.ItemSlot),
			zap.Int("hp_restored", hpRestored),
			zap.Int("mp_restored", mpRestored))
	}

	action := &BattleAction{
		Round:          tp.battle.CurrentRound,
		ActorID:        actor.ID,
		ActorPosition:  actor.Position,
		TargetID:       actor.ID,
		TargetPosition: actor.Position,
		ActionType:     ActionTypeItem,
		SkillID:        cmd.ItemSlot,
	}

	if consumed {
		action.TargetNewHP = actor.CurrentHP
		action.TargetNewMP = actor.CurrentMP
		action.Damage = -hpRestored
	}

	return []*BattleAction{action}
}

func (tp *TurnProcessor) executeTimeout(actor *Participant) []*BattleAction {
	return []*BattleAction{
		{
			Round:          tp.battle.CurrentRound,
			ActorID:        actor.ID,
			ActorPosition:  actor.Position,
			TargetID:       actor.ID,
			TargetPosition: actor.Position,
			ActionType:     ActionTypeDefend,
		},
	}
}

func (tp *TurnProcessor) isSkillOnCooldown(actorID string, skillID int) bool {
	if cds, ok := tp.skillCooldowns[actorID]; ok {
		return cds[skillID] > 0
	}
	return false
}

func (tp *TurnProcessor) startSkillCooldown(actorID string, skillID int, rounds int) {
	if tp.skillCooldowns[actorID] == nil {
		tp.skillCooldowns[actorID] = make(map[int]int)
	}
	tp.skillCooldowns[actorID][skillID] = rounds
}

func (tp *TurnProcessor) decrementCooldowns() {
	for actorID, cds := range tp.skillCooldowns {
		for skillID, remaining := range cds {
			if remaining > 0 {
				cds[skillID] = remaining - 1
			}
		}
		tp.skillCooldowns[actorID] = cds
	}
}

func (tp *TurnProcessor) executeCatch(actor *Participant, cmd *BattleCommand) []*BattleAction {
	target := tp.resolveTarget(actor, cmd.TargetID)
	if target == nil || !target.IsNPC {
		return []*BattleAction{
			{
				Round:         tp.battle.CurrentRound,
				ActorID:       actor.ID,
				ActorPosition: actor.Position,
				ActionType:    ActionTypeSkill,
				IsMiss:        true,
			},
		}
	}

	catchResult := CatchResult{}
	if tp.catchHandler != nil {
		catchResult = tp.catchHandler.AttemptCatch(actor.ID, target.EntityID, target.Level, target.CurrentHP, target.MaxHP)
	}

	if catchResult.Success && catchResult.PetID > 0 {
		tp.battle.AddPetReward(PetReward{
			CharacterID: actor.EntityID,
			PetID:       catchResult.PetID,
		})
	}

	return buildCatchActions(tp.battle.CurrentRound, actor, target, catchResult)
}

func (tp *TurnProcessor) executeReturn(actor *Participant) []*BattleAction {
	ownerID := petCommandOwnerID(actor)
	pet := tp.battle.GetOwnerPet(ownerID)
	if pet == nil {
		return buildPetNoopAction(tp.battle.CurrentRound, actor)
	}
	owner := tp.battle.GetParticipant(fmt.Sprintf("%d", ownerID))
	if owner == nil {
		owner = actor
	}
	tp.markPetStateOwner(ownerID)
	tp.battle.RemoveParticipant(pet.ID)
	delete(tp.commands, pet.ID)
	return buildReturnPetActions(tp.battle.CurrentRound, owner, pet)
}

func (tp *TurnProcessor) executePet(actor *Participant, cmd *BattleCommand) []*BattleAction {
	ownerID := petCommandOwnerID(actor)
	owner := tp.battle.GetParticipant(fmt.Sprintf("%d", ownerID))
	if owner == nil {
		owner = actor
	}
	currentPet := tp.battle.GetOwnerPet(ownerID)
	if currentPet != nil && currentPet.EntityID == cmd.SelectedPetID {
		tp.markPetStateOwner(ownerID)
		tp.battle.RemoveParticipant(currentPet.ID)
		delete(tp.commands, currentPet.ID)
		return buildReturnPetActions(tp.battle.CurrentRound, owner, currentPet)
	}

	replacement := cloneParticipant(cmd.ReplacementPet)
	if replacement == nil {
		return buildPetNoopAction(tp.battle.CurrentRound, actor)
	}
	tp.markPetStateOwner(ownerID)
	replacement.OwnerID = ownerID
	replacement.Position = petCommandPosition(actor, currentPet, replacement.Position)
	tp.battle.RemoveParticipant(replacement.ID)
	if currentPet != nil {
		tp.battle.RemoveParticipant(currentPet.ID)
		delete(tp.commands, currentPet.ID)
		if !tp.battle.AddParticipant(replacement) {
			return buildPetNoopAction(tp.battle.CurrentRound, actor)
		}
		return buildSwitchPetActions(tp.battle.CurrentRound, owner, currentPet, replacement)
	}
	if !tp.battle.AddParticipant(replacement) {
		return buildPetNoopAction(tp.battle.CurrentRound, actor)
	}
	return buildSummonPetActions(tp.battle.CurrentRound, owner, replacement)
}

func petCommandOwnerID(actor *Participant) int64 {
	if actor == nil {
		return 0
	}
	if actor.EntityType == ParticipantTypePet && actor.OwnerID > 0 {
		return actor.OwnerID
	}
	return actor.EntityID
}

func petCommandPosition(actor *Participant, currentPet *Participant, fallback int) int {
	if currentPet != nil && currentPet.Position >= 0 {
		return currentPet.Position
	}
	if fallback >= 0 {
		return fallback
	}
	if actor != nil && actor.Position >= 10 && actor.Position <= 14 {
		return actor.Position + 5
	}
	return 15
}

func applySkillLevelScaling(original *skill.SkillTemplate, level int) *skill.SkillTemplate {
	scaled := *original
	levelBonus := 1.0 + float64(level-1)*0.1
	scaled.BaseDamage = int(float64(original.BaseDamage) * levelBonus)
	scaled.Multiplier = original.Multiplier * levelBonus
	return &scaled
}

func skillRequiresApproach(sk *skill.SkillTemplate) bool {
	if sk == nil {
		return false
	}
	return sk.Range == 1
}

func (tp *TurnProcessor) getSkillInfo(skillID int) *SkillInfo {
	if tp.skillGetter != nil {
		return tp.skillGetter.GetSkillInfo(skillID)
	}
	tpl := skill.GetSkillTemplate(skillID)
	if tpl == nil {
		return nil
	}
	return &SkillInfo{
		Template:     tpl,
		CombatTarget: mapDomainTargetType(tpl.TargetType),
		AreaType:     AreaNone,
		AreaSize:     1,
	}
}

func mapDomainTargetType(t skill.TargetType) TargetType {
	switch t {
	case skill.TargetTypeSelf:
		return TargetSelf
	case skill.TargetTypeSingle:
		return TargetEnemy
	case skill.TargetTypeAllEnemy:
		return TargetAllEnemy
	case skill.TargetTypeAlly:
		return TargetTeam
	case skill.TargetTypeAllAlly:
		return TargetAllTeam
	case skill.TargetTypeAOE:
		return TargetAll
	default:
		return TargetEnemy
	}
}

func ClientActionToActionType(clientAction int) ActionType {
	switch clientAction {
	case ClientActionAttack:
		return ActionTypeAttack
	case ClientActionSkill:
		return ActionTypeSkill
	case ClientActionDefend:
		return ActionTypeDefend
	case ClientActionEscape:
		return ActionTypeFlee
	case ClientActionItem:
		return ActionTypeItem
	default:
		return ActionTypeAttack
	}
}
