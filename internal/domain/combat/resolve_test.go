// Open-sourced by BaoLT

package combat

import (
	"math/rand"
	"testing"

	"mcgame-server/internal/domain/skill"
	"mcgame-server/internal/domain/stats"
)

func basicPhysSkill() *SkillInfo {
	return nil
}

func physSkill(multiplierPct float64, attackCount int) *SkillInfo {
	return &SkillInfo{
		Template: &skill.SkillTemplate{
			SkillType:   skill.SkillTypePhysical,
			Multiplier:  multiplierPct,
			AttackCount: attackCount,
		},
	}
}

func magicSkill(multiplierPct float64, attackCount int) *SkillInfo {
	return &SkillInfo{
		Template: &skill.SkillTemplate{
			SkillType:   skill.SkillTypeMagic,
			Multiplier:  multiplierPct,
			AttackCount: attackCount,
		},
	}
}

func makeParticipant(attack, defense, hit, dodge, crit, combo int) *Participant {
	p := NewParticipant("a", "test", SidePlayer, false)
	p.Attack = attack
	p.Defense = defense
	p.Hit = hit
	p.Dodge = dodge
	p.Critical = crit
	p.Combo = combo
	p.CriticalDmg = 150
	p.MaxHP = 100_000
	p.CurrentHP = 100_000
	return p
}

func TestResolveHits_BasicPhys_SingleHit(t *testing.T) {
	atk := makeParticipant(1000, 0, 500, 0, 0, 0)
	def := makeParticipant(0, 0, 0, 0, 0, 0)
	rng := rand.New(rand.NewSource(1))

	hits := ResolveHits(atk, def, basicPhysSkill(), rng)
	if len(hits) != 1 {
		t.Fatalf("expected 1 hit, got %d", len(hits))
	}
	if hits[0].IsMiss {
		t.Fatal("should not miss with dodge=0")
	}
	if hits[0].Damage != 1000 {
		t.Fatalf("expected damage=1000 (atk*1.0 - def=0), got %d", hits[0].Damage)
	}
}

func TestResolveHits_Combo_AlwaysMax(t *testing.T) {
	atk := makeParticipant(100, 0, 500, 0, 0, 100)
	def := makeParticipant(0, 0, 0, 0, 0, 0)
	rng := rand.New(rand.NewSource(1))

	hits := ResolveHits(atk, def, basicPhysSkill(), rng)
	if len(hits) != maxComboHits {
		t.Fatalf("combo=100 (1000 per-mille) should produce %d hits, got %d", maxComboHits, len(hits))
	}
}

func TestResolveHits_Combo_Zero(t *testing.T) {
	atk := makeParticipant(100, 0, 500, 0, 0, 0)
	def := makeParticipant(0, 0, 0, 0, 0, 0)
	rng := rand.New(rand.NewSource(1))

	hits := ResolveHits(atk, def, basicPhysSkill(), rng)
	if len(hits) != 1 {
		t.Fatalf("combo=0 should produce exactly 1 hit, got %d", len(hits))
	}
}

func TestResolveHits_FinalDmgMultiplierZero(t *testing.T) {
	atk := makeParticipant(5000, 0, 500, 0, 0, 0)
	def := makeParticipant(0, 0, 0, 0, 0, 0)

	aStats := shimEffStats(atk)
	dStats := shimEffStats(def)
	aStats.Set(stats.PropFinalPhysDmgUp, 1000)
	dStats.Set(stats.PropFinalPhysDmgDown, 2000)

	rng := rand.New(rand.NewSource(1))
	hits := resolveHitsWithStats(atk, def, &aStats, &dStats, basicPhysSkill(), rng)
	if len(hits) < 1 {
		t.Fatal("expected at least 1 result")
	}
	if hits[0].Damage != 0 {
		t.Fatalf("expected damage=0 when GiảmSTCuối > TăngSTCuối, got %d", hits[0].Damage)
	}
}

func TestResolveHits_XPN_BypassDefEveryHit(t *testing.T) {
	atk := makeParticipant(1000, 0, 500, 0, 0, 0)
	def := makeParticipant(0, 500, 0, 0, 0, 0)
	rng := rand.New(rand.NewSource(1))

	aStats := shimEffStats(atk)
	dStats := shimEffStats(def)
	aStats.Set(stats.PropDefy, 1000)
	dStats.Set(stats.PropResistDefy, 0)

	hits := resolveHitsWithStats(atk, def, &aStats, &dStats, basicPhysSkill(), rng)
	for i, h := range hits {
		if !h.IsDefBypass {
			t.Errorf("hit %d: expected IsDefBypass=true with XPN=1000", i)
		}
	}
}

func TestResolveHits_XPN_NeverBypassWhenBlocked(t *testing.T) {
	atk := makeParticipant(1000, 0, 500, 0, 0, 0)
	def := makeParticipant(0, 500, 0, 0, 0, 0)

	aStats := shimEffStats(atk)
	dStats := shimEffStats(def)
	aStats.Set(stats.PropDefy, 0)

	rng := rand.New(rand.NewSource(1))
	hits := resolveHitsWithStats(atk, def, &aStats, &dStats, basicPhysSkill(), rng)
	for i, h := range hits {
		if h.IsDefBypass {
			t.Errorf("hit %d: IsDefBypass should be false when XPN=0", i)
		}
	}
}

