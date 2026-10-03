// Open-sourced by BaoLT

// Stat feature helpers normalize JSON state blobs, default client payload fragments, and property bonus mappings.
package statfeature

import (
	"math"
	"strconv"
	"strings"

	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"
	domainwsp "mcgame-server/internal/domain/warsprite"
)

func cloneMap(src map[string]interface{}) map[string]interface{} {
	if len(src) == 0 {
		return map[string]interface{}{}
	}
	dst := make(map[string]interface{}, len(src))
	for key, value := range src {
		dst[key] = value
	}
	return dst
}

func mergeMaps(base map[string]interface{}, extra map[string]interface{}) map[string]interface{} {
	merged := cloneMap(base)
	for key, value := range extra {
		merged[key] = value
	}
	return merged
}

func defaultCharacterLoginState(progression *domainfeature.CharacterProgression) map[string]interface{} {
	awakenLevel := 0
	awakenPoints := 0
	awakenPointsUsed := 0
	soulLevel := 0
	soulExp := int64(0)
	soulPoints := int64(0)

	if progression != nil {
		awakenLevel = progression.AwakenLevel
		awakenPoints = progression.AwakenPoints
		awakenPointsUsed = progression.AwakenPointsUsed
		soulLevel = progression.SoulLevel
		soulExp = progression.SoulExp
		soulPoints = progression.SoulPoints
	}

	return map[string]interface{}{
		"astrologicData":  defaultAstrologicData(),
		"starsData":       map[string]interface{}{},
		"activePetObject": map[string]interface{}{},
		"awakenAdd":       0,
		"awakenLevel":     awakenLevel,
		"awakenPoint":     awakenPoints,
		"awakenPointUsed": awakenPointsUsed,
		"awakenPointDict": map[string]interface{}{},
		"contractPet":     defaultContractPetState(),
		"trainSoulLvl":    soulLevel,
		"trainSoulExp":    soulExp,
		"soulExp":         soulExp,
		"soulChip":        soulPoints,
		"heiyaoshi":       defaultHeiyaoshiState(),
		"medalExp":        0,
	}
}

func monsterHeartBagFromState(state map[string]interface{}) map[string]interface{} {
	bag := map[string]interface{}{
		"ren":  map[string]interface{}{},
		"shou": map[string]interface{}{},
		"zhi":  map[string]interface{}{},
		"mo":   map[string]interface{}{},
		"ji":   map[string]interface{}{},
		"lon":  map[string]interface{}{},
		"te":   map[string]interface{}{},
	}
	for category, entries := range stateValueAsMap(state, "bag") {
		bag[category] = entries
	}
	return bag
}

func defaultAstrologicData() map[string]interface{} {
	return map[string]interface{}{
		"buyPickCount": 0,
		"starsNow":     map[string]interface{}{},
		"starsToPick":  map[string]interface{}{},
		"pickCount":    0,
		"refreshCount": 0,
		"date":         "",
		"buyFormula":   map[string]interface{}{},
	}
}

func defaultContractPetState() map[string]interface{} {
	return map[string]interface{}{
		"hp":         0,
		"hpExp":      0,
		"speed":      0,
		"speedExp":   0,
		"physics":    0,
		"physicsExp": 0,
		"magic":      0,
		"magicExp":   0,
	}
}

func defaultHeiyaoshiState() map[string]interface{} {
	return map[string]interface{}{
		"lastActFigure": 0,
		"actPoint":      map[string]interface{}{},
		"actArea":       map[string]interface{}{},
		"AreaNum":       map[string]interface{}{},
		"LineNum":       map[string]interface{}{},
		"actLine":       map[string]interface{}{},
		"Buff":          map[string]interface{}{},
	}
}

func defaultWarSpriteState() map[string]interface{} {
	return domainwsp.Default().ToClientPayload()
}

func stateValueAsMap(state map[string]interface{}, key string) map[string]interface{} {
	if len(state) == 0 {
		return map[string]interface{}{}
	}
	return mapValue(state, key)
}

func mapValue(state map[string]interface{}, key string) map[string]interface{} {
	if state == nil {
		return map[string]interface{}{}
	}
	value, ok := state[key]
	if !ok {
		return map[string]interface{}{}
	}
	switch typed := value.(type) {
	case map[string]interface{}:
		return cloneMap(typed)
	default:
		return map[string]interface{}{}
	}
}

func intValue(value interface{}) (int, bool) {
	switch typed := value.(type) {
	case int:
		return typed, true
	case int32:
		return int(typed), true
	case int64:
		return int(typed), true
	case float32:
		return int(typed), true
	case float64:
		return int(typed), true
	case string:
		parsed, err := strconv.Atoi(strings.TrimSpace(typed))
		if err != nil {
			return 0, false
		}
		return parsed, true
	default:
		return 0, false
	}
}

func floatValue(value interface{}) (float64, bool) {
	switch typed := value.(type) {
	case float64:
		return typed, true
	case float32:
		return float64(typed), true
	case int:
		return float64(typed), true
	case int32:
		return float64(typed), true
	case int64:
		return float64(typed), true
	case string:
		parsed, err := strconv.ParseFloat(strings.TrimSpace(typed), 64)
		if err != nil {
			return 0, false
		}
		return parsed, true
	default:
		return 0, false
	}
}

