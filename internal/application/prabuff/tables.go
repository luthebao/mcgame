// Open-sourced by BaoLT

// praBuff level-up tables, copied verbatim from the Flash client GamePredef.as
// (PLAYER_PARBUFF_LEVEL_EXP / PLAYER_PARBUFF_ADD_EXP). The server must mirror them
// because they are client-side SWF constants, not game-data rows.
//
// levelExp[i] = cumulative total exp required to LEAVE level i (i.e. reach level i+1).
// addExp[i]   = exp gained per practice action while at level i.
//
// CRIT (critMulit) — DOCUMENTED ASSUMPTION, calibrate vs live-log: the crit chance
// and exp multiplier for addPracticeExp exist in NO accessible source (DB has no
// data_tbl_parbuff; the client GamePredef carries LEVEL_EXP/ADD_EXP but no crit odds;
// the client only consumes the critMulit bool to swap a label). Conservative defaults
// are used here, isolated as the two named constants below so a live-log capture can
// retune them in one place. The roll is a PER-ACTION runtime event — it never touches
// the login snapshot (login carries no crit), keeping login byte-parity intact.
//
//	critRatePercent  = chance (out of 100) that a single addPracticeExp action crits.
//	critExpMultiplier = total exp multiplier applied to addExp[level] on a crit.
//
// Deferred (NOT server work this scope): the rebirth-rank gate PLAYER_PARBUFF_LEVEL_LIMIT
// and the DEF/ATK/SPD effect tables — both are client-side display-only lookups indexed
// off the buff the server already sends, and the actual combat stat bonus needs a combat
// engine (out of scope).
package prabuff

const (
	critRatePercent   = 10
	critExpMultiplier = 2
)

var levelExp = [MaxLevel]int{
	253, 753, 1495, 2474, 3684, 5122, 6782, 8659, 10750, 13050,
	15555, 18261, 21164, 24260, 27546, 31017, 34672, 38505, 42514, 46696,
	51047, 55565, 60247, 65089, 70089, 75244, 80552, 86009, 91614, 97364,
}

var addExp = [MaxLevel]int{
	1, 2, 3, 4, 5, 6, 7, 8, 9, 9,
	10, 10, 11, 11, 12, 12, 13, 13, 13, 14,
	14, 14, 15, 15, 15, 16, 16, 16, 17, 17,
}

func addExpFor(level int) int {
	if level < 0 || level >= MaxLevel {
		return 0
	}
	return addExp[level]
}

func levelExpThreshold(level int) int {
	if level < 0 || level >= MaxLevel {
		return 0
	}
	return levelExp[level]
}

func applyCrit(baseGain int, roll int) (finalGain int, didCrit bool) {
	if baseGain <= 0 {
		return baseGain, false
	}
	if roll < critRatePercent {
		return baseGain * critExpMultiplier, true
	}
	return baseGain, false
}
