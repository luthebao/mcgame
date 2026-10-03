// Open-sourced by BaoLT

// Character → EffectiveStats projection for the per-mille combat pipeline.
package character

import "mcgame-server/internal/domain/stats"

func (c *Character) Effective() stats.EffectiveStats {
	es := stats.NewEffectiveStats()

	es.Set(stats.PropHP, int64(c.MaxHP))
	es.Set(stats.PropMP, int64(c.MaxMP))
	es.Set(stats.PropPhysAtk, int64(c.Attack))
	es.Set(stats.PropMagAtk, int64(c.MagicAttack))
	es.Set(stats.PropPhysDef, int64(c.Defense))
	es.Set(stats.PropMagDef, int64(c.MagicDefense))
	es.Set(stats.PropAccuracy, int64(c.Hit))
	es.Set(stats.PropDodge, int64(c.Dodge))
	es.Set(stats.PropSpeed, int64(c.Speed))

	es.Set(stats.PropCritRate, int64(c.Critical)*10)
	es.Set(stats.PropCritDmgBonus, int64(max(0, c.CriticalDmg-BaseCriticalDamagePercent))*10)

	es.Set(stats.PropCounter, int64(c.FinalCounter)*10)
	es.Set(stats.PropCombo, int64(c.FinalCombo)*10)

	es.Set(stats.PropDefy, int64(c.FinalPraDef)*10)
	es.Set(stats.PropMagDefy, int64(c.FinalPraMagDef)*10)
	es.Set(stats.PropResistDefy, int64(c.FinalResiDefy)*10)
	es.Set(stats.PropResistCrit, int64(c.FinalResiCritical)*10)

	es.Set(stats.PropFinalPhysDmgUp, stats.PerMille+int64(c.FinalEnhPhyHurt)*10)
	es.Set(stats.PropFinalMagDmgUp, stats.PerMille+int64(c.FinalEnhMagicHurt)*10)
	es.Set(stats.PropFinalPhysDmgDown, 0)
	es.Set(stats.PropFinalMagDmgDown, 0)

	es.Set(stats.PropPhysDmgCut, int64(c.FinalReduceHurt1)*10)
	es.Set(stats.PropMagDmgCut, int64(c.FinalReduceHurt2)*10)

	es.Set(stats.PropDeathImmune, stats.FromPercent(float64(c.FinalRebornRate)))
	es.Set(stats.PropBreakDeathImmune, int64(c.FinalBreakReborn*10))

	es.Set(stats.PropStunAcc, int64(c.FinalDizzy*10))
	es.Set(stats.PropConfuseAcc, int64(c.FinalConfusion*10))
	es.Set(stats.PropResistStun, int64(c.FinalResiDizzy*10))
	es.Set(stats.PropResistConfuse, int64(c.FinalResiConfusion*10))

	return es
}
