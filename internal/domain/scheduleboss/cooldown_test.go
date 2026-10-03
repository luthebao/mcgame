// Open-sourced by BaoLT

// Tests for Cooldown formula per spec §4.
package scheduleboss

import (
	"testing"
	"time"
)

func TestCooldown(t *testing.T) {
	cases := []struct {
		name  string
		level int
		kind  Kind
		want  time.Duration
	}{
		{"negative level clamped", -5, Ground, 8 * time.Hour},
		{"zero level flying", 0, Flying, 4 * time.Hour},
		{"ground level 5", 5, Ground, 8 * time.Hour},
		{"ground level 30", 30, Ground, 8*time.Hour + 30*time.Minute},
		{"ground level 60", 60, Ground, 9 * time.Hour},
		{"ground level 140", 140, Ground, 10 * time.Hour},
		{"flying level 5", 5, Flying, 4 * time.Hour},
		{"flying level 20", 20, Flying, 5 * time.Hour},
		{"flying level 50", 50, Flying, 6*time.Hour + 30*time.Minute},
		{"flying level 100", 100, Flying, 9 * time.Hour},
		{"flying level 140", 140, Flying, 11 * time.Hour},
	}
	for _, c := range cases {
		t.Run(c.name, func(t *testing.T) {
			got := Cooldown(c.level, c.kind)
			if got != c.want {
				t.Fatalf("Cooldown(%d, %q) = %s; want %s", c.level, c.kind, got, c.want)
			}
		})
	}
}
