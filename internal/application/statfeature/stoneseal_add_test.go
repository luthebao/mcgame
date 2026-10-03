// Open-sourced by BaoLT

package statfeature

import (
	"math"
	"testing"

	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
)

type fakeStoneSealAccessor struct {
	items map[int]*models.ItemTemplateTemplate
}

func (f *fakeStoneSealAccessor) GetItem(id int) *models.ItemTemplateTemplate {
	return f.items[id]
}

func TestComputeStoneSealAddBlock_SnapshotAnchor(t *testing.T) {
	acc := &fakeStoneSealAccessor{items: map[int]*models.ItemTemplateTemplate{
		900: {PropType: 1, Color: 4},
		61:  {PropType: 4, Color: 4},
	}}
	equip := &domainitem.Item{
		SlotType:   domainitem.SlotTypeEquipped,
		SlotIndex:  0,
		Properties: map[string]interface{}{"t1": float64(900)},
	}
	equipped := buildEquippedItemsByEquipSid([]*domainitem.Item{equip})
	state := map[string]interface{}{
		"stone": map[string]interface{}{
			"1": map[string]interface{}{
				"lvl":  float64(5),
				"data": map[string]interface{}{"s1": float64(61)},
			},
		},
	}

	add := computeStoneSealAddBlock(state, equipped, acc)
	if add == nil {
		t.Fatal("add block nil, want one equipSid entry")
	}
	sid1, ok := add["1"].(map[string]interface{})
	if !ok {
		t.Fatalf("add[1] missing or wrong type: %T", add["1"])
	}
	hole1, ok := sid1["1"].(map[string]interface{})
	if !ok {
		t.Fatalf("add[1][1] missing or wrong type: %T", sid1["1"])
	}
	if hole1["t"] != stoneSealConfExtraProperty[1][4].N {
		t.Fatalf("t = %v, want %d (CONF[1][4].N)", hole1["t"], stoneSealConfExtraProperty[1][4].N)
	}
	if hole1["t"] != 12 {
		t.Fatalf("t = %v, want 12 (snapshot anchor)", hole1["t"])
	}

	wantN := stoneSealConfExtraProperty[1][4].V * float64(4+4+2) * stoneSealSuccinctConf[5]
	if hole1["n"] != wantN {
		t.Fatalf("n = %v, want %v (formula via table)", hole1["n"], wantN)
	}
	if math.Abs(wantN-670.089910693) > 1e-6 {
		t.Fatalf("snapshot anchor = %v, want 670.089910693 (CONF[1][4].V or SUCCINCT[5] wrong)", wantN)
	}
}

func TestComputeStoneSealAddBlock_OmitsSameTypeAndMissing(t *testing.T) {
	acc := &fakeStoneSealAccessor{items: map[int]*models.ItemTemplateTemplate{
		900: {PropType: 4, Color: 2},
		61:  {PropType: 4, Color: 4},
	}}
	equip := &domainitem.Item{
		SlotType:   domainitem.SlotTypeEquipped,
		SlotIndex:  0,
		Properties: map[string]interface{}{"t1": float64(900)},
	}
	equipped := buildEquippedItemsByEquipSid([]*domainitem.Item{equip})
	state := map[string]interface{}{
		"stone": map[string]interface{}{
			"1": map[string]interface{}{
				"lvl":  float64(5),
				"data": map[string]interface{}{"s1": float64(61)},
			},
		},
	}
	if add := computeStoneSealAddBlock(state, equipped, acc); add != nil {
		t.Fatalf("same-type pair (CONF[4][4].N==0) must be omitted, got %v", add)
	}
}

func TestComputeStoneSealAddBlock_NilAccessorReturnsNil(t *testing.T) {
	equip := &domainitem.Item{SlotType: domainitem.SlotTypeEquipped, Properties: map[string]interface{}{"t1": float64(900)}}
	equipped := buildEquippedItemsByEquipSid([]*domainitem.Item{equip})
	state := map[string]interface{}{"stone": map[string]interface{}{"1": map[string]interface{}{"lvl": float64(5), "data": map[string]interface{}{"s1": float64(61)}}}}
	if add := computeStoneSealAddBlock(state, equipped, nil); add != nil {
		t.Fatalf("nil accessor must return nil, got %v", add)
	}
}
