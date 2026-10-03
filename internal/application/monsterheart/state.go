// Open-sourced by BaoLT

// Monster Heart state domain model: bag groups, hole occupancy, combine state, and box levels.
package monsterheart

const (
	BoxCount  = 5
	HoleCount = 7

	EmptySlot = -1
)

var validBagCategories = map[string]struct{}{
	"ren":  {},
	"shou": {},
	"zhi":  {},
	"mo":   {},
	"ji":   {},
	"lon":  {},
	"te":   {},
}

var validBoxes = map[int]struct{}{
	1: {},
	2: {},
	3: {},
	4: {},
	5: {},
}

var validHoles = map[int]struct{}{
	1: {},
	2: {},
	3: {},
	4: {},
	5: {},
	6: {},
	7: {},
}

type BagEntry struct {
	ItemID int
	N      int
}

type CombineEntry struct {
	Color  int
	Talent int
}

type State struct {
	Bag           map[string]map[int]BagEntry
	HadActHole    map[int]map[int]int
	HadActCombine map[int]map[int]CombineEntry
	HeartBoxLev   map[int]int
}

func NewState() *State {
	bag := make(map[string]map[int]BagEntry, len(validBagCategories))
	for cat := range validBagCategories {
		bag[cat] = make(map[int]BagEntry)
	}

	hadActHole := make(map[int]map[int]int, BoxCount)
	for box := 1; box <= BoxCount; box++ {
		hadActHole[box] = make(map[int]int, HoleCount)
		for hole := 1; hole <= HoleCount; hole++ {
			hadActHole[box][hole] = EmptySlot
		}
	}

	hadActCombine := make(map[int]map[int]CombineEntry, BoxCount)
	for box := 1; box <= BoxCount; box++ {
		hadActCombine[box] = make(map[int]CombineEntry)
	}

	heartBoxLev := make(map[int]int, BoxCount)
	for box := 1; box <= BoxCount; box++ {
		heartBoxLev[box] = 0
	}

	return &State{
		Bag:           bag,
		HadActHole:    hadActHole,
		HadActCombine: hadActCombine,
		HeartBoxLev:   heartBoxLev,
	}
}

func (s *State) Encode() map[string]interface{} {
	bag := make(map[string]interface{}, len(s.Bag))
	for cat, entries := range s.Bag {
		catMap := make(map[string]interface{}, len(entries))
		for itemID, entry := range entries {
			key := intKey(itemID)
			catMap[key] = map[string]interface{}{
				"itemId": entry.ItemID,
				"n":      entry.N,
			}
		}
		bag[cat] = catMap
	}

	hadActHole := make(map[string]interface{}, BoxCount)
	for box, holes := range s.HadActHole {
		holeMap := make(map[string]interface{}, HoleCount)
		for hole, itemID := range holes {
			holeMap[intKey(hole)] = itemID
		}
		hadActHole[intKey(box)] = holeMap
	}

	hadActCombine := make(map[string]interface{}, BoxCount)
	for box, items := range s.HadActCombine {
		itemMap := make(map[string]interface{}, len(items))
		for itemID, entry := range items {
			itemMap[intKey(itemID)] = map[string]interface{}{
				"color":  entry.Color,
				"talent": entry.Talent,
			}
		}
		hadActCombine[intKey(box)] = itemMap
	}

	heartBoxLev := make(map[string]interface{}, BoxCount)
	for box, lev := range s.HeartBoxLev {
		heartBoxLev[intKey(box)] = lev
	}

	return map[string]interface{}{
		"bag": bag,
		"data": map[string]interface{}{
			"hadActCombine": hadActCombine,
			"hadActHole":    hadActHole,
			"heartBoxLev":   heartBoxLev,
		},
	}
}

func DecodeState(raw map[string]interface{}) *State {
	s := NewState()

	bagRaw, _ := raw["bag"].(map[string]interface{})
	for cat := range validBagCategories {
		catRaw, _ := bagRaw[cat].(map[string]interface{})
		for _, entryRaw := range catRaw {
			entry, _ := entryRaw.(map[string]interface{})
			itemID := anyInt(entry["itemId"])
			n := anyInt(entry["n"])
			if itemID > 0 {
				s.Bag[cat][itemID] = BagEntry{ItemID: itemID, N: n}
			}
		}
	}

	dataRaw, _ := raw["data"].(map[string]interface{})

	holeRaw, _ := dataRaw["hadActHole"].(map[string]interface{})
	for boxKey, holesRaw := range holeRaw {
		box := parseIntKey(boxKey)
		if _, ok := validBoxes[box]; !ok {
			continue
		}
		holes, _ := holesRaw.(map[string]interface{})
		if s.HadActHole[box] == nil {
			s.HadActHole[box] = make(map[int]int, HoleCount)
		}
		for holeKey, itemIDRaw := range holes {
			hole := parseIntKey(holeKey)
			if _, ok := validHoles[hole]; !ok {
				continue
			}
			s.HadActHole[box][hole] = anyInt(itemIDRaw)
		}
	}

	combineRaw, _ := dataRaw["hadActCombine"].(map[string]interface{})
	for boxKey, itemsRaw := range combineRaw {
		box := parseIntKey(boxKey)
		if _, ok := validBoxes[box]; !ok {
			continue
		}
		items, _ := itemsRaw.(map[string]interface{})
		if s.HadActCombine[box] == nil {
			s.HadActCombine[box] = make(map[int]CombineEntry)
		}
		for itemKey, entryRaw := range items {
			itemID := parseIntKey(itemKey)
			if itemID <= 0 {
				continue
			}
			entry, _ := entryRaw.(map[string]interface{})
			s.HadActCombine[box][itemID] = CombineEntry{
				Color:  anyInt(entry["color"]),
				Talent: anyInt(entry["talent"]),
			}
		}
	}

	levRaw, _ := dataRaw["heartBoxLev"].(map[string]interface{})
	for boxKey, levVal := range levRaw {
		box := parseIntKey(boxKey)
		if _, ok := validBoxes[box]; !ok {
			continue
		}
		s.HeartBoxLev[box] = anyInt(levVal)
	}

	return s
}

func (s *State) BagItemCount(itemID int) int {
	total := 0
	for _, entries := range s.Bag {
		if entry, ok := entries[itemID]; ok {
			total += entry.N
		}
	}
	return total
}

func (s *State) BagContains(itemID int) bool {
	for _, entries := range s.Bag {
		if _, ok := entries[itemID]; ok {
			return ok
		}
	}
	return false
}

func (s *State) CategoryOf(itemID int) (string, bool) {
	for cat, entries := range s.Bag {
		if _, ok := entries[itemID]; ok {
			return cat, true
		}
	}
	return "", false
}

func (s *State) PlaceInHole(box, hole, itemID int) {
	if s.HadActHole[box] == nil {
		s.HadActHole[box] = make(map[int]int, HoleCount)
	}
	s.HadActHole[box][hole] = itemID
}

func (s *State) ClearHole(box, hole int) int {
	if s.HadActHole[box] == nil {
		return EmptySlot
	}
	prev := s.HadActHole[box][hole]
	s.HadActHole[box][hole] = EmptySlot
	return prev
}

func (s *State) GetHoleItem(box, hole int) int {
	if s.HadActHole[box] == nil {
		return EmptySlot
	}
	v, ok := s.HadActHole[box][hole]
	if !ok {
		return EmptySlot
	}
	return v
}
