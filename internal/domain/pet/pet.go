// Open-sourced by BaoLT

// Pet entity represents a pet with aptitudes, skills, and evolution systems.
package pet

import (
	"fmt"
	"strconv"
	"time"

	domainelement "mcgame-server/internal/domain/element"
	"mcgame-server/internal/domain/stats"
	"mcgame-server/internal/gamedata/models"
)

type Pet struct {
	ID          int64
	CharacterID int64
	TemplateID  int
	Name        string
	Level       int
	Experience  int64

	AptStrength     int
	AptAgility      int
	AptStamina      int
	AptIntelligence int
	AptEnergy       int

	AptStrengthEx     int
	AptAgilityEx      int
	AptStaminaEx      int
	AptIntelligenceEx int
	AptEnergyEx       int

	GrowRate    float64
	GrowRateAdd float64
	UpgradeNum  int
	EvolutionLv int
	Element     int

	CurrentHP int
	CurrentMP int
	MaxHP     int
	MaxMP     int

	Life int

	AttrPoints            int
	MaxAttrPoints         int
	DistributedAttrPoints int

	IsFollowing bool
	IsMounting  bool

	Property         map[string]interface{}
	CreatureData     map[string]interface{}
	SoulInfo         map[string]interface{}
	skillBonuses     SkillStatBonuses
	equipmentBonuses EquipmentStatBonuses

	CreatedAt time.Time
	UpdatedAt time.Time
}

type PetState int

const (
	PetStateIdle      PetState = 0
	PetStateBattle    PetState = 1
	PetStateFollowing PetState = 2
	PetStateRest      PetState = 3
	PetStateMounting  PetState = 4
)

const (
	ElementNone  = 0
	ElementFire  = 1
	ElementWater = 2
	ElementWood  = 3
	ElementMetal = 4
	ElementEarth = 5
)

type AptitudeType int

const (
	AptTypeStrength     AptitudeType = 1
	AptTypeAgility      AptitudeType = 2
	AptTypeStamina      AptitudeType = 3
	AptTypeIntelligence AptitudeType = 4
	AptTypeEnergy       AptitudeType = 5
)

type PetTemplate struct {
	ID         int
	Name       string
	ResCode    int
	Element    int
	BaseGrow   float64
	CatchLevel int

	MinStrength     int
	MaxStrength     int
	MinAgility      int
	MaxAgility      int
	MinStamina      int
	MaxStamina      int
	MinIntelligence int
	MaxIntelligence int
	MinEnergy       int
	MaxEnergy       int
}

func NewPet(characterID int64, template *PetTemplate, name string) *Pet {
	now := time.Now()

	baseStrength := (template.MinStrength + template.MaxStrength) / 2
	baseAgility := (template.MinAgility + template.MaxAgility) / 2
	baseStamina := (template.MinStamina + template.MaxStamina) / 2
	baseIntelligence := (template.MinIntelligence + template.MaxIntelligence) / 2
	baseEnergy := (template.MinEnergy + template.MaxEnergy) / 2

	pet := &Pet{
		CharacterID:     characterID,
		TemplateID:      template.ID,
		Name:            name,
		Level:           1,
		Experience:      0,
		AptStrength:     baseStrength,
		AptAgility:      baseAgility,
		AptStamina:      baseStamina,
		AptIntelligence: baseIntelligence,
		AptEnergy:       baseEnergy,
		GrowRate:        template.BaseGrow,
		GrowRateAdd:     0,
		UpgradeNum:      0,
		EvolutionLv:     0,
		Element:         domainelement.NormalizeClientElementID(template.Element),
		Life:            MaxLife,
		Property:        make(map[string]interface{}),
		CreatedAt:       now,
		UpdatedAt:       now,
	}

	pet.RecalculateStats()
	return pet
}

func NewPetFromCreature(characterID int64, template *models.CreatureTemplate) *Pet {
	now := time.Now()
	// Transformation moved to SetCreatureData

	pet := &Pet{
		CharacterID:     characterID,
		TemplateID:      int(template.ID),
		Name:            template.Name,
		Level:           1,
		Experience:      0,
		AptStrength:     int(template.AptStrength),
		AptAgility:      int(template.AptAgility),
		AptStamina:      int(template.AptStamina),
		AptIntelligence: int(template.AptIntelligence),
		AptEnergy:       int(template.AptEnergy),
		GrowRate:        template.GrowBase,
		GrowRateAdd:     0,
		UpgradeNum:      0,
		EvolutionLv:     0,
		Element:         domainelement.NormalizeClientElementValue(template.Element),
		Life:            MaxLife,
		Property:        make(map[string]interface{}),
		CreatureData:    nil,
		CreatedAt:       now,
		UpdatedAt:       now,
	}

	pet.SetCreatureData(template)

	// Initialize Skills as -1 (empty)
	for i := 1; i <= 15; i++ {
		pet.Property[fmt.Sprintf("skill%d", i)] = -1
	}

	// Set initial status in property
	pet.Property["state"] = 3 // Per log for newly added pet

	pet.RecalculateStats()
	return pet
}

