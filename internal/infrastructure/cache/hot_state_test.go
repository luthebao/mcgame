// Open-sourced by BaoLT

package cache

import (
	"context"
	"testing"
	"time"

	"go.uber.org/zap/zaptest"
)

func TestNewHotStateBuffer(t *testing.T) {
	charID := int64(12345)
	buf := NewHotStateBuffer(charID)

	if buf == nil {
		t.Fatal("NewHotStateBuffer returned nil")
	}

	if buf.current.CharID != charID {
		t.Errorf("expected CharID %d, got %d", charID, buf.current.CharID)
	}

	if buf.pending == nil {
		t.Error("pending state should not be nil")
	}

	if buf.current.Buffs == nil {
		t.Error("Buffs should be initialized")
	}

	if buf.current.Debuffs == nil {
		t.Error("Debuffs should be initialized")
	}
}

func TestHotStateBuffer_Get(t *testing.T) {
	buf := NewHotStateBuffer(12345)
	state := buf.Get()

	if state == nil {
		t.Fatal("Get returned nil")
	}

	if state.CharID != 12345 {
		t.Errorf("expected CharID 12345, got %d", state.CharID)
	}
}

func TestHotStateBuffer_Update(t *testing.T) {
	buf := NewHotStateBuffer(12345)

	buf.Update(func(s *PlayerHotState) {
		s.MapID = 100
		s.PosX = 50.5
		s.PosY = 75.25
		s.CurrentHP = 500
		s.CurrentMP = 300
	})

	state := buf.Get()
	if state.MapID != 100 {
		t.Errorf("expected MapID 100, got %d", state.MapID)
	}
	if state.PosX != 50.5 {
		t.Errorf("expected PosX 50.5, got %f", state.PosX)
	}
	if state.PosY != 75.25 {
		t.Errorf("expected PosY 75.25, got %f", state.PosY)
	}
	if state.CurrentHP != 500 {
		t.Errorf("expected CurrentHP 500, got %d", state.CurrentHP)
	}
	if state.CurrentMP != 300 {
		t.Errorf("expected CurrentMP 300, got %d", state.CurrentMP)
	}
}

func TestHotStateBuffer_UpdateBuffs(t *testing.T) {
	buf := NewHotStateBuffer(12345)

	buf.Update(func(s *PlayerHotState) {
		s.Buffs = append(s.Buffs, 100, 200, 300)
		s.Debuffs = append(s.Debuffs, 400)
	})

	state := buf.Get()
	if len(state.Buffs) != 3 {
		t.Errorf("expected 3 buffs, got %d", len(state.Buffs))
	}
	if len(state.Debuffs) != 1 {
		t.Errorf("expected 1 debuff, got %d", len(state.Debuffs))
	}
}

func TestDeepCopyHotState(t *testing.T) {
	original := &PlayerHotState{
		CharID:     12345,
		MapID:      100,
		PosX:       50.5,
		PosY:       75.25,
		CurrentHP:  500,
		CurrentMP:  300,
		MaxHP:      1000,
		MaxMP:      500,
		Buffs:      []int64{100, 200},
		Debuffs:    []int64{300},
		TargetID:   999,
		LastTick:   time.Now().UnixNano(),
		TempBagSlots: 5,
		MxTempBagSlots: 10,
	}

	copy := deepCopyHotState(original)

	if copy.CharID != original.CharID {
		t.Errorf("CharID mismatch: %d vs %d", copy.CharID, original.CharID)
	}
	if copy.MapID != original.MapID {
		t.Errorf("MapID mismatch: %d vs %d", copy.MapID, original.MapID)
	}
	if copy.PosX != original.PosX {
		t.Errorf("PosX mismatch: %f vs %f", copy.PosX, original.PosX)
	}
	if copy.PosY != original.PosY {
		t.Errorf("PosY mismatch: %f vs %f", copy.PosY, original.PosY)
	}
	if copy.CurrentHP != original.CurrentHP {
		t.Errorf("CurrentHP mismatch: %d vs %d", copy.CurrentHP, original.CurrentHP)
	}
	if copy.CurrentMP != original.CurrentMP {
		t.Errorf("CurrentMP mismatch: %d vs %d", copy.CurrentMP, original.CurrentMP)
	}
	if copy.MaxHP != original.MaxHP {
		t.Errorf("MaxHP mismatch: %d vs %d", copy.MaxHP, original.MaxHP)
	}
	if copy.MaxMP != original.MaxMP {
		t.Errorf("MaxMP mismatch: %d vs %d", copy.MaxMP, original.MaxMP)
	}

	if len(copy.Buffs) != len(original.Buffs) {
		t.Errorf("Buffs length mismatch: %d vs %d", len(copy.Buffs), len(original.Buffs))
	}
	for i := range original.Buffs {
		if copy.Buffs[i] != original.Buffs[i] {
			t.Errorf("Buff[%d] mismatch: %d vs %d", i, copy.Buffs[i], original.Buffs[i])
		}
	}

	if len(copy.Debuffs) != len(original.Debuffs) {
		t.Errorf("Debuffs length mismatch: %d vs %d", len(copy.Debuffs), len(original.Debuffs))
	}
	for i := range original.Debuffs {
		if copy.Debuffs[i] != original.Debuffs[i] {
			t.Errorf("Debuff[%d] mismatch: %d vs %d", i, copy.Debuffs[i], original.Debuffs[i])
		}
	}

	if copy.TargetID != original.TargetID {
		t.Errorf("TargetID mismatch: %d vs %d", copy.TargetID, original.TargetID)
	}
	if copy.LastTick != original.LastTick {
		t.Errorf("LastTick mismatch: %d vs %d", copy.LastTick, original.LastTick)
	}
	if copy.TempBagSlots != original.TempBagSlots {
		t.Errorf("TempBagSlots mismatch: %d vs %d", copy.TempBagSlots, original.TempBagSlots)
	}
	if copy.MxTempBagSlots != original.MxTempBagSlots {
		t.Errorf("MxTempBagSlots mismatch: %d vs %d", copy.MxTempBagSlots, original.MxTempBagSlots)
	}

	original.Buffs[0] = 999
	if copy.Buffs[0] == 999 {
		t.Error("Copy was not deep - buffs slice was modified")
	}
}

func TestHotStateBuffer_StopSync(t *testing.T) {
	buf := NewHotStateBuffer(12345)

	if buf.stopCh == nil {
		t.Fatal("stopCh should be initialized")
	}

	select {
	case <-buf.stopCh:
		t.Fatal("stopCh should not be closed yet")
	default:
	}

	buf.StopSync()

	select {
	case <-buf.stopCh:
	default:
		t.Fatal("stopCh should be closed after StopSync")
	}
}

func TestHotStateBuffer_SyncToRedis_NilClient(t *testing.T) {
	buf := NewHotStateBuffer(12345)
	logger := zaptest.NewLogger(t)

	err := buf.syncToRedis(context.Background(), nil, logger)
	if err != nil {
		t.Errorf("expected no error with nil client, got %v", err)
	}
}
