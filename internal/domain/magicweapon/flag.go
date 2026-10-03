// Open-sourced by BaoLT

package magicweapon

import "encoding/json"

type SuccinctSlot struct {
	PropType int     `json:"propType"`
	PropVal  float64 `json:"propVal"`
}

type SubFlag struct {
	Succ0 *SuccinctSlot `json:"succ0,omitempty"`
	Succ1 *SuccinctSlot `json:"succ1,omitempty"`
	Succ2 *SuccinctSlot `json:"succ2,omitempty"`
}

func (f *SubFlag) Get(index int) *SuccinctSlot {
	switch index {
	case 0:
		return f.Succ0
	case 1:
		return f.Succ1
	case 2:
		return f.Succ2
	}
	return nil
}

func (f *SubFlag) Set(index int, slot *SuccinctSlot) {
	switch index {
	case 0:
		f.Succ0 = slot
	case 1:
		f.Succ1 = slot
	case 2:
		f.Succ2 = slot
	}
}

func ParseSubFlag(raw string) *SubFlag {
	if raw == "" {
		return &SubFlag{}
	}
	var f SubFlag
	if err := json.Unmarshal([]byte(raw), &f); err != nil {
		return &SubFlag{}
	}
	return &f
}

func (f *SubFlag) Encode() (string, error) {
	if f == nil {
		return "", nil
	}
	b, err := json.Marshal(f)
	if err != nil {
		return "", err
	}
	return string(b), nil
}

type MainFlag struct {
	FlagStr string `json:"flagStr,omitempty"`
}

func ParseMainFlag(raw string) *MainFlag {
	if raw == "" {
		return &MainFlag{}
	}
	var f MainFlag
	if err := json.Unmarshal([]byte(raw), &f); err != nil {
		return &MainFlag{FlagStr: raw}
	}
	return &f
}

func (f *MainFlag) Encode() (string, error) {
	if f == nil {
		return "", nil
	}
	b, err := json.Marshal(f)
	if err != nil {
		return "", err
	}
	return string(b), nil
}