func (p *Pet) RecalculateStats() {
	if p.Property == nil {
		p.Property = make(map[string]interface{})
	}

	growthScale := p.petGrowthScale()
	levelBonus := p.petPerLevelBaseStatBonus()
	attrBonus := p.equipmentBonuses.Flat

	attStr := creatureDataFloat(p.CreatureData, "attStrength") + levelBonus
	attAgi := creatureDataFloat(p.CreatureData, "attAgility") + levelBonus
	attStam := creatureDataFloat(p.CreatureData, "attStamina") + levelBonus
	attInt := creatureDataFloat(p.CreatureData, "attIntelligence") + levelBonus
	attEng := creatureDataFloat(p.CreatureData, "attEnergy") + levelBonus

	aptStr := creatureDataFloat(p.CreatureData, "aptStrength")
	aptAgi := creatureDataFloat(p.CreatureData, "aptAgility")
	aptStam := creatureDataFloat(p.CreatureData, "aptStamina")
	aptInt := creatureDataFloat(p.CreatureData, "aptIntelligence")
	aptEng := creatureDataFloat(p.CreatureData, "aptEnergy")

	profile := stats.Profile{
		SeedHP:          20,
		SeedMP:          5,
		SeedHit:         100,
		SeedSpeed:       100,
		GrowthScale:     growthScale,
		Strength:        attStr + float64(p.AptStrengthEx+attrBonus[20]),
		Agility:         attAgi + float64(p.AptAgilityEx),
		Stamina:         attStam + float64(p.AptStaminaEx+attrBonus[21]),
		Intelligence:    attInt + float64(p.AptIntelligenceEx+attrBonus[22]),
		Energy:          attEng + float64(p.AptEnergyEx+attrBonus[23]),
		AptStrength:     aptStr,
		AptAgility:      aptAgi,
		AptStamina:      aptStam,
		AptIntelligence: aptInt,
		AptEnergy:       aptEng,
	}
	result := stats.BuildBaseStats(profile)

	p.MaxHP = result.MaxHP
	p.MaxMP = result.MaxMP

	p.Property["finalStrength"] = int(profile.Strength)
	p.Property["finalAgility"] = int(profile.Agility)
	p.Property["finalStamina"] = int(profile.Stamina)
	p.Property["finalIntelligence"] = int(profile.Intelligence)
	p.Property["finalEnergy"] = int(profile.Energy)

	p.Property["finalHp"] = p.MaxHP
	p.Property["finalMp"] = p.MaxMP
	p.Property["finalSp"] = result.MaxSP

	p.Property["finalAttack"] = result.Attack
	p.Property["finalDefence"] = result.Defense
	p.Property["finalMAttack"] = result.MagicAttack
	p.Property["finalMDefence"] = result.MagicDefense

	p.Property["finalSpeed"] = result.Speed
	p.Property["finalHit"] = result.Hit
	p.Property["finalDodge"] = result.Dodge
	p.Property["finalCritical"] = result.Critical
	p.Property["finalLuck"] = 0

	zeroKeys := []string{
		"finalPraDef", "finalPraMagDef", "finalBreakReborn", "finalCombo",
		"finalConfusion", "finalCounter", "finalCriticalDamage", "finalDebuffSuccRate",
		"finalDefy", "finalDizzy", "finalEnhMagicHurt", "finalEnhPhyHurt",
		"finalLight", "finalPoison", "finalRage", "finalRebornRate",
		"finalReduceHurt1", "finalReduceHurt2", "finalResiConfusion",
		"finalResiCritical", "finalResiDefy", "finalResiDizzy", "finalResiLight",
		"finalResiPoison", "finalResiRage", "finalResiSleep", "finalSleep",
	}
	for _, k := range zeroKeys {
		p.Property[k] = 0
	}
	p.Property["lastPoint"] = p.AttrPoints
	if _, ok := p.Property["ee"]; !ok {
		p.Property["ee"] = "0"
	}
	if _, ok := p.Property["ef"]; !ok {
		p.Property["ef"] = false
	}
	if _, ok := p.Property["en"]; !ok {
		p.Property["en"] = 0
	}

	p.applyEquipmentBonuses()
	p.applySkillBonuses()

	if p.CurrentHP == 0 {
		p.CurrentHP = p.MaxHP
	} else if p.CurrentHP > p.MaxHP {
		p.CurrentHP = p.MaxHP
	}
	if p.CurrentMP == 0 {
		p.CurrentMP = p.MaxMP
	} else if p.CurrentMP > p.MaxMP {
		p.CurrentMP = p.MaxMP
	}
}

func (p *Pet) petGrowthScale() float64 {
	baseGrowth := p.GrowRate + p.GrowRateAdd
	if p.usesCreaturePetFormula() {
		return baseGrowth
	}
	return baseGrowth * float64(p.Level)
}

func (p *Pet) petPerLevelBaseStatBonus() float64 {
	if !p.usesCreaturePetFormula() || p.Level <= 1 {
		return 0
	}
	return float64(p.Level - 1)
}

func (p *Pet) usesCreaturePetFormula() bool {
	return creatureDataFloat(p.CreatureData, "id") > 0
}

