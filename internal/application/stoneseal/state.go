// Open-sourced by BaoLT

// Stone Seal (Ấn Thạch DURRAS) persisted state model + client cost tables.
//
// State persists under character_feature_states feature_key='stone_seal' as
// {"stone": { "<equipSid 1-12>": {"lvl":<int 0-5>, "data": {"s1".."s10": <int>}}}}.
// The login read-path (statfeature.buildStoneSealInfoJSON) emits state["stone"]
// verbatim, so persisting in this shape gives automatic login parity.
//
// Hole value encoding (mirrors the Flash client StoneSealPanel.charFlag):
//   absent key   -> hole not yet bored (locked)
//   EmptyHole(-1)-> hole bored, no stone placed
//   > 0          -> item template id of the seal stone in the hole
//
// Cost tables are copied verbatim from StoneSealBoreCanvas.as. Bore cost is
// indexed by getHoleNumber() = the count of FILLED holes (value > -1), NOT the
// count of bored holes — this is a client quirk faithfully reproduced so the
// server's deducted cost matches the cost the player saw in the bore preview.
// Diamond material (BORE_ITEM_ID=16, color by hole [0,0,1,1,2,2,3,3,4,4]) is
// selected client-side; the server consumes the passed material slot and only
// re-checks it is a diamond.
package stoneseal

import "strconv"

const (
	MinEquipSid  = 1
	MaxEquipSid  = 12
	MinSealIndex = 1
	MaxSealIndex = 10
	MaxSealLevel = 5
	EmptyHole    = -1

	stoneStateKey = "stone"

	PayModeGold      = 1
	PayModeBoreDust  = 2
	PayModeSuccDust  = 3
)

var (
	boreDustCost     = []int{50, 60, 77, 102, 136, 180, 234, 299, 375, 463}
	boreGoldCost     = []int{71, 86, 110, 146, 195, 258, 335, 428, 537, 663}
	succinctDustCost = []int{110, 110, 275, 529, 582}
	succinctGoldCost = []int{157, 157, 390, 751, 826}
)

func costAt(table []int, idx int) int {
	if len(table) == 0 {
		return 0
	}
	if idx < 0 {
		idx = 0
	}
	if idx >= len(table) {
		idx = len(table) - 1
	}
	return table[idx]
}

type StoneEntry struct {
	Lvl  int
	Data map[int]int
}

func newStoneEntry() *StoneEntry {
	return &StoneEntry{Lvl: 0, Data: map[int]int{}}
}

func (e *StoneEntry) filledHoleCount() int {
	n := 0
	for _, v := range e.Data {
		if v > EmptyHole {
			n++
		}
	}
	return n
}

type State struct {
	Slots map[int]*StoneEntry
}

func defaultState() *State {
	return &State{Slots: map[int]*StoneEntry{}}
}

func (s *State) entry(sid int) *StoneEntry {
	if e, ok := s.Slots[sid]; ok && e != nil {
		return e
	}
	e := newStoneEntry()
	s.Slots[sid] = e
	return e
}

func stateFromMap(raw map[string]interface{}) *State {
	state := defaultState()
	if len(raw) == 0 {
		return state
	}
	stoneRaw, ok := raw[stoneStateKey].(map[string]interface{})
	if !ok {
		return state
	}
	for sidKey, entryRaw := range stoneRaw {
		sid, err := strconv.Atoi(sidKey)
		if err != nil {
			continue
		}
		entryMap, ok := entryRaw.(map[string]interface{})
		if !ok {
			continue
		}
		entry := newStoneEntry()
		if lvl, ok := intFrom(entryMap["lvl"]); ok {
			entry.Lvl = lvl
		}
		if dataRaw, ok := entryMap["data"].(map[string]interface{}); ok {
			for holeKey, holeVal := range dataRaw {
				idx, ok := sealIndexFromKey(holeKey)
				if !ok {
					continue
				}
				if v, ok := intFrom(holeVal); ok {
					entry.Data[idx] = v
				}
			}
		}
		state.Slots[sid] = entry
	}
	return state
}

func (s *State) toStone() map[string]interface{} {
	out := make(map[string]interface{}, len(s.Slots))
	for sid, entry := range s.Slots {
		if entry == nil {
			continue
		}
		data := make(map[string]interface{}, len(entry.Data))
		for idx, v := range entry.Data {
			data["s"+strconv.Itoa(idx)] = v
		}
		out[strconv.Itoa(sid)] = map[string]interface{}{
			"lvl":  entry.Lvl,
			"data": data,
		}
	}
	return out
}

func (s *State) toPersist() map[string]interface{} {
	return map[string]interface{}{stoneStateKey: s.toStone()}
}

func sealIndexFromKey(key string) (int, bool) {
	if len(key) < 2 || key[0] != 's' {
		return 0, false
	}
	idx, err := strconv.Atoi(key[1:])
	if err != nil || idx < MinSealIndex || idx > MaxSealIndex {
		return 0, false
	}
	return idx, true
}

func intFrom(v interface{}) (int, bool) {
	switch typed := v.(type) {
	case int:
		return typed, true
	case int32:
		return int(typed), true
	case int64:
		return int(typed), true
	case float32:
		return int(typed), true
	case float64:
		return int(typed), true
	case string:
		n, err := strconv.Atoi(typed)
		if err != nil {
			return 0, false
		}
		return n, true
	}
	return 0, false
}
