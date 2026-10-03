// Open-sourced by BaoLT

// PRS — "Chân Hồn Thần Thú" (Pet Real Soul) — persisted panel state.
//
// State persists under character_feature_states feature_key='prs' as:
//
//	{tid, actArr, actLimitObj, useSid, useId, chipBag, excBag, isShow}
//
// The login read-path (statfeature.buildPRSInfoJSON) emits tid/actArr/actLimitObj/
// useSid/chipBag/excBag/isShow into cData.prsInfo, and the separate "useId" key into
// the cData.prsUseId scalar — so persisting in this shape gives automatic parity with
// no auth/login change. useSid and useId are kept identical (the equipped divine-form
// show id, mirrored for world rendering via onReplacePRSShow).
//
//	tid          string  current soul-tree node (TBL_PRS_TREE=125), "0" = none
//	actArr       {idx -> showId}      permanently-activated divine forms
//	actLimitObj  {showId -> expiryMs} time-limited activated forms
//	useSid/useId int     equipped showId (0 = none)
//	chipBag      {pos -> {chipId,chipNum}}  chip fragments (TBL_PRS_CHIP=127)
//	excBag       {pos(1-3) -> {chipId,chipNum}}  exchange staging slots
//	isShow       int     client never reads it; preserved verbatim
//
// Server-only gate (NOT in the login read whitelist buildPRSInfoJSON, so it never
// reaches the client and never affects login parity):
//
//	freeCollect  {day:"YYYY-MM-DD", n:<count>}  free-collect daily-count gate
package prs

import "strconv"

const (
	excBagSlots = 3
	defaultTid  = "0"
)

type ChipSlot struct {
	ChipID  int
	ChipNum int
}

type State struct {
	Tid            string
	ActArr         map[int]int
	ActLimitObj    map[int]int64
	UseSid         int
	UseID          int
	ChipBag        map[int]ChipSlot
	ExcBag         map[int]ChipSlot
	IsShow         int
	FreeCollectDay string
	FreeCollectN   int
}

func defaultState() *State {
	return &State{
		Tid:         defaultTid,
		ActArr:      map[int]int{},
		ActLimitObj: map[int]int64{},
		ChipBag:     map[int]ChipSlot{},
		ExcBag:      map[int]ChipSlot{},
	}
}

func stateFromMap(raw map[string]interface{}) *State {
	state := defaultState()
	if len(raw) == 0 {
		return state
	}
	if v, ok := raw["tid"].(string); ok && v != "" {
		state.Tid = v
	} else if n, ok := intFrom(raw["tid"]); ok {
		state.Tid = strconv.Itoa(n)
	}
	if m, ok := raw["actArr"].(map[string]interface{}); ok {
		for key, val := range m {
			idx, err := strconv.Atoi(key)
			if err != nil {
				continue
			}
			if showID, ok := intFrom(val); ok {
				state.ActArr[idx] = showID
			}
		}
	}
	if m, ok := raw["actLimitObj"].(map[string]interface{}); ok {
		for key, val := range m {
			showID, err := strconv.Atoi(key)
			if err != nil {
				continue
			}
			if exp, ok := int64From(val); ok {
				state.ActLimitObj[showID] = exp
			}
		}
	}
	if v, ok := intFrom(raw["useSid"]); ok {
		state.UseSid = v
	}
	if v, ok := intFrom(raw["useId"]); ok {
		state.UseID = v
	}
	state.ChipBag = chipBagFromMap(raw["chipBag"])
	state.ExcBag = chipBagFromMap(raw["excBag"])
	if v, ok := intFrom(raw["isShow"]); ok {
		state.IsShow = v
	}
	if m, ok := raw["freeCollect"].(map[string]interface{}); ok {
		if v, ok := m["day"].(string); ok {
			state.FreeCollectDay = v
		}
		if v, ok := intFrom(m["n"]); ok {
			state.FreeCollectN = v
		}
	}
	return state
}

func chipBagFromMap(raw interface{}) map[int]ChipSlot {
	bag := map[int]ChipSlot{}
	m, ok := raw.(map[string]interface{})
	if !ok {
		return bag
	}
	for key, val := range m {
		pos, err := strconv.Atoi(key)
		if err != nil {
			continue
		}
		slotMap, ok := val.(map[string]interface{})
		if !ok {
			continue
		}
		slot := ChipSlot{}
		if v, ok := intFrom(slotMap["chipId"]); ok {
			slot.ChipID = v
		}
		if v, ok := intFrom(slotMap["chipNum"]); ok {
			slot.ChipNum = v
		}
		if slot.ChipID > 0 && slot.ChipNum > 0 {
			bag[pos] = slot
		}
	}
	return bag
}

func (s *State) toWire() map[string]interface{} {
	return map[string]interface{}{
		"tid":         s.Tid,
		"actArr":      intMapToWire(s.ActArr),
		"actLimitObj": int64MapToWire(s.ActLimitObj),
		"useSid":      s.UseSid,
		"chipBag":     chipBagToWire(s.ChipBag),
		"excBag":      chipBagToWire(s.ExcBag),
		"isShow":      s.IsShow,
	}
}

func (s *State) toPersist() map[string]interface{} {
	out := s.toWire()
	out["useId"] = s.UseID
	if s.FreeCollectDay != "" || s.FreeCollectN > 0 {
		out["freeCollect"] = map[string]interface{}{
			"day": s.FreeCollectDay,
			"n":   s.FreeCollectN,
		}
	}
	return out
}

func (s *State) Wire() map[string]interface{} { return s.toWire() }

func (s *State) ChipBagWire() map[string]interface{} { return chipBagToWire(s.ChipBag) }

func (s *State) ExcBagWire() map[string]interface{} { return chipBagToWire(s.ExcBag) }

func intMapToWire(m map[int]int) map[string]interface{} {
	out := make(map[string]interface{}, len(m))
	for k, v := range m {
		out[strconv.Itoa(k)] = v
	}
	return out
}

func int64MapToWire(m map[int]int64) map[string]interface{} {
	out := make(map[string]interface{}, len(m))
	for k, v := range m {
		out[strconv.Itoa(k)] = v
	}
	return out
}

func chipBagToWire(bag map[int]ChipSlot) map[string]interface{} {
	out := make(map[string]interface{}, len(bag))
	for pos, slot := range bag {
		out[strconv.Itoa(pos)] = map[string]interface{}{
			"chipId":  slot.ChipID,
			"chipNum": slot.ChipNum,
		}
	}
	return out
}

func (s *State) hasActivated(showID int) bool {
	for _, v := range s.ActArr {
		if v == showID {
			return true
		}
	}
	_, limited := s.ActLimitObj[showID]
	return limited
}

func (s *State) nextActArrIndex() int {
	idx := 0
	for k := range s.ActArr {
		if k >= idx {
			idx = k + 1
		}
	}
	return idx
}

func firstFreeChipPos(bag map[int]ChipSlot, max int) int {
	for pos := 1; pos <= max; pos++ {
		if _, taken := bag[pos]; !taken {
			return pos
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

func int64From(v interface{}) (int64, bool) {
	switch typed := v.(type) {
	case int:
		return int64(typed), true
	case int32:
		return int64(typed), true
	case int64:
		return typed, true
	case float32:
		return int64(typed), true
	case float64:
		return int64(typed), true
	case string:
		n, err := strconv.ParseInt(typed, 10, 64)
		if err != nil {
			return 0, false
		}
		return n, true
	}
	return 0, false
}
