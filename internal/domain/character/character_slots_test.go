// Open-sourced by BaoLT

package character

import "testing"

func TestMaxBagSlots_PrefersBagCount(t *testing.T) {
	char := &Character{BagSlotNum: 2, BagSlots: 210}

	if got := char.MaxBagSlots(); got != 60 {
		t.Fatalf("MaxBagSlots() = %d, want 60", got)
	}
}

func TestMaxBankSlots_PrefersBankCount(t *testing.T) {
	char := &Character{BankSlotNum: 3, BankSlots: 150}

	if got := char.MaxBankSlots(); got != 90 {
		t.Fatalf("MaxBankSlots() = %d, want 90", got)
	}
}

func TestNormalizeSlotFields_ConvertsLegacySlotTotalsToCounts(t *testing.T) {
	char := &Character{BagSlots: 60, BankSlots: 90, PetSlots: 8}

	char.NormalizeSlotFields()

	if char.BagSlotNum != 2 {
		t.Fatalf("BagSlotNum = %d, want 2", char.BagSlotNum)
	}
	if char.BankSlotNum != 3 {
		t.Fatalf("BankSlotNum = %d, want 3", char.BankSlotNum)
	}
	if char.PetMaxNum != 8 {
		t.Fatalf("PetMaxNum = %d, want 8", char.PetMaxNum)
	}
}

func TestSetBagSlotNum_UpdatesDerivedSlots(t *testing.T) {
	char := &Character{}

	char.SetBagSlotNum(7)

	if char.BagSlotNum != 7 {
		t.Fatalf("BagSlotNum = %d, want 7", char.BagSlotNum)
	}
	if char.BagSlots != 210 {
		t.Fatalf("BagSlots = %d, want 210", char.BagSlots)
	}
}

func TestSetBankSlotNum_UpdatesDerivedSlots(t *testing.T) {
	char := &Character{}

	char.SetBankSlotNum(5)

	if char.BankSlotNum != 5 {
		t.Fatalf("BankSlotNum = %d, want 5", char.BankSlotNum)
	}
	if char.BankSlots != 150 {
		t.Fatalf("BankSlots = %d, want 150", char.BankSlots)
	}
}
