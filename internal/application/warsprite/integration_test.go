// Open-sourced by BaoLT

package warsprite

import (
	"context"
	"testing"

	appstatfeature "mcgame-server/internal/application/statfeature"
	domainchar "mcgame-server/internal/domain/character"
	domainwsp "mcgame-server/internal/domain/warsprite"

	"go.uber.org/zap"
)

func TestUpgrade_FlowsIntoCombatStatBonuses(t *testing.T) {
	char := &domainchar.Character{ID: 7, WarSprite: 5000, BattleSprite: 5000}
	svc, repo, mgr := newSvc(t, char)

	statSvc := appstatfeature.NewService(repo, zap.NewNop())
	statSvc.SetGameDataManager(mgr)

	before := statSvc.AggregateCharacterStatBonuses(context.Background(), 7)
	if before.Flat[domainchar.PropMaxHP] != 0 {
		t.Fatalf("baseline (no state row) should have 0 HP bonus from war sprite, got %d",
			before.Flat[domainchar.PropMaxHP])
	}

	if _, err := svc.Upgrade(context.Background(), 7, domainwsp.KindWarSprite, 1, false); err != nil {
		t.Fatalf("Upgrade war: %v", err)
	}
	if _, err := svc.Upgrade(context.Background(), 7, domainwsp.KindBattleSprite, 1, false); err != nil {
		t.Fatalf("Upgrade battle: %v", err)
	}

	after := statSvc.AggregateCharacterStatBonuses(context.Background(), 7)
	if after.Flat[domainchar.PropMaxHP] != 156 {
		t.Fatalf("war level 1 HP=150 + 150×400/10000 = 156; got %d",
			after.Flat[domainchar.PropMaxHP])
	}
}
