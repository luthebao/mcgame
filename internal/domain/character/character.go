// Open-sourced by BaoLT

// Character entity represents a player character with stats and position.
// Handles leveling, attribute allocation, and derived combat stats.
// Uses BIGINT IDs for database compatibility with legacy systems.
package character

import (
	"errors"
	"fmt"
	"time"

	"github.com/google/uuid"

	"mcgame-server/internal/domain/stats"
)

// Currency IDs based on GamePredef.as from client
const (
	// Battle & Arena
	CurrencyBattlePoint = 1  // CURRENCY_BATTLE_POINT
	CurrencyArenaPoint  = 1  // Alias for BattlePoint
	CurrencyPetArena    = 19 // CURRENCY_PET_ARENA
	CurrencyPetArenaAct = 65 // CURRENCY_PET_ARENA_ACT

	// Medals
	CurrencyDogMedal      = 2 // CURRENCY_DOG_MEDAL
	CurrencyAchillesMedal = 3 // CURRENCY_ACHILLES_MEDAL
	CurrencyGroupPvpMedal = 7 // CURRENCY_GROUPPVP_MEDAL

	// Event Points (Festivals)
	CurrencyNewYearPoint     = 10 // CURRENCY_NEWYEAR_PONIT
	CurrencyLunaYearPoint    = 11 // CURRENCY_LUNAYEAR_PONIT (Lunar New Year)
	CurrencyLunaPoint        = 11 // Alias
	CurrencyValentinePoint   = 12 // CURRENCY_VALENTINE_POINT
	CurrencyLanternPoint     = 13 // CURRENCY_LANTERN_POINT
	CurrencyLaborPoint       = 14 // CURRENCY_LABOR_POINT
	CurrencyFishingPoint     = 15 // CURRENCY_FISHING_POINT
	CurrencyQixiPoint        = 16 // CURRENCY_QIXI_POINT (Chinese Valentine)
	CurrencySummerPoint      = 17 // CURRENCY_SUMMER_POINT
	CurrencyAnnualThird      = 18 // CURRENCY_ANNUAL_THIRD
	CurrencyXmasPoint        = 22 // CURRENCY_XMAX_POINT
	CurrencyNationalDayPoint = 25 // CURRENCY_NATIONALDAY_POINT
	CurrencyWorldCup         = 29 // CURRENCY_WORLD_CUP
	CurrencyGoldWorldCup     = 30 // CURRENCY_GOLD_WORLD_CUP
	CurrencySummerGame       = 31 // CURRENCY_SUMMER_GAME
	CurrencyAnniversary      = 49 // CURRENCY_ANNIVERSARY
	CurrencyDouble11         = 58 // CURRENCY_DOUBLE_11 (Singles Day)
	CurrencyShowTime         = 60 // CURRENCY_SHOWTIME
	CurrencyAnniConsume      = 62 // CURRENCY_ANNI_CONSUME
	CurrencyShowTime2        = 69 // CURRENCY_SHOWTIME2

	// Guild & Contribution
	CurrencyNormalContrib = 20 // CURRENCY_NORMAL_CONTRIB
	CurrencyDonateContrib = 21 // CURRENCY_DONATE_CONTRIB

	// Special Items/Points
	CurrencyPetChip  = 26 // CURRENCY_PET_CHIP
	CurrencyShopGold = 61 // CURRENCY_SHOP_GOLD
	CurrencyMCBeans  = 64 // CURRENCY_MC_BEANS

	CurrencyMagicCrystalRec   = 73
	CurrencyMagicCrystalPre   = 74
	CurrencyMagicCrystalLimit = 75

	CurrencyPetGuardOut = 200
	CurrencyPetGuardIn  = 201

	CurrencyWisdomCrystal = 213
	CurrencyCouragePoint  = 214
	CurrencyMysteryCrystal = 215
	CurrencyDecoSilver    = 216
	CurrencyRuneExp       = 217
	CurrencyRebatePoint   = 218
	CurrencyHeroScore2507 = 219
	CurrencyYijieElement  = 220
	CurrencyXmCandy24     = 221
	CurrencyXcds2403p     = 222
	CurrencyExPoint       = 223
	CurrencyGenericPoint  = 224
	CurrencyThreePvpPoint = 225

	CurrencyRealSoulStone   = 226
	CurrencyRealSoulCrystal = 227
	CurrencyRealSoulWater   = 228
	CurrencyWarSprite       = 229
	CurrencyBattleSprite    = 230
	CurrencyMonsterHeart    = 231
	CurrencyMhJingshi       = 232
	CurrencyHeiyaoshiPoint  = 233
	CurrencyHeiyaoshiPoint2 = 234
	CurrencyEnergyStone     = 235
	CurrencyNpPoint         = 236
	CurrencyElementPoint    = 237
	CurrencyPvePoint        = 238
	CurrencyStoneSealPoint  = 239
	CurrencyStarPnt         = 240
	CurrencySpirituality    = 241
)

const (
	SlotsPerBag  = 30
	SlotsPerBank = 30
	MaxBagTabs   = 7
	MaxBankTabs  = 5
)

const BaseCriticalDamagePercent = 150

