// Open-sourced by BaoLT

// Pet Stone (Tụ Linh Bảo Thạch) persisted state models.
//
// Two feature_states rows back this feature:
//
//	feature_key='pet_stone'       -> the per-character stone bag.
//	feature_key='pet_stone_inlay' -> the per-equipment-instance inlay map.
//
// Bag persists as {"b": {"<slot>": {"g":giid, "n":stackNum, "s":skillId}}} and
// is rendered to the wire as a sparse Array where element[slot] =
// [giid, stackNum, skillId] (slot index -> array index). Empty array slots are
// emitted as null so the slot indices line up with the client's expectations.
//
// Inlay persists as {"<equGiid>": {"<slot 1-6>": <stoneGiid>}}. Slot 1 is the
// energy (Tụ Linh) slot; the skill bound to an inlaid energy stone is carried on
// the corresponding bag entry's skillId before inlay, but inlaid stones keep only
// the template id here — full equipment-instance integration is deferred, so the
// inlay map stores the stone template id (giid) per slot.
package petstone

import "strconv"

const (
	bagStateKey = "b"

	MinInlaySlot  = 1
	MaxInlaySlot  = 6
	EnergySlot    = 1
	MaxStoneLevel = 5
)

type BagEntry struct {
	Giid     int
	StackNum int
	SkillID  int
}

type BagState struct {
	Slots map[int]*BagEntry
}

func defaultBagState() *BagState {
	return &BagState{Slots: map[int]*BagEntry{}}
}

func bagStateFromMap(raw map[string]interface{}) *BagState {
	state := defaultBagState()
	if len(raw) == 0 {
		return state
	}
	bagRaw, ok := raw[bagStateKey].(map[string]interface{})
	if !ok {
		return state
	}
	for slotKey, entryRaw := range bagRaw {
		slot, err := strconv.Atoi(slotKey)
		if err != nil || slot < 0 {
			continue
		}
		entryMap, ok := entryRaw.(map[string]interface{})
		if !ok {
			continue
		}
		entry := &BagEntry{}
		if v, ok := intFrom(entryMap["g"]); ok {
			entry.Giid = v
		}
		if v, ok := intFrom(entryMap["n"]); ok {
			entry.StackNum = v
		}
		if v, ok := intFrom(entryMap["s"]); ok {
			entry.SkillID = v
		}
		if entry.Giid <= 0 || entry.StackNum <= 0 {
			continue
		}
		state.Slots[slot] = entry
	}
	return state
}

func (s *BagState) toPersist() map[string]interface{} {
	bag := make(map[string]interface{}, len(s.Slots))
	for slot, entry := range s.Slots {
		if entry == nil || entry.Giid <= 0 || entry.StackNum <= 0 {
			continue
		}
		bag[strconv.Itoa(slot)] = map[string]interface{}{
			"g": entry.Giid,
			"n": entry.StackNum,
			"s": entry.SkillID,
		}
	}
	return map[string]interface{}{bagStateKey: bag}
}

func (s *BagState) maxSlot() int {
	max := -1
	for slot, entry := range s.Slots {
		if entry == nil || entry.Giid <= 0 || entry.StackNum <= 0 {
			continue
		}
		if slot > max {
			max = slot
		}
	}
	return max
}

func (s *BagState) toArray() []interface{} {
	max := s.maxSlot()
	out := make([]interface{}, max+1)
	for slot, entry := range s.Slots {
		if entry == nil || entry.Giid <= 0 || entry.StackNum <= 0 || slot > max {
			continue
		}
		out[slot] = []interface{}{entry.Giid, entry.StackNum, entry.SkillID}
	}
	return out
}

func (s *BagState) freeSlot() int {
	slot := 0
	for {
		if e, ok := s.Slots[slot]; !ok || e == nil || e.Giid <= 0 || e.StackNum <= 0 {
			return slot
		}
		slot++
	}
}

func (s *BagState) addStone(giid, count, skillID int) int {
	if skillID == 0 {
		for slot, entry := range s.Slots {
			if entry != nil && entry.Giid == giid && entry.SkillID == 0 && entry.StackNum > 0 {
				entry.StackNum += count
				return slot
			}
		}
	}
	slot := s.freeSlot()
	s.Slots[slot] = &BagEntry{Giid: giid, StackNum: count, SkillID: skillID}
	return slot
}

func (s *BagState) removeFromSlot(slot, count int) bool {
	entry, ok := s.Slots[slot]
	if !ok || entry == nil || entry.StackNum < count {
		return false
	}
	entry.StackNum -= count
	if entry.StackNum <= 0 {
		delete(s.Slots, slot)
	}
	return true
}

type InlayState struct {
	Equip map[int64]map[int]int
}

func defaultInlayState() *InlayState {
	return &InlayState{Equip: map[int64]map[int]int{}}
}

func inlayStateFromMap(raw map[string]interface{}) *InlayState {
	state := defaultInlayState()
	for equKey, slotsRaw := range raw {
		equGiid, err := strconv.ParseInt(equKey, 10, 64)
		if err != nil {
			continue
		}
		slotsMap, ok := slotsRaw.(map[string]interface{})
		if !ok {
			continue
		}
		slots := map[int]int{}
		for slotKey, stoneRaw := range slotsMap {
			slot, err := strconv.Atoi(slotKey)
			if err != nil || slot < MinInlaySlot || slot > MaxInlaySlot {
				continue
			}
			if v, ok := intFrom(stoneRaw); ok && v > 0 {
				slots[slot] = v
			}
		}
		if len(slots) > 0 {
			state.Equip[equGiid] = slots
		}
	}
	return state
}

func (s *InlayState) toPersist() map[string]interface{} {
	out := make(map[string]interface{}, len(s.Equip))
	for equGiid, slots := range s.Equip {
		if len(slots) == 0 {
			continue
		}
		slotMap := make(map[string]interface{}, len(slots))
		for slot, stone := range slots {
			if stone <= 0 {
				continue
			}
			slotMap[strconv.Itoa(slot)] = stone
		}
		if len(slotMap) > 0 {
			out[strconv.FormatInt(equGiid, 10)] = slotMap
		}
	}
	return out
}

func (s *InlayState) slots(equGiid int64) map[int]int {
	if m, ok := s.Equip[equGiid]; ok && m != nil {
		return m
	}
	m := map[int]int{}
	s.Equip[equGiid] = m
	return m
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
