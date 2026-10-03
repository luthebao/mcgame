// Open-sourced by BaoLT

// War sprite typed state representation and JSONB encoding for the player state blob.
// Mirrors the {wObj, bObj} shape consumed by the Flash WarSpritePanel and registered in
// data_tbl_stat_feature row 10 (feature_key='war_sprite').
package warsprite

import "strconv"

const (
	KindWarSprite    = 1
	KindBattleSprite = 2

	MinIndex = 1
	MaxIndex = 8
)

var warSpriteRoots = map[int]int64{
	1: 1100, 2: 1200, 3: 1300, 4: 1400,
	5: 1500, 6: 1600, 7: 1700, 8: 1800,
}

var battleSpriteRoots = map[int]int64{
	1: 2100, 2: 2200, 3: 2300, 4: 2400,
	5: 2500, 6: 2600, 7: 2700, 8: 2800,
}

type State struct {
	WObj map[int]int64
	BObj map[int]int64
}

func NewState() *State {
	return &State{
		WObj: make(map[int]int64, MaxIndex),
		BObj: make(map[int]int64, MaxIndex),
	}
}

func Default() *State {
	s := NewState()
	for i := MinIndex; i <= MaxIndex; i++ {
		s.WObj[i] = warSpriteRoots[i]
		s.BObj[i] = battleSpriteRoots[i]
	}
	return s
}

func Decode(blob map[string]any) *State {
	if len(blob) == 0 {
		return Default()
	}
	s := NewState()
	decodeSlotMap(blob["wObj"], s.WObj)
	decodeSlotMap(blob["bObj"], s.BObj)
	for i := MinIndex; i <= MaxIndex; i++ {
		if _, ok := s.WObj[i]; !ok {
			s.WObj[i] = warSpriteRoots[i]
		}
		if _, ok := s.BObj[i]; !ok {
			s.BObj[i] = battleSpriteRoots[i]
		}
	}
	return s
}

func (s *State) Encode() map[string]any {
	if s == nil {
		s = Default()
	}
	return map[string]any{
		"wObj": encodeSlotMap(s.WObj),
		"bObj": encodeSlotMap(s.BObj),
	}
}

func (s *State) ToClientPayload() map[string]any {
	enc := s.Encode()
	return map[string]any{
		"wObj": enc["wObj"],
		"bObj": enc["bObj"],
	}
}

func (s *State) Get(kind, index int) (int64, error) {
	if !ValidIndex(index) {
		return 0, ErrInvalidIndex
	}
	switch kind {
	case KindWarSprite:
		return s.WObj[index], nil
	case KindBattleSprite:
		return s.BObj[index], nil
	}
	return 0, ErrInvalidKind
}

func (s *State) Set(kind, index int, templateID int64) error {
	if !ValidIndex(index) {
		return ErrInvalidIndex
	}
	switch kind {
	case KindWarSprite:
		s.WObj[index] = templateID
		return nil
	case KindBattleSprite:
		s.BObj[index] = templateID
		return nil
	}
	return ErrInvalidKind
}

func (s *State) ActiveTemplateIDs() []int64 {
	out := make([]int64, 0, MaxIndex*2)
	for i := MinIndex; i <= MaxIndex; i++ {
		if id := s.WObj[i]; id > 0 {
			out = append(out, id)
		}
		if id := s.BObj[i]; id > 0 {
			out = append(out, id)
		}
	}
	return out
}

func ValidIndex(index int) bool {
	return index >= MinIndex && index <= MaxIndex
}

func ValidKind(kind int) bool {
	return kind == KindWarSprite || kind == KindBattleSprite
}

func RootID(spriteType, kind int) int64 {
	if !ValidIndex(spriteType) {
		return 0
	}
	switch kind {
	case KindWarSprite:
		return warSpriteRoots[spriteType]
	case KindBattleSprite:
		return battleSpriteRoots[spriteType]
	}
	return 0
}

func decodeSlotMap(raw any, dst map[int]int64) {
	m, ok := raw.(map[string]any)
	if !ok {
		return
	}
	for key, value := range m {
		index, err := strconv.Atoi(key)
		if err != nil || !ValidIndex(index) {
			continue
		}
		dst[index] = coerceID(value)
	}
}

func encodeSlotMap(src map[int]int64) map[string]any {
	out := make(map[string]any, len(src))
	for index, id := range src {
		out[strconv.Itoa(index)] = id
	}
	return out
}

func coerceID(value any) int64 {
	switch v := value.(type) {
	case int64:
		return v
	case int:
		return int64(v)
	case int32:
		return int64(v)
	case float64:
		return int64(v)
	case float32:
		return int64(v)
	case string:
		n, err := strconv.ParseInt(v, 10, 64)
		if err != nil {
			return 0
		}
		return n
	}
	return 0
}
