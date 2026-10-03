// Open-sourced by BaoLT

package errors

import (
	"errors"
	"testing"
)

func TestDomainErrors(t *testing.T) {
	domainErrors := []struct {
		name string
		err  error
	}{
		{"ErrNotFound", ErrNotFound},
		{"ErrAlreadyExists", ErrAlreadyExists},
		{"ErrInvalidInput", ErrInvalidInput},
		{"ErrInsufficientLevel", ErrInsufficientLevel},
		{"ErrInsufficientStats", ErrInsufficientStats},
		{"ErrInsufficientFunds", ErrInsufficientFunds},
		{"ErrInsufficientItems", ErrInsufficientItems},
		{"ErrInventoryFull", ErrInventoryFull},
		{"ErrItemNotEquippable", ErrItemNotEquippable},
		{"ErrSlotOccupied", ErrSlotOccupied},
		{"ErrQuestNotAvailable", ErrQuestNotAvailable},
		{"ErrQuestAlreadyTaken", ErrQuestAlreadyTaken},
		{"ErrQuestNotCompleted", ErrQuestNotCompleted},
		{"ErrInBattle", ErrInBattle},
		{"ErrNotInBattle", ErrNotInBattle},
		{"ErrInvalidTarget", ErrInvalidTarget},
		{"ErrSkillOnCooldown", ErrSkillOnCooldown},
		{"ErrInsufficientMP", ErrInsufficientMP},
		{"ErrInsufficientSP", ErrInsufficientSP},
	}

	for _, tc := range domainErrors {
		t.Run(tc.name, func(t *testing.T) {
			if tc.err == nil {
				t.Errorf("%s should not be nil", tc.name)
			}
			if tc.err.Error() == "" {
				t.Errorf("%s should have a non-empty error message", tc.name)
			}
		})
	}
}

func TestAuthErrors(t *testing.T) {
	authErrors := []struct {
		name string
		err  error
	}{
		{"ErrUnauthorized", ErrUnauthorized},
		{"ErrInvalidCredentials", ErrInvalidCredentials},
		{"ErrSessionExpired", ErrSessionExpired},
		{"ErrAccountBanned", ErrAccountBanned},
		{"ErrAccountNotFound", ErrAccountNotFound},
		{"ErrCharacterNotFound", ErrCharacterNotFound},
		{"ErrCharacterNotOwned", ErrCharacterNotOwned},
	}

	for _, tc := range authErrors {
		t.Run(tc.name, func(t *testing.T) {
			if tc.err == nil {
				t.Errorf("%s should not be nil", tc.name)
			}
			if tc.err.Error() == "" {
				t.Errorf("%s should have a non-empty error message", tc.name)
			}
		})
	}
}

func TestSceneErrors(t *testing.T) {
	sceneErrors := []struct {
		name string
		err  error
	}{
		{"ErrNPCNotFound", ErrNPCNotFound},
		{"ErrSceneItemNotFound", ErrSceneItemNotFound},
		{"ErrSceneItemExpired", ErrSceneItemExpired},
		{"ErrCannotPickup", ErrCannotPickup},
		{"ErrInvalidTeleport", ErrInvalidTeleport},
	}

	for _, tc := range sceneErrors {
		t.Run(tc.name, func(t *testing.T) {
			if tc.err == nil {
				t.Errorf("%s should not be nil", tc.name)
			}
			if tc.err.Error() == "" {
				t.Errorf("%s should have a non-empty error message", tc.name)
			}
		})
	}
}

func TestItemErrors(t *testing.T) {
	itemErrors := []struct {
		name string
		err  error
	}{
		{"ErrItemNotFound", ErrItemNotFound},
		{"ErrItemNotOwned", ErrItemNotOwned},
		{"ErrInvalidSlot", ErrInvalidSlot},
		{"ErrCannotEquip", ErrCannotEquip},
		{"ErrCannotUnequip", ErrCannotUnequip},
		{"ErrItemBroken", ErrItemBroken},
		{"ErrCannotStack", ErrCannotStack},
		{"ErrCannotUseItem", ErrCannotUseItem},
	}

	for _, tc := range itemErrors {
		t.Run(tc.name, func(t *testing.T) {
			if tc.err == nil {
				t.Errorf("%s should not be nil", tc.name)
			}
			if tc.err.Error() == "" {
				t.Errorf("%s should have a non-empty error message", tc.name)
			}
		})
	}
}

