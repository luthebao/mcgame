// Open-sourced by BaoLT

// Farm visual helpers derive overlay npc ids, placement, and growth stages.
package farm

import (
	"time"

	domainfarm "mcgame-server/internal/domain/farm"
)

const visualNPCOffset = 100000

const (
	visualOffsetX = 150
	visualOffsetY = -75
)

const (
	stageGrowingResCodeFallback = int64(2060090000148)
	stageReadyResCodeFallback   = int64(2060090000155)
)

const (
	growingStageNumerator   = 1
	growingStageDenominator = 3
)

type visualStage struct {
	GrowingResCode int64
	ReadyResCode   int64
}

var stagesByCropID = map[int]visualStage{
	1229: {GrowingResCode: 2060090000121, ReadyResCode: 2060090000122},
	1230: {GrowingResCode: 2060090000123, ReadyResCode: 2060090000124},
	1231: {GrowingResCode: 2060090000125, ReadyResCode: 2060090000126},
	1233: {GrowingResCode: 2060090000127, ReadyResCode: 2060090000128},
	1232: {GrowingResCode: 2060090000129, ReadyResCode: 2060090000130},
	1234: {GrowingResCode: 2060090000131, ReadyResCode: 2060090000132},
	1236: {GrowingResCode: 2060090000133, ReadyResCode: 2060090000134},
	1235: {GrowingResCode: 2060090000135, ReadyResCode: 2060090000136},
	1239: {GrowingResCode: 2060090000137, ReadyResCode: 2060090000138},
	1525: {GrowingResCode: 2060090000139, ReadyResCode: 2060090000140},
	1526: {GrowingResCode: 2060090000141, ReadyResCode: 2060090000142},
	1528: {GrowingResCode: 2060090000143, ReadyResCode: 2060090000144},
	1529: {GrowingResCode: 2060090000145, ReadyResCode: 2060090000146},
	1271: {GrowingResCode: 2060090000147, ReadyResCode: 2060090000148},
}

func VisualNPCID(plotNPCID int) int {
	return visualNPCOffset + plotNPCID
}

func VisualPositionForPlot(_ int, fallbackX int, fallbackY int) (int, int) {
	return fallbackX + visualOffsetX, fallbackY + visualOffsetY
}

func VisualResCode(plot *domainfarm.Plot, initialResCode int64, now time.Time) int64 {
	if plot == nil {
		return initialResCode
	}

	stage := stageForCrop(plot.CropNPCID)
	if !now.Before(plot.ReadyAt) {
		return stage.ReadyResCode
	}

	growingAt := GrowingStageAt(plot)
	if !growingAt.IsZero() && !now.Before(growingAt) {
		return stage.GrowingResCode
	}

	return initialResCode
}

func GrowingStageAt(plot *domainfarm.Plot) time.Time {
	if plot == nil {
		return time.Time{}
	}

	growDuration := plot.ReadyAt.Sub(plot.PlantedAt)
	if growDuration <= 0 {
		return plot.ReadyAt
	}

	return plot.PlantedAt.Add((growDuration * growingStageNumerator) / growingStageDenominator)
}

func stageForCrop(cropNPCID int) visualStage {
	if mappedStage, ok := stagesByCropID[cropNPCID]; ok {
		return mappedStage
	}

	return visualStage{
		GrowingResCode: stageGrowingResCodeFallback,
		ReadyResCode:   stageReadyResCodeFallback,
	}
}
