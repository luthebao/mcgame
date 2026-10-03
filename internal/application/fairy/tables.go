// Open-sourced by BaoLT

// Fairy client cost/cap tables copied verbatim from GamePredef.as (contract
// costTables). FairyLevelExp / FairyGrowExp are CUMULATIVE thresholds: index i is
// the total exp/gexp required to reach level i+1, so the current level is the
// highest index whose threshold is met (FairyLogic.expToLv / gexpToLv).
//
// Currency / item costs (FairyManagerPanel currencies):
//
//	fairyGrowUp type0 = 50000 Money(silver); type1 = 5 Gold; type2 = the 20x batch,
//	  charging 5 Gold per cultivation actually performed (capped at 20, stops early
//	  on out-of-gold / no daily cultivations left / grow-level cap). The client's
//	  FAIRY_MANAGER_PANEL_U[78] "780 vàng" tooltip disagrees with the per-call
//	  moneyCost=5 in FairyFuncCanvas.as; the per-call cost is authoritative.
//	setFairyResList (skin unlock) = 550 Gold.
//	addFairyExp consumes Quả Tinh Linh fruit items 3390/3391/3392; per-fruit exp is
//	  in FairyExpFruitGain (3390=225, 3391=300, 3392=400, from TBL_ITEM_TEMPLATE info).
//	upFairySkill consumes ITEM_FAIRY_SKILL_UP_ITEM=3583 (1 book lv1->2, 3 books
//	  lv2->3); the per-skill level/upgrade chain lives in TBL_SKILL.
//
// SkillItemToTblSkill maps the item template id of a fairy skill-book to the
// level-1 TBL_SKILL row id for that skill (22 entries, authoritative). OnSkill
// stores this mapped id in skillFlag so that the Flash client can read the displayed
// level via getGameData(TBL_SKILL, skillFlag[sN]).level.
package fairy

const (
	FairyMaxLevel  = 20
	FairyGrowLevel = 50

	GrowTypeMoney      = 0
	GrowTypeGold       = 1
	GrowTypeGoldBatch  = 2
	GrowCostMoney      = 50000
	GrowCostGold       = 5
	GrowBatchMultiple  = 20
	SkinUnlockGoldCost = 550

	SetFairyResHide = 1
	SetFairyResShow = 2
)

var SkillItemToTblSkill = map[int]int{
	3577: 5917,
	3578: 5920,
	3579: 5923,
	3580: 5926,
	3581: 5929,
	3582: 5932,
	3986: 6227,
	3987: 6230,
	3995: 6236,
	3996: 6239,
	3997: 6242,
	3998: 6245,
	4000: 6248,
	4001: 6251,
	4002: 6254,
	4003: 6257,
	4004: 6260,
	4005: 6263,
	4006: 6266,
	4007: 6269,
	4008: 6272,
	4009: 6275,
}

var (
	FairyLevelExp = []int64{
		1, 50, 250, 700, 1500, 2750, 4550, 7000, 10200, 14250,
		19250, 25300, 32500, 40950, 50750, 62000, 74800, 89250, 105450, 123500,
	}

	FairyGrowExp = []int64{
		500, 1500, 3500, 7000, 12500, 20500, 31500, 46000, 64500, 87500,
		115500, 149000, 188500, 234500, 287500, 348000, 416500, 493500, 579500, 675000,
		780500, 896500, 1023500, 1162000, 1312500, 1475500, 1651500, 1841000, 2044500, 2262500,
		2495500, 2744000, 3008500, 3289500, 3587500, 3903000, 4236500, 4588500, 4959500, 5350000,
		5760500, 6191500, 6643500, 7117000, 7612500, 8130500, 8671500, 9236000, 9824500, 10437500,
	}

	FairyColorEffect = []int{20, 25, 30, 35, 40}

	FairyExpFruitGain = map[int]int64{
		3390: 225,
		3391: 300,
		3392: 400,
	}
)

func cumulativeLevel(exp int64, table []int64, cap int) int {
	lv := 0
	for i, threshold := range table {
		if exp >= threshold {
			lv = i + 1
		} else {
			break
		}
	}
	if lv > cap {
		lv = cap
	}
	return lv
}

func expToLv(exp int64) int {
	return cumulativeLevel(exp, FairyLevelExp, FairyMaxLevel)
}

func gexpToLv(gexp int64) int {
	return cumulativeLevel(gexp, FairyGrowExp, FairyGrowLevel)
}

func isExpFruit(templateID int) bool {
	_, ok := FairyExpFruitGain[templateID]
	return ok
}

func fruitExpForTemplate(templateID int) int64 {
	return FairyExpFruitGain[templateID]
}
