// Open-sourced by BaoLT

// Damage formula tests for crit damage normalization.
package combat

import "testing"

func TestCriticalDamageMultiplier_UsesHiddenBaseAndSeparateBonus(t *testing.T) {
	if got := criticalDamageMultiplier(BaseCriticalDamage); got != 1.5 {
		t.Fatalf("criticalDamageMultiplier(150) = %v, want 1.5", got)
	}
	if got := criticalDamageMultiplier(25); got != 1.875 {
		t.Fatalf("criticalDamageMultiplier(25) = %v, want 1.875", got)
	}
	if got := criticalDamageMultiplier(175); got != 1.875 {
		t.Fatalf("criticalDamageMultiplier(175) = %v, want 1.875", got)
	}
}
