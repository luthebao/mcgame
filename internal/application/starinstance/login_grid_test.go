// Open-sourced by BaoLT

package starinstance

import "testing"

func TestWarMapState_LoginGrid_SparseAndFractional(t *testing.T) {
	state := defaultWarMapState(20260614)
	if grid := state.LoginGrid(); len(grid) != 0 {
		t.Fatalf("fresh LoginGrid = %v, want empty (all cells zero, sparse)", grid)
	}

	state.Scores[8][1] = 60.77
	state.Scores[8][2] = 100
	state.Scores[4][1] = 91.55

	grid := state.LoginGrid()
	if len(grid) != 2 {
		t.Fatalf("LoginGrid levels = %d, want 2 (only levels with a non-zero cell)", len(grid))
	}

	lvl8, ok := grid["8"].(map[string]any)
	if !ok {
		t.Fatalf("grid[8] = %v, want map", grid["8"])
	}
	if len(lvl8) != 2 {
		t.Fatalf("grid[8] cells = %d, want 2 (zero cells omitted)", len(lvl8))
	}
	if lvl8["1"] != 60.77 {
		t.Fatalf("grid[8][1] = %v, want 60.77 (fractional percentage preserved)", lvl8["1"])
	}
	if _, has := lvl8["3"]; has {
		t.Fatalf("grid[8][3] present, want omitted (score is zero)")
	}
}

func TestWarMapState_RoundTripPreservesFraction(t *testing.T) {
	state := defaultWarMapState(20260614)
	state.Scores[8][1] = 60.77

	restored := WarMapStateFromMap(state.ToMap(), 20260614)
	if restored.Scores[8][1] != 60.77 {
		t.Fatalf("round-trip Scores[8][1] = %v, want 60.77 (must not truncate to int)", restored.Scores[8][1])
	}
}