type Character struct {
	ID        int64
	AccountID uuid.UUID
	Name      string
	ClassID   int
	Gender    int

	Level      int
	Experience int64
	RebirthLvl int
	RebirthExp int64
	ClassRank  int
	QuestN     int

	Strength              int
	Agility               int
	Stamina               int
	Intelligence          int
	Spirit                int
	AttrPoints            int
	MaxAttrPoints         int
	DistributedAttrPoints int

	CurrentHP int
	CurrentMP int
	CurrentSP int
	MaxHP     int
	MaxMP     int
	MaxSP     int

	Attack       int
	Defense      int
	MagicAttack  int
	MagicDefense int
	Hit          int
	Dodge        int
	Critical     int
	CriticalDmg  int
	Speed        int

	MapID     int
	PosX      int
	PosY      int
	Direction int

	GuildID *int64 // Nullable - guild membership

	Money         int64
	MoneyBind     int64
	Gold          int64
	GoldBind      int64
	VIPType       int
	PMExp         int64
	PMFindback    bool
	VIPExpiresAt  *time.Time
	PMProcessData map[string]interface{}

	// Currencies - Battle & Arena
	ArenaPoints      int // ID 1 - Battle/Arena Points
	PetArenaPoint    int // ID 19 - Pet Arena Points
	PetArenaActPoint int // ID 65 - Pet Arena Activity Points

	// Currencies - Medals
	DogMedal      int // ID 2
	AchillesMedal int // ID 3
	GroupPvpMedal int // ID 7

	// Currencies - Event Points
	NewYearPoint     int // ID 10
	LunaPoint        int // ID 11 - Lunar New Year
	ValentinePoint   int // ID 12
	LanternPoint     int // ID 13
	LaborPoint       int // ID 14
	FishingPoint     int // ID 15
	QixiPoint        int // ID 16
	SummerPoint      int // ID 17
	AnnualThird      int // ID 18
	XmasPoint        int // ID 22
	NationalDayPoint int // ID 25
	WorldCupPoint    int // ID 29
	GoldWorldCup     int // ID 30
	SummerGamePoint  int // ID 31
	AnniversaryPoint int // ID 49
	Double11Point    int // ID 58
	ShowTimePoint    int // ID 60
	AnniConsumePoint int // ID 62
	ShowTime2Point   int // ID 69

	// Currencies - Guild & Special
	GuildContrib        int // ID 20 (Normal Contrib)
	DonateContrib       int // ID 21
	GuildRestoreContrib int
	GuildRestoreDonate  int
	Honor               int
	Chivalry            int64
	Reputation          int64
	Vigor               int
	MaxVigor            int
	Pop                 int64
	PetChip             int // ID 26
	PetGuardOut         int
	PetGuardIn          int
	ShopGold            int // ID 61
	MCBeans             int // ID 64

	MagicCrystalRec   int
	MagicCrystalPre   int
	MagicCrystalLimit int

	WisdomCrystal  int
	CouragePoint   int
	MysteryCrystal int
	DecoSilver     int
	RuneExp        int
	RebatePoint    int
	HeroScore2507  int
	YijieElement   int
	XmCandy24      int
	Xcds2403p      int
	ExPoint        int
	GenericPoint   int
	ThreePvpPoint  int

	RealSoulStone   int
	RealSoulCrystal int
	RealSoulWater   int
	WarSprite       int
	BattleSprite    int
	MonsterHeart    int
	MhJingshi       int
	HeiyaoshiPoint  int
	HeiyaoshiPoint2 int
	EnergyStone     int
	NpPoint         int
	ElementPoint    int
	PvePoint        int
	StoneSealPoint  int
	StarPnt         int

	DressInfo         string
	BagSlots          int
	BankSlots         int
	PetSlots          int
	BagSlotNum        int
	BankSlotNum       int
	PetMaxNum         int
	TempBagSlots      int
	MxTempBagSlots    int
	GMLevel           int
	SelectedMoneyType int
	SelectedGoldType  int
	PetGuardData      map[string]interface{}
	BossDaily         map[string]interface{}
	AwakenLevel       int
	AwakenPoints      int
	AwakenPointsUsed  int
	SoulLevel         int
	SoulExp           int64
	SoulPoints        int64
	// QuestLog          string // |-separated list of completed quest IDs

	CreatedAt   time.Time
	LastActive  time.Time
	TotalOnline int64

	// New Attributes
	AptAgility               int
	AptAgilityEvolution      int
	AptEnergy                int
	AptEnergyEvolution       int
	AptIntelligence          int
	AptIntelligenceEvolution int
	AptStamina               int
	AptStaminaEvolution      int
	AptStrength              int
	AptStrengthEvolution     int

	ClassAptStrength     int
	ClassAptAgility      int
	ClassAptStamina      int
	ClassAptIntelligence int
	ClassAptEnergy       int

	CookDex     int
	FishDex     int
	PlantDex    int
	MedicineDex int
	HerbDex     int

	Ee string // "5"
	Ef bool   // true
	En int    // 12

	FinalAgility        int
	FinalAttack         float64
	FinalBreakReborn    float64
	FinalCombo          int
	FinalConfusion      float64
	FinalCounter        int
	FinalCritical       float64
	FinalCriticalDamage float64
	FinalDebuffSuccRate float64
	FinalDefence        float64
	FinalDefy           float64
	FinalDizzy          float64
	FinalDodge          float64
	FinalEnergy         int
	FinalEnhMagicHurt   float64
	FinalEnhPhyHurt     float64
	FinalHit            float64
	FinalHp             float64
	FinalIntelligence   int
	FinalLight          float64
	FinalLuck           int
	FinalMAttack        float64
	FinalMDefence       float64
	FinalMp             int
	FinalPoison         float64
	FinalPraDef         float64
	FinalPraMagDef      float64
	FinalRage           float64
	FinalRebornRate     int
	FinalReduceHurt1    int
	FinalReduceHurt2    int
	FinalResiConfusion  float64
	FinalResiCritical   float64
	FinalResiDefy       float64
	FinalResiDizzy      float64
	FinalResiLight      float64
	FinalResiPoison     float64
	FinalResiRage       float64
	FinalResiSleep      float64
	FinalSleep          float64
	FinalSp             int
	FinalSpeed          float64
	FinalStamina        int
	FinalStrength       int

	GrowRate     int
	GrowRateAdd  int // "undefined" in log, assuming int or handling nil
	LastPoint    string
	MakerActive  bool
	QualityType  int
	Spirituality string
	StarType     int

	// Guide system
	GuideOpen bool
	GuideLog  map[int]bool
}

type Stats struct {
	Strength     int
	Agility      int
	Stamina      int
	Intelligence int
	Spirit       int
}

type Position struct {
	MapID     int
	X         int
	Y         int
	Direction int
}

