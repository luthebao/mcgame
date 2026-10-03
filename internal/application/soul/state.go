// Open-sourced by BaoLT

// SoulState persists the Soul Gem (Mệnh Hồn) feature. Char-side soul slots live
// under character_feature_states feature_key='soul'; per-pet soul slots live under
// the pet feature-state table feature_key='pet_soul'. A slot holds one gem
// {sid (TBL_PET_SOUL row), exp (accumulated soul exp poured in), lock}. soulId is a
// client alias of sid. The wire `s` field is the slot index for char slots and
// slot+petSoulWireOffset for pet slots (the client strips the offset back off).
// soulExp / chip (soulChip) are character-level currencies (char.SoulExp /
// char.SoulPoints) and are NOT stored here.
//
// TempBag is the preySoul holding area (login top-level tempSoulData →
// player.soulTempBag): a flat map of temp-slot index → rolled pet_soul id, awaiting a
// putSoulToBag move into a real char soul-bag slot. It persists in ToMap and emits via
// TempBagWire so a relog restores any un-banked preySoul rolls.
package soul

const (
	petSoulWireOffset = 100
	maxCharSoulSlots  = 16
	maxTempSoulSlots  = 14
)

type SoulSlot struct {
	Sid  int
	Exp  int64
	Lock bool
}

type CharSoulState struct {
	Open       int
	Slots      map[int]SoulSlot
	CrystalSid int
	TempBag    map[int]int
}

type PetSoulState struct {
	OpenNum  int
	OpenNum2 int
	Slots    map[int]SoulSlot
}

func defaultCharSoulState() *CharSoulState {
	return &CharSoulState{Open: 0, Slots: map[int]SoulSlot{}, TempBag: map[int]int{}}
}

func defaultPetSoulState() *PetSoulState {
	return &PetSoulState{OpenNum: 0, OpenNum2: 0, Slots: map[int]SoulSlot{}}
}

func slotWire(idx int, slot SoulSlot, wireOffset int) map[string]any {
	return map[string]any{
		"s":      idx + wireOffset,
		"sid":    slot.Sid,
		"soulId": slot.Sid,
		"exp":    slot.Exp,
		"lock":   slot.Lock,
	}
}

func slotsToData(slots map[int]SoulSlot, wireOffset int) map[string]any {
	data := make(map[string]any, len(slots))
	for idx, slot := range slots {
		data[formatInt(idx)] = slotWire(idx, slot, wireOffset)
	}
	return data
}

func slotsFromData(v any) map[int]SoulSlot {
	out := map[int]SoulSlot{}
	raw, ok := v.(map[string]any)
	if !ok {
		return out
	}
	for key, val := range raw {
		m, ok := val.(map[string]any)
		if !ok {
			continue
		}
		idx := parseInt(key)
		if idx <= 0 {
			continue
		}
		out[idx] = SoulSlot{
			Sid:  intFrom(m["sid"]),
			Exp:  int64From(m["exp"]),
			Lock: boolFrom(m["lock"]),
		}
	}
	return out
}

func tempBagToWire(bag map[int]int) map[string]any {
	out := make(map[string]any, len(bag))
	for idx, ii := range bag {
		if idx <= 0 || ii <= 0 {
			continue
		}
		out[formatInt(idx)] = ii
	}
	return out
}

func tempBagFromWire(v any) map[int]int {
	out := map[int]int{}
	raw, ok := v.(map[string]any)
	if !ok {
		return out
	}
	for key, val := range raw {
		idx := parseInt(key)
		ii := intFrom(val)
		if idx <= 0 || ii <= 0 {
			continue
		}
		out[idx] = ii
	}
	return out
}

func (s *CharSoulState) ToMap() map[string]any {
	return map[string]any{
		"open":         s.Open,
		"data":         slotsToData(s.Slots, 0),
		"crystalSid":   s.CrystalSid,
		"tempSoulData": tempBagToWire(s.TempBag),
	}
}

func (s *CharSoulState) LoginObj() map[string]any {
	return map[string]any{
		"open": s.Open,
		"data": slotsToData(s.Slots, 0),
	}
}

func (s *CharSoulState) TempBagWire() map[string]any {
	return tempBagToWire(s.TempBag)
}

func charSoulStateFromMap(m map[string]any) *CharSoulState {
	state := defaultCharSoulState()
	if m == nil {
		return state
	}
	state.Open = intFrom(m["open"])
	state.Slots = slotsFromData(m["data"])
	state.CrystalSid = intFrom(m["crystalSid"])
	state.TempBag = tempBagFromWire(m["tempSoulData"])
	return state
}

func (s *PetSoulState) ToMap() map[string]any {
	return map[string]any{
		"openNum":  s.OpenNum,
		"openNum2": s.OpenNum2,
		"data":     slotsToData(s.Slots, 0),
	}
}

func (s *PetSoulState) LoginObj() map[string]any {
	return map[string]any{
		"openNum":  s.OpenNum,
		"openNum2": s.OpenNum2,
		"data":     slotsToData(s.Slots, petSoulWireOffset),
	}
}

func petSoulStateFromMap(m map[string]any) *PetSoulState {
	state := defaultPetSoulState()
	if m == nil {
		return state
	}
	state.OpenNum = intFrom(m["openNum"])
	state.OpenNum2 = intFrom(m["openNum2"])
	state.Slots = slotsFromData(m["data"])
	return state
}
