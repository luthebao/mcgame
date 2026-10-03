// Open-sourced by BaoLT

// Pet Talent (Thiên Phú Pet) persisted state model.
//
// State persists under character_feature_states feature_key='pet_talent' in the
// exact client wire shape consumed by initTalentPanelData / PetTalentPanel so it
// round-trips with no transform:
//
//	{"tal":{"<sid>":<tid>}, "inTal":{"<sid>":<tid>}, "b":{"<bagSlot>":{"t":<tid>,"n":<count>}}}
//
// All keys are stringified ints. sid encoding = page*10000 + slotIndex (pages
// 1-4, slotIndex 1-11): slots 1-9 are upgradeable fixed-attribute talent slots
// (value = TBL_PET_TALENT record id at that level), slots 10-11 are stone-inlay
// sockets (inTal value = id of the inlaid talent-stone record). The bag (b)
// holds talent stones keyed by dense bag slot index.
package pettalent

import "strconv"

const (
	talKey   = "tal"
	inTalKey = "inTal"
	bagKey   = "b"

	sidPageMul   = 10000
	minSlotIndex = 1
	maxSlotIndex = 11
	maxStoneSlot = 11
	minStoneSlot = 10
	maxUpSlot    = 9
	maxSlotLevel = 5
	maxBagSlot   = 320
)

type BagEntry struct {
	T int
	N int
}

type State struct {
	Tal   map[int]int
	InTal map[int]int
	Bag   map[int]BagEntry
}

func defaultState() *State {
	return &State{
		Tal:   map[int]int{},
		InTal: map[int]int{},
		Bag:   map[int]BagEntry{},
	}
}

func stateFromMap(raw map[string]interface{}) *State {
	state := defaultState()
	if len(raw) == 0 {
		return state
	}
	if talRaw, ok := raw[talKey].(map[string]interface{}); ok {
		for k, v := range talRaw {
			sid, err := strconv.Atoi(k)
			if err != nil {
				continue
			}
			if tid, ok := intFrom(v); ok {
				state.Tal[sid] = tid
			}
		}
	}
	if inTalRaw, ok := raw[inTalKey].(map[string]interface{}); ok {
		for k, v := range inTalRaw {
			sid, err := strconv.Atoi(k)
			if err != nil {
				continue
			}
			if tid, ok := intFrom(v); ok {
				state.InTal[sid] = tid
			}
		}
	}
	if bagRaw, ok := raw[bagKey].(map[string]interface{}); ok {
		for k, v := range bagRaw {
			slot, err := strconv.Atoi(k)
			if err != nil {
				continue
			}
			entryMap, ok := v.(map[string]interface{})
			if !ok {
				continue
			}
			entry := BagEntry{}
			if t, ok := intFrom(entryMap["t"]); ok {
				entry.T = t
			}
			if n, ok := intFrom(entryMap["n"]); ok {
				entry.N = n
			}
			if entry.T <= 0 || entry.N <= 0 {
				continue
			}
			state.Bag[slot] = entry
		}
	}
	return state
}

func (s *State) toTal() map[string]interface{} {
	out := make(map[string]interface{}, len(s.Tal))
	for sid, tid := range s.Tal {
		out[strconv.Itoa(sid)] = tid
	}
	return out
}

func (s *State) toInTal() map[string]interface{} {
	out := make(map[string]interface{}, len(s.InTal))
	for sid, tid := range s.InTal {
		out[strconv.Itoa(sid)] = tid
	}
	return out
}

func (s *State) toBag() map[string]interface{} {
	out := make(map[string]interface{}, len(s.Bag))
	for slot, entry := range s.Bag {
		out[strconv.Itoa(slot)] = map[string]interface{}{"t": entry.T, "n": entry.N}
	}
	return out
}

func (s *State) toPersist() map[string]interface{} {
	return map[string]interface{}{
		talKey:   s.toTal(),
		inTalKey: s.toInTal(),
		bagKey:   s.toBag(),
	}
}

func itoa(v int) string {
	return strconv.Itoa(v)
}

func slotIndexOf(sid int) int {
	return sid % sidPageMul
}

func pageOf(sid int) int {
	return sid / sidPageMul
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