func NewCharacter(accountID uuid.UUID, name string, classID, gender int) *Character {
	now := time.Now()
	char := &Character{
		ID:           0,
		AccountID:    accountID,
		Name:         name,
		ClassID:      classID,
		Gender:       gender,
		Level:        1,
		Experience:   0,
		Strength:     10,
		Agility:      10,
		Stamina:      10,
		Intelligence: 10,
		Spirit:       10,
		AttrPoints:   0,
		CurrentHP:    100,
		CurrentMP:    50,
		CurrentSP:    100,
		MaxHP:        100,
		MaxMP:        50,
		MaxSP:        100,
		MapID:        1,
		PosX:         170,
		PosY:         1230,
		Money:        0,
		Gold:         0,
		// Initialize all currency fields to 0
		ArenaPoints:      0,
		PetArenaPoint:    0,
		PetArenaActPoint: 0,
		DogMedal:         0,
		AchillesMedal:    0,
		GroupPvpMedal:    0,
		NewYearPoint:     0,
		LunaPoint:        0,
		ValentinePoint:   0,
		LanternPoint:     0,
		LaborPoint:       0,
		FishingPoint:     0,
		QixiPoint:        0,
		SummerPoint:      0,
		AnnualThird:      0,
		XmasPoint:        0,
		NationalDayPoint: 0,
		WorldCupPoint:    0,
		GoldWorldCup:     0,
		SummerGamePoint:  0,
		AnniversaryPoint: 0,
		Double11Point:    0,
		ShowTimePoint:    0,
		AnniConsumePoint: 0,
		ShowTime2Point:   0,
		GuildContrib:     0,
		DonateContrib:    0,
		Honor:            0,
		PetChip:          0,
		PetGuardOut:      0,
		PetGuardIn:       0,
		ShopGold:         0,
		MCBeans:          0,

		MagicCrystalRec:   0,
		MagicCrystalPre:   0,
		MagicCrystalLimit: 0,

		WisdomCrystal:  0,
		CouragePoint:   0,
		MysteryCrystal: 0,
		DecoSilver:     0,
		RuneExp:        0,
		RebatePoint:    0,
		HeroScore2507:  0,
		YijieElement:   0,
		XmCandy24:      0,
		Xcds2403p:      0,
		ExPoint:        0,
		GenericPoint:   0,
		ThreePvpPoint:  0,

		RealSoulStone:   0,
		RealSoulCrystal: 0,
		RealSoulWater:   0,
		WarSprite:       0,
		BattleSprite:    0,
		MonsterHeart:    0,
		MhJingshi:       0,
		HeiyaoshiPoint:  0,
		HeiyaoshiPoint2: 0,
		EnergyStone:     0,
		NpPoint:         0,
		ElementPoint:    0,
		PvePoint:        0,
		StoneSealPoint:  0,
		StarPnt:         0,

		BagSlots:          SlotsPerBag,
		BankSlots:         SlotsPerBank,
		PetSlots:          6,
		BagSlotNum:        1,
		BankSlotNum:       1,
		PetMaxNum:         6,
		TempBagSlots:      0,
		MxTempBagSlots:    0,
		GMLevel:           0,
		SelectedMoneyType: 1,
		SelectedGoldType:  3,
		PetGuardData:      defaultPetGuardData(),
		PMProcessData:     map[string]interface{}{},
		BossDaily:         map[string]interface{}{},
		// QuestLog:          "|",
		CreatedAt:   now,
		LastActive:  now,
		TotalOnline: 0,

		AptAgility:               0,
		AptAgilityEvolution:      0,
		AptEnergy:                0,
		AptEnergyEvolution:       0,
		AptIntelligence:          0,
		AptIntelligenceEvolution: 0,
		AptStamina:               0,
		AptStaminaEvolution:      0,
		AptStrength:              0,
		AptStrengthEvolution:     0,

		CookDex:     0,
		FishDex:     0,
		PlantDex:    0,
		MedicineDex: 0,
		HerbDex:     0,

		Ee: "0",
		Ef: false,
		En: 0,

		GrowRate:     0,
		GrowRateAdd:  0,
		LastPoint:    "0",
		MakerActive:  false,
		QualityType:  0,
		Spirituality: "0",
		StarType:     0,

		GuideOpen: true,
		GuideLog:  make(map[int]bool),
	}
	char.NormalizeSlotFields()
	char.RecalculateStats()
	char.CurrentHP = char.MaxHP
	char.CurrentMP = char.MaxMP
	char.CurrentSP = char.MaxSP
	return char
}

func (c *Character) IsAlive() bool {
	return c.CurrentHP > 0
}

func (c *Character) CanEquipItem(requiredLevel, requiredClass int) bool {
	if c.Level < requiredLevel {
		return false
	}
	if requiredClass > 0 && c.ClassID != requiredClass {
		return false
	}
	return true
}

func (c *Character) GainExperience(amount int64) (leveledUp bool) {
	c.Experience += amount

	for c.Level < AutoLevelCap {
		expForNextLevel := c.ExperienceForLevel(c.Level + 1)
		if expForNextLevel <= 0 || c.Experience < expForNextLevel {
			break
		}

		c.Experience -= expForNextLevel
		c.Level++
		c.AttrPoints += AttributePointsPerLevel
		c.MaxAttrPoints += AttributePointsPerLevel
		c.Strength++
		c.Agility++
		c.Stamina++
		c.Intelligence++
		c.Spirit++
		c.RecalculateStats()
		leveledUp = true
	}

	return leveledUp
}

func (c *Character) ManualLevelUp() (leveledUp bool) {
	if c.Level >= MaxLevel {
		return false
	}
	expNeeded := c.ExperienceForLevel(c.Level + 1)
	if expNeeded <= 0 || c.Experience < expNeeded {
		return false
	}
	c.Experience -= expNeeded
	c.Level++
	c.AttrPoints += AttributePointsPerLevel
	c.MaxAttrPoints += AttributePointsPerLevel
	c.Strength++
	c.Agility++
	c.Stamina++
	c.Intelligence++
	c.Spirit++
	c.RecalculateStats()
	return true
}

func (c *Character) RaiseLevelTo(target int) bool {
	if target <= c.Level || target > MaxLevel {
		return false
	}

	delta := target - c.Level
	c.Level = target
	c.Experience = 0
	c.AttrPoints += delta * AttributePointsPerLevel
	c.MaxAttrPoints += delta * AttributePointsPerLevel
	c.Strength += delta
	c.Agility += delta
	c.Stamina += delta
	c.Intelligence += delta
	c.Spirit += delta
	c.RecalculateStats()
	return true
}

func (c *Character) CumulativeExp() int64 {
	return playerLevelCumulativeExp(c.Level) + c.Experience
}

func (c *Character) CumulativeExpCapped() int64 {
	cumExp := c.CumulativeExp()
	if c.Level < MaxLevel {
		nextLevelCumExp := playerLevelCumulativeExp(c.Level + 1)
		if cumExp >= nextLevelCumExp {
			return nextLevelCumExp - 1
		}
	}
	return cumExp
}

func (c *Character) ExperienceForLevel(level int) int64 {
	return playerLevelRequiredExp(level)
}

func (c *Character) buildStatsProfile() stats.Profile {
	return stats.Profile{
		SeedHP:          20,
		SeedMP:          5,
		SeedHit:         100,
		SeedSpeed:       100,
		GrowthScale:     stats.DefaultGrowthScale,
		Strength:        float64(c.Strength + c.AptStrength),
		Agility:         float64(c.Agility + c.AptAgility),
		Stamina:         float64(c.Stamina + c.AptStamina),
		Intelligence:    float64(c.Intelligence + c.AptIntelligence),
		Energy:          float64(c.Spirit + c.AptEnergy),
		AptStrength:     float64(c.ClassAptStrength),
		AptAgility:      float64(c.ClassAptAgility),
		AptStamina:      float64(c.ClassAptStamina),
		AptIntelligence: float64(c.ClassAptIntelligence),
		AptEnergy:       float64(c.ClassAptEnergy),
	}
}

func (c *Character) RecalculateStats() {
	result := stats.BuildBaseStats(c.buildStatsProfile())
	c.MaxHP = result.MaxHP
	c.MaxMP = result.MaxMP
	c.MaxSP = result.MaxSP
	c.Attack = result.Attack
	c.Defense = result.Defense
	c.MagicAttack = result.MagicAttack
	c.MagicDefense = result.MagicDefense
	c.Hit = result.Hit
	c.Dodge = result.Dodge
	c.Speed = result.Speed
	c.Critical = result.Critical
	c.CriticalDmg = BaseCriticalDamagePercent
	c.syncFinalFields()
}

