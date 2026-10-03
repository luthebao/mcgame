// Open-sourced by BaoLT

package auth

import "testing"

func TestCheckSecondaryPassword_UsesDefaultHashWhenUnset(t *testing.T) {
	account := &Account{}

	if !account.CheckSecondaryPassword(DefaultSecondaryPasswordMD5) {
		t.Fatalf("expected default secondary password hash to validate")
	}

	if account.CheckSecondaryPassword("") {
		t.Fatalf("expected empty secondary password hash to fail")
	}

	if account.CheckSecondaryPassword("bad-hash") {
		t.Fatalf("expected wrong secondary password hash to fail")
	}
}

func TestSetSecondaryPassword_EmptyFallsBackToDefault(t *testing.T) {
	account := &Account{}

	account.SetSecondaryPassword("")

	if account.SecondaryPassword != DefaultSecondaryPasswordMD5 {
		t.Fatalf("expected default secondary password hash, got %q", account.SecondaryPassword)
	}
}
