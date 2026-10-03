// Open-sourced by BaoLT

// Per-mille damage pipeline.
// Active in tests unconditionally; in production gated by UsePermilleV2().
package combat

import (
	"math/rand"
	"os"

	"mcgame-server/internal/domain/skill"
	"mcgame-server/internal/domain/stats"
)

var usePermilleV2 = os.Getenv("COMBAT_PERMILLE_V2") == "1"

func UsePermilleV2() bool { return usePermilleV2 }

const (
	maxComboHits       = 11
	critBaseMultiplier = 2500
)

type HitFlags struct {
	Counter bool
	Stun    bool
	Confuse bool
}

type HitResult struct {
	Damage      int64
	IsCrit      bool
	IsMiss      bool
	IsDeathSave bool
	IsDefBypass bool
	Flags       HitFlags
}

func ResolveHits(atk, def *Participant, sk *SkillInfo, rng *rand.Rand) []HitResult {
	aStats := effectiveStatsFor(atk)
	dStats := effectiveStatsFor(def)
	return resolveHitsWithStats(atk, def, &aStats, &dStats, sk, rng)
}

func effectiveStatsFor(p *Participant) stats.EffectiveStats {
	if p.EffStats.Get(stats.PropHP) > 0 {
		return p.EffStats
	}
	return shimEffStats(p)
}

func resolveHitsWithStats(_ *Participant, def *Participant, aStats, dStats *stats.EffectiveStats, sk *SkillInfo, rng *rand.Rand) []HitResult {
	isMagic := sk != nil && sk.Template.SkillType == skill.SkillTypeMagic
	isBasicPhys := sk == nil

	hitCount := computeHitCount(aStats, sk, isBasicPhys, rng)

	results := make([]HitResult, 0, hitCount)
	for range hitCount {
		r := resolveOneHit(def, aStats, dStats, sk, isBasicPhys, isMagic, rng)
		results = append(results, r)
		if r.IsDeathSave {
			break
		}
	}
	return results
}

func computeHitCount(aStats *stats.EffectiveStats, sk *SkillInfo, isBasicPhys bool, rng *rand.Rand) int {
	if isBasicPhys {
		combo := aStats.Get(stats.PropCombo)
		if combo >= stats.PerMille {
			return maxComboHits
		}
		count := 1
		for range maxComboHits - 1 {
			if stats.RollPerMille(rng, combo) {
				count++
			} else {
				break
			}
		}
		return count
	}
	if sk != nil && sk.Template.AttackCount > 1 {
		return sk.Template.AttackCount
	}
	return 1
}

