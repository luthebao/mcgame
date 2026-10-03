// Open-sourced by BaoLT

// Equipment display contract helpers keep RTMP item payloads aligned with the Flash client tooltip expectations.
package item

import (
	"strconv"
	"strings"

	domainitem "mcgame-server/internal/domain/item"
	domainmw "mcgame-server/internal/domain/magicweapon"
	"mcgame-server/internal/gamedata/models"
)

func (s *Service) BuildClientItemDTO(it *domainitem.Item) map[string]interface{} {
	if it == nil {
		return map[string]interface{}{}
	}

	dto := it.ToDTO()
	if it.ItemType != domainitem.ItemTypeEquipment {
		return dto
	}

	var equipTpl *models.EquiptTemplateTemplate
	if s != nil {
		equipTpl = s.GetEquipmentTemplate(it.TemplateID)
	}

	applyEquipmentDTOContract(dto, it, equipTpl)
	return dto
}

func (s *Service) BuildClientItemDTOList(items []*domainitem.Item) []map[string]interface{} {
	if len(items) == 0 {
		return []map[string]interface{}{}
	}

	dtos := make([]map[string]interface{}, len(items))
	for index, it := range items {
		dtos[index] = s.BuildClientItemDTO(it)
	}

	return dtos
}

func ApplyEquipmentDisplayContract(recordData map[string]interface{}, templateData map[string]interface{}) {
	if recordData == nil {
		return
	}

	colorCode := equipmentContractColorCode(recordData, templateData)
	if colorCode > 0 {
		recordData["colorCode"] = colorCode
		recordData["color"] = domainitem.EquipmentDisplayColorFromColorCode(colorCode)
	}

	if isMWTemplateData(templateData) {
		recordData["q"] = mwVongFromUpgradeNum(displayContractInt(recordData["upgradeNum"]))
	} else {
		prefixType := equipmentContractPrefixType(recordData, colorCode)
		if prefixType > 0 {
			recordData["preNameType"] = prefixType
		}
	}

	if binded, ok := recordData["binded"]; ok {
		recordData["binded"] = equipmentContractBindFlag(binded)
	}

	applyEquipmentRecordDefaults(recordData, templateData)
}

func applyEquipmentDTOContract(dto map[string]interface{}, it *domainitem.Item, equipTpl *models.EquiptTemplateTemplate) {
	if dto == nil || it == nil {
		return
	}

	colorCode := domainitem.NormalizeEquipmentColorCode(it.ColorCode)
	if colorCode <= 0 {
		colorCode = equipmentContractColorCode(dto, equipmentTemplateContractData(equipTpl))
	}
	if colorCode > 0 {
		dto["colorCode"] = colorCode
		dto["color"] = domainitem.EquipmentDisplayColorFromColorCode(colorCode)
	}

	if domainmw.IsMWTemplate(equipTpl) {
		dto["q"] = mwVongFromUpgradeNum(it.StarLevel)
	} else {
		prefixType := equipmentContractPrefixType(dto, colorCode)
		if prefixType > 0 {
			dto["preNameType"] = prefixType
		}
	}

	dto["binded"] = equipmentContractBindFlag(it.IsBound)
	applyEquipmentDTODefaults(dto, it, equipTpl)
}

func mwVongFromUpgradeNum(upgradeNum int) int {
	if upgradeNum <= 0 {
		return 0
	}
	if upgradeNum > 8 {
		return 8
	}
	return upgradeNum
}

func isMWTemplateData(templateData map[string]interface{}) bool {
	if templateData == nil {
		return false
	}
	return displayContractInt(templateData["kind"]) == domainmw.ItemKind
}