func (c *Character) SetClassAptitudes(strength, agility, stamina, intelligence, energy int) {
	if c == nil {
		return
	}
	c.ClassAptStrength = strength
	c.ClassAptAgility = agility
	c.ClassAptStamina = stamina
	c.ClassAptIntelligence = intelligence
	c.ClassAptEnergy = energy
}

func (c *Character) RefreshRuntimeStats() {
	if c == nil {
		return
	}

	c.RecalculateStats()
	if c.CurrentHP > c.MaxHP {
		c.CurrentHP = c.MaxHP
	}
	if c.CurrentMP > c.MaxMP {
		c.CurrentMP = c.MaxMP
	}
	if c.CurrentSP > c.MaxSP {
		c.CurrentSP = c.MaxSP
	}
}

func (c *Character) NormalizeAttributePoints() {
	if c == nil || c.Level <= 1 {
		return
	}
	expectedMax := (c.Level - 1) * AttributePointsPerLevel
	if c.MaxAttrPoints >= expectedMax {
		return
	}
	deficit := expectedMax - c.MaxAttrPoints
	c.MaxAttrPoints = expectedMax
	c.AttrPoints += deficit
}

func CriticalDamageBonus(totalOrBonus int) int {
	if totalOrBonus >= BaseCriticalDamagePercent {
		return totalOrBonus - BaseCriticalDamagePercent
	}
	return totalOrBonus
}

func (c *Character) MoveTo(pos Position) {
	c.MapID = pos.MapID
	c.PosX = pos.X
	c.PosY = pos.Y
	c.Direction = pos.Direction
}

func (c *Character) Heal(amount int) {
	c.CurrentHP += amount
	if c.CurrentHP > c.MaxHP {
		c.CurrentHP = c.MaxHP
	}
}

func (c *Character) RestoreMP(amount int) {
	c.CurrentMP += amount
	if c.CurrentMP > c.MaxMP {
		c.CurrentMP = c.MaxMP
	}
}

func (c *Character) SyncToEffectiveMax(effectiveMaxHP, effectiveMaxMP int) bool {
	changed := false
	if effectiveMaxHP > 0 && c.CurrentHP > effectiveMaxHP {
		c.CurrentHP = effectiveMaxHP
		changed = true
	}
	if effectiveMaxMP > 0 && c.CurrentMP > effectiveMaxMP {
		c.CurrentMP = effectiveMaxMP
		changed = true
	}
	return changed
}

func (c *Character) TakeDamage(damage int) {
	c.CurrentHP -= damage
	if c.CurrentHP < 0 {
		c.CurrentHP = 0
	}
}

func (c *Character) UseMP(amount int) bool {
	if c.CurrentMP < amount {
		return false
	}
	c.CurrentMP -= amount
	return true
}

func (c *Character) AllocateAttribute(attr string) bool {
	if c.AttrPoints <= 0 {
		return false
	}

	switch attr {
	case "strength":
		c.AptStrength++
	case "agility":
		c.AptAgility++
	case "stamina":
		c.AptStamina++
	case "intelligence":
		c.AptIntelligence++
	case "spirit":
		c.AptEnergy++
	default:
		return false
	}

	c.AttrPoints--
	c.DistributedAttrPoints++
	c.RecalculateStats()
	return true
}

func guideLogToDTOMap(guideLog map[int]bool) map[string]bool {
	if len(guideLog) == 0 {
		return map[string]bool{}
	}

	result := make(map[string]bool, len(guideLog))
	for id, done := range guideLog {
		result[fmt.Sprintf("%d", id)] = done
	}

	return result
}

