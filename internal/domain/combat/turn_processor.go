// Open-sourced by BaoLT

// Turn processor handles batch round resolution for battles.
// Collects commands from all participants, sorts by speed, executes actions,
// and returns the complete round result.
package combat

import (
	"math/rand"
	"sort"

	"go.uber.org/zap"

	"mcgame-server/internal/domain/skill"
)

const (
	ClientActionAttack   = -10
	ClientActionDefend   = -20
	ClientActionEscape   = -30
	ClientActionTimeout  = -40
	ClientActionSkill    = -50
	ClientActionItem     = -60
	ClientActionCatch    = -70
	ClientActionPosition = -80
	ClientActionReturn   = -90
	ClientActionPet      = -100
	ClientActionAuto     = -110
)

type BattleCommand struct {
	ActorID        string
	TargetID       string
	ActionType     int
	SkillID        int
	SkillLevel     int
	ItemSlot       int
	SelectedPetID  int64
	ReplacementPet *Participant
	QueuedLeave    bool
}

type RoundResult struct {
	Round          int
	Actions        []*BattleAction
	StateChanges   []StateChange
	BattleEnded    bool
	Winner         Side
	MoreTurns      bool
	PlayerFled     bool
	PetStateOwners []int64
}

type StateChange struct {
	ParticipantID string
	Field         string
	OldValue      interface{}
	NewValue      interface{}
}

type TurnProcessor struct {
	battle            *Battle
	skillGetter       SkillGetter
	itemHandler       ItemHandler
	catchHandler      CatchHandler
	logger            *zap.Logger
	commands          map[string]*BattleCommand
	defendingIDs      map[string]bool
	accuracyModifiers map[string]float64
	skillCooldowns    map[string]map[int]int
	statusManager     *StatusEffectManager
	petStateOwners    map[int64]struct{}
	orderedActors     []*Participant
	currentActorIdx   int
	roundStarted      bool
	rng               *rand.Rand
}

type SkillInfo struct {
	Template     *skill.SkillTemplate
	CombatTarget TargetType
	AreaType     AreaType
	AreaSize     int
	BuffID       int
	BuffRate     float64
	BuffDuration int
}

type SkillGetter interface {
	GetSkillInfo(skillID int) *SkillInfo
	GetCreatureSkillIDs(creatureTemplateID int) []int
}

type ItemHandler interface {
	ExecuteItemUse(actorID string, itemID int) (hpRestored int, mpRestored int, consumed bool)
}

func NewTurnProcessor(battle *Battle, skillGetter SkillGetter) *TurnProcessor {
	return &TurnProcessor{
		battle:            battle,
		skillGetter:       skillGetter,
		logger:            zap.NewNop(),
		commands:          make(map[string]*BattleCommand),
		defendingIDs:      make(map[string]bool),
		accuracyModifiers: make(map[string]float64),
		skillCooldowns:    make(map[string]map[int]int),
		statusManager:     battle.StatusManager,
		petStateOwners:    make(map[int64]struct{}),
		orderedActors:     nil,
		currentActorIdx:   0,
		roundStarted:      false,
		rng:               rand.New(rand.NewSource(rand.Int63())),
	}
}

func (tp *TurnProcessor) SetLogger(logger *zap.Logger) {
	tp.logger = logger
}

func (tp *TurnProcessor) SetItemHandler(handler ItemHandler) {
	tp.itemHandler = handler
}

func (tp *TurnProcessor) SetCatchHandler(handler CatchHandler) {
	tp.catchHandler = handler
}

func (tp *TurnProcessor) ApplyStatusEffect(participantID string, effect *StatusEffect) {
	tp.statusManager.AddEffect(participantID, effect)
}

func (tp *TurnProcessor) GetStatusManager() *StatusEffectManager {
	return tp.statusManager
}

func (tp *TurnProcessor) SetCommand(cmd *BattleCommand) {
	tp.commands[cmd.ActorID] = cmd
}

func (tp *TurnProcessor) SetCommands(cmds []*BattleCommand) {
	for _, cmd := range cmds {
		tp.commands[cmd.ActorID] = cmd
	}
}

