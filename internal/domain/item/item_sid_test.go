// Open-sourced by BaoLT

package item

import "testing"

func TestParseSID_QuestAndPetBoundaries(t *testing.T) {
	cases := []struct {
		name          string
		sid           int
		expectedType  SlotType
		expectedIndex int
	}{
		{name: "bag upper boundary", sid: 2310, expectedType: SlotTypeBag, expectedIndex: 209},
		{name: "quest lower boundary", sid: 2311, expectedType: SlotTypeQuestBag, expectedIndex: 0},
		{name: "quest upper boundary", sid: 2340, expectedType: SlotTypeQuestBag, expectedIndex: 29},
		{name: "pet lower boundary", sid: 2341, expectedType: SlotTypePetItemBag, expectedIndex: 0},
		{name: "pet upper boundary", sid: 2370, expectedType: SlotTypePetItemBag, expectedIndex: 29},
		{name: "pet equipped lower boundary", sid: 1001, expectedType: SlotTypePetEquipped, expectedIndex: 0},
		{name: "pet equipped upper boundary", sid: 1200, expectedType: SlotTypePetEquipped, expectedIndex: 199},
	}

	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			slotType, slotIndex := ParseSID(tc.sid)
			if slotType != tc.expectedType {
				t.Fatalf("expected slotType=%d, got %d", tc.expectedType, slotType)
			}
			if slotIndex != tc.expectedIndex {
				t.Fatalf("expected slotIndex=%d, got %d", tc.expectedIndex, slotIndex)
			}
		})
	}
}

func TestCalculateSID_ParseSID_RoundTrip(t *testing.T) {
	cases := []struct {
		name      string
		slotType  SlotType
		slotIndex int
	}{
		{name: "bag first", slotType: SlotTypeBag, slotIndex: 0},
		{name: "bag last", slotType: SlotTypeBag, slotIndex: DefaultBagSlots - 1},
		{name: "quest first", slotType: SlotTypeQuestBag, slotIndex: 0},
		{name: "quest last", slotType: SlotTypeQuestBag, slotIndex: DefaultQuestBagSlots - 1},
		{name: "pet first", slotType: SlotTypePetItemBag, slotIndex: 0},
		{name: "pet last", slotType: SlotTypePetItemBag, slotIndex: DefaultPetItemBagSlots - 1},
		{name: "pet equipped first", slotType: SlotTypePetEquipped, slotIndex: 0},
		{name: "pet equipped last", slotType: SlotTypePetEquipped, slotIndex: 199},
	}

	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			it := &Item{SlotType: tc.slotType, SlotIndex: tc.slotIndex}
			sid := it.CalculateSID()
			parsedType, parsedIndex := ParseSID(sid)
			if parsedType != tc.slotType {
				t.Fatalf("expected parsed slotType=%d, got %d (sid=%d)", tc.slotType, parsedType, sid)
			}
			if parsedIndex != tc.slotIndex {
				t.Fatalf("expected parsed slotIndex=%d, got %d (sid=%d)", tc.slotIndex, parsedIndex, sid)
			}
		})
	}
}

func TestToDTO_IdentityFieldsCannotBeOverriddenByProperties(t *testing.T) {
	it := &Item{
		ID:         777,
		TemplateID: 2001,
		ItemType:   ItemTypeEquipment,
		SlotType:   SlotTypeBag,
		SlotIndex:  5,
		StackCount: 1,
		Properties: map[string]interface{}{
			"id":     "0",
			"itemId": "0",
			"sid":    0,
		},
	}

	dto := it.ToDTO()

	id, ok := dto["id"].(int64)
	if !ok || id != it.ID {
		t.Fatalf("expected dto id=%d, got %#v", it.ID, dto["id"])
	}

	itemID, ok := dto["itemId"].(int64)
	if !ok || itemID != it.ID {
		t.Fatalf("expected dto itemId=%d, got %#v", it.ID, dto["itemId"])
	}

	sid, ok := dto["sid"].(int)
	if !ok || sid != it.CalculateSID() {
		t.Fatalf("expected dto sid=%d, got %#v", it.CalculateSID(), dto["sid"])
	}
}

func TestToDTO_EmitsBindedAsClientFlagString(t *testing.T) {
	it := &Item{
		ID:         779,
		TemplateID: 2003,
		ItemType:   ItemTypeEquipment,
		SlotType:   SlotTypeBag,
		SlotIndex:  7,
		StackCount: 1,
		IsBound:    true,
	}

	dto := it.ToDTO()

	binded, ok := dto["binded"].(string)
	if !ok {
		t.Fatalf("expected dto binded string, got %#v", dto["binded"])
	}
	if binded != "1" {
		t.Fatalf("expected dto binded=1, got %q", binded)
	}
}