func (c *Character) ToDTO() map[string]interface{} {
	c.NormalizeSlotFields()
	return map[string]interface{}{
		"id":              c.ID,
		"name":            c.Name,
		"classId":         c.ClassID,
		"gender":          c.Gender,
		"level":           c.Level,
		"exp":             c.CumulativeExpCapped(),
		"cl":              c.ClassRank,
		"qn":              c.QuestN,
		"expRe":           c.RebirthExp,
		"attStrength":     c.Strength,
		"attAgility":      c.Agility,
		"attStamina":      c.Stamina,
		"attIntelligence": c.Intelligence,
		"attEnergy":       c.Spirit,
		"attLastPoint":    c.AttrPoints,
		"currentHp":       c.CurrentHP,
		"currentMp":       c.CurrentMP,
		"currentSp":       c.CurrentSP,
		"hpMax":           c.MaxHP,
		"mpMax":           c.MaxMP,
		"spMax":           c.MaxSP,
		"posMapId":        c.MapID,
		"posX":            c.PosX,
		"posY":            c.PosY,
		"dir":             c.Direction,
		"money":           c.Money,
		"moneyBind":       c.MoneyBind,
		"gold":            c.Gold,
		"goldBind":        c.GoldBind,
		"gmLevel":         c.GMLevel,
		"pmLevel":         c.CurrentPMLevel(time.Now()),
		"vipType":         c.VIPType,
		"pmExp":           c.PMExp,
		// Currency Fields
		"arenaPoints":      c.ArenaPoints,
		"petArenaPoint":    c.PetArenaPoint,
		"petArenaActPoint": c.PetArenaActPoint,
		"dogMedal":         c.DogMedal,
		"achillesMedal":    c.AchillesMedal,
		"groupPvpMedal":    c.GroupPvpMedal,
		"newYearPoint":     c.NewYearPoint,
		"lunaPoint":        c.LunaPoint,
		"valentinePoint":   c.ValentinePoint,
		"lanternPoint":     c.LanternPoint,
		"laborPoint":       c.LaborPoint,
		"fishingPoint":     c.FishingPoint,
		"qixiPoint":        c.QixiPoint,
		"summerPoint":      c.SummerPoint,
		"annualThird":      c.AnnualThird,
		"xmasPoint":        c.XmasPoint,
		"nationalDayPoint": c.NationalDayPoint,
		"worldCupPoint":    c.WorldCupPoint,
		"goldWorldCup":     c.GoldWorldCup,
		"summerGamePoint":  c.SummerGamePoint,
		"anniversaryPoint": c.AnniversaryPoint,
		"double11Point":    c.Double11Point,
		"shishangdian":     c.ShopGold,
		"showTimePoint":    c.ShowTimePoint,
		"anniConsumePoint": c.AnniConsumePoint,
		"showTime2Point":   c.ShowTime2Point,
		"guildContrib":     c.GuildContrib,
		"donateContrib":    c.DonateContrib,
		"honor":            c.Honor,
		"pop":              c.Pop,
		"petChip":          c.PetChip,
		"petguardout":      c.PetGuardOut,
		"petguardin":       c.PetGuardIn,
		"shopGold":         c.ShopGold,
		"mcbeans":          c.MCBeans,
		"magiccystalrec":   c.MagicCrystalRec,
		"magiccystalpre":   c.MagicCrystalPre,
		"magiccystallimit": c.MagicCrystalLimit,
		"wisdonCrystal":    c.WisdomCrystal,
		"couragePoint":     c.CouragePoint,
		"mysteryCrystal":   c.MysteryCrystal,
		"decoSilver":       c.DecoSilver,
		"runeExp":          c.RuneExp,
		"rebatepoint":      c.RebatePoint,
		"heroScore2507":    c.HeroScore2507,
		"yijieElement":     c.YijieElement,
		"xmCandy24":        c.XmCandy24,
		"xcds2403p":        c.Xcds2403p,
		"exPoint":          c.ExPoint,
		"point":            c.GenericPoint,
		"threePvpPnt":      c.ThreePvpPoint,
		"soulPnt":          c.SoulPoints,
		"realSoulStone":    c.RealSoulStone,
		"realSoulCrystal":  c.RealSoulCrystal,
		"realSoulWater":    c.RealSoulWater,
		"warSprite":        c.WarSprite,
		"battleSprite":     c.BattleSprite,
		"monsterHeart":     c.MonsterHeart,
		"mhjingshi":        c.MhJingshi,
		"heiyaoshiPoint":   c.HeiyaoshiPoint,
		"heiyaoshiPoint2":  c.HeiyaoshiPoint2,
		"energyStone":      c.EnergyStone,
		"npPnt":            c.NpPoint,
		"elementPnt":       c.ElementPoint,
		"pvePoint":         c.PvePoint,
		"stoneSealPoint":   c.StoneSealPoint,
		"starPnt":          c.StarPnt,
		"propHit":          c.Hit,
		"propDodge":        c.Dodge,
		"propCritical":     c.Critical,
		"propSpeed":        c.Speed,
		"bagSlots":         c.MaxBagSlots(),
		"bankSlots":        c.MaxBankSlots(),
		"tempBagSlots":     c.TempBagSlots,
		"mxTempBagSlots":   c.MxTempBagSlots,
		"bagSlotNum":       c.BagSlotNum,
		"bankSlotNum":      c.BankSlotNum,
		"petMaxNum":        c.PetMaxNum,
		// "questLog":          c.QuestLog,
		// "selectedMoneyType": c.SelectedMoneyType,

		// New Fields Mapping
		"aptAgility":               fmt.Sprintf("%d", c.AptAgility),
		"aptAgilityEvolution":      c.AptAgilityEvolution,
		"aptEnergy":                fmt.Sprintf("%d", c.AptEnergy),
		"aptEnergyEvolution":       c.AptEnergyEvolution,
		"aptIntelligence":          fmt.Sprintf("%d", c.AptIntelligence),
		"aptIntelligenceEvolution": c.AptIntelligenceEvolution,
		"aptStamina":               fmt.Sprintf("%d", c.AptStamina),
		"aptStaminaEvolution":      c.AptStaminaEvolution,
		"aptStrength":              fmt.Sprintf("%d", c.AptStrength),
		"aptStrengthEvolution":     c.AptStrengthEvolution,

		"cookDex":     c.CookDex,
		"fishDex":     c.FishDex,
		"plantDex":    c.PlantDex,
		"medicineDex": c.MedicineDex,
		"herbDex":     c.HerbDex,

		"ee": c.Ee,
		"ef": c.Ef,
		"en": c.En,

		"finalAgility":        c.FinalAgility,
		"finalAttack":         c.FinalAttack,
		"finalBreakReborn":    c.FinalBreakReborn,
		"finalCombo":          c.FinalCombo,
		"finalConfusion":      c.FinalConfusion,
		"finalCounter":        c.FinalCounter,
		"finalCritical":       c.FinalCritical,
		"finalCriticalDamage": c.FinalCriticalDamage,
		"finalDebuffSuccRate": c.FinalDebuffSuccRate,
		"finalDefence":        c.FinalDefence,
		"finalDefy":           c.FinalDefy,
		"finalDizzy":          c.FinalDizzy,
		"finalDodge":          c.FinalDodge,
		"finalEnergy":         c.FinalEnergy,
		"finalEnhMagicHurt":   c.FinalEnhMagicHurt,
		"finalEnhPhyHurt":     c.FinalEnhPhyHurt,
		"finalHit":            c.FinalHit,
		"finalHp":             c.FinalHp,
		"finalIntelligence":   c.FinalIntelligence,
		"finalLight":          c.FinalLight,
		"finalLuck":           c.FinalLuck,
		"finalMAttack":        c.FinalMAttack,
		"finalMDefence":       c.FinalMDefence,
		"finalMp":             c.FinalMp,
		"finalPoison":         c.FinalPoison,
		"finalPraDef":         c.FinalPraDef,
		"finalPraMagDef":      c.FinalPraMagDef,
		"finalRage":           c.FinalRage,
		"finalRebornRate":     c.FinalRebornRate,
		"finalReduceHurt1":    c.FinalReduceHurt1,
		"finalReduceHurt2":    c.FinalReduceHurt2,
		"finalResiConfusion":  c.FinalResiConfusion,
		"finalResiCritical":   c.FinalResiCritical,
		"finalResiDefy":       c.FinalResiDefy,
		"finalResiDizzy":      c.FinalResiDizzy,
		"finalResiLight":      c.FinalResiLight,
		"finalResiPoison":     c.FinalResiPoison,
		"finalResiRage":       c.FinalResiRage,
		"finalResiSleep":      c.FinalResiSleep,
		"finalSleep":          c.FinalSleep,
		"finalSp":             c.FinalSp,
		"finalSpeed":          c.FinalSpeed,
		"finalStamina":        c.FinalStamina,
		"finalStrength":       c.FinalStrength,

		"growRate":  c.GrowRate,
		"guideOpen": c.GuideOpen,
		"guideFlag": guideLogToDTOMap(c.GuideLog),
		//"growRateAdd":  c.GrowRateAdd, // Undefined in log, maybe skip or nil
		"lastPoint":    c.LastPoint,
		"makerActive":  c.MakerActive,
		"qualityType":  c.QualityType,
		"spirituality": c.Spirituality,
		"starType":     c.StarType,
	}
}

