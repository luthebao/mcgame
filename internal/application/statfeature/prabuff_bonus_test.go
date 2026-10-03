// Open-sourced by BaoLT

package statfeature

import (
	"testing"

	domainchar "mcgame-server/internal/domain/character"
)

func TestApplyPraBuffBonus_CharTracksFoldIntoStats(t *testing.T) {
	bonuses := domainchar.NewEquipmentStatBonuses()
	state := map[string]interface{}{
		"def":       30,
		"magicDef":  30,
		"peoAttack": 30,
		"peoSpeed":  30,
	}
	applyPraBuffBonus(&bonuses, state)

	wantReduce := float64(praBuffDefEffect[30]) / 100.0
	if got := bonuses.Float[domainchar.PropFinalPhysReduce]; got != wantReduce {
		t.Fatalf("phys reduce = %v, want %v", got, wantReduce)
	}
	if got := bonuses.Float[domainchar.PropFinalMagicReduce]; got != wantReduce {
		t.Fatalf("magic reduce = %v, want %v", got, wantReduce)
	}
	if got := bonuses.Percent[domainchar.PropAttack]; got != 35 {
		t.Fatalf("attack pct = %d, want 35", got)
	}
	if got := bonuses.Percent[domainchar.PropMagicAttack]; got != 35 {
		t.Fatalf("magic attack pct = %d, want 35", got)
	}
	if got := bonuses.Percent[domainchar.PropSpeed]; got != 35 {
		t.Fatalf("speed pct = %d, want 35", got)
	}
}

func TestApplyPraBuffBonus_PetTracksIgnored(t *testing.T) {
	bonuses := domainchar.NewEquipmentStatBonuses()
	state := map[string]interface{}{
		"petDef": 30, "petMagicDef": 30, "petAttack": 30, "petSpeed": 30,
	}
	applyPraBuffBonus(&bonuses, state)
	if len(bonuses.Float) != 0 || len(bonuses.Percent) != 0 {
		t.Fatalf("pet tracks must not touch char stats: float=%v percent=%v", bonuses.Float, bonuses.Percent)
	}
}

func TestApplyPraBuffBonus_ClampsHighAndDropsSubPercent(t *testing.T) {
	bonuses := domainchar.NewEquipmentStatBonuses()
	state := map[string]interface{}{
		"def":       99,
		"peoAttack": 1,
	}
	applyPraBuffBonus(&bonuses, state)

	wantReduce := float64(praBuffDefEffect[praBuffMaxLevel]) / 100.0
	if got := bonuses.Float[domainchar.PropFinalPhysReduce]; got != wantReduce {
		t.Fatalf("clamped phys reduce = %v, want %v", got, wantReduce)
	}
	if got := bonuses.Percent[domainchar.PropAttack]; got != 0 {
		t.Fatalf("level-1 attack pct = %d, want 0 (6/100 rounds down)", got)
	}
}