func (p *Pet) GetCombatStats() map[string]int {
	return map[string]int{
		"attack":       petCombatStatIntValue(p.Property, "finalAttack"),
		"defense":      petCombatStatIntValue(p.Property, "finalDefence"),
		"magicAttack":  petCombatStatIntValue(p.Property, "finalMAttack"),
		"magicDefense": petCombatStatIntValue(p.Property, "finalMDefence"),
		"speed":        petCombatStatIntValue(p.Property, "finalSpeed"),
		"hit":          petCombatStatIntValue(p.Property, "finalHit"),
		"dodge":        petCombatStatIntValue(p.Property, "finalDodge"),
		"critical":     petCombatStatIntValue(p.Property, "finalCritical"),
		"criticalDmg":  petCombatStatIntValue(p.Property, "finalCriticalDamage"),
		"counter":      petCombatStatIntValue(p.Property, "finalCounter"),
		"combo":        petCombatStatIntValue(p.Property, "finalCombo"),
		"praDef":       petCombatStatIntValue(p.Property, "finalPraDef"),
		"praMagDef":    petCombatStatIntValue(p.Property, "finalPraMagDef"),
		"reduceHurt1":  petCombatStatIntValue(p.Property, "finalReduceHurt1"),
		"reduceHurt2":  petCombatStatIntValue(p.Property, "finalReduceHurt2"),
		"resiCritical": petCombatStatIntValue(p.Property, "finalResiCritical"),
		"resiDefy":     petCombatStatIntValue(p.Property, "finalResiDefy"),
		"enhPhyHurt":   petCombatStatIntValue(p.Property, "finalEnhPhyHurt"),
		"enhMagicHurt": petCombatStatIntValue(p.Property, "finalEnhMagicHurt"),
	}
}

func (p *Pet) Effective() stats.EffectiveStats {
	cs := p.GetCombatStats()
	es := stats.NewEffectiveStats()

	es.Set(stats.PropHP, int64(p.MaxHP))
	es.Set(stats.PropMP, int64(p.MaxMP))
	es.Set(stats.PropPhysAtk, int64(cs["attack"]))
	es.Set(stats.PropMagAtk, int64(cs["magicAttack"]))
	es.Set(stats.PropPhysDef, int64(cs["defense"]))
	es.Set(stats.PropMagDef, int64(cs["magicDefense"]))
	es.Set(stats.PropAccuracy, int64(cs["hit"]))
	es.Set(stats.PropDodge, int64(cs["dodge"]))
	es.Set(stats.PropSpeed, int64(cs["speed"]))

	migrated := p.Property["_permille_v2"] == true
	rate := func(v int) int64 {
		if migrated {
			return int64(v)
		}
		return int64(v) * 10
	}

	es.Set(stats.PropCritRate, rate(cs["critical"]))
	es.Set(stats.PropCritDmgBonus, max(0, int64(cs["criticalDmg"])-stats.BaseCritDmgPercent)*10)

	es.Set(stats.PropCounter, rate(cs["counter"]))
	es.Set(stats.PropCombo, rate(cs["combo"]))
	es.Set(stats.PropDefy, rate(cs["praDef"]))
	es.Set(stats.PropMagDefy, rate(cs["praMagDef"]))
	es.Set(stats.PropResistDefy, rate(cs["resiDefy"]))
	es.Set(stats.PropResistCrit, rate(cs["resiCritical"]))

	es.Set(stats.PropFinalPhysDmgUp, stats.PerMille+rate(cs["enhPhyHurt"]))
	es.Set(stats.PropFinalMagDmgUp, stats.PerMille+rate(cs["enhMagicHurt"]))
	es.Set(stats.PropFinalPhysDmgDown, 0)
	es.Set(stats.PropFinalMagDmgDown, 0)

	es.Set(stats.PropPhysDmgCut, rate(cs["reduceHurt1"]))
	es.Set(stats.PropMagDmgCut, rate(cs["reduceHurt2"]))

	return es
}

func (p *Pet) GainExperience(amount int64) (leveledUp bool) {
	p.Experience += amount

	for p.Level < MaxPetLevel {
		expNeeded := LevelUpExperience(p.Level)
		if p.Experience < expNeeded {
			break
		}
		p.Experience -= expNeeded
		p.Level++
		p.AttrPoints += AttributePointsPerLevel
		p.MaxAttrPoints += AttributePointsPerLevel
		leveledUp = true
	}

	if leveledUp {
		p.RecalculateStats()
	}
	p.UpdatedAt = time.Now()
	return leveledUp
}

func (p *Pet) AddStar() bool {
	if p.UpgradeNum >= MaxPetStars {
		return false
	}
	p.UpgradeNum++
	p.UpdatedAt = time.Now()
	return true
}

func (p *Pet) ImproveAptitude(aptType AptitudeType, amount int) {
	switch aptType {
	case AptTypeStrength:
		p.AptStrengthEx += amount
	case AptTypeAgility:
		p.AptAgilityEx += amount
	case AptTypeStamina:
		p.AptStaminaEx += amount
	case AptTypeIntelligence:
		p.AptIntelligenceEx += amount
	case AptTypeEnergy:
		p.AptEnergyEx += amount
	}
	p.RecalculateStats()
	p.UpdatedAt = time.Now()
}

