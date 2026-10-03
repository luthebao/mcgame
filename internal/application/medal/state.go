// Open-sourced by BaoLT

// Medal (Ấn Chương) persisted panel state.
//
// State persists under character_feature_states feature_key='medal' as:
//
//	{"exp":int, "bag":{"<slot>":{"i":int,"t":int,"n":int}},
//	 "petBuff":{"t":int}, "charBuff":{"t":int}, "checkFlag":bool}
//
// The login read-path (statfeature.buildMedalInfoJSON) reads exp->medalExp,
// bag->medalBag, petBuff, charBuff, checkFlag in exactly this shape, so persisting
// here gives automatic login parity with no auth/login change.
//
// medalBag holds the medal inventory at integer keys 1..600 (the client only
// displays keys <= 320, MEDAL_BAG_MAX_ID=600) AND the equip slots at keys
// 1001-1005 (pet) / 2001-2005 (char). Each entry is {i:<slot index>, t:<TBL_MEDAL
// template id>, n:<count>}; the "i" field mirrors the map key. The two active
// engrave slots 1006 (pet) / 2006 (char) are NOT stored as bag entries — they are
// driven by petBuff.t / charBuff.t respectively (client setPetJoinSlot/setJoinSlot).
// checkFlag is server-only (the client never reads it); it is preserved verbatim
// and defaults to false.
package medal

import "strconv"

const (
	expStateKey       = "exp"
	bagStateKey       = "bag"
	petBuffStateKey   = "petBuff"
	charBuffStateKey  = "charBuff"
	checkFlagStateKey = "checkFlag"

	bagMaxID      = 600
	bagDisplayCap = 320

	petEquipMin = 1001
	petEquipMax = 1005
	petEngrave  = 1006

	charEquipMin = 2001
	charEquipMax = 2005
	charEngrave  = 2006

	moveTypeChar = 1
	moveTypePet  = 2
)

type BagEntry struct {
	I int
	T int
	N int
}

type State struct {
	Exp       int
	Bag       map[int]BagEntry
	PetBuffT  int
	CharBuffT int
	CheckFlag bool
}

func defaultState() *State {
	return &State{Bag: map[int]BagEntry{}}
}

func stateFromMap(raw map[string]interface{}) *State {
	state := defaultState()
	if len(raw) == 0 {
		return state
	}
	if v, ok := intFrom(raw[expStateKey]); ok {
		state.Exp = v
	}
	if bag, ok := raw[bagStateKey].(map[string]interface{}); ok {
		for key, val := range bag {
			slot, err := strconv.Atoi(key)
			if err != nil {
				continue
			}
			entry, ok := bagEntryFrom(val)
			if !ok {
				continue
			}
			entry.I = slot
			state.Bag[slot] = entry
		}
	}
	state.PetBuffT = buffTFrom(raw[petBuffStateKey])
	state.CharBuffT = buffTFrom(raw[charBuffStateKey])
	if b, ok := raw[checkFlagStateKey].(bool); ok {
		state.CheckFlag = b
	}
	return state
}

func bagEntryFrom(val interface{}) (BagEntry, bool) {
	m, ok := val.(map[string]interface{})
	if !ok {
		return BagEntry{}, false
	}
	entry := BagEntry{}
	if v, ok := intFrom(m["i"]); ok {
		entry.I = v
	}
	if v, ok := intFrom(m["t"]); ok {
		entry.T = v
	}
	if v, ok := intFrom(m["n"]); ok {
		entry.N = v
	}
	if entry.T <= 0 || entry.N <= 0 {
		return BagEntry{}, false
	}
	return entry, true
}

func buffTFrom(val interface{}) int {
	m, ok := val.(map[string]interface{})
	if !ok {
		return 0
	}
	if v, ok := intFrom(m["t"]); ok {
		return v
	}
	return 0
}

func (s *State) bagToWire() map[string]interface{} {
	out := make(map[string]interface{}, len(s.Bag))
	for slot, entry := range s.Bag {
		out[strconv.Itoa(slot)] = entryToWire(entry)
	}
	return out
}

func entryToWire(entry BagEntry) map[string]interface{} {
	return map[string]interface{}{
		"i": entry.I,
		"t": entry.T,
		"n": entry.N,
	}
}

func (s *State) toPersist() map[string]interface{} {
	return map[string]interface{}{
		expStateKey:       s.Exp,
		bagStateKey:       s.bagToWire(),
		petBuffStateKey:   map[string]interface{}{"t": s.PetBuffT},
		charBuffStateKey:  map[string]interface{}{"t": s.CharBuffT},
		checkFlagStateKey: s.CheckFlag,
	}
}

func (s *State) infoWire() map[string]interface{} {
	return map[string]interface{}{
		"medalExp": s.Exp,
		"medalBag": s.bagToWire(),
		"petBuff":  map[string]interface{}{"t": s.PetBuffT},
		"charBuff": map[string]interface{}{"t": s.CharBuffT},
	}
}

func isPetEquip(sid int) bool  { return sid >= petEquipMin && sid <= petEquipMax }
func isCharEquip(sid int) bool { return sid >= charEquipMin && sid <= charEquipMax }
func isEquipSlot(sid int) bool { return isPetEquip(sid) || isCharEquip(sid) }
func isInventory(sid int) bool { return sid >= 1 && sid <= bagMaxID }

func (s *State) firstFreeInventorySlot() int {
	for i := 1; i <= bagMaxID; i++ {
		if _, taken := s.Bag[i]; !taken {
			return i
		}
	}
	return 0
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
