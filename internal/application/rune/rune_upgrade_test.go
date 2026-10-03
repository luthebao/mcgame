// Open-sourced by BaoLT

package rune

import (
	"context"
	"errors"
	"testing"
)

func TestRuneUpLvl_AdvancesAndDeductsExp(t *testing.T) {
	svc := newService(newJSONRepo())
	svc.SetRuneGameData(newGameData())
	cp := &fakeCharProvider{exp: 100}
	svc.SetRuneCharProvider(cp)
	ctx := context.Background()

	seed := RuneBag{ChaBag: map[string]RuneSlot{}, PetBag: map[string]RuneSlot{}, UpLvlHole: 11901}
	if err := svc.SaveRuneBag(ctx, testCharID, seed); err != nil {
		t.Fatalf("seed: %v", err)
	}

	result, err := svc.RuneUpLvl(ctx, testCharID)
	if err != nil {
		t.Fatalf("RuneUpLvl: %v", err)
	}
	if !result.Advanced || result.NewRuneID != 11902 {
		t.Fatalf("expected advance to 11902, got %+v", result)
	}
	if result.SpentExp != 25 {
		t.Fatalf("spent exp = %d, want 25", result.SpentExp)
	}
	if cp.exp != 75 {
		t.Fatalf("rune exp after = %d, want 75", cp.exp)
	}
	bag, _ := svc.GetRuneBag(ctx, testCharID)
	if bag.UpLvlHole != 11902 {
		t.Fatalf("upLvlHole = %d, want 11902", bag.UpLvlHole)
	}
}

func TestRuneUpLvl_NotEnoughExpDoesNotAdvance(t *testing.T) {
	svc := newService(newJSONRepo())
	svc.SetRuneGameData(newGameData())
	cp := &fakeCharProvider{exp: 10}
	svc.SetRuneCharProvider(cp)
	ctx := context.Background()
	seed := RuneBag{ChaBag: map[string]RuneSlot{}, PetBag: map[string]RuneSlot{}, UpLvlHole: 11901}
	if err := svc.SaveRuneBag(ctx, testCharID, seed); err != nil {
		t.Fatalf("seed: %v", err)
	}
	result, err := svc.RuneUpLvl(ctx, testCharID)
	if !errors.Is(err, ErrRuneUpNotEnough) {
		t.Fatalf("expected ErrRuneUpNotEnough, got %v", err)
	}
	if result.Advanced {
		t.Fatalf("must not advance")
	}
	if cp.exp != 10 {
		t.Fatalf("exp must be untouched, got %d", cp.exp)
	}
	bag, _ := svc.GetRuneBag(ctx, testCharID)
	if bag.UpLvlHole != 11901 {
		t.Fatalf("upLvlHole must stay 11901, got %d", bag.UpLvlHole)
	}
}

func TestRuneUpLvl_MaxLevelRejected(t *testing.T) {
	svc := newService(newJSONRepo())
	svc.SetRuneGameData(newGameData())
	svc.SetRuneCharProvider(&fakeCharProvider{exp: 1000})
	ctx := context.Background()
	seed := RuneBag{ChaBag: map[string]RuneSlot{}, PetBag: map[string]RuneSlot{}, UpLvlHole: 11902}
	if err := svc.SaveRuneBag(ctx, testCharID, seed); err != nil {
		t.Fatalf("seed: %v", err)
	}
	if _, err := svc.RuneUpLvl(ctx, testCharID); !errors.Is(err, ErrRuneUpMaxed) {
		t.Fatalf("expected ErrRuneUpMaxed, got %v", err)
	}
}

func TestRuneUpLvl_EmptyHoleRejected(t *testing.T) {
	svc := newService(newJSONRepo())
	svc.SetRuneGameData(newGameData())
	svc.SetRuneCharProvider(&fakeCharProvider{exp: 1000})
	ctx := context.Background()
	if err := svc.SaveRuneBag(ctx, testCharID, defaultRuneBag()); err != nil {
		t.Fatalf("seed: %v", err)
	}
	if _, err := svc.RuneUpLvl(ctx, testCharID); !errors.Is(err, ErrRuneUpEmpty) {
		t.Fatalf("expected ErrRuneUpEmpty, got %v", err)
	}
}

