// Open-sourced by BaoLT

// Rune feature service manages the player's rune bag (chaBag/petBag) and rune-chip bag.
// Both stores persist through the generic character feature-state store keyed by FeatureRune
// and FeatureRuneChip respectively. Deferred actions (socketing, up-level, dissolve,
// chip exchange) live in rune_actions.go / rune_upgrade.go and depend on the local
// DecoRuneSlotWriter / RuneGameData / RuneCharProvider interfaces bound in main.go.
package rune

import (
	"context"
	"errors"
	"fmt"

	domainfeature "mcgame-server/internal/domain/statfeature"

	"go.uber.org/zap"
)

const (
	MaxChipBagSlots  = 100
	MaxRuneBagSlots  = 100
	MaxChipIDAllowed = 10000
	MaxChipNum       = 99999
)

var (
	ErrInvalidCharacterID = errors.New("rune: invalid character id")
	ErrBagFull            = errors.New("rune: bag is full")
)

type Service struct {
	repo         domainfeature.Repository
	logger       *zap.Logger
	slotWriter   DecoRuneSlotWriter
	gameData     RuneGameData
	charProvider RuneCharProvider
}

func NewService(repo domainfeature.Repository, logger *zap.Logger) *Service {
	return &Service{repo: repo, logger: logger}
}

type RuneSlot struct {
	N int `json:"n"`
	R int `json:"r"`
}

type RuneBag struct {
	ChaBag    map[string]RuneSlot `json:"chaBag"`
	PetBag    map[string]RuneSlot `json:"petBag"`
	UpLvlHole int                 `json:"upLvlHole"`
}

type ChipSlot struct {
	ChipID string `json:"chipId"`
	Num    int    `json:"num"`
}

func defaultRuneBag() RuneBag {
	return RuneBag{
		ChaBag:    map[string]RuneSlot{},
		PetBag:    map[string]RuneSlot{},
		UpLvlHole: 0,
	}
}

func (s *Service) GetRuneBag(ctx context.Context, charID int64) (RuneBag, error) {
	if s == nil || s.repo == nil {
		return defaultRuneBag(), nil
	}
	states, err := s.repo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return RuneBag{}, fmt.Errorf("rune: load feature state: %w", err)
	}
	for _, st := range states {
		if st == nil || st.FeatureKey != domainfeature.FeatureRune {
			continue
		}
		return decodeRuneBag(st.State), nil
	}
	return defaultRuneBag(), nil
}

func (s *Service) GetChipBag(ctx context.Context, charID int64) (map[string]ChipSlot, error) {
	if s == nil || s.repo == nil {
		return map[string]ChipSlot{}, nil
	}
	states, err := s.repo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("rune: load chip state: %w", err)
	}
	for _, st := range states {
		if st == nil || st.FeatureKey != domainfeature.FeatureRuneChip {
			continue
		}
		bag := decodeChipBag(st.State)
		if verr := ValidateChipBag(bag); verr != nil {
			return nil, fmt.Errorf("rune: persisted chip bag is invalid: %w", verr)
		}
		return bag, nil
	}
	return map[string]ChipSlot{}, nil
}

func (s *Service) ChipBagLoginWire(ctx context.Context, charID int64) map[string]interface{} {
	bag, err := s.GetChipBag(ctx, charID)
	if err != nil {
		return ChipBagToWire(map[string]ChipSlot{})
	}
	return ChipBagToWire(bag)
}

func (s *Service) SaveChipBag(ctx context.Context, charID int64, bag map[string]ChipSlot) error {
	if s == nil || s.repo == nil {
		return nil
	}
	if verr := ValidateChipBag(bag); verr != nil {
		return fmt.Errorf("rune: save refused, chip bag invalid: %w", verr)
	}
	state := encodeChipBag(bag)
	return s.repo.UpsertCharacterFeatureState(ctx, &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  domainfeature.FeatureRuneChip,
		State:       state,
	})
}