func (p *Pet) AllocateAttributePoints(addStr, addAgi, addSta, addInt, addEng int) int {
	if addStr < 0 || addAgi < 0 || addSta < 0 || addInt < 0 || addEng < 0 {
		return 0
	}
	total := addStr + addAgi + addSta + addInt + addEng
	if total <= 0 || total > p.AttrPoints {
		return 0
	}

	p.AptStrengthEx += addStr
	p.AptAgilityEx += addAgi
	p.AptStaminaEx += addSta
	p.AptIntelligenceEx += addInt
	p.AptEnergyEx += addEng
	p.AttrPoints -= total
	p.DistributedAttrPoints += total
	p.RecalculateStats()
	p.UpdatedAt = time.Now()
	return total
}

func (p *Pet) ToDTO() map[string]interface{} {
	creatureData := normalizePetCreatureData(p.CreatureData)
	state := p.ClientState()

	dto := map[string]interface{}{
		"id":           p.ID,
		"tid":          p.TemplateID,
		"petName":      p.Name,
		"level":        p.Level,
		"exp":          p.ClientExperience(),
		"upgradeNum":   p.UpgradeNum,
		"element":      domainelement.NormalizeClientElementID(p.Element),
		"evolutionLv":  p.EvolutionLv,
		"growRate":     p.GrowRate,
		"currentHp":    p.CurrentHP,
		"currentMp":    p.CurrentMP,
		"hpMax":        p.MaxHP,
		"mpMax":        p.MaxMP,
		"attLastPoint": p.AttrPoints,
		"life":         fmt.Sprintf("%d", p.Life),
		"cid":          p.CharacterID,
		"binded":       fmt.Sprintf("%d", p.BindState()),
		"close":        100,
		"state":        state,
		"creatureData": creatureData,
	}

	// Basic Aptitudes
	dto["aptStrength"] = p.AptStrength
	dto["aptAgility"] = p.AptAgility
	dto["aptStamina"] = p.AptStamina
	dto["aptIntelligence"] = p.AptIntelligence
	dto["aptEnergy"] = p.AptEnergy

	// Extra Aptitudes (Root Level for direct access)
	dto["aptStrengthEx"] = p.AptStrengthEx
	dto["aptAgilityEx"] = p.AptAgilityEx
	dto["aptStaminaEx"] = p.AptStaminaEx
	dto["aptIntelligenceEx"] = p.AptIntelligenceEx
	dto["aptEnergyEx"] = p.AptEnergyEx

	// Skills handling (skill1 - skill15)
	for i := 1; i <= 15; i++ {
		key := fmt.Sprintf("skill%d", i)
		if val, ok := p.Property[key]; ok {
			dto[key] = val
		} else {
			dto[key] = -1
		}
	}

	for slot := 1; slot <= TotalPetEquipmentSlots; slot++ {
		dto[petEquipmentSlotKey(slot)] = p.EquipmentItemID(slot)
	}

	// Property Block (Final Stats)
	prop := make(map[string]interface{})
	for k, v := range p.Property {
		prop[k] = v
	}
	prop["growRate"] = p.GrowRate
	prop["growRateAdd"] = p.GrowRateAdd
	prop["aptStrength"] = p.AptStrength
	prop["aptAgility"] = p.AptAgility
	prop["aptStamina"] = p.AptStamina
	prop["aptIntelligence"] = p.AptIntelligence
	prop["aptEnergy"] = p.AptEnergy

	// Evolution Aptitudes (0 to prevent NaN, logic can follow later)
	prop["aptStrengthEvolution"] = 0
	prop["aptAgilityEvolution"] = 0
	prop["aptStaminaEvolution"] = 0
	prop["aptIntelligenceEvolution"] = 0
	prop["aptEnergyEvolution"] = 0

	prop["state"] = state

	dto["property"] = prop

	// Potential Info (PI) Block
	dto["pi"] = map[string]interface{}{
		"p6":   piValue(p.Property, "p6", 10),
		"p7":   piValue(p.Property, "p7", 10),
		"p8":   piValue(p.Property, "p8", 10),
		"p9":   piValue(p.Property, "p9", 10),
		"bs2":  piValue(p.Property, "bs2", 0),
		"bs4":  piValue(p.Property, "bs4", 0),
		"bs6":  piValue(p.Property, "bs6", 0),
		"bs8":  piValue(p.Property, "bs8", 0),
		"bs10": piValue(p.Property, "bs10", 0),
		"bt2":  piValue(p.Property, "bt2", 0),
		"bt4":  piValue(p.Property, "bt4", 0),
		"bt6":  piValue(p.Property, "bt6", 0),
	}

	// Soul Info — populated by the soul service via the pet service provider;
	// falls back to an empty bag when unset.
	if p.SoulInfo != nil {
		dto["soulInfo"] = p.SoulInfo
	} else {
		dto["soulInfo"] = map[string]interface{}{
			"data":     make(map[string]interface{}),
			"openNum":  0,
			"openNum2": 0,
		}
	}

	return map[string]interface{}{
		"data": dto,
	}
}

