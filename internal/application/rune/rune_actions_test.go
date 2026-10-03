// Open-sourced by BaoLT

package rune

import (
	"context"
	"errors"
	"testing"
)

type fakeSlotWriter struct {
	slots map[int]map[int]int
	n     map[int]int
	fail  bool
}

func newFakeSlotWriter() *fakeSlotWriter {
	return &fakeSlotWriter{slots: map[int]map[int]int{}, n: map[int]int{}}
}

func (w *fakeSlotWriter) SetRuneSlot(ctx context.Context, charID int64, decoPosition, slotIdx, runeID int) (map[string]interface{}, error) {
	if w.fail {
		return nil, errors.New("forced writer failure")
	}
	if slotIdx < 0 || slotIdx >= 16 {
		return nil, errors.New("slot index out of range")
	}
	if w.slots[decoPosition] == nil {
		w.slots[decoPosition] = map[int]int{}
	}
	w.slots[decoPosition][slotIdx] = runeID
	w.n[decoPosition]++
	return w.wire(), nil
}

func (w *fakeSlotWriter) ClearRuneSlot(ctx context.Context, charID int64, decoPosition, slotIdx int) (map[string]interface{}, int, error) {
	if slotIdx < 0 || slotIdx >= 16 {
		return nil, 0, errors.New("slot index out of range")
	}
	prev := 0
	if w.slots[decoPosition] != nil {
		prev = w.slots[decoPosition][slotIdx]
		delete(w.slots[decoPosition], slotIdx)
	}
	if prev > 0 && w.n[decoPosition] > 0 {
		w.n[decoPosition]--
	}
	return w.wire(), prev, nil
}

func (w *fakeSlotWriter) DecoInfoWire(ctx context.Context, charID int64) (map[string]interface{}, error) {
	return w.wire(), nil
}

func (w *fakeSlotWriter) wire() map[string]interface{} {
	return map[string]interface{}{"slots": w.slots, "n": w.n}
}

type fakeGameData struct {
	runes map[int]*RuneTemplate
	chips map[int]*RuneChipInfo
}

func (g *fakeGameData) GetDecoRune(id int) *RuneTemplate { return g.runes[id] }
func (g *fakeGameData) GetRuneChipInfo(chipID int) *RuneChipInfo {
	return g.chips[chipID]
}

type fakeCharProvider struct {
	exp int
}

func (c *fakeCharProvider) GetRuneExp(ctx context.Context, charID int64) (int, error) {
	return c.exp, nil
}
func (c *fakeCharProvider) AddRuneExp(ctx context.Context, charID int64, amount int) error {
	c.exp += amount
	return nil
}
func (c *fakeCharProvider) DeductRuneExp(ctx context.Context, charID int64, amount int) error {
	if c.exp < amount {
		return errors.New("not enough exp")
	}
	c.exp -= amount
	return nil
}

func newGameData() *fakeGameData {
	return &fakeGameData{
		runes: map[int]*RuneTemplate{
			11901: {ID: 11901, Kind: runeKindCha, NextID: 11902, Exp: 10, UpExp: 25, PropType: 1, PropNum: 187},
			11902: {ID: 11902, Kind: runeKindCha, NextID: 0, Exp: 35, UpExp: 0, PropType: 1, PropNum: 250},
			11920: {ID: 11920, Kind: runeKindPet, NextID: 11921, Exp: 12, UpExp: 30, PropType: 4, PropNum: 90},
		},
		chips: map[int]*RuneChipInfo{
			501: {ChipID: 501, RuneID: 11901, Num: 5},
		},
	}
}

func TestRuneSet_ConsumesBagAndWritesSlot(t *testing.T) {
	svc := newService(newJSONRepo())
	writer := newFakeSlotWriter()
	svc.SetDecoRuneSlotWriter(writer)
	svc.SetRuneGameData(newGameData())
	ctx := context.Background()

	seed := RuneBag{ChaBag: map[string]RuneSlot{"0": {N: 2, R: 11901}}, PetBag: map[string]RuneSlot{}}
	if err := svc.SaveRuneBag(ctx, testCharID, seed); err != nil {
		t.Fatalf("seed: %v", err)
	}

	wire, err := svc.RuneSet(ctx, testCharID, 0, 1, BagTypeCha, 1)
	if err != nil {
		t.Fatalf("RuneSet: %v", err)
	}
	if wire == nil {
		t.Fatalf("RuneSet returned nil wire")
	}
	if writer.slots[1][0] != 11901 {
		t.Fatalf("holePos 1 -> slot R[0] = %d, want 11901", writer.slots[1][0])
	}
	if writer.n[1] != 1 {
		t.Fatalf("N = %d, want 1", writer.n[1])
	}
	bag, _ := svc.GetRuneBag(ctx, testCharID)
	if bag.ChaBag["0"].N != 1 {
		t.Fatalf("bag stack after socket = %d, want 1", bag.ChaBag["0"].N)
	}
}