// DeductCurrency attempts to deduct the specified amount of currency from the character.
// Returns an error if the currency type is unsupported or if the balance is insufficient.
func (c *Character) DeductCurrency(currencyType int, amount int) error {
	if amount < 0 {
		return errors.New("cannot deduct negative amount")
	}

	switch currencyType {
	// Battle & Arena Points (ID 1 handles both BattlePoint and ArenaPoint)
	case CurrencyArenaPoint:
		if c.ArenaPoints < amount {
			return errors.New("not enough arena points")
		}
		c.ArenaPoints -= amount

	case CurrencyPetArena:
		if c.PetArenaPoint < amount {
			return errors.New("not enough pet arena points")
		}
		c.PetArenaPoint -= amount

	case CurrencyPetArenaAct:
		if c.PetArenaActPoint < amount {
			return errors.New("not enough pet arena activity points")
		}
		c.PetArenaActPoint -= amount

	// Medals
	case CurrencyDogMedal:
		if c.DogMedal < amount {
			return errors.New("not enough dog medal")
		}
		c.DogMedal -= amount

	case CurrencyAchillesMedal:
		if c.AchillesMedal < amount {
			return errors.New("not enough achilles medal")
		}
		c.AchillesMedal -= amount

	case CurrencyGroupPvpMedal:
		if c.GroupPvpMedal < amount {
			return errors.New("not enough group pvp medal")
		}
		c.GroupPvpMedal -= amount

	// Event Points - Festivals
	case CurrencyNewYearPoint:
		if c.NewYearPoint < amount {
			return errors.New("not enough new year points")
		}
		c.NewYearPoint -= amount

	case CurrencyLunaPoint:
		if c.LunaPoint < amount {
			return errors.New("not enough lunar new year points")
		}
		c.LunaPoint -= amount

	case CurrencyValentinePoint:
		if c.ValentinePoint < amount {
			return errors.New("not enough valentine points")
		}
		c.ValentinePoint -= amount

	case CurrencyLanternPoint:
		if c.LanternPoint < amount {
			return errors.New("not enough lantern festival points")
		}
		c.LanternPoint -= amount

	case CurrencyLaborPoint:
		if c.LaborPoint < amount {
			return errors.New("not enough labor day points")
		}
		c.LaborPoint -= amount

	case CurrencyFishingPoint:
		if c.FishingPoint < amount {
			return errors.New("not enough fishing points")
		}
		c.FishingPoint -= amount

	case CurrencyQixiPoint:
		if c.QixiPoint < amount {
			return errors.New("not enough qixi festival points")
		}
		c.QixiPoint -= amount

	case CurrencySummerPoint:
		if c.SummerPoint < amount {
			return errors.New("not enough summer event points")
		}
		c.SummerPoint -= amount

	case CurrencyAnnualThird:
		if c.AnnualThird < amount {
			return errors.New("not enough anniversary points")
		}
		c.AnnualThird -= amount

	case CurrencyXmasPoint:
		if c.XmasPoint < amount {
			return errors.New("not enough christmas points")
		}
		c.XmasPoint -= amount

	case CurrencyNationalDayPoint:
		if c.NationalDayPoint < amount {
			return errors.New("not enough national day points")
		}
		c.NationalDayPoint -= amount

	case CurrencyWorldCup:
		if c.WorldCupPoint < amount {
			return errors.New("not enough world cup points")
		}
		c.WorldCupPoint -= amount

	case CurrencyGoldWorldCup:
		if c.GoldWorldCup < amount {
			return errors.New("not enough gold world cup")
		}
		c.GoldWorldCup -= amount

	case CurrencySummerGame:
		if c.SummerGamePoint < amount {
			return errors.New("not enough summer game points")
		}
		c.SummerGamePoint -= amount

	case CurrencyAnniversary:
		if c.AnniversaryPoint < amount {
			return errors.New("not enough anniversary points")
		}
		c.AnniversaryPoint -= amount

	case CurrencyDouble11:
		if c.Double11Point < amount {
			return errors.New("not enough double 11 points")
		}
		c.Double11Point -= amount

	case CurrencyShowTime:
		if c.ShowTimePoint < amount {
			return errors.New("not enough showtime points")
		}
		c.ShowTimePoint -= amount

	case CurrencyAnniConsume:
		if c.AnniConsumePoint < amount {
			return errors.New("not enough anniversary consume points")
		}
		c.AnniConsumePoint -= amount

	case CurrencyShowTime2:
		if c.ShowTime2Point < amount {
			return errors.New("not enough showtime 2 points")
		}
		c.ShowTime2Point -= amount

	// Guild & Contribution
	case CurrencyNormalContrib:
		if c.GuildContrib < amount {
			return errors.New("not enough guild contribution")
		}
		c.GuildContrib -= amount

	case CurrencyDonateContrib:
		if c.DonateContrib < amount {
			return errors.New("not enough donate contribution")
		}
		c.DonateContrib -= amount

	// Special Items/Points
	case CurrencyPetChip:
		if c.PetChip < amount {
			return errors.New("not enough pet chips")
		}
		c.PetChip -= amount

	case CurrencyShopGold:
		if c.ShopGold < amount {
			return errors.New("not enough shop gold")
		}
		c.ShopGold -= amount

	case CurrencyMCBeans:
		if c.MCBeans < amount {
			return errors.New("not enough MC beans")
		}
		c.MCBeans -= amount

	case CurrencyMagicCrystalRec:
		if c.MagicCrystalRec < amount {
			return errors.New("not enough magic crystal recovery dust")
		}
		c.MagicCrystalRec -= amount

	case CurrencyMagicCrystalPre:
		if c.MagicCrystalPre < amount {
			return errors.New("not enough permanent magic crystal points")
		}
		c.MagicCrystalPre -= amount

	case CurrencyMagicCrystalLimit:
		if c.MagicCrystalLimit < amount {
			return errors.New("not enough limit magic crystal points")
		}
		c.MagicCrystalLimit -= amount

	case CurrencyPetGuardOut:
		if c.PetGuardOut < amount {
			return errors.New("not enough pet guard out tokens")
		}
		c.PetGuardOut -= amount

	case CurrencyPetGuardIn:
		if c.PetGuardIn < amount {
			return errors.New("not enough pet guard in tokens")
		}
		c.PetGuardIn -= amount

	case CurrencyWisdomCrystal:
		if c.WisdomCrystal < amount {
			return errors.New("not enough wisdom crystal")
		}
		c.WisdomCrystal -= amount
	case CurrencyCouragePoint:
		if c.CouragePoint < amount {
			return errors.New("not enough courage point")
		}
		c.CouragePoint -= amount
	case CurrencyMysteryCrystal:
		if c.MysteryCrystal < amount {
			return errors.New("not enough mystery crystal")
		}
		c.MysteryCrystal -= amount
	case CurrencyDecoSilver:
		if c.DecoSilver < amount {
			return errors.New("not enough decoration silver")
		}
		c.DecoSilver -= amount
	case CurrencyRuneExp:
		if c.RuneExp < amount {
			return errors.New("not enough rune exp")
		}
		c.RuneExp -= amount
	case CurrencyRebatePoint:
		if c.RebatePoint < amount {
			return errors.New("not enough rebate point")
		}
		c.RebatePoint -= amount
	case CurrencyHeroScore2507:
		if c.HeroScore2507 < amount {
			return errors.New("not enough hero score")
		}
		c.HeroScore2507 -= amount
	case CurrencyYijieElement:
		if c.YijieElement < amount {
			return errors.New("not enough yijie element")
		}
		c.YijieElement -= amount
	case CurrencyXmCandy24:
		if c.XmCandy24 < amount {
			return errors.New("not enough christmas candy")
		}
		c.XmCandy24 -= amount
	case CurrencyXcds2403p:
		if c.Xcds2403p < amount {
			return errors.New("not enough cross-server activity point")
		}
		c.Xcds2403p -= amount
	case CurrencyExPoint:
		if c.ExPoint < amount {
			return errors.New("not enough ex point")
		}
		c.ExPoint -= amount
	case CurrencyGenericPoint:
		if c.GenericPoint < amount {
			return errors.New("not enough event point")
		}
		c.GenericPoint -= amount
	case CurrencyThreePvpPoint:
		if c.ThreePvpPoint < amount {
			return errors.New("not enough 3v3 pvp point")
		}
		c.ThreePvpPoint -= amount

	case CurrencyRealSoulStone:
		if c.RealSoulStone < amount {
			return errors.New("not enough real soul stone")
		}
		c.RealSoulStone -= amount
	case CurrencyRealSoulCrystal:
		if c.RealSoulCrystal < amount {
			return errors.New("not enough real soul crystal")
		}
		c.RealSoulCrystal -= amount
	case CurrencyRealSoulWater:
		if c.RealSoulWater < amount {
			return errors.New("not enough real soul water")
		}
		c.RealSoulWater -= amount
	case CurrencyWarSprite:
		if c.WarSprite < amount {
			return errors.New("not enough war sprite stone")
		}
		c.WarSprite -= amount
	case CurrencyBattleSprite:
		if c.BattleSprite < amount {
			return errors.New("not enough battle sprite stone")
		}
		c.BattleSprite -= amount
	case CurrencyMonsterHeart:
		if c.MonsterHeart < amount {
			return errors.New("not enough monster heart")
		}
		c.MonsterHeart -= amount
	case CurrencyMhJingshi:
		if c.MhJingshi < amount {
			return errors.New("not enough monster heart spirit stone")
		}
		c.MhJingshi -= amount
	case CurrencyHeiyaoshiPoint:
		if c.HeiyaoshiPoint < amount {
			return errors.New("not enough heiyaoshi point")
		}
		c.HeiyaoshiPoint -= amount
	case CurrencyHeiyaoshiPoint2:
		if c.HeiyaoshiPoint2 < amount {
			return errors.New("not enough heiyaoshi point 2")
		}
		c.HeiyaoshiPoint2 -= amount
	case CurrencyEnergyStone:
		if c.EnergyStone < amount {
			return errors.New("not enough energy stone")
		}
		c.EnergyStone -= amount
	case CurrencyNpPoint:
		if c.NpPoint < amount {
			return errors.New("not enough natural energy point")
		}
		c.NpPoint -= amount
	case CurrencyElementPoint:
		if c.ElementPoint < amount {
			return errors.New("not enough element point")
		}
		c.ElementPoint -= amount
	case CurrencyPvePoint:
		if c.PvePoint < amount {
			return errors.New("not enough pet pve point")
		}
		c.PvePoint -= amount
	case CurrencyStoneSealPoint:
		if c.StoneSealPoint < amount {
			return errors.New("not enough stone seal point")
		}
		c.StoneSealPoint -= amount
	case CurrencyStarPnt:
		if c.StarPnt < amount {
			return errors.New("not enough star points")
		}
		c.StarPnt -= amount

	default:
		return fmt.Errorf("unsupported currency type: %d", currencyType)
	}

	return nil
}

