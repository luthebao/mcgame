// Open-sourced by BaoLT

package magiccrystal

import "strconv"

const (
	FieldRec   = "magiccystalrec"
	FieldPre   = "magiccystalpre"
	FieldLimit = "magiccystallimit"
)

func encodeCrystals(crystals []Crystal) map[string]interface{} {
	list := make([]interface{}, 0, len(crystals))
	for _, c := range crystals {
		list = append(list, CrystalToMap(c))
	}
	return map[string]interface{}{"crystals": list}
}

func decodeCrystals(state map[string]interface{}) []Crystal {
	out := defaultCrystals()
	if state == nil {
		return out
	}
	raw, ok := state["crystals"].([]interface{})
	if !ok || len(raw) == 0 {
		return out
	}
	for entryIdx, entry := range raw {
		obj, ok := entry.(map[string]interface{})
		if !ok {
			continue
		}
		idx := IntFrom(obj["index"])
		if !validSlot(idx) {
			idx = entryIdx
			if !validSlot(idx) {
				continue
			}
		}
		c := &out[idx]
		c.Index = idx
		if IsSlotActive(obj) {
			c.A = 1
			c.Max = SlotMaxAt(IntFrom(obj["lv"]))
		}
		c.L = IntFrom(obj["l"])
		c.S = IntFrom(obj["s"])
		c.Lv = IntFrom(obj["lv"])
	}
	return out
}

func IsSlotActive(obj map[string]interface{}) bool {
	if v, ok := obj["a"]; ok {
		switch n := v.(type) {
		case int:
			return n != 0
		case int64:
			return n != 0
		case float64:
			return n != 0
		case bool:
			return n
		}
	}
	if v, ok := obj["active"].(bool); ok {
		return v
	}
	return false
}

func IntFrom(v interface{}) int {
	switch n := v.(type) {
	case int:
		return n
	case int64:
		return int(n)
	case float64:
		return int(n)
	}
	return 0
}

func CrystalToMap(c Crystal) map[string]interface{} {
	return map[string]interface{}{
		"index": c.Index,
		"a":     c.A,
		"max":   c.Max,
		"l":     c.L,
		"s":     c.S,
		"lv":    c.Lv,
	}
}

func CrystalsToWire(crystals []Crystal) map[string]interface{} {
	out := make(map[string]interface{}, len(crystals))
	for _, c := range crystals {
		out[strconv.Itoa(c.Index)] = CrystalToMap(c)
	}
	return out
}

func DefaultWire() map[string]interface{} {
	return CrystalsToWire(defaultCrystals())
}

func crystalToInitMap(c Crystal) map[string]interface{} {
	return map[string]interface{}{
		"a":   c.A,
		"l":   c.L,
		"lv":  c.Lv,
		"max": c.Max,
		"s":   c.S,
	}
}

func CrystalsToInitWire(crystals []Crystal, resetTime string) map[string]interface{} {
	out := make(map[string]interface{}, len(crystals)+1)
	for _, c := range crystals {
		out[strconv.Itoa(c.Index)] = crystalToInitMap(c)
	}
	if resetTime == "" {
		resetTime = "0|0|0"
	}
	out["time"] = resetTime
	return out
}

func DefaultInitWire() map[string]interface{} {
	return CrystalsToInitWire(defaultCrystals(), "")
}
