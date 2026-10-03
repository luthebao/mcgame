// Open-sourced by BaoLT

package combat

import (
	"testing"

	domainskill "mcgame-server/internal/domain/skill"
)

type fakeSkillGetter struct {
	infos       map[int]*SkillInfo
	creatureMap map[int][]int
}

func (f *fakeSkillGetter) GetSkillInfo(skillID int) *SkillInfo {
	if f == nil {
		return nil
	}
	return f.infos[skillID]
}

func (f *fakeSkillGetter) GetCreatureSkillIDs(creatureTemplateID int) []int {
	if f == nil {
		return nil
	}
	return f.creatureMap[creatureTemplateID]
}

func TestCheckVictory_BattleContinuesWhenCharacterDiesButPetLives(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	player := NewParticipant("1", "player", SidePlayer, false)
	player.EntityType = ParticipantTypeCharacter
	player.IsAlive = false
	battle.AddParticipant(player)

	pet := NewParticipant("33", "pet", SidePlayer, false)
	pet.EntityType = ParticipantTypePet
	pet.IsAlive = true
	battle.AddParticipant(pet)

	enemy := NewParticipant("5", "enemy", SideEnemy, true)
	enemy.EntityType = ParticipantTypeCreature
	enemy.IsAlive = true
	battle.AddParticipant(enemy)

	ended, _ := battle.CheckVictory()
	if ended {
		t.Fatalf("CheckVictory() ended = true, want false (pet still alive)")
	}
}

func TestCheckVictory_PlayerLosesWhenBothCharacterAndPetDie(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	player := NewParticipant("1", "player", SidePlayer, false)
	player.EntityType = ParticipantTypeCharacter
	player.IsAlive = false
	battle.AddParticipant(player)

	pet := NewParticipant("33", "pet", SidePlayer, false)
	pet.EntityType = ParticipantTypePet
	pet.IsAlive = false
	battle.AddParticipant(pet)

	enemy := NewParticipant("5", "enemy", SideEnemy, true)
	enemy.EntityType = ParticipantTypeCreature
	enemy.IsAlive = true
	battle.AddParticipant(enemy)

	ended, winner := battle.CheckVictory()
	if !ended {
		t.Fatalf("CheckVictory() ended = false, want true")
	}
	if winner != SideEnemy {
		t.Fatalf("CheckVictory() winner = %v, want %v", winner, SideEnemy)
	}
}

func TestCheckVictory_FallsBackWhenNoCharacterParticipantExists(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	pet := NewParticipant("33", "pet", SidePlayer, false)
	pet.EntityType = ParticipantTypePet
	pet.IsAlive = true
	battle.AddParticipant(pet)

	enemy := NewParticipant("5", "enemy", SideEnemy, true)
	enemy.EntityType = ParticipantTypeCreature
	enemy.IsAlive = true
	battle.AddParticipant(enemy)

	ended, _ := battle.CheckVictory()
	if ended {
		t.Fatalf("CheckVictory() ended = true, want false")
	}
}

func TestParticipantToDTO_ExposesNormalizedElement(t *testing.T) {
	participant := NewParticipant("5", "enemy", SideEnemy, true)
	participant.EntityType = ParticipantTypeCreature
	participant.EntityID = 99
	participant.Element = 8

	if got := participant.Element; got != 8 {
		t.Fatalf("element = %v, want 8", got)
	}

	dto := participant.ToDTO()
	if _, found := dto["element"]; found {
		t.Fatalf("element should not be in creature DTO")
	}
}

func TestNPCAISelectorUsesCreatureSkillsFromGetter(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	target := NewParticipant("1", "player", SidePlayer, false)
	target.EntityType = ParticipantTypeCharacter
	target.IsAlive = true
	battle.AddParticipant(target)

	npc := NewParticipant("9001", "npc", SideEnemy, true)
	npc.EntityType = ParticipantTypeCreature
	npc.EntityID = 9001
	npc.CurrentMP = 300
	npc.IsAlive = true
	battle.AddParticipant(npc)

	ai := NewNPCAISelector(&fakeSkillGetter{
		infos: map[int]*SkillInfo{
			7777: {
				Template: &domainskill.SkillTemplate{
					ID:     7777,
					MPCost: 10,
				},
				CombatTarget: TargetEnemy,
			},
		},
		creatureMap: map[int][]int{
			9001: {7777},
		},
	})

	command := ai.trySkillCommand(npc, battle)
	if command == nil {
		t.Fatalf("trySkillCommand() = nil, want skill command")
	}
	if command.SkillID != 7777 {
		t.Fatalf("trySkillCommand() skill = %d, want 7777", command.SkillID)
	}
}

func TestNPCAISelectorFallsBackToHardcodedWhenCreatureSkillListEmpty(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	target := NewParticipant("1", "player", SidePlayer, false)
	target.EntityType = ParticipantTypeCharacter
	target.IsAlive = true
	battle.AddParticipant(target)

	npc := NewParticipant("9002", "npc", SideEnemy, true)
	npc.EntityType = ParticipantTypeCreature
	npc.EntityID = 9002
	npc.CurrentMP = 300
	npc.IsAlive = true
	battle.AddParticipant(npc)

	ai := NewNPCAISelector(&fakeSkillGetter{
		infos: map[int]*SkillInfo{
			1002: {
				Template: &domainskill.SkillTemplate{
					ID:     1002,
					MPCost: 10,
				},
				CombatTarget: TargetEnemy,
			},
		},
		creatureMap: map[int][]int{
			9002: nil,
		},
	})

	command := ai.trySkillCommand(npc, battle)
	if command == nil {
		t.Fatalf("trySkillCommand() = nil, want fallback skill command")
	}
	if command.SkillID != 1002 {
		t.Fatalf("trySkillCommand() skill = %d, want 1002", command.SkillID)
	}
}