func (c *Character) AddCurrency(currencyType int, amount int) error {
	if amount < 0 {
		return errors.New("cannot add negative amount")
	}

	switch currencyType {
	case CurrencyArenaPoint:
		c.ArenaPoints += amount
	case CurrencyPetArena:
		c.PetArenaPoint += amount
	case CurrencyPetArenaAct:
		c.PetArenaActPoint += amount
	case CurrencyDogMedal:
		c.DogMedal += amount
	case CurrencyAchillesMedal:
		c.AchillesMedal += amount
	case CurrencyGroupPvpMedal:
		c.GroupPvpMedal += amount
	case CurrencyNewYearPoint:
		c.NewYearPoint += amount
	case CurrencyLunaPoint:
		c.LunaPoint += amount
	case CurrencyValentinePoint:
		c.ValentinePoint += amount
	case CurrencyLanternPoint:
		c.LanternPoint += amount
	case CurrencyLaborPoint:
		c.LaborPoint += amount
	case CurrencyFishingPoint:
		c.FishingPoint += amount
	case CurrencyQixiPoint:
		c.QixiPoint += amount
	case CurrencySummerPoint:
		c.SummerPoint += amount
	case CurrencyAnnualThird:
		c.AnnualThird += amount
	case CurrencyXmasPoint:
		c.XmasPoint += amount
	case CurrencyNationalDayPoint:
		c.NationalDayPoint += amount
	case CurrencyWorldCup:
		c.WorldCupPoint += amount
	case CurrencyGoldWorldCup:
		c.GoldWorldCup += amount
	case CurrencySummerGame:
		c.SummerGamePoint += amount
	case CurrencyAnniversary:
		c.AnniversaryPoint += amount
	case CurrencyDouble11:
		c.Double11Point += amount
	case CurrencyShowTime:
		c.ShowTimePoint += amount
	case CurrencyAnniConsume:
		c.AnniConsumePoint += amount
	case CurrencyShowTime2:
		c.ShowTime2Point += amount
	case CurrencyNormalContrib:
		c.GuildContrib += amount
	case CurrencyDonateContrib:
		c.DonateContrib += amount
	case CurrencyPetChip:
		c.PetChip += amount
	case CurrencyShopGold:
		c.ShopGold += amount
	case CurrencyMCBeans:
		c.MCBeans += amount
	case CurrencyMagicCrystalRec:
		c.MagicCrystalRec += amount
	case CurrencyMagicCrystalPre:
		c.MagicCrystalPre += amount
	case CurrencyMagicCrystalLimit:
		c.MagicCrystalLimit += amount
	case CurrencyPetGuardOut:
		c.PetGuardOut += amount
	case CurrencyPetGuardIn:
		c.PetGuardIn += amount
	case CurrencyWisdomCrystal:
		c.WisdomCrystal += amount
	case CurrencyCouragePoint:
		c.CouragePoint += amount
	case CurrencyMysteryCrystal:
		c.MysteryCrystal += amount
	case CurrencyDecoSilver:
		c.DecoSilver += amount
	case CurrencyRuneExp:
		c.RuneExp += amount
	case CurrencyRebatePoint:
		c.RebatePoint += amount
	case CurrencyHeroScore2507:
		c.HeroScore2507 += amount
	case CurrencyYijieElement:
		c.YijieElement += amount
	case CurrencyXmCandy24:
		c.XmCandy24 += amount
	case CurrencyXcds2403p:
		c.Xcds2403p += amount
	case CurrencyExPoint:
		c.ExPoint += amount
	case CurrencyGenericPoint:
		c.GenericPoint += amount
	case CurrencyThreePvpPoint:
		c.ThreePvpPoint += amount
	case CurrencyRealSoulStone:
		c.RealSoulStone += amount
	case CurrencyRealSoulCrystal:
		c.RealSoulCrystal += amount
	case CurrencyRealSoulWater:
		c.RealSoulWater += amount
	case CurrencyWarSprite:
		c.WarSprite += amount
	case CurrencyBattleSprite:
		c.BattleSprite += amount
	case CurrencyMonsterHeart:
		c.MonsterHeart += amount
	case CurrencyMhJingshi:
		c.MhJingshi += amount
	case CurrencyHeiyaoshiPoint:
		c.HeiyaoshiPoint += amount
	case CurrencyHeiyaoshiPoint2:
		c.HeiyaoshiPoint2 += amount
	case CurrencyEnergyStone:
		c.EnergyStone += amount
	case CurrencyNpPoint:
		c.NpPoint += amount
	case CurrencyElementPoint:
		c.ElementPoint += amount
	case CurrencyPvePoint:
		c.PvePoint += amount
	case CurrencyStoneSealPoint:
		c.StoneSealPoint += amount
	case CurrencyStarPnt:
		c.StarPnt += amount
	default:
		return fmt.Errorf("unsupported currency type: %d", currencyType)
	}

	return nil
}

