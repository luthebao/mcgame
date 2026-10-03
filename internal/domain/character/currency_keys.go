// Open-sourced by BaoLT

// Currency key registry maps server-side currency type IDs to the Flash client
// `_arg_2` field key and Vietnamese label expected by `onAddMoney` / `onMinusMoney`.
// Use `BasicCurrencyDescriptor` for award type 30 and `GameCurrencyDescriptor` for
// award type 35. These are the only two reward families that emit currency callbacks.
package character

import "strconv"

type CurrencyDescriptor struct {
	TypeID        int
	ClientKey     string
	Label         string
	AlwaysPersist bool
}

const (
	BasicCurrencyMoney = 0
	BasicCurrencyGold  = 1
	BasicCurrencyHonor = 2
)

var basicCurrencyDescriptors = map[int]CurrencyDescriptor{
	BasicCurrencyMoney: {TypeID: BasicCurrencyMoney, ClientKey: "money", Label: "Bạc"},
	BasicCurrencyGold:  {TypeID: BasicCurrencyGold, ClientKey: "gold", Label: "Vàng"},
	BasicCurrencyHonor: {TypeID: BasicCurrencyHonor, ClientKey: "honor", Label: "Danh vọng"},
}

var gameCurrencyDescriptors = map[int]CurrencyDescriptor{
	CurrencyArenaPoint:        {TypeID: CurrencyArenaPoint, ClientKey: "btPnt", Label: "Điểm Đấu Trường"},
	CurrencyDogMedal:          {TypeID: CurrencyDogMedal, ClientKey: "dogM", Label: "Huy chương Cẩu"},
	CurrencyAchillesMedal:     {TypeID: CurrencyAchillesMedal, ClientKey: "cbM", Label: "Huy chương Achilles"},
	CurrencyGroupPvpMedal:     {TypeID: CurrencyGroupPvpMedal, ClientKey: "act", Label: "Huy chương Liên Minh"},
	CurrencyNewYearPoint:      {TypeID: CurrencyNewYearPoint, ClientKey: "yuandan", Label: "Điểm Năm Mới"},
	CurrencyLunaPoint:         {TypeID: CurrencyLunaPoint, ClientKey: "lyP14", Label: "Điểm Tết"},
	CurrencyValentinePoint:    {TypeID: CurrencyValentinePoint, ClientKey: "vtP14", Label: "Điểm Valentine"},
	CurrencyLanternPoint:      {TypeID: CurrencyLanternPoint, ClientKey: "ltP14", Label: "Điểm Lồng Đèn"},
	CurrencyLaborPoint:        {TypeID: CurrencyLaborPoint, ClientKey: "lbP14", Label: "Điểm Lao Động"},
	CurrencyFishingPoint:      {TypeID: CurrencyFishingPoint, ClientKey: "fishPnt", Label: "Điểm Câu Cá"},
	CurrencyQixiPoint:         {TypeID: CurrencyQixiPoint, ClientKey: "xP23", Label: "Điểm Thất Tịch"},
	CurrencySummerPoint:       {TypeID: CurrencySummerPoint, ClientKey: "smP14", Label: "Điểm Mùa Hè"},
	CurrencyAnnualThird:       {TypeID: CurrencyAnnualThird, ClientKey: "thBirthPnt5", Label: "Điểm Kỷ Niệm"},
	CurrencyPetArena:          {TypeID: CurrencyPetArena, ClientKey: "paPnt", Label: "Điểm đấu trường thú"},
	CurrencyNormalContrib:     {TypeID: CurrencyNormalContrib, ClientKey: "guildContrib", Label: "Cống hiến bang hội"},
	CurrencyDonateContrib:     {TypeID: CurrencyDonateContrib, ClientKey: "donateContrib", Label: "Cống hiến quyên góp"},
	CurrencyXmasPoint:         {TypeID: CurrencyXmasPoint, ClientKey: "christmas", Label: "Điểm Giáng Sinh"},
	CurrencyNationalDayPoint:  {TypeID: CurrencyNationalDayPoint, ClientKey: "nationalDayPnt", Label: "Điểm Quốc Khánh"},
	CurrencyPetChip:           {TypeID: CurrencyPetChip, ClientKey: "petChip", Label: "Mảnh thú cưỡi"},
	CurrencyWorldCup:          {TypeID: CurrencyWorldCup, ClientKey: "wcPnt18", Label: "Điểm World Cup"},
	CurrencyGoldWorldCup:      {TypeID: CurrencyGoldWorldCup, ClientKey: "wcPnt18gold", Label: "Vàng World Cup"},
	CurrencySummerGame:        {TypeID: CurrencySummerGame, ClientKey: "a5Pnt", Label: "Điểm Olympic"},
	CurrencyAnniversary:       {TypeID: CurrencyAnniversary, ClientKey: "anni2017", Label: "Điểm Chu Niên"},
	CurrencyDouble11:          {TypeID: CurrencyDouble11, ClientKey: "d11Pnt2020", Label: "Điểm Độc Thân"},
	CurrencyShowTime:          {TypeID: CurrencyShowTime, ClientKey: "explorerPnt", Label: "Điểm ShowTime"},
	CurrencyShopGold:          {TypeID: CurrencyShopGold, ClientKey: "shishangdian", Label: "Vàng Shop"},
	CurrencyAnniConsume:       {TypeID: CurrencyAnniConsume, ClientKey: "st2312Pnt", Label: "Điểm Tiêu Hao Chu Niên"},
	CurrencyMCBeans:           {TypeID: CurrencyMCBeans, ClientKey: "mcbeans", Label: "MC Beans"},
	CurrencyPetArenaAct:       {TypeID: CurrencyPetArenaAct, ClientKey: "petPK_202504", Label: "Điểm hoạt động đấu trường thú"},
	CurrencyShowTime2:         {TypeID: CurrencyShowTime2, ClientKey: "txkc2508p", Label: "Điểm ShowTime 2"},
	CurrencyPetGuardOut:       {TypeID: CurrencyPetGuardOut, ClientKey: "petguardout", Label: "Vệ Sĩ Pet (Ra)"},
	CurrencyPetGuardIn:        {TypeID: CurrencyPetGuardIn, ClientKey: "petguardin", Label: "Vệ Sĩ Pet (Vào)"},
	CurrencyWisdomCrystal:     {TypeID: CurrencyWisdomCrystal, ClientKey: "wisdonCrystal", Label: "Kết Tinh Trí Thạch"},
	CurrencyCouragePoint:      {TypeID: CurrencyCouragePoint, ClientKey: "couragePoint", Label: "Điểm Dũng Khí"},
	CurrencyMysteryCrystal:    {TypeID: CurrencyMysteryCrystal, ClientKey: "mysteryCrystal", Label: "Kết Tinh Thần Bí"},
	CurrencyDecoSilver:        {TypeID: CurrencyDecoSilver, ClientKey: "decoSilver", Label: "Bí Ngân"},
	CurrencyRuneExp:           {TypeID: CurrencyRuneExp, ClientKey: "runeExp", Label: "Exp Phù Văn"},
	CurrencyRebatePoint:       {TypeID: CurrencyRebatePoint, ClientKey: "rebatepoint", Label: "Ma Lực Chi Tinh"},
	CurrencyHeroScore2507:     {TypeID: CurrencyHeroScore2507, ClientKey: "heroScore2507", Label: "Điểm Anh Hùng"},
	CurrencyYijieElement:      {TypeID: CurrencyYijieElement, ClientKey: "yijieElement", Label: "Nguyên Tố Cao Năng"},
	CurrencyXmCandy24:         {TypeID: CurrencyXmCandy24, ClientKey: "xmCandy24", Label: "Kẹo Giáng Sinh"},
	CurrencyXcds2403p:         {TypeID: CurrencyXcds2403p, ClientKey: "xcds2403p", Label: "Điểm Thưởng Sự Kiện"},
	CurrencyExPoint:           {TypeID: CurrencyExPoint, ClientKey: "exPoint", Label: "Đổi Điểm Thưởng"},
	CurrencyGenericPoint:      {TypeID: CurrencyGenericPoint, ClientKey: "point", Label: "Điểm"},
	CurrencyThreePvpPoint:     {TypeID: CurrencyThreePvpPoint, ClientKey: "threePvpPnt", Label: "Huy Chương Dũng Sĩ"},
	CurrencyRealSoulStone:     {TypeID: CurrencyRealSoulStone, ClientKey: "realSoulStone", Label: "Chân Hồn Thạch"},
	CurrencyRealSoulCrystal:   {TypeID: CurrencyRealSoulCrystal, ClientKey: "realSoulCrystal", Label: "Kết Tinh Thần Dụ"},
	CurrencyRealSoulWater:     {TypeID: CurrencyRealSoulWater, ClientKey: "realSoulWater", Label: "Lộ Thu Thập"},
	CurrencyWarSprite:         {TypeID: CurrencyWarSprite, ClientKey: "warSprite", Label: "Dũng Khí Thạch"},
	CurrencyBattleSprite:      {TypeID: CurrencyBattleSprite, ClientKey: "battleSprite", Label: "Ý Chí Thạch"},
	CurrencyMonsterHeart:      {TypeID: CurrencyMonsterHeart, ClientKey: "monsterHeart", Label: "Ma Năng"},
	CurrencyMhJingshi:         {TypeID: CurrencyMhJingshi, ClientKey: "mhjingshi", Label: "Tâm Tinh Thạch"},
	CurrencyHeiyaoshiPoint:    {TypeID: CurrencyHeiyaoshiPoint, ClientKey: "heiyaoshiPoint", Label: "Hắc Diệu Thạch"},
	CurrencyHeiyaoshiPoint2:   {TypeID: CurrencyHeiyaoshiPoint2, ClientKey: "heiyaoshiPoint2", Label: "Tinh Hoa Hắc Diệu Thạch"},
	CurrencyEnergyStone:       {TypeID: CurrencyEnergyStone, ClientKey: "energyStone", Label: "Tụ Linh Thạch"},
	CurrencyNpPoint:           {TypeID: CurrencyNpPoint, ClientKey: "npPnt", Label: "Năng Lượng Tự Nhiên"},
	CurrencyElementPoint:      {TypeID: CurrencyElementPoint, ClientKey: "elementPnt", Label: "Nguyên Tố"},
	CurrencyPvePoint:          {TypeID: CurrencyPvePoint, ClientKey: "pvePoint", Label: "Điểm PVE Pet"},
	CurrencyStoneSealPoint:    {TypeID: CurrencyStoneSealPoint, ClientKey: "stoneSealPoint", Label: "Điểm Ấn Thạch"},
	CurrencyStarPnt:           {TypeID: CurrencyStarPnt, ClientKey: "starPnt", Label: "Điểm Tinh Cung"},
	CurrencySpirituality:      {TypeID: CurrencySpirituality, ClientKey: "spirituality", Label: "Linh Lực", AlwaysPersist: true},
}

