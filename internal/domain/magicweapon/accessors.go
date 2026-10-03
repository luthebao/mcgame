// Open-sourced by BaoLT

package magicweapon

import (
	"fmt"

	"mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
)

func IsMainTemplate(tpl *models.EquiptTemplateTemplate) bool {
	return tpl != nil && int(tpl.Kind) == ItemKind && int(tpl.Type) == ItemTypeMain
}

func IsSubTemplate(tpl *models.EquiptTemplateTemplate) bool {
	return tpl != nil && int(tpl.Kind) == ItemKind && int(tpl.Type) == ItemTypeSub
}

func IsMWTemplate(tpl *models.EquiptTemplateTemplate) bool {
	return tpl != nil && int(tpl.Kind) == ItemKind
}

func ensureProperties(it *item.Item) {
	if it.Properties == nil {
		it.Properties = make(map[string]interface{})
	}
}

func PropFloat(it *item.Item, key string) float64 {
	if it == nil || it.Properties == nil {
		return 0
	}
	return toFloat(it.Properties[key])
}

func PropInt(it *item.Item, key string) int {
	return int(PropFloat(it, key))
}

func PropString(it *item.Item, key string) string {
	if it == nil || it.Properties == nil {
		return ""
	}
	v, ok := it.Properties[key]
	if !ok || v == nil {
		return ""
	}
	if s, ok := v.(string); ok {
		return s
	}
	return fmt.Sprintf("%v", v)
}

func SetPropFloat(it *item.Item, key string, val float64) {
	ensureProperties(it)
	it.Properties[key] = val
}

func SetPropInt(it *item.Item, key string, val int) {
	ensureProperties(it)
	it.Properties[key] = val
}

func SetPropString(it *item.Item, key, val string) {
	ensureProperties(it)
	it.Properties[key] = val
}

func TSlotValue(it *item.Item, slot int) int {
	key := TSlotKey(slot)
	if key == "" {
		return 0
	}
	return PropInt(it, key)
}

func SetTSlot(it *item.Item, slot, sid int) {
	key := TSlotKey(slot)
	if key == "" {
		return
	}
	SetPropInt(it, key, sid)
}

func TSlotMap(it *item.Item) map[string]int {
	out := make(map[string]int)
	for i := 1; i <= 10; i++ {
		v := TSlotValue(it, i)
		if v > 0 {
			out[fmt.Sprintf("%d", i)] = v
		}
	}
	return out
}

func toFloat(v interface{}) float64 {
	switch x := v.(type) {
	case nil:
		return 0
	case float64:
		return x
	case float32:
		return float64(x)
	case int:
		return float64(x)
	case int32:
		return float64(x)
	case int64:
		return float64(x)
	case bool:
		if x {
			return 1
		}
		return 0
	case string:
		var f float64
		fmt.Sscanf(x, "%f", &f)
		return f
	}
	return 0
}

func IsEquipped(it *item.Item) bool {
	return it != nil && it.IsEquipped() && IsAnyMWPosition(it.SlotIndex)
}

func IsMainEquipped(it *item.Item) bool {
	return it != nil && it.IsEquipped() && IsMainPosition(it.SlotIndex)
}

func IsSubEquipped(it *item.Item) bool {
	return it != nil && it.IsEquipped() && IsSubPosition(it.SlotIndex)
}
