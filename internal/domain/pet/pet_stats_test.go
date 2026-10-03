// Open-sourced by BaoLT

package pet

import (
	"testing"

	"mcgame-server/internal/gamedata/models"
)

func TestPetRecalculateStats_UsesGrowthAndCreatureAptitude(t *testing.T) {
	template := &models.CreatureTemplate{
		ID:              99,
		Name:            "test-creature",
		AttStrength:     5,
		AttAgility:      4,
		AttStamina:      8,
		AttIntelligence: 3,
		AttEnergy:       2,
		AptStrength:     20,
		AptAgility:      10,
		AptStamina:      15,
		AptIntelligence: 5,
		AptEnergy:       8,
		GrowBase:        0.1,
		Element:         0,
	}

	pet := NewPetFromCreature(1, template)
	pet.Level = 10
	pet.GrowRate = 0.1
	pet.GrowRateAdd = 0
	pet.RecalculateStats()

	if pet.MaxHP != 34 {
		t.Fatalf("MaxHP = %d, want 34 (level 10 with creature att/apt)", pet.MaxHP)
	}

	if pet.Property["finalAttack"] == nil || pet.Property["finalAttack"].(int) <= 0 {
		t.Fatalf("finalAttack = %v, want positive", pet.Property["finalAttack"])
	}
	if pet.Property["finalSpeed"] == nil || pet.Property["finalSpeed"].(int) <= 100 {
		t.Fatalf("finalSpeed = %v, want greater than 100", pet.Property["finalSpeed"])
	}
}

func TestPetRecalculateStats_AptitudeMultipliesCreatureAtt(t *testing.T) {
	templateNoApt := &models.CreatureTemplate{
		ID:         1,
		Name:       "no-apt",
		AttStamina: 10,
		AptStamina: 0,
		GrowBase:   1,
	}
	templateWithApt := &models.CreatureTemplate{
		ID:         2,
		Name:       "with-apt",
		AttStamina: 10,
		AptStamina: 50,
		GrowBase:   1,
	}

	petNoApt := NewPetFromCreature(1, templateNoApt)
	petNoApt.Level = 10
	petNoApt.GrowRate = 1
	petNoApt.RecalculateStats()

	petWithApt := NewPetFromCreature(1, templateWithApt)
	petWithApt.Level = 10
	petWithApt.GrowRate = 1
	petWithApt.RecalculateStats()

	if petWithApt.MaxHP <= petNoApt.MaxHP {
		t.Fatalf("MaxHP with AptStamina=50 (%d) should exceed MaxHP without (%d)", petWithApt.MaxHP, petNoApt.MaxHP)
	}
}

func TestPetRecalculateStats_AptStrengthExIsAdditiveRawBonus(t *testing.T) {
	template := &models.CreatureTemplate{
		ID:          3,
		Name:        "test-pet",
		AttStrength: 5,
		AptStrength: 0,
		GrowBase:    0.1,
	}

	petBase := NewPetFromCreature(1, template)
	petBase.Level = 10
	petBase.GrowRate = 0.1
	petBase.RecalculateStats()
	attackBase := petBase.Property["finalAttack"].(int)

	petWithEx := NewPetFromCreature(1, template)
	petWithEx.Level = 10
	petWithEx.GrowRate = 0.1
	petWithEx.AptStrengthEx = 10
	petWithEx.RecalculateStats()
	attackWithEx := petWithEx.Property["finalAttack"].(int)

	if attackWithEx <= attackBase {
		t.Fatalf("Attack with AptStrengthEx=10 (%d) should exceed base (%d)", attackWithEx, attackBase)
	}
}

func TestPetRecalculateStats_CreaturePetsUseFlatGrowBaseAndPerLevelBaseStats(t *testing.T) {
	template := &models.CreatureTemplate{
		ID:         4,
		Name:       "grow-test",
		AttStamina: 10,
		AptStamina: 0,
		GrowBase:   0.1,
	}

	petL1 := NewPetFromCreature(1, template)
	petL1.Level = 1
	petL1.GrowRate = 0.1
	petL1.RecalculateStats()
	if got := petL1.MaxHP; got != 28 {
		t.Fatalf("MaxHP at level 1 = %d, want 28", got)
	}

	petL10 := NewPetFromCreature(1, template)
	petL10.Level = 10
	petL10.GrowRate = 0.1
	petL10.RecalculateStats()
	if got := petL10.Property["finalStamina"]; got != 19 {
		t.Fatalf("finalStamina at level 10 = %#v, want 19", got)
	}
	if got := petL10.MaxHP; got != 36 {
		t.Fatalf("MaxHP at level 10 = %d, want 36", got)
	}
}