func BasicCurrencyDescriptor(id int) (CurrencyDescriptor, bool) {
	d, ok := basicCurrencyDescriptors[id]
	return d, ok
}

func GameCurrencyDescriptor(id int) (CurrencyDescriptor, bool) {
	d, ok := gameCurrencyDescriptors[id]
	return d, ok
}

func (c *Character) GetBasicCurrencyTotal(id int) (int64, bool) {
	if c == nil {
		return 0, false
	}
	switch id {
	case BasicCurrencyMoney:
		return c.Money, true
	case BasicCurrencyGold:
		return c.Gold, true
	case BasicCurrencyHonor:
		return int64(c.Honor), true
	}
	return 0, false
}

func (c *Character) GetGameCurrencyTotal(id int) (int, bool) {
	if c == nil {
		return 0, false
	}
	if _, ok := gameCurrencyDescriptors[id]; !ok {
		return 0, false
	}
	if a, ok := gameKVAccessorsByTypeID[id]; ok {
		return int(a.Get(c)), true
	}
	return 0, false
}

func (c *Character) AddBasicCurrency(id int, amount int64) (int64, bool) {
	if c == nil || amount < 0 {
		return 0, false
	}
	switch id {
	case BasicCurrencyMoney:
		c.Money += amount
		return c.Money, true
	case BasicCurrencyGold:
		c.Gold += amount
		return c.Gold, true
	case BasicCurrencyHonor:
		c.Honor += int(amount)
		return int64(c.Honor), true
	}
	return 0, false
}

