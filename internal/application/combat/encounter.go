// Open-sourced by BaoLT

// Battle encounter creation and participant setup.
package combat

import (
	"context"
	"fmt"
	"slices"

	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/combat"
	domainelement "mcgame-server/internal/domain/element"
	domainpet "mcgame-server/internal/domain/pet"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (s *Service) initBattleFieldID(ctx context.Context, battle *combat.Battle, charID int64) {
	if s.battleLogRepo != nil {
		logID, err := s.battleLogRepo.CreateInitial(ctx, battle)
		if err != nil {
			s.logger.Warn("Failed to create initial battle log", zap.Error(err))
			battle.BattleFieldID = fmt.Sprintf("%d_%d", battle.CreatedAt.UnixMilli(), charID)
			return
		}
		battle.LogID = logID
		battle.BattleFieldID = fmt.Sprintf("%d_%d", logID, charID)
		return
	}
	battle.BattleFieldID = fmt.Sprintf("%d_%d", battle.CreatedAt.UnixMilli(), charID)
}

func playerBattlePositions(playerInFront bool) ([]combat.BattlePosition, []combat.BattlePosition) {
	if playerInFront {
		return combat.PlayerPetPositions, combat.PlayerCharPositions
	}
	return combat.PlayerCharPositions, combat.PlayerPetPositions
}

func copyCharStatsToParticipant(p *combat.Participant, c *character.Character) {
	p.Level = c.Level
	p.MaxHP = c.MaxHP
	p.CurrentHP = c.CurrentHP
	p.MaxMP = c.MaxMP
	p.CurrentMP = c.CurrentMP
	p.MaxSP = c.MaxSP
	p.CurrentSP = c.CurrentSP
	p.Attack = c.Attack
	p.Defense = c.Defense
	p.MagicAttack = c.MagicAttack
	p.MagicDefense = c.MagicDefense
	p.Speed = c.Speed
	p.Hit = c.Hit
	p.Dodge = c.Dodge
	p.Critical = c.Critical
	p.CriticalDmg = c.CriticalDmg
	p.Counter = c.FinalCounter
	p.Combo = c.FinalCombo
	p.PraDef = int(c.FinalPraDef)
	p.PraMagDef = int(c.FinalPraMagDef)
	p.ReduceHurt1 = c.FinalReduceHurt1
	p.ReduceHurt2 = c.FinalReduceHurt2
	p.ResiCritical = int(c.FinalResiCritical)
	p.ResiDefy = int(c.FinalResiDefy)
	p.EnhPhyHurt = int(c.FinalEnhPhyHurt)
	p.EnhMagicHurt = int(c.FinalEnhMagicHurt)
	p.Ee = c.Ee
	p.Ef = c.Ef
	p.En = c.En
}

func (s *Service) addPetParticipant(ctx context.Context, battle *combat.Battle, charID int64, position int) {
	battlePet, err := s.getBattlePet(ctx, charID)
	if err != nil || battlePet == nil {
		return
	}

	petParticipant := s.buildPetParticipantFromPet(battlePet, charID, position)
	if petParticipant == nil {
		return
	}

	battle.AddParticipant(petParticipant)

	s.logger.Debug("Pet joined battle",
		zap.Int64("pet_id", battlePet.ID),
		zap.String("pet_name", battlePet.Name))
}

func (s *Service) buildPetParticipantFromPet(battlePet *domainpet.Pet, charID int64, position int) *combat.Participant {
	if battlePet == nil {
		return nil
	}

	petParticipant := combat.NewParticipant(
		fmt.Sprintf("pet_%d", battlePet.ID),
		battlePet.Name,
		combat.SidePlayer,
		false,
	)
	petParticipant.Level = battlePet.Level
	petParticipant.MaxHP = battlePet.MaxHP
	petParticipant.CurrentHP = battlePet.CurrentHP
	petParticipant.MaxMP = battlePet.MaxMP
	petParticipant.CurrentMP = battlePet.CurrentMP

	combatStats := battlePet.GetCombatStats()
	petParticipant.Attack = combatStats["attack"]
	petParticipant.Defense = combatStats["defense"]
	petParticipant.MagicAttack = combatStats["magicAttack"]
	petParticipant.MagicDefense = combatStats["magicDefense"]
	petParticipant.Speed = combatStats["speed"]
	petParticipant.Hit = combatStats["hit"]
	petParticipant.Dodge = combatStats["dodge"]
	petParticipant.Critical = combatStats["critical"]
	petParticipant.CriticalDmg = combatStats["criticalDmg"]
	if petParticipant.CriticalDmg == 0 {
		petParticipant.CriticalDmg = 150
	}
	petParticipant.Counter = combatStats["counter"]
	petParticipant.Combo = combatStats["combo"]
	petParticipant.PraDef = combatStats["praDef"]
	petParticipant.PraMagDef = combatStats["praMagDef"]
	petParticipant.ReduceHurt1 = combatStats["reduceHurt1"]
	petParticipant.ReduceHurt2 = combatStats["reduceHurt2"]
	petParticipant.ResiCritical = combatStats["resiCritical"]
	petParticipant.ResiDefy = combatStats["resiDefy"]
	petParticipant.EnhPhyHurt = combatStats["enhPhyHurt"]
	petParticipant.EnhMagicHurt = combatStats["enhMagicHurt"]
	petParticipant.EffStats = battlePet.Effective()
	petParticipant.EntityType = combat.ParticipantTypePet
	petParticipant.EntityID = battlePet.ID
	petParticipant.Element = domainelement.NormalizeClientElementID(battlePet.Element)
	petParticipant.Position = position
	petParticipant.OwnerID = charID

	if battlePet.CreatureData != nil {
		petParticipant.ResCode = creatureDataInt(battlePet.CreatureData["resCode"])
		petParticipant.IconCode = creatureDataInt(battlePet.CreatureData["iconCode"])
		petParticipant.ColorCode = creatureDataInt(battlePet.CreatureData["colorCode"])
		petParticipant.PetColor = creatureDataInt(battlePet.CreatureData["c"])
	}

	return petParticipant
}

func (s *Service) getBattlePet(ctx context.Context, charID int64) (*domainpet.Pet, error) {
	pets, err := s.petRepo.FindByCharacterID(ctx, charID)
	if err != nil {
		return nil, err
	}

	var followingPet *domainpet.Pet
	for _, candidate := range pets {
		if candidate == nil {
			continue
		}
		if candidate.ClientState() == int(domainpet.PetStateBattle) {
			if candidate.Life <= 0 {
				continue
			}
			s.populateBattlePetCreatureData(candidate)
			return candidate, nil
		}
		if candidate.IsFollowing && followingPet == nil && candidate.Life > 0 {
			followingPet = candidate
		}
	}

	if followingPet != nil {
		s.populateBattlePetCreatureData(followingPet)
	}

	return followingPet, nil
}

func (s *Service) populateBattlePetCreatureData(p *domainpet.Pet) {
	if p == nil || p.CreatureData != nil {
		return
	}

	gm := s.getGameDataManager()
	if gm == nil {
		return
	}

	creature := gm.GetCreature(p.TemplateID)
	if creature == nil {
		return
	}

	p.SetCreatureData(creature)
}

func (s *Service) BuildNPCTemplateForCharacter(ctx context.Context, charID int64, npcID int) (NPCTemplateData, error) {
	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return NPCTemplateData{}, err
	}

	npcEntity, err := s.npcRepo.FindByID(ctx, npcID)
	if err != nil {
		return NPCTemplateData{}, err
	}

	npcTemplate := NPCTemplateData{
		ID:   npcID,
		Name: npcEntity.Name,
	}

	gm2 := s.getGameDataManager()
	if gm2 != nil {
		mapLevel := 0
		if mt := gm2.GetMap(char.MapID); mt != nil {
			mapLevel = int(mt.Level)
			if mapLevel <= 0 {
				mapLevel = int(mt.Lv)
			}
		}
		mapCreatures := gm2.GetMapCreaturesByMapID(char.MapID)
		for _, mc := range mapCreatures {
			if int(mc.Cid) != npcID {
				continue
			}
			creature := gm2.GetCreature(npcID)
			if creature == nil {
				break
			}
			level := int(mc.Level)
			if level <= 0 {
				level = int(creature.UseLv)
			}
			if level <= 0 && mapLevel > 0 {
				level = mapLevel
			}
			if level <= 0 {
				level = 10
			}
			npcTemplate = CalculateCreatureStats(creature, level)
			npcTemplate.Exp = int(mc.Exp)
			npcTemplate.ExpMulti = mc.ExpMulti
			npcTemplate.BossFlag = int(mc.BossFlag)
			npcTemplate.WithCloud = int(mc.WithCloud)
			break
		}
	}
	if npcTemplate.Level <= 0 {
		npcTemplate.Level = 10
	}

	return npcTemplate, nil
}

