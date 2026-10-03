// Open-sourced by BaoLT

// Input hardening and validation helpers for the Mystery Furnace exchange sinks.
//
// Holds the shared limits/constants, the allowed score-type allow-list, the md5pass
// charset/length gate, the dict parsers (itemDict -> []int64, scoreDict -> []scoreEntry),
// and the ownership / score tally / deduction helpers. All map keys are parsed as int64
// and all economic values are re-validated server-side before any mutation.
package mysteryexchange

import (
	"fmt"
	"strconv"

	appmystre "mcgame-server/internal/application/mysterytreasure"
	domainitem "mcgame-server/internal/domain/item"
	pkgerrors "mcgame-server/pkg/errors"
)

const (
	maxExchangeDictSize         = 256
	maxMD5PassLen               = 64
	exchangeItemCrystalPerUnit  = 1
	exchangeScoreCrystalPerUnit = 1
)

var allowedScoreTypes = map[int64]struct{}{
	2: {}, 3: {}, 4: {}, 5: {}, 6: {}, 7: {},
	8: {}, 9: {}, 10: {}, 11: {}, 12: {}, 13: {},
	14: {}, 15: {}, 16: {}, 17: {},
}

func validateMD5Pass(s string) error {
	if len(s) == 0 || len(s) > maxMD5PassLen {
		return pkgerrors.ErrInvalidInput
	}
	for i := 0; i < len(s); i++ {
		b := s[i]
		isHex := (b >= '0' && b <= '9') || (b >= 'a' && b <= 'f') || (b >= 'A' && b <= 'F')
		if !isHex {
			return pkgerrors.ErrInvalidInput
		}
	}
	return nil
}

func parseItemDict(raw map[string]interface{}) ([]int64, error) {
	ids := make([]int64, 0, len(raw))
	for k := range raw {
		id, err := strconv.ParseInt(k, 10, 64)
		if err != nil || id <= 0 {
			return nil, pkgerrors.ErrInvalidInput
		}
		ids = append(ids, id)
	}
	return ids, nil
}

type scoreEntry struct {
	scoreType int64
	count     int64
}

func parseScoreDict(raw map[string]interface{}) ([]scoreEntry, error) {
	entries := make([]scoreEntry, 0, len(raw))
	for k, v := range raw {
		st, err := strconv.ParseInt(k, 10, 64)
		if err != nil || st <= 0 {
			return nil, pkgerrors.ErrInvalidInput
		}
		if _, allowed := allowedScoreTypes[st]; !allowed {
			return nil, pkgerrors.ErrInvalidInput
		}
		count, ok := parseCountVal(v)
		if !ok || count < 0 {
			return nil, pkgerrors.ErrInvalidInput
		}
		entries = append(entries, scoreEntry{scoreType: st, count: count})
	}
	return entries, nil
}

func parseCountVal(v interface{}) (int64, bool) {
	switch x := v.(type) {
	case float64:
		return int64(x), true
	case int64:
		return x, true
	case int:
		return int64(x), true
	}
	return 0, false
}

func validateItemOwnership(inventory []*domainitem.Item, itemIDs []int64) (int, error) {
	ownedSet := make(map[int64]bool, len(inventory))
	for _, it := range inventory {
		if it == nil {
			continue
		}
		if it.IsEquipped() || it.IsBound {
			continue
		}
		ownedSet[it.ID] = true
	}
	validCount := 0
	for _, id := range itemIDs {
		if !ownedSet[id] {
			return 0, fmt.Errorf("item %d not owned or is equipped/bound", id)
		}
		validCount++
	}
	return validCount, nil
}

func validateAndTallyScores(st *appmystre.MysteryTreasureState, entries []scoreEntry) (int, error) {
	total := 0
	for _, e := range entries {
		if e.count == 0 {
			continue
		}
		key := strconv.FormatInt(e.scoreType, 10)
		owned := 0
		if st.Scores != nil {
			owned = st.Scores[key]
		}
		if e.count > int64(owned) {
			return 0, fmt.Errorf("score type %d: requested %d but owned %d", e.scoreType, e.count, owned)
		}
		total += int(e.count)
	}
	return total, nil
}

func deductScores(st *appmystre.MysteryTreasureState, entries []scoreEntry) {
	if st.Scores == nil {
		st.Scores = map[string]int{}
	}
	for _, e := range entries {
		if e.count == 0 {
			continue
		}
		key := strconv.FormatInt(e.scoreType, 10)
		st.Scores[key] -= int(e.count)
		if st.Scores[key] <= 0 {
			delete(st.Scores, key)
		}
	}
}