func (tp *TurnProcessor) HasCommand(actorID string) bool {
	_, exists := tp.commands[actorID]
	return exists
}

func (tp *TurnProcessor) GenerateNPCCommands() {
	ai := NewNPCAISelector(tp.skillGetter)
	enemies := tp.battle.GetAliveParticipants(SideEnemy)
	for _, enemy := range enemies {
		if !enemy.IsNPC {
			continue
		}
		if tp.HasCommand(enemy.ID) {
			continue
		}

		cmd := ai.SelectCommand(enemy, tp.battle)
		tp.commands[enemy.ID] = cmd
	}

	tp.generatePetCommands()
}

func (tp *TurnProcessor) generatePetCommands() {
	players := tp.battle.GetAliveParticipants(SidePlayer)
	for _, p := range players {
		if p.EntityType != ParticipantTypePet {
			continue
		}
		if tp.HasCommand(p.ID) {
			continue
		}

		target := SelectFrontlineTarget(tp.battle, SideEnemy)
		if target == nil {
			target = SelectRandomTarget(tp.battle, SideEnemy)
		}
		if target == nil {
			tp.commands[p.ID] = &BattleCommand{
				ActorID:    p.ID,
				ActionType: ClientActionTimeout,
			}
			continue
		}

		tp.commands[p.ID] = &BattleCommand{
			ActorID:    p.ID,
			TargetID:   target.ID,
			ActionType: ClientActionAttack,
			SkillID:    0,
		}
	}
}

func (tp *TurnProcessor) ProcessRound() *RoundResult {
	result := &RoundResult{
		Round:        tp.battle.CurrentRound,
		Actions:      make([]*BattleAction, 0),
		StateChanges: make([]StateChange, 0),
	}

	tp.GenerateNPCCommands()
	tp.decrementCooldowns()

	tp.defendingIDs = make(map[string]bool)
	for _, cmd := range tp.commands {
		if cmd.ActionType == ClientActionDefend {
			tp.defendingIDs[cmd.ActorID] = true
		}
	}

	orderedActors := tp.getOrderedActors()

	tp.logger.Debug("ProcessRound starting",
		zap.Int("round", tp.battle.CurrentRound),
		zap.Int("commands", len(tp.commands)),
		zap.Int("actors", len(orderedActors)))
	for actorID, cmd := range tp.commands {
		tp.logger.Debug("ProcessRound command",
			zap.String("actor_id", actorID),
			zap.String("target_id", cmd.TargetID),
			zap.Int("action_type", cmd.ActionType))
	}
	for _, actor := range orderedActors {
		tp.logger.Debug("ProcessRound ordered actor",
			zap.String("id", actor.ID),
			zap.String("name", actor.Name),
			zap.Int("side", int(actor.Side)),
			zap.Bool("is_alive", actor.IsAlive))
	}

	for _, actor := range orderedActors {
		originalActorID := actor.ID
		originalPosition := actor.Position

		currentActor := tp.battle.GetParticipant(originalActorID)
		if currentActor == nil || !currentActor.IsAlive {
			skipAction := &BattleAction{
				Round:          tp.battle.CurrentRound,
				ActorID:        originalActorID,
				ActorPosition:  originalPosition,
				TargetID:       originalActorID,
				TargetPosition: originalPosition,
				ActionType:     ActionTypeAuto,
				Effects:        []string{"skip"},
			}
			result.Actions = append(result.Actions, skipAction)
			tp.logger.Debug("Skipping dead or gone actor",
				zap.String("id", originalActorID),
				zap.Bool("is_alive", currentActor != nil && currentActor.IsAlive))
			continue
		}

		turnResult := tp.statusManager.ProcessTurnStart(currentActor.ID, currentActor)
		tp.accuracyModifiers[currentActor.ID] = turnResult.AccuracyModifier

		if turnResult.DamageTaken > 0 {
			currentActor.TakeDamage(turnResult.DamageTaken)
			dotAction := &BattleAction{
				Round:         tp.battle.CurrentRound,
				ActorID:       currentActor.ID,
				ActorPosition: currentActor.Position,
				ActionType:    ActionTypeAuto,
				TargetID:      currentActor.ID,
				Damage:        turnResult.DamageTaken,
				Effects:       []string{"dot"},
			}
			result.Actions = append(result.Actions, dotAction)
			tp.battle.AddAction(dotAction)

			if !currentActor.IsAlive {
				if ended, winner := tp.battle.CheckVictory(); ended {
					result.BattleEnded = true
					result.Winner = winner
					return result
				}
				continue
			}
		}

		if !turnResult.CanAct {
			skipAction := &BattleAction{
				Round:          tp.battle.CurrentRound,
				ActorID:        currentActor.ID,
				ActorPosition:  currentActor.Position,
				TargetID:       currentActor.ID,
				TargetPosition: currentActor.Position,
				ActionType:     ActionTypeAuto,
				Effects:        []string{GetStatusEffectName(turnResult.BlockingEffect)},
			}
			result.Actions = append(result.Actions, skipAction)
			continue
		}

		cmd, exists := tp.commands[currentActor.ID]
		if !exists {
			cmd = &BattleCommand{
				ActorID:    currentActor.ID,
				ActionType: ClientActionTimeout,
			}
		}

		actions := tp.executeCommand(currentActor, cmd)
		for _, action := range actions {
			if action != nil {
				result.Actions = append(result.Actions, action)
				tp.battle.AddAction(action)
			}
		}

		if tp.battle.HasPlayerFled() {
			result.PlayerFled = true
			result.BattleEnded = true
			result.Winner = SideEnemy
			tp.logger.Debug("Player fled, ending battle")
			break
		}

		if ended, winner := tp.battle.CheckVictory(); ended {
			result.BattleEnded = true
			result.Winner = winner
			break
		}
	}

	if !result.BattleEnded {
		if !tp.battle.NextRound() {
			result.BattleEnded = true
			result.Winner = SideEnemy
		}
	}

	tp.logger.Debug("ProcessRound complete",
		zap.Int("actions", len(result.Actions)),
		zap.Bool("battle_ended", result.BattleEnded),
		zap.Bool("player_fled", result.PlayerFled))

	result.PetStateOwners = tp.petStateOwnerList()
	tp.commands = make(map[string]*BattleCommand)
	tp.defendingIDs = make(map[string]bool)
	tp.petStateOwners = make(map[int64]struct{})

	return result
}