func TestBattleActionToDTO_UsesDisplayHPForOverkillDamage(t *testing.T) {
	action := &BattleAction{
		ActorPosition:   0,
		TargetPosition:  10,
		ActionType:      ActionTypeAttack,
		Damage:          150,
		TargetNewHP:     0,
		TargetDisplayHP: -50,
		HasDisplayHP:    true,
	}

	dto := action.ToDTO()
	tSObj, ok := dto["tSObj"].(map[string]interface{})
	if !ok {
		t.Fatalf("tSObj = %#v, want map[string]interface{}", dto["tSObj"])
	}

	if got := tSObj["hHp"]; got != -50 {
		t.Fatalf("tSObj[hHp] = %#v, want -50", got)
	}
}

func TestBattleActionToDTO_IncludesSkillName(t *testing.T) {
	action := &BattleAction{
		ActorPosition:  0,
		TargetPosition: 10,
		ActionType:     ActionTypeSkill,
		SkillName:      "Bai Son Dao Hai",
	}

	dto := action.ToDTO()
	sSObj, ok := dto["sSObj"].(map[string]interface{})
	if !ok {
		t.Fatalf("sSObj = %#v, want map[string]interface{}", dto["sSObj"])
	}

	if got := sSObj["skill"]; got != "Bai Son Dao Hai" {
		t.Fatalf("sSObj[skill] = %#v, want %q", got, "Bai Son Dao Hai")
	}
}

func TestBattleActionToDTO_IncludesSkillVisualFields(t *testing.T) {
	action := &BattleAction{
		ActorPosition:    0,
		TargetPosition:   10,
		ActionType:       ActionTypeSkill,
		BehaviorID:       7,
		FrontEffID:       3004001,
		AttackEffID:      2080130010008,
		BulletID:         3003001,
		SkillEffID:       3001002,
		GlobalFrontEffID: 2080130010008,
		GlobalBackEffID:  2080130010009,
	}

	dto := action.ToDTO()
	sSObj, ok := dto["sSObj"].(map[string]interface{})
	if !ok {
		t.Fatalf("sSObj = %#v, want map[string]interface{}", dto["sSObj"])
	}
	tSObj, ok := dto["tSObj"].(map[string]interface{})
	if !ok {
		t.Fatalf("tSObj = %#v, want map[string]interface{}", dto["tSObj"])
	}

	if got := dto["bid"]; got != 7 {
		t.Fatalf("bid = %#v, want 7", got)
	}
	if got := sSObj["frontEff"]; got != 3004001 {
		t.Fatalf("sSObj[frontEff] = %#v, want 3004001", got)
	}
	if got := sSObj["bullet"]; got != 3003001 {
		t.Fatalf("sSObj[bullet] = %#v, want 3003001", got)
	}
	if got := sSObj["gfe"]; got != 2080130010008 {
		t.Fatalf("sSObj[gfe] = %#v, want 2080130010008", got)
	}
	if got := sSObj["gbe"]; got != 2080130010009 {
		t.Fatalf("sSObj[gbe] = %#v, want 2080130010009", got)
	}
	if got := tSObj["skillEff"]; got != 3001002 {
		t.Fatalf("tSObj[skillEff] = %#v, want 3001002", got)
	}
}

func TestTurnProcessorExecuteAttack_UsesObservedAttackEffect(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("1", "player", SidePlayer, false)
	actor.EntityType = ParticipantTypeCharacter
	actor.Position = 0
	actor.Level = 20
	actor.Attack = 120
	actor.Hit = 999
	actor.CurrentHP = 500
	actor.MaxHP = 500
	actor.IsAlive = true
	battle.AddParticipant(actor)

	target := NewParticipant("2", "enemy", SideEnemy, true)
	target.EntityType = ParticipantTypeCreature
	target.Position = 10
	target.Level = 20
	target.Defense = 10
	target.CurrentHP = 500
	target.MaxHP = 500
	target.IsAlive = true
	battle.AddParticipant(target)

	tp := NewTurnProcessor(battle, &fakeSkillGetter{
		infos: map[int]*SkillInfo{
			1001: {
				Template: &domainskill.SkillTemplate{
					ID:         1001,
					Name:       "Attack",
					SkillType:  domainskill.SkillTypePhysical,
					TargetType: domainskill.TargetTypeSingle,
					BaseDamage: 20,
					Multiplier: 1.0,
					Range:      1,
				},
				CombatTarget: TargetEnemy,
				AreaType:     AreaNone,
				AreaSize:     1,
			},
		},
	})

	actions := tp.executeAttack(actor, &BattleCommand{
		ActorID:    actor.ID,
		TargetID:   target.ID,
		ActionType: ClientActionAttack,
	})

	if len(actions) == 0 {
		t.Fatalf("len(actions) = 0, want at least 1")
	}

	var hitDTO map[string]interface{}
	for _, action := range actions {
		dto := action.ToDTO()
		if dto["bid"] == 3 || dto["bid"] == 5 {
			tSObj, ok := dto["tSObj"].(map[string]interface{})
			if !ok {
				continue
			}
			if _, ok := tSObj["attackEff"]; ok {
				hitDTO = dto
				break
			}
		}
	}

	if hitDTO == nil {
		t.Fatalf("no attack action carried attackEff: %#v", actions)
	}

	tSObj := hitDTO["tSObj"].(map[string]interface{})
	if got := tSObj["attackEff"]; got != 2080130010008 {
		t.Fatalf("tSObj[attackEff] = %#v, want 2080130010008", got)
	}
}