func (p *Pet) ToSceneDTO() map[string]interface{} {
	property := clonePetProperty(p.Property)
	property["state"] = p.ClientState()

	dto := map[string]interface{}{
		"id":              p.ID,
		"cid":             p.CharacterID,
		"tid":             p.TemplateID,
		"name":            p.Name,
		"level":           p.Level,
		"currentHp":       p.CurrentHP,
		"currentMp":       p.CurrentMP,
		"hpMax":           p.MaxHP,
		"mpMax":           p.MaxMP,
		"life":            p.Life,
		"element":         domainelement.NormalizeClientElementID(p.Element),
		"property":        property,
		"aptStrength":     p.AptStrength,
		"aptAgility":      p.AptAgility,
		"aptStamina":      p.AptStamina,
		"aptIntelligence": p.AptIntelligence,
		"aptEnergy":       p.AptEnergy,
		"petTrendAction":  0,
		"posCenterX":      0,
		"posCenterY":      0,
		"leaderId":        0,
	}

	for slot := 1; slot <= TotalPetEquipmentSlots; slot++ {
		dto[petEquipmentSlotKey(slot)] = p.EquipmentItemID(slot)
	}

	if p.CreatureData == nil {
		return dto
	}

	if growBase, ok := petSceneFloatValue(p.CreatureData["growBase"]); ok {
		dto["growBase"] = growBase
	}

	for _, key := range []string{"resCode", "iconCode", "colorCode", "brightCode", "classId", "catchable", "qLevel"} {
		if value, ok := petSceneIntValue(p.CreatureData[key]); ok {
			dto[key] = value
		}
	}

	return dto
}

func piValue(property map[string]interface{}, key string, defaultValue int) interface{} {
	if property == nil {
		return defaultValue
	}
	if value, ok := property[key]; ok {
		return value
	}
	return defaultValue
}

func (p *Pet) ClientState() int {
	if p == nil {
		return int(PetStateRest)
	}

	switch typed := p.Property["state"].(type) {
	case int:
		if typed > 0 {
			return typed
		}
	case int32:
		if typed > 0 {
			return int(typed)
		}
	case int64:
		if typed > 0 {
			return int(typed)
		}
	case float64:
		if typed > 0 {
			return int(typed)
		}
	case string:
		if parsed, err := strconv.Atoi(typed); err == nil && parsed > 0 {
			return parsed
		}
	}

	if p.IsFollowing {
		return int(PetStateBattle)
	}

	return int(PetStateRest)
}

func (p *Pet) BindState() int {
	if p == nil {
		return 0
	}

	if p.Property != nil {
		if value, ok := petSceneIntValue(p.Property["binded"]); ok {
			if value > 0 {
				return 1
			}
			return 0
		}
	}

	if p.CreatureData != nil {
		if value, ok := petSceneIntValue(p.CreatureData["isBind"]); ok && value > 0 {
			return 1
		}
	}

	return 0
}

func (p *Pet) IsBound() bool {
	return p.BindState() > 0
}

func (p *Pet) SetBinded(bound bool) {
	if p.Property == nil {
		p.Property = make(map[string]interface{})
	}
	if bound {
		p.Property["binded"] = 1
	} else {
		p.Property["binded"] = 0
	}
	p.UpdatedAt = time.Now()
}

func (p *Pet) SetClientState(state int) {
	if p.Property == nil {
		p.Property = make(map[string]interface{})
	}
	p.Property["state"] = state
}

func (p *Pet) ToDetailDTO() map[string]interface{} {
	wrapper := p.ToDTO()
	dto := wrapper["data"].(map[string]interface{})

	combatStats := p.GetCombatStats()

	dto["attack"] = combatStats["attack"]
	dto["defense"] = combatStats["defense"]
	dto["magicAttack"] = combatStats["magicAttack"]
	dto["magicDefense"] = combatStats["magicDefense"]
	dto["speed"] = combatStats["speed"]
	dto["hit"] = combatStats["hit"]
	dto["dodge"] = combatStats["dodge"]
	dto["critical"] = combatStats["critical"]
	dto["evolutionLv"] = p.EvolutionLv
	dto["featherLevel"] = p.GetFeatherLevel()

	skills := p.LearnedSkillSlots()
	skillDTOs := make([]map[string]interface{}, len(skills))
	for i, s := range skills {
		skillDTOs[i] = map[string]interface{}{
			"id":    s.ID,
			"level": s.Level,
			"slot":  s.Slot,
		}
	}
	dto["skills"] = skillDTOs

	dto["cultivation"] = p.GetCultivation()

	return dto
}

func creatureDataFloat(data map[string]interface{}, key string) float64 {
	if data == nil {
		return 0
	}
	v, ok := data[key]
	if !ok {
		return 0
	}
	switch val := v.(type) {
	case float64:
		return val
	case int:
		return float64(val)
	case string:
		f, _ := strconv.ParseFloat(val, 64)
		return f
	default:
		return 0
	}
}

func normalizePetCreatureData(source map[string]interface{}) map[string]interface{} {
	if source == nil {
		return nil
	}

	cloned := make(map[string]interface{}, len(source))
	for key, value := range source {
		cloned[key] = value
	}

	rawElement, ok := cloned["element"]
	if !ok {
		return cloned
	}

	cloned["element"] = fmt.Sprintf("%d", normalizePetCreatureElement(rawElement))
	return cloned
}