func (s *Service) BuildCreatureTemplateForCharacter(ctx context.Context, charID int64, creatureID int) (NPCTemplateData, error) {
	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return NPCTemplateData{}, err
	}

	gm := s.getGameDataManager()
	if gm == nil {
		return NPCTemplateData{}, pkgerrors.ErrNotFound
	}

	creatureTemplate := gm.GetCreature(creatureID)
	if creatureTemplate == nil {
		return NPCTemplateData{}, pkgerrors.ErrNotFound
	}

	mapLevel := 0
	if mt := gm.GetMap(char.MapID); mt != nil {
		mapLevel = int(mt.Level)
		if mapLevel <= 0 {
			mapLevel = int(mt.Lv)
		}
	}

	for _, mc := range gm.GetMapCreaturesByMapID(char.MapID) {
		if int(mc.Cid) != creatureID {
			continue
		}

		level := int(mc.Level)
		if level <= 0 {
			level = int(creatureTemplate.UseLv)
		}
		if level <= 0 && mapLevel > 0 {
			level = mapLevel
		}
		if level <= 0 {
			level = 10
		}

		template := CalculateCreatureStats(creatureTemplate, level)
		template.Exp = int(mc.Exp)
		template.ExpMulti = mc.ExpMulti
		template.BossFlag = int(mc.BossFlag)
		template.WithCloud = int(mc.WithCloud)
		return template, nil
	}

	level := int(creatureTemplate.UseLv)
	if level <= 0 && mapLevel > 0 {
		level = mapLevel
	}
	if level <= 0 {
		level = 10
	}

	return CalculateCreatureStats(creatureTemplate, level), nil
}