func TestTurnProcessorExecuteAttack_PrefersEnemyPositionWhenTargetIDCollidesWithAllyID(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("1", "player-one", SidePlayer, false)
	actor.EntityType = ParticipantTypeCharacter
	actor.Position = 10
	actor.Level = 20
	actor.Attack = 120
	actor.Hit = 999
	actor.CurrentHP = 500
	actor.MaxHP = 500
	actor.IsAlive = true
	battle.AddParticipant(actor)

	ally := NewParticipant("2", "player-two", SidePlayer, false)
	ally.EntityType = ParticipantTypeCharacter
	ally.Position = 11
	ally.Level = 20
	ally.CurrentHP = 500
	ally.MaxHP = 500
	ally.IsAlive = true
	battle.AddParticipant(ally)

	enemy := NewParticipant("56", "enemy-two", SideEnemy, true)
	enemy.EntityType = ParticipantTypeCreature
	enemy.Position = 2
	enemy.Level = 20
	enemy.Defense = 10
	enemy.CurrentHP = 500
	enemy.MaxHP = 500
	enemy.IsAlive = true
	battle.AddParticipant(enemy)

	tp := NewTurnProcessor(battle, &fakeSkillGetter{
		infos: map[int]*SkillInfo{
			1001: {
				Template: &domainskill.SkillTemplate{
					ID:         1001,
					Name:       "Attack",
					SkillType:  domainskill.SkillTypePhysical,
					TargetType: domainskill.TargetTypeSingle,
					BaseDamage: 20,
					Multiplier: 1.0,
					Range:      1,
				},
				CombatTarget: TargetEnemy,
				AreaType:     AreaNone,
				AreaSize:     1,
			},
		},
	})

	actions := tp.executeAttack(actor, &BattleCommand{
		ActorID:    actor.ID,
		TargetID:   "2",
		ActionType: ClientActionAttack,
	})

	if len(actions) == 0 {
		t.Fatalf("len(actions) = 0, want at least 1")
	}
	if ally.CurrentHP != ally.MaxHP {
		t.Fatalf("ally.CurrentHP = %d, want unchanged %d", ally.CurrentHP, ally.MaxHP)
	}
	if enemy.CurrentHP >= enemy.MaxHP {
		t.Fatalf("enemy.CurrentHP = %d, want damage below %d", enemy.CurrentHP, enemy.MaxHP)
	}
}

func TestTurnProcessorExecutePetSwitch_ReplacesCurrentPetAndBuildsSummonSequence(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("42", "player", SidePlayer, false)
	actor.EntityType = ParticipantTypeCharacter
	actor.EntityID = 42
	actor.Position = 10
	actor.IsAlive = true
	battle.AddParticipant(actor)

	currentPet := NewParticipant("pet_11", "current", SidePlayer, false)
	currentPet.EntityType = ParticipantTypePet
	currentPet.EntityID = 11
	currentPet.OwnerID = 42
	currentPet.Position = 15
	currentPet.IsAlive = true
	battle.AddParticipant(currentPet)

	replacement := NewParticipant("pet_22", "swap-in", SidePlayer, false)
	replacement.EntityType = ParticipantTypePet
	replacement.EntityID = 22
	replacement.OwnerID = 42
	replacement.Position = 15
	replacement.IsAlive = true

	tp := NewTurnProcessor(battle, nil)
	actions := tp.executePet(actor, &BattleCommand{
		ActorID:        actor.ID,
		ActionType:     ClientActionPet,
		SelectedPetID:  22,
		ReplacementPet: replacement,
	})

	if len(actions) != 5 {
		t.Fatalf("len(actions) = %d, want 5", len(actions))
	}
	if got := actions[0].ToDTO()["bid"]; got != 15000 {
		t.Fatalf("return bid = %#v, want 15000", got)
	}
	if got := actions[1].ToDTO()["bid"]; got != 17000 {
		t.Fatalf("returned bid = %#v, want 17000", got)
	}
	summonDTO := actions[2].ToDTO()
	if got := summonDTO["bid"]; got != 16000 {
		t.Fatalf("summon bid = %#v, want 16000", got)
	}
	if got := summonDTO["type"]; got != 0 {
		t.Fatalf("summon type = %#v, want 0", got)
	}
	petDTO, ok := summonDTO["pet"].(map[string]interface{})
	if !ok {
		t.Fatalf("summon pet payload type = %T, want map[string]interface{}", summonDTO["pet"])
	}
	if got := petDTO["id"]; got != int64(22) {
		t.Fatalf("summon pet id = %#v, want 22", got)
	}
	if got := actions[3].ToDTO()["bid"]; got != 18000 {
		t.Fatalf("summoned bid = %#v, want 18000", got)
	}
	if got := actions[4].ToDTO()["bid"]; got != 10100 {
		t.Fatalf("turnback bid = %#v, want 10100", got)
	}
	if owners := tp.petStateOwnerList(); len(owners) != 1 || owners[0] != 42 {
		t.Fatalf("petStateOwnerList() = %v, want [42]", owners)
	}
	activePet := battle.GetOwnerPet(42)
	if activePet == nil || activePet.EntityID != 22 {
		t.Fatalf("active pet = %#v, want replacement pet", activePet)
	}
	if battle.GetParticipant("pet_11") != nil {
		t.Fatalf("old pet still present in battle")
	}
}

func TestTurnProcessorExecutePetReturn_RemovesCurrentPet(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("42", "player", SidePlayer, false)
	actor.EntityType = ParticipantTypeCharacter
	actor.EntityID = 42
	actor.Position = 10
	actor.IsAlive = true
	battle.AddParticipant(actor)

	currentPet := NewParticipant("pet_11", "current", SidePlayer, false)
	currentPet.EntityType = ParticipantTypePet
	currentPet.EntityID = 11
	currentPet.OwnerID = 42
	currentPet.Position = 15
	currentPet.IsAlive = true
	battle.AddParticipant(currentPet)

	tp := NewTurnProcessor(battle, nil)
	actions := tp.executePet(actor, &BattleCommand{
		ActorID:       actor.ID,
		ActionType:    ClientActionPet,
		SelectedPetID: 11,
	})

	if len(actions) != 3 {
		t.Fatalf("len(actions) = %d, want 3", len(actions))
	}
	if got := actions[0].ToDTO()["bid"]; got != 15000 {
		t.Fatalf("return bid = %#v, want 15000", got)
	}
	if got := actions[1].ToDTO()["bid"]; got != 17000 {
		t.Fatalf("returned bid = %#v, want 17000", got)
	}
	if got := actions[2].ToDTO()["bid"]; got != 10100 {
		t.Fatalf("turnback bid = %#v, want 10100", got)
	}
	if owners := tp.petStateOwnerList(); len(owners) != 1 || owners[0] != 42 {
		t.Fatalf("petStateOwnerList() = %v, want [42]", owners)
	}
	if activePet := battle.GetOwnerPet(42); activePet != nil {
		t.Fatalf("active pet = %#v, want nil after return", activePet)
	}
}