func TestRuneResolve_DissolvesAndCreditsExp(t *testing.T) {
	svc := newService(newJSONRepo())
	svc.SetRuneGameData(newGameData())
	cp := &fakeCharProvider{exp: 0}
	svc.SetRuneCharProvider(cp)
	ctx := context.Background()

	seed := RuneBag{
		ChaBag: map[string]RuneSlot{
			"0": {N: 3, R: 11901},
			"1": {N: 1, R: 11902},
		},
		PetBag: map[string]RuneSlot{},
	}
	if err := svc.SaveRuneBag(ctx, testCharID, seed); err != nil {
		t.Fatalf("seed: %v", err)
	}

	runeObj := map[string]int{"0": 11901, "1": 11902}
	result, err := svc.RuneResolve(ctx, testCharID, runeObj, BagTypeCha)
	if err != nil {
		t.Fatalf("RuneResolve: %v", err)
	}
	// 11901 exp=10 * 3 = 30, 11902 exp=35 * 1 = 35 -> 65
	if result.GainedExp != 65 {
		t.Fatalf("gained exp = %d, want 65", result.GainedExp)
	}
	if cp.exp != 65 {
		t.Fatalf("rune exp now = %d, want 65", cp.exp)
	}
	bag, _ := svc.GetRuneBag(ctx, testCharID)
	if len(bag.ChaBag) != 0 {
		t.Fatalf("bag should be empty after dissolve, got %+v", bag.ChaBag)
	}
}

func TestRuneResolve_MismatchedRuneIdSkipped(t *testing.T) {
	svc := newService(newJSONRepo())
	svc.SetRuneGameData(newGameData())
	cp := &fakeCharProvider{exp: 0}
	svc.SetRuneCharProvider(cp)
	ctx := context.Background()
	seed := RuneBag{ChaBag: map[string]RuneSlot{"0": {N: 1, R: 11901}}, PetBag: map[string]RuneSlot{}}
	if err := svc.SaveRuneBag(ctx, testCharID, seed); err != nil {
		t.Fatalf("seed: %v", err)
	}
	// client claims rune 99999 at pos 0 but bag has 11901 -> skip
	result, err := svc.RuneResolve(ctx, testCharID, map[string]int{"0": 99999}, BagTypeCha)
	if err != nil {
		t.Fatalf("RuneResolve: %v", err)
	}
	if result.GainedExp != 0 {
		t.Fatalf("gained exp = %d, want 0 (mismatch skip)", result.GainedExp)
	}
	bag, _ := svc.GetRuneBag(ctx, testCharID)
	if bag.ChaBag["0"].N != 1 {
		t.Fatalf("bag must be untouched on mismatch, got %+v", bag.ChaBag["0"])
	}
}

func TestExchangeRune_ConvertsChipsToRune(t *testing.T) {
	svc := newService(newJSONRepo())
	svc.SetRuneGameData(newGameData())
	svc.SetRuneCharProvider(&fakeCharProvider{exp: 0})
	ctx := context.Background()

	// chip 501 -> rune 11901, num=5; have 12 chips -> 2 runes, 2 chips remain
	if err := svc.SaveChipBag(ctx, testCharID, map[string]ChipSlot{
		"1": {ChipID: "501", Num: 12},
	}); err != nil {
		t.Fatalf("seed chip bag: %v", err)
	}

	result, err := svc.ExchangeRune(ctx, testCharID)
	if err != nil {
		t.Fatalf("ExchangeRune: %v", err)
	}
	if result.Converted != 2 {
		t.Fatalf("converted = %d, want 2", result.Converted)
	}
	if result.ChipBag["1"].Num != 2 {
		t.Fatalf("remaining chips = %d, want 2", result.ChipBag["1"].Num)
	}
	bag, _ := svc.GetRuneBag(ctx, testCharID)
	if bag.ChaBag["0"] != (RuneSlot{N: 2, R: 11901}) {
		t.Fatalf("rune bag after exchange = %+v, want {2,11901}", bag.ChaBag["0"])
	}
}

func TestExchangeRune_BelowThresholdNoConversion(t *testing.T) {
	svc := newService(newJSONRepo())
	svc.SetRuneGameData(newGameData())
	svc.SetRuneCharProvider(&fakeCharProvider{exp: 0})
	ctx := context.Background()
	if err := svc.SaveChipBag(ctx, testCharID, map[string]ChipSlot{
		"1": {ChipID: "501", Num: 3},
	}); err != nil {
		t.Fatalf("seed chip bag: %v", err)
	}
	result, err := svc.ExchangeRune(ctx, testCharID)
	if err != nil {
		t.Fatalf("ExchangeRune: %v", err)
	}
	if result.Converted != 0 {
		t.Fatalf("converted = %d, want 0", result.Converted)
	}
	if result.ChipBag["1"].Num != 3 {
		t.Fatalf("chips must be untouched, got %d", result.ChipBag["1"].Num)
	}
	bag, _ := svc.GetRuneBag(ctx, testCharID)
	if len(bag.ChaBag) != 0 {
		t.Fatalf("rune bag must stay empty, got %+v", bag.ChaBag)
	}
}
