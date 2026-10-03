// Open-sourced by BaoLT

// Action sequence builders for damage, combo, and counter animations.
package combat

import (
	"go.uber.org/zap"

	"mcgame-server/internal/domain/skill"
)

func (tp *TurnProcessor) buildDamageActions(
	actor, target *Participant,
	sk *skill.SkillTemplate,
	actionType ActionType,
	skillID int,
	actorNewMP int,
	needsMovement bool,
	allowCombo bool,
	allowCounter bool,
) []*BattleAction {
	if UsePermilleV2() {
		var skInfo *SkillInfo
		if actionType != ActionTypeAttack && sk != nil {
			skInfo = &SkillInfo{Template: sk}
		}
		return tp.buildDamageActionsPermille(actor, target, actionType, skillID, actorNewMP, needsMovement, allowCounter, skInfo)
	}

	accMod := tp.accuracyModifiers[actor.ID]
	if accMod == 0 {
		accMod = 1.0
	}
	attackCount := resolveSkillAttackCount(sk)
	actions := make([]*BattleAction, 0, 6+attackCount*3)

	skillName := ""
	if actionType == ActionTypeSkill && sk != nil {
		skillName = sk.Name
	}
	skillBehaviorID := resolveSkillBehaviorID(actionType, sk)

	if needsMovement {
		actions = append(actions, &BattleAction{
			Round:          tp.battle.CurrentRound,
			ActorID:        actor.ID,
			ActorPosition:  actor.Position,
			ActorNewMP:     actorNewMP,
			TargetID:       target.ID,
			TargetPosition: target.Position,
			ActionType:     ActionTypeTurnTo,
			SkillName:      skillName,
			FrontEffID:     skillFrontEffect(sk),
		})

		actions = append(actions, &BattleAction{
			Round:          tp.battle.CurrentRound,
			ActorID:        actor.ID,
			ActorPosition:  actor.Position,
			ActorNewMP:     actorNewMP,
			TargetID:       target.ID,
			TargetPosition: target.Position,
			ActionType:     ActionTypeMoveToTarget,
		})
	}

	successfulHit := false
	for hitIndex := 0; hitIndex < attackCount; hitIndex++ {
		if !target.IsAlive {
			newTarget := SelectRandomTarget(tp.battle, getOppositeSide(actor.Side))
			if newTarget == nil {
				break
			}
			target = newTarget
			if needsMovement {
				actions = append(actions, &BattleAction{
					Round:          tp.battle.CurrentRound,
					ActorID:        actor.ID,
					ActorPosition:  actor.Position,
					ActorNewMP:     actorNewMP,
					TargetID:       target.ID,
					TargetPosition: target.Position,
					ActionType:     ActionTypeTurnTo,
				})
				actions = append(actions, &BattleAction{
					Round:          tp.battle.CurrentRound,
					ActorID:        actor.ID,
					ActorPosition:  actor.Position,
					ActorNewMP:     actorNewMP,
					TargetID:       target.ID,
					TargetPosition: target.Position,
					ActionType:     ActionTypeMoveToTarget,
				})
			}
		}

		result := CalculateDamageWithPosition(actor, target, sk, accMod)
		if tp.defendingIDs[target.ID] {
			result.Damage = result.Damage / 2
			result.IsBlocked = true
		}

		tp.logger.Debug("Building damage actions",
			zap.String("actor_id", actor.ID),
			zap.String("target_id", target.ID),
			zap.Int("damage", result.Damage),
			zap.Bool("crit", result.IsCritical),
			zap.Bool("miss", result.IsMiss),
			zap.Int("hit_index", hitIndex+1),
			zap.Int("hit_count", attackCount))

		hitAction := &BattleAction{
			Round:          tp.battle.CurrentRound,
			ActorID:        actor.ID,
			ActorPosition:  actor.Position,
			ActorNewMP:     actorNewMP,
			TargetID:       target.ID,
			TargetPosition: target.Position,
			ActionType:     actionType,
			BehaviorID:     skillBehaviorID,
			SkillID:        skillID,
			SkillType:      skillTypeOfTemplate(sk),
			Damage:         result.Damage,
			IsCritical:     result.IsCritical,
			IsMiss:         result.IsMiss,
			AttackEffID:    resolveActionAttackEffect(actionType, sk),
			BulletID:       skillBulletEffect(sk),
		}
		if !needsMovement && hitIndex == 0 {
			hitAction.SkillName = skillName
			hitAction.FrontEffID = skillFrontEffect(sk)
		}

		if !result.IsMiss {
			preDamageHP := target.CurrentHP
			target.TakeDamage(result.Damage)
			hitAction.TargetNewHP = target.CurrentHP
			hitAction.TargetDisplayHP = preDamageHP - result.Damage
			hitAction.HasDisplayHP = true
			hitAction.SkillEffID = skillImpactEffect(sk)
			successfulHit = true
			tp.logger.Debug("After damage applied",
				zap.Int("target_hp", target.CurrentHP),
				zap.Bool("target_alive", target.IsAlive))
		}
		actions = append(actions, hitAction)

		if result.IsMiss {
			continue
		}

		hurtType := ActionTypeHurt
		if tp.defendingIDs[target.ID] {
			hurtType = ActionTypeDefended
		}
		actions = append(actions, &BattleAction{
			Round:          tp.battle.CurrentRound,
			ActorID:        target.ID,
			ActorPosition:  target.Position,
			TargetID:       actor.ID,
			TargetPosition: actor.Position,
			ActionType:     hurtType,
		})

		if !target.IsAlive {
			actions = append(actions, &BattleAction{
				Round:          tp.battle.CurrentRound,
				ActorID:        target.ID,
				ActorPosition:  target.Position,
				TargetID:       target.ID,
				TargetPosition: target.Position,
				ActionType:     ActionTypeDie,
				IsNPC:          target.IsNPC,
			})
			tp.logger.Debug("Target died, continuing remaining hits on next target",
				zap.String("target_id", target.ID),
				zap.Int("hit_index", hitIndex+1),
				zap.Int("remaining_hits", attackCount-hitIndex-1))
			continue
		}

		actions = append(actions, &BattleAction{
			Round:          tp.battle.CurrentRound,
			ActorID:        target.ID,
			ActorPosition:  target.Position,
			TargetID:       target.ID,
			TargetPosition: target.Position,
			ActionType:     ActionTypeIdle,
		})
	}

	if successfulHit && allowCombo && target.IsAlive && CheckCombo(actor) {
		tp.logger.Debug("Combo triggered",
			zap.String("actor_id", actor.ID))
		comboActions := tp.buildComboActions(actor, target, sk, actionType, skillID, actorNewMP)
		actions = append(actions, comboActions...)
	}

	if successfulHit && allowCounter && target.IsAlive && actor.IsAlive && CheckCounter(target) {
		tp.logger.Debug("Counter triggered",
			zap.String("target_id", target.ID))
		counterActions := tp.buildCounterActions(target, actor)
		actions = append(actions, counterActions...)
	}

	if needsMovement {
		actions = append(actions, &BattleAction{
			Round:          tp.battle.CurrentRound,
			ActorID:        actor.ID,
			ActorPosition:  actor.Position,
			TargetID:       actor.ID,
			TargetPosition: actor.Position,
			ActionType:     ActionTypeBack,
		})

		actions = append(actions, &BattleAction{
			Round:          tp.battle.CurrentRound,
			ActorID:        actor.ID,
			ActorPosition:  actor.Position,
			TargetID:       actor.ID,
			TargetPosition: actor.Position,
			ActionType:     ActionTypeTurnBack,
		})
	}

	return actions
}