func TestTurnProcessorExecuteAttack_MissingTargetUsesNoTargetPosition(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("npc_2", "enemy", SideEnemy, true)
	actor.EntityType = ParticipantTypeCreature
	actor.Position = 2
	actor.IsAlive = true
	battle.AddParticipant(actor)

	tp := NewTurnProcessor(battle, nil)
	actions := tp.executeAttack(actor, &BattleCommand{
		ActorID:    actor.ID,
		TargetID:   "pet_1",
		ActionType: ClientActionAttack,
	})

	if len(actions) != 1 {
		t.Fatalf("len(actions) = %d, want 1", len(actions))
	}
	dto := actions[0].ToDTO()
	if got := dto["bid"]; got != 3 {
		t.Fatalf("bid = %#v, want 3", got)
	}
	if got := dto["tid"]; got != -1 {
		t.Fatalf("tid = %#v, want -1", got)
	}
}

func TestTurnProcessorExecuteSkill_CloseSkillApproachesTarget(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("1", "player", SidePlayer, false)
	actor.EntityType = ParticipantTypeCharacter
	actor.Position = 0
	actor.Level = 20
	actor.Attack = 120
	actor.Hit = 999
	actor.CurrentHP = 500
	actor.MaxHP = 500
	actor.CurrentMP = 100
	actor.IsAlive = true
	battle.AddParticipant(actor)

	target := NewParticipant("2", "enemy", SideEnemy, true)
	target.EntityType = ParticipantTypeCreature
	target.Position = 10
	target.Level = 20
	target.Defense = 10
	target.CurrentHP = 500
	target.MaxHP = 500
	target.IsAlive = true
	battle.AddParticipant(target)

	tp := NewTurnProcessor(battle, &fakeSkillGetter{
		infos: map[int]*SkillInfo{
			2001: {
				Template: &domainskill.SkillTemplate{
					ID:         2001,
					Name:       "Slash",
					SkillType:  domainskill.SkillTypePhysical,
					TargetType: domainskill.TargetTypeSingle,
					BaseDamage: 20,
					Multiplier: 1.0,
					MPCost:     5,
					Range:      1,
				},
				CombatTarget: TargetEnemy,
				AreaType:     AreaNone,
				AreaSize:     1,
			},
		},
	})

	actions := tp.executeSkill(actor, &BattleCommand{
		ActorID:    actor.ID,
		TargetID:   target.ID,
		ActionType: ClientActionSkill,
		SkillID:    2001,
	})

	if len(actions) < 6 {
		t.Fatalf("len(actions) = %d, want at least 6", len(actions))
	}
	if actions[0].ActionType != ActionTypeTurnTo {
		t.Fatalf("actions[0].ActionType = %v, want %v", actions[0].ActionType, ActionTypeTurnTo)
	}
	if actions[0].SkillName != "Slash" {
		t.Fatalf("actions[0].SkillName = %q, want %q", actions[0].SkillName, "Slash")
	}
	if actions[1].ActionType != ActionTypeMoveToTarget {
		t.Fatalf("actions[1].ActionType = %v, want %v", actions[1].ActionType, ActionTypeMoveToTarget)
	}
	if actions[2].SkillName != "" {
		t.Fatalf("actions[2].SkillName = %q, want empty string after opening action", actions[2].SkillName)
	}
	if got := actions[2].ToDTO()["bid"]; got != 3 {
		t.Fatalf("actions[2] bid = %#v, want 3 for physical skill animation", got)
	}
	if actions[len(actions)-2].ActionType != ActionTypeBack {
		t.Fatalf("actions[len-2].ActionType = %v, want %v", actions[len(actions)-2].ActionType, ActionTypeBack)
	}
	if actions[len(actions)-1].ActionType != ActionTypeTurnBack {
		t.Fatalf("actions[len-1].ActionType = %v, want %v", actions[len(actions)-1].ActionType, ActionTypeTurnBack)
	}
}

func TestTurnProcessorExecuteSkill_RemoteSkillStaysInPlace(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("1", "player", SidePlayer, false)
	actor.EntityType = ParticipantTypeCharacter
	actor.Position = 0
	actor.Level = 20
	actor.Attack = 120
	actor.Hit = 999
	actor.CurrentHP = 500
	actor.MaxHP = 500
	actor.CurrentMP = 100
	actor.IsAlive = true
	battle.AddParticipant(actor)

	target := NewParticipant("2", "enemy", SideEnemy, true)
	target.EntityType = ParticipantTypeCreature
	target.Position = 10
	target.Level = 20
	target.Defense = 10
	target.CurrentHP = 500
	target.MaxHP = 500
	target.IsAlive = true
	battle.AddParticipant(target)

	tp := NewTurnProcessor(battle, &fakeSkillGetter{
		infos: map[int]*SkillInfo{
			2002: {
				Template: &domainskill.SkillTemplate{
					ID:         2002,
					Name:       "Throw Knife",
					SkillType:  domainskill.SkillTypePhysical,
					TargetType: domainskill.TargetTypeSingle,
					BaseDamage: 20,
					Multiplier: 1.0,
					MPCost:     5,
					Range:      2,
				},
				CombatTarget: TargetEnemy,
				AreaType:     AreaNone,
				AreaSize:     1,
			},
		},
	})

	actions := tp.executeSkill(actor, &BattleCommand{
		ActorID:    actor.ID,
		TargetID:   target.ID,
		ActionType: ClientActionSkill,
		SkillID:    2002,
	})

	for i, action := range actions {
		if action.ActionType == ActionTypeTurnTo || action.ActionType == ActionTypeMoveToTarget || action.ActionType == ActionTypeBack || action.ActionType == ActionTypeTurnBack {
			t.Fatalf("actions[%d].ActionType = %v, want no movement actions", i, action.ActionType)
		}
	}
	if len(actions) == 0 || actions[0].SkillName != "Throw Knife" {
		t.Fatalf("actions[0].SkillName = %q, want %q", actions[0].SkillName, "Throw Knife")
	}
	if got := actions[0].ToDTO()["bid"]; got != 3 {
		t.Fatalf("actions[0] bid = %#v, want 3 for remote physical skill animation", got)
	}
}

