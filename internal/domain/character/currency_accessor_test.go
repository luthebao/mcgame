// Open-sourced by BaoLT

package character

import (
	"testing"

	"github.com/google/uuid"
)

func TestCurrencyAccessors_CoverWiredCurrencies(t *testing.T) {
	wantClientKeys := []string{
		"money", "moneyBind", "gold", "goldBind", "honor",
		"btPnt", "dogM", "cbM", "act",
		"yuandan", "lyP14", "vtP14", "ltP14", "lbP14", "fishPnt", "xP23",
		"smP14", "thBirthPnt5", "paPnt", "guildContrib", "donateContrib",
		"christmas", "nationalDayPnt", "petChip", "wcPnt18", "wcPnt18gold",
		"a5Pnt", "anni2017", "d11Pnt2020", "explorerPnt", "shishangdian",
		"st2312Pnt", "mcbeans", "petPK_202504", "txkc2508p",
		"petguardout", "petguardin",
		"magiccystalrec", "magiccystalpre", "magiccystallimit",
		"wisdonCrystal", "couragePoint", "mysteryCrystal",
		"decoSilver", "runeExp", "rebatepoint", "heroScore2507",
		"yijieElement", "xmCandy24", "xcds2403p",
		"exPoint", "point", "threePvpPnt",
		"soulPnt",
		"realSoulStone", "realSoulCrystal", "realSoulWater",
		"warSprite", "battleSprite", "monsterHeart", "mhjingshi",
		"heiyaoshiPoint", "heiyaoshiPoint2", "energyStone",
		"npPnt", "elementPnt", "pvePoint", "stoneSealPoint",
	}

	for _, k := range wantClientKeys {
		if _, ok := LookupCurrencyAccessor(k); !ok {
			t.Errorf("LookupCurrencyAccessor(%q) missing", k)
		}
	}
}

func TestCurrencyAccessor_RoundTripsScalarAndBigCurrencies(t *testing.T) {
	char := NewCurrencyTestCharacter()

	cases := []struct {
		key      string
		amount   int64
		readBack func(*Character) int64
	}{
		{"money", 1_000_000_000, func(c *Character) int64 { return c.Money }},
		{"gold", 12345, func(c *Character) int64 { return c.Gold }},
		{"honor", 77, func(c *Character) int64 { return int64(c.Honor) }},
		{"btPnt", 9999, func(c *Character) int64 { return int64(c.ArenaPoints) }},
		{"petguardout", 41, func(c *Character) int64 { return int64(c.PetGuardOut) }},
		{"magiccystalrec", 13, func(c *Character) int64 { return int64(c.MagicCrystalRec) }},
		{"shishangdian", 88, func(c *Character) int64 { return int64(c.ShopGold) }},
		{"wisdonCrystal", 5, func(c *Character) int64 { return int64(c.WisdomCrystal) }},
		{"couragePoint", 6, func(c *Character) int64 { return int64(c.CouragePoint) }},
		{"mysteryCrystal", 7, func(c *Character) int64 { return int64(c.MysteryCrystal) }},
		{"decoSilver", 8, func(c *Character) int64 { return int64(c.DecoSilver) }},
		{"runeExp", 9, func(c *Character) int64 { return int64(c.RuneExp) }},
		{"rebatepoint", 10, func(c *Character) int64 { return int64(c.RebatePoint) }},
		{"heroScore2507", 11, func(c *Character) int64 { return int64(c.HeroScore2507) }},
		{"yijieElement", 12, func(c *Character) int64 { return int64(c.YijieElement) }},
		{"xmCandy24", 13, func(c *Character) int64 { return int64(c.XmCandy24) }},
		{"xcds2403p", 14, func(c *Character) int64 { return int64(c.Xcds2403p) }},
		{"exPoint", 15, func(c *Character) int64 { return int64(c.ExPoint) }},
		{"point", 16, func(c *Character) int64 { return int64(c.GenericPoint) }},
		{"threePvpPnt", 17, func(c *Character) int64 { return int64(c.ThreePvpPoint) }},
		{"soulPnt", 999_999, func(c *Character) int64 { return c.SoulPoints }},
		{"realSoulStone", 21, func(c *Character) int64 { return int64(c.RealSoulStone) }},
		{"warSprite", 22, func(c *Character) int64 { return int64(c.WarSprite) }},
		{"monsterHeart", 23, func(c *Character) int64 { return int64(c.MonsterHeart) }},
		{"heiyaoshiPoint", 24, func(c *Character) int64 { return int64(c.HeiyaoshiPoint) }},
		{"energyStone", 25, func(c *Character) int64 { return int64(c.EnergyStone) }},
		{"npPnt", 26, func(c *Character) int64 { return int64(c.NpPoint) }},
		{"pvePoint", 27, func(c *Character) int64 { return int64(c.PvePoint) }},
		{"stoneSealPoint", 28, func(c *Character) int64 { return int64(c.StoneSealPoint) }},
	}

	for _, tc := range cases {
		a, ok := LookupCurrencyAccessor(tc.key)
		if !ok {
			t.Fatalf("missing accessor %q", tc.key)
		}
		a.Set(char, tc.amount)
		if got := a.Get(char); got != tc.amount {
			t.Errorf("%s Get after Set = %d, want %d", tc.key, got, tc.amount)
		}
		if got := tc.readBack(char); got != tc.amount {
			t.Errorf("%s direct field after Set = %d, want %d", tc.key, got, tc.amount)
		}
	}
}

func NewCurrencyTestCharacter() *Character {
	return NewCharacter(uuid.New(), "tester", 1, 0)
}
