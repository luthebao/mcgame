// Open-sourced by BaoLT

// Fairy (Tiểu Tinh Linh) persisted roster + skin state models.
//
// Roster persists under character_feature_states feature_key='fairy' as an Object
// keyed by fairyId(string) -> the full fairy DTO the client reads in onInitCharFairy:
//
//	{ "<fairyId>": { id,tid,name,exp,gexp,doh,
//	    sta,staG,ste,steG,agi,agiG,inte,inteG,ener,enerG,
//	    cc,binded,state,
//	    flag:{gnum,en,rs},
//	    skillFlag:{"s1":skillId,...},
//	    skillConfig:{select,"0":{c0..c4},"1":{...},"2":{...}} } }
//
// initCharFairy serves toRoster() verbatim so the lazy-load response round-trips.
// flag.rs is a server-only daily-reset stamp (YYYY-MM-DD) used to refill the
// per-day counters flag.gnum (cultivations) and flag.en (fruit feeds); the client
// only reads gnum/en so the extra key is harmless.
//
// Skin state persists separately under feature_key='fairy_skin' as
// {"actFairy":<tid int>, "actFairyList":"<pipe-delimited tids>"}; served verbatim
// by getFairyResAndList.
package fairy

import (
	"sort"
	"strconv"
	"strings"
)

const (
	rosterStateKey = "fairy"
	skinStateKey   = "fairy_skin"

	flagGnumKey  = "gnum"
	flagEnKey    = "en"
	flagResetKey = "rs"

	skinActKey     = "actFairy"
	skinListKey    = "actFairyList"
	skinListSep    = "|"
	skillConfigSel = "select"
)

type Fairy struct {
	ID    int64
	Tid   int
	Name  string
	Exp   int64
	Gexp  int64
	Doh   int

	Sta   float64
	StaG  float64
	Ste   float64
	SteG  float64
	Agi   float64
	AgiG  float64
	Inte  float64
	InteG float64
	Ener  float64
	EnerG float64

	Cc     int
	Binded int
	State  int

	Gnum      int
	En        int
	ResetDay  string
	SkillFlag map[string]int
	Config    map[string]interface{}
}

func newFairy(id int64) *Fairy {
	return &Fairy{ID: id, SkillFlag: map[string]int{}, Config: map[string]interface{}{}}
}

type State struct {
	Fairies map[int64]*Fairy
}

func defaultState() *State {
	return &State{Fairies: map[int64]*Fairy{}}
}

func (s *State) fairy(id int64) (*Fairy, bool) {
	f, ok := s.Fairies[id]
	return f, ok && f != nil
}

func stateFromMap(raw map[string]interface{}) *State {
	state := defaultState()
	if len(raw) == 0 {
		return state
	}
	rosterRaw, ok := raw[rosterStateKey].(map[string]interface{})
	if !ok {
		rosterRaw = raw
	}
	for idKey, entryRaw := range rosterRaw {
		id, err := strconv.ParseInt(idKey, 10, 64)
		if err != nil {
			continue
		}
		entryMap, ok := entryRaw.(map[string]interface{})
		if !ok {
			continue
		}
		state.Fairies[id] = fairyFromMap(id, entryMap)
	}
	return state
}

func fairyFromMap(id int64, m map[string]interface{}) *Fairy {
	f := newFairy(id)
	if v, ok := int64From(m["id"]); ok {
		f.ID = v
	}
	if v, ok := intFrom(m["tid"]); ok {
		f.Tid = v
	}
	if v, ok := m["name"].(string); ok {
		f.Name = v
	}
	if v, ok := int64From(m["exp"]); ok {
		f.Exp = v
	}
	if v, ok := int64From(m["gexp"]); ok {
		f.Gexp = v
	}
	if v, ok := intFrom(m["doh"]); ok {
		f.Doh = v
	}
	f.Sta, _ = floatFrom(m["sta"])
	f.StaG, _ = floatFrom(m["staG"])
	f.Ste, _ = floatFrom(m["ste"])
	f.SteG, _ = floatFrom(m["steG"])
	f.Agi, _ = floatFrom(m["agi"])
	f.AgiG, _ = floatFrom(m["agiG"])
	f.Inte, _ = floatFrom(m["inte"])
	f.InteG, _ = floatFrom(m["inteG"])
	f.Ener, _ = floatFrom(m["ener"])
	f.EnerG, _ = floatFrom(m["enerG"])
	if v, ok := intFrom(m["cc"]); ok {
		f.Cc = v
	}
	if v, ok := intFrom(m["binded"]); ok {
		f.Binded = v
	}
	if v, ok := intFrom(m["state"]); ok {
		f.State = v
	}
	if flag, ok := m["flag"].(map[string]interface{}); ok {
		if v, ok := intFrom(flag[flagGnumKey]); ok {
			f.Gnum = v
		}
		if v, ok := intFrom(flag[flagEnKey]); ok {
			f.En = v
		}
		if v, ok := flag[flagResetKey].(string); ok {
			f.ResetDay = v
		}
	}
	if sf, ok := m["skillFlag"].(map[string]interface{}); ok {
		for k, sv := range sf {
			if v, ok := intFrom(sv); ok {
				f.SkillFlag[k] = v
			}
		}
	}
	if cfg, ok := m["skillConfig"].(map[string]interface{}); ok {
		f.Config = cfg
	}
	return f
}