const (
	AutoLevelCap            = 20
	MaxLevel                = 160
	AttributePointsPerLevel = 5
)

func (c *Character) MaxBagSlots() int {
	if c == nil {
		return 0
	}
	if c.BagSlotNum > 0 {
		return c.BagSlotNum * SlotsPerBag
	}
	return c.BagSlots
}

func (c *Character) MaxBankSlots() int {
	if c == nil {
		return 0
	}
	if c.BankSlotNum > 0 {
		return c.BankSlotNum * SlotsPerBank
	}
	return c.BankSlots
}

func (c *Character) SetBagSlotNum(count int) {
	if c == nil {
		return
	}
	if count < 0 {
		count = 0
	}
	c.BagSlotNum = count
	if count == 0 {
		c.BagSlots = 0
		return
	}
	c.BagSlots = count * SlotsPerBag
}

func (c *Character) SetBankSlotNum(count int) {
	if c == nil {
		return
	}
	if count < 0 {
		count = 0
	}
	c.BankSlotNum = count
	if count == 0 {
		c.BankSlots = 0
		return
	}
	c.BankSlots = count * SlotsPerBank
}

func (c *Character) NormalizeSlotFields() {
	if c == nil {
		return
	}
	if c.BagSlotNum <= 0 && c.BagSlots > 0 {
		c.SetBagSlotNum((c.BagSlots + SlotsPerBag - 1) / SlotsPerBag)
	}
	if c.BankSlotNum <= 0 && c.BankSlots > 0 {
		c.SetBankSlotNum((c.BankSlots + SlotsPerBank - 1) / SlotsPerBank)
	}
	if c.PetMaxNum <= 0 && c.PetSlots > 0 {
		c.PetMaxNum = c.PetSlots
	}
	if c.BagSlots <= 0 && c.BagSlotNum > 0 {
		c.BagSlots = c.MaxBagSlots()
	}
	if c.BankSlots <= 0 && c.BankSlotNum > 0 {
		c.BankSlots = c.MaxBankSlots()
	}
	if c.PetSlots <= 0 && c.PetMaxNum > 0 {
		c.PetSlots = c.PetMaxNum
	}
	if c.PetGuardData == nil {
		c.PetGuardData = defaultPetGuardData()
	}
	if c.PMProcessData == nil {
		c.PMProcessData = map[string]interface{}{}
	}
	if c.BossDaily == nil {
		c.BossDaily = map[string]interface{}{}
	}
}

func defaultPetGuardData() map[string]interface{} {
	return map[string]interface{}{
		"lvData":  map[string]interface{}{},
		"petData": map[string]interface{}{},
	}
}

var pmLevelExpThresholds = []int64{0, 15000, 45000, 105000, 205000, 355000, 555000, 805000, 1105000}

func PMExpThresholdForLevel(level int) int64 {
	if level <= 1 {
		return pmLevelExpThresholds[0]
	}
	if level > len(pmLevelExpThresholds) {
		return pmLevelExpThresholds[len(pmLevelExpThresholds)-1]
	}
	return pmLevelExpThresholds[level-1]
}

func (c *Character) HasActiveVIP(now time.Time) bool {
	if c == nil || c.VIPType <= 0 || c.VIPExpiresAt == nil {
		return false
	}
	return now.Before(*c.VIPExpiresAt)
}

func (c *Character) PMLevelFromExp() int {
	level := 0
	for index := len(pmLevelExpThresholds) - 1; index >= 0; index-- {
		if c.PMExp >= pmLevelExpThresholds[index] {
			level = index + 1
			break
		}
	}
	if level < 1 {
		level = 1
	}
	if level > 9 {
		level = 9
	}
	return level
}

func (c *Character) CurrentPMLevel(now time.Time) int {
	if !c.HasActiveVIP(now) {
		return 0
	}

	level := c.PMLevelFromExp()
	if c.VIPType > level {
		level = c.VIPType
	}
	if level > 9 {
		level = 9
	}
	return level
}

func (c *Character) RemainingVIPDuration(now time.Time) time.Duration {
	if !c.HasActiveVIP(now) {
		return 0
	}
	return c.VIPExpiresAt.Sub(now)
}

func (c *Character) NormalizeVIP(now time.Time) bool {
	if c == nil {
		return false
	}
	if c.VIPExpiresAt == nil {
		return false
	}
	if now.Before(*c.VIPExpiresAt) {
		return false
	}

	c.VIPType = 0
	c.VIPExpiresAt = nil
	return true
}

func (c *Character) SetPMTransform(resCode int64, expiresAt time.Time) {
	if c == nil {
		return
	}
	if c.PMProcessData == nil {
		c.PMProcessData = map[string]interface{}{}
	}
	c.PMProcessData["pm13Transform"] = map[string]interface{}{
		"resCode":   resCode,
		"expiresAt": expiresAt.Unix(),
	}
}

func (c *Character) ActivePMTransformResCode(now time.Time) (int64, bool) {
	if c == nil || c.PMProcessData == nil {
		return 0, false
	}
	raw, ok := c.PMProcessData["pm13Transform"]
	if !ok {
		return 0, false
	}
	entry, ok := raw.(map[string]interface{})
	if !ok || entry == nil {
		return 0, false
	}
	resCode := toInt64(entry["resCode"])
	if resCode <= 0 {
		return 0, false
	}
	expiresAt := toInt64(entry["expiresAt"])
	if expiresAt > 0 && now.Unix() >= expiresAt {
		delete(c.PMProcessData, "pm13Transform")
		return 0, false
	}
	return resCode, true
}

func toInt64(value interface{}) int64 {
	switch typed := value.(type) {
	case int:
		return int64(typed)
	case int64:
		return typed
	case float64:
		return int64(typed)
	case float32:
		return int64(typed)
	default:
		return 0
	}
}
