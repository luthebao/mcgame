// Open-sourced by BaoLT

package combat

import (
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"testing"

	"github.com/google/uuid"
	"go.uber.org/zap"
	"go.uber.org/zap/zaptest"

	domaincharacter "mcgame-server/internal/domain/character"
	domaincombat "mcgame-server/internal/domain/combat"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"
)

type testBattleRepo struct {
	battles map[string]*domaincombat.Battle
}

func newTestBattleRepo() *testBattleRepo {
	return &testBattleRepo{battles: make(map[string]*domaincombat.Battle)}
}

func (r *testBattleRepo) GetByID(battleID string) (*domaincombat.Battle, error) {
	battle, ok := r.battles[battleID]
	if !ok {
		return nil, pkgerrors.ErrNotFound
	}
	return battle, nil
}

func (r *testBattleRepo) GetByParticipant(participantID string) (*domaincombat.Battle, error) {
	for _, battle := range r.battles {
		for _, participant := range battle.Participants {
			if participant.ID == participantID {
				return battle, nil
			}
		}
	}
	return nil, pkgerrors.ErrNotFound
}

func (r *testBattleRepo) Store(battle *domaincombat.Battle) error {
	r.battles[battle.ID] = battle
	return nil
}

func (r *testBattleRepo) Remove(battleID string) error {
	delete(r.battles, battleID)
	return nil
}

func (r *testBattleRepo) GetAllActive() []*domaincombat.Battle {
	battles := make([]*domaincombat.Battle, 0, len(r.battles))
	for _, battle := range r.battles {
		if battle.IsActive() {
			battles = append(battles, battle)
		}
	}
	return battles
}

type testBattleLogRepo struct {
	savedBattles []*domaincombat.Battle
}

func (r *testBattleLogRepo) Save(ctx context.Context, battle *domaincombat.Battle) error {
	r.savedBattles = append(r.savedBattles, battle)
	return nil
}

func (r *testBattleLogRepo) FindByID(ctx context.Context, id int64) (*domaincombat.BattleLog, error) {
	return nil, pkgerrors.ErrNotFound
}

func (r *testBattleLogRepo) FindByParticipant(ctx context.Context, characterID string, limit int) ([]*domaincombat.BattleLog, error) {
	return nil, nil
}

func (r *testBattleLogRepo) FindRecent(ctx context.Context, limit int) ([]*domaincombat.BattleLog, error) {
	return nil, nil
}

func (r *testBattleLogRepo) CreateInitial(ctx context.Context, battle *domaincombat.Battle) (int64, error) {
	r.savedBattles = append(r.savedBattles, battle)
	return 1, nil
}

type testCharacterRepo struct {
	character *domaincharacter.Character
	updatedID int64
	updatedHP int
	updatedMP int
	updatedSP int
}

func (r *testCharacterRepo) FindByID(ctx context.Context, id int64) (*domaincharacter.Character, error) {
	if r.character != nil {
		return r.character, nil
	}
	return &domaincharacter.Character{ID: id}, nil
}

func (r *testCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*domaincharacter.Character, error) {
	return nil, nil
}

func (r *testCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*domaincharacter.Character, error) {
	return nil, nil
}

func (r *testCharacterRepo) FindByName(ctx context.Context, name string) (*domaincharacter.Character, error) {
	return nil, pkgerrors.ErrNotFound
}

func (r *testCharacterRepo) Create(ctx context.Context, character *domaincharacter.Character) error {
	return nil
}

func (r *testCharacterRepo) Update(ctx context.Context, character *domaincharacter.Character) error {
	return nil
}

