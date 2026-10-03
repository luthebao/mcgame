// Open-sourced by BaoLT

// Game data handler helpers.
package gamedata

import (
	"context"
	"encoding/json"
	"strconv"
	"strings"

	appitem "mcgame-server/internal/application/item"
	gamedatastore "mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
)

func safeInterfaceToInt(v interface{}) int {
	switch val := v.(type) {
	case float64:
		return rtmputils.SafeFloat64ToInt(val)
	case int:
		return val
	case int32:
		return int(val)
	case int64:
		return int(val)
	case string:
		i, _ := strconv.Atoi(val)
		return i
	default:
		return 0
	}
}
func getAvailableTableTypes() []int {
	types := make([]int, 0, len(models.TableIDToName))
	for typeID := range models.TableIDToName {
		types = append(types, typeID)
	}
	return types
}

func snakeToCamel(s string) string {
	if s == "id" {
		return "id"
	}
	parts := strings.Split(s, "_")
	for i := 1; i < len(parts); i++ {
		if len(parts[i]) > 0 {
			parts[i] = strings.ToUpper(parts[i][0:1]) + parts[i][1:]
		}
	}
	return strings.Join(parts, "")
}

func calculateSID(slotType int, slotIndex int) int {
	switch slotType {
	case 1:
		return 1 + slotIndex
	case 0:
		return 2100 + slotIndex + 1
	case 4:
		return 2300 + slotIndex + 1
	case 5:
		return 2340 + slotIndex + 1
	case 2:
		return 300 + slotIndex + 1
	case 3:
		return 80 + slotIndex
	default:
		return slotIndex
	}
}

func isInstanceTable(tableType int) bool {
	return tableType == 18 || tableType == 28
}

func normalizeJSONRecord(recordJSON json.RawMessage) (map[string]interface{}, error) {
	var rawData map[string]interface{}
	if err := json.Unmarshal(recordJSON, &rawData); err != nil {
		return nil, err
	}
	return normalizeRecordData(rawData), nil
}

func normalizeRecordData(rawData map[string]interface{}) map[string]interface{} {
	recordData := make(map[string]interface{}, len(rawData))
	for key, value := range rawData {
		recordData[snakeToCamel(key)] = value
	}
	return recordData
}

func flattenProperties(recordData map[string]interface{}) {
	props, ok := recordData["properties"]
	if !ok {
		return
	}
	var propsMap map[string]interface{}
	switch typed := props.(type) {
	case map[string]interface{}:
		propsMap = typed
	case string:
		if err := json.Unmarshal([]byte(typed), &propsMap); err != nil {
			delete(recordData, "properties")
			return
		}
	case []byte:
		if err := json.Unmarshal(typed, &propsMap); err != nil {
			delete(recordData, "properties")
			return
		}
	default:
		delete(recordData, "properties")
		return
	}
	for key, value := range propsMap {
		if key == "id" {
			continue
		}
		recordData[key] = value
	}
	delete(recordData, "properties")
}

func applyInstanceAliases(recordData map[string]interface{}) {
	if isBound, ok := recordData["isBound"]; ok {
		recordData["binded"] = isBound
		delete(recordData, "isBound")
	}
	if colorCode, ok := recordData["colorCode"]; ok {
		if safeInterfaceToInt(colorCode) > 0 || safeInterfaceToInt(recordData["color"]) <= 0 {
			recordData["color"] = colorCode
		} else if _, hasColorCode := recordData["colorCode"]; hasColorCode {
			recordData["colorCode"] = recordData["color"]
		}
	}
	if starLv, ok := recordData["starLv"]; ok {
		recordData["upgradeNum"] = starLv
	} else if enchantLv, ok := recordData["enchantLv"]; ok {
		recordData["upgradeNum"] = enchantLv
	}
	if _, ok := recordData["f"]; !ok {
		recordData["f"] = "{}"
	}
}

func applyEquipmentDisplayFields(recordData map[string]interface{}, templateData map[string]interface{}) {
	appitem.ApplyEquipmentDisplayContract(recordData, templateData)
}

func loadTemplateRecordData(rpcCtx context.Context, repo gamedatastore.Repository, tableType int, recordData map[string]interface{}) map[string]interface{} {
	templateID := safeInterfaceToInt(recordData["templateId"])
	if templateID <= 0 {
		templateID = safeInterfaceToInt(recordData["tplId"])
	}
	if templateID <= 0 {
		templateID = safeInterfaceToInt(recordData["tid"])
	}
	if templateID <= 0 {
		templateID = safeInterfaceToInt(recordData["giid"])
	}
	if templateID <= 0 {
		templateID = safeInterfaceToInt(recordData["itemId"])
	}
	if templateID <= 0 {
		return nil
	}

	templateTableID := 29
	if tableType == 18 {
		templateTableID = 19
	}
	templateTableName, ok := models.TableIDToName[templateTableID]
	if !ok {
		return nil
	}

	templateJSON, err := repo.GetByTableAndID(rpcCtx, templateTableName, templateID)
	if err != nil || templateJSON == nil {
		return nil
	}

	templateData, err := normalizeJSONRecord(templateJSON)
	if err != nil {
		return nil
	}
	return templateData
}

func enrichInstanceRecordData(rpcCtx context.Context, repo gamedatastore.Repository, tableType int, recordData map[string]interface{}, includeSID bool) {
	if !isInstanceTable(tableType) {
		return
	}

	flattenProperties(recordData)
	applyInstanceAliases(recordData)

	templateData := loadTemplateRecordData(rpcCtx, repo, tableType, recordData)
	if tableType == 18 {
		applyEquipmentDisplayFields(recordData, templateData)
	}

	if templateData != nil {
		if tVal, ok := templateData["t"]; ok {
			recordData["t"] = tVal
		}
	}
	if _, ok := recordData["t"]; !ok {
		recordData["t"] = -1
	}

	if !includeSID {
		return
	}

	slotType, slotTypeOK := recordData["slotType"].(float64)
	slotIndex, slotIndexOK := recordData["slotIndex"].(float64)
	if slotTypeOK && slotIndexOK {
		recordData["sid"] = calculateSID(int(slotType), int(slotIndex))
	}
}
