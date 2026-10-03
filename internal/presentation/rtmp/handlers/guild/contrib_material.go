// Open-sourced by BaoLT

package guild

import (
	"math"
	"strconv"

	domainguild "mcgame-server/internal/domain/guild"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"
)

const (
	itemKindMaterial             = 6
	guildMaterialNormalTemplate  = 2026
	guildMaterialRareTemplate    = 2027
	guildMaterialSpecialTemplate = 2039
	contribTypeDonate            = 1
	guildWarehouseSIDBase        = 501
)

func (h *Handler) ContribMaterial(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	args = trimResponderArg(args)
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	request, ok := args[0].(map[string]interface{})
	if !ok {
		return nil, pkgerrors.ErrInvalidInput
	}

	slotID, err := parseInt64Arg(request["slotId"])
	if err != nil {
		return nil, err
	}
	countValue, err := parseIntArg(request["num"])
	if err != nil {
		return nil, err
	}
	if countValue <= 0 {
		return nil, pkgerrors.ErrInvalidInput
	}

	if h.itemService == nil || h.guildService == nil {
		return nil, pkgerrors.ErrSystemError
	}

	itemData, err := h.itemService.GetItemByID(ctx.Context, characterID, slotID)
	if err != nil {
		return nil, err
	}
	if itemData == nil {
		return nil, pkgerrors.ErrNotFound
	}
	if itemData.SlotType != domainitem.SlotTypeBag || itemData.StackCount < countValue {
		return nil, pkgerrors.ErrInvalidInput
	}

	template := h.itemService.GetItemTemplate(itemData.TemplateID)
	if template == nil {
		return nil, pkgerrors.ErrNotFound
	}
	materialTemplateID, guildMaterialCount, personalContrib, err := guildMaterialContribution(template, countValue)
	if err != nil {
		return nil, err
	}

	guildItem, _, err := h.guildService.GetGuildByMemberForClient(ctx.Context, characterID)
	if err != nil {
		return nil, guildError(err)
	}
	if guildItem == nil {
		return nil, pkgerrors.ErrNotFound
	}
	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}
	if char == nil {
		return nil, pkgerrors.ErrCharacterNotFound
	}

	updatedItem, deleted, err := h.itemService.ConsumeItemStackByID(ctx.Context, characterID, slotID, countValue)
	if err != nil {
		return nil, err
	}

	warehouseSlot, err := h.guildService.AddWarehouseMaterial(ctx.Context, guildItem.ID, materialTemplateID, guildMaterialCount)
	if err != nil {
		return nil, guildError(err)
	}

	updatedGuild, err := h.guildService.AddContribution(ctx.Context, guildItem.ID, characterID, 0, 0, int64(personalContrib))
	if err != nil {
		return nil, guildError(err)
	}

	if deleted {
		_ = ctx.Connection.SendCallback("onDelCharactorSlot", float64(updatedItem.ID), updatedItem.CalculateSID())
	} else {
		_ = ctx.Connection.SendCallback("onAddCharactorSlot", updatedItem.ToDTO())
	}

	_ = ctx.Connection.SendCallback("onUpdatePerNumProp", map[string]interface{}{
		"name": char.Name,
		"type": contribTypeDonate,
		"cid":  characterID,
		"num":  personalContrib,
	})
	h.broadcastGuild(updatedGuild, "onAddGuildSlot", warehouseSlot.ToDTO())

	return 1, nil
}

