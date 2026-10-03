// Open-sourced by BaoLT

package dress

import (
	"testing"

	appitem "mcgame-server/internal/application/item"
	domainchar "mcgame-server/internal/domain/character"
)

func TestResolveCurrentDressAppearancePayload_UnsetFakeDressFallsBackToBaseRes(t *testing.T) {
	char := &domainchar.Character{
		ID:        7,
		DressInfo: "{}",
	}
	appearance := appitem.CharacterAppearance{}

	method, payload, ok := resolveCurrentDressAppearancePayload(7, char, appearance, 3101001, 9999999)
	if !ok {
		t.Fatal("resolveCurrentDressAppearancePayload() = not ok, want payload")
	}
	if method != "onSetRes" {
		t.Fatalf("method = %q, want onSetRes", method)
	}
	if got := payload["res"]; got != int64(3101001) {
		t.Fatalf("payload.res = %v, want 3101001", got)
	}
}

func TestResolveCurrentDressAppearancePayload_RestoresEquippedDressOverlay(t *testing.T) {
	char := &domainchar.Character{
		ID:        9,
		DressInfo: "{}",
		Ee:        "0",
	}
	appearance := appitem.CharacterAppearance{
		DressEquipped: true,
		DressResCode:  4102002,
		Star:          3,
	}

	method, payload, ok := resolveCurrentDressAppearancePayload(9, char, appearance, 3101001, 0)
	if !ok {
		t.Fatal("resolveCurrentDressAppearancePayload() = not ok, want payload")
	}
	if method != "onSetRes" {
		t.Fatalf("method = %q, want onSetRes", method)
	}
	if got := payload["res"]; got != int64(4102002) {
		t.Fatalf("payload.resCode = %v, want 4102002", got)
	}
}
