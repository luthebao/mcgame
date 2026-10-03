// Open-sourced by BaoLT

package item

import (
	"errors"
	"math"
	"strconv"
	"strings"

	appskill "mcgame-server/internal/application/skill"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	amf0 "github.com/yutopp/go-amf0"
	"go.uber.org/zap"
)

const lifeSkillCraftMasteryGain = 20

type lifeSkillRequirement struct {
	slot        int
	templateID  int
	requiredNum int
}

type lifeSkillIngredientSelection struct {
	requirement lifeSkillRequirement
	itemID      int64
}

func (h *Handler) InitLearnedSkill(ctx *rtmp.RPCContext, _ []interface{}) (interface{}, error) {
	if h.skillService == nil {
		return []map[string]interface{}{}, nil
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	skills, err := h.skillService.GetSkillsForCallback(ctx.Context, characterID)
	if err != nil {
		h.logger.Warn("InitLearnedSkill: failed to load skills",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return []map[string]interface{}{}, nil
	}

	return skills, nil
}

func (h *Handler) NewCook(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	return h.craftLifeSkillRecipe(ctx, args, appskill.CookSkillType)
}

func (h *Handler) NewMedicine(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	return h.craftLifeSkillRecipe(ctx, args, appskill.MedicineSkillType)
}

func (h *Handler) craftLifeSkillRecipe(ctx *rtmp.RPCContext, args []interface{}, expectedSkillType int) (interface{}, error) {
	if h.skillService == nil || h.itemService == nil || h.gameData == nil {
		return nil, pkgerrors.ErrSystemError
	}
	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	ingredientIDs, err := parseLifeSkillIngredientIDs(args[0])
	if err != nil {
		return nil, pkgerrors.ErrInvalidArgs
	}

	recipeSkillID64, ok := parseFlexibleInt64(args[1])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	recipeTemplate, _, char, err := h.skillService.CanCraftRecipe(ctx.Context, characterID, int(recipeSkillID64), expectedSkillType)
	if err != nil {
		h.sendLifeSkillCraftError(ctx, err)
		return nil, nil
	}

	selections, err := h.buildLifeSkillSelections(ctx, characterID, recipeTemplate, ingredientIDs)
	if err != nil {
		h.sendLifeSkillCraftError(ctx, err)
		return nil, nil
	}

	consumedItems, err := h.consumeLifeSkillIngredients(ctx, characterID, selections)
	if err != nil {
		h.sendLifeSkillCraftError(ctx, err)
		return nil, nil
	}

	addedItems, err := h.addLifeSkillRewards(ctx, characterID, recipeTemplate, consumedItems)
	if err != nil {
		h.sendLifeSkillCraftError(ctx, err)
		return nil, nil
	}

	updatedChar, _, err := h.skillService.AddLifeSkillMastery(ctx.Context, characterID, expectedSkillType, lifeSkillCraftMasteryGain)
	if err != nil {
		h.sendLifeSkillCraftError(ctx, err)
		return nil, nil
	}

	for _, consumed := range consumedItems {
		h.sendLifeSkillConsumedItemCallback(ctx, characterID, consumed)
	}
	for _, added := range addedItems {
		if added != nil {
			_ = ctx.Connection.SendCallback("onAddCharactorSlot", added.ToDTO())
		}
	}

	if updatedChar == nil {
		updatedChar = char
	}
	if updatedChar != nil {
		rtmputils.SendLifeSkillStateUpdate(ctx, h.logger, h.skillService, updatedChar)
	}

	h.logger.Info("Life skill craft completed",
		zap.Int64("character_id", characterID),
		zap.Int("recipe_skill_id", int(recipeSkillID64)),
		zap.Int("skill_type", expectedSkillType))

	return true, nil
}

func (h *Handler) buildLifeSkillSelections(ctx *rtmp.RPCContext, characterID int64, recipeTemplate *models.SkillTemplate, ingredientIDs map[int]int64) ([]lifeSkillIngredientSelection, error) {
	requirements, err := h.lifeSkillRequirementsForRecipe(recipeTemplate)
	if err != nil {
		return nil, err
	}

	selections := make([]lifeSkillIngredientSelection, 0, len(requirements))
	for _, requirement := range requirements {
		itemID := ingredientIDs[requirement.slot]
		if itemID <= 0 {
			return nil, pkgerrors.ErrInvalidInput
		}

		item, err := h.itemService.GetItemByID(ctx.Context, characterID, itemID)
		if err != nil {
			return nil, err
		}
		if item == nil || item.CharacterID != characterID {
			return nil, pkgerrors.ErrItemNotFound
		}
		if item.TemplateID != requirement.templateID {
			return nil, pkgerrors.ErrInvalidInput
		}

		selections = append(selections, lifeSkillIngredientSelection{
			requirement: requirement,
			itemID:      itemID,
		})
	}

	return selections, nil
}

func (h *Handler) consumeLifeSkillIngredients(ctx *rtmp.RPCContext, characterID int64, selections []lifeSkillIngredientSelection) ([]*domainitem.Item, error) {
	requiredByItemID := map[int64]int{}
	order := make([]int64, 0, len(selections))
	for _, selection := range selections {
		if _, seen := requiredByItemID[selection.itemID]; !seen {
			order = append(order, selection.itemID)
		}
		requiredByItemID[selection.itemID] += selection.requirement.requiredNum
	}

	consumedItems := make([]*domainitem.Item, 0, len(order))
	for _, itemID := range order {
		item, err := h.itemService.GetItemByID(ctx.Context, characterID, itemID)
		if err != nil {
			return nil, err
		}
		if item == nil || item.CharacterID != characterID {
			return nil, pkgerrors.ErrItemNotFound
		}
		if item.StackCount < requiredByItemID[itemID] {
			return nil, pkgerrors.ErrInvalidInput
		}

		oldSID := item.CalculateSID()
		updatedItem, deleted, err := h.itemService.ConsumeItemStack(ctx.Context, characterID, itemID, requiredByItemID[itemID])
		if err != nil {
			return nil, err
		}

		if updatedItem == nil {
			updatedItem = item
		}
		updatedItem.Properties["lifeSkillOldSID"] = oldSID
		if deleted {
			updatedItem.Properties["lifeSkillDeleted"] = true
		}
		consumedItems = append(consumedItems, updatedItem)
	}

	return consumedItems, nil
}

func (h *Handler) addLifeSkillRewards(ctx *rtmp.RPCContext, characterID int64, recipeTemplate *models.SkillTemplate, consumedItems []*domainitem.Item) ([]*domainitem.Item, error) {
	rewardTemplateIDs := make([]int, 0, 2)
	if rewardID := int(math.Trunc(recipeTemplate.UseItemID)); rewardID > 0 {
		rewardTemplateIDs = append(rewardTemplateIDs, rewardID)
	}
	if rewardID := int(math.Trunc(recipeTemplate.UseItemType)); rewardID > 0 {
		rewardTemplateIDs = append(rewardTemplateIDs, rewardID)
	}

	shouldBind := false
	for _, item := range consumedItems {
		if item != nil && item.IsBound {
			shouldBind = true
			break
		}
	}

	addedItems := make([]*domainitem.Item, 0, len(rewardTemplateIDs))
	for _, templateID := range rewardTemplateIDs {
		rewardTemplate := h.gameData.GetItem(templateID)
		if rewardTemplate == nil {
			return nil, pkgerrors.ErrNotFound
		}

		addedItem, err := h.itemService.AddItemWithBind(ctx.Context, characterID, templateID, lifeSkillRewardItemType(rewardTemplate), 1, shouldBind)
		if err != nil {
			return nil, err
		}
		addedItems = append(addedItems, addedItem)
	}

	return addedItems, nil
}

func (h *Handler) sendLifeSkillConsumedItemCallback(ctx *rtmp.RPCContext, characterID int64, item *domainitem.Item) {
	if ctx == nil || ctx.Connection == nil || item == nil {
		return
	}

	oldSID, _ := item.Properties["lifeSkillOldSID"].(int)
	if oldSID <= 0 {
		oldSID = item.CalculateSID()
	}

	if deleted, _ := item.Properties["lifeSkillDeleted"].(bool); deleted {
		_ = ctx.Connection.SendCallback("onDelCharactorSlot", float64(item.ID), float64(oldSID))
		return
	}

	refetchedItem, err := h.itemService.GetItemByID(ctx.Context, characterID, item.ID)
	if err != nil || refetchedItem == nil {
		_ = ctx.Connection.SendCallback("onDelCharactorSlot", float64(item.ID), float64(oldSID))
		return
	}

	_ = ctx.Connection.SendCallback("onAddCharactorSlot", refetchedItem.ToDTO())
}

func (h *Handler) lifeSkillRequirementsForRecipe(recipeTemplate *models.SkillTemplate) ([]lifeSkillRequirement, error) {
	if recipeTemplate == nil {
		return nil, pkgerrors.ErrInvalidInput
	}

	itemTemplateID := int(math.Trunc(recipeTemplate.UseItemID))
	if itemTemplateID <= 0 {
		return nil, pkgerrors.ErrNotFound
	}

	itemTemplate := h.gameData.GetItem(itemTemplateID)
	if itemTemplate == nil {
		return nil, pkgerrors.ErrNotFound
	}

	requirements := []lifeSkillRequirement{
		{slot: 1, templateID: int(math.Trunc(itemTemplate.I1)), requiredNum: int(math.Trunc(itemTemplate.N1))},
		{slot: 2, templateID: int(math.Trunc(itemTemplate.I2)), requiredNum: int(math.Trunc(itemTemplate.N2))},
		{slot: 3, templateID: int(math.Trunc(itemTemplate.I3)), requiredNum: int(math.Trunc(itemTemplate.N3))},
	}

	for _, requirement := range requirements {
		if requirement.templateID <= 0 || requirement.requiredNum <= 0 {
			return nil, pkgerrors.ErrInvalidInput
		}
	}

	return requirements, nil
}

func parseLifeSkillIngredientIDs(raw interface{}) (map[int]int64, error) {
	values := map[string]interface{}{}

	switch typed := raw.(type) {
	case map[string]interface{}:
		values = typed
	case amf0.ECMAArray:
		values = map[string]interface{}(typed)
	default:
		return nil, pkgerrors.ErrInvalidArgs
	}

	result := make(map[int]int64, len(values))
	for key, value := range values {
		slot, err := strconv.Atoi(strings.TrimSpace(key))
		if err != nil || slot <= 0 {
			continue
		}
		itemID, ok := parseFlexibleInt64(value)
		if !ok || itemID <= 0 {
			return nil, pkgerrors.ErrInvalidArgs
		}
		result[slot] = itemID
	}

	if len(result) == 0 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	return result, nil
}

func lifeSkillRewardItemType(template *models.ItemTemplateTemplate) domainitem.ItemType {
	if template == nil {
		return domainitem.ItemTypeConsumable
	}

	switch int(math.Trunc(template.Kind)) {
	case 6:
		return domainitem.ItemTypeMaterial
	case 3:
		return domainitem.ItemTypeQuest
	default:
		return domainitem.ItemTypeConsumable
	}
}

func (h *Handler) sendLifeSkillCraftError(ctx *rtmp.RPCContext, err error) {
	if ctx == nil || ctx.Connection == nil || err == nil {
		return
	}

	message := "Không thể thực hiện kỹ năng sống"
	switch {
	case pkgerrors.Is(err, pkgerrors.ErrItemNotFound):
		message = "Thiếu nguyên liệu"
	case pkgerrors.Is(err, pkgerrors.ErrNotFound):
		message = "Thiếu dữ liệu công thức"
	case errors.Is(err, appskill.ErrLifeSkillRecipeNotFound):
		message = "Không tìm thấy công thức"
	case errors.Is(err, appskill.ErrLifeSkillRecipeNotLearned):
		message = "Chưa học công thức"
	case errors.Is(err, appskill.ErrLifeSkillRecipeLevelNotEnough):
		message = "Cấp kỹ năng sống không đủ"
	}

	_ = ctx.Connection.SendCallback("onSystemMidMsgOrNote", message)
}