func applyEquipmentDTODefaults(dto map[string]interface{}, it *domainitem.Item, equipTpl *models.EquiptTemplateTemplate) {
	if dto == nil || it == nil {
		return
	}

	if equipTpl != nil {
		ensureMapValue(dto, "mainProp1", int(equipTpl.MainProp1))
		ensureMapValue(dto, "mainProp2", int(equipTpl.MainProp2))
		ensureMapValue(dto, "mainPropNum1", int(equipTpl.MainPropNum1))
		ensureMapValue(dto, "mainPropNum2", int(equipTpl.MainPropNum2))
		ensureMapValue(dto, "prop1", int(equipTpl.Prop1))
		ensureMapValue(dto, "prop2", int(equipTpl.Prop2))
		ensureMapValue(dto, "propNum1", int(equipTpl.PropNum1))
		ensureMapValue(dto, "propNum2", int(equipTpl.PropNum2))
		ensureMapValue(dto, "activeProp", int(equipTpl.ActivePropType))
		ensureMapValue(dto, "activePropNum", int(equipTpl.ActivePropNum))
		ensureMapValue(dto, "bindMainPropNum1", int(equipTpl.BindPropNum))
		ensureMapValue(dto, "bindMainPropNum2", int(equipTpl.BindPropNum))
	}

	dto["holeNum"] = GetDrilledHoleCount(it.Properties)

	ensureMapValue(dto, "element", 0)
	ensureMapValue(dto, "maker", "")
	ensureMapValue(dto, "flag", "")
	ensureMapValue(dto, "flag2", nil)
	ensureMapValue(dto, "flag3", nil)
	ensureMapValue(dto, "t", "-1")

	for index := 1; index <= 10; index++ {
		ensureMapValue(dto, "t"+strconv.Itoa(index), -1)
	}

	if it.Durability != nil {
		ensureMapValue(dto, "endureLeft", strconv.Itoa(*it.Durability))
	}
	if it.MaxDurability != nil {
		ensureMapValue(dto, "endureMax", strconv.Itoa(*it.MaxDurability))
	}
	if it.MaxDurability == nil && equipTpl != nil {
		ensureMapValue(dto, "endureMax", strconv.Itoa(int(equipTpl.EndureMax)))
	}
	if it.Durability == nil && equipTpl != nil {
		ensureMapValue(dto, "endureLeft", strconv.Itoa(int(equipTpl.EndureMax)))
	}
}

func countDrilledHolesInRecord(data map[string]interface{}) int {
	count := 0
	for i := 1; i <= 10; i++ {
		val, exists := data["t"+strconv.Itoa(i)]
		if !exists {
			continue
		}
		if displayContractInt(val) >= 0 {
			count++
		}
	}
	return count
}

func applyEquipmentRecordDefaults(recordData map[string]interface{}, templateData map[string]interface{}) {
	recordData["holeNum"] = countDrilledHolesInRecord(recordData)

	for index := 1; index <= 10; index++ {
		ensureMapValue(recordData, "t"+strconv.Itoa(index), -1)
	}

	ensureMapValue(recordData, "element", 0)
	ensureMapValue(recordData, "maker", "")
	ensureMapValue(recordData, "flag", "")
	ensureMapValue(recordData, "flag2", nil)
	ensureMapValue(recordData, "flag3", nil)
	ensureMapValue(recordData, "t", -1)

	if templateData != nil {
		copyTemplateFallback(recordData, templateData, "mainProp1")
		copyTemplateFallback(recordData, templateData, "mainProp2")
		copyTemplateFallback(recordData, templateData, "mainPropNum1")
		copyTemplateFallback(recordData, templateData, "mainPropNum2")
		copyTemplateFallback(recordData, templateData, "prop1")
		copyTemplateFallback(recordData, templateData, "prop2")
		copyTemplateFallback(recordData, templateData, "propNum1")
		copyTemplateFallback(recordData, templateData, "propNum2")
		if _, ok := recordData["activeProp"]; !ok {
			if value, exists := templateData["activePropType"]; exists {
				recordData["activeProp"] = value
			}
		}
		copyTemplateFallback(recordData, templateData, "activePropNum")
		if _, ok := recordData["bindMainPropNum1"]; !ok {
			if value, exists := templateData["bindPropNum"]; exists {
				recordData["bindMainPropNum1"] = value
			}
		}
		if _, ok := recordData["bindMainPropNum2"]; !ok {
			if value, exists := templateData["bindPropNum"]; exists {
				recordData["bindMainPropNum2"] = value
			}
		}
		if _, ok := recordData["endureMax"]; !ok {
			if value, exists := templateData["endureMax"]; exists {
				recordData["endureMax"] = value
			}
		}
	}

	if _, ok := recordData["endureLeft"]; !ok {
		if durability, exists := recordData["durability"]; exists {
			recordData["endureLeft"] = durability
		}
	}
	if _, ok := recordData["endureMax"]; !ok {
		if maxDurability, exists := recordData["maxDurability"]; exists {
			recordData["endureMax"] = maxDurability
		}
	}
}