func normalizePetCreatureElement(value interface{}) int {
	switch typed := value.(type) {
	case int:
		return domainelement.NormalizeClientElementID(typed)
	case int64:
		return domainelement.NormalizeClientElementID(int(typed))
	case float64:
		return domainelement.NormalizeClientElementValue(typed)
	case string:
		parsed, err := strconv.Atoi(typed)
		if err != nil {
			return domainelement.ClientElementNeutral
		}
		return domainelement.NormalizeClientElementID(parsed)
	default:
		return domainelement.ClientElementNeutral
	}
}

func clonePetProperty(source map[string]interface{}) map[string]interface{} {
	cloned := make(map[string]interface{}, len(source))
	for key, value := range source {
		cloned[key] = value
	}
	return cloned
}

func petSceneIntValue(value interface{}) (int64, bool) {
	switch typed := value.(type) {
	case int:
		return int64(typed), true
	case int32:
		return int64(typed), true
	case int64:
		return typed, true
	case float64:
		return int64(typed), true
	case string:
		parsed, err := strconv.ParseInt(typed, 10, 64)
		if err == nil {
			return parsed, true
		}
		parsedFloat, err := strconv.ParseFloat(typed, 64)
		if err != nil {
			return 0, false
		}
		return int64(parsedFloat), true
	default:
		return 0, false
	}
}

func petSceneFloatValue(value interface{}) (float64, bool) {
	switch typed := value.(type) {
	case int:
		return float64(typed), true
	case int32:
		return float64(typed), true
	case int64:
		return float64(typed), true
	case float64:
		return typed, true
	case string:
		parsed, err := strconv.ParseFloat(typed, 64)
		if err != nil {
			return 0, false
		}
		return parsed, true
	default:
		return 0, false
	}
}

const (
	AttributePointsPerLevel = 5
	MaxPetLevel             = 160
	MaxPetStars             = 12
	MaxPets                 = 180
	MaxEvolutionLv          = 5
	MaxFeatherLevel         = 10
	MaxPetSkillSlots        = 4
	MaxLife                 = 10000
)

var petLevelExpTable = []int64{
	1, 37, 179, 463, 888, 1581, 2680, 4325, 6616, 9255, 12886, 19322, 31213, 49015, 69805, 93850,
	121427, 152817, 188310, 228201, 272794, 358506, 453418, 558086, 673075, 798961, 936328, 1085772,
	1247900, 1423324, 1612670, 1936457, 2284377, 2657466, 3056773, 3483360, 3938305, 4422698, 4937643,
	5484258, 6063673, 6979240, 7947201, 8969301, 10047304, 11182993, 12378169, 13634650, 14954273,
	16338895, 17790387, 19954965, 22220163, 24588721, 27063404, 29647001, 32342325, 35152212, 38079523,
	41127141, 44297972, 48820569, 53520251, 58401098, 63467221, 68722762, 74171894, 79818817, 85667765,
	91722998, 100062792, 108688613, 117606251, 126821534, 136340327, 146168532, 156312093, 166776986,
	177569228, 188694871, 200160005, 215493572, 240567939, 272316033, 304987655, 338598703, 373165165,
	408703121, 445228737, 482758269, 521308060, 569351388, 618672921, 669292812, 721231319, 774508801,
	829145723, 885162653, 942580260, 1001419317, 1061700697, 1182295769, 1305790007, 1432224766,
	1561641599, 1694082252, 1829588662, 1968202959, 2109967465, 2254924690, 2403117335, 2664859140,
	2932340298, 3205635566, 3484820024, 3769969072, 4061158427, 4358464126, 4661962520, 4971730275,
	5307724846, 5779444415, 6260985265, 6752441643, 7299495631, 7857572191, 8426774140, 9055573472,
	9696648077, 10350109337, 11118523915, 12006372005, 13017819030, 14157084269, 15428440856, 16836215782,
	18384789894, 20078597895, 21922128344, 23919923656, 25879326819, 28052816023, 30354474074, 32854459997,
	35493089857, 38274713134, 41230694030, 44325896939, 47563908041, 51019197363, 54628101576, 58459554672,
	62446393595, 66587287311, 70885904916, 75343749163, 79969730199, 84768446197, 89719586902, 94838109102,
}

func ExperienceForLevel(level int) int64 {
	if level <= 0 {
		return 0
	}
	if level > len(petLevelExpTable) {
		return petLevelExpTable[len(petLevelExpTable)-1]
	}
	return petLevelExpTable[level-1]
}

func LevelUpExperience(level int) int64 {
	if level <= 0 || level >= len(petLevelExpTable) {
		return 0
	}
	return petLevelExpTable[level] - petLevelExpTable[level-1]
}

func (p *Pet) ClientExperience() int64 {
	if p == nil {
		return 0
	}
	return ExperienceForLevel(p.Level) + p.Experience
}

type PetSkill struct {
	ID    int `json:"id"`
	Level int `json:"level"`
	Slot  int `json:"slot"`
}

