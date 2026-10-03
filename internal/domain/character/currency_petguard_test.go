// Open-sourced by BaoLT

package character

import (
	"testing"

	"github.com/google/uuid"
)

func TestPetGuardCurrencies_AddDeductGetTotal(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)

	if err := char.AddCurrency(CurrencyPetGuardOut, 50); err != nil {
		t.Fatalf("AddCurrency PetGuardOut: %v", err)
	}
	if err := char.AddCurrency(CurrencyPetGuardIn, 30); err != nil {
		t.Fatalf("AddCurrency PetGuardIn: %v", err)
	}

	if got, ok := char.GetGameCurrencyTotal(CurrencyPetGuardOut); !ok || got != 50 {
		t.Fatalf("GetGameCurrencyTotal PetGuardOut = (%d, %v), want (50, true)", got, ok)
	}
	if got, ok := char.GetGameCurrencyTotal(CurrencyPetGuardIn); !ok || got != 30 {
		t.Fatalf("GetGameCurrencyTotal PetGuardIn = (%d, %v), want (30, true)", got, ok)
	}

	if err := char.DeductCurrency(CurrencyPetGuardOut, 20); err != nil {
		t.Fatalf("DeductCurrency PetGuardOut: %v", err)
	}
	if char.PetGuardOut != 30 {
		t.Fatalf("PetGuardOut after deduct = %d, want 30", char.PetGuardOut)
	}

	if err := char.DeductCurrency(CurrencyPetGuardIn, 100); err == nil {
		t.Fatalf("DeductCurrency PetGuardIn over-balance should fail")
	}
}

func TestPetGuardCurrencies_DescriptorAndDTO(t *testing.T) {
	out, ok := GameCurrencyDescriptor(CurrencyPetGuardOut)
	if !ok {
		t.Fatalf("GameCurrencyDescriptor(CurrencyPetGuardOut) missing")
	}
	if out.ClientKey != "petguardout" {
		t.Fatalf("PetGuardOut ClientKey = %q, want petguardout", out.ClientKey)
	}

	in, ok := GameCurrencyDescriptor(CurrencyPetGuardIn)
	if !ok {
		t.Fatalf("GameCurrencyDescriptor(CurrencyPetGuardIn) missing")
	}
	if in.ClientKey != "petguardin" {
		t.Fatalf("PetGuardIn ClientKey = %q, want petguardin", in.ClientKey)
	}

	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.PetGuardOut = 7
	char.PetGuardIn = 11

	dto := char.ToDTO()
	if got := dto["petguardout"]; got != 7 {
		t.Fatalf("dto[petguardout] = %v, want 7", got)
	}
	if got := dto["petguardin"]; got != 11 {
		t.Fatalf("dto[petguardin] = %v, want 11", got)
	}
}

func TestMcBeansDTOKeyIsLowercase(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.MCBeans = 42

	dto := char.ToDTO()
	if got := dto["mcbeans"]; got != 42 {
		t.Fatalf("dto[mcbeans] = %v, want 42", got)
	}
	if _, exists := dto["mcBeans"]; exists {
		t.Fatalf("dto must not contain camelCase key mcBeans (Flash client expects lowercase)")
	}
}

func TestShishangdianDTOReflectsShopGold(t *testing.T) {
	char := NewCharacter(uuid.New(), "tester", 1, 0)
	char.ShopGold = 9000

	dto := char.ToDTO()
	if got := dto["shishangdian"]; got != 9000 {
		t.Fatalf("dto[shishangdian] = %v, want 9000", got)
	}
}
