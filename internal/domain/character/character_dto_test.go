// Open-sourced by BaoLT

package character

import (
	"reflect"
	"testing"
	"time"

	"mcgame-server/internal/domain/stats"

	"github.com/google/uuid"
)

func TestToDTO_GuideFlagUsesStringKeys(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.GuideLog = map[int]bool{1: true, 12: true}

	dto := char.ToDTO()
	guideFlag, ok := dto["guideFlag"]
	if !ok {
		t.Fatalf("guideFlag not found in dto")
	}

	rv := reflect.ValueOf(guideFlag)
	if rv.Kind() != reflect.Map {
		t.Fatalf("guideFlag should be map, got %T", guideFlag)
	}

	if rv.Type().Key().Kind() != reflect.String {
		t.Fatalf("guideFlag map key kind = %s, want string", rv.Type().Key().Kind())
	}
}

func TestToDTO_ContainsRequiredViewPropertyKeys(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.GMLevel = 5
	dto := char.ToDTO()

	requiredKeys := []string{
		"finalHp", "finalMp", "finalSp",
		"finalAttack", "finalMAttack", "finalDefence", "finalMDefence",
		"finalHit", "finalCritical", "finalDodge", "finalSpeed",
		"finalStrength", "finalAgility", "finalStamina", "finalIntelligence", "finalEnergy",
		"attLastPoint", "lastPoint", "spirituality",
		"ee", "en", "ef",
	}

	for _, key := range requiredKeys {
		if _, ok := dto[key]; !ok {
			t.Fatalf("missing key in dto: %s", key)
		}
	}

	if dto["gmLevel"] != 5 {
		t.Fatalf("gmLevel = %v, want 5", dto["gmLevel"])
	}
}

func TestBuildUPPPayload_IncludesNestedProperty(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.Level = 10
	char.Strength = 30
	char.Agility = 18
	char.Stamina = 20
	char.Intelligence = 15
	char.Spirit = 12
	char.AttrPoints = 4
	char.RecalculateStats()

	payload := BuildUPPPayload(char)
	if payload["level"] != 10 {
		t.Fatalf("level = %v, want 10", payload["level"])
	}
	if payload["hpMax"] != 156 {
		t.Fatalf("hpMax = %v, want 156", payload["hpMax"])
	}
	prop, ok := payload["property"].(map[string]interface{})
	if !ok {
		t.Fatalf("property type = %T, want map[string]interface{}", payload["property"])
	}
	if prop["finalHp"] != 156 {
		t.Fatalf("property.finalHp = %v, want 156", prop["finalHp"])
	}
	if prop["lastPoint"] != "4" {
		t.Fatalf("property.lastPoint = %v, want 4", prop["lastPoint"])
	}
}

func TestBuildStatRefreshUPPPayload_OmitsNoisyFields(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.Level = 10
	char.BagSlotNum = 2
	char.BankSlotNum = 2
	char.PetMaxNum = 6
	char.Honor = 15
	char.RecalculateStats()

	payload := BuildStatRefreshUPPPayload(char)

	for _, key := range []string{"bagSlotNum", "bankSlotNum", "petMaxNum", "honor", "chival", "pop", "expRe", "expBattle"} {
		if _, ok := payload[key]; ok {
			t.Fatalf("payload unexpectedly contains %s", key)
		}
	}

	if payload["level"] != 10 {
		t.Fatalf("level = %v, want 10", payload["level"])
	}

	prop, ok := payload["property"].(map[string]interface{})
	if !ok {
		t.Fatalf("property type = %T, want map[string]interface{}", payload["property"])
	}

	if prop["lastPoint"] != "0" {
		t.Fatalf("property.lastPoint = %v, want 0", prop["lastPoint"])
	}

	if prop["bagSlotNum"] != 2 {
		t.Fatalf("property.bagSlotNum = %v, want 2", prop["bagSlotNum"])
	}

	if payload["attLastPoint"] != 0 {
		t.Fatalf("attLastPoint = %v, want 0", payload["attLastPoint"])
	}
}

func TestNewCharacter_DefaultElementStateIsNeutral(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)

	if char.Ee != "0" {
		t.Fatalf("Ee = %q, want 0", char.Ee)
	}
	if char.En != 0 {
		t.Fatalf("En = %d, want 0", char.En)
	}
	if char.Ef {
		t.Fatalf("Ef = %v, want false", char.Ef)
	}
}

func TestNewCharacter_DefaultSelectedMoneyTypeIsMoneyBind(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)

	if char.SelectedMoneyType != 1 {
		t.Fatalf("SelectedMoneyType = %d, want 1", char.SelectedMoneyType)
	}
}