func TestInfrastructureErrors(t *testing.T) {
	infraErrors := []struct {
		name string
		err  error
	}{
		{"ErrDatabaseConnection", ErrDatabaseConnection},
		{"ErrDatabaseQuery", ErrDatabaseQuery},
		{"ErrRTMPConnection", ErrRTMPConnection},
		{"ErrAMF0Encode", ErrAMF0Encode},
		{"ErrAMF0Decode", ErrAMF0Decode},
	}

	for _, tc := range infraErrors {
		t.Run(tc.name, func(t *testing.T) {
			if tc.err == nil {
				t.Errorf("%s should not be nil", tc.name)
			}
			if tc.err.Error() == "" {
				t.Errorf("%s should have a non-empty error message", tc.name)
			}
		})
	}
}

func TestRPCErrors(t *testing.T) {
	rpcErrors := []struct {
		name string
		err  error
	}{
		{"ErrMethodNotFound", ErrMethodNotFound},
		{"ErrRateLimited", ErrRateLimited},
		{"ErrInvalidArgs", ErrInvalidArgs},
	}

	for _, tc := range rpcErrors {
		t.Run(tc.name, func(t *testing.T) {
			if tc.err == nil {
				t.Errorf("%s should not be nil", tc.name)
			}
			if tc.err.Error() == "" {
				t.Errorf("%s should have a non-empty error message", tc.name)
			}
		})
	}
}

func TestIs(t *testing.T) {
	t.Run("same error", func(t *testing.T) {
		if !Is(ErrNotFound, ErrNotFound) {
			t.Error("Is should return true for same error")
		}
	})

	t.Run("different errors", func(t *testing.T) {
		if Is(ErrNotFound, ErrUnauthorized) {
			t.Error("Is should return false for different errors")
		}
	})

	t.Run("wrapped error", func(t *testing.T) {
		wrapped := Wrap(ErrNotFound, "context")
		if !Is(wrapped, ErrNotFound) {
			t.Error("Is should return true for wrapped error")
		}
	})

	t.Run("nil error", func(t *testing.T) {
		if Is(nil, ErrNotFound) {
			t.Error("Is should return false for nil error")
		}
	})
}

func TestAs(t *testing.T) {
	t.Run("wrapped error", func(t *testing.T) {
		wrapped := Wrap(ErrNotFound, "context")

		var target *wrappedError
		if !As(wrapped, &target) {
			t.Error("As should return true for wrappedError")
		}

		if target == nil {
			t.Error("target should be set")
		}
	})
}

func TestWrap(t *testing.T) {
	t.Run("wrap error", func(t *testing.T) {
		original := ErrNotFound
		wrapped := Wrap(original, "additional context")

		if wrapped == nil {
			t.Fatal("Wrap should return non-nil error")
		}

		expectedMsg := "additional context: not found"
		if wrapped.Error() != expectedMsg {
			t.Errorf("expected '%s', got '%s'", expectedMsg, wrapped.Error())
		}
	})

	t.Run("wrap nil", func(t *testing.T) {
		wrapped := Wrap(nil, "context")
		if wrapped != nil {
			t.Error("Wrap(nil, ...) should return nil")
		}
	})

	t.Run("unwrap", func(t *testing.T) {
		original := ErrNotFound
		wrapped := Wrap(original, "context")

		unwrapped := errors.Unwrap(wrapped)
		if unwrapped != original {
			t.Error("Unwrap should return original error")
		}
	})
}

func TestWrappedError(t *testing.T) {
	original := ErrInvalidInput
	wrapped := &wrappedError{
		err: original,
		msg: "validation failed",
	}

	t.Run("Error()", func(t *testing.T) {
		expected := "validation failed: invalid input"
		if wrapped.Error() != expected {
			t.Errorf("expected '%s', got '%s'", expected, wrapped.Error())
		}
	})

	t.Run("Unwrap()", func(t *testing.T) {
		unwrapped := wrapped.Unwrap()
		if unwrapped != original {
			t.Error("Unwrap should return original error")
		}
	})
}

func TestErrorUniqueness(t *testing.T) {
	// Ensure all errors are unique
	allErrors := []error{
		ErrNotFound,
		ErrAlreadyExists,
		ErrInvalidInput,
		ErrUnauthorized,
		ErrMethodNotFound,
		ErrRateLimited,
		ErrInvalidArgs,
	}

	seen := make(map[string]bool)
	for _, err := range allErrors {
		msg := err.Error()
		if seen[msg] {
			t.Errorf("duplicate error message: %s", msg)
		}
		seen[msg] = true
	}
}