func resolveSkillAttackCount(sk *skill.SkillTemplate) int {
	if sk == nil || sk.AttackCount < 1 {
		return 1
	}
	return sk.AttackCount
}

func skillTypeOfTemplate(sk *skill.SkillTemplate) skill.SkillType {
	if sk == nil {
		return 0
	}
	return sk.SkillType
}

func resolveSkillBehaviorID(actionType ActionType, sk *skill.SkillTemplate) int {
	if actionType != ActionTypeSkill || sk == nil {
		return 0
	}
	if sk.SkillType == skill.SkillTypePhysical {
		return 3
	}
	return 7
}

func shouldTurnBackAfterStationarySkill(sk *skill.SkillTemplate, needsMovement bool) bool {
	if needsMovement {
		return false
	}
	return resolveSkillBehaviorID(ActionTypeSkill, sk) == 7
}

func buildTurnBackAction(round int, actor *Participant) *BattleAction {
	return &BattleAction{
		Round:          round,
		ActorID:        actor.ID,
		ActorPosition:  actor.Position,
		TargetID:       actor.ID,
		TargetPosition: actor.Position,
		ActionType:     ActionTypeTurnBack,
	}
}

func skillFrontEffect(sk *skill.SkillTemplate) int {
	if sk == nil {
		return 0
	}
	return sk.FrontEffID
}