func TestNewCharacter_DefaultBagAndBankCountsAreOne(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)

	if char.BagSlotNum != 1 {
		t.Fatalf("BagSlotNum = %d, want 1", char.BagSlotNum)
	}
	if char.BankSlotNum != 1 {
		t.Fatalf("BankSlotNum = %d, want 1", char.BankSlotNum)
	}
	if got := char.MaxBagSlots(); got != 30 {
		t.Fatalf("MaxBagSlots() = %d, want 30", got)
	}
	if got := char.MaxBankSlots(); got != 30 {
		t.Fatalf("MaxBankSlots() = %d, want 30", got)
	}
}

func TestNewCharacter_DefaultSelectedGoldTypeIsGoldBind(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)

	if char.SelectedGoldType != 3 {
		t.Fatalf("SelectedGoldType = %d, want 3", char.SelectedGoldType)
	}
}

func TestCurrentPMLevel_UsesHigherValueBetweenTypeAndExp(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.VIPType = 2
	expiresAt := time.Now().Add(24 * time.Hour)
	char.VIPExpiresAt = &expiresAt
	char.PMExp = 555000

	if got := char.CurrentPMLevel(time.Now()); got != 7 {
		t.Fatalf("CurrentPMLevel = %d, want 7", got)
	}
}

func TestCurrentPMLevel_ReturnsZeroWhenPremiumExpired(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.VIPType = 3
	expiresAt := time.Now().Add(-24 * time.Hour)
	char.VIPExpiresAt = &expiresAt
	char.PMExp = 1105000

	if got := char.CurrentPMLevel(time.Now()); got != 0 {
		t.Fatalf("CurrentPMLevel = %d, want 0", got)
	}
}

func TestRecalculateStats_UsesSharedProfileFormula(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.Level = 10
	char.Strength = 15
	char.Agility = 10
	char.Stamina = 15
	char.Intelligence = 5
	char.Spirit = 5
	char.AptStrength = 3
	char.AptAgility = 4
	char.AptStamina = 6
	char.AptIntelligence = 2
	char.AptEnergy = 5
	char.ClassAptStrength = 10
	char.ClassAptAgility = 10
	char.ClassAptStamina = 10
	char.ClassAptIntelligence = 10
	char.ClassAptEnergy = 10

	expected := stats.BuildBaseStats(char.buildStatsProfile())

	char.RecalculateStats()

	got := stats.Result{
		MaxHP:        char.MaxHP,
		MaxMP:        char.MaxMP,
		MaxSP:        char.MaxSP,
		Attack:       char.Attack,
		Defense:      char.Defense,
		MagicAttack:  char.MagicAttack,
		MagicDefense: char.MagicDefense,
		Hit:          char.Hit,
		Dodge:        char.Dodge,
		Speed:        char.Speed,
		Critical:     char.Critical,
	}
	if got != expected {
		t.Fatalf("stats mismatch:\n got: %+v\nwant: %+v", got, expected)
	}
}

func TestRecalculateStats_ClassAptMultipliesEffectiveAttribute(t *testing.T) {
charNoApt := NewCharacter(uuid.New(), "tester", 1, 0)
charNoApt.Level = 1
charNoApt.Strength = 20
charNoApt.ClassAptStrength = 0
charNoApt.RecalculateStats()

charWithApt := NewCharacter(uuid.New(), "tester", 1, 0)
charWithApt.Level = 1
charWithApt.Strength = 20
charWithApt.ClassAptStrength = 50
charWithApt.RecalculateStats()

if charWithApt.Attack <= charNoApt.Attack {
t.Fatalf("Attack with ClassAptStrength=50 (%d) should exceed Attack without (%d)", charWithApt.Attack, charNoApt.Attack)
}
}

func TestRecalculateStats_DistributedPointsAndClassAptAreIndependent(t *testing.T) {
char := NewCharacter(uuid.New(), "tester", 1, 0)
char.Level = 1
char.Strength = 10
char.AptStrength = 5
char.ClassAptStrength = 0
char.RecalculateStats()
attackWithPoints := char.Attack

char2 := NewCharacter(uuid.New(), "tester", 1, 0)
char2.Level = 1
char2.Strength = 10
char2.AptStrength = 0
char2.ClassAptStrength = 50
char2.RecalculateStats()
attackWithClassApt := char2.Attack

if attackWithPoints == 0 || attackWithClassApt == 0 {
t.Fatalf("both attack values should be positive: points=%d classApt=%d", attackWithPoints, attackWithClassApt)
}
}
