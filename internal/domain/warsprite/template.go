// Open-sourced by BaoLT

// War sprite template helpers: int conversion, prop pair extraction, max-level checks,
// and the warSprite + warSprite × battleSprite aggregator
// (final[p_t] += warN + warN × batN / 10000 per paired slot of each sprite type;
// battleSprite at root yields the war contribution alone).
package warsprite

import "mcgame-server/internal/gamedata/models"

const propSlots = 8

func IsMaxed(t *models.WarSpriteTemplate) bool {
	if t == nil {
		return true
	}
	return int(t.NextID) == 0
}

func NextID(t *models.WarSpriteTemplate) int {
	if t == nil {
		return 0
	}
	return int(t.NextID)
}

func StoneCost(t *models.WarSpriteTemplate) int {
	if t == nil {
		return 0
	}
	return int(t.CostNum)
}

func GoldCost(t *models.WarSpriteTemplate) int {
	if t == nil {
		return 0
	}
	return int(t.CostGold)
}

func Kind(t *models.WarSpriteTemplate) int {
	if t == nil {
		return 0
	}
	return int(t.Kind)
}

func PropPairs(t *models.WarSpriteTemplate) [][2]int {
	if t == nil {
		return nil
	}
	pt := propTypeSlots(t)
	pn := propValueSlots(t)
	out := make([][2]int, 0, propSlots)
	for i := range propSlots {
		if pt[i] == 0 {
			continue
		}
		out = append(out, [2]int{pt[i], pn[i]})
	}
	return out
}

func AggregateMultiplied(state *State, lookup func(id int) *models.WarSpriteTemplate) map[int]int64 {
	totals := make(map[int]int64)
	if state == nil || lookup == nil {
		return totals
	}
	for i := MinIndex; i <= MaxIndex; i++ {
		warTpl := lookup(int(state.WObj[i]))
		if warTpl == nil {
			continue
		}
		warT, warN := propTypeSlots(warTpl), propValueSlots(warTpl)
		batN := [propSlots]int{}
		if batTpl := lookup(int(state.BObj[i])); batTpl != nil {
			batN = propValueSlots(batTpl)
		}
		for j := range propSlots {
			if warT[j] == 0 || warN[j] == 0 {
				continue
			}
			contribution := int64(warN[j]) + int64(warN[j])*int64(batN[j])/10000
			totals[warT[j]] += contribution
		}
	}
	return totals
}

func propTypeSlots(t *models.WarSpriteTemplate) [propSlots]int {
	return [propSlots]int{
		int(t.PT1), int(t.PT2), int(t.PT3), int(t.PT4),
		int(t.PT5), int(t.PT6), int(t.PT7), int(t.PT8),
	}
}

func propValueSlots(t *models.WarSpriteTemplate) [propSlots]int {
	return [propSlots]int{
		int(t.PN1), int(t.PN2), int(t.PN3), int(t.PN4),
		int(t.PN5), int(t.PN6), int(t.PN7), int(t.PN8),
	}
}
