// Open-sourced by BaoLT

package statfeature

import (
	"testing"

	domainchar "mcgame-server/internal/domain/character"
)

func TestApplyMagicCrystalBonus_FlatHP(t *testing.T) {
	bonuses := domainchar.NewEquipmentStatBonuses()
	state := map[string]interface{}{
		"crystals": []interface{}{
			map[string]interface{}{"index": 0, "a": 1, "lv": 2, "l": 300, "s": 0},
		},
	}
	applyMagicCrystalBonus(&bonuses, state)
	if got := bonuses.Flat[domainchar.PropMaxHP]; got != 36000 {
		t.Fatalf("expected MaxHP=36000 (slot 0 lv2 fully filled), got %d", got)
	}
}

func TestApplyMagicCrystalBonus_PartialFill(t *testing.T) {
	bonuses := domainchar.NewEquipmentStatBonuses()
	state := map[string]interface{}{
		"crystals": []interface{}{
			map[string]interface{}{"index": 2, "a": 1, "lv": 0, "l": 50, "s": 0},
		},
	}
	applyMagicCrystalBonus(&bonuses, state)
	if got := bonuses.Flat[domainchar.PropAttack]; got != 1500 {
		t.Fatalf("expected PhysAtk=1500 (3000*50/100), got %d", got)
	}
}

func TestApplyMagicCrystalBonus_InactiveSkipped(t *testing.T) {
	bonuses := domainchar.NewEquipmentStatBonuses()
	state := map[string]interface{}{
		"crystals": []interface{}{
			map[string]interface{}{"index": 0, "a": 0, "lv": 9, "l": 1000, "s": 0},
		},
	}
	applyMagicCrystalBonus(&bonuses, state)
	if got := bonuses.Flat[domainchar.PropMaxHP]; got != 0 {
		t.Fatalf("inactive slot must contribute 0, got %d", got)
	}
}

func TestApplyMagicCrystalBonus_EmptySlotSkipped(t *testing.T) {
	bonuses := domainchar.NewEquipmentStatBonuses()
	state := map[string]interface{}{
		"crystals": []interface{}{
			map[string]interface{}{"index": 0, "a": 1, "lv": 0, "l": 0, "s": 0},
		},
	}
	applyMagicCrystalBonus(&bonuses, state)
	if got := bonuses.Flat[domainchar.PropMaxHP]; got != 0 {
		t.Fatalf("empty slot must contribute 0, got %d", got)
	}
}

func TestApplyMagicCrystalBonus_FloatStatRoutesToFloat(t *testing.T) {
	bonuses := domainchar.NewEquipmentStatBonuses()
	state := map[string]interface{}{
		"crystals": []interface{}{
			map[string]interface{}{"index": 9, "a": 1, "lv": 9, "l": 1000, "s": 0},
		},
	}
	applyMagicCrystalBonus(&bonuses, state)
	if got := bonuses.Float[domainchar.PropDefy]; got <= 0 {
		t.Fatalf("expected Defy float bonus > 0 at slot 9 lv9 fully filled, got %v", got)
	}
}