func (tp *TurnProcessor) markPetStateOwner(ownerID int64) {
	if ownerID <= 0 {
		return
	}
	tp.petStateOwners[ownerID] = struct{}{}
}

func (tp *TurnProcessor) petStateOwnerList() []int64 {
	if len(tp.petStateOwners) == 0 {
		return nil
	}
	ownerIDs := make([]int64, 0, len(tp.petStateOwners))
	for ownerID := range tp.petStateOwners {
		ownerIDs = append(ownerIDs, ownerID)
	}
	sort.Slice(ownerIDs, func(i, j int) bool {
		return ownerIDs[i] < ownerIDs[j]
	})
	return ownerIDs
}

func (tp *TurnProcessor) ProcessNextActor() *RoundResult {
	result := &RoundResult{
		Round:        tp.battle.CurrentRound,
		Actions:      make([]*BattleAction, 0),
		StateChanges: make([]StateChange, 0),
		MoreTurns:    false,
	}

	if !tp.roundStarted {
		tp.GenerateNPCCommands()

		tp.defendingIDs = make(map[string]bool)
		for _, cmd := range tp.commands {
			if cmd.ActionType == ClientActionDefend {
				tp.defendingIDs[cmd.ActorID] = true
			}
		}

		tp.orderedActors = tp.getOrderedActors()
		tp.currentActorIdx = 0
		tp.roundStarted = true

		tp.logger.Debug("ProcessNextActor starting round",
			zap.Int("round", tp.battle.CurrentRound),
			zap.Int("commands", len(tp.commands)),
			zap.Int("actors", len(tp.orderedActors)))
	}

	for tp.currentActorIdx < len(tp.orderedActors) {
		actor := tp.orderedActors[tp.currentActorIdx]
		tp.currentActorIdx++

		currentActor := tp.battle.GetParticipant(actor.ID)
		if currentActor == nil || !currentActor.IsAlive {
			tp.logger.Debug("Skipping dead actor",
				zap.String("id", actor.ID))
			continue
		}

		tp.logger.Debug("Processing actor",
			zap.String("id", currentActor.ID),
			zap.String("name", currentActor.Name),
			zap.Int("side", int(currentActor.Side)))

		turnResult := tp.statusManager.ProcessTurnStart(currentActor.ID, currentActor)
		tp.accuracyModifiers[currentActor.ID] = turnResult.AccuracyModifier

		if turnResult.DamageTaken > 0 {
			currentActor.TakeDamage(turnResult.DamageTaken)
			dotAction := &BattleAction{
				Round:         tp.battle.CurrentRound,
				ActorID:       currentActor.ID,
				ActorPosition: currentActor.Position,
				ActionType:    ActionTypeAuto,
				TargetID:      currentActor.ID,
				Damage:        turnResult.DamageTaken,
				Effects:       []string{"dot"},
			}
			result.Actions = append(result.Actions, dotAction)
			tp.battle.AddAction(dotAction)

			if !currentActor.IsAlive {
				if ended, winner := tp.battle.CheckVictory(); ended {
					result.BattleEnded = true
					result.Winner = winner
					tp.finishRound()
					return result
				}
				continue
			}
		}

		if !turnResult.CanAct {
			skipAction := &BattleAction{
				Round:          tp.battle.CurrentRound,
				ActorID:        currentActor.ID,
				ActorPosition:  currentActor.Position,
				TargetID:       currentActor.ID,
				TargetPosition: currentActor.Position,
				ActionType:     ActionTypeAuto,
				Effects:        []string{GetStatusEffectName(turnResult.BlockingEffect)},
			}
			result.Actions = append(result.Actions, skipAction)
			continue
		}

		cmd, exists := tp.commands[currentActor.ID]
		if !exists {
			cmd = &BattleCommand{
				ActorID:    currentActor.ID,
				ActionType: ClientActionTimeout,
			}
		}

		actions := tp.executeCommand(currentActor, cmd)
		for _, action := range actions {
			if action != nil {
				result.Actions = append(result.Actions, action)
				tp.battle.AddAction(action)
			}
		}

		if tp.battle.HasPlayerFled() {
			result.PlayerFled = true
			result.BattleEnded = true
			result.Winner = SideEnemy
			tp.finishRound()
			return result
		}

		if ended, winner := tp.battle.CheckVictory(); ended {
			result.BattleEnded = true
			result.Winner = winner
			tp.finishRound()
			return result
		}

		result.MoreTurns = true
		tp.logger.Debug("ProcessNextActor processed actor, more turns remaining")
		return result
	}

	if tp.finishRound() {
		result.BattleEnded = true
		result.Winner = SideEnemy
	}
	return result
}

func (tp *TurnProcessor) finishRound() bool {
	roundLimitReached := false
	if !tp.battle.IsEnded() {
		if !tp.battle.NextRound() {
			roundLimitReached = true
		}
	}
	tp.commands = make(map[string]*BattleCommand)
	tp.defendingIDs = make(map[string]bool)
	tp.orderedActors = nil
	tp.currentActorIdx = 0
	tp.roundStarted = false
	tp.logger.Debug("Round finished")
	return roundLimitReached
}

func (tp *TurnProcessor) getOrderedActors() []*Participant {
	actors := make([]*Participant, 0)
	for actorID := range tp.commands {
		p := tp.battle.GetParticipant(actorID)
		if p != nil {
			actors = append(actors, p)
		}
	}

	sort.Slice(actors, func(i, j int) bool {
		si := float64(actors[i].Speed) * tp.statusManager.GetSpeedModifier(actors[i].ID)
		sj := float64(actors[j].Speed) * tp.statusManager.GetSpeedModifier(actors[j].ID)
		return si > sj
	})

	return actors
}
