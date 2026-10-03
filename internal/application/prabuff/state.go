// Open-sourced by BaoLT

// praBuff — "Ma Pháp Bí Trận" (Magic Formation Array, PANEL_MAGIC_ARRAY=867) state.
//
// 8 elemental formation tracks, each a {level, exp} pair, persisted under
// character_feature_states feature_key='pra_buff' as the 16 flat keys the client
// login blob cData.praBuffInfo uses (statfeature.buildPraBuffInfoJSON reads the same
// keys, so persisting here gives automatic login parity). praType (1-8) maps to the
// track key pair below — confirmed against MagicArrayPanel.as / GamePredef.as:
//   1 Thủy -> def/defExp (char phys-def)      2 Hỏa  -> petDef/petDefExp
//   3 Địa  -> magicDef/magicDefExp (char m-def) 4 Phong-> petMagicDef/petMagicDefExp
//   5 Kim  -> peoAttack/peoAttackExp (char atk)  6 Mộc  -> petAttack/petAttackExp
//   7 Quang-> peoSpeed/peoSpeedExp (char spd)    8 Ám   -> petSpeed/petSpeedExp
// "buff" (= level field) is the current level 0-30; "exp" is CUMULATIVE total exp
// (not delta since last level). NOTE: "peo" = người (character), distinct from "pet".
package prabuff

import "strconv"

const (
	MaxLevel   = 30
	MinPraType = 1
	MaxPraType = 8
)

var praTypeKeys = map[int][2]string{
	1: {"def", "defExp"},
	2: {"petDef", "petDefExp"},
	3: {"magicDef", "magicDefExp"},
	4: {"petMagicDef", "petMagicDefExp"},
	5: {"peoAttack", "peoAttackExp"},
	6: {"petAttack", "petAttackExp"},
	7: {"peoSpeed", "peoSpeedExp"},
	8: {"petSpeed", "petSpeedExp"},
}

type Track struct {
	Level int
	Exp   int
}

type State struct {
	Tracks map[int]Track
}

func defaultState() *State {
	return &State{Tracks: map[int]Track{}}
}

func stateFromMap(raw map[string]interface{}) *State {
	s := defaultState()
	if len(raw) == 0 {
		return s
	}
	for pt, keys := range praTypeKeys {
		t := Track{}
		if v, ok := intFrom(raw[keys[0]]); ok {
			t.Level = v
		}
		if v, ok := intFrom(raw[keys[1]]); ok {
			t.Exp = v
		}
		if t.Level != 0 || t.Exp != 0 {
			s.Tracks[pt] = t
		}
	}
	return s
}

func (s *State) track(pt int) Track {
	return s.Tracks[pt]
}

func (s *State) setTrack(pt int, t Track) {
	s.Tracks[pt] = t
}

func (s *State) toPersist() map[string]interface{} {
	out := make(map[string]interface{}, len(praTypeKeys)*2)
	for pt, keys := range praTypeKeys {
		t := s.Tracks[pt]
		out[keys[0]] = t.Level
		out[keys[1]] = t.Exp
	}
	return out
}

func validPraType(pt int) bool {
	return pt >= MinPraType && pt <= MaxPraType
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