type CurrencyAccessor struct {
	Descriptor CurrencyDescriptor
	Get        func(*Character) int64
	Set        func(*Character, int64)
}

var (
	currencyAccessors        = make(map[string]CurrencyAccessor)
	gameKVAccessors          []CurrencyAccessor
	gameKVAccessorsByTypeID  = make(map[int]CurrencyAccessor)
)

func init() {
	register := func(a CurrencyAccessor) {
		currencyAccessors[a.Descriptor.ClientKey] = a
	}
	registerGameKV := func(typeID int, get func(*Character) int64, set func(*Character, int64)) {
		a := CurrencyAccessor{Descriptor: gameCurrencyDescriptors[typeID], Get: get, Set: set}
		register(a)
		gameKVAccessors = append(gameKVAccessors, a)
		gameKVAccessorsByTypeID[typeID] = a
	}
	registerIntGameKV := func(typeID int, get func(*Character) int, set func(*Character, int)) {
		registerGameKV(typeID,
			func(c *Character) int64 { return int64(get(c)) },
			func(c *Character, v int64) { set(c, int(v)) })
	}
	registerInlineIntGameKV := func(d CurrencyDescriptor, get func(*Character) int, set func(*Character, int)) {
		a := CurrencyAccessor{
			Descriptor: d,
			Get:        func(c *Character) int64 { return int64(get(c)) },
			Set:        func(c *Character, v int64) { set(c, int(v)) },
		}
		register(a)
		gameKVAccessors = append(gameKVAccessors, a)
		gameKVAccessorsByTypeID[d.TypeID] = a
	}

	register(CurrencyAccessor{
		Descriptor: basicCurrencyDescriptors[BasicCurrencyMoney],
		Get:        func(c *Character) int64 { return c.Money },
		Set:        func(c *Character, v int64) { c.Money = v },
	})
	register(CurrencyAccessor{
		Descriptor: CurrencyDescriptor{TypeID: BasicCurrencyMoney, ClientKey: "moneyBind", Label: "Bạc khóa"},
		Get:        func(c *Character) int64 { return c.MoneyBind },
		Set:        func(c *Character, v int64) { c.MoneyBind = v },
	})
	register(CurrencyAccessor{
		Descriptor: basicCurrencyDescriptors[BasicCurrencyGold],
		Get:        func(c *Character) int64 { return c.Gold },
		Set:        func(c *Character, v int64) { c.Gold = v },
	})
	register(CurrencyAccessor{
		Descriptor: CurrencyDescriptor{TypeID: BasicCurrencyGold, ClientKey: "goldBind", Label: "Vàng khóa"},
		Get:        func(c *Character) int64 { return c.GoldBind },
		Set:        func(c *Character, v int64) { c.GoldBind = v },
	})
	register(CurrencyAccessor{
		Descriptor: basicCurrencyDescriptors[BasicCurrencyHonor],
		Get:        func(c *Character) int64 { return int64(c.Honor) },
		Set:        func(c *Character, v int64) { c.Honor = int(v) },
	})
	register(CurrencyAccessor{
		Descriptor: CurrencyDescriptor{TypeID: 0, ClientKey: "soulPnt", Label: "Pha Lê (Soul Points)"},
		Get:        func(c *Character) int64 { return c.SoulPoints },
		Set:        func(c *Character, v int64) { c.SoulPoints = v },
	})

	registerIntGameKV(CurrencyArenaPoint, func(c *Character) int { return c.ArenaPoints }, func(c *Character, v int) { c.ArenaPoints = v })
	registerIntGameKV(CurrencyDogMedal, func(c *Character) int { return c.DogMedal }, func(c *Character, v int) { c.DogMedal = v })
	registerIntGameKV(CurrencyAchillesMedal, func(c *Character) int { return c.AchillesMedal }, func(c *Character, v int) { c.AchillesMedal = v })
	registerIntGameKV(CurrencyGroupPvpMedal, func(c *Character) int { return c.GroupPvpMedal }, func(c *Character, v int) { c.GroupPvpMedal = v })
	registerIntGameKV(CurrencyNewYearPoint, func(c *Character) int { return c.NewYearPoint }, func(c *Character, v int) { c.NewYearPoint = v })
	registerIntGameKV(CurrencyLunaPoint, func(c *Character) int { return c.LunaPoint }, func(c *Character, v int) { c.LunaPoint = v })
	registerIntGameKV(CurrencyValentinePoint, func(c *Character) int { return c.ValentinePoint }, func(c *Character, v int) { c.ValentinePoint = v })
	registerIntGameKV(CurrencyLanternPoint, func(c *Character) int { return c.LanternPoint }, func(c *Character, v int) { c.LanternPoint = v })
	registerIntGameKV(CurrencyLaborPoint, func(c *Character) int { return c.LaborPoint }, func(c *Character, v int) { c.LaborPoint = v })
	registerIntGameKV(CurrencyFishingPoint, func(c *Character) int { return c.FishingPoint }, func(c *Character, v int) { c.FishingPoint = v })
	registerIntGameKV(CurrencyQixiPoint, func(c *Character) int { return c.QixiPoint }, func(c *Character, v int) { c.QixiPoint = v })
	registerIntGameKV(CurrencySummerPoint, func(c *Character) int { return c.SummerPoint }, func(c *Character, v int) { c.SummerPoint = v })
	registerIntGameKV(CurrencyAnnualThird, func(c *Character) int { return c.AnnualThird }, func(c *Character, v int) { c.AnnualThird = v })
	registerIntGameKV(CurrencyPetArena, func(c *Character) int { return c.PetArenaPoint }, func(c *Character, v int) { c.PetArenaPoint = v })
	registerIntGameKV(CurrencyNormalContrib, func(c *Character) int { return c.GuildContrib }, func(c *Character, v int) { c.GuildContrib = v })
	registerIntGameKV(CurrencyDonateContrib, func(c *Character) int { return c.DonateContrib }, func(c *Character, v int) { c.DonateContrib = v })
	registerIntGameKV(CurrencyXmasPoint, func(c *Character) int { return c.XmasPoint }, func(c *Character, v int) { c.XmasPoint = v })
	registerIntGameKV(CurrencyNationalDayPoint, func(c *Character) int { return c.NationalDayPoint }, func(c *Character, v int) { c.NationalDayPoint = v })
	registerIntGameKV(CurrencyPetChip, func(c *Character) int { return c.PetChip }, func(c *Character, v int) { c.PetChip = v })
	registerIntGameKV(CurrencyWorldCup, func(c *Character) int { return c.WorldCupPoint }, func(c *Character, v int) { c.WorldCupPoint = v })
	registerIntGameKV(CurrencyGoldWorldCup, func(c *Character) int { return c.GoldWorldCup }, func(c *Character, v int) { c.GoldWorldCup = v })
	registerIntGameKV(CurrencySummerGame, func(c *Character) int { return c.SummerGamePoint }, func(c *Character, v int) { c.SummerGamePoint = v })
	registerIntGameKV(CurrencyAnniversary, func(c *Character) int { return c.AnniversaryPoint }, func(c *Character, v int) { c.AnniversaryPoint = v })
	registerIntGameKV(CurrencyDouble11, func(c *Character) int { return c.Double11Point }, func(c *Character, v int) { c.Double11Point = v })
	registerIntGameKV(CurrencyShowTime, func(c *Character) int { return c.ShowTimePoint }, func(c *Character, v int) { c.ShowTimePoint = v })
	registerIntGameKV(CurrencyShopGold, func(c *Character) int { return c.ShopGold }, func(c *Character, v int) { c.ShopGold = v })
	registerIntGameKV(CurrencyAnniConsume, func(c *Character) int { return c.AnniConsumePoint }, func(c *Character, v int) { c.AnniConsumePoint = v })
	registerIntGameKV(CurrencyMCBeans, func(c *Character) int { return c.MCBeans }, func(c *Character, v int) { c.MCBeans = v })
	registerIntGameKV(CurrencyPetArenaAct, func(c *Character) int { return c.PetArenaActPoint }, func(c *Character, v int) { c.PetArenaActPoint = v })
	registerIntGameKV(CurrencyShowTime2, func(c *Character) int { return c.ShowTime2Point }, func(c *Character, v int) { c.ShowTime2Point = v })
	registerInlineIntGameKV(
		CurrencyDescriptor{TypeID: CurrencyMagicCrystalRec, ClientKey: "magiccystalrec", Label: "Bụi Ma Thuật", AlwaysPersist: true},
		func(c *Character) int { return c.MagicCrystalRec },
		func(c *Character, v int) { c.MagicCrystalRec = v },
	)
	registerInlineIntGameKV(
		CurrencyDescriptor{TypeID: CurrencyMagicCrystalPre, ClientKey: "magiccystalpre", Label: "Pha Lê Vĩnh Hằng", AlwaysPersist: true},
		func(c *Character) int { return c.MagicCrystalPre },
		func(c *Character, v int) { c.MagicCrystalPre = v },
	)
	registerInlineIntGameKV(
		CurrencyDescriptor{TypeID: CurrencyMagicCrystalLimit, ClientKey: "magiccystallimit", Label: "Pha Lê Cực Hạn", AlwaysPersist: true},
		func(c *Character) int { return c.MagicCrystalLimit },
		func(c *Character, v int) { c.MagicCrystalLimit = v },
	)
	registerIntGameKV(CurrencyPetGuardOut, func(c *Character) int { return c.PetGuardOut }, func(c *Character, v int) { c.PetGuardOut = v })
	registerIntGameKV(CurrencyPetGuardIn, func(c *Character) int { return c.PetGuardIn }, func(c *Character, v int) { c.PetGuardIn = v })
	registerIntGameKV(CurrencyWisdomCrystal, func(c *Character) int { return c.WisdomCrystal }, func(c *Character, v int) { c.WisdomCrystal = v })
	registerIntGameKV(CurrencyCouragePoint, func(c *Character) int { return c.CouragePoint }, func(c *Character, v int) { c.CouragePoint = v })
	registerIntGameKV(CurrencyMysteryCrystal, func(c *Character) int { return c.MysteryCrystal }, func(c *Character, v int) { c.MysteryCrystal = v })
	registerIntGameKV(CurrencyDecoSilver, func(c *Character) int { return c.DecoSilver }, func(c *Character, v int) { c.DecoSilver = v })
	registerIntGameKV(CurrencyRuneExp, func(c *Character) int { return c.RuneExp }, func(c *Character, v int) { c.RuneExp = v })
	registerIntGameKV(CurrencyRebatePoint, func(c *Character) int { return c.RebatePoint }, func(c *Character, v int) { c.RebatePoint = v })
	registerIntGameKV(CurrencyHeroScore2507, func(c *Character) int { return c.HeroScore2507 }, func(c *Character, v int) { c.HeroScore2507 = v })
	registerIntGameKV(CurrencyYijieElement, func(c *Character) int { return c.YijieElement }, func(c *Character, v int) { c.YijieElement = v })
	registerIntGameKV(CurrencyXmCandy24, func(c *Character) int { return c.XmCandy24 }, func(c *Character, v int) { c.XmCandy24 = v })
	registerIntGameKV(CurrencyXcds2403p, func(c *Character) int { return c.Xcds2403p }, func(c *Character, v int) { c.Xcds2403p = v })
	registerIntGameKV(CurrencyExPoint, func(c *Character) int { return c.ExPoint }, func(c *Character, v int) { c.ExPoint = v })
	registerIntGameKV(CurrencyGenericPoint, func(c *Character) int { return c.GenericPoint }, func(c *Character, v int) { c.GenericPoint = v })
	registerIntGameKV(CurrencyThreePvpPoint, func(c *Character) int { return c.ThreePvpPoint }, func(c *Character, v int) { c.ThreePvpPoint = v })
	registerIntGameKV(CurrencyRealSoulStone, func(c *Character) int { return c.RealSoulStone }, func(c *Character, v int) { c.RealSoulStone = v })
	registerIntGameKV(CurrencyRealSoulCrystal, func(c *Character) int { return c.RealSoulCrystal }, func(c *Character, v int) { c.RealSoulCrystal = v })
	registerIntGameKV(CurrencyRealSoulWater, func(c *Character) int { return c.RealSoulWater }, func(c *Character, v int) { c.RealSoulWater = v })
	registerIntGameKV(CurrencyWarSprite, func(c *Character) int { return c.WarSprite }, func(c *Character, v int) { c.WarSprite = v })
	registerIntGameKV(CurrencyBattleSprite, func(c *Character) int { return c.BattleSprite }, func(c *Character, v int) { c.BattleSprite = v })
	registerIntGameKV(CurrencyMonsterHeart, func(c *Character) int { return c.MonsterHeart }, func(c *Character, v int) { c.MonsterHeart = v })
	registerIntGameKV(CurrencyMhJingshi, func(c *Character) int { return c.MhJingshi }, func(c *Character, v int) { c.MhJingshi = v })
	registerIntGameKV(CurrencyHeiyaoshiPoint, func(c *Character) int { return c.HeiyaoshiPoint }, func(c *Character, v int) { c.HeiyaoshiPoint = v })
	registerIntGameKV(CurrencyHeiyaoshiPoint2, func(c *Character) int { return c.HeiyaoshiPoint2 }, func(c *Character, v int) { c.HeiyaoshiPoint2 = v })
	registerIntGameKV(CurrencyEnergyStone, func(c *Character) int { return c.EnergyStone }, func(c *Character, v int) { c.EnergyStone = v })
	registerIntGameKV(CurrencyNpPoint, func(c *Character) int { return c.NpPoint }, func(c *Character, v int) { c.NpPoint = v })
	registerIntGameKV(CurrencyElementPoint, func(c *Character) int { return c.ElementPoint }, func(c *Character, v int) { c.ElementPoint = v })
	registerIntGameKV(CurrencyPvePoint, func(c *Character) int { return c.PvePoint }, func(c *Character, v int) { c.PvePoint = v })
	registerIntGameKV(CurrencyStoneSealPoint, func(c *Character) int { return c.StoneSealPoint }, func(c *Character, v int) { c.StoneSealPoint = v })
	registerIntGameKV(CurrencyStarPnt, func(c *Character) int { return c.StarPnt }, func(c *Character, v int) { c.StarPnt = v })
	registerGameKV(CurrencySpirituality,
		func(c *Character) int64 { v, _ := strconv.ParseInt(c.Spirituality, 10, 64); return v },
		func(c *Character, v int64) { c.Spirituality = strconv.FormatInt(v, 10) })
}

func LookupCurrencyAccessor(clientKey string) (CurrencyAccessor, bool) {
	a, ok := currencyAccessors[clientKey]
	return a, ok
}

func GameKVCurrencyAccessors() []CurrencyAccessor {
	return gameKVAccessors
}

func LookupGameKVAccessor(typeID int) (CurrencyAccessor, bool) {
	a, ok := gameKVAccessorsByTypeID[typeID]
	return a, ok
}
