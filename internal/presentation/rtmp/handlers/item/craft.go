// Open-sourced by BaoLT

// Crafting and material mixing handlers for equipment creation and material upgrading.
package item

import (
	"math/rand"
	"strconv"
	"strings"

	domainitem "mcgame-server/internal/domain/item"
	gamedatamodels "mcgame-server/internal/gamedata/models"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func selectCraftResultTier(plans []interface {
	GetRate() float64
	GetTier() int
}, roll float64) (int, bool, bool) {
	hasPlans := len(plans) > 0

	if !hasPlans {
		return 0, true, false
	}

	previewRates, ok := craftPreviewRatesFromPlanAdapters(plans)
	if !ok {
		return 0, false, true
	}

	previewIndex, success, _ := selectCraftPreviewIndexWithFailure(previewRates, roll)
	if !success {
		return 0, false, true
	}

	return craftResultColorCodeFromPreviewIndex(previewIndex), true, true
}

type recipePlanRollAdapter struct {
	rate float64
	tier int
}

type craftMaterialRef struct {
	idx         int64
	tempBagFlag bool
}

type craftRequirement struct {
	slot        int
	templateID  int
	requiredNum int
}

type craftMaterialSelection struct {
	requirement craftRequirement
	item        *domainitem.Item
}

type craftPreviewRates [4]int

func craftResultShouldBind(selections []craftMaterialSelection) bool {
	for _, selection := range selections {
		if selection.item != nil && selection.item.IsBound {
			return true
		}
	}

	return false
}

func (p recipePlanRollAdapter) GetRate() float64 {
	return p.rate
}

func (p recipePlanRollAdapter) GetTier() int {
	return p.tier
}

func recipePlansForRoll(plans []*gamedatamodels.RecipePlanTemplate) []interface {
	GetRate() float64
	GetTier() int
} {
	adapted := make([]interface {
		GetRate() float64
		GetTier() int
	}, 0, len(plans))
	for _, plan := range plans {
		if plan == nil {
			continue
		}
		adapted = append(adapted, recipePlanRollAdapter{
			rate: plan.Rate,
			tier: int(plan.St),
		})
	}
	return adapted
}

func craftPreviewRatesForMaterialLevel(level int) (craftPreviewRates, bool) {
	switch level {
	case 2:
		return craftPreviewRates{100, 0, 0, 0}, true
	case 3:
		return craftPreviewRates{0, 100, 0, 0}, true
	case 4:
		return craftPreviewRates{0, 0, 100, 0}, true
	case 5:
		return craftPreviewRates{0, 0, 95, 5}, true
	case 6:
		return craftPreviewRates{0, 0, 0, 100}, true
	default:
		return craftPreviewRates{}, false
	}
}

func normalizeCraftPreviewRates(weighted craftPreviewRates, divisor int) craftPreviewRates {
	if divisor <= 0 {
		return craftPreviewRates{}
	}

	normalized := craftPreviewRates{}
	remainders := craftPreviewRates{}
	total := 0
	for idx, rate := range weighted {
		normalized[idx] = rate / divisor
		remainders[idx] = rate % divisor
		total += normalized[idx]
	}

	for total < 100 {
		bestIdx := -1
		bestRemainder := -1
		bestWeight := -1
		for idx, remainder := range remainders {
			if remainder < 0 {
				continue
			}
			if remainder > bestRemainder || (remainder == bestRemainder && weighted[idx] > bestWeight) {
				bestIdx = idx
				bestRemainder = remainder
				bestWeight = weighted[idx]
			}
		}
		if bestIdx < 0 || bestRemainder <= 0 {
			break
		}
		normalized[bestIdx]++
		remainders[bestIdx] = -1
		total++
	}

	return normalized
}

func craftPreviewRatesToDTO(rates craftPreviewRates) map[string]interface{} {
	return map[string]interface{}{
		"makePer1": rates[0],
		"makePer2": rates[1],
		"makePer3": rates[2],
		"makePer4": rates[3],
	}
}

func craftPreviewRatesFromPlanAdapters(plans []interface {
	GetRate() float64
	GetTier() int
}) (craftPreviewRates, bool) {
	rates := craftPreviewRates{}
	hasRates := false

	for _, plan := range plans {
		resultColorCode := normalizeCraftPlanResultColorCode(plan.GetTier())
		previewIndex := craftPreviewIndexFromResultColorCode(resultColorCode)
		if previewIndex <= 0 {
			continue
		}

		rate := int(plan.GetRate())
		if rate <= 0 {
			continue
		}

		rates[previewIndex-1] += rate
		hasRates = true
	}

	return rates, hasRates
}

func craftPreviewRatesFromRecipePlans(plans []*gamedatamodels.RecipePlanTemplate) (craftPreviewRates, bool) {
	rates := craftPreviewRates{}
	hasRates := false

	for _, plan := range plans {
		if plan == nil {
			continue
		}

		resultColorCode := normalizeCraftPlanResultColorCode(int(plan.St))
		previewIndex := craftPreviewIndexFromResultColorCode(resultColorCode)
		if previewIndex <= 0 {
			continue
		}

		rate := int(plan.Rate)
		if rate <= 0 {
			continue
		}

		rates[previewIndex-1] += rate
		hasRates = true
	}

	return rates, hasRates
}

func craftPreviewIndexFromResultColorCode(colorCode int) int {
	colorCode = domainitem.NormalizeEquipmentColorCode(colorCode)
	if colorCode < 2 || colorCode > 5 {
		return 0
	}

	return colorCode - 1
}

func craftResultColorCodeFromPreviewIndex(index int) int {
	if index < 1 || index > 4 {
		return 0
	}

	return index + 1
}

func normalizeCraftPlanResultColorCode(tier int) int {
	if tier >= 2 && tier <= 5 {
		return tier
	}
	if tier == 1 {
		return 2
	}

	return 0
}

func selectCraftPreviewIndex(rates craftPreviewRates, roll float64) int {
	if roll < 0 {
		roll = 0
	}
	if roll >= 1 {
		roll = 0.999999999999
	}

	position := roll * 100
	for idx, rate := range rates {
		if rate <= 0 {
			continue
		}
		if position < float64(rate) {
			return idx + 1
		}
		position -= float64(rate)
	}

	for idx := len(rates) - 1; idx >= 0; idx-- {
		if rates[idx] > 0 {
			return idx + 1
		}
	}

	return 0
}

func selectCraftPreviewIndexWithFailure(rates craftPreviewRates, roll float64) (int, bool, bool) {
	totalRate := 0
	for _, rate := range rates {
		if rate > 0 {
			totalRate += rate
		}
	}

	if totalRate <= 0 {
		return 0, false, false
	}

	if roll < 0 {
		roll = 0
	}
	if roll >= 1 {
		roll = 0.999999999999
	}

	selectionPool := totalRate
	if selectionPool < 100 {
		selectionPool = 100
	}

	position := roll * float64(selectionPool)
	if failureWeight := selectionPool - totalRate; failureWeight > 0 {
		if position < float64(failureWeight) {
			return 0, false, true
		}
		position -= float64(failureWeight)
	}

	for idx, rate := range rates {
		if rate <= 0 {
			continue
		}
		if position < float64(rate) {
			return idx + 1, true, true
		}
		position -= float64(rate)
	}

	for idx := len(rates) - 1; idx >= 0; idx-- {
		if rates[idx] > 0 {
			return idx + 1, true, true
		}
	}

	return 0, false, true
}

func highestCraftPreviewIndex(rates craftPreviewRates) int {
	for idx := len(rates) - 1; idx >= 0; idx-- {
		if rates[idx] > 0 {
			return idx + 1
		}
	}

	return 0
}

func craftPrefixTypeForPreviewSelection(selectedPreviewIndex int, rates craftPreviewRates, roll float64) int {
	if selectedPreviewIndex < 1 || selectedPreviewIndex > len(rates) {
		return 0
	}

	highestPreviewIndex := highestCraftPreviewIndex(rates)
	if highestPreviewIndex == 0 {
		return 0
	}

	if selectedPreviewIndex != highestPreviewIndex {
		return 5
	}

	if roll < 0 {
		roll = 0
	}
	if roll >= 1 {
		roll = 0.999999999999
	}

	return int(roll*5) + 1
}

func craftQualityFromPreviewIndexAndPrefix(previewIndex int, prefixType int) int {
	if previewIndex < 1 || previewIndex > 4 {
		return 0
	}
	if prefixType < 1 || prefixType > 5 {
		return 0
	}

	return (previewIndex * 5) + prefixType
}

func craftQualityFromPreviewSelection(selectedPreviewIndex int, rates craftPreviewRates, roll float64) int {
	prefixType := craftPrefixTypeForPreviewSelection(selectedPreviewIndex, rates, roll)
	if prefixType <= 0 {
		return 0
	}

	return craftQualityFromPreviewIndexAndPrefix(selectedPreviewIndex, prefixType)
}

func craftEquipmentLevel(equipTemplate *gamedatamodels.EquiptTemplateTemplate) int {
	if equipTemplate == nil {
		return 0
	}

	if level := int(equipTemplate.ReqLevel); level > 0 {
		return level
	}

	if level := int(equipTemplate.ItemLevel); level > 0 {
		return level
	}

	return 0
}

func defaultCraftPreviewTier(equipTemplate *gamedatamodels.EquiptTemplateTemplate) int {
	if equipTemplate == nil {
		return 1
	}

	tier := domainitem.NormalizeEquipmentColorCode(int(equipTemplate.ColorCode))
	if tier > 0 {
		return tier
	}

	tier = domainitem.NormalizeEquipmentColorCode(int(equipTemplate.Color))
	if tier > 0 {
		return tier
	}

	return 1
}

func craftDisplayInt(value interface{}) int {
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

func craftMaterialTier(it *domainitem.Item) int {
	if it == nil {
		return 0
	}

	tier := domainitem.NormalizeEquipmentColorCode(it.ColorCode)
	if tier > 0 {
		return tier
	}

	if it.Properties == nil {
		return 0
	}

	tier = domainitem.NormalizeEquipmentColorCode(craftDisplayInt(it.Properties["color"]))
	if tier > 0 {
		return tier
	}

	quality := craftDisplayInt(it.Properties["q"])
	if quality <= 0 {
		quality = craftDisplayInt(it.Properties["quality"])
	}

	return domainitem.EquipmentColorCodeFromQuality(quality)
}

func craftMaterialLevel(gameData interface {
	GetItem(id int) *gamedatamodels.ItemTemplateTemplate
}, it *domainitem.Item) int {
	if it == nil {
		return 0
	}

	if it.Properties != nil {
		if level := craftDisplayInt(it.Properties["level"]); level > 0 {
			return level
		}
		if level := craftDisplayInt(it.Properties["itemLevel"]); level > 0 {
			return level
		}
	}

	if gameData != nil {
		template := gameData.GetItem(it.TemplateID)
		if template != nil {
			if level := int(template.Level); level > 0 {
				return level
			}

			if level := int(template.ItemLevel); level > 0 {
				return level
			}

			if level := craftMaterialLevelFromColorCode(int(template.ColorCode)); level > 0 {
				return level
			}

			if level := craftMaterialLevelFromColorCode(int(template.Color)); level > 0 {
				return level
			}
		}
	}

	if level := craftMaterialLevelFromColorCode(it.ColorCode); level > 0 {
		return level
	}

	if it.Properties != nil {
		if level := craftMaterialLevelFromColorCode(craftDisplayInt(it.Properties["color"])); level > 0 {
			return level
		}
		if level := craftMaterialLevelFromColorCode(craftDisplayInt(it.Properties["colorCode"])); level > 0 {
			return level
		}
	}

	return 0
}

func craftMaterialLevelFromColorCode(colorCode int) int {
	colorCode = domainitem.NormalizeEquipmentColorCode(colorCode)
	if colorCode <= 0 {
		return 0
	}

	return colorCode + 1
}

func resolveCustomCraftPreviewRates(gameData interface {
	GetItem(id int) *gamedatamodels.ItemTemplateTemplate
}, selections []craftMaterialSelection, equipTemplate *gamedatamodels.EquiptTemplateTemplate) (craftPreviewRates, bool, bool) {
	if len(selections) == 0 {
		return craftPreviewRates{}, false, false
	}

	equipmentLevel := craftEquipmentLevel(equipTemplate)
	lowestLevel := 0
	for _, selection := range selections {
		level := craftMaterialLevel(gameData, selection.item)
		_, ok := craftPreviewRatesForMaterialLevel(level)
		if !ok {
			return craftPreviewRates{}, false, false
		}
		if level >= 6 && equipmentLevel > 0 && equipmentLevel < 60 {
			return craftPreviewRates{}, false, true
		}
		if lowestLevel == 0 || level < lowestLevel {
			lowestLevel = level
		}
	}

	if lowestLevel == 0 {
		return craftPreviewRates{}, false, false
	}

	rates, ok := craftPreviewRatesForMaterialLevel(lowestLevel)
	if !ok {
		return craftPreviewRates{}, false, false
	}

	return rates, true, false
}

func fallbackCraftTier(selections []craftMaterialSelection, equipTemplate *gamedatamodels.EquiptTemplateTemplate) int {
	if len(selections) == 0 {
		return defaultCraftPreviewTier(equipTemplate)
	}

	materialTier := 0
	for _, selection := range selections {
		tier := craftMaterialTier(selection.item)
		if tier <= 0 {
			return defaultCraftPreviewTier(equipTemplate)
		}
		if materialTier == 0 || tier < materialTier {
			materialTier = tier
		}
	}

	if materialTier > 0 {
		return materialTier
	}

	return defaultCraftPreviewTier(equipTemplate)
}

func parseCraftMaterialRefs(materials map[string]interface{}) map[int]craftMaterialRef {
	refs := make(map[int]craftMaterialRef)
	for slot := 1; slot <= 3; slot++ {
		key := strconv.Itoa(slot)
		matData, exists := materials[key]
		if !exists {
			continue
		}
		matMap, ok := matData.(map[string]interface{})
		if !ok {
			continue
		}
		idx, ok := matMap["idx"].(float64)
		if !ok {
			continue
		}
		ref := craftMaterialRef{idx: int64(idx)}
		if v, ok := matMap["tempBagFlag"].(bool); ok {
			ref.tempBagFlag = v
		}
		refs[slot] = ref
	}
	return refs
}

func buildCraftRequirements(equipTemplate *gamedatamodels.EquiptTemplateTemplate) []craftRequirement {
	if equipTemplate == nil {
		return nil
	}

	all := []craftRequirement{
		{slot: 1, templateID: int(equipTemplate.RequireItem1), requiredNum: int(equipTemplate.RequireNum1)},
		{slot: 2, templateID: int(equipTemplate.RequireItem2), requiredNum: int(equipTemplate.RequireNum2)},
		{slot: 3, templateID: int(equipTemplate.RequireItem3), requiredNum: int(equipTemplate.RequireNum3)},
	}

	requirements := make([]craftRequirement, 0, len(all))
	for _, requirement := range all {
		if requirement.templateID == 0 || requirement.requiredNum == 0 {
			continue
		}
		requirements = append(requirements, requirement)
	}
	return requirements
}

func (h *Handler) getCraftMaterialItem(ctx *rtmp.RPCContext, characterID int64, ref craftMaterialRef) (*domainitem.Item, error) {
	if ref.tempBagFlag {
		return h.itemService.GetItemInSlot(ctx.Context, characterID, domainitem.SlotTypeTempBag, int(ref.idx))
	}
	return h.itemService.GetItemByID(ctx.Context, characterID, ref.idx)
}

func (h *Handler) resolveCraftMaterials(ctx *rtmp.RPCContext, characterID int64, materials map[string]interface{}, equipTemplate *gamedatamodels.EquiptTemplateTemplate, logPrefix string) ([]craftMaterialSelection, bool) {
	refs := parseCraftMaterialRefs(materials)
	if len(refs) == 0 {
		return nil, false
	}

	requirements := buildCraftRequirements(equipTemplate)
	selections := make([]craftMaterialSelection, 0, len(requirements))
	for _, requirement := range requirements {
		ref, ok := refs[requirement.slot]
		if !ok {
			h.logger.Warn(logPrefix+": missing required material slot",
				zap.Int64("char_id", characterID),
				zap.Int("material_slot", requirement.slot),
				zap.Int("required_template_id", requirement.templateID),
				zap.Int("required_num", requirement.requiredNum))
			return nil, false
		}

		it, err := h.getCraftMaterialItem(ctx, characterID, ref)
		if err != nil || it == nil {
			h.logger.Warn(logPrefix+": material not found",
				zap.Int64("char_id", characterID),
				zap.Int("material_slot", requirement.slot),
				zap.Int64("material_ref", ref.idx),
				zap.Bool("temp_bag", ref.tempBagFlag))
			return nil, false
		}

		if it.TemplateID != requirement.templateID {
			h.logger.Warn(logPrefix+": material template mismatch",
				zap.Int64("char_id", characterID),
				zap.Int("material_slot", requirement.slot),
				zap.Int("required_template_id", requirement.templateID),
				zap.Int("actual_template_id", it.TemplateID))
			return nil, false
		}

		if it.StackCount < requirement.requiredNum {
			h.logger.Warn(logPrefix+": insufficient material stack",
				zap.Int64("char_id", characterID),
				zap.Int("material_slot", requirement.slot),
				zap.Int("required_template_id", requirement.templateID),
				zap.Int("required_num", requirement.requiredNum),
				zap.Int("actual_num", it.StackCount))
			return nil, false
		}

		selections = append(selections, craftMaterialSelection{
			requirement: requirement,
			item:        it,
		})
	}

	return selections, true
}

func (h *Handler) canCreateCraftEquipmentResult(ctx *rtmp.RPCContext, characterID int64, selections []craftMaterialSelection) bool {
	inventory, err := h.itemService.GetInventory(ctx.Context, characterID)
	if err != nil {
		h.logger.Error("NewMake: failed to load bag inventory for result capacity check",
			zap.Int64("char_id", characterID),
			zap.Error(err))
		return false
	}

	occupied := make(map[int]struct{}, len(inventory))
	for _, it := range inventory {
		if it.SlotIndex < 0 || it.SlotIndex >= domainitem.DefaultBagSlots {
			continue
		}
		occupied[it.SlotIndex] = struct{}{}
	}

	for _, selection := range selections {
		if selection.item == nil || selection.item.SlotType != domainitem.SlotTypeBag {
			continue
		}
		if selection.item.StackCount != selection.requirement.requiredNum {
			continue
		}
		delete(occupied, selection.item.SlotIndex)
	}

	return len(occupied) < domainitem.DefaultBagSlots
}

func (h *Handler) NewMake(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	materials, ok1 := args[0].(map[string]interface{})
	recipeID, ok2 := parseFlexibleInt64(args[1])
	if !ok1 || !ok2 {
		h.logger.Warn("NewMake: invalid args", zap.Any("args", args))
		return nil, pkgerrors.ErrInvalidArgs
	}

	if len(parseCraftMaterialRefs(materials)) == 0 {
		return map[string]interface{}{"flag": false}, nil
	}

	equipTemplate := h.gameData.GetEquipment(int(recipeID))
	if equipTemplate == nil {
		h.logger.Warn("NewMake: equipment template not found",
			zap.Int("recipe_id", int(recipeID)))
		return map[string]interface{}{"flag": false}, nil
	}

	selections, ok := h.resolveCraftMaterials(ctx, characterID, materials, equipTemplate, "NewMake")
	if !ok {
		return map[string]interface{}{"flag": false}, nil
	}

	customRates, useCustomRates, blockedByLevel := resolveCustomCraftPreviewRates(h.gameData, selections, equipTemplate)
	if blockedByLevel {
		h.logger.Warn("NewMake: level 6 materials require equipment level 60 or higher",
			zap.Int64("char_id", characterID),
			zap.Int("recipe_id", int(recipeID)),
			zap.Int("equipment_level", craftEquipmentLevel(equipTemplate)))
		return map[string]interface{}{"flag": false}, nil
	}

	var recipePlans []*gamedatamodels.RecipePlanTemplate
	previewRates := craftPreviewRates{}
	selectedPreviewIndex := 0
	resultTier := 0
	success := false
	hasRecipePlans := false
	if useCustomRates {
		previewRates = customRates
		selectedPreviewIndex, success, _ = selectCraftPreviewIndexWithFailure(previewRates, rand.Float64())
	}

	if h.gameData != nil {
		recipePlans = h.gameData.GetRecipePlansByRecipeID(int(recipeID))
	}
	if !useCustomRates {
		hasRecipePlans = len(recipePlans) > 0
		if hasRecipePlans {
			var hasRates bool
			previewRates, hasRates = craftPreviewRatesFromRecipePlans(recipePlans)
			if hasRates {
				selectedPreviewIndex, success, _ = selectCraftPreviewIndexWithFailure(previewRates, rand.Float64())
			}
		} else {
			selectedPreviewIndex = craftPreviewIndexFromResultColorCode(fallbackCraftTier(selections, equipTemplate))
			if selectedPreviewIndex <= 0 {
				selectedPreviewIndex = 1
			}
			previewRates[selectedPreviewIndex-1] = 100
			success = true
		}
	}

	if success {
		resultTier = craftResultColorCodeFromPreviewIndex(selectedPreviewIndex)
	}

	if success && !h.canCreateCraftEquipmentResult(ctx, characterID, selections) {
		h.logger.Warn("NewMake: no free bag slot for crafted result",
			zap.Int64("char_id", characterID),
			zap.Int("recipe_id", int(recipeID)))
		return map[string]interface{}{"flag": false}, nil
	}

	for _, selection := range selections {
		remaining := selection.item.StackCount - selection.requirement.requiredNum
		if remaining < 0 {
			h.logger.Warn("NewMake: insufficient stack count",
				zap.Int64("char_id", characterID),
				zap.Int64("material_id", selection.item.ID),
				zap.Int("stack_count", selection.item.StackCount),
				zap.Int("required_num", selection.requirement.requiredNum))
			return map[string]interface{}{"flag": false}, nil
		}

		if remaining == 0 {
			_, err = h.itemService.DropItem(ctx.Context, characterID, selection.item.ID)
			if err != nil {
				h.logger.Error("NewMake: failed to consume material",
					zap.Int64("char_id", characterID),
					zap.Int64("material_id", selection.item.ID),
					zap.Error(err))
				return map[string]interface{}{"flag": false}, nil
			}

			matSID := selection.item.CalculateSID()
			ctx.Connection.SendCallback("onDelCharactorSlot", float64(selection.item.ID), matSID)
			continue
		}

		selection.item.StackCount = remaining
		if err := h.itemService.UpdateStack(ctx.Context, selection.item.ID, remaining); err != nil {
			h.logger.Error("NewMake: failed to update material stack",
				zap.Int64("char_id", characterID),
				zap.Int64("material_id", selection.item.ID),
				zap.Int("remaining", remaining),
				zap.Error(err))
			return map[string]interface{}{"flag": false}, nil
		}

		ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(selection.item))
	}

	if !success {
		h.logger.Info("Item crafting failed",
			zap.Int64("char_id", characterID),
			zap.Int("recipe_id", int(recipeID)),
			zap.Int("result_tier", resultTier),
			zap.Bool("has_recipe_plans", hasRecipePlans))
		return map[string]interface{}{"flag": false}, nil
	}

	var resultItem *domainitem.Item
	resultShouldBind := craftResultShouldBind(selections)
	if resultTier > 0 {
		resultItem, err = h.itemService.AddItemWithBindAndColor(ctx.Context, characterID, int(recipeID), domainitem.ItemTypeEquipment, 1, resultShouldBind, resultTier)
	} else {
		resultItem, err = h.itemService.AddItemWithBind(ctx.Context, characterID, int(recipeID), domainitem.ItemTypeEquipment, 1, resultShouldBind)
	}
	if err != nil {
		h.logger.Error("NewMake: failed to create result item",
			zap.Int64("char_id", characterID),
			zap.Int("recipe_id", int(recipeID)),
			zap.Error(err))
		return map[string]interface{}{"flag": false}, nil
	}

	if selectedPreviewIndex > 0 {
		craftedQuality := craftQualityFromPreviewSelection(selectedPreviewIndex, previewRates, rand.Float64())
		updatedResultItem, updateErr := h.itemService.UpdateCraftedEquipmentQuality(ctx.Context, resultItem.ID, craftedQuality)
		if updateErr != nil {
			h.logger.Warn("NewMake: failed to persist crafted equipment quality",
				zap.Int64("char_id", characterID),
				zap.Int64("item_id", resultItem.ID),
				zap.Int("recipe_id", int(recipeID)),
				zap.Int("result_tier", resultTier),
				zap.Int("preview_index", selectedPreviewIndex),
				zap.Int("quality", craftedQuality),
				zap.Error(updateErr))
		} else {
			resultItem = updatedResultItem
		}
	}

	updatedResultItem, updateErr := h.itemService.AssignRandomEquipmentElement(ctx.Context, resultItem.ID)
	if updateErr != nil {
		h.logger.Warn("NewMake: failed to assign crafted equipment element",
			zap.Int64("char_id", characterID),
			zap.Int64("item_id", resultItem.ID),
			zap.Int("recipe_id", int(recipeID)),
			zap.Error(updateErr))
	} else {
		resultItem = updatedResultItem
	}

	crafterName := ""
	if h.charService != nil {
		char, charErr := h.charService.GetByID(ctx.Context, characterID)
		if charErr != nil {
			h.logger.Warn("NewMake: failed to load character for crafted maker",
				zap.Int64("char_id", characterID),
				zap.Int64("item_id", resultItem.ID),
				zap.Error(charErr))
		} else if char != nil && char.Name != "" {
			crafterName = char.Name
			updatedResultItem, makerErr := h.itemService.UpdateEquipmentMaker(ctx.Context, resultItem.ID, char.Name)
			if makerErr != nil {
				h.logger.Warn("NewMake: failed to persist crafted equipment maker",
					zap.Int64("char_id", characterID),
					zap.Int64("item_id", resultItem.ID),
					zap.String("maker", char.Name),
					zap.Error(makerErr))
			} else {
				resultItem = updatedResultItem
			}
		}
	}

	ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(resultItem))
	h.broadcastOrangeEquipmentNotice(crafterName, resultItem)

	h.logger.Info("Item crafted successfully",
		zap.Int64("char_id", characterID),
		zap.Int("recipe_id", int(recipeID)),
		zap.Int64("result_item_id", resultItem.ID),
		zap.Bool("result_bound", resultShouldBind),
		zap.Int("preview_index", selectedPreviewIndex),
		zap.Int("result_tier", resultTier),
		zap.Bool("has_recipe_plans", hasRecipePlans))

	h.checkBagCapacityWarning(ctx, characterID)

	return map[string]interface{}{"flag": true}, nil
}

