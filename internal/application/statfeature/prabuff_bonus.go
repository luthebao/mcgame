// Open-sourced by BaoLT

// PraBuff (Ma Pháp Bí Trận) combat-stat contribution. The 4 character-facing
// formation tracks fold into the equipment bonus pipeline; the 4 pet tracks
// (praTypes 2,4,6,8) drive pet stats elsewhere and are out of scope here.
//
// Per-level magnitudes are transcribed verbatim from GamePredef.as
// PLAYER_PARBUFF_LEVEL_{DEF,ATK,SPD}_EFFECT (index = track level 0..30). The
// client renders each value /100, so the stored bonus is effect/100: def /
// magicDef are flat damage-reduction percentage points (FinalPraDef /
// FinalPraMagDef via AddFloat, bypassing the rate normalizer so sub-1% low
// levels are not rescaled), while peoAttack (both phys + magic attack) and
// peoSpeed are integer-percent boosts (AddPercent rounds sub-1% low levels to 0,
// matching the existing mount / star percent path). State keys mirror
// prabuff.State.toPersist so this reads the same persisted pra_buff blob.
package statfeature

import (
	"math"

	domainchar "mcgame-server/internal/domain/character"
)

const praBuffMaxLevel = 30

var praBuffDefEffect = [...]int{
	0, 6, 18, 36, 59, 87, 121, 159, 202, 250, 302, 359, 420, 485, 553, 625,
	701, 780, 862, 947, 1034, 1125, 1217, 1312, 1409, 1508, 1609, 1712, 1815, 1920, 2026,
}

var praBuffAtkEffect = [...]int{
	0, 6, 18, 36, 59, 87, 121, 159, 202, 250, 302, 359, 420, 485, 553, 625,
	701, 780, 862, 947, 1060, 1173, 1315, 1493, 1694, 1927, 2186, 2485, 2812, 3150, 3500,
}

var praBuffSpdEffect = praBuffAtkEffect

func praBuffLevel(state map[string]interface{}, key string) int {
	level, ok := intValue(state[key])
	if !ok || level <= 0 {
		return 0
	}
	if level > praBuffMaxLevel {
		level = praBuffMaxLevel
	}
	return level
}

func applyPraBuffBonus(bonuses *domainchar.EquipmentStatBonuses, state map[string]interface{}) {
	if bonuses == nil || len(state) == 0 {
		return
	}
	if lvl := praBuffLevel(state, "def"); lvl > 0 {
		bonuses.AddFloat(domainchar.PropFinalPhysReduce, float64(praBuffDefEffect[lvl])/100.0)
	}
	if lvl := praBuffLevel(state, "magicDef"); lvl > 0 {
		bonuses.AddFloat(domainchar.PropFinalMagicReduce, float64(praBuffDefEffect[lvl])/100.0)
	}
	if lvl := praBuffLevel(state, "peoAttack"); lvl > 0 {
		pct := int(math.Round(float64(praBuffAtkEffect[lvl]) / 100.0))
		bonuses.AddPercent(domainchar.PropAttack, pct)
		bonuses.AddPercent(domainchar.PropMagicAttack, pct)
	}
	if lvl := praBuffLevel(state, "peoSpeed"); lvl > 0 {
		pct := int(math.Round(float64(praBuffSpdEffect[lvl]) / 100.0))
		bonuses.AddPercent(domainchar.PropSpeed, pct)
	}
}