func equipmentContractColorCode(recordData map[string]interface{}, templateData map[string]interface{}) int {
	colorCode := domainitem.NormalizeEquipmentColorCode(displayContractInt(recordData["colorCode"]))
	if colorCode > 0 {
		return colorCode
	}

	quality := displayContractInt(recordData["q"])
	if quality <= 0 {
		quality = displayContractInt(recordData["quality"])
	}
	if quality > 0 {
		return domainitem.EquipmentColorCodeFromQuality(quality)
	}

	if displayColor := displayContractInt(recordData["color"]); displayColor > 0 {
		return domainitem.EquipmentColorCodeFromDisplayColor(displayColor)
	}

	if templateData == nil {
		return 0
	}

	colorCode = domainitem.NormalizeEquipmentColorCode(displayContractInt(templateData["colorCode"]))
	if colorCode > 0 {
		return colorCode
	}

	return domainitem.NormalizeEquipmentColorCode(displayContractInt(templateData["color"]))
}

func equipmentContractPrefixType(recordData map[string]interface{}, colorCode int) int {
	quality := displayContractInt(recordData["q"])
	if quality <= 0 {
		quality = displayContractInt(recordData["quality"])
	}
	if quality > 0 {
		return domainitem.EquipmentPrefixTypeFromQuality(quality)
	}

	return domainitem.ResolveEquipmentPrefixType(recordData["preNameType"], colorCode)
}

func equipmentContractBindFlag(value interface{}) string {
	switch typed := value.(type) {
	case string:
		trimmed := strings.TrimSpace(typed)
		if trimmed == "1" || strings.EqualFold(trimmed, "true") {
			return "1"
		}
		return "0"
	case bool:
		if typed {
			return "1"
		}
		return "0"
	default:
		if displayContractInt(value) > 0 {
			return "1"
		}
		return "0"
	}
}

func equipmentTemplateContractData(equipTpl *models.EquiptTemplateTemplate) map[string]interface{} {
	if equipTpl == nil {
		return nil
	}

	return map[string]interface{}{
		"color":          int(equipTpl.Color),
		"colorCode":      int(equipTpl.ColorCode),
		"mainProp1":      int(equipTpl.MainProp1),
		"mainProp2":      int(equipTpl.MainProp2),
		"mainPropNum1":   int(equipTpl.MainPropNum1),
		"mainPropNum2":   int(equipTpl.MainPropNum2),
		"prop1":          int(equipTpl.Prop1),
		"prop2":          int(equipTpl.Prop2),
		"propNum1":       int(equipTpl.PropNum1),
		"propNum2":       int(equipTpl.PropNum2),
		"activePropType": int(equipTpl.ActivePropType),
		"activePropNum":  int(equipTpl.ActivePropNum),
		"bindPropNum":    int(equipTpl.BindPropNum),
		"holeNum":        int(equipTpl.HoleNum),
		"endureMax":      int(equipTpl.EndureMax),
	}
}

func copyTemplateFallback(target map[string]interface{}, templateData map[string]interface{}, key string) {
	if _, ok := target[key]; ok {
		return
	}
	if value, ok := templateData[key]; ok {
		target[key] = value
	}
}

func ensureMapValue(target map[string]interface{}, key string, value interface{}) {
	if _, ok := target[key]; ok {
		return
	}
	target[key] = value
}

func displayContractInt(value interface{}) int {
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
	case uint:
		return int(typed)
	case uint8:
		return int(typed)
	case uint16:
		return int(typed)
	case uint32:
		return int(typed)
	case uint64:
		return int(typed)
	case float32:
		return int(typed)
	case float64:
		return int(typed)
	case bool:
		if typed {
			return 1
		}
		return 0
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
