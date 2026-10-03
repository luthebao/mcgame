// Open-sourced by BaoLT

package events

import (
	"context"
	"testing"

	"go.uber.org/zap"
)

type busTestLoginListener struct {
	loginCount int
	lastCharID int64
}

func (l *busTestLoginListener) OnLogin(ctx context.Context, charID int64) error {
	l.loginCount++
	l.lastCharID = charID
	return nil
}

type busTestKillListener struct {
	killCount    int
	lastCharID   int64
	lastTargetID int64
	lastAmount   int
}

func (l *busTestKillListener) OnMonsterKilled(ctx context.Context, charID, creatureID int64, count int) error {
	l.killCount++
	l.lastCharID = charID
	l.lastTargetID = creatureID
	l.lastAmount = count
	return nil
}

func TestBusDispatchesOnlyMatchingListeners(t *testing.T) {
	bus := NewBus(zap.NewNop())
	loginListener := &busTestLoginListener{}
	killListener := &busTestKillListener{}

	bus.Register(loginListener)
	bus.Register(killListener)

	bus.EmitLogin(context.Background(), 101)

	if loginListener.loginCount != 1 {
		t.Fatalf("loginCount = %d, want 1", loginListener.loginCount)
	}
	if loginListener.lastCharID != 101 {
		t.Fatalf("lastCharID = %d, want 101", loginListener.lastCharID)
	}
	if killListener.killCount != 0 {
		t.Fatalf("killCount after login emit = %d, want 0", killListener.killCount)
	}

	bus.EmitMonsterKilled(context.Background(), 202, 303, 2)

	if killListener.killCount != 1 {
		t.Fatalf("killCount = %d, want 1", killListener.killCount)
	}
	if killListener.lastCharID != 202 {
		t.Fatalf("lastCharID = %d, want 202", killListener.lastCharID)
	}
	if killListener.lastTargetID != 303 {
		t.Fatalf("lastTargetID = %d, want 303", killListener.lastTargetID)
	}
	if killListener.lastAmount != 2 {
		t.Fatalf("lastAmount = %d, want 2", killListener.lastAmount)
	}
}
