// Open-sourced by BaoLT

// Combat service handles battle-related use cases.
// Manages PVE battles, skill learning, and NPC interactions.
// Calculates damage, rewards, and handles turn-based combat flow.
package combat

import (
	"context"
	"errors"
	"fmt"
	"sync"

	appbossloot "mcgame-server/internal/application/bossloot"
	appitem "mcgame-server/internal/application/item"
	apppet "mcgame-server/internal/application/pet"
	appquest "mcgame-server/internal/application/quest"
	appsb "mcgame-server/internal/application/scheduleboss"
	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/combat"
	"mcgame-server/internal/domain/creature"
	"mcgame-server/internal/domain/npc"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/domain/skill"
	"mcgame-server/internal/gamedata"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type EquipmentStatsProvider interface {
	AggregateEquipmentStats(ctx context.Context, charID int64) character.EquipmentStatBonuses
	GetBattleEquipmentInfo(ctx context.Context, charID int64, gender int) (weaponResCode int64, star int)
}

type Service struct {
	battleRepo         combat.BattleRepository
	battleLogRepo      combat.BattleLogRepository
	skillRepo          skill.Repository
	charRepo           character.Repository
	npcRepo            npc.Repository
	petRepo            domainpet.Repository
	equipStatsProvider EquipmentStatsProvider
	itemService        *appitem.Service
	petService         *apppet.Service
	questService       *appquest.Service
	catchHandler       combat.CatchHandler
	scheduleBoss       *appsb.Service
	bossLoot           *appbossloot.Service
	logger             *zap.Logger
	gamedataManager    *gamedata.Manager
	gamedataManagerMu  sync.RWMutex
	endedBattleMu      sync.RWMutex
	endedBattles       map[string]*endedBattleCacheEntry
}

type endedBattleCacheEntry struct {
	battle          *combat.Battle
	pendingCleanups map[string]struct{}
}

type BattlePetStateChange struct {
	OwnerID int64
	PetID   int64
	State   int
}

func NewService(
	battleRepo combat.BattleRepository,
	battleLogRepo combat.BattleLogRepository,
	skillRepo skill.Repository,
	charRepo character.Repository,
	npcRepo npc.Repository,
	petRepo domainpet.Repository,
	logger *zap.Logger,
) *Service {
	return &Service{
		battleRepo:    battleRepo,
		battleLogRepo: battleLogRepo,
		skillRepo:     skillRepo,
		charRepo:      charRepo,
		npcRepo:       npcRepo,
		petRepo:       petRepo,
		logger:        logger,
		endedBattles:  make(map[string]*endedBattleCacheEntry),
	}
}

func (s *Service) SetEquipmentStatsProvider(provider EquipmentStatsProvider) {
	s.equipStatsProvider = provider
}

func (s *Service) SetItemService(itemService *appitem.Service) {
	s.itemService = itemService
}

func (s *Service) SetPetService(petService *apppet.Service) {
	s.petService = petService
	if petService == nil {
		s.catchHandler = nil
		return
	}
	s.catchHandler = newCombatCatchHandler(s)
}

func (s *Service) SetQuestService(questService *appquest.Service) {
	s.questService = questService
}

func (s *Service) SetGameDataManager(gm *gamedata.Manager) {
	s.gamedataManagerMu.Lock()
	defer s.gamedataManagerMu.Unlock()
	s.gamedataManager = gm
}

func (s *Service) SetScheduleBossService(sb *appsb.Service) {
	s.scheduleBoss = sb
}

func (s *Service) SetBossLootService(bl *appbossloot.Service) {
	s.bossLoot = bl
}

func (s *Service) dispatchScheduleBossKills(battle *combat.Battle) {
	if s.scheduleBoss == nil || battle == nil || battle.ChannelID <= 0 {
		return
	}
	var killerID int64
	for _, p := range battle.GetParticipantsBySide(combat.SidePlayer) {
		if p == nil || p.EntityType != combat.ParticipantTypeCharacter {
			continue
		}
		killerID = p.EntityID
		break
	}
	type killTarget struct {
		nid int
	}
	targets := make([]killTarget, 0)
	for _, e := range battle.GetParticipantsBySide(combat.SideEnemy) {
		if e == nil || e.EntityType != combat.ParticipantTypeCreature {
			continue
		}
		targets = append(targets, killTarget{nid: int(e.EntityID)})
	}
	if len(targets) == 0 {
		return
	}
	channelID := battle.ChannelID
	scheduleBoss := s.scheduleBoss
	logger := s.logger
	go func() {
		bgCtx := context.Background()
		for _, t := range targets {
			if err := scheduleBoss.OnBossKilled(bgCtx, t.nid, channelID, killerID); err != nil {
				logger.Warn("schedule boss kill hook failed",
					zap.Int("nid", t.nid),
					zap.Int("channel_id", channelID),
					zap.Error(err))
			}
		}
	}()
}

func (s *Service) getGameDataManager() *gamedata.Manager {
	s.gamedataManagerMu.RLock()
	defer s.gamedataManagerMu.RUnlock()
	return s.gamedataManager
}

func (s *Service) GetCatchHandler() combat.CatchHandler {
	if s.catchHandler == nil && s.petService != nil {
		s.catchHandler = newCombatCatchHandler(s)
	}
	return s.catchHandler
}

func (s *Service) GetBattle(battleID string) (*combat.Battle, error) {
	return s.battleRepo.GetByID(battleID)
}

func (s *Service) GetBattleForCleanup(battleID string) (*combat.Battle, error) {
	battle, err := s.battleRepo.GetByID(battleID)
	if err == nil {
		return battle, nil
	}
	if !errors.Is(err, pkgerrors.ErrNotFound) {
		return nil, err
	}

	s.endedBattleMu.RLock()
	defer s.endedBattleMu.RUnlock()

	entry, ok := s.endedBattles[battleID]
	if !ok || entry == nil || entry.battle == nil {
		return nil, pkgerrors.ErrNotFound
	}
	return entry.battle, nil
}

func (s *Service) AckBattleCleanup(battleID string, characterID int64) {
	s.endedBattleMu.Lock()
	defer s.endedBattleMu.Unlock()

	entry, ok := s.endedBattles[battleID]
	if !ok || entry == nil {
		return
	}

	delete(entry.pendingCleanups, fmt.Sprintf("%d", characterID))
	if len(entry.pendingCleanups) == 0 {
		delete(s.endedBattles, battleID)
	}
}

func (s *Service) resolveDefeatedPlayerBattle(ctx context.Context, charID int64, battle *combat.Battle) bool {
	if battle == nil || !battle.IsActive() {
		return false
	}

	player := battle.GetParticipant(fmt.Sprintf("%d", charID))
	if player == nil || player.IsAlive {
		return false
	}

	winner := combat.SideEnemy
	if ended, resolvedWinner := battle.CheckVictory(); ended {
		winner = resolvedWinner
	}

	s.EndBattle(ctx, battle, winner)
	return true
}

func (s *Service) HandleCharacterDisconnect(ctx context.Context, charID int64) (string, bool, error) {
	battle, err := s.GetPlayerBattle(charID)
	if err != nil {
		if errors.Is(err, pkgerrors.ErrNotFound) {
			return "", false, nil
		}
		return "", false, err
	}

	if battle == nil || !battle.IsActive() {
		return "", false, nil
	}

	participantID := fmt.Sprintf("%d", charID)
	player := battle.GetParticipant(participantID)
	if player != nil {
		if err := s.charRepo.UpdateStats(ctx, charID, player.CurrentHP, player.CurrentMP, player.CurrentSP); err != nil {
			s.logger.Warn("Failed to persist character stats on disconnect battle cleanup",
				zap.Int64("character_id", charID),
				zap.String("battle_id", battle.ID),
				zap.Error(err))
		}
	}

	if battle.CountAlivePlayerCharacters() > 1 {
		pendingCommands := battle.GetPendingCommands()
		pendingCommands[participantID] = &combat.BattleCommand{
			ActorID:     participantID,
			ActionType:  combat.ClientActionEscape,
			QueuedLeave: true,
		}
		battle.SetPendingCommands(pendingCommands)
		s.logger.Info("Grouped battle participant queued leave action",
			zap.Int64("character_id", charID),
			zap.String("battle_id", battle.ID),
			zap.Int("remaining_player_characters", battle.CountAlivePlayerCharacters()-1))
		return battle.ID, false, nil
	}

	winner := combat.SideEnemy
	if ended, resolvedWinner := battle.CheckVictory(); ended {
		winner = resolvedWinner
	}

	s.EndBattle(ctx, battle, winner)

	s.logger.Info("Active battle ended due to character disconnect",
		zap.Int64("character_id", charID),
		zap.String("battle_id", battle.ID),
		zap.Int("winner", int(winner)))

	return battle.ID, true, nil
}

func (s *Service) GetPlayerBattle(charID int64) (*combat.Battle, error) {
	return s.battleRepo.GetByParticipant(fmt.Sprintf("%d", charID))
}

func (s *Service) ResolveBattlePetSelection(ctx context.Context, charID int64, petID int64, position int) (*combat.Participant, error) {
	petEntity, err := s.petRepo.FindByID(ctx, petID)
	if err != nil {
		return nil, err
	}
	if petEntity == nil || petEntity.CharacterID != charID {
		return nil, pkgerrors.ErrInvalidTarget
	}
	if petEntity.Life <= 0 {
		return nil, pkgerrors.ErrPetDead
	}
	s.populateBattlePetCreatureData(petEntity)
	return s.buildPetParticipantFromPet(petEntity, charID, position), nil
}

func (s *Service) SyncBattlePetStates(ctx context.Context, battle *combat.Battle, ownerIDs []int64) ([]BattlePetStateChange, error) {
	if battle == nil || s.petRepo == nil || len(ownerIDs) == 0 {
		return nil, nil
	}

	uniqueOwners := make(map[int64]struct{}, len(ownerIDs))
	for _, ownerID := range ownerIDs {
		if ownerID > 0 {
			uniqueOwners[ownerID] = struct{}{}
		}
	}

	stateChanges := make([]BattlePetStateChange, 0)
	for ownerID := range uniqueOwners {
		pets, err := s.petRepo.FindByCharacterID(ctx, ownerID)
		if err != nil {
			return nil, err
		}

		activePetID := int64(0)
		if activePet := battle.GetOwnerPet(ownerID); activePet != nil {
			activePetID = activePet.EntityID
		}

		for _, candidate := range pets {
			if candidate == nil {
				continue
			}

			originalState := candidate.ClientState()
			originalBindState := candidate.BindState()
			targetState := int(domainpet.PetStateRest)
			if candidate.ID == activePetID {
				targetState = int(domainpet.PetStateBattle)
				candidate.SetBinded(true)
			}
			candidate.SetClientState(targetState)
			if originalState == candidate.ClientState() && originalBindState == candidate.BindState() {
				continue
			}
			if err := s.petRepo.Save(ctx, candidate); err != nil {
				return nil, err
			}
			if originalState != candidate.ClientState() {
				stateChanges = append(stateChanges, BattlePetStateChange{
					OwnerID: ownerID,
					PetID:   candidate.ID,
					State:   candidate.ClientState(),
				})
			}
		}
	}

	return stateChanges, nil
}

func (s *Service) ExecuteAction(
	ctx context.Context,
	battleID string,
	actorID string,
	actionType combat.ActionType,
	skillID int,
	targetID string,
) (*combat.BattleAction, error) {
	battle, err := s.battleRepo.GetByID(battleID)
	if err != nil {
		return nil, err
	}

	if !battle.IsActive() {
		return nil, pkgerrors.ErrNotInBattle
	}

	actor := battle.GetParticipant(actorID)
	if actor == nil || !actor.IsAlive {
		return nil, pkgerrors.ErrInvalidTarget
	}

	target := battle.GetParticipant(targetID)
	if target == nil {
		if actor.Side == combat.SidePlayer {
			target = combat.SelectRandomTarget(battle, combat.SideEnemy)
		} else {
			target = combat.SelectRandomTarget(battle, combat.SidePlayer)
		}
	}

	if target == nil || !target.IsAlive {
		return nil, pkgerrors.ErrInvalidTarget
	}

	sk := skill.GetSkillTemplate(skillID)
	if sk == nil {
		sk = skill.DefaultSkillTemplates[1001]
	}

	if !actor.UseMP(sk.MPCost) {
		return nil, pkgerrors.ErrInsufficientMP
	}

	action := &combat.BattleAction{
		ActorID:    actorID,
		ActionType: actionType,
		SkillID:    skillID,
		TargetID:   targetID,
	}

	if sk.SkillType == skill.SkillTypeHeal {
		heal := combat.CalculateHealing(actor, sk)
		actor.Heal(heal)
		action.Damage = -heal
	} else {
		result := combat.CalculateDamage(actor, target, sk)
		action.Damage = result.Damage
		action.IsCritical = result.IsCritical
		action.IsMiss = result.IsMiss

		if !result.IsMiss {
			target.TakeDamage(result.Damage)
		}
	}

	battle.AddAction(action)

	if ended, winner := battle.CheckVictory(); ended {
		s.EndBattle(ctx, battle, winner)
	}

	s.logger.Debug("Combat action executed",
		zap.String("battle_id", battleID),
		zap.String("actor", actorID),
		zap.Int("skill_id", skillID),
		zap.Int("damage", action.Damage))

	return action, nil
}

func (s *Service) ProcessNPCTurn(ctx context.Context, battle *combat.Battle) []*combat.BattleAction {
	actions := make([]*combat.BattleAction, 0)

	enemies := battle.GetAliveParticipants(combat.SideEnemy)
	for _, enemy := range enemies {
		if !enemy.IsNPC || !enemy.IsAlive {
			continue
		}

		target := combat.SelectRandomTarget(battle, combat.SidePlayer)
		if target == nil {
			continue
		}

		action, err := s.ExecuteAction(ctx, battle.ID, enemy.ID, combat.ActionTypeAttack, 1001, target.ID)
		if err != nil {
			s.logger.Warn("NPC action failed", zap.Error(err))
			continue
		}
		actions = append(actions, action)
	}

	return actions
}

func (s *Service) EndBattle(ctx context.Context, battle *combat.Battle, winner combat.Side) *combat.BattleResult {
	result := &combat.BattleResult{
		WinnerSide:       winner,
		ItemRewards:      make([]combat.ItemDrop, 0),
		PetRewards:       make([]combat.PetReward, 0),
		CharacterRewards: make(map[int64]*combat.CharacterReward),
	}

	if winner == combat.SidePlayer {
		players := battle.GetParticipantsBySide(combat.SidePlayer)
		playerLevel := 1
		if len(players) > 0 {
			playerLevel = players[0].Level
		}

		enemies := battle.GetParticipantsBySide(combat.SideEnemy)
		result.ExpReward = combat.CalculateExpReward(playerLevel, enemies)
		result.MoneyReward = combat.CalculateMoneyReward(enemies)
	}

	if winner == combat.SidePlayer && s.scheduleBoss != nil && battle.ChannelID > 0 {
		s.dispatchScheduleBossKills(battle)
	}

	s.applyCharacterRewards(ctx, battle, result)
	s.applyPetRewards(ctx, battle, result)
	s.applyPetLifeDrain(ctx, battle)
	s.ApplyItemDrops(ctx, battle, result)
	s.ApplyBossLootDrops(ctx, battle, result)
	s.applyCaughtPetRewards(ctx, battle, result)

	battle.End(result)
	s.cacheEndedBattle(battle)

	if err := s.battleLogRepo.Save(ctx, battle); err != nil {
		s.logger.Error("Failed to save battle log", zap.Error(err))
	}

	s.battleRepo.Remove(battle.ID)

	s.logger.Info("Battle ended",
		zap.String("battle_id", battle.ID),
		zap.Int("winner", int(winner)),
		zap.Int64("exp_reward", result.ExpReward),
		zap.Int64("money_reward", result.MoneyReward))

	return result
}

func (s *Service) cacheEndedBattle(battle *combat.Battle) {
	if battle == nil {
		return
	}

	pendingCleanups := make(map[string]struct{})
	for _, participant := range battle.Participants {
		if participant == nil {
			continue
		}
		if participant.Side != combat.SidePlayer || participant.EntityType != combat.ParticipantTypeCharacter {
			continue
		}
		pendingCleanups[participant.ID] = struct{}{}
	}

	s.endedBattleMu.Lock()
	defer s.endedBattleMu.Unlock()
	s.endedBattles[battle.ID] = &endedBattleCacheEntry{
		battle:          battle,
		pendingCleanups: pendingCleanups,
	}
}

func (s *Service) LearnSkill(ctx context.Context, charID int64, skillID int) (*skill.CharacterSkill, error) {
	template := skill.GetSkillTemplate(skillID)
	if template == nil {
		return nil, pkgerrors.ErrNotFound
	}

	hasSkill, err := s.skillRepo.HasSkill(ctx, charID, skillID)
	if err != nil {
		return nil, err
	}
	if hasSkill {
		return nil, pkgerrors.ErrAlreadyExists
	}

	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return nil, err
	}

	if char.Level < template.RequiredLevel {
		return nil, pkgerrors.ErrInsufficientLevel
	}

	if template.RequiredClass > 0 && char.ClassID != template.RequiredClass {
		return nil, pkgerrors.ErrInvalidInput
	}

	charSkill := skill.NewCharacterSkill(charID, skillID)
	if err := s.skillRepo.Create(ctx, charSkill); err != nil {
		return nil, err
	}

	s.logger.Info("Skill learned",
		zap.Int64("character_id", charID),
		zap.Int("skill_id", skillID))

	return charSkill, nil
}

