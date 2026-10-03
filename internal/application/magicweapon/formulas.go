// Open-sourced by BaoLT

package magicweapon

var mwHPGrowMap = []float64{
	1, 1.4, 2.9, 4.8, 7.3, 11.2, 15.2, 19.7, 27.4, 34.1,
	40.7, 47.4, 55, 62.6, 70.2, 77.8, 85.4, 93, 100.6, 108.2, 115.8,
}

var mwSpeedGrowMap = []float64{
	1, 1.5, 2, 3.6, 6.2, 8.9, 11.8, 13.3, 16.2, 19.3,
	22.6, 25.8, 29.3, 32, 34.7, 38, 41.3, 44.6, 47.9, 51.2, 54.5,
}

const (
	PropTypeHP           = 1
	PropTypeMP           = 2
	PropTypeAttack       = 4
	PropTypeMagicAttack  = 5
	PropTypeDefence      = 6
	PropTypeMagicDefence = 7
	PropTypeHit          = 8
	PropTypeDodge        = 9
	PropTypeSpeed        = 11
	PropTypeCritical     = 13
	PropTypeResiCritical = 27
)

func MainGrowMultiplier(propType, upgradeNum int) float64 {
	if upgradeNum < 0 {
		upgradeNum = 0
	}
	switch propType {
	case PropTypeHP:
		if upgradeNum >= len(mwHPGrowMap) {
			upgradeNum = len(mwHPGrowMap) - 1
		}
		return mwHPGrowMap[upgradeNum]
	case PropTypeSpeed:
		if upgradeNum >= len(mwSpeedGrowMap) {
			upgradeNum = len(mwSpeedGrowMap) - 1
		}
		return mwSpeedGrowMap[upgradeNum]
	}
	return 1
}

var subMWGrowPercent = []float64{0, 4, 12, 24}

func SubGrowPercent(upgradeNum int) float64 {
	if upgradeNum < 0 {
		upgradeNum = 0
	}
	if upgradeNum >= len(subMWGrowPercent) {
		upgradeNum = len(subMWGrowPercent) - 1
	}
	return subMWGrowPercent[upgradeNum]
}

var artifactQualityArr = []float64{0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0}

const (
	StageEightMin    = 0.9
	StageEightMax    = 2.0
	StageEightItemID = 4758
)

func ComputeStageVong(instMainPropNum1, templateMainPropNum1 float64) int {
	if templateMainPropNum1 <= 0 {
		return 0
	}
	ratio := instMainPropNum1 / templateMainPropNum1
	stage := 0
	for i, threshold := range artifactQualityArr {
		if ratio >= threshold {
			stage = i + 1
		}
	}
	return stage
}

type ActivateMWProRange struct {
	PropType int
	ValMax   float64
	ValMin   float64
	Top0     float64
	Top1     float64
	Top2     float64
	Top3     float64
}

var activateMWPro = map[int]ActivateMWProRange{
	1:  {PropType: 1, ValMax: 12000, ValMin: 1200, Top0: 2680, Top1: 4926, Top2: 11999, Top3: 12000},
	2:  {PropType: 2, ValMax: 500, ValMin: 50, Top0: 112, Top1: 205, Top2: 499, Top3: 500},
	4:  {PropType: 4, ValMax: 3000, ValMin: 300, Top0: 670, Top1: 1232, Top2: 2999, Top3: 3000},
	5:  {PropType: 5, ValMax: 2400, ValMin: 240, Top0: 536, Top1: 985, Top2: 2399, Top3: 2400},
	6:  {PropType: 6, ValMax: 10000, ValMin: 1000, Top0: 2233, Top1: 4105, Top2: 9999, Top3: 10000},
	7:  {PropType: 7, ValMax: 10000, ValMin: 1000, Top0: 2233, Top1: 4105, Top2: 9999, Top3: 10000},
	8:  {PropType: 8, ValMax: 5, ValMin: 0.5, Top0: 1.1, Top1: 2.1, Top2: 4.9, Top3: 5},
	9:  {PropType: 9, ValMax: 5, ValMin: 0.5, Top0: 1.1, Top1: 2.1, Top2: 4.9, Top3: 5},
	11: {PropType: 11, ValMax: 1200, ValMin: 120, Top0: 268, Top1: 493, Top2: 1199, Top3: 1200},
	13: {PropType: 13, ValMax: 4, ValMin: 0.4, Top0: 0.9, Top1: 1.6, Top2: 3.9, Top3: 4},
	27: {PropType: 27, ValMax: 4, ValMin: 0.4, Top0: 0.9, Top1: 1.6, Top2: 3.9, Top3: 4},
}

func ActivatePropRange(propType int) (ActivateMWProRange, bool) {
	r, ok := activateMWPro[propType]
	return r, ok
}

func ActivatePropTypes() []int {
	out := make([]int, 0, len(activateMWPro))
	for t := range activateMWPro {
		out = append(out, t)
	}
	return out
}