func (s *Service) BuildCreatureTemplateAtLevel(ctx context.Context, charID int64, creatureID, level int) (NPCTemplateData, error) {
	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return NPCTemplateData{}, err
	}

	gm := s.getGameDataManager()
	if gm == nil {
		return NPCTemplateData{}, pkgerrors.ErrNotFound
	}

	creatureTemplate := gm.GetCreature(creatureID)
	if creatureTemplate == nil {
		return NPCTemplateData{}, pkgerrors.ErrNotFound
	}

	if level <= 0 {
		level = int(creatureTemplate.UseLv)
	}
	if level <= 0 {
		if mt := gm.GetMap(char.MapID); mt != nil {
			level = int(mt.Level)
			if level <= 0 {
				level = int(mt.Lv)
			}
		}
	}
	if level <= 0 {
		level = 10
	}

	return CalculateCreatureStats(creatureTemplate, level), nil
}

func (s *Service) StartPVEBattleWithRoster(ctx context.Context, charIDs []int64, mapID, channelID int, npcTemplates []NPCTemplateData, playerInFront bool) (*combat.Battle, error) {
	if len(charIDs) == 0 || len(npcTemplates) == 0 {
		return nil, pkgerrors.ErrInvalidInput
	}

	roster := normalizeBattleRoster(charIDs)
	for _, charID := range roster {
		existing, _ := s.battleRepo.GetByParticipant(fmt.Sprintf("%d", charID))
		if existing != nil && existing.IsActive() {
			if !s.resolveDefeatedPlayerBattle(ctx, charID, existing) {
				return nil, pkgerrors.ErrInBattle
			}
		}
	}

	battle := combat.NewBattle(combat.BattleTypePVE, mapID)
	battle.ChannelID = channelID
	playerPositions, petPositions := playerBattlePositions(playerInFront)
	if len(roster) > len(playerPositions) {
		roster = roster[:len(playerPositions)]
	}

	for index, charID := range roster {
		player, err := s.buildPlayerParticipant(ctx, charID, playerPositions[index].ToInt())
		if err != nil {
			return nil, err
		}
		battle.AddParticipant(player)
		s.addPetParticipant(ctx, battle, charID, petPositions[index].ToInt())
	}

	enemySlots := make([]combat.BattlePosition, 0, len(combat.EnemyCharPositions)+len(combat.EnemyPetPositions))
	enemySlots = append(enemySlots, combat.EnemyCharPositions...)
	enemySlots = append(enemySlots, combat.EnemyPetPositions...)

	for index, npcTemplate := range npcTemplates {
		if index >= len(enemySlots) {
			break
		}

		slot := enemySlots[index].ToInt()
		npcTemplate = NormalizeEncounterTemplateForPlayer(npcTemplate, partyReferenceLevel(battle.Participants))
		npcLevel := npcTemplate.Level
		if npcLevel <= 0 {
			npcLevel = 10
		}

		enemy := combat.NewParticipant(
			fmt.Sprintf("npc_%d", slot),
			npcTemplate.Name,
			combat.SideEnemy,
			true,
		)
		enemy.Level = npcLevel
		enemy.EntityType = combat.ParticipantTypeCreature
		enemy.EntityID = int64(npcTemplate.ID)
		enemy.ResCode = npcTemplate.ResCode
		enemy.IconCode = npcTemplate.IconCode
		enemy.ColorCode = npcTemplate.ColorCode
		enemy.BossFlag = npcTemplate.BossFlag
		enemy.WithCloud = npcTemplate.WithCloud
		enemy.Position = slot
		applyTemplateStats(enemy, npcTemplate)
		battle.AddParticipant(enemy)
	}

	battle.Start()
	s.initBattleFieldID(ctx, battle, roster[0])

	if err := s.battleRepo.Store(battle); err != nil {
		return nil, err
	}

	s.logger.Info("PVE battle started with roster",
		zap.String("battle_id", battle.ID),
		zap.String("battle_field_id", battle.BattleFieldID),
		zap.Int64s("character_ids", roster),
		zap.Int("enemy_count", len(npcTemplates)))

	return battle, nil
}

