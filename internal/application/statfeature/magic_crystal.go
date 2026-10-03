// Open-sourced by BaoLT

package statfeature

import (
	appmagiccrystal "mcgame-server/internal/application/magiccrystal"
	domainchar "mcgame-server/internal/domain/character"
)

func applyMagicCrystalBonus(bonuses *domainchar.EquipmentStatBonuses, state map[string]interface{}) {
	if bonuses == nil || len(state) == 0 {
		return
	}
	raw, ok := state["crystals"].([]interface{})
	if !ok || len(raw) == 0 {
		return
	}
	for entryIdx, entry := range raw {
		obj, ok := entry.(map[string]interface{})
		if !ok {
			continue
		}
		slot := slotIndexFrom(obj, entryIdx)
		if slot < 0 || slot >= appmagiccrystal.MaxSlots {
			continue
		}
		if !appmagiccrystal.IsSlotActive(obj) {
			continue
		}
		lv := appmagiccrystal.IntFrom(obj["lv"])
		if lv < 0 || lv > appmagiccrystal.MaxLevel {
			continue
		}
		l := appmagiccrystal.IntFrom(obj["l"])
		s := appmagiccrystal.IntFrom(obj["s"])
		filled := l + s
		if filled <= 0 {
			continue
		}
		max := appmagiccrystal.SlotMaxAt(lv)
		if max <= 0 {
			continue
		}
		if filled > max {
			filled = max
		}
		statType, ok := appmagiccrystal.SlotStatType(slot)
		if !ok {
			continue
		}
		v, ok := appmagiccrystal.SlotStatValue(slot, lv)
		if !ok || v == 0 {
			continue
		}
		bonus := v * float64(filled) / float64(max)
		applyCharacterPropBonus(bonuses, statType, bonus)
	}
}

func slotIndexFrom(obj map[string]interface{}, fallback int) int {
	if v, ok := obj["index"]; ok {
		if n := appmagiccrystal.IntFrom(v); n >= 0 {
			return n
		}
	}
	return fallback
}
