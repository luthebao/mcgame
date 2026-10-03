// Open-sourced by BaoLT

package item

import (
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
)

func TestBuildTBagPayload_SeparatesNormalAndMxAndIgnoresOtherBags(t *testing.T) {
	char := &domainchar.Character{TempBagSlots: 2, MxTempBagSlots: 1}
	items := []*domainitem.Item{
		{ID: 1, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeTempBag, SlotIndex: 1, TemplateID: 7, StackCount: 3},
		{ID: 2, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeTempBag, SlotIndex: 101, TemplateID: 5676, StackCount: 145},
		{ID: 3, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeBag, SlotIndex: 5, TemplateID: 99, StackCount: 1},
	}

	out := (&Service{}).BuildTBagPayload(char, items)

	if out["curNum"] != 1 {
		t.Fatalf("curNum = %v, want 1 (one normal temp item, slot < 100)", out["curNum"])
	}
	if out["tempbagNum"] != 2 {
		t.Fatalf("tempbagNum = %v, want 2 (TempBagSlots)", out["tempbagNum"])
	}

	tempList, ok := out["tempList"].(map[string]interface{})
	if !ok {
		t.Fatalf("tempList = %v, want map", out["tempList"])
	}
	if len(tempList) != 2 {
		t.Fatalf("tempList entries = %d, want 2 (both temp items; the SlotTypeBag item excluded)", len(tempList))
	}
	if _, has := tempList["1"]; !has {
		t.Fatalf("tempList missing normal slot 1")
	}
	if _, has := tempList["101"]; !has {
		t.Fatalf("tempList missing mx slot 101")
	}
	if _, has := tempList["5"]; has {
		t.Fatalf("tempList contains slot 5, but SlotTypeBag items must be excluded")
	}

	mx, ok := out["mx"].(map[string]interface{})
	if !ok {
		t.Fatalf("mx = %v, want map", out["mx"])
	}
	if mx["curNum"] != 1 {
		t.Fatalf("mx.curNum = %v, want 1 (one temp item with slot >= 100)", mx["curNum"])
	}
}