func (h *Handler) DropGuildItem(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	args = trimResponderArg(args)
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	slotID, err := parseInt64Arg(args[0])
	if err != nil {
		return nil, err
	}
	if h.guildService == nil {
		return nil, pkgerrors.ErrSystemError
	}

	guildItem, selfMember, err := h.guildService.GetGuildByMemberForClient(ctx.Context, characterID)
	if err != nil {
		return nil, guildError(err)
	}
	if guildItem == nil || selfMember == nil {
		return nil, pkgerrors.ErrNotFound
	}
	if selfMember.Rank != domainguild.RankLeader {
		_ = ctx.Connection.SendCallback("a", "Chỉ bang chủ mới có thể xóa nguyên liệu bang hội.")
		return nil, nil
	}

	slotData, ok := guildWarehouseSlotDTO(guildItem.Warehouse, slotID)
	if !ok {
		return nil, pkgerrors.ErrNotFound
	}
	if err := h.guildService.RemoveWarehouseSlot(ctx.Context, guildItem.ID, slotID); err != nil {
		return nil, guildError(err)
	}

	h.broadcastGuild(guildItem, "onDelGuildSlot", float64(slotID))
	h.broadcastGuild(guildItem, "onDelGuildItem", map[string]interface{}{
		"tid": slotData.TemplateID,
		"num": slotData.StackCount,
	})

	return map[string]interface{}{"ok": true}, nil
}

func (h *Handler) MoveGuildItem(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	args = trimResponderArg(args)
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	sourceSID, err := parseIntArg(args[0])
	if err != nil {
		return nil, err
	}
	targetSID, err := parseIntArg(args[1])
	if err != nil {
		return nil, err
	}
	if sourceSID == targetSID {
		return map[string]interface{}{"ok": true}, nil
	}

	guildItem, _, err := h.guildService.GetGuildByMemberForClient(ctx.Context, characterID)
	if err != nil {
		return nil, guildError(err)
	}
	if guildItem == nil {
		return nil, pkgerrors.ErrNotFound
	}

	sourceSlot, ok := guildWarehouseSlotBySID(guildItem.Warehouse, sourceSID)
	if !ok {
		return nil, pkgerrors.ErrNotFound
	}
	targetSlot, hasTarget := guildWarehouseSlotBySID(guildItem.Warehouse, targetSID)

	targetIndex := guildWarehouseSlotIndexFromSID(targetSID)
	if targetIndex < 0 {
		return nil, pkgerrors.ErrInvalidInput
	}

	if !hasTarget {
		if err := h.guildService.UpdateWarehouseSlot(ctx.Context, guildItem.ID, sourceSlot.ID, targetIndex, sourceSlot.StackCount); err != nil {
			return nil, guildError(err)
		}
		h.broadcastGuild(guildItem, "onMoveGuildItem", map[string]interface{}{
			"sSid": sourceSID,
			"tSid": targetSID,
			"sId":  sourceSlot.ID,
		})
		return map[string]interface{}{"ok": true}, nil
	}

	if sourceSlot.TemplateID != targetSlot.TemplateID {
		_ = ctx.Connection.SendCallback("a", "Chỉ có thể chồng vật phẩm cùng loại trong kho bang hội.")
		return nil, nil
	}

	maxStack := guildWarehouseStackMax(h.itemService.GetItemTemplate(sourceSlot.TemplateID))
	merged := sourceSlot.StackCount + targetSlot.StackCount
	if merged <= maxStack {
		if err := h.guildService.UpdateWarehouseSlot(ctx.Context, guildItem.ID, targetSlot.ID, guildWarehouseSlotIndexFromSID(targetSID), merged); err != nil {
			return nil, guildError(err)
		}
		if err := h.guildService.RemoveWarehouseSlot(ctx.Context, guildItem.ID, sourceSlot.ID); err != nil {
			return nil, guildError(err)
		}
		h.broadcastGuild(guildItem, "onStackGuildItemInto", map[string]interface{}{
			"sSid":      sourceSID,
			"tSid":      targetSID,
			"sId":       sourceSlot.ID,
			"tId":       targetSlot.ID,
			"tStackNum": merged,
		})
		return map[string]interface{}{"ok": true}, nil
	}

	targetCount := maxStack
	sourceCount := merged - maxStack
	if err := h.guildService.UpdateWarehouseSlot(ctx.Context, guildItem.ID, targetSlot.ID, guildWarehouseSlotIndexFromSID(targetSID), targetCount); err != nil {
		return nil, guildError(err)
	}
	if err := h.guildService.UpdateWarehouseSlot(ctx.Context, guildItem.ID, sourceSlot.ID, guildWarehouseSlotIndexFromSID(sourceSID), sourceCount); err != nil {
		return nil, guildError(err)
	}
	h.broadcastGuild(guildItem, "onStackGuildItem", map[string]interface{}{
		"sSid":      sourceSID,
		"tSid":      targetSID,
		"sId":       sourceSlot.ID,
		"tId":       targetSlot.ID,
		"tStackNum": targetCount,
		"sStackNum": sourceCount,
	})
	return map[string]interface{}{"ok": true}, nil
}

