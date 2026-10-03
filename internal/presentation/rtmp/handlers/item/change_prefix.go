// Open-sourced by BaoLT

// Equipment quality change handlers preserve the Flash changePrefix preview and confirm flow.
package item

import (
	"math/rand"
	"strconv"
	"time"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	gamedatamodels "mcgame-server/internal/gamedata/models"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const changePrefixMoneyFactor int64 = 10

var changePrefixPrefixWeights = [...]int{22, 22, 22, 22, 12}

type changePrefixRequest struct {
	equipmentID int64
	materials   [3]craftMaterialRef
}

type pendingChangePrefix struct {
	request   changePrefixRequest
	quality   int
	element   int
	starLevel int
}

type changePrefixSelection struct {
	item          *domainitem.Item
	requiredCount int
	reference     craftMaterialRef
}

type changePrefixResolved struct {
	equipment         *domainitem.Item
	equipmentTemplate *gamedatamodels.EquiptTemplateTemplate
	selections        []changePrefixSelection
	materialLevel     int
	currentQuality    int
	currentColorCode  int
	currentPrefixType int
	cost              int64
}

type changePrefixSelectionKey struct {
	itemID      int64
	tempBagFlag bool
}

func parseFlexibleBool(arg interface{}) (bool, bool) {
	switch v := arg.(type) {
	case bool:
		return v, true
	case float64:
		return v != 0, true
	case float32:
		return v != 0, true
	case int:
		return v != 0, true
	case int8:
		return v != 0, true
	case int16:
		return v != 0, true
	case int32:
		return v != 0, true
	case int64:
		return v != 0, true
	case uint:
		return v != 0, true
	case uint8:
		return v != 0, true
	case uint16:
		return v != 0, true
	case uint32:
		return v != 0, true
	case uint64:
		return v != 0, true
	case string:
		if v == "true" || v == "1" {
			return true, true
		}
		if v == "false" || v == "0" {
			return false, true
		}
	}

	return false, false
}

func parseChangePrefixRequest(arg interface{}) (changePrefixRequest, bool) {
	requestMap, ok := arg.(map[string]interface{})
	if !ok {
		return changePrefixRequest{}, false
	}

	equipmentID, ok := parseFlexibleInt64(requestMap["e"])
	if !ok {
		return changePrefixRequest{}, false
	}

	request := changePrefixRequest{equipmentID: equipmentID}
	for slot := 1; slot <= len(request.materials); slot++ {
		entry, ok := requestMap["i"+strconv.Itoa(slot)].(map[string]interface{})
		if !ok {
			return changePrefixRequest{}, false
		}

		idx, ok := parseFlexibleInt64(entry["idx"])
		if !ok {
			return changePrefixRequest{}, false
		}

		flag, ok := parseFlexibleBool(entry["flag"])
		if !ok {
			flag, ok = parseFlexibleBool(entry["tempBagFlag"])
			if !ok {
				return changePrefixRequest{}, false
			}
		}

		request.materials[slot-1] = craftMaterialRef{idx: idx, tempBagFlag: flag}
	}

	return request, true
}

func changePrefixCost(equipTemplate *gamedatamodels.EquiptTemplateTemplate) int64 {
	if equipTemplate == nil {
		return 0
	}

	reqLevel := int(equipTemplate.ReqLevel)
	if reqLevel <= 0 {
		reqLevel = int(equipTemplate.ItemLevel)
	}
	if reqLevel <= 0 {
		reqLevel = 1
	}

	return int64(reqLevel*reqLevel) * changePrefixMoneyFactor
}

func (h *Handler) getPendingChangePrefix(characterID int64) (*pendingChangePrefix, bool) {
	h.pendingPrefixChangesMu.Lock()
	defer h.pendingPrefixChangesMu.Unlock()

	pending, ok := h.pendingPrefixChanges[characterID]
	if !ok {
		return nil, false
	}

	copyPending := *pending
	return &copyPending, true
}

func (h *Handler) setPendingChangePrefix(characterID int64, pending *pendingChangePrefix) {
	h.pendingPrefixChangesMu.Lock()
	defer h.pendingPrefixChangesMu.Unlock()

	if pending == nil {
		delete(h.pendingPrefixChanges, characterID)
		return
	}

	copyPending := *pending
	h.pendingPrefixChanges[characterID] = &copyPending
}

func (h *Handler) clearPendingChangePrefix(characterID int64) {
	h.setPendingChangePrefix(characterID, nil)
}

func changePrefixSeededRNG(char *character.Character) *rand.Rand {
	seed := time.Now().UnixNano()
	if char != nil {
		seed ^= int64(char.PosX)*31 + int64(char.PosY)*97 + int64(char.MapID)*1009
	}
	return rand.New(rand.NewSource(seed))
}

func changePrefixRandomPrefixType(rng *rand.Rand) int {
	total := 0
	for _, w := range changePrefixPrefixWeights {
		total += w
	}
	roll := rng.Intn(total)
	cumulative := 0
	for idx, w := range changePrefixPrefixWeights {
		cumulative += w
		if roll < cumulative {
			return idx + 1
		}
	}
	return len(changePrefixPrefixWeights)
}

func changePrefixCurrentColorCode(it *domainitem.Item) int {
	if it == nil {
		return 0
	}

	if colorCode := domainitem.NormalizeEquipmentColorCode(it.ColorCode); colorCode > 0 {
		return colorCode
	}

	if it.Properties != nil {
		if quality := craftDisplayInt(it.Properties["q"]); quality > 0 {
			return domainitem.EquipmentColorCodeFromQuality(quality)
		}
		if quality := craftDisplayInt(it.Properties["quality"]); quality > 0 {
			return domainitem.EquipmentColorCodeFromQuality(quality)
		}
		if colorCode := domainitem.EquipmentColorCodeFromDisplayColor(craftDisplayInt(it.Properties["color"])); colorCode > 0 {
			return colorCode
		}
		if colorCode := domainitem.NormalizeEquipmentColorCode(craftDisplayInt(it.Properties["colorCode"])); colorCode > 0 {
			return colorCode
		}
	}

	return 0
}

func changePrefixCurrentQuality(it *domainitem.Item, colorCode int) int {
	if it == nil {
		return 0
	}

	if it.Properties != nil {
		if quality := craftDisplayInt(it.Properties["q"]); quality > 0 {
			return quality
		}
		if quality := craftDisplayInt(it.Properties["quality"]); quality > 0 {
			return quality
		}
	}

	prefixType := domainitem.ResolveEquipmentPrefixType(nil, colorCode)
	if it.Properties != nil {
		prefixType = domainitem.ResolveEquipmentPrefixType(it.Properties["preNameType"], colorCode)
	}
	if prefixType <= 0 {
		prefixType = 1
	}

	return ((colorCode - 1) * 5) + prefixType
}

func changePrefixPreviewQuality(rng *rand.Rand, currentQuality int, currentColorCode int, currentPrefixType int, materialLevel int) (int, int) {
	currentStarDelta := 0

	switch materialLevel {
	case 4:
		return ((4 - 1) * 5) + changePrefixRandomPrefixType(rng), -1
	case 5:
		if currentColorCode == 5 {
			return currentQuality, currentStarDelta
		}
		return 20, currentStarDelta
	case 6:
		if currentColorCode == 5 && currentPrefixType == 5 {
			return 25, currentStarDelta
		}
		return ((5 - 1) * 5) + changePrefixRandomPrefixType(rng), currentStarDelta
	default:
		return currentQuality, currentStarDelta
	}
}

func changePrefixPreviewElement(rng *rand.Rand) int {
	return rng.Intn(6) + 1
}

func cloneChangePrefixProperties(properties map[string]interface{}) map[string]interface{} {
	if len(properties) == 0 {
		return make(map[string]interface{})
	}

	cloned := make(map[string]interface{}, len(properties))
	for key, value := range properties {
		cloned[key] = value
	}
	return cloned
}

func buildChangePrefixPreviewItem(equipment *domainitem.Item, quality int, element int, starLevel int) *domainitem.Item {
	if equipment == nil {
		return nil
	}

	preview := *equipment
	preview.IsBound = true
	preview.Properties = cloneChangePrefixProperties(equipment.Properties)
	preview.ColorCode = domainitem.EquipmentColorCodeFromQuality(quality)
	preview.StarLevel = starLevel
	if preview.Properties == nil {
		preview.Properties = make(map[string]interface{})
	}
	preview.Properties["binded"] = "1"
	preview.Properties["q"] = quality
	preview.Properties["quality"] = quality
	preview.Properties["color"] = strconv.Itoa(domainitem.EquipmentDisplayColorFromColorCode(preview.ColorCode))
	preview.Properties["preNameType"] = domainitem.EquipmentPrefixTypeFromQuality(quality)
	preview.Properties["element"] = element
	preview.Properties["upgradeNum"] = starLevel

	return &preview
}

func (h *Handler) resolveChangePrefix(ctx *rtmp.RPCContext, characterID int64, request changePrefixRequest, logPrefix string) (*changePrefixResolved, bool) {
	equipment, err := h.itemService.GetItemByID(ctx.Context, characterID, request.equipmentID)
	if err != nil || equipment == nil || !equipment.IsEquipment() {
		h.logger.Warn(logPrefix+": equipment not found",
			zap.Int64("character_id", characterID),
			zap.Int64("equipment_id", request.equipmentID),
			zap.Error(err))
		return nil, false
	}

	equipmentTemplate := h.itemService.GetEquipmentTemplate(equipment.TemplateID)
	if equipmentTemplate == nil {
		return nil, false
	}

	currentColorCode := changePrefixCurrentColorCode(equipment)
	if currentColorCode < 4 {
		return nil, false
	}

	requirements := buildCraftRequirements(equipmentTemplate)
	if len(requirements) < 3 {
		return nil, false
	}

	resolved := &changePrefixResolved{
		equipment:         equipment,
		equipmentTemplate: equipmentTemplate,
		currentColorCode:  currentColorCode,
		currentQuality:    changePrefixCurrentQuality(equipment, currentColorCode),
		currentPrefixType: domainitem.ResolveEquipmentPrefixType(equipment.Properties["preNameType"], currentColorCode),
		cost:              changePrefixCost(equipmentTemplate),
	}

	selectionIndexByKey := make(map[changePrefixSelectionKey]int)
	for idx, requirement := range requirements[:3] {
		ref := request.materials[idx]
		if ref.idx <= 0 {
			return nil, false
		}

		material, err := h.getCraftMaterialItem(ctx, characterID, ref)
		if err != nil || material == nil {
			return nil, false
		}
		if material.TemplateID != requirement.templateID || material.StackCount < requirement.requiredNum {
			return nil, false
		}

		materialLevel := craftMaterialLevel(h.gameData, material)
		if materialLevel < 4 || materialLevel > 6 {
			return nil, false
		}
		if resolved.materialLevel == 0 {
			resolved.materialLevel = materialLevel
		} else if resolved.materialLevel != materialLevel {
			return nil, false
		}

		key := changePrefixSelectionKey{itemID: material.ID, tempBagFlag: ref.tempBagFlag}
		selectionIndex, exists := selectionIndexByKey[key]
		if !exists {
			selectionIndexByKey[key] = len(resolved.selections)
			resolved.selections = append(resolved.selections, changePrefixSelection{
				item:          material,
				requiredCount: requirement.requiredNum,
				reference:     ref,
			})
			continue
		}
		resolved.selections[selectionIndex].requiredCount += requirement.requiredNum
	}

	if resolved.materialLevel == 0 {
		return nil, false
	}
	if resolved.currentColorCode == 5 && resolved.materialLevel < 5 {
		return nil, false
	}

	return resolved, true
}

func (h *Handler) ChangePrefix(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	request, ok := parseChangePrefixRequest(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	resolved, ok := h.resolveChangePrefix(ctx, characterID, request, "ChangePrefix")
	if !ok {
		h.clearPendingChangePrefix(characterID)
		return map[string]interface{}{"f": false}, nil
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil || char == nil || !charHasMoney(char, resolved.cost) {
		h.clearPendingChangePrefix(characterID)
		return map[string]interface{}{"f": false}, nil
	}

	rng := changePrefixSeededRNG(char)
	previewQuality, starDelta := changePrefixPreviewQuality(rng, resolved.currentQuality, resolved.currentColorCode, resolved.currentPrefixType, resolved.materialLevel)
	previewStarLevel := resolved.equipment.StarLevel + starDelta
	if previewStarLevel < 0 {
		previewStarLevel = 0
	}
	previewElement := changePrefixPreviewElement(rng)
	previewItem := buildChangePrefixPreviewItem(resolved.equipment, previewQuality, previewElement, previewStarLevel)
	if previewItem == nil {
		return map[string]interface{}{"f": false}, nil
	}
	h.itemService.ApplyRandomizedEquipmentPropertyRolls(previewItem, resolved.equipmentTemplate, previewQuality)

	h.setPendingChangePrefix(characterID, &pendingChangePrefix{
		request:   request,
		quality:   previewQuality,
		element:   previewElement,
		starLevel: previewStarLevel,
	})

	h.logger.Info("ChangePrefix: generated preview",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int64("equipment_id", resolved.equipment.ID),
		zap.Int("material_level", resolved.materialLevel),
		zap.Int("preview_quality", previewQuality),
		zap.Int("preview_element", previewElement),
		zap.Int("preview_star_level", previewStarLevel))

	return map[string]interface{}{
		"f":         true,
		"equIns":    h.itemDTO(previewItem),
		"oldEquIns": h.itemDTO(resolved.equipment),
		"sid":       float64(resolved.equipment.CalculateSID()),
		"i":         float64(resolved.equipment.ID),
	}, nil
}

func (h *Handler) SureChangePrefix(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	decision, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	pending, ok := h.getPendingChangePrefix(characterID)
	if !ok {
		return map[string]interface{}{"f": false}, nil
	}

	if decision <= 0 {
		h.clearPendingChangePrefix(characterID)
		return map[string]interface{}{"f": false}, nil
	}

	resolved, ok := h.resolveChangePrefix(ctx, characterID, pending.request, "SureChangePrefix")
	if !ok {
		h.clearPendingChangePrefix(characterID)
		return map[string]interface{}{"f": false}, nil
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil || char == nil || !charHasMoney(char, resolved.cost) {
		h.clearPendingChangePrefix(characterID)
		return map[string]interface{}{"f": false}, nil
	}

	updatedEquipment, err := h.itemService.UpdateEquipmentQuality(ctx.Context, resolved.equipment.ID, pending.quality)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}
	updatedEquipment, err = h.itemService.UpdateEquipmentElement(ctx.Context, updatedEquipment.ID, pending.element)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}
	updatedEquipment, err = h.itemService.UpdateEquipmentStarLevel(ctx.Context, updatedEquipment.ID, pending.starLevel)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}
	if err := h.itemService.BindItem(ctx.Context, characterID, updatedEquipment.ID); err != nil {
		return rtmp.ErrorToResponse(err), nil
	}
	updatedEquipment, err = h.itemService.GetItemByID(ctx.Context, characterID, updatedEquipment.ID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	for _, selection := range resolved.selections {
		consumedItem, deleted, consumeErr := h.itemService.ConsumeItemStack(ctx.Context, characterID, selection.item.ID, selection.requiredCount)
		if consumeErr != nil {
			return rtmp.ErrorToResponse(consumeErr), nil
		}
		if deleted {
			ctx.Connection.SendCallback("onDelCharactorSlot", float64(consumedItem.ID), float64(consumedItem.CalculateSID()))
		} else {
			ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(consumedItem))
		}
	}

	charDeductMoney(char, resolved.cost)
	if err := h.charService.Update(ctx.Context, char); err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.clearPendingChangePrefix(characterID)

	ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(updatedEquipment))
	ctx.Connection.SendCallback("onUPP", charMoneyUpdatePayload(char))
	if updatedEquipment.IsEquipped() {
		if updatedChar, charErr := h.charService.GetByID(ctx.Context, characterID); charErr == nil && updatedChar != nil {
			h.itemService.ApplyCharacterElementState(ctx.Context, updatedChar)
			h.sendCharacterElementUpdate(ctx, updatedChar)
		}
	}
	h.broadcastOrangeEquipmentNotice(char.Name, updatedEquipment)

	h.logger.Info("SureChangePrefix: applied preview",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int64("equipment_id", updatedEquipment.ID),
		zap.Int("quality", pending.quality),
		zap.Int("element", pending.element),
		zap.Int("star_level", pending.starLevel),
		zap.Bool("is_bound", updatedEquipment.IsBound),
		zap.Int64("remaining_money", char.MoneyBind))

	return map[string]interface{}{
		"f": true,
		"e": float64(updatedEquipment.ID),
		"i": float64(updatedEquipment.ID),
		"n": h.itemDTO(updatedEquipment),
	}, nil
}