func TestPetRecalculateStats_ShowAbleUsesFlatGrowBaseAndPerLevelBaseStats(t *testing.T) {
	template := &models.CreatureTemplate{
		ID:              10,
		Name:            "showable-creature",
		ShowAble:        1,
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
	}

	pet := NewPetFromCreature(1, template)
	pet.Level = 10
	pet.GrowRate = 0.8
	pet.RecalculateStats()

	if got := pet.Property["finalStrength"]; got != 11 {
		t.Fatalf("finalStrength = %#v, want 11", got)
	}
	if got := pet.Property["finalAgility"]; got != 10 {
		t.Fatalf("finalAgility = %#v, want 10", got)
	}
	if got := pet.Property["finalStamina"]; got != 11 {
		t.Fatalf("finalStamina = %#v, want 11", got)
	}
	if got := pet.Property["finalIntelligence"]; got != 11 {
		t.Fatalf("finalIntelligence = %#v, want 11", got)
	}
	if got := pet.Property["finalEnergy"]; got != 12 {
		t.Fatalf("finalEnergy = %#v, want 12", got)
	}
	if got := pet.MaxHP; got != 225 {
		t.Fatalf("MaxHP = %d, want 225", got)
	}
	if got := pet.MaxMP; got != 249 {
		t.Fatalf("MaxMP = %d, want 249", got)
	}
	if got := pet.Property["finalAttack"]; got != 59 {
		t.Fatalf("finalAttack = %#v, want 59", got)
	}
	if got := pet.Property["finalMAttack"]; got != 63 {
		t.Fatalf("finalMAttack = %#v, want 63", got)
	}
	if got := pet.Property["finalDefence"]; got != 82 {
		t.Fatalf("finalDefence = %#v, want 82", got)
	}
	if got := pet.Property["finalMDefence"]; got != 182 {
		t.Fatalf("finalMDefence = %#v, want 182", got)
	}
	if got := pet.Property["finalHit"]; got != 103 {
		t.Fatalf("finalHit = %#v, want 103", got)
	}
	if got := pet.Property["finalDodge"]; got != 2 {
		t.Fatalf("finalDodge = %#v, want 2", got)
	}
	if got := pet.Property["finalSpeed"]; got != 140 {
		t.Fatalf("finalSpeed = %#v, want 140", got)
	}
	if got := pet.Property["finalCritical"]; got != 2 {
		t.Fatalf("finalCritical = %#v, want 2", got)
	}
}

func TestPetRecalculateStats_LifeDoesNotScaleMaxHP(t *testing.T) {
	fullLifeTemplate := &models.CreatureTemplate{
		ID:         5,
		Name:       "full-life-pet",
		Life:       10000,
		AttStamina: 10,
		AptStamina: 100,
		GrowBase:   0.1,
	}
	partialLifeTemplate := &models.CreatureTemplate{
		ID:         6,
		Name:       "partial-life-pet",
		Life:       3500,
		AttStamina: 10,
		AptStamina: 100,
		GrowBase:   0.1,
	}

	fullLifePet := NewPetFromCreature(1, fullLifeTemplate)
	fullLifePet.Level = 10
	fullLifePet.GrowRate = 0.1
	fullLifePet.RecalculateStats()

	partialLifePet := NewPetFromCreature(1, partialLifeTemplate)
	partialLifePet.Level = 10
	partialLifePet.GrowRate = 0.1
	partialLifePet.RecalculateStats()

	if partialLifePet.MaxHP != fullLifePet.MaxHP {
		t.Fatalf("MaxHP with life=3500 (%d) should equal MaxHP with life=10000 (%d): creature life must not scale combat HP", partialLifePet.MaxHP, fullLifePet.MaxHP)
	}
}

func TestToDTO_EmitsStoredLife(t *testing.T) {
	p := &Pet{
		ID:         10,
		TemplateID: 5,
		Name:       "life-dto-pet",
		Level:      1,
		MaxHP:      800,
		MaxMP:      200,
		Life:       7777,
		Property:   map[string]interface{}{},
	}

	wrapper := p.ToDTO()
	dto := wrapper["data"].(map[string]interface{})

	got, ok := dto["life"].(string)
	if !ok {
		t.Fatalf("dto[life] type = %T, want string", dto["life"])
	}
	if got != "7777" {
		t.Fatalf("dto[life] = %q, want %q (must use stored Life, not MaxHP*10=%d)", got, "7777", p.MaxHP*10)
	}
}