func guildMaterialContribution(template *models.ItemTemplateTemplate, count int) (int, int, int, error) {
	templateID := int(template.ID)
	color := int(template.Color)
	if templateID != guildMaterialSpecialTemplate {
		if int(template.Kind) != itemKindMaterial || color < 2 {
			return 0, 0, 0, pkgerrors.ErrInvalidInput
		}
	}

	factor := math.Pow(float64(color), 5)
	switch materialBucketTemplate(templateID) {
	case guildMaterialNormalTemplate:
		guildCount := int(math.Floor((float64(count) * factor) / 8))
		contrib := int(math.Floor(((float64(count) * factor) * 50) / 8))
		return guildMaterialNormalTemplate, guildCount, contrib, nil
	case guildMaterialRareTemplate:
		guildCount := int(math.Floor((float64(count) * factor) / 8))
		contrib := int(math.Floor(((float64(count) * factor) * 100) / 8))
		return guildMaterialRareTemplate, guildCount, contrib, nil
	case guildMaterialSpecialTemplate:
		return guildMaterialSpecialTemplate, count, count * 100, nil
	default:
		return 0, 0, 0, pkgerrors.ErrInvalidInput
	}
}

func materialBucketTemplate(templateID int) int {
	switch templateID {
	case guildMaterialSpecialTemplate:
		return guildMaterialSpecialTemplate
	case 24, 21, 23, 26, 28:
		return guildMaterialRareTemplate
	case 16, 7, 18, 22, 25, 27:
		return guildMaterialNormalTemplate
	default:
		return 0
	}
}

type guildWarehouseSlotData struct {
	ID         int64
	SID        int
	TemplateID int
	StackCount int
}

func guildWarehouseSlotDTO(warehouse map[string]interface{}, slotID int64) (guildWarehouseSlotData, bool) {
	raw, ok := warehouse[strconv.FormatInt(slotID, 10)]
	if !ok {
		return guildWarehouseSlotData{}, false
	}
	slot, ok := raw.(map[string]interface{})
	if !ok {
		return guildWarehouseSlotData{}, false
	}
	return guildWarehouseSlotData{
		ID:         slotID,
		SID:        safeInt(slot["sid"]),
		TemplateID: safeInt(slot["tid"]),
		StackCount: safeInt(slot["stackNum"]),
	}, true
}

func guildWarehouseSlotBySID(warehouse map[string]interface{}, sid int) (guildWarehouseSlotData, bool) {
	for key, raw := range warehouse {
		slot, ok := raw.(map[string]interface{})
		if !ok {
			continue
		}
		if safeInt(slot["sid"]) != sid {
			continue
		}
		slotID, _ := strconv.ParseInt(key, 10, 64)
		return guildWarehouseSlotData{
			ID:         slotID,
			SID:        sid,
			TemplateID: safeInt(slot["tid"]),
			StackCount: safeInt(slot["stackNum"]),
		}, true
	}
	return guildWarehouseSlotData{}, false
}

func guildWarehouseSlotIndexFromSID(sid int) int {
	if sid < guildWarehouseSIDBase {
		return -1
	}
	return sid - guildWarehouseSIDBase
}

func guildWarehouseStackMax(template *models.ItemTemplateTemplate) int {
	if template == nil || int(template.StackMax) <= 0 {
		return 99999
	}
	return int(template.StackMax)
}

func safeInt(value interface{}) int {
	switch typed := value.(type) {
	case int:
		return typed
	case int64:
		return int(typed)
	case float64:
		return int(typed)
	case string:
		n, _ := strconv.Atoi(typed)
		return n
	default:
		return 0
	}
}
