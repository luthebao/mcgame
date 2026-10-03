// Open-sourced by BaoLT

// EffectiveStats is the single flat prop carrier shared by characters, pets, and NPCs.
// Rate props use per-mille scale (see propid.go); absolute props store raw integer values.
package stats

import "maps"

const effectiveStatsInitialCap = 24

type EffectiveStats struct {
	values map[PropID]int64
}

func NewEffectiveStats() EffectiveStats {
	return EffectiveStats{values: make(map[PropID]int64, effectiveStatsInitialCap)}
}

func (e *EffectiveStats) Get(id PropID) int64 {
	if e.values == nil {
		return 0
	}
	return e.values[id]
}

func (e *EffectiveStats) Add(id PropID, v int64) {
	if e.values == nil {
		e.values = make(map[PropID]int64, effectiveStatsInitialCap)
	}
	e.values[id] += v
}

func (e *EffectiveStats) Set(id PropID, v int64) {
	if e.values == nil {
		e.values = make(map[PropID]int64, effectiveStatsInitialCap)
	}
	e.values[id] = v
}

func (e *EffectiveStats) All() map[PropID]int64 {
	if e.values == nil {
		return map[PropID]int64{}
	}
	return maps.Clone(e.values)
}