func TestToDTO_BindedPropertyCannotOverrideBoundState(t *testing.T) {
	it := &Item{
		ID:         780,
		TemplateID: 2004,
		ItemType:   ItemTypeEquipment,
		SlotType:   SlotTypeBag,
		SlotIndex:  8,
		StackCount: 1,
		IsBound:    true,
		Properties: map[string]interface{}{
			"binded": "0",
		},
	}

	dto := it.ToDTO()

	binded, ok := dto["binded"].(string)
	if !ok {
		t.Fatalf("expected dto binded string, got %#v", dto["binded"])
	}
	if binded != "1" {
		t.Fatalf("expected dto binded=1, got %q", binded)
	}
}

func TestToDTO_DerivesEquipmentPrefixTypeFromColor(t *testing.T) {
	it := &Item{
		ID:         778,
		TemplateID: 2002,
		ItemType:   ItemTypeEquipment,
		SlotType:   SlotTypeBag,
		SlotIndex:  6,
		StackCount: 1,
		ColorCode:  4,
		Properties: map[string]interface{}{
			"preNameType": 0,
		},
	}

	dto := it.ToDTO()
	preNameType, ok := dto["preNameType"].(int)
	if !ok {
		t.Fatalf("expected dto preNameType int, got %#v", dto["preNameType"])
	}
	if preNameType != 4 {
		t.Fatalf("expected dto preNameType=4, got %d", preNameType)
	}
}

func TestFormatEquipmentDisplayName_PrependsPrefixOnce(t *testing.T) {
	formatted := FormatEquipmentDisplayName("Kiếm Sắt", 2)
	if formatted != "Cường Hóa Kiếm Sắt" {
		t.Fatalf("expected prefixed name, got %q", formatted)
	}

	alreadyFormatted := FormatEquipmentDisplayName("Cường Hóa Kiếm Sắt", 2)
	if alreadyFormatted != "Cường Hóa Kiếm Sắt" {
		t.Fatalf("expected name to stay unchanged, got %q", alreadyFormatted)
	}
}

func TestFormatEquipmentDisplayNameWithCurrent_UsesExistingPreNameType(t *testing.T) {
	formatted := FormatEquipmentDisplayNameWithCurrent("Kiếm Sắt", 5, 4)
	if formatted != "Trác Việt Kiếm Sắt" {
		t.Fatalf("expected preNameType prefix, got %q", formatted)
	}
}

func TestEquipmentQualityHelpers_MapRawQualityToPrefixAndColor(t *testing.T) {
	if color := EquipmentColorCodeFromQuality(10); color != 2 {
		t.Fatalf("expected colorCode 2 for quality 10, got %d", color)
	}
	if displayColor := EquipmentDisplayColorFromColorCode(2); displayColor != 1 {
		t.Fatalf("expected display color 1 for colorCode 2, got %d", displayColor)
	}
	if colorCode := EquipmentColorCodeFromDisplayColor(3); colorCode != 4 {
		t.Fatalf("expected colorCode 4 for display color 3, got %d", colorCode)
	}

	if prefixType := EquipmentPrefixTypeFromQuality(10); prefixType != 5 {
		t.Fatalf("expected prefixType 5 for quality 10, got %d", prefixType)
	}

	formatted := FormatEquipmentDisplayNameFromQuality("Kiếm Sắt", 10)
	if formatted != "Trác Việt Kiếm Sắt" {
		t.Fatalf("expected Trác Việt prefix, got %q", formatted)
	}
}

func TestPopupNoticeColor_UsesDisplayColorForEquipment(t *testing.T) {
	if got := PopupNoticeColor(ItemTypeEquipment, 3); got != 2 {
		t.Fatalf("expected equipment popup color 2 for colorCode 3, got %d", got)
	}
	if got := PopupNoticeColor(ItemTypeConsumable, 3); got != 3 {
		t.Fatalf("expected consumable popup color 3, got %d", got)
	}
}

func TestRepresentativeEquipmentQualityFromColorCode_PreservesTierPrefixShape(t *testing.T) {
	cases := []struct {
		colorCode int
		wantQ     int
	}{
		{colorCode: 1, wantQ: 1},
		{colorCode: 2, wantQ: 7},
		{colorCode: 3, wantQ: 13},
		{colorCode: 4, wantQ: 19},
		{colorCode: 5, wantQ: 25},
	}

	for _, tc := range cases {
		gotQ := RepresentativeEquipmentQualityFromColorCode(tc.colorCode)
		if gotQ != tc.wantQ {
			t.Fatalf("colorCode=%d representative q=%d, want %d", tc.colorCode, gotQ, tc.wantQ)
		}
		if gotColor := EquipmentColorCodeFromQuality(gotQ); gotColor != tc.colorCode {
			t.Fatalf("colorCode=%d representative q=%d maps to color=%d", tc.colorCode, gotQ, gotColor)
		}
		if gotPrefix := EquipmentPrefixTypeFromQuality(gotQ); gotPrefix != tc.colorCode {
			t.Fatalf("colorCode=%d representative q=%d maps to prefix=%d", tc.colorCode, gotQ, gotPrefix)
		}
	}
}
