// Open-sourced by BaoLT

// Rune socketing writers for the deco-hole panel. runeSet/runeRemove (rune package)
// drive these to place or clear a rune in a decoPosition's R[16] slot array and
// re-echo the decoInfo blob via the same holeToWire shape the login snapshot emits,
// so socketed runes persist and reappear at next login. The rune layer converts the
// client's 1-based holePos to a 0-based slot index before calling here, so holePos N
// maps to R[N-1], which holeToWire emits as wire key "r"+N (r1..r16) — consistent at
// both write and login-read.
package dress

import (
	"context"
	"fmt"
)

func (s *DecoHoleService) ensureHolePosition(state *DecoHoleState, decoPosition int) *HolePosition {
	hole := state.Positions[decoPosition]
	if hole == nil {
		hole = &HolePosition{Position: decoPosition}
		state.Positions[decoPosition] = hole
	}
	return hole
}

func (s *DecoHoleService) SetRuneSlot(ctx context.Context, charID int64, decoPosition, slotIdx, runeID int) (map[string]interface{}, error) {
	if decoPosition < decoHolePositionMin || decoPosition > decoHolePositionMax {
		return nil, fmt.Errorf("deco_hole: invalid deco position %d", decoPosition)
	}
	if slotIdx < 0 || slotIdx >= 16 {
		return nil, fmt.Errorf("deco_hole: invalid rune slot index %d", slotIdx)
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	hole := s.ensureHolePosition(state, decoPosition)
	if hole.R[slotIdx] == 0 && runeID != 0 {
		hole.N++
	}
	hole.R[slotIdx] = runeID
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return DecoHoleStateToWire(charID, state), nil
}

func (s *DecoHoleService) ClearRuneSlot(ctx context.Context, charID int64, decoPosition, slotIdx int) (map[string]interface{}, int, error) {
	if decoPosition < decoHolePositionMin || decoPosition > decoHolePositionMax {
		return nil, 0, fmt.Errorf("deco_hole: invalid deco position %d", decoPosition)
	}
	if slotIdx < 0 || slotIdx >= 16 {
		return nil, 0, fmt.Errorf("deco_hole: invalid rune slot index %d", slotIdx)
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, 0, err
	}
	hole := s.ensureHolePosition(state, decoPosition)
	old := hole.R[slotIdx]
	if old != 0 {
		hole.R[slotIdx] = 0
		if hole.N > 0 {
			hole.N--
		}
	}
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, 0, err
	}
	return DecoHoleStateToWire(charID, state), old, nil
}

func (s *DecoHoleService) DecoInfoWire(ctx context.Context, charID int64) (map[string]interface{}, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	return DecoHoleStateToWire(charID, state), nil
}