func decodeRuneBag(state map[string]interface{}) RuneBag {
	bag := defaultRuneBag()
	if len(state) == 0 {
		return bag
	}
	if raw, ok := state["chaBag"]; ok {
		if m, ok := raw.(map[string]interface{}); ok {
			for k, v := range m {
				if slot, ok := parseRuneSlot(v); ok {
					bag.ChaBag[k] = slot
				}
			}
		}
	}
	if raw, ok := state["petBag"]; ok {
		if m, ok := raw.(map[string]interface{}); ok {
			for k, v := range m {
				if slot, ok := parseRuneSlot(v); ok {
					bag.PetBag[k] = slot
				}
			}
		}
	}
	if v, ok := state["upLvlHole"]; ok {
		if n, ok := toInt(v); ok {
			bag.UpLvlHole = n
		}
	}
	return bag
}

func parseRuneSlot(v interface{}) (RuneSlot, bool) {
	m, ok := v.(map[string]interface{})
	if !ok {
		return RuneSlot{}, false
	}
	var slot RuneSlot
	if n, ok := toInt(m["n"]); ok {
		slot.N = n
	}
	if r, ok := toInt(m["r"]); ok {
		slot.R = r
	}
	return slot, true
}

func decodeChipBag(state map[string]interface{}) map[string]ChipSlot {
	bag := map[string]ChipSlot{}
	if len(state) == 0 {
		return bag
	}
	raw, ok := state["bag"]
	if !ok {
		return bag
	}
	m, ok := raw.(map[string]interface{})
	if !ok {
		return bag
	}
	for k, v := range m {
		if slot, ok := parseChipSlot(v); ok {
			bag[k] = slot
		}
	}
	return bag
}

func parseChipSlot(v interface{}) (ChipSlot, bool) {
	m, ok := v.(map[string]interface{})
	if !ok {
		return ChipSlot{}, false
	}
	var slot ChipSlot
	if chipID, ok := m["chipId"].(string); ok {
		slot.ChipID = chipID
	} else if n, ok := toInt(m["chipId"]); ok {
		slot.ChipID = fmt.Sprintf("%d", n)
	}
	if num, ok := toInt(m["num"]); ok {
		slot.Num = num
	}
	return slot, slot.ChipID != ""
}

func encodeChipBag(bag map[string]ChipSlot) map[string]interface{} {
	entries := make(map[string]interface{}, len(bag))
	for k, v := range bag {
		entries[k] = map[string]interface{}{
			"chipId": v.ChipID,
			"num":    v.Num,
		}
	}
	return map[string]interface{}{"bag": entries}
}

func toInt(v interface{}) (int, bool) {
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
	}
	return 0, false
}

func RuneBagToWire(bag RuneBag) map[string]interface{} {
	chaBag := make(map[string]interface{}, len(bag.ChaBag))
	for k, v := range bag.ChaBag {
		chaBag[k] = map[string]interface{}{"n": v.N, "r": v.R}
	}
	petBag := make(map[string]interface{}, len(bag.PetBag))
	for k, v := range bag.PetBag {
		petBag[k] = map[string]interface{}{"n": v.N, "r": v.R}
	}
	return map[string]interface{}{
		"chaBag":    chaBag,
		"petBag":    petBag,
		"upLvlHole": bag.UpLvlHole,
	}
}

func ChipBagToWire(bag map[string]ChipSlot) map[string]interface{} {
	wire := make(map[string]interface{}, len(bag))
	for k, v := range bag {
		wire[k] = map[string]interface{}{
			"chipId": v.ChipID,
			"num":    v.Num,
		}
	}
	return wire
}

func ValidateChipBag(bag map[string]ChipSlot) error {
	if len(bag) > MaxChipBagSlots {
		return errors.New("rune: chip bag exceeds maximum slot count")
	}
	for _, slot := range bag {
		if slot.Num < 0 || slot.Num > MaxChipNum {
			return errors.New("rune: chip num out of range")
		}
		chipID := 0
		for _, b := range slot.ChipID {
			if b < '0' || b > '9' {
				return errors.New("rune: chip id contains non-numeric characters")
			}
			chipID = chipID*10 + int(b-'0')
		}
		if chipID < 0 || chipID > MaxChipIDAllowed {
			return errors.New("rune: chip id out of allowed range")
		}
	}
	return nil
}