func TestTurnProcessorExecuteSkill_MagicSkillAddsVisualEffects(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("1", "player", SidePlayer, false)
	actor.EntityType = ParticipantTypeCharacter
	actor.Position = 0
	actor.Level = 20
	actor.Attack = 120
	actor.MagicAttack = 140
	actor.Hit = 999
	actor.CurrentHP = 500
	actor.MaxHP = 500
	actor.CurrentMP = 100
	actor.IsAlive = true
	battle.AddParticipant(actor)

	target := NewParticipant("2", "enemy", SideEnemy, true)
	target.EntityType = ParticipantTypeCreature
	target.Position = 10
	target.Level = 20
	target.Defense = 10
	target.MagicDefense = 10
	target.CurrentHP = 500
	target.MaxHP = 500
	target.IsAlive = true
	battle.AddParticipant(target)

	tp := NewTurnProcessor(battle, &fakeSkillGetter{
		infos: map[int]*SkillInfo{
			3001: {
				Template: &domainskill.SkillTemplate{
					ID:         3001,
					Name:       "Fireball",
					SkillType:  domainskill.SkillTypeMagic,
					TargetType: domainskill.TargetTypeSingle,
					FrontEffID: 3004001,
					SkillEffID: 3001002,
					BulletID:   3003001,
					BaseDamage: 20,
					Multiplier: 1.0,
					MPCost:     5,
					Range:      2,
				},
				CombatTarget: TargetEnemy,
				AreaType:     AreaNone,
				AreaSize:     1,
			},
		},
	})

	actions := tp.executeSkill(actor, &BattleCommand{
		ActorID:    actor.ID,
		TargetID:   target.ID,
		ActionType: ClientActionSkill,
		SkillID:    3001,
	})

	if len(actions) == 0 {
		t.Fatalf("len(actions) = 0, want at least 1")
	}

	dto := actions[0].ToDTO()
	sSObj, ok := dto["sSObj"].(map[string]interface{})
	if !ok {
		t.Fatalf("sSObj = %#v, want map[string]interface{}", dto["sSObj"])
	}
	tSObj, ok := dto["tSObj"].(map[string]interface{})
	if !ok {
		t.Fatalf("tSObj = %#v, want map[string]interface{}", dto["tSObj"])
	}

	if got := dto["bid"]; got != 7 {
		t.Fatalf("bid = %#v, want 7 for magic skill animation", got)
	}
	if got := dto["delay"]; got != 500 {
		t.Fatalf("delay = %#v, want 500 for magic skill pacing", got)
	}
	if got := sSObj["frontEff"]; got != 3004001 {
		t.Fatalf("sSObj[frontEff] = %#v, want 3004001", got)
	}
	if got := sSObj["bullet"]; got != 3003001 {
		t.Fatalf("sSObj[bullet] = %#v, want 3003001", got)
	}
	if got := tSObj["skillEff"]; got != 3001002 {
		t.Fatalf("tSObj[skillEff] = %#v, want 3001002", got)
	}
	if actions[len(actions)-1].ActionType != ActionTypeTurnBack {
		t.Fatalf("actions[len-1].ActionType = %v, want %v", actions[len(actions)-1].ActionType, ActionTypeTurnBack)
	}
	if got := actions[len(actions)-1].ToDTO()["bid"]; got != 10100 {
		t.Fatalf("actions[len-1] bid = %#v, want 10100 for magic turnback", got)
	}
	if got := actions[len(actions)-1].ToDTO()["delay"]; got != 300 {
		t.Fatalf("actions[len-1] delay = %#v, want 300 for post-action pause", got)
	}
}

func TestTurnProcessorExecuteSkill_DebuffSkillUsesLongerDelay(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("1", "player", SidePlayer, false)
	actor.EntityType = ParticipantTypeCharacter
	actor.Position = 0
	actor.Level = 20
	actor.Attack = 120
	actor.MagicAttack = 140
	actor.Hit = 999
	actor.CurrentHP = 500
	actor.MaxHP = 500
	actor.CurrentMP = 100
	actor.IsAlive = true
	battle.AddParticipant(actor)

	target := NewParticipant("2", "enemy", SideEnemy, true)
	target.EntityType = ParticipantTypeCreature
	target.Position = 10
	target.Level = 20
	target.Defense = 10
	target.MagicDefense = 10
	target.CurrentHP = 500
	target.MaxHP = 500
	target.IsAlive = true
	battle.AddParticipant(target)

	tp := NewTurnProcessor(battle, &fakeSkillGetter{
		infos: map[int]*SkillInfo{
			3002: {
				Template: &domainskill.SkillTemplate{
					ID:         3002,
					Name:       "Slow Curse",
					SkillType:  domainskill.SkillTypeDebuff,
					TargetType: domainskill.TargetTypeSingle,
					BaseDamage: 20,
					Multiplier: 1.0,
					MPCost:     5,
					Range:      2,
				},
				CombatTarget: TargetEnemy,
				AreaType:     AreaNone,
				AreaSize:     1,
				BuffID:       8,
				BuffRate:     1,
				BuffDuration: 2,
			},
		},
	})

	actions := tp.executeSkill(actor, &BattleCommand{
		ActorID:    actor.ID,
		TargetID:   target.ID,
		ActionType: ClientActionSkill,
		SkillID:    3002,
	})

	if len(actions) == 0 {
		t.Fatalf("len(actions) = 0, want at least 1")
	}

	if got := actions[0].ToDTO()["delay"]; got != 500 {
		t.Fatalf("delay = %#v, want 500 for debuff skill pacing", got)
	}
}

