// Open-sourced by BaoLT

// NPC shop routing tests.
package npc

import "testing"

func TestCallbackForDirectNPCShop_UsesStandardShopCallbackForOverlappingIDs(t *testing.T) {
	for _, shopID := range []int{1, 2, 7, 8, 9, 45} {
		if got := callbackForDirectNPCShop(shopID); got != "onOpenShop" {
			t.Fatalf("callbackForDirectNPCShop(%d) = %q, want %q", shopID, got, "onOpenShop")
		}
	}
}
