// Open-sourced by BaoLT

// Pet battle action handlers for catch, return, and switch operations.
// CatchHandler interface bridges domain catch logic with application-level pet persistence.
package combat

type CatchHandler interface {
	AttemptCatch(actorID string, creatureEntityID int64, creatureLevel int, currentHP int, maxHP int) CatchResult
}

type CatchResult struct {
	Success   bool
	PetID     int64
	Rate      int
	SelfCatch int
}

func buildCatchActions(round int, actor *Participant, target *Participant, result CatchResult) []*BattleAction {
	actions := make([]*BattleAction, 0, 3)

	catchAction := &BattleAction{
		Round:          round,
		ActorID:        actor.ID,
		ActorPosition:  actor.Position,
		TargetID:       target.ID,
		TargetPosition: target.Position,
		ActionType:     ActionTypeSkill,
		SkillID:        0,
		IsMiss:         !result.Success,
	}
	if !result.Success {
		catchAction.SourceState = map[string]interface{}{
			"catchF": map[string]interface{}{
				"cid":       actor.EntityID,
				"rate":      result.Rate,
				"selfCatch": result.SelfCatch,
			},
		}
	}
	actions = append(actions, catchAction)

	if result.Success {
		target.IsAlive = false
		target.CurrentHP = 0
		actions = append(actions, &BattleAction{
			Round:          round,
			ActorID:        target.ID,
			ActorPosition:  target.Position,
			TargetID:       target.ID,
			TargetPosition: target.Position,
			ActionType:     ActionTypeDie,
			BehaviorID:     10160,
			IsNPC:          target.IsNPC,
		})
	}

	return actions
}

func buildReturnPetActions(round int, owner *Participant, pet *Participant) []*BattleAction {
	caster := petActionCaster(owner, pet)
	actions := []*BattleAction{
		{
			Round:          round,
			ActorID:        caster.ID,
			ActorPosition:  caster.Position,
			TargetID:       pet.ID,
			TargetPosition: -1,
			ActionType:     ActionTypeSkill,
			BehaviorID:     15000,
		},
		{
			Round:          round,
			ActorID:        pet.ID,
			ActorPosition:  pet.Position,
			TargetID:       pet.ID,
			TargetPosition: -1,
			ActionType:     ActionTypeIdle,
			BehaviorID:     17000,
		},
	}
	return append(actions, buildTurnBackAction(round, caster))
}

func buildSummonPetActions(round int, actor *Participant, pet *Participant) []*BattleAction {
	actions := []*BattleAction{
		{
			Round:          round,
			ActorID:        actor.ID,
			ActorPosition:  actor.Position,
			TargetID:       actor.ID,
			TargetPosition: -1,
			ActionType:     ActionTypeSkill,
			BehaviorID:     16000,
			Extra: map[string]interface{}{
				"type": 0,
				"pet":  pet.ToDTO(),
			},
		},
		{
			Round:          round,
			ActorID:        pet.ID,
			ActorPosition:  pet.Position,
			TargetID:       pet.ID,
			TargetPosition: -1,
			ActionType:     ActionTypeIdle,
			BehaviorID:     18000,
		},
	}
	return append(actions, buildTurnBackAction(round, actor))
}

func buildSwitchPetActions(round int, actor *Participant, currentPet *Participant, nextPet *Participant) []*BattleAction {
	actions := buildReturnPetSequence(round, actor, currentPet)
	actions = append(actions, buildSummonPetSequence(round, actor, nextPet)...)
	actions = append(actions, buildTurnBackAction(round, actor))
	return actions
}

func buildPetNoopAction(round int, actor *Participant) []*BattleAction {
	return []*BattleAction{
		{
			Round:          round,
			ActorID:        actor.ID,
			ActorPosition:  actor.Position,
			TargetID:       actor.ID,
			TargetPosition: actor.Position,
			ActionType:     ActionTypeIdle,
			BehaviorID:     11500,
		},
	}
}

func cloneParticipant(p *Participant) *Participant {
	if p == nil {
		return nil
	}
	clone := *p
	return &clone
}

func buildReturnPetSequence(round int, owner *Participant, pet *Participant) []*BattleAction {
	caster := petActionCaster(owner, pet)
	return []*BattleAction{
		{
			Round:          round,
			ActorID:        caster.ID,
			ActorPosition:  caster.Position,
			TargetID:       pet.ID,
			TargetPosition: -1,
			ActionType:     ActionTypeSkill,
			BehaviorID:     15000,
		},
		{
			Round:          round,
			ActorID:        pet.ID,
			ActorPosition:  pet.Position,
			TargetID:       pet.ID,
			TargetPosition: -1,
			ActionType:     ActionTypeIdle,
			BehaviorID:     17000,
		},
	}
}

func buildSummonPetSequence(round int, actor *Participant, pet *Participant) []*BattleAction {
	return []*BattleAction{
		{
			Round:          round,
			ActorID:        actor.ID,
			ActorPosition:  actor.Position,
			TargetID:       actor.ID,
			TargetPosition: -1,
			ActionType:     ActionTypeSkill,
			BehaviorID:     16000,
			Extra: map[string]interface{}{
				"type": 0,
				"pet":  pet.ToDTO(),
			},
		},
		{
			Round:          round,
			ActorID:        pet.ID,
			ActorPosition:  pet.Position,
			TargetID:       pet.ID,
			TargetPosition: -1,
			ActionType:     ActionTypeIdle,
			BehaviorID:     18000,
		},
	}
}

func petActionCaster(actor *Participant, fallback *Participant) *Participant {
	if actor != nil {
		return actor
	}
	return fallback
}