func (s *State) toRoster() map[string]interface{} {
	out := make(map[string]interface{}, len(s.Fairies))
	for id, f := range s.Fairies {
		if f == nil {
			continue
		}
		out[strconv.FormatInt(id, 10)] = f.toWire()
	}
	return out
}

func (s *State) toPersist() map[string]interface{} {
	return map[string]interface{}{rosterStateKey: s.toRoster()}
}

func (f *Fairy) toWire() map[string]interface{} {
	skillFlag := make(map[string]interface{}, len(f.SkillFlag))
	for k, v := range f.SkillFlag {
		skillFlag[k] = v
	}
	cfg := f.Config
	if cfg == nil {
		cfg = map[string]interface{}{}
	}
	return map[string]interface{}{
		"id":    f.ID,
		"tid":   f.Tid,
		"name":  f.Name,
		"exp":   f.Exp,
		"gexp":  f.Gexp,
		"doh":   f.Doh,
		"sta":   f.Sta,
		"staG":  f.StaG,
		"ste":   f.Ste,
		"steG":  f.SteG,
		"agi":   f.Agi,
		"agiG":  f.AgiG,
		"inte":  f.Inte,
		"inteG": f.InteG,
		"ener":  f.Ener,
		"enerG": f.EnerG,
		"cc":    f.Cc,
		"binded": f.Binded,
		"state": f.State,
		"flag": map[string]interface{}{
			flagGnumKey:  f.Gnum,
			flagEnKey:    f.En,
			flagResetKey: f.ResetDay,
		},
		"skillFlag":   skillFlag,
		"skillConfig": cfg,
	}
}

type SkinState struct {
	ActFairy int
	List     []int
}

func defaultSkinState() *SkinState {
	return &SkinState{List: []int{}}
}

func skinStateFromMap(raw map[string]interface{}) *SkinState {
	st := defaultSkinState()
	if len(raw) == 0 {
		return st
	}
	inner, ok := raw[skinStateKey].(map[string]interface{})
	if !ok {
		inner = raw
	}
	if v, ok := intFrom(inner[skinActKey]); ok {
		st.ActFairy = v
	}
	if v, ok := inner[skinListKey].(string); ok {
		st.List = parseTidList(v)
	}
	return st
}

func (st *SkinState) toWire() map[string]interface{} {
	return map[string]interface{}{
		skinActKey:  st.ActFairy,
		skinListKey: joinTidList(st.List),
	}
}

func (st *SkinState) toPersist() map[string]interface{} {
	return map[string]interface{}{skinStateKey: st.toWire()}
}

func (st *SkinState) has(tid int) bool {
	for _, v := range st.List {
		if v == tid {
			return true
		}
	}
	return false
}

func (st *SkinState) add(tid int) {
	if st.has(tid) {
		return
	}
	st.List = append(st.List, tid)
	sort.Ints(st.List)
}

func parseTidList(s string) []int {
	out := []int{}
	for _, part := range strings.Split(s, skinListSep) {
		part = strings.TrimSpace(part)
		if part == "" {
			continue
		}
		if v, err := strconv.Atoi(part); err == nil {
			out = append(out, v)
		}
	}
	return out
}

func joinTidList(list []int) string {
	parts := make([]string, 0, len(list))
	for _, v := range list {
		parts = append(parts, strconv.Itoa(v))
	}
	return strings.Join(parts, skinListSep)
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

func floatFrom(v interface{}) (float64, bool) {
	switch typed := v.(type) {
	case float64:
		return typed, true
	case float32:
		return float64(typed), true
	case int:
		return float64(typed), true
	case int32:
		return float64(typed), true
	case int64:
		return float64(typed), true
	case string:
		n, err := strconv.ParseFloat(typed, 64)
		if err != nil {
			return 0, false
		}
		return n, true
	}
	return 0, false
}