func (s *Service) GetCharacterSkills(ctx context.Context, charID int64) ([]*skill.CharacterSkill, error) {
	return s.skillRepo.FindByCharacterID(ctx, charID)
}

func (s *Service) SetSkillSlot(ctx context.Context, charID int64, skillID int, slot int) error {
	charSkill, err := s.skillRepo.FindByCharacterAndSkill(ctx, charID, skillID)
	if err != nil {
		return err
	}

	existing, err := s.skillRepo.FindBySlot(ctx, charID, slot)
	if err == nil && existing != nil && existing.ID != charSkill.ID {
		existing.ClearSlot()
		if err := s.skillRepo.Update(ctx, existing); err != nil {
			return err
		}
	}

	charSkill.SetSlot(slot)
	return s.skillRepo.Update(ctx, charSkill)
}

func (s *Service) GetNPCInteraction(ctx context.Context, charID int64, npcID int) (map[string]interface{}, error) {
	npcEntity, err := s.npcRepo.FindByID(ctx, npcID)
	if err != nil {
		return nil, err
	}

	options := make([]map[string]interface{}, 0)

	switch npcEntity.NPCType {
	case creature.NPCTypeQuest:
		options = append(options, map[string]interface{}{
			"action": "talk",
			"label":  "Talk",
		})
	case creature.NPCTypeShop:
		options = append(options, map[string]interface{}{
			"action": "shop",
			"label":  "Open Shop",
		})
	case creature.NPCTypeCallboard:
		options = append(options, map[string]interface{}{
			"action": "quest",
			"label":  "View Quests",
		})
	case creature.NPCTypeBoss:
		options = append(options, map[string]interface{}{
			"action": "fight",
			"label":  "Challenge",
		})
	}

	if npcEntity.NPCType == creature.NPCTypeBattle || npcEntity.NPCType == creature.NPCTypeBoss {
		options = append(options, map[string]interface{}{
			"action": "attack",
			"label":  "Attack",
		})
	}

	return map[string]interface{}{
		"npcId":    npcEntity.ID,
		"name":     npcEntity.Name,
		"type":     int(npcEntity.NPCType),
		"dialogId": npcEntity.DialogID,
		"options":  options,
	}, nil
}
