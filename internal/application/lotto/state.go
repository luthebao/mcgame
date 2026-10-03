// Open-sourced by BaoLT

// LottoState persists the three lottery holding-bags (Wish Tree "lotto", "lottery",
// and "luckDraw") under character_feature_states feature_key='lotto'. Each bag holds
// won-but-unclaimed reward entries {ti(table id), ii(template id), n(count), q(quality),
// b(bound)}; the client claims them into the main inventory via the getSingle/getAll
// RPCs. Login emits only the bag counts (lotooBagLength/lotteryBagLength); contents are
// fetched lazily via getLottoBag.
package lotto

import "strconv"

func formatInt(v int64) string {
	return strconv.FormatInt(v, 10)
}

func parseInt(s string) int {
	n, _ := strconv.Atoi(s)
	return n
}

const (
	BagLotto    = "lotto"
	BagLottery  = "lottery"
	BagLuckDraw = "luckDraw"
)

type LottoEntry struct {
	Ti string
	Ii string
	Q  string
	N  int
	B  int
}

func (e LottoEntry) toMap() map[string]any {
	return map[string]any{"ti": e.Ti, "ii": e.Ii, "n": e.N, "b": e.B, "q": e.Q}
}

type LottoState struct {
	Lotto       []LottoEntry
	Lottery     []LottoEntry
	LuckDraw    []LottoEntry
	FreeWishN   int
	FreeWishDay string
}

func defaultLottoState() *LottoState {
	return &LottoState{
		Lotto:    []LottoEntry{},
		Lottery:  []LottoEntry{},
		LuckDraw: []LottoEntry{},
	}
}

func (s *LottoState) bag(kind string) *[]LottoEntry {
	switch kind {
	case BagLottery:
		return &s.Lottery
	case BagLuckDraw:
		return &s.LuckDraw
	default:
		return &s.Lotto
	}
}

func (s *LottoState) ToMap() map[string]any {
	return map[string]any{
		"lotto":       entriesToList(s.Lotto),
		"lottery":     entriesToList(s.Lottery),
		"luckDraw":    entriesToList(s.LuckDraw),
		"freeWishN":   s.FreeWishN,
		"freeWishDay": s.FreeWishDay,
	}
}

func entriesToList(entries []LottoEntry) []any {
	out := make([]any, 0, len(entries))
	for _, e := range entries {
		out = append(out, e.toMap())
	}
	return out
}

func lottoStateFromMap(m map[string]any) *LottoState {
	state := defaultLottoState()
	if m == nil {
		return state
	}
	state.Lotto = entriesFromAny(m["lotto"])
	state.Lottery = entriesFromAny(m["lottery"])
	state.LuckDraw = entriesFromAny(m["luckDraw"])
	state.FreeWishN = asInt(m["freeWishN"])
	state.FreeWishDay = asString(m["freeWishDay"])
	return state
}

func entriesFromAny(v any) []LottoEntry {
	raw, ok := v.([]any)
	if !ok {
		return []LottoEntry{}
	}
	out := make([]LottoEntry, 0, len(raw))
	for _, item := range raw {
		if m, ok := item.(map[string]any); ok {
			out = append(out, entryFromMap(m))
		}
	}
	return out
}

func entryFromMap(m map[string]any) LottoEntry {
	return LottoEntry{
		Ti: asString(m["ti"]),
		Ii: asString(m["ii"]),
		Q:  asString(m["q"]),
		N:  asInt(m["n"]),
		B:  asInt(m["b"]),
	}
}

func asString(v any) string {
	switch t := v.(type) {
	case string:
		return t
	case float64:
		return formatInt(int64(t))
	case int:
		return formatInt(int64(t))
	case int64:
		return formatInt(t)
	}
	return ""
}

func asInt(v any) int {
	switch t := v.(type) {
	case int:
		return t
	case int64:
		return int(t)
	case float64:
		return int(t)
	case string:
		return parseInt(t)
	}
	return 0
}