func resolveActionAttackEffect(actionType ActionType, sk *skill.SkillTemplate) int {
	if actionType == ActionTypeAttack {
		return 2080130010008
	}
	if sk == nil {
		return 0
	}
	return sk.AttackEffID
}

func skillImpactEffect(sk *skill.SkillTemplate) int {
	if sk == nil {
		return 0
	}
	return sk.SkillEffID
}

func skillBulletEffect(sk *skill.SkillTemplate) int {
	if sk == nil {
		return 0
	}
	return sk.BulletID
}

func (tp *TurnProcessor) buildComboActions(
	actor, target *Participant,
	sk *skill.SkillTemplate,
	actionType ActionType,
	skillID int,
	actorNewMP int,
) []*BattleAction {
	comboSk := &skill.SkillTemplate{
		ID:          sk.ID,
		Name:        sk.Name,
		SkillType:   sk.SkillType,
		TargetType:  sk.TargetType,
		FrontEffID:  sk.FrontEffID,
		AttackEffID: sk.AttackEffID,
		SkillEffID:  sk.SkillEffID,
		BulletID:    sk.BulletID,
		BaseDamage:  int(float64(sk.BaseDamage) * ComboDamageMulti),
		Multiplier:  sk.Multiplier * ComboDamageMulti,
	}

	comboResult := CalculateDamage(actor, target, comboSk)
	if tp.defendingIDs[target.ID] {
		comboResult.Damage = comboResult.Damage / 2
	}

	actions := make([]*BattleAction, 0, 4)

	comboHit := &BattleAction{
		Round:          tp.battle.CurrentRound,
		ActorID:        actor.ID,
		ActorPosition:  actor.Position,
		ActorNewMP:     actorNewMP,
		TargetID:       target.ID,
		TargetPosition: target.Position,
		ActionType:     actionType,
		BehaviorID:     resolveSkillBehaviorID(actionType, comboSk),
		SkillID:        skillID,
		SkillType:      skillTypeOfTemplate(comboSk),
		Damage:         comboResult.Damage,
		IsCritical:     comboResult.IsCritical,
		IsMiss:         comboResult.IsMiss,
		AttackEffID:    resolveActionAttackEffect(actionType, comboSk),
		BulletID:       skillBulletEffect(comboSk),
	}

	if !comboResult.IsMiss {
		preDamageHP := target.CurrentHP
		target.TakeDamage(comboResult.Damage)
		comboHit.TargetNewHP = target.CurrentHP
		comboHit.TargetDisplayHP = preDamageHP - comboResult.Damage
		comboHit.HasDisplayHP = true
		comboHit.SkillEffID = skillImpactEffect(comboSk)
		tp.logger.Debug("Combo damage applied",
			zap.Int("damage", comboResult.Damage),
			zap.Int("target_hp", target.CurrentHP))
	}
	actions = append(actions, comboHit)

	if !comboResult.IsMiss {
		actions = append(actions, &BattleAction{
			Round:          tp.battle.CurrentRound,
			ActorID:        target.ID,
			ActorPosition:  target.Position,
			TargetID:       actor.ID,
			TargetPosition: actor.Position,
			ActionType:     ActionTypeHurt,
		})
	}

	if !comboResult.IsMiss && !target.IsAlive {
		actions = append(actions, &BattleAction{
			Round:          tp.battle.CurrentRound,
			ActorID:        target.ID,
			ActorPosition:  target.Position,
			TargetID:       target.ID,
			TargetPosition: target.Position,
			ActionType:     ActionTypeDie,
			IsNPC:          target.IsNPC,
		})
	} else if !comboResult.IsMiss {
		actions = append(actions, &BattleAction{
			Round:          tp.battle.CurrentRound,
			ActorID:        target.ID,
			ActorPosition:  target.Position,
			TargetID:       target.ID,
			TargetPosition: target.Position,
			ActionType:     ActionTypeIdle,
		})
	}

	return actions
}