func TestRuneSet_HolePosMapsToSlotIndex(t *testing.T) {
	svc := newService(newJSONRepo())
	writer := newFakeSlotWriter()
	svc.SetDecoRuneSlotWriter(writer)
	svc.SetRuneGameData(newGameData())
	ctx := context.Background()
	seed := RuneBag{ChaBag: map[string]RuneSlot{"0": {N: 1, R: 11901}}, PetBag: map[string]RuneSlot{"0": {N: 1, R: 11920}}}
	if err := svc.SaveRuneBag(ctx, testCharID, seed); err != nil {
		t.Fatalf("seed: %v", err)
	}

	if _, err := svc.RuneSet(ctx, testCharID, 0, 15, BagTypeCha, 2); err != nil {
		t.Fatalf("RuneSet cha holePos 15: %v", err)
	}
	if writer.slots[2][14] != 11901 {
		t.Fatalf("cha holePos 15 -> slot R[14] mismatch: %v", writer.slots[2])
	}
	if _, err := svc.RuneSet(ctx, testCharID, 0, 16, BagTypePet, 2); err != nil {
		t.Fatalf("RuneSet pet holePos 16 (was rejected before the slot-index fix): %v", err)
	}
	if writer.slots[2][15] != 11920 {
		t.Fatalf("pet holePos 16 -> slot R[15] mismatch: %v", writer.slots[2])
	}
}

func TestRuneSet_KindMismatchRejected(t *testing.T) {
	svc := newService(newJSONRepo())
	svc.SetDecoRuneSlotWriter(newFakeSlotWriter())
	svc.SetRuneGameData(newGameData())
	ctx := context.Background()
	seed := RuneBag{ChaBag: map[string]RuneSlot{"0": {N: 1, R: 11920}}, PetBag: map[string]RuneSlot{}}
	if err := svc.SaveRuneBag(ctx, testCharID, seed); err != nil {
		t.Fatalf("seed: %v", err)
	}
	if _, err := svc.RuneSet(ctx, testCharID, 0, 1, BagTypeCha, 1); !errors.Is(err, ErrRuneKindMismatch) {
		t.Fatalf("expected ErrRuneKindMismatch, got %v", err)
	}
	bag, _ := svc.GetRuneBag(ctx, testCharID)
	if bag.ChaBag["0"].N != 1 {
		t.Fatalf("bag must be untouched on kind mismatch, got %+v", bag.ChaBag["0"])
	}
}

func TestRuneSet_WriterFailureRefundsBag(t *testing.T) {
	svc := newService(newJSONRepo())
	writer := newFakeSlotWriter()
	writer.fail = true
	svc.SetDecoRuneSlotWriter(writer)
	svc.SetRuneGameData(newGameData())
	ctx := context.Background()
	seed := RuneBag{ChaBag: map[string]RuneSlot{"0": {N: 2, R: 11901}}, PetBag: map[string]RuneSlot{}}
	if err := svc.SaveRuneBag(ctx, testCharID, seed); err != nil {
		t.Fatalf("seed: %v", err)
	}
	if _, err := svc.RuneSet(ctx, testCharID, 0, 1, BagTypeCha, 1); err == nil {
		t.Fatalf("expected writer failure error")
	}
	bag, _ := svc.GetRuneBag(ctx, testCharID)
	if bag.ChaBag["0"].N != 2 {
		t.Fatalf("bag must be refunded to 2 after writer failure, got %d", bag.ChaBag["0"].N)
	}
}

func TestRuneRemove_ReturnsRuneToBag(t *testing.T) {
	svc := newService(newJSONRepo())
	writer := newFakeSlotWriter()
	writer.slots[1] = map[int]int{2: 11901}
	writer.n[1] = 1
	svc.SetDecoRuneSlotWriter(writer)
	svc.SetRuneGameData(newGameData())
	ctx := context.Background()
	if err := svc.SaveRuneBag(ctx, testCharID, defaultRuneBag()); err != nil {
		t.Fatalf("seed: %v", err)
	}

	wire, err := svc.RuneRemove(ctx, testCharID, 3, 0, BagTypeCha, 1)
	if err != nil {
		t.Fatalf("RuneRemove: %v", err)
	}
	if wire == nil {
		t.Fatalf("RuneRemove returned nil wire")
	}
	if _, taken := writer.slots[1][2]; taken {
		t.Fatalf("holePos 3 -> slot R[2] should be cleared")
	}
	if writer.n[1] != 0 {
		t.Fatalf("N = %d, want 0", writer.n[1])
	}
	bag, _ := svc.GetRuneBag(ctx, testCharID)
	if bag.ChaBag["0"] != (RuneSlot{N: 1, R: 11901}) {
		t.Fatalf("rune not returned to bag pos 0: %+v", bag.ChaBag["0"])
	}
}

func TestRuneRemove_EmptySlotNoop(t *testing.T) {
	svc := newService(newJSONRepo())
	writer := newFakeSlotWriter()
	svc.SetDecoRuneSlotWriter(writer)
	ctx := context.Background()
	if err := svc.SaveRuneBag(ctx, testCharID, defaultRuneBag()); err != nil {
		t.Fatalf("seed: %v", err)
	}
	wire, err := svc.RuneRemove(ctx, testCharID, 5, 0, BagTypeCha, 1)
	if err != nil {
		t.Fatalf("RuneRemove empty: %v", err)
	}
	if wire == nil {
		t.Fatalf("expected wire even for empty clear")
	}
	bag, _ := svc.GetRuneBag(ctx, testCharID)
	if len(bag.ChaBag) != 0 {
		t.Fatalf("bag should stay empty, got %+v", bag.ChaBag)
	}
}

func TestRuneSet_InvalidHoleRejected(t *testing.T) {
	svc := newService(newJSONRepo())
	svc.SetDecoRuneSlotWriter(newFakeSlotWriter())
	svc.SetRuneGameData(newGameData())
	ctx := context.Background()
	for _, hp := range []int{0, 17, -1} {
		if _, err := svc.RuneSet(ctx, testCharID, 0, hp, BagTypeCha, 1); !errors.Is(err, ErrRuneInvalidHole) {
			t.Fatalf("holePos %d: expected ErrRuneInvalidHole, got %v", hp, err)
		}
	}
}