func (h *Handler) GetMakeColor(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	materials, ok1 := args[0].(map[string]interface{})
	recipeID, ok2 := parseFlexibleInt64(args[1])
	if !ok1 || !ok2 {
		h.logger.Warn("GetMakeColor: invalid args", zap.Any("args", args))
		return nil, pkgerrors.ErrInvalidArgs
	}

	if len(parseCraftMaterialRefs(materials)) == 0 {
		return map[string]interface{}{"canMake": false, "flag": 0}, nil
	}

	equipTemplate := h.gameData.GetEquipment(int(recipeID))
	if equipTemplate == nil {
		h.logger.Warn("GetMakeColor: equipment template not found",
			zap.Int("recipe_id", int(recipeID)))
		return map[string]interface{}{"canMake": false, "flag": 1}, nil
	}

	selections, ok := h.resolveCraftMaterials(ctx, characterID, materials, equipTemplate, "GetMakeColor")
	if !ok {
		return map[string]interface{}{"canMake": false, "flag": 1}, nil
	}

	customRates, useCustomRates, blockedByLevel := resolveCustomCraftPreviewRates(h.gameData, selections, equipTemplate)
	if blockedByLevel {
		h.logger.Warn("GetMakeColor: level 6 materials require equipment level 60 or higher",
			zap.Int64("char_id", characterID),
			zap.Int("recipe_id", int(recipeID)),
			zap.Int("equipment_level", craftEquipmentLevel(equipTemplate)))
		return map[string]interface{}{"canMake": false, "flag": 1}, nil
	}
	if useCustomRates {
		return map[string]interface{}{
			"canMake":      true,
			"colorPerList": craftPreviewRatesToDTO(customRates),
			"flag":         0,
		}, nil
	}

	plans := h.gameData.GetRecipePlansByRecipeID(int(recipeID))
	previewRates, hasPlanRates := craftPreviewRatesFromRecipePlans(plans)
	if len(plans) == 0 || !hasPlanRates {
		previewIndex := craftPreviewIndexFromResultColorCode(fallbackCraftTier(selections, equipTemplate))
		if previewIndex <= 0 {
			previewIndex = 1
		}
		previewRates = craftPreviewRates{}
		previewRates[previewIndex-1] = 100
	}

	return map[string]interface{}{
		"canMake":      true,
		"colorPerList": craftPreviewRatesToDTO(previewRates),
		"flag":         0,
	}, nil
}
