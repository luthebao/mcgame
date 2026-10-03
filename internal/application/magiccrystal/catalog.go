// Open-sourced by BaoLT

package magiccrystal

const (
	MaxSlots         = 16
	MaxLevel         = 9
	MaxCapacity      = 1000
	RecoveryDustCost = 1
)

type levelEntry struct {
	Max int
	Num int
	V   float64
}

type slotEntry struct {
	StatType     int
	ActivateCost int
	Levels       [MaxLevel + 1]levelEntry
}

var slotCatalog = [MaxSlots]slotEntry{
	{
		StatType:     1,
		ActivateCost: 10,
		Levels: [MaxLevel + 1]levelEntry{
			{Max: 100, Num: 20, V: 12000},
			{Max: 200, Num: 30, V: 24000},
			{Max: 300, Num: 40, V: 36000},
			{Max: 400, Num: 50, V: 48000},
			{Max: 500, Num: 60, V: 60000},
			{Max: 600, Num: 60, V: 72000},
			{Max: 700, Num: 70, V: 84000},
			{Max: 800, Num: 80, V: 96000},
			{Max: 900, Num: 90, V: 108000},
			{Max: 1000, Num: 0, V: 120000},
		},
	},
	{
		StatType:     2,
		ActivateCost: 10,
		Levels: [MaxLevel + 1]levelEntry{
			{Max: 100, Num: 20, V: 4000},
			{Max: 200, Num: 30, V: 8000},
			{Max: 300, Num: 40, V: 12000},
			{Max: 400, Num: 50, V: 16000},
			{Max: 500, Num: 60, V: 20000},
			{Max: 600, Num: 60, V: 24000},
			{Max: 700, Num: 70, V: 28000},
			{Max: 800, Num: 80, V: 32000},
			{Max: 900, Num: 90, V: 36000},
			{Max: 1000, Num: 0, V: 40000},
		},
	},
	{
		StatType:     4,
		ActivateCost: 10,
		Levels: [MaxLevel + 1]levelEntry{
			{Max: 100, Num: 20, V: 3000},
			{Max: 200, Num: 30, V: 6000},
			{Max: 300, Num: 40, V: 9000},
			{Max: 400, Num: 50, V: 12000},
			{Max: 500, Num: 60, V: 15000},
			{Max: 600, Num: 60, V: 18000},
			{Max: 700, Num: 70, V: 21000},
			{Max: 800, Num: 80, V: 24000},
			{Max: 900, Num: 90, V: 27000},
			{Max: 1000, Num: 0, V: 30000},
		},
	},
	{
		StatType:     5,
		ActivateCost: 10,
		Levels: [MaxLevel + 1]levelEntry{
			{Max: 100, Num: 20, V: 2400},
			{Max: 200, Num: 30, V: 4800},
			{Max: 300, Num: 40, V: 7200},
			{Max: 400, Num: 50, V: 9600},
			{Max: 500, Num: 60, V: 12000},
			{Max: 600, Num: 60, V: 14400},
			{Max: 700, Num: 70, V: 16800},
			{Max: 800, Num: 80, V: 19200},
			{Max: 900, Num: 90, V: 21600},
			{Max: 1000, Num: 0, V: 24000},
		},
	},
	{
		StatType:     6,
		ActivateCost: 10,
		Levels: [MaxLevel + 1]levelEntry{
			{Max: 100, Num: 20, V: 9600},
			{Max: 200, Num: 30, V: 19200},
			{Max: 300, Num: 40, V: 28800},
			{Max: 400, Num: 50, V: 38400},
			{Max: 500, Num: 60, V: 48000},
			{Max: 600, Num: 60, V: 57600},
			{Max: 700, Num: 70, V: 67200},
			{Max: 800, Num: 80, V: 76800},
			{Max: 900, Num: 90, V: 86400},
			{Max: 1000, Num: 0, V: 96000},
		},
	},
	{
		StatType:     7,
		ActivateCost: 10,
		Levels: [MaxLevel + 1]levelEntry{
			{Max: 100, Num: 20, V: 9600},
			{Max: 200, Num: 30, V: 19200},
			{Max: 300, Num: 40, V: 28800},
			{Max: 400, Num: 50, V: 38400},
			{Max: 500, Num: 60, V: 48000},
			{Max: 600, Num: 60, V: 57600},
			{Max: 700, Num: 70, V: 67200},
			{Max: 800, Num: 80, V: 76800},
			{Max: 900, Num: 90, V: 86400},
			{Max: 1000, Num: 0, V: 96000},
		},
	},
	{
		StatType:     11,
		ActivateCost: 10,
		Levels: [MaxLevel + 1]levelEntry{
			{Max: 100, Num: 20, V: 1200},
			{Max: 200, Num: 30, V: 2400},
			{Max: 300, Num: 40, V: 3600},
			{Max: 400, Num: 50, V: 4800},
			{Max: 500, Num: 60, V: 6000},
			{Max: 600, Num: 60, V: 7200},
			{Max: 700, Num: 70, V: 8400},
			{Max: 800, Num: 80, V: 9600},
			{Max: 900, Num: 90, V: 10800},
			{Max: 1000, Num: 0, V: 12000},
		},
	},
	{
		StatType:     13,
		ActivateCost: 8,
		Levels: [MaxLevel + 1]levelEntry{
			{Max: 100, Num: 12, V: 1.2},
			{Max: 200, Num: 24, V: 2.4},
			{Max: 300, Num: 32, V: 3.6},
			{Max: 400, Num: 40, V: 4.8},
			{Max: 500, Num: 48, V: 6},
			{Max: 600, Num: 52, V: 7.2},
			{Max: 700, Num: 62, V: 8.4},
			{Max: 800, Num: 70, V: 9.6},
			{Max: 900, Num: 90, V: 10.8},
			{Max: 1000, Num: 0, V: 12},
		},
	},
	{
		StatType:     31,
		ActivateCost: 8,
		Levels: [MaxLevel + 1]levelEntry{
			{Max: 100, Num: 12, V: 1.2},
			{Max: 200, Num: 24, V: 2.4},
			{Max: 300, Num: 32, V: 3.6},
			{Max: 400, Num: 40, V: 4.8},
			{Max: 500, Num: 48, V: 6},
			{Max: 600, Num: 52, V: 7.2},
			{Max: 700, Num: 62, V: 8.4},
			{Max: 800, Num: 70, V: 9.6},
			{Max: 900, Num: 90, V: 10.8},
			{Max: 1000, Num: 0, V: 12},
		},
	},
	{
		StatType:     14,
		ActivateCost: 12,
		Levels: [MaxLevel + 1]levelEntry{
			{Max: 100, Num: 24, V: 0.5},
			{Max: 200, Num: 32, V: 1},
			{Max: 300, Num: 42, V: 1.5},
			{Max: 400, Num: 52, V: 2},
			{Max: 500, Num: 64, V: 2.5},
			{Max: 600, Num: 64, V: 3},
			{Max: 700, Num: 72, V: 3.5},
			{Max: 800, Num: 88, V: 4},
			{Max: 900, Num: 90, V: 4.5},
			{Max: 1000, Num: 0, V: 5},
		},
	},
	{
		StatType:     61,
		ActivateCost: 12,
		Levels: [MaxLevel + 1]levelEntry{
			{Max: 100, Num: 24, V: 0.5},
			{Max: 200, Num: 32, V: 1},
			{Max: 300, Num: 42, V: 1.5},
			{Max: 400, Num: 52, V: 2},
			{Max: 500, Num: 64, V: 2.5},
			{Max: 600, Num: 64, V: 3},
			{Max: 700, Num: 72, V: 3.5},
			{Max: 800, Num: 88, V: 4},
			{Max: 900, Num: 90, V: 4.5},
			{Max: 1000, Num: 0, V: 5},
		},
	},
	{
		StatType:     8,
		ActivateCost: 8,
		Levels: [MaxLevel + 1]levelEntry{
			{Max: 100, Num: 12, V: 1.2},
			{Max: 200, Num: 24, V: 2.4},
			{Max: 300, Num: 32, V: 3.6},
			{Max: 400, Num: 40, V: 4.8},
			{Max: 500, Num: 48, V: 6},
			{Max: 600, Num: 52, V: 7.2},
			{Max: 700, Num: 62, V: 8.4},
			{Max: 800, Num: 70, V: 9.6},
			{Max: 900, Num: 90, V: 10.8},
			{Max: 1000, Num: 0, V: 12},
		},
	},
	{
		StatType:     9,
		ActivateCost: 8,
		Levels: [MaxLevel + 1]levelEntry{
			{Max: 100, Num: 12, V: 1.2},
			{Max: 200, Num: 24, V: 2.4},
			{Max: 300, Num: 32, V: 3.6},
			{Max: 400, Num: 40, V: 4.8},
			{Max: 500, Num: 48, V: 6},
			{Max: 600, Num: 52, V: 7.2},
			{Max: 700, Num: 62, V: 8.4},
			{Max: 800, Num: 70, V: 9.6},
			{Max: 900, Num: 90, V: 10.8},
			{Max: 1000, Num: 0, V: 12},
		},
	},
	{
		StatType:     32,
		ActivateCost: 12,
		Levels: [MaxLevel + 1]levelEntry{
			{Max: 100, Num: 24, V: 1},
			{Max: 200, Num: 32, V: 2},
			{Max: 300, Num: 42, V: 3},
			{Max: 400, Num: 52, V: 4},
			{Max: 500, Num: 64, V: 5},
			{Max: 600, Num: 64, V: 6},
			{Max: 700, Num: 72, V: 7},
			{Max: 800, Num: 88, V: 8},
			{Max: 900, Num: 90, V: 9},
			{Max: 1000, Num: 0, V: 10},
		},
	},
	{
		StatType:     58,
		ActivateCost: 12,
		Levels: [MaxLevel + 1]levelEntry{
			{Max: 100, Num: 24, V: 1},
			{Max: 200, Num: 32, V: 2},
			{Max: 300, Num: 42, V: 3},
			{Max: 400, Num: 52, V: 4},
			{Max: 500, Num: 64, V: 5},
			{Max: 600, Num: 64, V: 6},
			{Max: 700, Num: 72, V: 7},
			{Max: 800, Num: 88, V: 8},
			{Max: 900, Num: 90, V: 9},
			{Max: 1000, Num: 0, V: 10},
		},
	},
	{
		StatType:     72,
		ActivateCost: 8,
		Levels: [MaxLevel + 1]levelEntry{
			{Max: 100, Num: 12, V: 1.2},
			{Max: 200, Num: 24, V: 2.4},
			{Max: 300, Num: 32, V: 3.6},
			{Max: 400, Num: 40, V: 4.8},
			{Max: 500, Num: 48, V: 6},
			{Max: 600, Num: 52, V: 7.2},
			{Max: 700, Num: 62, V: 8.4},
			{Max: 800, Num: 70, V: 9.6},
			{Max: 900, Num: 90, V: 10.8},
			{Max: 1000, Num: 0, V: 12},
		},
	},
}

func validSlot(slot int) bool {
	return slot >= 0 && slot < MaxSlots
}

func validLevel(lv int) bool {
	return lv >= 0 && lv <= MaxLevel
}

func ActivateCost(slot int) (int, bool) {
	if !validSlot(slot) {
		return 0, false
	}
	return slotCatalog[slot].ActivateCost, true
}

func LevelUpCost(slot, lv int) (int, bool) {
	if !validSlot(slot) || !validLevel(lv) {
		return 0, false
	}
	return slotCatalog[slot].Levels[lv].Num, true
}

func SlotMaxAt(lv int) int {
	if lv < 0 {
		return 0
	}
	if lv > MaxLevel {
		lv = MaxLevel
	}
	capacity := (lv + 1) * 100
	if capacity > MaxCapacity {
		return MaxCapacity
	}
	return capacity
}

func SlotStatType(slot int) (int, bool) {
	if !validSlot(slot) {
		return 0, false
	}
	return slotCatalog[slot].StatType, true
}

func SlotStatValue(slot, lv int) (float64, bool) {
	if !validSlot(slot) || !validLevel(lv) {
		return 0, false
	}
	return slotCatalog[slot].Levels[lv].V, true
}