func TestResolveHits_DeathImmune_SaveActivates(t *testing.T) {
	atk := makeParticipant(100_000, 0, 500, 0, 0, 0)
	def := makeParticipant(0, 0, 0, 0, 0, 0)
	def.CurrentHP = 1
	def.MaxHP = 1

	aStats := shimEffStats(atk)
	dStats := shimEffStats(def)
	dStats.Set(stats.PropDeathImmune, 1000)
	aStats.Set(stats.PropBreakDeathImmune, 0)

	rng := rand.New(rand.NewSource(1))
	hits := resolveHitsWithStats(atk, def, &aStats, &dStats, basicPhysSkill(), rng)

	if len(hits) < 1 {
		t.Fatal("expected at least 1 result")
	}
	saved := false
	for _, h := range hits {
		if h.IsDeathSave {
			saved = true
			if h.Damage != 0 {
				t.Errorf("death save hit should have 0 damage, got %d", h.Damage)
			}
		}
	}
	if !saved {
		t.Fatal("expected death save to activate with DeathImmune=1000")
	}
	if !def.DeathImmuneUsed {
		t.Fatal("DeathImmuneUsed flag must be set after save")
	}
}

func TestResolveHits_DeathImmune_OnceOnly(t *testing.T) {
	atk := makeParticipant(100_000, 0, 500, 0, 0, 0)
	def := makeParticipant(0, 0, 0, 0, 0, 0)
	def.CurrentHP = 1
	def.MaxHP = 1
	def.DeathImmuneUsed = true

	aStats := shimEffStats(atk)
	dStats := shimEffStats(def)
	dStats.Set(stats.PropDeathImmune, 1000)

	rng := rand.New(rand.NewSource(1))
	hits := resolveHitsWithStats(atk, def, &aStats, &dStats, basicPhysSkill(), rng)

	for _, h := range hits {
		if h.IsDeathSave {
			t.Fatal("second save must not trigger when DeathImmuneUsed=true")
		}
	}
}

func TestResolveHits_Critical_WithCritDmgBonus(t *testing.T) {
	atk := makeParticipant(1000, 0, 500, 0, 100, 0)
	def := makeParticipant(0, 0, 0, 0, 0, 0)

	aStats := shimEffStats(atk)
	dStats := shimEffStats(def)
	aStats.Set(stats.PropCritRate, 1000)
	aStats.Set(stats.PropCritDmgBonus, 500)
	dStats.Set(stats.PropResistCrit, 0)

	rng := rand.New(rand.NewSource(1))
	hits := resolveHitsWithStats(atk, def, &aStats, &dStats, basicPhysSkill(), rng)
	if len(hits) != 1 {
		t.Fatalf("expected 1 hit, got %d", len(hits))
	}
	h := hits[0]
	if !h.IsCrit {
		t.Fatal("expected critical hit with CritRate=1000")
	}
	want := int64(1000) * 2500 / 1000 * 1500 / 1000
	if h.Damage != want {
		t.Fatalf("damage with ST Bạo=500: got %d, want %d", h.Damage, want)
	}
}

func TestResolveHits_CritResisted_Never(t *testing.T) {
	atk := makeParticipant(1000, 0, 500, 0, 50, 0)
	def := makeParticipant(0, 0, 0, 0, 0, 0)

	aStats := shimEffStats(atk)
	dStats := shimEffStats(def)
	aStats.Set(stats.PropCritRate, 500)
	dStats.Set(stats.PropResistCrit, 600)

	rng := rand.New(rand.NewSource(1))
	for range 200 {
		hits := resolveHitsWithStats(atk, def, &aStats, &dStats, basicPhysSkill(), rng)
		for _, h := range hits {
			if h.IsCrit {
				t.Fatal("should never crit when ResistCrit > CritRate")
			}
		}
	}
}

func TestResolveHits_SkillAttackCount(t *testing.T) {
	atk := makeParticipant(1000, 0, 500, 0, 0, 0)
	def := makeParticipant(0, 0, 0, 0, 0, 0)
	rng := rand.New(rand.NewSource(1))

	sk := physSkill(0.65, 5)
	hits := ResolveHits(atk, def, sk, rng)
	if len(hits) != 5 {
		t.Fatalf("skill with AttackCount=5 should produce 5 hits, got %d", len(hits))
	}
}

func TestResolveHits_MagicSkillUsesMagicAtk(t *testing.T) {
	atk := makeParticipant(0, 0, 500, 0, 0, 0)
	atk.MagicAttack = 800
	def := makeParticipant(0, 0, 0, 0, 0, 0)
	def.MagicDefense = 0
	rng := rand.New(rand.NewSource(1))

	sk := magicSkill(1.0, 1)
	hits := ResolveHits(atk, def, sk, rng)
	if len(hits) != 1 || hits[0].Damage != 800 {
		t.Fatalf("magic skill: expected 800 damage, got %+v", hits)
	}
}