func (tp *TurnProcessor) buildCounterActions(counterAttacker, originalAttacker *Participant) []*BattleAction {
	counterResult := CalculateCounterDamage(counterAttacker, originalAttacker)

	tp.logger.Debug("Counter damage calculated",
		zap.Int("damage", counterResult.Damage),
		zap.String("from", counterAttacker.ID),
		zap.String("to", originalAttacker.ID))

	actions := make([]*BattleAction, 0, 7)

	actions = append(actions, &BattleAction{
		Round:          tp.battle.CurrentRound,
		ActorID:        counterAttacker.ID,
		ActorPosition:  counterAttacker.Position,
		TargetID:       originalAttacker.ID,
		TargetPosition: originalAttacker.Position,
		ActionType:     ActionTypeTurnTo,
	})

	actions = append(actions, &BattleAction{
		Round:          tp.battle.CurrentRound,
		ActorID:        counterAttacker.ID,
		ActorPosition:  counterAttacker.Position,
		TargetID:       originalAttacker.ID,
		TargetPosition: originalAttacker.Position,
		ActionType:     ActionTypeMoveToTarget,
	})

	counterHit := &BattleAction{
		Round:          tp.battle.CurrentRound,
		ActorID:        counterAttacker.ID,
		ActorPosition:  counterAttacker.Position,
		TargetID:       originalAttacker.ID,
		TargetPosition: originalAttacker.Position,
		ActionType:     ActionTypeAttack,
		SkillID:        1001,
		Damage:         counterResult.Damage,
		IsCritical:     counterResult.IsCritical,
		IsMiss:         counterResult.IsMiss,
	}

	if !counterResult.IsMiss {
		preDamageHP := originalAttacker.CurrentHP
		originalAttacker.TakeDamage(counterResult.Damage)
		counterHit.TargetNewHP = originalAttacker.CurrentHP
		counterHit.TargetDisplayHP = preDamageHP - counterResult.Damage
		counterHit.HasDisplayHP = true
	}
	actions = append(actions, counterHit)

	if !counterResult.IsMiss {
		actions = append(actions, &BattleAction{
			Round:          tp.battle.CurrentRound,
			ActorID:        originalAttacker.ID,
			ActorPosition:  originalAttacker.Position,
			TargetID:       counterAttacker.ID,
			TargetPosition: counterAttacker.Position,
			ActionType:     ActionTypeHurt,
		})
	}

	if !counterResult.IsMiss && !originalAttacker.IsAlive {
		actions = append(actions, &BattleAction{
			Round:          tp.battle.CurrentRound,
			ActorID:        originalAttacker.ID,
			ActorPosition:  originalAttacker.Position,
			TargetID:       originalAttacker.ID,
			TargetPosition: originalAttacker.Position,
			ActionType:     ActionTypeDie,
			IsNPC:          originalAttacker.IsNPC,
		})
	} else if !counterResult.IsMiss {
		actions = append(actions, &BattleAction{
			Round:          tp.battle.CurrentRound,
			ActorID:        originalAttacker.ID,
			ActorPosition:  originalAttacker.Position,
			TargetID:       originalAttacker.ID,
			TargetPosition: originalAttacker.Position,
			ActionType:     ActionTypeIdle,
		})
	}

	actions = append(actions, &BattleAction{
		Round:          tp.battle.CurrentRound,
		ActorID:        counterAttacker.ID,
		ActorPosition:  counterAttacker.Position,
		TargetID:       counterAttacker.ID,
		TargetPosition: counterAttacker.Position,
		ActionType:     ActionTypeBack,
	})

	actions = append(actions, &BattleAction{
		Round:          tp.battle.CurrentRound,
		ActorID:        counterAttacker.ID,
		ActorPosition:  counterAttacker.Position,
		TargetID:       counterAttacker.ID,
		TargetPosition: counterAttacker.Position,
		ActionType:     ActionTypeTurnBack,
	})

	return actions
}