func stringValue(value interface{}) (string, bool) {
	switch typed := value.(type) {
	case string:
		return typed, true
	default:
		return "", false
	}
}

func strconvAtoi(value string) (int, error) {
	return strconv.Atoi(strings.TrimSpace(value))
}

func parseExplorerMedalID(state map[string]interface{}) int {
	if state == nil {
		return 0
	}
	for _, key := range []string{"id", "templateId", "template_id", "medalId", "medal_id"} {
		if id, ok := intValue(state[key]); ok {
			return id
		}
	}
	if info, ok := stringValue(state["info"]); ok && info != "" {
		parts := strings.Split(info, "|")
		if len(parts) > 0 {
			if id, err := strconv.Atoi(strings.TrimSpace(parts[0])); err == nil {
				return id
			}
		}
	}
	return 0
}

func collectMapValueIDs(value interface{}) []int {
	switch typed := value.(type) {
	case map[string]interface{}:
		ids := make([]int, 0, len(typed))
		for _, raw := range typed {
			if id, ok := intValue(raw); ok && id > 0 {
				ids = append(ids, id)
			}
		}
		return ids
	default:
		return nil
	}
}

func collectNamedIDs(value interface{}, wanted map[string]struct{}) []int {
	ids := make([]int, 0)
	visitNamedIDs(value, wanted, &ids)
	return ids
}

func visitNamedIDs(value interface{}, wanted map[string]struct{}, ids *[]int) {
	switch typed := value.(type) {
	case map[string]interface{}:
		for key, nested := range typed {
			if _, ok := wanted[key]; ok {
				appendAnyIDs(ids, nested)
				continue
			}
			visitNamedIDs(nested, wanted, ids)
		}
	case []interface{}:
		for _, nested := range typed {
			visitNamedIDs(nested, wanted, ids)
		}
	}
}

func appendAnyIDs(ids *[]int, value interface{}) {
	switch typed := value.(type) {
	case []interface{}:
		for _, nested := range typed {
			appendAnyIDs(ids, nested)
		}
	case map[string]interface{}:
		for _, nested := range typed {
			appendAnyIDs(ids, nested)
		}
	default:
		if id, ok := intValue(value); ok && id > 0 {
			*ids = append(*ids, id)
		}
	}
}

func magicArrayPropToID(prop string) int {
	switch prop {
	case "hp":
		return domainchar.PropMaxHP
	case "attack":
		return domainchar.PropAttack
	case "mAttack":
		return domainchar.PropMagicAttack
	case "defence":
		return domainchar.PropDefense
	case "mDefence":
		return domainchar.PropMagicDef
	case "speed":
		return domainchar.PropSpeed
	case "hit":
		return domainchar.PropHit
	case "dodge":
		return domainchar.PropDodge
	case "critical":
		return domainchar.PropCritical
	case "resiCritical":
		return domainchar.PropResiCritical
	case "debuffSuccRate":
		return domainchar.PropDebuffHit
	case "debuffResiRate":
		return domainchar.PropDebuffResist
	default:
		return 0
	}
}

func normalizeRawPropValue(propID int, rawValue float64) float64 {
	if statProp := domainchar.NormalizeCharacterPropType(propID); statProp != 0 {
		return domainchar.NormalizeRatePropValue(statProp, rawValue)
	}
	if propID == 34 && rawValue > 0 && rawValue < 1 {
		return rawValue * 100
	}
	return rawValue
}

func applyCharacterPropBonus(bonuses *domainchar.EquipmentStatBonuses, propID int, rawValue float64) {
	if bonuses == nil || propID <= 0 || rawValue == 0 {
		return
	}

	statProp := domainchar.NormalizeCharacterPropType(propID)
	if statProp == 0 {
		return
	}

	value := normalizeRawPropValue(statProp, rawValue)
	switch {
	case domainchar.UsesFloatBonus(statProp):
		bonuses.AddFloat(statProp, value)
	case domainchar.IsPercentScalableProp(statProp):
		bonuses.AddFlat(statProp, int(math.Round(value)))
	default:
		bonuses.AddFlat(statProp, int(math.Round(value)))
	}
}

func applyPercentCharacterPropBonus(bonuses *domainchar.EquipmentStatBonuses, propID int, rawValue float64) {
	if bonuses == nil || rawValue == 0 {
		return
	}

	statProp := domainchar.NormalizeCharacterPropType(propID)
	if statProp == 0 {
		return
	}

	value := normalizeRawPropValue(statProp, rawValue)
	if domainchar.IsPercentScalableProp(statProp) {
		bonuses.AddPercent(statProp, int(math.Round(value)))
		return
	}

	switch statProp {
	case domainchar.PropMaxHP, domainchar.PropMaxMP, domainchar.PropMaxSP,
		domainchar.PropAttack, domainchar.PropMagicAttack, domainchar.PropDefense,
		domainchar.PropMagicDef, domainchar.PropSpeed:
		bonuses.AddPercent(statProp, int(math.Round(value)))
	case domainchar.PropCritical, domainchar.PropDefy:
		bonuses.AddFlat(statProp, int(math.Round(value)))
	default:
		if domainchar.UsesFloatBonus(statProp) {
			bonuses.AddFloat(statProp, value)
			return
		}
		bonuses.AddFlat(statProp, int(math.Round(value)))
	}
}
