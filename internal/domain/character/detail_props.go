// Open-sourced by BaoLT

package character

type StatPropSpec struct {
	Key                 string
	SemanticPropID      int
	LegacyPropID        int
	CommonFeaturePropID int
	EquipmentPropID     int
}

var detailStatPropSpecs = []StatPropSpec{
	{Key: "finalCombo", SemanticPropID: PropCombo, LegacyPropID: 12, CommonFeaturePropID: 12, EquipmentPropID: 12},
	{Key: "finalCounter", SemanticPropID: PropCounter, LegacyPropID: 10, CommonFeaturePropID: 10, EquipmentPropID: 10},
	{Key: "finalRebornRate", SemanticPropID: PropRebornRate, LegacyPropID: 34, CommonFeaturePropID: 34, EquipmentPropID: 26},
	{Key: "finalBreakReborn", SemanticPropID: PropBreakReborn, LegacyPropID: 72, CommonFeaturePropID: 72},
	{Key: "finalDefy", SemanticPropID: PropDefy, LegacyPropID: 14, CommonFeaturePropID: 14, EquipmentPropID: 14},
	{Key: "finalResiDefy", SemanticPropID: PropResiDefy, LegacyPropID: 29, CommonFeaturePropID: 61, EquipmentPropID: 29},
	{Key: "finalResiCritical", SemanticPropID: PropResiCritical, LegacyPropID: 27, CommonFeaturePropID: 31, EquipmentPropID: 27},
	{Key: "finalDizzy", SemanticPropID: PropDizzy, CommonFeaturePropID: 53},
	{Key: "finalConfusion", SemanticPropID: PropConfusion, CommonFeaturePropID: 52},
	{Key: "finalSleep", SemanticPropID: PropSleep, CommonFeaturePropID: 56},
	{Key: "finalPoison", SemanticPropID: PropPoison, CommonFeaturePropID: 54},
	{Key: "finalRage", SemanticPropID: PropRage, CommonFeaturePropID: 55},
	{Key: "finalLight", SemanticPropID: PropLight, CommonFeaturePropID: 57},
	{Key: "finalResiDizzy", SemanticPropID: PropResiDizzy, LegacyPropID: 17, CommonFeaturePropID: 17},
	{Key: "finalResiConfusion", SemanticPropID: PropResiConfusion, LegacyPropID: 18, CommonFeaturePropID: 18},
	{Key: "finalResiSleep", SemanticPropID: PropResiSleep, LegacyPropID: 19, CommonFeaturePropID: 19},
	{Key: "finalResiPoison", SemanticPropID: PropResiPoison, LegacyPropID: 20, CommonFeaturePropID: 20},
	{Key: "finalResiLight", SemanticPropID: PropResiLight, LegacyPropID: 23, CommonFeaturePropID: 23},
	{Key: "finalResiRage", SemanticPropID: PropResiRage, CommonFeaturePropID: 30},
	{Key: "finalReduceHurt1", LegacyPropID: 15},
	{Key: "finalReduceHurt2", LegacyPropID: 16},
	{Key: "finalEnhPhyHurt", SemanticPropID: PropFinalPhysBonus, CommonFeaturePropID: 62},
	{Key: "finalEnhMagicHurt", SemanticPropID: PropFinalMagicBonus, CommonFeaturePropID: 63},
	{Key: "finalPraDef", SemanticPropID: PropFinalPhysReduce, LegacyPropID: 14, CommonFeaturePropID: 59},
	{Key: "finalPraMagDef", SemanticPropID: PropFinalMagicReduce, CommonFeaturePropID: 60},
	{Key: "finalCriticalDamage", SemanticPropID: PropCriticalDamage, CommonFeaturePropID: 71},
}

func DetailStatPropSpecs() []StatPropSpec {
	specs := make([]StatPropSpec, len(detailStatPropSpecs))
	copy(specs, detailStatPropSpecs)
	return specs
}

func DetailStatPropSpecByKey(key string) (StatPropSpec, bool) {
	for _, spec := range detailStatPropSpecs {
		if spec.Key == key {
			return spec, true
		}
	}
	return StatPropSpec{}, false
}

func ProjectStatPropPayload(source map[string]interface{}, specs []StatPropSpec) map[string]interface{} {
	payload := make(map[string]interface{}, len(specs))
	for _, spec := range specs {
		payload[spec.Key] = statPropNumberValue(source[spec.Key])
	}
	return payload
}

func DetailStatPropPayload(source map[string]interface{}) map[string]interface{} {
	return ProjectStatPropPayload(source, detailStatPropSpecs)
}

func statPropNumberValue(value interface{}) float64 {
	switch typed := value.(type) {
	case float64:
		return typed
	case float32:
		return float64(typed)
	case int:
		return float64(typed)
	case int8:
		return float64(typed)
	case int16:
		return float64(typed)
	case int32:
		return float64(typed)
	case int64:
		return float64(typed)
	case uint:
		return float64(typed)
	case uint8:
		return float64(typed)
	case uint16:
		return float64(typed)
	case uint32:
		return float64(typed)
	case uint64:
		return float64(typed)
	default:
		return 0
	}
}