func TestTurnProcessorExecuteEscape_QueuedLeaveDoesNotSetPlayerFled(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("1", "player", SidePlayer, false)
	actor.EntityType = ParticipantTypeCharacter
	actor.Position = 10
	actor.CurrentHP = 100
	actor.MaxHP = 100
	actor.IsAlive = true
	battle.AddParticipant(actor)

	enemy := NewParticipant("2", "enemy", SideEnemy, true)
	enemy.EntityType = ParticipantTypeCreature
	enemy.Position = 0
	enemy.CurrentHP = 100
	enemy.MaxHP = 100
	enemy.IsAlive = true
	battle.AddParticipant(enemy)

	tp := NewTurnProcessor(battle, nil)
	actions := tp.executeCommand(actor, &BattleCommand{
		ActorID:     actor.ID,
		ActionType:  ClientActionEscape,
		QueuedLeave: true,
	})

	if len(actions) != 2 {
		t.Fatalf("len(actions) = %d, want 2", len(actions))
	}
	if got := actions[0].ToDTO()["bid"]; got != 10130 {
		t.Fatalf("actions[0] bid = %#v, want 10130", got)
	}
	if got := actions[1].ToDTO()["bid"]; got != 10170 {
		t.Fatalf("actions[1] bid = %#v, want 10170", got)
	}
	if actor.IsAlive {
		t.Fatalf("actor.IsAlive = true, want false after leave action resolves")
	}
	if actor.CurrentHP != 0 {
		t.Fatalf("actor.CurrentHP = %d, want 0", actor.CurrentHP)
	}
	if battle.HasPlayerFled() {
		t.Fatalf("battle.HasPlayerFled() = true, want false for queued grouped leave")
	}
}

func TestTurnProcessorExecuteSkill_AttackCountRepeatsHitActions(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("1", "player", SidePlayer, false)
	actor.EntityType = ParticipantTypeCharacter
	actor.Position = 0
	actor.Level = 20
	actor.Attack = 120
	actor.Hit = 999
	actor.CurrentHP = 500
	actor.MaxHP = 500
	actor.CurrentMP = 100
	actor.IsAlive = true
	battle.AddParticipant(actor)

	target := NewParticipant("2", "enemy", SideEnemy, true)
	target.EntityType = ParticipantTypeCreature
	target.Position = 10
	target.Level = 20
	target.Defense = 10
	target.CurrentHP = 500
	target.MaxHP = 500
	target.IsAlive = true
	battle.AddParticipant(target)

	tp := NewTurnProcessor(battle, &fakeSkillGetter{
		infos: map[int]*SkillInfo{
			2215: {
				Template: &domainskill.SkillTemplate{
					ID:          2215,
					Name:        "Bai Son Dao Hai",
					SkillType:   domainskill.SkillTypePhysical,
					TargetType:  domainskill.TargetTypeSingle,
					AttackCount: 2,
					BaseDamage:  20,
					Multiplier:  1.0,
					MPCost:      5,
					Range:       2,
				},
				CombatTarget: TargetEnemy,
				AreaType:     AreaNone,
				AreaSize:     1,
			},
		},
	})

	actions := tp.executeSkill(actor, &BattleCommand{
		ActorID:    actor.ID,
		TargetID:   target.ID,
		ActionType: ClientActionSkill,
		SkillID:    2215,
	})

	skillHits := 0
	hurtActions := 0
	for _, action := range actions {
		switch action.ActionType {
		case ActionTypeSkill:
			skillHits++
		case ActionTypeHurt:
			hurtActions++
		}
	}

	if skillHits != 2 {
		t.Fatalf("skill hit count = %d, want 2", skillHits)
	}
	if hurtActions != 2 {
		t.Fatalf("hurt action count = %d, want 2", hurtActions)
	}
	if len(actions) < 5 {
		t.Fatalf("len(actions) = %d, want at least 5", len(actions))
	}
	if actions[0].SkillName != "Bai Son Dao Hai" {
		t.Fatalf("actions[0].SkillName = %q, want %q", actions[0].SkillName, "Bai Son Dao Hai")
	}
	if actions[2].SkillName != "" {
		t.Fatalf("actions[2].SkillName = %q, want empty string on repeated hit", actions[2].SkillName)
	}
	if target.CurrentHP >= target.MaxHP {
		t.Fatalf("target.CurrentHP = %d, want damage applied across repeated hits", target.CurrentHP)
	}
}

func TestTurnProcessorExecuteSkill_HorizontalAreaHitsTwoCreatures(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("1", "player", SidePlayer, false)
	actor.EntityType = ParticipantTypeCharacter
	actor.Position = 10
	actor.Level = 20
	actor.Attack = 120
	actor.Hit = 999
	actor.CurrentHP = 500
	actor.MaxHP = 500
	actor.CurrentMP = 100
	actor.IsAlive = true
	battle.AddParticipant(actor)

	center := NewParticipant("2", "enemy-center", SideEnemy, true)
	center.EntityType = ParticipantTypeCreature
	center.Position = 0
	center.Level = 20
	center.Defense = 10
	center.CurrentHP = 500
	center.MaxHP = 500
	center.IsAlive = true
	battle.AddParticipant(center)

	sameRowNeighbor := NewParticipant("3", "enemy-left", SideEnemy, true)
	sameRowNeighbor.EntityType = ParticipantTypeCreature
	sameRowNeighbor.Position = 2
	sameRowNeighbor.Level = 20
	sameRowNeighbor.Defense = 10
	sameRowNeighbor.CurrentHP = 500
	sameRowNeighbor.MaxHP = 500
	sameRowNeighbor.IsAlive = true
	battle.AddParticipant(sameRowNeighbor)

	otherRow := NewParticipant("4", "enemy-pet", SideEnemy, true)
	otherRow.EntityType = ParticipantTypeCreature
	otherRow.Position = 5
	otherRow.Level = 20
	otherRow.Defense = 10
	otherRow.CurrentHP = 500
	otherRow.MaxHP = 500
	otherRow.IsAlive = true
	battle.AddParticipant(otherRow)

	tp := NewTurnProcessor(battle, &fakeSkillGetter{
		infos: map[int]*SkillInfo{
			1819: {
				Template: &domainskill.SkillTemplate{
					ID:         1819,
					Name:       "Bang Truy",
					SkillType:  domainskill.SkillTypeMagic,
					TargetType: domainskill.TargetTypeSingle,
					BaseDamage: 20,
					Multiplier: 1.0,
					MPCost:     5,
					Range:      2,
				},
				CombatTarget: TargetEnemy,
				AreaType:     AreaHorizontal,
				AreaSize:     2,
			},
		},
	})

	actions := tp.executeSkill(actor, &BattleCommand{
		ActorID:    actor.ID,
		TargetID:   center.ID,
		ActionType: ClientActionSkill,
		SkillID:    1819,
	})

	hitPositions := make(map[int]bool)
	for _, action := range actions {
		if action.ActionType != ActionTypeSkill {
			continue
		}
		hitPositions[action.TargetPosition] = true
	}

	if len(hitPositions) != 2 {
		t.Fatalf("hit target count = %d, want 2", len(hitPositions))
	}
	if !hitPositions[0] {
		t.Fatalf("expected hit on position 0")
	}
	if !hitPositions[2] {
		t.Fatalf("expected hit on position 2")
	}
	if hitPositions[5] {
		t.Fatalf("unexpected hit on other-row position 5")
	}
}