func TestToSceneDTO_EmitsStoredLife(t *testing.T) {
	p := &Pet{
		ID:          20,
		CharacterID: 5,
		TemplateID:  7,
		Name:        "scene-life-pet",
		Level:       5,
		MaxHP:       600,
		MaxMP:       150,
		Life:        6500,
		Property:    map[string]interface{}{},
	}

	dto := p.ToSceneDTO()

	got, ok := dto["life"].(int)
	if !ok {
		t.Fatalf("ToSceneDTO()[life] type = %T, want int", dto["life"])
	}
	if got != 6500 {
		t.Fatalf("ToSceneDTO()[life] = %d, want 6500 (must use stored Life, not MaxHP*10=%d)", got, p.MaxHP*10)
	}
}

func TestNewPetFromCreature_SetsLifeToDefault(t *testing.T) {
	template := &models.CreatureTemplate{
		ID:         9,
		Name:       "default-life-creature",
		Life:       3500,
		AttStamina: 10,
		GrowBase:   0.1,
	}

	p := NewPetFromCreature(1, template)

	if p.Life != 10000 {
		t.Fatalf("NewPetFromCreature Life = %d, want 10000 (default full life)", p.Life)
	}
}

func TestGainExperience_LevelUpAwardsAttributePoints(t *testing.T) {
	template := &models.CreatureTemplate{
		ID:              7,
		Name:            "level-up-pet",
		AttStrength:     5,
		AttAgility:      4,
		AttStamina:      8,
		AttIntelligence: 3,
		AttEnergy:       2,
		AptStrength:     20,
		AptAgility:      10,
		AptStamina:      15,
		AptIntelligence: 5,
		AptEnergy:       8,
		GrowBase:        0.1,
	}

	pet := NewPetFromCreature(1, template)
	pet.Experience = 0

	leveledUp := pet.GainExperience(36)
	if !leveledUp {
		t.Fatalf("expected level up")
	}
	if pet.Level != 2 {
		t.Fatalf("level = %d, want 2", pet.Level)
	}
	if pet.AttrPoints != 5 {
		t.Fatalf("attr points = %d, want 5", pet.AttrPoints)
	}
	if pet.MaxAttrPoints != 5 {
		t.Fatalf("max attr points = %d, want 5", pet.MaxAttrPoints)
	}
	if got := pet.Property["lastPoint"]; got != 5 {
		t.Fatalf("property[lastPoint] = %#v, want 5", got)
	}
	if pet.ClientExperience() != 37 {
		t.Fatalf("ClientExperience() = %d, want 37", pet.ClientExperience())
	}
}

func TestAllocateAttributePoints_ConsumesPetPointsAndIncreasesExtraAptitude(t *testing.T) {
	template := &models.CreatureTemplate{
		ID:          8,
		Name:        "allocate-pet",
		AttStrength: 5,
		GrowBase:    0.1,
	}

	pet := NewPetFromCreature(1, template)
	pet.Level = 10
	pet.AttrPoints = 3
	pet.MaxAttrPoints = 3
	pet.RecalculateStats()

	baseAttack := pet.Property["finalAttack"].(int)

	allocated := pet.AllocateAttributePoints(2, 0, 0, 0, 0)
	if allocated != 2 {
		t.Fatalf("allocated = %d, want 2", allocated)
	}
	if pet.AptStrengthEx != 2 {
		t.Fatalf("AptStrengthEx = %d, want 2", pet.AptStrengthEx)
	}
	if pet.AttrPoints != 1 {
		t.Fatalf("AttrPoints = %d, want 1", pet.AttrPoints)
	}
	if pet.DistributedAttrPoints != 2 {
		t.Fatalf("DistributedAttrPoints = %d, want 2", pet.DistributedAttrPoints)
	}
	if got := pet.Property["lastPoint"]; got != 1 {
		t.Fatalf("property[lastPoint] = %#v, want 1", got)
	}
	if got := pet.Property["finalAttack"].(int); got <= baseAttack {
		t.Fatalf("finalAttack = %d, want greater than %d after allocation", got, baseAttack)
	}

	if over := pet.AllocateAttributePoints(5, 0, 0, 0, 0); over != 0 {
		t.Fatalf("over-allocation returned %d, want 0", over)
	}
	if pet.AttrPoints != 1 {
		t.Fatalf("AttrPoints after over-alloc = %d, want 1 (unchanged)", pet.AttrPoints)
	}
}

func TestExperienceForLevel_UsesClientPetLevelExpTable(t *testing.T) {
	if got := ExperienceForLevel(1); got != 1 {
		t.Fatalf("ExperienceForLevel(1) = %d, want 1", got)
	}
	if got := ExperienceForLevel(2); got != 37 {
		t.Fatalf("ExperienceForLevel(2) = %d, want 37", got)
	}
	if got := ExperienceForLevel(3); got != 179 {
		t.Fatalf("ExperienceForLevel(3) = %d, want 179", got)
	}
}