func (p *Pet) ClearStars() {
	p.UpgradeNum = 0
	p.UpdatedAt = time.Now()
}

func (p *Pet) GetFeatherLevel() int {
	if fl, ok := p.Property["featherLevel"].(float64); ok {
		return int(fl)
	}
	if fl, ok := p.Property["featherLevel"].(int); ok {
		return fl
	}
	return 0
}

func (p *Pet) AddFeather() bool {
	currentLevel := p.GetFeatherLevel()
	if currentLevel >= MaxFeatherLevel {
		return false
	}
	p.Property["featherLevel"] = currentLevel + 1
	p.GrowRateAdd += 0.01
	p.RecalculateStats()
	p.UpdatedAt = time.Now()
	return true
}

func (p *Pet) CanEvolve() bool {
	if p.EvolutionLv >= MaxEvolutionLv {
		return false
	}
	requiredLevel := (p.EvolutionLv + 1) * 30
	requiredStars := (p.EvolutionLv + 1) * 2
	return p.Level >= requiredLevel && p.UpgradeNum >= requiredStars
}

func (p *Pet) Evolve() bool {
	if !p.CanEvolve() {
		return false
	}
	p.EvolutionLv++
	bonus := 0.05
	p.AptStrength = int(float64(p.AptStrength) * (1 + bonus))
	p.AptAgility = int(float64(p.AptAgility) * (1 + bonus))
	p.AptStamina = int(float64(p.AptStamina) * (1 + bonus))
	p.AptIntelligence = int(float64(p.AptIntelligence) * (1 + bonus))
	p.AptEnergy = int(float64(p.AptEnergy) * (1 + bonus))
	p.GrowRateAdd += 0.05
	p.RecalculateStats()
	p.UpdatedAt = time.Now()
	return true
}

func (p *Pet) AbsorbPet(material *Pet) {
	bonus := material.Level / 10
	if bonus < 1 {
		bonus = 1
	}
	p.AptStrengthEx += bonus
	p.AptAgilityEx += bonus
	p.AptStaminaEx += bonus
	p.AptIntelligenceEx += bonus
	p.AptEnergyEx += bonus
	p.GrowRateAdd += 0.01 * float64(material.EvolutionLv+1)
	p.RecalculateStats()
	p.UpdatedAt = time.Now()
}

func (p *Pet) GetSkills() []PetSkill {
	skills := []PetSkill{}
	if skillsData, ok := p.Property["skills"].([]interface{}); ok {
		for _, s := range skillsData {
			if skillMap, ok := s.(map[string]interface{}); ok {
				skill := PetSkill{}
				if id, ok := skillMap["id"].(float64); ok {
					skill.ID = int(id)
				}
				if level, ok := skillMap["level"].(float64); ok {
					skill.Level = int(level)
				}
				if slot, ok := skillMap["slot"].(float64); ok {
					skill.Slot = int(slot)
				}
				skills = append(skills, skill)
			}
		}
	}
	return skills
}

func (p *Pet) setSkills(skills []PetSkill) {
	skillsData := make([]map[string]interface{}, len(skills))
	for i, s := range skills {
		skillsData[i] = map[string]interface{}{
			"id":    s.ID,
			"level": s.Level,
			"slot":  s.Slot,
		}
	}
	p.Property["skills"] = skillsData
}

func (p *Pet) LearnSkill(skillID int) bool {
	skills := p.GetSkills()
	for _, s := range skills {
		if s.ID == skillID {
			return false
		}
	}
	if len(skills) >= MaxPetSkillSlots {
		return false
	}
	slot := len(skills)
	skills = append(skills, PetSkill{ID: skillID, Level: 1, Slot: slot})
	p.setSkills(skills)
	p.UpdatedAt = time.Now()
	return true
}

func (p *Pet) UpgradeSkill(skillID int) bool {
	skills := p.GetSkills()
	for i, s := range skills {
		if s.ID == skillID {
			skills[i].Level++
			p.setSkills(skills)
			p.UpdatedAt = time.Now()
			return true
		}
	}
	return false
}

func (p *Pet) GetCultivation() map[string]int {
	result := map[string]int{"type": 0, "progress": 0}
	if cultData, ok := p.Property["cultivation"].(map[string]interface{}); ok {
		if t, ok := cultData["type"].(float64); ok {
			result["type"] = int(t)
		}
		if prog, ok := cultData["progress"].(float64); ok {
			result["progress"] = int(prog)
		}
	}
	return result
}

func (p *Pet) SetCultivation(cultType, progress int) {
	p.Property["cultivation"] = map[string]interface{}{
		"type":     cultType,
		"progress": progress,
	}
	p.UpdatedAt = time.Now()
}