func (s *Service) buildPlayerParticipant(ctx context.Context, charID int64, position int) (*combat.Participant, error) {
	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return nil, err
	}

	gm := s.getGameDataManager()
	if gm != nil {
		if ct := gm.GetClass(char.ClassID); ct != nil {
			char.SetClassAptitudes(
				int(ct.AptStrength),
				int(ct.AptAgility),
				int(ct.AptStamina),
				int(ct.AptIntelligence),
				int(ct.AptEnergy),
			)
		}
	}

	char.RecalculateStats()
	if s.equipStatsProvider != nil {
		bonuses := s.equipStatsProvider.AggregateEquipmentStats(ctx, charID)
		char.ApplyEquipmentBonuses(bonuses)
	}

	player := combat.NewParticipant(fmt.Sprintf("%d", charID), char.Name, combat.SidePlayer, false)
	copyCharStatsToParticipant(player, char)
	player.EffStats = char.Effective()
	player.EntityType = combat.ParticipantTypeCharacter
	player.EntityID = charID
	player.Position = position

	if gm != nil {
		classTemplate := gm.GetClass(char.ClassID)
		if classTemplate != nil {
			if char.Gender == 1 {
				player.ResCode = int(classTemplate.ResCodeMale)
				player.IconCode = int(classTemplate.IconCodeMale)
			} else {
				player.ResCode = int(classTemplate.ResCodeFemale)
				player.IconCode = int(classTemplate.IconCodeFemale)
			}
		}
	}

	if s.equipStatsProvider != nil {
		wpRes, star := s.equipStatsProvider.GetBattleEquipmentInfo(ctx, charID, char.Gender)
		player.WeaponResCode = wpRes
		player.Star = star
	}

	return player, nil
}

func normalizeBattleRoster(charIDs []int64) []int64 {
	roster := make([]int64, 0, len(charIDs))
	for _, charID := range charIDs {
		if charID <= 0 || slices.Contains(roster, charID) {
			continue
		}
		roster = append(roster, charID)
	}
	return roster
}

func partyReferenceLevel(participants []*combat.Participant) int {
	for _, participant := range participants {
		if participant == nil {
			continue
		}
		if participant.Side != combat.SidePlayer || participant.EntityType != combat.ParticipantTypeCharacter {
			continue
		}
		if participant.Level > 0 {
			return participant.Level
		}
	}
	return 1
}

func (s *Service) StartPVEBattle(ctx context.Context, charID int64, npcID, channelID int, playerInFront bool) (*combat.Battle, error) {
	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return nil, err
	}
	npcTemplate, err := s.BuildNPCTemplateForCharacter(ctx, charID, npcID)
	if err != nil {
		return nil, err
	}
	return s.StartPVEBattleWithRoster(ctx, []int64{charID}, char.MapID, channelID, []NPCTemplateData{npcTemplate}, playerInFront)
}

func (s *Service) StartPVEBattleWithTemplate(ctx context.Context, charID int64, mapID, channelID int, npcTemplate NPCTemplateData, playerInFront bool) (*combat.Battle, error) {
	return s.StartPVEBattleWithRoster(ctx, []int64{charID}, mapID, channelID, []NPCTemplateData{npcTemplate}, playerInFront)
}

func (s *Service) StartPVEBattleWithMultipleEnemies(ctx context.Context, charID int64, mapID, channelID int, npcTemplates []NPCTemplateData, playerInFront bool) (*combat.Battle, error) {
	return s.StartPVEBattleWithRoster(ctx, []int64{charID}, mapID, channelID, npcTemplates, playerInFront)
}
