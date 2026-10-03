// Open-sourced by BaoLT

package character

import (
	"testing"

	"github.com/google/uuid"
)

func TestSpiritualityCurrency_PersistsViaAccessor(t *testing.T) {
	desc, ok := GameCurrencyDescriptor(CurrencySpirituality)
	if !ok {
		t.Fatalf("GameCurrencyDescriptor(CurrencySpirituality) missing")
	}
	if desc.ClientKey != "spirituality" {
		t.Fatalf("spirituality ClientKey = %q, want spirituality", desc.ClientKey)
	}
	if !desc.AlwaysPersist {
		t.Fatalf("spirituality must be AlwaysPersist=true so spend-to-zero is saved")
	}

	acc, ok := LookupGameKVAccessor(CurrencySpirituality)
	if !ok {
		t.Fatalf("LookupGameKVAccessor(CurrencySpirituality) missing — would not persist at save")
	}

	char := NewCharacter(uuid.New(), "tester", 1, 0)

	char.Spirituality = "668203769"
	if got := acc.Get(char); got != 668203769 {
		t.Fatalf("accessor Get = %d, want 668203769 (save path reads this)", got)
	}

	acc.Set(char, 41000)
	if char.Spirituality != "41000" {
		t.Fatalf("after accessor Set, char.Spirituality = %q, want \"41000\" (load path)", char.Spirituality)
	}

	acc.Set(char, 0)
	if char.Spirituality != "0" {
		t.Fatalf("spend-to-zero Spirituality = %q, want \"0\"", char.Spirituality)
	}

	found := false
	for _, a := range GameKVCurrencyAccessors() {
		if a.Descriptor.TypeID == CurrencySpirituality {
			found = true
			break
		}
	}
	if !found {
		t.Fatalf("spirituality accessor not in GameKVCurrencyAccessors() — save would skip it")
	}
}
