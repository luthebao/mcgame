// Open-sourced by BaoLT

// Unit tests for boss daily application service.
package activity

import (
	"context"
	"testing"
	"time"

	domainchar "mcgame-server/internal/domain/character"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

func newTestChar(id int64) *domainchar.Character {
	char := domainchar.NewCharacter(uuid.New(), "test", 1, 1)
	char.ID = id
	char.BossDaily = map[string]interface{}{}
	return char
}

func fixedTime(t time.Time) func() time.Time {
	return func() time.Time { return t }
}

func TestGetBossDailyData_NewState(t *testing.T) {
	char := newTestChar(1)
	repo := newPremiumTestCharacterRepo(char)
	svc := NewBossDailyService(repo, zap.NewNop())
	svc.SetNowFunc(fixedTime(time.Date(2026, 4, 13, 10, 0, 0, 0, time.UTC)))

	payload, err := svc.GetBossDailyData(context.Background(), 1)
	if err != nil {
		t.Fatalf("GetBossDailyData() error = %v", err)
	}

	total, ok := payload["total"].(int)
	if !ok || total != 16 {
		t.Fatalf("total = %v, want 16", payload["total"])
	}

	data := payload["data"].(map[string]interface{})
	day, ok := data["d"].(string)
	if !ok || day == "" {
		t.Fatalf("data.d = %v, want non-empty string", data["d"])
	}

	n, ok := data["n"].(int)
	if !ok || n != 0 {
		t.Fatalf("data.n = %v, want 0", data["n"])
	}

	dfd := data["dfd"].(map[string]interface{})
	if len(dfd) != 0 {
		t.Fatalf("dfd len = %d, want 0", len(dfd))
	}
}

func TestGetBossDailyData_DailyReset(t *testing.T) {
	char := newTestChar(1)
	char.BossDaily = map[string]interface{}{
		"d": "3|12|0",
		"n": 5,
		"now": int64(1000),
		"data": map[string]interface{}{
			"2204": map[string]interface{}{"d": "3|12|0", "n": 2},
		},
		"dfd": map[string]interface{}{
			"2204": 2204,
		},
	}
	repo := newPremiumTestCharacterRepo(char)
	svc := NewBossDailyService(repo, zap.NewNop())
	svc.SetNowFunc(fixedTime(time.Date(2026, 4, 13, 10, 0, 0, 0, time.UTC)))

	payload, err := svc.GetBossDailyData(context.Background(), 1)
	if err != nil {
		t.Fatalf("GetBossDailyData() error = %v", err)
	}

	data := payload["data"].(map[string]interface{})
	n := data["n"].(int)
	if n != 0 {
		t.Fatalf("after reset n = %d, want 0", n)
	}

	dfd := data["dfd"].(map[string]interface{})
	if len(dfd) != 0 {
		t.Fatalf("after reset dfd len = %d, want 0", len(dfd))
	}
}

func TestGetBossDailyData_CharacterNotFound(t *testing.T) {
	repo := newPremiumTestCharacterRepo()
	svc := NewBossDailyService(repo, zap.NewNop())

	_, err := svc.GetBossDailyData(context.Background(), 999)
	if err == nil {
		t.Fatal("expected error for missing character")
	}
}

func TestBossDailyBattle_Type1Success(t *testing.T) {
	char := newTestChar(1)
	repo := newPremiumTestCharacterRepo(char)
	svc := NewBossDailyService(repo, zap.NewNop())
	now := time.Date(2026, 4, 13, 10, 0, 0, 0, time.UTC)
	svc.SetNowFunc(fixedTime(now))

	err := svc.BossDailyBattle(context.Background(), 1, 2204)
	if err != nil {
		t.Fatalf("BossDailyBattle() error = %v", err)
	}

	updated, _ := repo.FindByID(context.Background(), 1)
	bd := updated.BossDaily
	data := bd["data"].(map[string]interface{})
	entry := data["2204"].(map[string]interface{})
	if entry["n"].(int) != 1 {
		t.Fatalf("entry.n = %v, want 1", entry["n"])
	}

	n := bd["n"].(int)
	if n != 1 {
		t.Fatalf("used count = %d, want 1", n)
	}

	dfd := bd["dfd"].(map[string]interface{})
	if dfd["2204"].(int) != 2204 {
		t.Fatalf("dfd[2204] = %v, want 2204", dfd["2204"])
	}
}

func TestBossDailyBattle_Type1MaxAttempts(t *testing.T) {
	char := newTestChar(1)
	char.BossDaily = map[string]interface{}{
		"d": "3|13|1",
		"n": 2,
		"now": int64(1000),
		"data": map[string]interface{}{
			"2204": map[string]interface{}{"d": "3|13|1", "n": 2},
		},
		"dfd": map[string]interface{}{},
	}
	repo := newPremiumTestCharacterRepo(char)
	svc := NewBossDailyService(repo, zap.NewNop())
	svc.SetNowFunc(fixedTime(time.Date(2026, 4, 13, 10, 0, 0, 0, time.UTC)))

	err := svc.BossDailyBattle(context.Background(), 1, 2204)
	if err == nil {
		t.Fatal("expected error for max attempts")
	}
}

func TestBossDailyBattle_Type2CooldownNotExpired(t *testing.T) {
	char := newTestChar(1)
	now := time.Date(2026, 4, 13, 10, 0, 0, 0, time.UTC)
	char.BossDaily = map[string]interface{}{
		"d": "3|13|1",
		"n": 1,
		"now": now.UnixMilli(),
		"data": map[string]interface{}{
			"2265": map[string]interface{}{"t": now.UnixMilli()},
		},
		"dfd": map[string]interface{}{},
	}
	repo := newPremiumTestCharacterRepo(char)
	svc := NewBossDailyService(repo, zap.NewNop())
	svc.SetNowFunc(fixedTime(now))

	err := svc.BossDailyBattle(context.Background(), 1, 2265)
	if err == nil {
		t.Fatal("expected error for cooldown not expired")
	}
}

func TestBossDailyBattle_Type2CooldownExpired(t *testing.T) {
	char := newTestChar(1)
	pastTime := time.Date(2026, 4, 10, 10, 0, 0, 0, time.UTC)
	now := time.Date(2026, 4, 13, 10, 0, 0, 0, time.UTC)
	char.BossDaily = map[string]interface{}{
		"d": "3|13|1",
		"n": 0,
		"now": now.UnixMilli(),
		"data": map[string]interface{}{
			"2265": map[string]interface{}{"t": pastTime.UnixMilli()},
		},
		"dfd": map[string]interface{}{},
	}
	repo := newPremiumTestCharacterRepo(char)
	svc := NewBossDailyService(repo, zap.NewNop())
	svc.SetNowFunc(fixedTime(now))

	err := svc.BossDailyBattle(context.Background(), 1, 2265)
	if err != nil {
		t.Fatalf("BossDailyBattle() error = %v", err)
	}

	updated, _ := repo.FindByID(context.Background(), 1)
	data := updated.BossDaily["data"].(map[string]interface{})
	entry := data["2265"].(map[string]interface{})
	newT := entry["t"].(int64)
	if newT != now.UnixMilli() {
		t.Fatalf("new t = %d, want %d", newT, now.UnixMilli())
	}
}

func TestBossDailyBattle_InvalidBossID(t *testing.T) {
	char := newTestChar(1)
	repo := newPremiumTestCharacterRepo(char)
	svc := NewBossDailyService(repo, zap.NewNop())

	err := svc.BossDailyBattle(context.Background(), 1, 9999)
	if err == nil {
		t.Fatal("expected error for invalid boss ID")
	}
}

func TestBossDailyBattle_DailyResetOnBattle(t *testing.T) {
	char := newTestChar(1)
	char.BossDaily = map[string]interface{}{
		"d": "3|12|0",
		"n": 5,
		"now": int64(1000),
		"data": map[string]interface{}{
			"2204": map[string]interface{}{"d": "3|12|0", "n": 2},
		},
		"dfd": map[string]interface{}{
			"2204": 2204,
		},
	}
	repo := newPremiumTestCharacterRepo(char)
	svc := NewBossDailyService(repo, zap.NewNop())
	svc.SetNowFunc(fixedTime(time.Date(2026, 4, 13, 10, 0, 0, 0, time.UTC)))

	err := svc.BossDailyBattle(context.Background(), 1, 2204)
	if err != nil {
		t.Fatalf("BossDailyBattle() error = %v", err)
	}

	updated, _ := repo.FindByID(context.Background(), 1)
	data := updated.BossDaily["data"].(map[string]interface{})
	entry := data["2204"].(map[string]interface{})
	if entry["n"].(int) != 1 {
		t.Fatalf("after reset+battle, n = %v, want 1", entry["n"])
	}
}

func TestBossDailyFinishByCard_BossDefeated(t *testing.T) {
	char := newTestChar(1)
	char.BossDaily = map[string]interface{}{
		"d": "3|13|1",
		"n": 1,
		"now": int64(1000),
		"data": map[string]interface{}{
			"2204": map[string]interface{}{"d": "3|13|1", "n": 1},
		},
		"dfd": map[string]interface{}{
			"2204": 2204,
		},
	}
	repo := newPremiumTestCharacterRepo(char)
	svc := NewBossDailyService(repo, zap.NewNop())

	err := svc.BossDailyFinishByCard(context.Background(), 1, 2204)
	if err != nil {
		t.Fatalf("BossDailyFinishByCard() error = %v", err)
	}
}

func TestBossDailyFinishByCard_BossNotDefeated(t *testing.T) {
	char := newTestChar(1)
	char.BossDaily = map[string]interface{}{
		"d": "3|13|1",
		"n": 0,
		"now": int64(1000),
		"data": map[string]interface{}{},
		"dfd": map[string]interface{}{},
	}
	repo := newPremiumTestCharacterRepo(char)
	svc := NewBossDailyService(repo, zap.NewNop())

	err := svc.BossDailyFinishByCard(context.Background(), 1, 2204)
	if err == nil {
		t.Fatal("expected error when boss not defeated today")
	}
}

func TestBossDailyFinishByCard_InvalidBossID(t *testing.T) {
	char := newTestChar(1)
	repo := newPremiumTestCharacterRepo(char)
	svc := NewBossDailyService(repo, zap.NewNop())

	err := svc.BossDailyFinishByCard(context.Background(), 1, 9999)
	if err == nil {
		t.Fatal("expected error for invalid boss ID")
	}
}