func TestBuildPlaybackRounds_MultiTargetSkillMovesDamageIntoSharedHurtRound(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("1", "player", SidePlayer, false)
	actor.EntityType = ParticipantTypeCharacter
	actor.Position = 10
	actor.Level = 20
	actor.Attack = 120
	actor.MagicAttack = 140
	actor.Hit = 999
	actor.CurrentHP = 500
	actor.MaxHP = 500
	actor.CurrentMP = 100
	actor.IsAlive = true
	battle.AddParticipant(actor)

	center := NewParticipant("2", "enemy-center", SideEnemy, true)
	center.EntityType = ParticipantTypeCreature
	center.Position = 0
	center.Level = 20
	center.Defense = 10
	center.MagicDefense = 10
	center.CurrentHP = 500
	center.MaxHP = 500
	center.IsAlive = true
	battle.AddParticipant(center)

	sameRowNeighbor := NewParticipant("3", "enemy-left", SideEnemy, true)
	sameRowNeighbor.EntityType = ParticipantTypeCreature
	sameRowNeighbor.Position = 2
	sameRowNeighbor.Level = 20
	sameRowNeighbor.Defense = 10
	sameRowNeighbor.MagicDefense = 10
	sameRowNeighbor.CurrentHP = 500
	sameRowNeighbor.MaxHP = 500
	sameRowNeighbor.IsAlive = true
	battle.AddParticipant(sameRowNeighbor)

	tp := NewTurnProcessor(battle, &fakeSkillGetter{
		infos: map[int]*SkillInfo{
			1819: {
				Template: &domainskill.SkillTemplate{
					ID:         1819,
					Name:       "Bang Truy",
					SkillType:  domainskill.SkillTypeMagic,
					TargetType: domainskill.TargetTypeSingle,
					FrontEffID: 3004001,
					SkillEffID: 3001002,
					BulletID:   3003001,
					BaseDamage: 20,
					Multiplier: 1.0,
					MPCost:     5,
					Range:      2,
				},
				CombatTarget: TargetEnemy,
				AreaType:     AreaHorizontal,
				AreaSize:     2,
			},
		},
	})

	actions := tp.executeSkill(actor, &BattleCommand{
		ActorID:    actor.ID,
		TargetID:   center.ID,
		ActionType: ClientActionSkill,
		SkillID:    1819,
	})

	rounds := BuildPlaybackRounds(actions)
	if len(rounds) < 4 {
		t.Fatalf("len(rounds) = %d, want at least 4", len(rounds))
	}

	if len(rounds[0]) != 1 {
		t.Fatalf("len(rounds[0]) = %d, want 1", len(rounds[0]))
	}
	if got := rounds[0][0]["bid"]; got != 7 {
		t.Fatalf("rounds[0][0].bid = %#v, want 7 for single opener cast", got)
	}
	firstCastSource, ok := rounds[0][0]["sSObj"].(map[string]interface{})
	if !ok {
		t.Fatalf("rounds[0][0].sSObj = %#v, want map", rounds[0][0]["sSObj"])
	}
	if got, ok := firstCastSource["bullet"]; ok {
		t.Fatalf("rounds[0][0].sSObj[bullet] = %#v, want cast round without repeated bullet payload", got)
	}
	firstSkillState, ok := rounds[0][0]["tSObj"].(map[string]interface{})
	if !ok {
		t.Fatalf("rounds[0][0].tSObj = %#v, want map", rounds[0][0]["tSObj"])
	}
	if len(firstSkillState) != 0 {
		t.Fatalf("rounds[0][0].tSObj = %#v, want empty damage state in opener round", firstSkillState)
	}

	if len(rounds[1]) != 2 {
		t.Fatalf("len(rounds[1]) = %d, want 2 projectile actions", len(rounds[1]))
	}
	projectilePositions := map[int]bool{}
	for _, action := range rounds[1] {
		if got := action["bid"]; got != 11500 {
			t.Fatalf("projectile bid = %#v, want 11500", got)
		}
		tid, _ := action["tid"].(int)
		projectilePositions[tid] = true
		sSObj, ok := action["sSObj"].(map[string]interface{})
		if !ok {
			t.Fatalf("projectile sSObj = %#v, want map", action["sSObj"])
		}
		if got := sSObj["bullet"]; got != 3003001 {
			t.Fatalf("projectile bullet = %#v, want 3003001", got)
		}
		tSObj, ok := action["tSObj"].(map[string]interface{})
		if !ok {
			t.Fatalf("projectile tSObj = %#v, want map", action["tSObj"])
		}
		if len(tSObj) != 0 {
			t.Fatalf("projectile tSObj = %#v, want empty target state", tSObj)
		}
	}
	if !projectilePositions[0] || !projectilePositions[2] {
		t.Fatalf("projectile positions = %v, want positions 0 and 2", projectilePositions)
	}

	hurtRoundIndex := -1
	for i, round := range rounds {
		if len(round) != 2 {
			continue
		}
		firstBid, _ := round[0]["bid"].(int)
		secondBid, _ := round[1]["bid"].(int)
		if (firstBid == 5 || firstBid == 6) && (secondBid == 5 || secondBid == 6) {
			hurtRoundIndex = i
			break
		}
	}
	if hurtRoundIndex == -1 {
		t.Fatalf("expected shared hurt round in %#v", rounds)
	}

	hurtPositions := map[int]bool{}
	for _, action := range rounds[hurtRoundIndex] {
		sid, _ := action["sid"].(int)
		hurtPositions[sid] = true
		sSObj, ok := action["sSObj"].(map[string]interface{})
		if !ok {
			t.Fatalf("hurt action sSObj = %#v, want map", action["sSObj"])
		}
		if _, ok := sSObj["hHp"]; !ok {
			t.Fatalf("hurt action sSObj = %#v, want hHp damage payload", sSObj)
		}
		if got := sSObj["skillEff"]; got != 3001002 {
			t.Fatalf("hurt action skillEff = %#v, want 3001002", got)
		}
		if got, ok := sSObj["attackEff"]; ok {
			t.Fatalf("hurt action attackEff = %#v, want omitted from shared hurt payload", got)
		}
	}
	if !hurtPositions[0] || !hurtPositions[2] {
		t.Fatalf("hurt positions = %v, want positions 0 and 2", hurtPositions)
	}
}

