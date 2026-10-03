// Open-sourced by BaoLT

// Equipment display helpers keep server-side item color tiers aligned with Flash client prefixes.
package item

import (
	"strconv"
	"strings"
)

var equipmentQualityPrefixes = [...]string{
	"",
	"Bình Thường ",
	"Cường Hóa ",
	"Tinh Xảo ",
	"Hoàn Mỹ ",
	"Trác Việt ",
}

var equipmentQualityMultipliers = [...]float64{
	1,
	1.05,
	1.1,
	1.15,
	1.2,
	1.25,
	1.3,
	1.35,
	1.4,
	1.45,
	1.5,
	1.6,
	1.7,
	1.8,
	1.9,
	2.1,
	2.3,
	2.5,
	2.7,
	2.9,
	3.5,
}

func NormalizeEquipmentColorCode(colorCode int) int {
	if colorCode < 0 {
		return 0
	}
	if colorCode > 5 {
		return 5
	}
	return colorCode
}

func NormalizeEquipmentPrefixType(prefixType int) int {
	if prefixType < 0 {
		return 0
	}
	if prefixType > 5 {
		return 5
	}
	return prefixType
}

func EquipmentPrefixTypeFromColorCode(colorCode int) int {
	return NormalizeEquipmentPrefixType(colorCode)
}

func EquipmentPrefixTypeFromQuality(quality int) int {
	if quality <= 0 {
		return 0
	}

	prefixType := quality % 5
	if prefixType == 0 {
		prefixType = 5
	}

	return prefixType
}

func EquipmentColorCodeFromQuality(quality int) int {
	if quality <= 0 {
		return 0
	}

	return NormalizeEquipmentColorCode((quality + 4) / 5)
}

func QuestRewardEquipmentColorCodeFromQuality(quality int) int {
	if quality <= 0 {
		return 0
	}

	return NormalizeEquipmentColorCode(((quality + 4) / 5) + 1)
}

func EquipmentQualityMultiplierRange(quality int) (float64, float64) {
	if quality <= 0 {
		return 1, 1
	}

	highIndex := quality
	if highIndex > len(equipmentQualityMultipliers)-1 {
		highIndex = len(equipmentQualityMultipliers) - 1
	}
	lowIndex := highIndex - 1
	if lowIndex < 0 {
		lowIndex = 0
	}

	return equipmentQualityMultipliers[lowIndex], equipmentQualityMultipliers[highIndex]
}

func EquipmentDisplayColorFromColorCode(colorCode int) int {
	colorCode = NormalizeEquipmentColorCode(colorCode)
	if colorCode <= 0 {
		return 0
	}

	return colorCode - 1
}

func EquipmentColorCodeFromDisplayColor(color int) int {
	if color < 0 {
		return 0
	}
	if color > 4 {
		color = 4
	}

	return NormalizeEquipmentColorCode(color + 1)
}

func PopupNoticeColor(itemType ItemType, colorCode int) int {
	if itemType == ItemTypeEquipment {
		return EquipmentDisplayColorFromColorCode(colorCode)
	}
	if colorCode < 0 {
		return -1
	}
	return colorCode
}

func RepresentativeEquipmentQualityFromColorCode(colorCode int) int {
	colorCode = NormalizeEquipmentColorCode(colorCode)
	if colorCode <= 0 {
		return 0
	}

	return ((colorCode - 1) * 6) + 1
}

func ResolveEquipmentPrefixType(current interface{}, colorCode int) int {
	currentPrefix := NormalizeEquipmentPrefixType(displayIntValue(current))
	if currentPrefix > 0 {
		return currentPrefix
	}
	return EquipmentPrefixTypeFromColorCode(colorCode)
}

func FormatEquipmentDisplayName(name string, colorCode int) string {
	prefix := equipmentQualityPrefixes[EquipmentPrefixTypeFromColorCode(colorCode)]
	if prefix == "" || name == "" {
		return name
	}
	for _, knownPrefix := range equipmentQualityPrefixes[1:] {
		if strings.HasPrefix(name, knownPrefix) {
			return name
		}
	}
	return prefix + name
}

func FormatEquipmentDisplayNameWithCurrent(name string, current interface{}, colorCode int) string {
	prefix := equipmentQualityPrefixes[ResolveEquipmentPrefixType(current, colorCode)]
	if prefix == "" || name == "" {
		return name
	}
	for _, knownPrefix := range equipmentQualityPrefixes[1:] {
		if strings.HasPrefix(name, knownPrefix) {
			return name
		}
	}
	return prefix + name
}

func FormatEquipmentDisplayNameFromQuality(name string, quality int) string {
	prefix := equipmentQualityPrefixes[EquipmentPrefixTypeFromQuality(quality)]
	if prefix == "" || name == "" {
		return name
	}
	for _, knownPrefix := range equipmentQualityPrefixes[1:] {
		if strings.HasPrefix(name, knownPrefix) {
			return name
		}
	}
	return prefix + name
}

func displayIntValue(value interface{}) int {
	switch typed := value.(type) {
	case nil:
		return 0
	case int:
		return typed
	case int8:
		return int(typed)
	case int16:
		return int(typed)
	case int32:
		return int(typed)
	case int64:
		return int(typed)
	case float32:
		return int(typed)
	case float64:
		return int(typed)
	case string:
		parsed, err := strconv.Atoi(strings.TrimSpace(typed))
		if err != nil {
			return 0
		}
		return parsed
	default:
		return 0
	}
}
