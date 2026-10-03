// Open-sourced by BaoLT

// Soul exp-pool operations: levelling a gem (soulLevelUp, char + pet variants),
// pouring a custom amount of soul exp into a gem (putInToExp), and dissolving gems
// back into the soul-exp / chip pools (transformExp single + bulk).
//
// Model (documented assumption, calibrate against live-log): char.SoulExp is a
// global pool the player spends into individual gems' accumulated exp; the client
// derives a gem's displayed level from that exp + TBL_PET_SOUL. soulLevelUp pours
// one step (TBL_PET_SOUL.up_exp of the gem's current sid) from the pool into the
// gem; putInToExp pours a caller-chosen amount; transformExp dissolves a gem,
// returning its accumulated exp to the pool plus TBL_PET_SOUL.chip soul-chips
// (char.SoulPoints). Locked gems cannot be dissolved.
package soul

import (
	"context"
	"fmt"

	domainchar "mcgame-server/internal/domain/character"
)

func (s *Service) loadChar(ctx context.Context, charID int64) (*domainchar.Character, error) {
	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return nil, err
	}
	if char == nil {
		return nil, ErrCharacterNotFound
	}
	return char, nil
}

func (s *Service) SoulLevelUp(ctx context.Context, charID int64, slot int) (map[string]any, int64, error) {
	state, err := s.loadCharState(ctx, charID)
	if err != nil {
		return nil, 0, err
	}
	gem, ok := state.Slots[slot]
	if !ok {
		return nil, 0, ErrSlotEmpty
	}
	cost := s.upExpFor(gem.Sid)
	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, 0, err
	}
	if char.SoulExp < cost {
		return nil, 0, ErrInsufficientExp
	}
	char.SoulExp -= cost
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, 0, fmt.Errorf("soul: spend soul exp: %w", err)
	}
	gem.Exp += cost
	state.Slots[slot] = gem
	if err := s.saveCharState(ctx, charID, state); err != nil {
		return nil, 0, err
	}
	return slotWire(slot, gem, 0), char.SoulExp, nil
}

func (s *Service) SoulLevelUpPet(ctx context.Context, charID, petID int64, slot int) (map[string]any, int64, error) {
	state, err := s.loadPetState(ctx, petID)
	if err != nil {
		return nil, 0, err
	}
	gem, ok := state.Slots[slot]
	if !ok {
		return nil, 0, ErrSlotEmpty
	}
	cost := s.upExpFor(gem.Sid)
	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, 0, err
	}
	if char.SoulExp < cost {
		return nil, 0, ErrInsufficientExp
	}
	char.SoulExp -= cost
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, 0, fmt.Errorf("soul: spend soul exp: %w", err)
	}
	gem.Exp += cost
	state.Slots[slot] = gem
	if err := s.savePetState(ctx, petID, state); err != nil {
		return nil, 0, err
	}
	return slotWire(slot, gem, petSoulWireOffset), char.SoulExp, nil
}

func (s *Service) PutInToExp(ctx context.Context, charID int64, slot int, amount int64) (map[string]any, int64, error) {
	if amount <= 0 {
		return nil, 0, ErrInsufficientExp
	}
	state, err := s.loadCharState(ctx, charID)
	if err != nil {
		return nil, 0, err
	}
	gem, ok := state.Slots[slot]
	if !ok {
		return nil, 0, ErrSlotEmpty
	}
	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, 0, err
	}
	if char.SoulExp < amount {
		return nil, 0, ErrInsufficientExp
	}
	char.SoulExp -= amount
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, 0, fmt.Errorf("soul: pour soul exp: %w", err)
	}
	gem.Exp += amount
	state.Slots[slot] = gem
	if err := s.saveCharState(ctx, charID, state); err != nil {
		return nil, 0, err
	}
	return slotWire(slot, gem, 0), char.SoulExp, nil
}

func (s *Service) TransformExp(ctx context.Context, charID int64, slot int) (map[string]any, error) {
	state, err := s.loadCharState(ctx, charID)
	if err != nil {
		return nil, err
	}
	gem, ok := state.Slots[slot]
	if !ok {
		return nil, ErrSlotEmpty
	}
	if gem.Lock {
		return nil, ErrSlotLocked
	}
	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, err
	}
	char.SoulExp += gem.Exp
	char.SoulPoints += s.dissolveChip(gem.Sid)
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, fmt.Errorf("soul: credit dissolve: %w", err)
	}
	delete(state.Slots, slot)
	if err := s.saveCharState(ctx, charID, state); err != nil {
		return nil, err
	}
	return map[string]any{
		"f":       1,
		"index":   slot,
		"soulExp": char.SoulExp,
		"chip":    char.SoulPoints,
	}, nil
}

func (s *Service) TransformAllExp(ctx context.Context, charID int64) (map[string]any, error) {
	state, err := s.loadCharState(ctx, charID)
	if err != nil {
		return nil, err
	}
	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, err
	}
	dissolved := false
	for idx, gem := range state.Slots {
		if gem.Lock {
			continue
		}
		char.SoulExp += gem.Exp
		char.SoulPoints += s.dissolveChip(gem.Sid)
		delete(state.Slots, idx)
		dissolved = true
	}
	if !dissolved {
		return map[string]any{"data": state.LoginObj(), "soulExp": char.SoulExp, "chip": char.SoulPoints}, nil
	}
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, fmt.Errorf("soul: credit dissolve-all: %w", err)
	}
	if err := s.saveCharState(ctx, charID, state); err != nil {
		return nil, err
	}
	return map[string]any{
		"data":    state.LoginObj(),
		"soulExp": char.SoulExp,
		"chip":    char.SoulPoints,
	}, nil
}
