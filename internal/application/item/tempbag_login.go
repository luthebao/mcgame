// Open-sourced by BaoLT

// Temporary-bag (Túi Tạm) payload builder shared by the getTBag RPC and the
// onChooseCharactor login snapshot so both emit identical tBag data.
package item

import (
	"strconv"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
)

func (s *Service) BuildTBagPayload(char *domainchar.Character, items []*domainitem.Item) map[string]interface{} {
	tempList := make(map[string]interface{})
	normalItemCount := 0
	mxItemCount := 0

	for _, it := range items {
		if it == nil || it.SlotType != domainitem.SlotTypeTempBag {
			continue
		}
		tempList[strconv.Itoa(it.SlotIndex)] = s.BuildClientItemDTO(it)
		if it.SlotIndex >= 100 {
			mxItemCount++
		} else {
			normalItemCount++
		}
	}

	normalCount := char.TempBagSlots
	mxCount := char.MxTempBagSlots

	tempbagNum := min(max(normalCount, 0), 5)
	mxTempbagNum := min(max(mxCount, 0), 5)

	slotCapacity := []int{6, 6, 12, 12, 12}
	extraSlots := 0
	for i := 0; i < normalCount && i < 5; i++ {
		extraSlots += slotCapacity[i]
	}
	mxExtraSlots := 0
	for i := 0; i < mxCount && i < 5; i++ {
		mxExtraSlots += slotCapacity[i]
	}

	return map[string]interface{}{
		"tempList":    tempList,
		"tempBag":     map[string]interface{}{},
		"tempSlotNum": extraSlots,
		"tempbagNum":  tempbagNum,
		"curNum":      normalItemCount,
		"ot":          0,
		"dire":        0,
		"mx": map[string]interface{}{
			"tempSlotNum": 12 + mxExtraSlots,
			"tempbagNum":  mxTempbagNum,
			"curNum":      mxItemCount,
			"tempBag":     map[string]interface{}{},
			"tempList":    map[string]interface{}{},
		},
	}
}
