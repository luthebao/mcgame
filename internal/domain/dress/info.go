// Open-sourced by BaoLT

// Domain model for the in-game Dress Panel ("Tủ Đồ").
// The full state is persisted as a JSON-encoded string on
// player.characters.dress_info to preserve compatibility with the existing
// schema. The shape mirrors what the Flash client (DressLogic.as) expects.
package dress

import (
	"encoding/json"
	"strconv"
)

type Bag struct {
	Crystal int `json:"crystal"`
	Jewel   int `json:"jewel"`
}

type Info struct {
	Book           map[string]int  `json:"book"`
	Recipe         map[string]int  `json:"recipe"`
	RecipeBurns    map[string]bool `json:"recipeBurns,omitempty"`
	Bag            Bag             `json:"bag"`
	Extract        int             `json:"extract"`
	Score          int             `json:"score"`
	FakeDressID    int64           `json:"fakeDressId"`
	FakeFlyDressID int64           `json:"fakeFlyDressId"`
	Day            string          `json:"day,omitempty"`
}

func NewInfo() *Info {
	return &Info{
		Book:        map[string]int{},
		Recipe:      map[string]int{},
		RecipeBurns: map[string]bool{},
	}
}

func Decode(raw string) (*Info, error) {
	if raw == "" || raw == "null" {
		return NewInfo(), nil
	}
	info := NewInfo()
	if err := json.Unmarshal([]byte(raw), info); err != nil {
		return nil, err
	}
	if info.Book == nil {
		info.Book = map[string]int{}
	}
	if info.Recipe == nil {
		info.Recipe = map[string]int{}
	}
	if info.RecipeBurns == nil {
		info.RecipeBurns = map[string]bool{}
	}
	return info, nil
}

func (i *Info) Encode() (string, error) {
	if i.Book == nil {
		i.Book = map[string]int{}
	}
	if i.Recipe == nil {
		i.Recipe = map[string]int{}
	}
	if i.RecipeBurns == nil {
		i.RecipeBurns = map[string]bool{}
	}
	b, err := json.Marshal(i)
	if err != nil {
		return "", err
	}
	return string(b), nil
}

func (i *Info) EncodeClient() (string, error) {
	if i.Book == nil {
		i.Book = map[string]int{}
	}
	if i.Recipe == nil {
		i.Recipe = map[string]int{}
	}
	payload := struct {
		Book           map[string]int `json:"book"`
		Recipe         map[string]int `json:"recipe"`
		Bag            Bag            `json:"bag"`
		Extract        int            `json:"extract"`
		Score          int            `json:"score"`
		FakeDressID    int64          `json:"fakeDressId"`
		FakeFlyDressID int64          `json:"fakeFlyDressId"`
	}{
		Book:           i.Book,
		Recipe:         i.Recipe,
		Bag:            i.Bag,
		Extract:        i.Extract,
		Score:          i.Score,
		FakeDressID:    i.FakeDressID,
		FakeFlyDressID: i.FakeFlyDressID,
	}
	b, err := json.Marshal(payload)
	if err != nil {
		return "", err
	}
	return string(b), nil
}

func (i *Info) ResetDailyIfNeeded(today string) bool {
	if today == "" || i.Day == today {
		return false
	}
	i.Day = today
	i.Extract = 0
	return true
}

func (i *Info) HasActivated(dressID int64) bool {
	v, ok := i.Book[strconv.FormatInt(dressID, 10)]
	return ok && v >= 1
}

func (i *Info) HasClaimed(dressID int64) bool {
	v, ok := i.Book[strconv.FormatInt(dressID, 10)]
	return ok && v >= 2
}

func (i *Info) SetActivated(dressID int64) {
	key := strconv.FormatInt(dressID, 10)
	if i.Book[key] < 1 {
		i.Book[key] = 1
	}
}

func (i *Info) SetClaimed(dressID int64) {
	i.Book[strconv.FormatInt(dressID, 10)] = 2
}

func (i *Info) RecipeCount(recipeID int64) int {
	return i.Recipe[strconv.FormatInt(recipeID, 10)]
}

func (i *Info) AddRecipe(recipeID int64, n int) {
	if n == 0 {
		return
	}
	key := strconv.FormatInt(recipeID, 10)
	i.Recipe[key] += n
	if i.Recipe[key] <= 0 {
		delete(i.Recipe, key)
	}
}

func (i *Info) RecipeBurned(dressID int64) bool {
	return i.RecipeBurns[strconv.FormatInt(dressID, 10)]
}

func (i *Info) MarkRecipeBurned(dressID int64) {
	if i.RecipeBurns == nil {
		i.RecipeBurns = map[string]bool{}
	}
	i.RecipeBurns[strconv.FormatInt(dressID, 10)] = true
}