func TestBuildPlaybackRounds_SingleTargetSkillKeepsPairedSkillAndHurt(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("1", "player", SidePlayer, false)
	actor.EntityType = ParticipantTypeCharacter
	actor.Position = 0
	actor.Level = 20
	actor.Attack = 120
	actor.MagicAttack = 140
	actor.Hit = 999
	actor.CurrentHP = 500
	actor.MaxHP = 500
	actor.CurrentMP = 100
	actor.IsAlive = true
	battle.AddParticipant(actor)

	target := NewParticipant("2", "enemy", SideEnemy, true)
	target.EntityType = ParticipantTypeCreature
	target.Position = 10
	target.Level = 20
	target.Defense = 10
	target.MagicDefense = 10
	target.CurrentHP = 500
	target.MaxHP = 500
	target.IsAlive = true
	battle.AddParticipant(target)

	tp := NewTurnProcessor(battle, &fakeSkillGetter{
		infos: map[int]*SkillInfo{
			3001: {
				Template: &domainskill.SkillTemplate{
					ID:         3001,
					Name:       "Fireball",
					SkillType:  domainskill.SkillTypeMagic,
					TargetType: domainskill.TargetTypeSingle,
					FrontEffID: 3004001,
					SkillEffID: 3001002,
					BulletID:   3003001,
					BaseDamage: 20,
					Multiplier: 1.0,
					MPCost:     5,
					Range:      2,
				},
				CombatTarget: TargetEnemy,
				AreaType:     AreaNone,
				AreaSize:     1,
			},
		},
	})

	actions := tp.executeSkill(actor, &BattleCommand{
		ActorID:    actor.ID,
		TargetID:   target.ID,
		ActionType: ClientActionSkill,
		SkillID:    3001,
	})

	rounds := BuildPlaybackRounds(actions)
	if len(rounds) == 0 {
		t.Fatalf("len(rounds) = 0, want at least 1")
	}
	if len(rounds[0]) != 2 {
		t.Fatalf("len(rounds[0]) = %d, want 2 for paired single-target skill+hurt", len(rounds[0]))
	}
	if got := rounds[0][0]["bid"]; got != 7 {
		t.Fatalf("rounds[0][0].bid = %#v, want 7", got)
	}
	if got := rounds[0][1]["bid"]; got != 5 {
		t.Fatalf("rounds[0][1].bid = %#v, want 5", got)
	}
}

func TestTurnProcessorExecuteSkill_AttackCountStopsAfterKill(t *testing.T) {
	battle := NewBattle(BattleTypePVE, 20)

	actor := NewParticipant("1", "player", SidePlayer, false)
	actor.EntityType = ParticipantTypeCharacter
	actor.Position = 0
	actor.Level = 20
	actor.Attack = 400
	actor.Hit = 999
	actor.CurrentHP = 500
	actor.MaxHP = 500
	actor.CurrentMP = 100
	actor.IsAlive = true
	battle.AddParticipant(actor)

	target := NewParticipant("2", "enemy", SideEnemy, true)
	target.EntityType = ParticipantTypeCreature
	target.Position = 10
	target.Level = 20
	target.Defense = 0
	target.CurrentHP = 40
	target.MaxHP = 40
	target.IsAlive = true
	battle.AddParticipant(target)

	tp := NewTurnProcessor(battle, &fakeSkillGetter{
		infos: map[int]*SkillInfo{
			2215: {
				Template: &domainskill.SkillTemplate{
					ID:          2215,
					Name:        "Bai Son Dao Hai",
					SkillType:   domainskill.SkillTypePhysical,
					TargetType:  domainskill.TargetTypeSingle,
					AttackCount: 2,
					BaseDamage:  50,
					Multiplier:  1.5,
					MPCost:      5,
					Range:       2,
				},
				CombatTarget: TargetEnemy,
				AreaType:     AreaNone,
				AreaSize:     1,
			},
		},
	})

	actions := tp.executeSkill(actor, &BattleCommand{
		ActorID:    actor.ID,
		TargetID:   target.ID,
		ActionType: ClientActionSkill,
		SkillID:    2215,
	})

	skillHits := 0
	dieActions := 0
	for _, action := range actions {
		switch action.ActionType {
		case ActionTypeSkill:
			skillHits++
		case ActionTypeDie:
			dieActions++
		}
	}

	if skillHits != 1 {
		t.Fatalf("skill hit count = %d, want 1 after lethal first hit", skillHits)
	}
	if dieActions != 1 {
		t.Fatalf("die action count = %d, want 1", dieActions)
	}
	if target.IsAlive {
		t.Fatalf("target.IsAlive = true, want false")
	}
}