var DefaultPetTemplates = map[int]*PetTemplate{
	1001: {
		ID:              1001,
		Name:            "Fire Wolf",
		ResCode:         1001,
		Element:         ElementFire,
		BaseGrow:        1.0,
		CatchLevel:      1,
		MinStrength:     50,
		MaxStrength:     80,
		MinAgility:      40,
		MaxAgility:      70,
		MinStamina:      45,
		MaxStamina:      75,
		MinIntelligence: 30,
		MaxIntelligence: 60,
		MinEnergy:       35,
		MaxEnergy:       65,
	},
	1002: {
		ID:              1002,
		Name:            "Water Spirit",
		ResCode:         1002,
		Element:         ElementWater,
		BaseGrow:        1.1,
		CatchLevel:      5,
		MinStrength:     30,
		MaxStrength:     60,
		MinAgility:      45,
		MaxAgility:      75,
		MinStamina:      40,
		MaxStamina:      70,
		MinIntelligence: 55,
		MaxIntelligence: 85,
		MinEnergy:       50,
		MaxEnergy:       80,
	},
	1003: {
		ID:              1003,
		Name:            "Earth Bear",
		ResCode:         1003,
		Element:         ElementEarth,
		BaseGrow:        0.95,
		CatchLevel:      10,
		MinStrength:     60,
		MaxStrength:     90,
		MinAgility:      25,
		MaxAgility:      55,
		MinStamina:      70,
		MaxStamina:      100,
		MinIntelligence: 25,
		MaxIntelligence: 55,
		MinEnergy:       40,
		MaxEnergy:       70,
	},
}

func GetPetTemplate(templateID int) *PetTemplate {
	return DefaultPetTemplates[templateID]
}

func (p *Pet) SetCreatureData(template *models.CreatureTemplate) {
	creatureData := map[string]interface{}{
		"id":              fmt.Sprintf("%d", template.ID),
		"aiid":            fmt.Sprintf("%v", template.Aiid),
		"aptAgility":      fmt.Sprintf("%v", template.AptAgility),
		"aptEnergy":       fmt.Sprintf("%v", template.AptEnergy),
		"aptIntelligence": fmt.Sprintf("%v", template.AptIntelligence),
		"aptStamina":      fmt.Sprintf("%v", template.AptStamina),
		"aptStrength":     fmt.Sprintf("%v", template.AptStrength),

		// Add Min/Max to prevent NaN on client
		"minAgility":      fmt.Sprintf("%v", template.AptAgility),
		"maxAgility":      fmt.Sprintf("%v", template.AptAgility),
		"minEnergy":       fmt.Sprintf("%v", template.AptEnergy),
		"maxEnergy":       fmt.Sprintf("%v", template.AptEnergy),
		"minIntelligence": fmt.Sprintf("%v", template.AptIntelligence),
		"maxIntelligence": fmt.Sprintf("%v", template.AptIntelligence),
		"minStamina":      fmt.Sprintf("%v", template.AptStamina),
		"maxStamina":      fmt.Sprintf("%v", template.AptStamina),
		"minStrength":     fmt.Sprintf("%v", template.AptStrength),
		"maxStrength":     fmt.Sprintf("%v", template.AptStrength),

		"attAgility":      fmt.Sprintf("%v", template.AttAgility),
		"attEnergy":       fmt.Sprintf("%v", template.AttEnergy),
		"attIntelligence": fmt.Sprintf("%v", template.AttIntelligence),
		"attLuck":         fmt.Sprintf("%v", template.AttLuck),
		"attStamina":      fmt.Sprintf("%v", template.AttStamina),
		"attStrength":     fmt.Sprintf("%v", template.AttStrength),
		"brightCode":      fmt.Sprintf("%v", template.BrightCode),
		"catchable":       fmt.Sprintf("%v", template.Catchable),
		"classId":         fmt.Sprintf("%v", template.ClassID),
		"classIds":        fmt.Sprintf("%v", template.ClassIds),
		"colorCode":       fmt.Sprintf("%v", template.ColorCode),
		"element":         fmt.Sprintf("%d", domainelement.NormalizeClientElementValue(template.Element)),
		"growBase":        fmt.Sprintf("%.2f", template.GrowBase),
		"iconCode":        fmt.Sprintf("%.0f", template.IconCode), // iconCode is usually large int
		"isBind":          fmt.Sprintf("%v", template.IsBind),
		"life":            fmt.Sprintf("%v", template.Life),
		"name":            template.Name,
		"propCombo":       fmt.Sprintf("%v", template.PropCombo),
		"propCounter":     fmt.Sprintf("%v", template.PropCounter),
		"propCritical":    fmt.Sprintf("%v", template.PropCritical),
		"propDefy":        fmt.Sprintf("%v", template.PropDefy),
		"propDodge":       fmt.Sprintf("%v", template.PropDodge),
		"propHit":         fmt.Sprintf("%v", template.PropHit),
		"propReborn":      fmt.Sprintf("%v", template.PropReborn),
		"propSpeed":       fmt.Sprintf("%v", template.PropSpeed),
		"qLevel":          fmt.Sprintf("%v", template.QLevel),
		"resCode":         fmt.Sprintf("%.0f", template.ResCode), // resCode is usually large int
		"resiDefy":        fmt.Sprintf("%v", template.ResiDefy),
		"showAble":        fmt.Sprintf("%v", template.ShowAble),
		"skill":           template.Skill,
		"useLv":           fmt.Sprintf("%v", template.UseLv),
	}

	creatureData["msg"] = template.Msg

	p.CreatureData = creatureData
}
