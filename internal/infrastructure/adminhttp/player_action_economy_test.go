// Open-sourced by BaoLT

package adminhttp

import "testing"

func TestResolveContainerCount_AcceptsBagCountsWithinRegularPages(t *testing.T) {
	count := 7
	resolved, err := resolveContainerCount("bagSlotNum", &count, "bagSlots", nil, 30, 1, 7)
	if err != nil {
		t.Fatalf("resolveContainerCount() error = %v", err)
	}
	if resolved == nil || *resolved != 7 {
		t.Fatalf("resolveContainerCount() = %v, want 7", resolved)
	}
}

func TestResolveContainerCount_RejectsBagCountBeyondSevenRegularPages(t *testing.T) {
	count := 8
	resolved, err := resolveContainerCount("bagSlotNum", &count, "bagSlots", nil, 30, 1, 7)
	if err == nil {
		t.Fatalf("resolveContainerCount() error = nil, want validation error, resolved=%v", resolved)
	}
}

func TestResolveContainerCount_RejectsBankCountBeyondFivePages(t *testing.T) {
	count := 6
	resolved, err := resolveContainerCount("bankSlotNum", &count, "bankSlots", nil, 30, 1, 5)
	if err == nil {
		t.Fatalf("resolveContainerCount() error = nil, want validation error, resolved=%v", resolved)
	}
}

func TestResolveContainerCount_AcceptsLegacySlotTotalsWhenTheyMapToPages(t *testing.T) {
	slots := 210
	resolved, err := resolveContainerCount("bagSlotNum", nil, "bagSlots", &slots, 30, 1, 7)
	if err != nil {
		t.Fatalf("resolveContainerCount() error = %v", err)
	}
	if resolved == nil || *resolved != 7 {
		t.Fatalf("resolveContainerCount() = %v, want 7", resolved)
	}
}
