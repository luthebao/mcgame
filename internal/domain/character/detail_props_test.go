// Open-sourced by BaoLT

package character

import "testing"

func TestDetailStatPropSpecByKey_ReturnsMappedIDs(t *testing.T) {
	testCases := []struct {
		key                 string
		semanticPropID      int
		legacyPropID        int
		commonFeaturePropID int
		equipmentPropID     int
	}{
		{key: "finalCounter", semanticPropID: PropCounter, legacyPropID: 10, commonFeaturePropID: 10, equipmentPropID: 10},
		{key: "finalCombo", semanticPropID: PropCombo, legacyPropID: 12, commonFeaturePropID: 12, equipmentPropID: 12},
		{key: "finalDefy", semanticPropID: PropDefy, legacyPropID: 14, commonFeaturePropID: 14, equipmentPropID: 14},
		{key: "finalDizzy", semanticPropID: PropDizzy, commonFeaturePropID: 53},
		{key: "finalConfusion", semanticPropID: PropConfusion, commonFeaturePropID: 52},
		{key: "finalSleep", semanticPropID: PropSleep, commonFeaturePropID: 56},
		{key: "finalPoison", semanticPropID: PropPoison, commonFeaturePropID: 54},
		{key: "finalRage", semanticPropID: PropRage, commonFeaturePropID: 55},
		{key: "finalLight", semanticPropID: PropLight, commonFeaturePropID: 57},
		{key: "finalRebornRate", semanticPropID: PropRebornRate, legacyPropID: 34, commonFeaturePropID: 34, equipmentPropID: 26},
		{key: "finalResiCritical", semanticPropID: PropResiCritical, legacyPropID: 27, commonFeaturePropID: 31, equipmentPropID: 27},
		{key: "finalResiDefy", semanticPropID: PropResiDefy, legacyPropID: 29, commonFeaturePropID: 61, equipmentPropID: 29},
		{key: "finalResiRage", semanticPropID: PropResiRage, commonFeaturePropID: 30},
		{key: "finalBreakReborn", semanticPropID: PropBreakReborn, legacyPropID: 72, commonFeaturePropID: 72},
		{key: "finalEnhPhyHurt", semanticPropID: PropFinalPhysBonus, commonFeaturePropID: 62},
		{key: "finalResiSleep", semanticPropID: PropResiSleep, legacyPropID: 19, commonFeaturePropID: 19},
		{key: "finalEnhMagicHurt", semanticPropID: PropFinalMagicBonus, commonFeaturePropID: 63},
		{key: "finalPraDef", semanticPropID: PropFinalPhysReduce, legacyPropID: 14, commonFeaturePropID: 59},
		{key: "finalPraMagDef", semanticPropID: PropFinalMagicReduce, commonFeaturePropID: 60},
		{key: "finalCriticalDamage", semanticPropID: PropCriticalDamage, commonFeaturePropID: 71},
		{key: "finalReduceHurt1", legacyPropID: 15},
	}

	for _, tc := range testCases {
		spec, ok := DetailStatPropSpecByKey(tc.key)
		if !ok {
			t.Fatalf("DetailStatPropSpecByKey(%q) not found", tc.key)
		}
		if spec.SemanticPropID != tc.semanticPropID {
			t.Fatalf("%s semantic = %d, want %d", tc.key, spec.SemanticPropID, tc.semanticPropID)
		}
		if spec.LegacyPropID != tc.legacyPropID {
			t.Fatalf("%s legacy = %d, want %d", tc.key, spec.LegacyPropID, tc.legacyPropID)
		}
		if spec.CommonFeaturePropID != tc.commonFeaturePropID {
			t.Fatalf("%s common = %d, want %d", tc.key, spec.CommonFeaturePropID, tc.commonFeaturePropID)
		}
		if spec.EquipmentPropID != tc.equipmentPropID {
			t.Fatalf("%s equipment = %d, want %d", tc.key, spec.EquipmentPropID, tc.equipmentPropID)
		}
	}
}

func TestCommonFeaturePropToStat_MapsLanguageBuffAndQilingIDs(t *testing.T) {
	testCases := []struct {
		propType int
		want     int
	}{
		{propType: 30, want: PropResiRage},
		{propType: 43, want: PropResiDizzy},
		{propType: 44, want: PropResiConfusion},
		{propType: 45, want: PropResiSleep},
		{propType: 46, want: PropResiPoison},
		{propType: 49, want: PropResiLight},
		{propType: 50, want: PropResiRage},
		{propType: 51, want: PropResiCritical},
		{propType: 52, want: PropConfusion},
		{propType: 53, want: PropDizzy},
		{propType: 54, want: PropPoison},
		{propType: 55, want: PropRage},
		{propType: 56, want: PropSleep},
		{propType: 57, want: PropLight},
	}

	for _, tc := range testCases {
		if got := CommonFeaturePropToStat(tc.propType); got != tc.want {
			t.Fatalf("CommonFeaturePropToStat(%d) = %d, want %d", tc.propType, got, tc.want)
		}
	}
}

func TestDetailStatPropPayload_ProjectsExpectedKeys(t *testing.T) {
	payload := DetailStatPropPayload(map[string]interface{}{
		"finalCombo":          11,
		"finalResiRage":       3.5,
		"finalCriticalDamage": 25,
		"finalAttack":         999,
	})

	if len(payload) != len(DetailStatPropSpecs()) {
		t.Fatalf("len(payload) = %d, want %d", len(payload), len(DetailStatPropSpecs()))
	}
	if got := payload["finalCombo"]; got != float64(11) {
		t.Fatalf("payload[finalCombo] = %#v, want 11", got)
	}
	if got := payload["finalResiRage"]; got != 3.5 {
		t.Fatalf("payload[finalResiRage] = %#v, want 3.5", got)
	}
	if got := payload["finalCriticalDamage"]; got != float64(25) {
		t.Fatalf("payload[finalCriticalDamage] = %#v, want 25", got)
	}
	if _, ok := payload["finalAttack"]; ok {
		t.Fatalf("payload should not include finalAttack")
	}
}