func (r *testCharacterRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (r *testCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}

func (r *testCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos domaincharacter.Position) error {
	return nil
}

func (r *testCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	r.updatedID = id
	r.updatedHP = hp
	r.updatedMP = mp
	r.updatedSP = sp
	return nil
}

type testPetRepo struct {
	followingPet *domainpet.Pet
	pets         map[int64]*domainpet.Pet
}

func (r *testPetRepo) Save(ctx context.Context, pet *domainpet.Pet) error {
	if r.pets == nil {
		r.pets = make(map[int64]*domainpet.Pet)
	}
	r.pets[pet.ID] = cloneCombatTestPet(pet)
	return nil
}

func (r *testPetRepo) FindByID(ctx context.Context, id int64) (*domainpet.Pet, error) {
	if pet, ok := r.pets[id]; ok {
		return cloneCombatTestPet(pet), nil
	}
	if r.followingPet != nil && r.followingPet.ID == id {
		return cloneCombatTestPet(r.followingPet), nil
	}
	return nil, pkgerrors.ErrNotFound
}

func (r *testPetRepo) FindByCharacterID(ctx context.Context, characterID int64) ([]*domainpet.Pet, error) {
	if len(r.pets) > 0 {
		pets := make([]*domainpet.Pet, 0, len(r.pets))
		for _, pet := range r.pets {
			if pet.CharacterID != characterID {
				continue
			}
			pets = append(pets, cloneCombatTestPet(pet))
		}
		return pets, nil
	}
	if r.followingPet != nil && r.followingPet.CharacterID == characterID {
		return []*domainpet.Pet{cloneCombatTestPet(r.followingPet)}, nil
	}
	return nil, nil
}

func (r *testPetRepo) FindFollowingPet(ctx context.Context, characterID int64) (*domainpet.Pet, error) {
	if r.followingPet == nil {
		for _, pet := range r.pets {
			if pet.CharacterID == characterID && pet.IsFollowing {
				return cloneCombatTestPet(pet), nil
			}
		}
	}
	if r.followingPet == nil {
		return nil, pkgerrors.ErrNotFound
	}
	return cloneCombatTestPet(r.followingPet), nil
}

func (r *testPetRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (r *testPetRepo) Count(ctx context.Context, characterID int64) (int, error) {
	return 0, nil
}

func (r *testPetRepo) UpdateFollowState(ctx context.Context, petID int64, isFollowing bool) error {
	return nil
}

func (r *testPetRepo) ClearFollowing(ctx context.Context, characterID int64) error {
	return nil
}

func cloneCombatTestPet(p *domainpet.Pet) *domainpet.Pet {
	if p == nil {
		return nil
	}

	copyPet := *p
	copyPet.Property = cloneCombatTestMap(p.Property)
	copyPet.CreatureData = cloneCombatTestMap(p.CreatureData)
	return &copyPet
}

func cloneCombatTestMap(src map[string]interface{}) map[string]interface{} {
	if src == nil {
		return nil
	}

	clone := make(map[string]interface{}, len(src))
	for k, v := range src {
		clone[k] = v
	}
	return clone
}

func TestResolveBattlePetSelection_BuildsParticipantForOwnedPet(t *testing.T) {
	service := NewService(newTestBattleRepo(), &testBattleLogRepo{}, nil, &testCharacterRepo{}, nil, &testPetRepo{
		pets: map[int64]*domainpet.Pet{
			77: {
				ID:          77,
				CharacterID: 42,
				TemplateID:  501,
				Name:        "Flame Cub",
				Level:       12,
				Life:        10000,
				CurrentHP:   180,
				CurrentMP:   90,
				MaxHP:       220,
				MaxMP:       120,
				Element:     1,
				CreatureData: map[string]interface{}{
					"resCode":   3050070000001,
					"iconCode":  3050070000002,
					"colorCode": 2,
				},
				Property: map[string]interface{}{
					"finalAttack":         88,
					"finalDefence":        52,
					"finalMAttack":        61,
					"finalMDefence":       47,
					"finalSpeed":          140,
					"finalHit":            133,
					"finalDodge":          18,
					"finalCritical":       6,
					"finalCriticalDamage": 150,
					"finalCounter":        0,
					"finalCombo":          0,
					"finalPraDef":         0,
					"finalPraMagDef":      0,
					"finalReduceHurt1":    0,
					"finalReduceHurt2":    0,
					"finalResiCritical":   0,
					"finalResiDefy":       0,
					"finalEnhPhyHurt":     0,
					"finalEnhMagicHurt":   0,
				},
			},
		},
	}, zaptest.NewLogger(t))

	participant, err := service.ResolveBattlePetSelection(context.Background(), 42, 77, 16)
	if err != nil {
		t.Fatalf("ResolveBattlePetSelection() error = %v", err)
	}
	if participant == nil {
		t.Fatal("ResolveBattlePetSelection() = nil, want participant")
	}
	if participant.ID != "pet_77" {
		t.Fatalf("participant.ID = %q, want pet_77", participant.ID)
	}
	if participant.EntityID != 77 {
		t.Fatalf("participant.EntityID = %d, want 77", participant.EntityID)
	}
	if participant.Position != 16 {
		t.Fatalf("participant.Position = %d, want 16", participant.Position)
	}
	if participant.OwnerID != 42 {
		t.Fatalf("participant.OwnerID = %d, want 42", participant.OwnerID)
	}
}

func TestResolveBattlePetSelection_RejectsZeroLifePet(t *testing.T) {
	service := NewService(newTestBattleRepo(), &testBattleLogRepo{}, nil, &testCharacterRepo{}, nil, &testPetRepo{
		pets: map[int64]*domainpet.Pet{
			55: {
				ID:          55,
				CharacterID: 10,
				Name:        "dead-pet",
				Level:       5,
				Life:        0,
				CurrentHP:   60,
				MaxHP:       60,
				Property:    map[string]interface{}{},
			},
		},
	}, zaptest.NewLogger(t))

	participant, err := service.ResolveBattlePetSelection(context.Background(), 10, 55, 16)
	if !errors.Is(err, pkgerrors.ErrPetDead) {
		t.Fatalf("ResolveBattlePetSelection() error = %v, want ErrPetDead", err)
	}
	if participant != nil {
		t.Fatal("ResolveBattlePetSelection() participant must be nil when pet has zero life")
	}
}

func TestNormalizeEncounterTemplateForPlayer_CapsLevelAndStats(t *testing.T) {
	template := NPCTemplateData{
		Level:        20,
		Life:         1000,
		Attack:       200,
		Defense:      120,
		MagicAttack:  180,
		MagicDefense: 110,
		Speed:        160,
		Hit:          140,
		Dodge:        40,
		Critical:     20,
	}

	normalized := NormalizeEncounterTemplateForPlayer(template, 5)

	if normalized.Level != 10 {
		t.Fatalf("Level = %d, want 10", normalized.Level)
	}
	if normalized.Life != 500 {
		t.Fatalf("Life = %d, want 500", normalized.Life)
	}
	if normalized.Attack != 100 {
		t.Fatalf("Attack = %d, want 100", normalized.Attack)
	}
	if normalized.Defense != 60 {
		t.Fatalf("Defense = %d, want 60", normalized.Defense)
	}
	if normalized.MagicAttack != 90 {
		t.Fatalf("MagicAttack = %d, want 90", normalized.MagicAttack)
	}
	if normalized.MagicDefense != 55 {
		t.Fatalf("MagicDefense = %d, want 55", normalized.MagicDefense)
	}
	if normalized.Speed != 130 {
		t.Fatalf("Speed = %d, want 130", normalized.Speed)
	}
	if normalized.Hit != 120 {
		t.Fatalf("Hit = %d, want 120", normalized.Hit)
	}
	if normalized.Dodge != 20 {
		t.Fatalf("Dodge = %d, want 20", normalized.Dodge)
	}
	if normalized.Critical != 10 {
		t.Fatalf("Critical = %d, want 10", normalized.Critical)
	}
}

func TestNormalizeEncounterTemplateForPlayer_KeepsInRangeTemplate(t *testing.T) {
	template := NPCTemplateData{Level: 8, Life: 320, Attack: 48}

	normalized := NormalizeEncounterTemplateForPlayer(template, 5)

	if normalized != template {
		t.Fatalf("normalized template changed unexpectedly: %#v", normalized)
	}
}

func TestCalculateCreatureStats_UsesBaseAttributesForWildCreature(t *testing.T) {
	creature := &models.CreatureTemplate{
		ID:              1,
		Name:            "Sample Creature",
		Life:            10000,
		AttStrength:     2,
		AttAgility:      1,
		AttStamina:      2,
		AttIntelligence: 2,
		AttEnergy:       3,
		AptStrength:     1850,
		AptAgility:      2000,
		AptStamina:      1750,
		AptIntelligence: 1750,
		AptEnergy:       1650,
		GrowBase:        0.8,
		PropHit:         10,
		PropCritical:    5,
		PropDodge:       5,
		PropSpeed:       10,
	}

	template := CalculateCreatureStats(creature, 1)

	if template.Life != 96 {
		t.Fatalf("Life = %d, want 96", template.Life)
	}
	if template.Attack != 11 {
		t.Fatalf("Attack = %d, want 11", template.Attack)
	}
	if template.Defense != 16 {
		t.Fatalf("Defense = %d, want 16", template.Defense)
	}
	if template.MagicAttack != 15 {
		t.Fatalf("MagicAttack = %d, want 15", template.MagicAttack)
	}
	if template.MagicDefense != 50 {
		t.Fatalf("MagicDefense = %d, want 50", template.MagicDefense)
	}
	if template.Speed != 115 {
		t.Fatalf("Speed = %d, want 115", template.Speed)
	}
	if template.Hit != 110 {
		t.Fatalf("Hit = %d, want 110", template.Hit)
	}
	if template.Dodge != 5 {
		t.Fatalf("Dodge = %d, want 5", template.Dodge)
	}
	if template.Critical != 5 {
		t.Fatalf("Critical = %d, want 5", template.Critical)
	}
}

func TestCalculateCreatureStats_CarriesNormalizedElement(t *testing.T) {
	creature := &models.CreatureTemplate{ID: 1, Name: "Sample Creature", Element: 6}

	template := CalculateCreatureStats(creature, 1)

	if template.Element != 6 {
		t.Fatalf("Element = %d, want 6", template.Element)
	}
}

func TestCalculateCreatureStats_UsesTemplateAttAptLifeAndProps(t *testing.T) {
	creature := &models.CreatureTemplate{
		ID:              10,
		Name:            "TestCreature",
		Life:            10000,
		AttStrength:     5,
		AttAgility:      3,
		AttStamina:      8,
		AttIntelligence: 4,
		AttEnergy:       2,
		AptStrength:     200,
		AptAgility:      150,
		AptStamina:      200,
		AptIntelligence: 100,
		AptEnergy:       80,
		GrowBase:        1,
		PropHit:         17,
		PropSpeed:       9,
		PropDodge:       5,
		PropCritical:    5,
	}

	template := CalculateCreatureStats(creature, 5)

	if template.Life <= 50 {
		t.Fatalf("Life = %d, want greater than 50 (attribute-based HP must be positive)", template.Life)
	}

	aptStamLife := CalculateCreatureStats(&models.CreatureTemplate{
		ID:         11,
		Name:       "no-apt",
		Life:       10000,
		AttStamina: 8,
		AptStamina: 0,
		GrowBase:   1,
	}, 5)
	withAptLife := CalculateCreatureStats(&models.CreatureTemplate{
		ID:         12,
		Name:       "with-apt",
		Life:       10000,
		AttStamina: 8,
		AptStamina: 200,
		GrowBase:   1,
	}, 5)

	if withAptLife.Life <= aptStamLife.Life {
		t.Fatalf("Life with AptStamina=200 (%d) should exceed Life without (%d): apt_* must contribute", withAptLife.Life, aptStamLife.Life)
	}

	if template.Hit <= 100 {
		t.Fatalf("Hit = %d, want greater than 100 (includes PropHit additive)", template.Hit)
	}
	if template.Speed <= 100 {
		t.Fatalf("Speed = %d, want greater than 100 (includes PropSpeed additive)", template.Speed)
	}
}

func TestStartPVEBattleWithTemplate_SetsParticipantElements(t *testing.T) {
	battleRepo := newTestBattleRepo()
	charRepo := &testCharacterRepo{character: &domaincharacter.Character{
		ID:           1,
		Name:         "tester",
		Level:        12,
		MapID:        20,
		MaxHP:        120,
		CurrentHP:    110,
		MaxMP:        80,
		CurrentMP:    70,
		MaxSP:        60,
		CurrentSP:    55,
		Attack:       25,
		Defense:      12,
		MagicAttack:  22,
		MagicDefense: 14,
		Speed:        110,
		Hit:          125,
		Dodge:        15,
		Critical:     7,
		CriticalDmg:  150,
	}}
	petRepo := &testPetRepo{pets: map[int64]*domainpet.Pet{
		33: {
			ID:          33,
			CharacterID: 1,
			Name:        "pet",
			Level:       6,
			Element:     5,
			Life:        10000,
			CurrentHP:   50,
			CurrentMP:   30,
			MaxHP:       50,
			MaxMP:       30,
			GrowRate:    1,
			AptStrength: 10,
			AptAgility:  10,
			AptStamina:  10,
			AptEnergy:   10,
			Property: map[string]interface{}{
				"state": int(domainpet.PetStateBattle),
			},
		},
	}}
	service := NewService(battleRepo, nil, nil, charRepo, nil, petRepo, zaptest.NewLogger(t))

	battle, err := service.StartPVEBattleWithTemplate(context.Background(), 1, 20, 0, NPCTemplateData{
		ID:      99,
		Name:    "enemy",
		Level:   10,
		ResCode: 2001,
		Element: 4,
		Life:    200,
		Attack:  30,
	}, true)
	if err != nil {
		t.Fatalf("StartPVEBattleWithTemplate() error = %v", err)
	}

	petParticipant := battle.GetParticipant("pet_33")
	if petParticipant == nil {
		t.Fatalf("pet participant not found")
	}
	if got := petParticipant.Element; got != 5 {
		t.Fatalf("pet element = %v, want 5", got)
	}

	enemyParticipant := battle.GetParticipantByPosition(0)
	if enemyParticipant == nil {
		t.Fatalf("enemy participant not found")
	}
	if got := enemyParticipant.Element; got != 4 {
		t.Fatalf("enemy element = %v, want 4", got)
	}
}

func TestStartPVEBattleWithTemplate_UsesFrontPreferenceForPlayerAndPetSlots(t *testing.T) {
	charRepo := &testCharacterRepo{character: &domaincharacter.Character{
		ID:             1,
		Name:           "player",
		MapID:          20,
		ClassID:        1,
		Gender:         0,
		Level:          8,
		CurrentHP:      120,
		MaxHP:          120,
		CurrentMP:      60,
		MaxMP:          60,
		CurrentSP:      80,
		MaxSP:          80,
		Attack:         20,
		Defense:        10,
		MagicAttack:    15,
		MagicDefense:   8,
		Speed:          110,
		Hit:            120,
		CriticalDmg:    150,
		FinalCounter:   1,
		FinalCombo:     1,
		FinalPraDef:    1,
		FinalPraMagDef: 1,
	}}
	petRepo := &testPetRepo{pets: map[int64]*domainpet.Pet{
		33: {
			ID:          33,
			CharacterID: 1,
			Name:        "pet",
			Level:       6,
			Life:        10000,
			CurrentHP:   50,
			CurrentMP:   30,
			MaxHP:       50,
			MaxMP:       30,
			GrowRate:    1,
			AptStrength: 10,
			AptAgility:  10,
			AptStamina:  10,
			AptEnergy:   10,
			Property: map[string]interface{}{
				"state": int(domainpet.PetStateBattle),
			},
		},
	}}
	template := NPCTemplateData{ID: 99, Name: "enemy", Level: 10, Life: 200, Attack: 30}

	frontService := NewService(newTestBattleRepo(), nil, nil, charRepo, nil, petRepo, zaptest.NewLogger(t))
	frontBattle, err := frontService.StartPVEBattleWithTemplate(context.Background(), 1, 20, 0, template, true)
	if err != nil {
		t.Fatalf("StartPVEBattleWithTemplate(front) error = %v", err)
	}
	if got := frontBattle.GetParticipant("1").Position; got != 15 {
		t.Fatalf("front player position = %d, want 15", got)
	}
	if got := frontBattle.GetParticipant("pet_33").Position; got != 10 {
		t.Fatalf("front pet position = %d, want 10", got)
	}

	backService := NewService(newTestBattleRepo(), nil, nil, charRepo, nil, petRepo, zaptest.NewLogger(t))
	backBattle, err := backService.StartPVEBattleWithTemplate(context.Background(), 1, 20, 0, template, false)
	if err != nil {
		t.Fatalf("StartPVEBattleWithTemplate(back) error = %v", err)
	}
	if got := backBattle.GetParticipant("1").Position; got != 10 {
		t.Fatalf("back player position = %d, want 10", got)
	}
	if got := backBattle.GetParticipant("pet_33").Position; got != 15 {
		t.Fatalf("back pet position = %d, want 15", got)
	}
}

func TestStartPVEBattleWithTemplate_UsesSelectedBattlePetInsteadOfFollowingPet(t *testing.T) {
	charRepo := &testCharacterRepo{character: &domaincharacter.Character{
		ID:             1,
		Name:           "player",
		MapID:          20,
		ClassID:        1,
		Gender:         0,
		Level:          8,
		CurrentHP:      120,
		MaxHP:          120,
		CurrentMP:      60,
		MaxMP:          60,
		CurrentSP:      80,
		MaxSP:          80,
		Attack:         20,
		Defense:        10,
		MagicAttack:    15,
		MagicDefense:   8,
		Speed:          110,
		Hit:            120,
		CriticalDmg:    150,
		FinalCounter:   1,
		FinalCombo:     1,
		FinalPraDef:    1,
		FinalPraMagDef: 1,
	}}
	petRepo := &testPetRepo{
		pets: map[int64]*domainpet.Pet{
			33: {
				ID:          33,
				CharacterID: 1,
				Name:        "following-pet",
				IsFollowing: true,
				Level:       6,
				Life:        10000,
				CurrentHP:   50,
				CurrentMP:   30,
				MaxHP:       50,
				MaxMP:       30,
				GrowRate:    1,
				AptStrength: 10,
				AptAgility:  10,
				AptStamina:  10,
				AptEnergy:   10,
				Property: map[string]interface{}{
					"state": int(domainpet.PetStateRest),
				},
			},
			44: {
				ID:          44,
				CharacterID: 1,
				Name:        "battle-pet",
				Level:       7,
				Life:        10000,
				CurrentHP:   60,
				CurrentMP:   40,
				MaxHP:       60,
				MaxMP:       40,
				GrowRate:    1,
				AptStrength: 10,
				AptAgility:  10,
				AptStamina:  10,
				AptEnergy:   10,
				Property: map[string]interface{}{
					"state": int(domainpet.PetStateBattle),
				},
			},
		},
	}
	template := NPCTemplateData{ID: 99, Name: "enemy", Level: 10, Life: 200, Attack: 30}
	service := NewService(newTestBattleRepo(), nil, nil, charRepo, nil, petRepo, zaptest.NewLogger(t))

	battle, err := service.StartPVEBattleWithTemplate(context.Background(), 1, 20, 0, template, true)
	if err != nil {
		t.Fatalf("StartPVEBattleWithTemplate() error = %v", err)
	}

	if battle.GetParticipant("pet_44") == nil {
		t.Fatalf("selected battle pet participant not found")
	}
	if battle.GetParticipant("pet_33") != nil {
		t.Fatalf("following pet participant should not join battle")
	}
}

func TestApplyPetRewards_UsesBattleParticipantPetID(t *testing.T) {
	petRepo := &testPetRepo{
		pets: map[int64]*domainpet.Pet{
			33: {
				ID:          33,
				CharacterID: 1,
				Name:        "following-pet",
				IsFollowing: true,
				Property: map[string]interface{}{
					"state": int(domainpet.PetStateRest),
				},
			},
			44: {
				ID:          44,
				CharacterID: 1,
				Name:        "battle-pet",
				Property: map[string]interface{}{
					"state": int(domainpet.PetStateBattle),
				},
			},
		},
	}
	service := NewService(newTestBattleRepo(), nil, nil, nil, nil, petRepo, zaptest.NewLogger(t))
	battle := domaincombat.NewBattle(domaincombat.BattleTypePVE, 20)
	battle.AddParticipant(&domaincombat.Participant{
		ID:         "1",
		Side:       domaincombat.SidePlayer,
		EntityType: domaincombat.ParticipantTypeCharacter,
		EntityID:   1,
	})
	battle.AddParticipant(&domaincombat.Participant{
		ID:         "44",
		Side:       domaincombat.SidePlayer,
		EntityType: domaincombat.ParticipantTypePet,
		EntityID:   44,
		OwnerID:    1,
	})

	service.applyPetRewards(context.Background(), battle, &domaincombat.BattleResult{ExpReward: 100})

	battlePet, err := petRepo.FindByID(context.Background(), 44)
	if err != nil {
		t.Fatalf("FindByID(44) error = %v", err)
	}
	if battlePet.Experience != 14 {
		t.Fatalf("battle pet experience = %d, want 14 (50 exp causes level-up at threshold 36; leftover = 50-36 = 14)", battlePet.Experience)
	}

	followingPet, err := petRepo.FindByID(context.Background(), 33)
	if err != nil {
		t.Fatalf("FindByID(33) error = %v", err)
	}
	if followingPet.Experience != 0 {
		t.Fatalf("following pet experience = %d, want 0", followingPet.Experience)
	}
}

func TestSyncBattlePetStates_ActivatesBattleParticipantAndRestsOthers(t *testing.T) {
	petRepo := &testPetRepo{
		pets: map[int64]*domainpet.Pet{
			33: {
				ID:          33,
				CharacterID: 1,
				Name:        "active",
				Property: map[string]interface{}{
					"state": int(domainpet.PetStateRest),
				},
			},
			44: {
				ID:          44,
				CharacterID: 1,
				Name:        "stale",
				Property: map[string]interface{}{
					"state": int(domainpet.PetStateBattle),
				},
			},
		},
	}
	service := NewService(newTestBattleRepo(), nil, nil, nil, nil, petRepo, zaptest.NewLogger(t))
	battle := domaincombat.NewBattle(domaincombat.BattleTypePVE, 20)
	battle.AddParticipant(&domaincombat.Participant{
		ID:         "1",
		Side:       domaincombat.SidePlayer,
		EntityType: domaincombat.ParticipantTypeCharacter,
		EntityID:   1,
	})
	battle.AddParticipant(&domaincombat.Participant{
		ID:         "33",
		Side:       domaincombat.SidePlayer,
		EntityType: domaincombat.ParticipantTypePet,
		EntityID:   33,
		OwnerID:    1,
		IsAlive:    true,
	})

	stateChanges, err := service.SyncBattlePetStates(context.Background(), battle, []int64{1})
	if err != nil {
		t.Fatalf("SyncBattlePetStates() error = %v", err)
	}
	if len(stateChanges) != 2 {
		t.Fatalf("len(stateChanges) = %d, want 2", len(stateChanges))
	}

	activePet, err := petRepo.FindByID(context.Background(), 33)
	if err != nil {
		t.Fatalf("FindByID(33) error = %v", err)
	}
	if got := activePet.ClientState(); got != int(domainpet.PetStateBattle) {
		t.Fatalf("active pet state = %d, want %d", got, domainpet.PetStateBattle)
	}

	stalePet, err := petRepo.FindByID(context.Background(), 44)
	if err != nil {
		t.Fatalf("FindByID(44) error = %v", err)
	}
	if got := stalePet.ClientState(); got != int(domainpet.PetStateRest) {
		t.Fatalf("stale pet state = %d, want %d", got, domainpet.PetStateRest)
	}
}

func TestSyncBattlePetStates_ClearsActiveStateWhenNoBattlePetRemains(t *testing.T) {
	petRepo := &testPetRepo{
		pets: map[int64]*domainpet.Pet{
			44: {
				ID:          44,
				CharacterID: 1,
				Name:        "returned",
				Property: map[string]interface{}{
					"state": int(domainpet.PetStateBattle),
				},
			},
		},
	}
	service := NewService(newTestBattleRepo(), nil, nil, nil, nil, petRepo, zaptest.NewLogger(t))
	battle := domaincombat.NewBattle(domaincombat.BattleTypePVE, 20)
	battle.AddParticipant(&domaincombat.Participant{
		ID:         "1",
		Side:       domaincombat.SidePlayer,
		EntityType: domaincombat.ParticipantTypeCharacter,
		EntityID:   1,
	})

	stateChanges, err := service.SyncBattlePetStates(context.Background(), battle, []int64{1})
	if err != nil {
		t.Fatalf("SyncBattlePetStates() error = %v", err)
	}
	if len(stateChanges) != 1 {
		t.Fatalf("len(stateChanges) = %d, want 1", len(stateChanges))
	}
	if stateChanges[0].PetID != 44 || stateChanges[0].State != int(domainpet.PetStateRest) {
		t.Fatalf("stateChanges[0] = %#v, want pet 44 -> rest", stateChanges[0])
	}

	returnedPet, err := petRepo.FindByID(context.Background(), 44)
	if err != nil {
		t.Fatalf("FindByID(44) error = %v", err)
	}
	if got := returnedPet.ClientState(); got != int(domainpet.PetStateRest) {
		t.Fatalf("returned pet state = %d, want %d", got, domainpet.PetStateRest)
	}
}

func TestHandleCharacterDisconnect_EndsActiveBattleAndPersistsStats(t *testing.T) {
	battleRepo := newTestBattleRepo()
	battleLogRepo := &testBattleLogRepo{}
	charRepo := &testCharacterRepo{}
	service := NewService(battleRepo, battleLogRepo, nil, charRepo, nil, nil, zaptest.NewLogger(t))

	battle := domaincombat.NewBattle(domaincombat.BattleTypePVE, 20)
	player := domaincombat.NewParticipant("1", "player", domaincombat.SidePlayer, false)
	player.EntityType = domaincombat.ParticipantTypeCharacter
	player.EntityID = 1
	player.CurrentHP = 87
	player.CurrentMP = 23
	player.CurrentSP = 19
	battle.AddParticipant(player)

	enemy := domaincombat.NewParticipant("607", "enemy", domaincombat.SideEnemy, true)
	enemy.EntityType = domaincombat.ParticipantTypeCreature
	enemy.EntityID = 607
	enemy.IsAlive = true
	battle.AddParticipant(enemy)

	battle.Start()
	if err := battleRepo.Store(battle); err != nil {
		t.Fatalf("store battle: %v", err)
	}

	battleID, battleEnded, err := service.HandleCharacterDisconnect(context.Background(), 1)
	if err != nil {
		t.Fatalf("HandleCharacterDisconnect() error = %v", err)
	}
	if !battleEnded {
		t.Fatalf("HandleCharacterDisconnect() battleEnded = false, want true")
	}
	if battleID != battle.ID {
		t.Fatalf("HandleCharacterDisconnect() battleID = %q, want %q", battleID, battle.ID)
	}
	if _, err := battleRepo.GetByID(battle.ID); !errors.Is(err, pkgerrors.ErrNotFound) {
		t.Fatalf("battle should be removed after disconnect cleanup, err = %v", err)
	}
	if len(battleLogRepo.savedBattles) != 1 {
		t.Fatalf("saved battle logs = %d, want 1", len(battleLogRepo.savedBattles))
	}
	if charRepo.updatedID != 1 || charRepo.updatedHP != 87 || charRepo.updatedMP != 23 || charRepo.updatedSP != 19 {
		t.Fatalf("unexpected persisted stats: id=%d hp=%d mp=%d sp=%d", charRepo.updatedID, charRepo.updatedHP, charRepo.updatedMP, charRepo.updatedSP)
	}
	if battle.Result == nil || battle.Result.WinnerSide != domaincombat.SideEnemy {
		t.Fatalf("battle winner = %#v, want enemy win", battle.Result)
	}
}

func TestHandleCharacterDisconnect_GroupBattleKeepsBattleActive(t *testing.T) {
	battleRepo := newTestBattleRepo()
	battleLogRepo := &testBattleLogRepo{}
	charRepo := &testCharacterRepo{}
	service := NewService(battleRepo, battleLogRepo, nil, charRepo, nil, nil, zaptest.NewLogger(t))

	battle := domaincombat.NewBattle(domaincombat.BattleTypePVE, 20)

	playerOne := domaincombat.NewParticipant("1", "player-one", domaincombat.SidePlayer, false)
	playerOne.EntityType = domaincombat.ParticipantTypeCharacter
	playerOne.EntityID = 1
	playerOne.CurrentHP = 87
	playerOne.CurrentMP = 23
	playerOne.CurrentSP = 19
	playerOne.MaxHP = 100
	playerOne.IsAlive = true
	battle.AddParticipant(playerOne)

	playerTwo := domaincombat.NewParticipant("2", "player-two", domaincombat.SidePlayer, false)
	playerTwo.EntityType = domaincombat.ParticipantTypeCharacter
	playerTwo.EntityID = 2
	playerTwo.CurrentHP = 90
	playerTwo.CurrentMP = 30
	playerTwo.CurrentSP = 15
	playerTwo.MaxHP = 100
	playerTwo.IsAlive = true
	battle.AddParticipant(playerTwo)

	enemy := domaincombat.NewParticipant("607", "enemy", domaincombat.SideEnemy, true)
	enemy.EntityType = domaincombat.ParticipantTypeCreature
	enemy.EntityID = 607
	enemy.IsAlive = true
	enemy.CurrentHP = 200
	enemy.MaxHP = 200
	battle.AddParticipant(enemy)

	battle.SetPendingCommands(map[string]*domaincombat.BattleCommand{
		"1": {
			ActorID:    "1",
			ActionType: domaincombat.ClientActionAttack,
			TargetID:   "607",
		},
	})

	battle.Start()
	if err := battleRepo.Store(battle); err != nil {
		t.Fatalf("store battle: %v", err)
	}

	battleID, battleEnded, err := service.HandleCharacterDisconnect(context.Background(), 1)
	if err != nil {
		t.Fatalf("HandleCharacterDisconnect() error = %v", err)
	}
	if battleEnded {
		t.Fatalf("HandleCharacterDisconnect() battleEnded = true, want false")
	}
	if battleID != battle.ID {
		t.Fatalf("HandleCharacterDisconnect() battleID = %q, want %q", battleID, battle.ID)
	}

	storedBattle, err := battleRepo.GetByID(battle.ID)
	if err != nil {
		t.Fatalf("GetByID() error = %v, want nil", err)
	}

	remaining := storedBattle.GetParticipant("2")
	if remaining == nil || !remaining.IsAlive {
		t.Fatalf("remaining player = %#v, want alive participant", remaining)
	}

	disconnected := storedBattle.GetParticipant("1")
	if disconnected == nil {
		t.Fatalf("disconnected participant not found")
	}
	if !disconnected.IsAlive {
		t.Fatalf("disconnected participant IsAlive = false, want queued leave before round resolution")
	}
	if disconnected.CurrentHP != 87 {
		t.Fatalf("disconnected participant CurrentHP = %d, want 87 before leave action resolves", disconnected.CurrentHP)
	}
	queued, exists := storedBattle.GetPendingCommands()["1"]
	if !exists {
		t.Fatalf("pending leave command for disconnected participant should exist")
	}
	if queued.ActionType != domaincombat.ClientActionEscape {
		t.Fatalf("queued.ActionType = %d, want %d", queued.ActionType, domaincombat.ClientActionEscape)
	}
	if !queued.QueuedLeave {
		t.Fatalf("queued.QueuedLeave = false, want true")
	}
	if len(battleLogRepo.savedBattles) != 0 {
		t.Fatalf("saved battle logs = %d, want 0", len(battleLogRepo.savedBattles))
	}
	if charRepo.updatedID != 1 || charRepo.updatedHP != 87 || charRepo.updatedMP != 23 || charRepo.updatedSP != 19 {
		t.Fatalf("unexpected persisted stats: id=%d hp=%d mp=%d sp=%d", charRepo.updatedID, charRepo.updatedHP, charRepo.updatedMP, charRepo.updatedSP)
	}
}

func TestCalculateCreatureStats_GrowthScaleAppliesGrowBase(t *testing.T) {
	baseCreature := &models.CreatureTemplate{
		ID:          1,
		Name:        "base",
		AttStrength: 5,
		GrowBase:    1.0,
	}
	scaledCreature := &models.CreatureTemplate{
		ID:          2,
		Name:        "scaled",
		AttStrength: 5,
		GrowBase:    3.0,
	}

	tBase := CalculateCreatureStats(baseCreature, 1)
	tScaled := CalculateCreatureStats(scaledCreature, 1)

	if tScaled.Attack <= tBase.Attack {
		t.Fatalf("Attack with GrowBase=3 (%d) should exceed Attack with GrowBase=1 (%d); GrowthScale must be max(1, GrowBase)", tScaled.Attack, tBase.Attack)
	}
}

func TestCalculateCreatureStats_AptIsMultiplierNotAdditive(t *testing.T) {
	creature := &models.CreatureTemplate{
		ID:          3,
		Name:        "multtest",
		AttStrength: 10,
		AptStrength: 200,
		GrowBase:    1,
	}

	template := CalculateCreatureStats(creature, 1)

	wantAttack := 22
	if template.Attack != wantAttack {
		t.Fatalf("Attack = %d, want %d; apt_strength=200 must use /1000 scaling so effStr=(10+10*200/1000)*1=12 → int(12*1.90)=22", template.Attack, wantAttack)
	}
}

func TestCalculateCreatureStats_SeedMPIsLevelBased(t *testing.T) {
	level := 10
	creature := &models.CreatureTemplate{
		ID:       4,
		Name:     "mptest",
		GrowBase: 1,
	}

	template := CalculateCreatureStats(creature, level)

	wantMP := 20
	if template.MaxMP != wantMP {
		t.Fatalf("MaxMP = %d, want %d (SeedMP is fixed at 20 for creatures with no int/energy)", template.MaxMP, wantMP)
	}
}

func TestCalculateCreatureStats_LifeActsAsMaxHPPercent(t *testing.T) {
	level := 5
	fullLife := CalculateCreatureStats(&models.CreatureTemplate{
		ID:          5,
		Name:        "full-life",
		Life:        10000,
		AttStamina:  8,
		AptStamina:  200,
		GrowBase:    1,
	}, level)
	partialLife := CalculateCreatureStats(&models.CreatureTemplate{
		ID:          6,
		Name:        "partial-life",
		Life:        3500,
		AttStamina:  8,
		AptStamina:  200,
		GrowBase:    1,
	}, level)

	wantLife := fullLife.Life * 3500 / 10000
	if partialLife.Life != wantLife {
		t.Fatalf("Life = %d, want %d when life=3500 means 35%% of the same creature at life=10000 (%d)", partialLife.Life, wantLife, fullLife.Life)
	}
}

func TestApplyTemplateStats_HonorsTemplateMaxMP(t *testing.T) {
	enemy := &domaincombat.Participant{Level: 5}
	tmpl := NPCTemplateData{Level: 5, Life: 200, MaxMP: 777, Attack: 30}
	applyTemplateStats(enemy, tmpl)
	if enemy.MaxMP != 777 {
		t.Fatalf("MaxMP = %d, want 777 (applyTemplateStats must use t.MaxMP when > 0)", enemy.MaxMP)
	}
	if enemy.CurrentMP != 777 {
		t.Fatalf("CurrentMP = %d, want 777", enemy.CurrentMP)
	}
}

func TestApplyTemplateStats_MaxMPFallsBackToLevelFormula(t *testing.T) {
	enemy := &domaincombat.Participant{Level: 5}
	tmpl := NPCTemplateData{Level: 5, Life: 200, MaxMP: 0, Attack: 30}
	applyTemplateStats(enemy, tmpl)
	want := 50 + 5*10
	if enemy.MaxMP != want {
		t.Fatalf("MaxMP = %d, want %d (fallback formula 50+level*10)", enemy.MaxMP, want)
	}
}

func TestStartPVEBattleWithTemplate_EnemyUsesTemplateMaxMP(t *testing.T) {
	charRepo := &testCharacterRepo{character: &domaincharacter.Character{
		ID:           1,
		Name:         "player",
		Level:        10,
		MapID:        20,
		MaxHP:        200,
		CurrentHP:    200,
		MaxMP:        100,
		CurrentMP:    100,
		MaxSP:        80,
		CurrentSP:    80,
		Attack:       30,
		Defense:      15,
		MagicAttack:  25,
		MagicDefense: 12,
		Speed:        110,
		Hit:          120,
		CriticalDmg:  150,
	}}

	service := NewService(newTestBattleRepo(), nil, nil, charRepo, nil, &testPetRepo{}, zaptest.NewLogger(t))

	tmpl := NPCTemplateData{
		ID:     55,
		Name:   "mp-enemy",
		Level:  8,
		Life:   500,
		MaxMP:  999,
		Attack: 40,
	}

	battle, err := service.StartPVEBattleWithTemplate(context.Background(), 1, 20, 0, tmpl, true)
	if err != nil {
		t.Fatalf("StartPVEBattleWithTemplate() error = %v", err)
	}

	enemy := battle.GetParticipantByPosition(0)
	if enemy == nil {
		t.Fatalf("enemy participant not found")
	}
	if enemy.MaxMP != 999 {
		t.Fatalf("enemy.MaxMP = %d, want 999 (template MaxMP must flow through applyTemplateStats)", enemy.MaxMP)
	}
	if enemy.CurrentMP != 999 {
		t.Fatalf("enemy.CurrentMP = %d, want 999", enemy.CurrentMP)
	}
}

func TestBuildPlayerParticipant_RestoresClassAptBeforeStatCalc(t *testing.T) {
	const (
		charStrength     = 20
		classAptStrength = 50
		classID          = 5
	)

	charRepo := &testCharacterRepo{character: &domaincharacter.Character{
		ID:       1,
		Name:     "tester",
		ClassID:  classID,
		Level:    10,
		Gender:   0,
		Strength: charStrength,
	}}

	gm := makeTestGameDataManagerWithClass(t, classID, classAptStrength)

	service := NewService(newTestBattleRepo(), nil, nil, charRepo, nil, &testPetRepo{}, zaptest.NewLogger(t))
	service.SetGameDataManager(gm)

	battle, err := service.StartPVEBattleWithTemplate(context.Background(), 1, 20, 0, NPCTemplateData{
		ID:    99,
		Name:  "enemy",
		Level: 10,
		Life:  200,
	}, true)
	if err != nil {
		t.Fatalf("StartPVEBattleWithTemplate() error = %v", err)
	}

	player := battle.GetParticipant("1")
	if player == nil {
		t.Fatalf("player participant not found")
	}

	wantAttack := 31
	if player.Attack != wantAttack {
		t.Fatalf("player.Attack = %d, want %d (ClassAptStrength=%d must be restored from game data before RecalculateStats)", player.Attack, wantAttack, classAptStrength)
	}
}

func makeTestGameDataManagerWithClass(t *testing.T, classID int, aptStrength float64) *gamedata.Manager {
	t.Helper()
	classRow := json.RawMessage(fmt.Sprintf(`{"id":%d,"apt_strength":%.1f,"apt_agility":0,"apt_stamina":0,"apt_intelligence":0,"apt_energy":0}`, classID, aptStrength))
	gm := gamedata.NewManager(nil, zap.NewNop())
	if err := gm.GetCache().LoadTable(models.TableClass, []json.RawMessage{classRow}); err != nil {
		t.Fatalf("LoadTable(TBL_CLASS) error = %v", err)
	}
	return gm
}

func TestEndBattle_DrainsTenLifeFromOwnerSidePetParticipants(t *testing.T) {
	petRepo := &testPetRepo{
		pets: map[int64]*domainpet.Pet{
			55: {
				ID:          55,
				CharacterID: 1,
				Name:        "battle-pet",
				Life:        10000,
				Property: map[string]interface{}{
					"state": int(domainpet.PetStateBattle),
				},
			},
		},
	}
	service := NewService(newTestBattleRepo(), &testBattleLogRepo{}, nil, &testCharacterRepo{}, nil, petRepo, zaptest.NewLogger(t))
	battle := domaincombat.NewBattle(domaincombat.BattleTypePVE, 20)
	battle.AddParticipant(&domaincombat.Participant{
		ID:         "1",
		Side:       domaincombat.SidePlayer,
		EntityType: domaincombat.ParticipantTypeCharacter,
		EntityID:   1,
		IsAlive:    true,
	})
	battle.AddParticipant(&domaincombat.Participant{
		ID:         "pet_55",
		Side:       domaincombat.SidePlayer,
		EntityType: domaincombat.ParticipantTypePet,
		EntityID:   55,
		OwnerID:    1,
		IsAlive:    true,
	})
	battle.Start()

	service.EndBattle(context.Background(), battle, domaincombat.SidePlayer)

	drained, err := petRepo.FindByID(context.Background(), 55)
	if err != nil {
		t.Fatalf("FindByID(55) error = %v", err)
	}
	if drained.Life != 9990 {
		t.Fatalf("pet Life after battle = %d, want 9990 (drained by 10)", drained.Life)
	}
}

func TestEndBattle_DoesNotDrainLifeWhenNoOwnerSidePetParticipant(t *testing.T) {
	petRepo := &testPetRepo{
		pets: map[int64]*domainpet.Pet{
			66: {
				ID:          66,
				CharacterID: 1,
				Name:        "bench-pet",
				Life:        10000,
				Property: map[string]interface{}{
					"state": int(domainpet.PetStateRest),
				},
			},
		},
	}
	service := NewService(newTestBattleRepo(), &testBattleLogRepo{}, nil, &testCharacterRepo{}, nil, petRepo, zaptest.NewLogger(t))
	battle := domaincombat.NewBattle(domaincombat.BattleTypePVE, 20)
	battle.AddParticipant(&domaincombat.Participant{
		ID:         "1",
		Side:       domaincombat.SidePlayer,
		EntityType: domaincombat.ParticipantTypeCharacter,
		EntityID:   1,
		IsAlive:    true,
	})
	battle.Start()

	service.EndBattle(context.Background(), battle, domaincombat.SidePlayer)

	bench, err := petRepo.FindByID(context.Background(), 66)
	if err != nil {
		t.Fatalf("FindByID(66) error = %v", err)
	}
	if bench.Life != 10000 {
		t.Fatalf("bench pet Life = %d, want 10000 (not drained, did not participate)", bench.Life)
	}
}

func TestEndBattle_PetLifeClampedToZeroNotNegative(t *testing.T) {
	petRepo := &testPetRepo{
		pets: map[int64]*domainpet.Pet{
			77: {
				ID:          77,
				CharacterID: 1,
				Name:        "low-life-pet",
				Life:        5,
				Property: map[string]interface{}{
					"state": int(domainpet.PetStateBattle),
				},
			},
		},
	}
	service := NewService(newTestBattleRepo(), &testBattleLogRepo{}, nil, &testCharacterRepo{}, nil, petRepo, zaptest.NewLogger(t))
	battle := domaincombat.NewBattle(domaincombat.BattleTypePVE, 20)
	battle.AddParticipant(&domaincombat.Participant{
		ID:         "1",
		Side:       domaincombat.SidePlayer,
		EntityType: domaincombat.ParticipantTypeCharacter,
		EntityID:   1,
		IsAlive:    true,
	})
	battle.AddParticipant(&domaincombat.Participant{
		ID:         "pet_77",
		Side:       domaincombat.SidePlayer,
		EntityType: domaincombat.ParticipantTypePet,
		EntityID:   77,
		OwnerID:    1,
		IsAlive:    true,
	})
	battle.Start()

	service.EndBattle(context.Background(), battle, domaincombat.SidePlayer)

	clamped, err := petRepo.FindByID(context.Background(), 77)
	if err != nil {
		t.Fatalf("FindByID(77) error = %v", err)
	}
	if clamped.Life != 0 {
		t.Fatalf("pet Life = %d, want 0 (clamped, not negative)", clamped.Life)
	}
}

func TestStartPVEBattleWithTemplate_ZeroLifeFollowingPetDoesNotEnterBattle(t *testing.T) {
	charRepo := &testCharacterRepo{character: &domaincharacter.Character{
		ID:             1,
		Name:           "player",
		MapID:          20,
		ClassID:        1,
		Level:          8,
		CurrentHP:      120,
		MaxHP:          120,
		CurrentMP:      60,
		MaxMP:          60,
		CurrentSP:      80,
		MaxSP:          80,
		Attack:         20,
		Defense:        10,
		MagicAttack:    15,
		MagicDefense:   8,
		Speed:          110,
		Hit:            120,
		CriticalDmg:    150,
		FinalCounter:   1,
		FinalCombo:     1,
		FinalPraDef:    1,
		FinalPraMagDef: 1,
	}}
	petRepo := &testPetRepo{
		pets: map[int64]*domainpet.Pet{
			88: {
				ID:          88,
				CharacterID: 1,
				Name:        "dead-following-pet",
				IsFollowing: true,
				Level:       5,
				Life:        0,
				CurrentHP:   40,
				MaxHP:       40,
				GrowRate:    1,
				AptStrength: 10,
				AptAgility:  10,
				AptStamina:  10,
				AptEnergy:   10,
				Property: map[string]interface{}{
					"state": int(domainpet.PetStateRest),
				},
			},
		},
	}
	template := NPCTemplateData{ID: 99, Name: "enemy", Level: 10, Life: 200, Attack: 30}
	service := NewService(newTestBattleRepo(), nil, nil, charRepo, nil, petRepo, zaptest.NewLogger(t))

	battle, err := service.StartPVEBattleWithTemplate(context.Background(), 1, 20, 0, template, true)
	if err != nil {
		t.Fatalf("StartPVEBattleWithTemplate() error = %v", err)
	}

	if battle.GetParticipant("pet_88") != nil {
		t.Fatalf("zero-life following pet must not enter battle as a participant")
	}
}

func TestEndBattle_ZeroLifePetDrainedByParticipantEntityIDNotActivePet(t *testing.T) {
	petRepo := &testPetRepo{
		pets: map[int64]*domainpet.Pet{
			91: {
				ID:          91,
				CharacterID: 1,
				Name:        "actual-battle-pet",
				Life:        50,
				Property: map[string]interface{}{
					"state": int(domainpet.PetStateBattle),
				},
			},
			92: {
				ID:          92,
				CharacterID: 1,
				Name:        "following-bystander",
				IsFollowing: true,
				Life:        10000,
				Property: map[string]interface{}{
					"state": int(domainpet.PetStateRest),
				},
			},
		},
	}
	service := NewService(newTestBattleRepo(), &testBattleLogRepo{}, nil, &testCharacterRepo{}, nil, petRepo, zaptest.NewLogger(t))
	battle := domaincombat.NewBattle(domaincombat.BattleTypePVE, 20)
	battle.AddParticipant(&domaincombat.Participant{
		ID:         "1",
		Side:       domaincombat.SidePlayer,
		EntityType: domaincombat.ParticipantTypeCharacter,
		EntityID:   1,
		IsAlive:    true,
	})
	battle.AddParticipant(&domaincombat.Participant{
		ID:         "pet_91",
		Side:       domaincombat.SidePlayer,
		EntityType: domaincombat.ParticipantTypePet,
		EntityID:   91,
		OwnerID:    1,
		IsAlive:    true,
	})
	battle.Start()

	service.EndBattle(context.Background(), battle, domaincombat.SidePlayer)

	actualBattlePet, err := petRepo.FindByID(context.Background(), 91)
	if err != nil {
		t.Fatalf("FindByID(91) error = %v", err)
	}
	if actualBattlePet.Life != 40 {
		t.Fatalf("actual battle pet Life = %d, want 40 (50 - 10 drain)", actualBattlePet.Life)
	}

	bystander, err := petRepo.FindByID(context.Background(), 92)
	if err != nil {
		t.Fatalf("FindByID(92) error = %v", err)
	}
	if bystander.Life != 10000 {
		t.Fatalf("following bystander Life = %d, want 10000 (must not be drained)", bystander.Life)
	}
}

func TestNormalizeEncounterTemplateForPlayer_BypassesClampForBossFlaggedTemplate(t *testing.T) {
	template := NPCTemplateData{
		BossFlag:     1,
		Level:        160,
		Life:         132000,
		Attack:       8500,
		Defense:      4200,
		MagicAttack:  7100,
		MagicDefense: 3900,
		Speed:        320,
		Hit:          240,
		Dodge:        180,
		Critical:     90,
	}

	normalized := NormalizeEncounterTemplateForPlayer(template, 1)

	if normalized != template {
		t.Fatalf("boss-flagged template was modified: got %#v, want %#v", normalized, template)
	}
}

func TestNormalizeEncounterTemplateForPlayer_BypassesClampForMinionFlaggedTemplate(t *testing.T) {
	template := NPCTemplateData{
		BossFlag:     2,
		Level:        160,
		Life:         48000,
		Attack:       4200,
		Defense:      2100,
		MagicAttack:  3600,
		MagicDefense: 1950,
		Speed:        280,
		Hit:          220,
		Dodge:        140,
		Critical:     60,
	}

	normalized := NormalizeEncounterTemplateForPlayer(template, 1)

	if normalized != template {
		t.Fatalf("minion-flagged template was modified: got %#v, want %#v", normalized, template)
	}
}

func TestCalculateCreatureStats_LevelMultiplier_FloorAtLowLevel(t *testing.T) {
	creature := &models.CreatureTemplate{
		ID:         100,
		Name:       "low-level",
		AttStamina: 10,
		GrowBase:   1.0,
		Life:       10000,
	}

	lv1 := CalculateCreatureStats(creature, 1)
	lv9 := CalculateCreatureStats(creature, 9)
	lv10 := CalculateCreatureStats(creature, 10)
	lv11 := CalculateCreatureStats(creature, 11)

	if lv1.Life != lv9.Life || lv1.Life != lv10.Life {
		t.Fatalf("HP should be identical at lv1/lv9/lv10 (multiplier floor=1.0): lv1=%d lv9=%d lv10=%d", lv1.Life, lv9.Life, lv10.Life)
	}
	if lv11.Life <= lv10.Life {
		t.Fatalf("HP at lv11 (%d) should exceed lv10 (%d) — level multiplier must kick in above level 10", lv11.Life, lv10.Life)
	}
}

func TestCalculateCreatureStats_LevelMultiplier_HighLevelBossHP(t *testing.T) {
	solomon := &models.CreatureTemplate{
		ID:         1932,
		Name:       "Solomon",
		AttStamina: 800,
		AptStamina: 5000,
		GrowBase:   2.50,
		Life:       3500,
	}
	mehdi := &models.CreatureTemplate{
		ID:         2012,
		Name:       "Mehdi",
		AttStamina: 800,
		AptStamina: 5000,
		GrowBase:   2.50,
		Life:       3500,
	}
	rada := &models.CreatureTemplate{
		ID:         2196,
		Name:       "Rada",
		AttStamina: 800,
		AptStamina: 5000,
		GrowBase:   2.50,
		Life:       20000,
	}

	tSolomon := CalculateCreatureStats(solomon, 140)
	tMehdi := CalculateCreatureStats(mehdi, 150)
	tRada := CalculateCreatureStats(rada, 160)

	if tSolomon.Life != 98008820 {
		t.Fatalf("Solomon HP = %d, want 98008820", tSolomon.Life)
	}
	if tMehdi.Life != 120546562 {
		t.Fatalf("Mehdi HP = %d, want 120546562", tMehdi.Life)
	}
	if tRada.Life != 835993600 {
		t.Fatalf("Rada HP = %d, want 835993600", tRada.Life)
	}

	if tMehdi.Life <= tSolomon.Life {
		t.Fatalf("Mehdi HP (%d) should exceed Solomon HP (%d) — same att but higher level", tMehdi.Life, tSolomon.Life)
	}
	if tRada.Life <= tMehdi.Life {
		t.Fatalf("Rada HP (%d) should exceed Mehdi HP (%d) — same att but higher level", tRada.Life, tMehdi.Life)
	}
}
