// Open-sourced by BaoLT

package farm

import (
	"testing"
	"time"

	domainfarm "mcgame-server/internal/domain/farm"
)

func TestGrowingStageAtUsesOneThirdOfGrowDuration(t *testing.T) {
	plot := &domainfarm.Plot{
		CropNPCID: 1229,
		PlantedAt: time.Date(2026, 4, 4, 10, 0, 0, 0, time.UTC),
		ReadyAt:   time.Date(2026, 4, 4, 10, 5, 0, 0, time.UTC),
	}

	expected := time.Date(2026, 4, 4, 10, 1, 40, 0, time.UTC)
	if actual := GrowingStageAt(plot); !actual.Equal(expected) {
		t.Fatalf("GrowingStageAt() = %v, expected %v", actual, expected)
	}
}

func TestVisualResCodeTransitionsAtGrowingAndReadyStages(t *testing.T) {
	plot := &domainfarm.Plot{
		CropNPCID: 1229,
		PlantedAt: time.Date(2026, 4, 4, 10, 0, 0, 0, time.UTC),
		ReadyAt:   time.Date(2026, 4, 4, 10, 5, 0, 0, time.UTC),
	}

	initialResCode := int64(2060090000120)
	growingAt := GrowingStageAt(plot)

	if got := VisualResCode(plot, initialResCode, growingAt.Add(-time.Second)); got != initialResCode {
		t.Fatalf("VisualResCode() before growing stage = %d, expected %d", got, initialResCode)
	}

	if got := VisualResCode(plot, initialResCode, growingAt); got != 2060090000121 {
		t.Fatalf("VisualResCode() at growing stage = %d, expected %d", got, 2060090000121)
	}

	if got := VisualResCode(plot, initialResCode, plot.ReadyAt); got != 2060090000122 {
		t.Fatalf("VisualResCode() at ready stage = %d, expected %d", got, 2060090000122)
	}
}
