// Open-sourced by BaoLT

// Cooldown formula for Schedule Boss respawn per design spec §4.
package scheduleboss

import "time"

func Cooldown(level int, kind Kind) time.Duration {
	if level < 0 {
		level = 0
	}
	switch kind {
	case Flying:
		return 4*time.Hour + time.Duration(level/10)*30*time.Minute
	default:
		return 8*time.Hour + time.Duration(level/30)*30*time.Minute
	}
}