func resolveOneHit(def *Participant, aStats, dStats *stats.EffectiveStats, sk *SkillInfo, isBasicPhys, isMagic bool, rng *rand.Rand) HitResult {
	r := HitResult{}

	dodgeChancePM := stats.ClampPM(dStats.Get(stats.PropDodge) - aStats.Get(stats.PropAccuracy))
	if stats.RollPerMille(rng, dodgeChancePM) {
		r.IsMiss = true
		return r
	}

	var baseAtk, baseDef int64
	var finalDmgUp, finalDmgDown, dmgCut stats.PropID
	if isMagic {
		baseAtk = aStats.Get(stats.PropMagAtk)
		baseDef = dStats.Get(stats.PropMagDef)
		finalDmgUp = stats.PropFinalMagDmgUp
		finalDmgDown = stats.PropFinalMagDmgDown
		dmgCut = stats.PropMagDmgCut
	} else {
		baseAtk = aStats.Get(stats.PropPhysAtk)
		baseDef = dStats.Get(stats.PropPhysDef)
		finalDmgUp = stats.PropFinalPhysDmgUp
		finalDmgDown = stats.PropFinalPhysDmgDown
		dmgCut = stats.PropPhysDmgCut
	}

	var defPropPen stats.PropID
	if isMagic {
		defPropPen = stats.PropMagDefy
	} else {
		defPropPen = stats.PropDefy
	}

	skillMulPM := stats.PerMille
	if sk != nil {
		skillMulPM = int64(sk.Template.Multiplier * float64(stats.PerMille))
	}

	dmgUp := aStats.Get(finalDmgUp)
	dmgDown := dStats.Get(finalDmgDown)
	finalDelta := dmgUp - dmgDown
	if finalDelta <= 0 {
		r.Damage = 0
		return r
	}

	dmg := stats.MulPM(baseAtk, skillMulPM)
	dmg = stats.MulPM(dmg, finalDelta)

	penChance := stats.ClampPM(aStats.Get(defPropPen) - dStats.Get(stats.PropResistDefy))
	bypassDef := stats.RollPerMille(rng, penChance)
	r.IsDefBypass = bypassDef
	if !bypassDef && baseDef > 0 {
		dmg -= baseDef
	}

	cut := stats.ClampPM(dStats.Get(dmgCut))
	dmg = stats.MulPM(dmg, stats.PerMille-cut)

	dmg = max(dmg, 0)

	critChance := stats.ClampPM(aStats.Get(stats.PropCritRate) - dStats.Get(stats.PropResistCrit))
	if stats.RollPerMille(rng, critChance) {
		r.IsCrit = true
		dmg = stats.MulPM(dmg, critBaseMultiplier)
		if bonus := aStats.Get(stats.PropCritDmgBonus); bonus > 0 {
			dmg = stats.MulPM(dmg, stats.PerMille+bonus)
		}
	}

	if dmg >= int64(def.CurrentHP) && !def.DeathImmuneUsed {
		saveChance := stats.ClampPM(dStats.Get(stats.PropDeathImmune) - aStats.Get(stats.PropBreakDeathImmune))
		if stats.RollPerMille(rng, saveChance) {
			def.DeathImmuneUsed = true
			r.IsDeathSave = true
			r.Damage = 0
			return r
		}
	}

	r.Damage = dmg

	if isBasicPhys {
		ctrChance := stats.ClampPM(dStats.Get(stats.PropCounter))
		r.Flags.Counter = stats.RollPerMille(rng, ctrChance)
	}

	stunChance := stats.ClampPM(aStats.Get(stats.PropStunAcc) - dStats.Get(stats.PropResistStun))
	r.Flags.Stun = stats.RollPerMille(rng, stunChance)

	confuseChance := stats.ClampPM(aStats.Get(stats.PropConfuseAcc) - dStats.Get(stats.PropResistConfuse))
	r.Flags.Confuse = stats.RollPerMille(rng, confuseChance)

	return r
}

func shimEffStats(p *Participant) stats.EffectiveStats {
	es := stats.NewEffectiveStats()

	es.Set(stats.PropHP, int64(p.MaxHP))
	es.Set(stats.PropMP, int64(p.MaxMP))
	es.Set(stats.PropPhysAtk, int64(p.Attack))
	es.Set(stats.PropMagAtk, int64(p.MagicAttack))
	es.Set(stats.PropPhysDef, int64(p.Defense))
	es.Set(stats.PropMagDef, int64(p.MagicDefense))
	es.Set(stats.PropAccuracy, int64(p.Hit))
	es.Set(stats.PropDodge, int64(p.Dodge))
	es.Set(stats.PropSpeed, int64(p.Speed))

	es.Set(stats.PropCritRate, int64(p.Critical)*10)
	critBonus := max(0, int64(p.CriticalDmg)-stats.BaseCritDmgPercent)
	es.Set(stats.PropCritDmgBonus, critBonus*10)

	es.Set(stats.PropCounter, int64(p.Counter)*10)
	es.Set(stats.PropCombo, int64(p.Combo)*10)

	es.Set(stats.PropDefy, int64(p.PraDef)*10)
	es.Set(stats.PropMagDefy, int64(p.PraMagDef)*10)
	es.Set(stats.PropResistDefy, int64(p.ResiDefy)*10)
	es.Set(stats.PropResistCrit, int64(p.ResiCritical)*10)

	es.Set(stats.PropFinalPhysDmgUp, stats.PerMille+int64(p.EnhPhyHurt)*10)
	es.Set(stats.PropFinalMagDmgUp, stats.PerMille+int64(p.EnhMagicHurt)*10)
	es.Set(stats.PropFinalPhysDmgDown, 0)
	es.Set(stats.PropFinalMagDmgDown, 0)

	es.Set(stats.PropPhysDmgCut, int64(p.ReduceHurt1)*10)
	es.Set(stats.PropMagDmgCut, int64(p.ReduceHurt2)*10)

	return es
}
