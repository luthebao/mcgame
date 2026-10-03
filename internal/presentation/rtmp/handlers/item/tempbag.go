// Open-sourced by BaoLT

// Temporary bag handlers for managing temp bag and MX bag slots, sorting, and opening.
package item

import (
	"strconv"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) TempBagSort(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, err
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	_, err = h.itemService.SortTempBag(ctx.Context, characterID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	items, err := h.itemService.GetAllItems(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	tBagData := h.buildTBagData(char, items)
	_ = ctx.Connection.SendCallback("updateTempBags", tBagData)

	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) MxBagSort(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, err
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	_, err = h.itemService.SortMxTempBag(ctx.Context, characterID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	items, err := h.itemService.GetAllItems(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	tBagData := h.buildTBagData(char, items)
	_ = ctx.Connection.SendCallback("updateTempBags", tBagData)

	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) GetTBag(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("GetTBag called", zap.Uint32("conn_id", ctx.ConnID))

	charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, err
	}

	char, err := h.charService.GetByID(ctx.Context, charID)
	if err != nil {
		h.logger.Error("Failed to get character for GetTBag", zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}

	items, err := h.itemService.GetAllItems(ctx.Context, charID)
	if err != nil {
		h.logger.Error("Failed to get items for GetTBag", zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}

	response := h.buildTBagData(char, items)
	h.logger.Debug("GetTBag response", zap.Any("response", response))

	return response, nil
}

func (h *Handler) OpenTempSlot(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, err
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	costArr := []int64{10, 50, 100, 200, 500}

	currentQuickSlots := char.TempBagSlots
	if currentQuickSlots < 0 {
		currentQuickSlots = 0
	}

	if currentQuickSlots >= 5 {
		return map[string]interface{}{"success": false, "code": "ERR_MAX_SLOTS"}, nil
	}

	cost := costArr[currentQuickSlots]

	if char.Gold < cost {
		_ = ctx.Connection.SendCallback("onSystemMsgCode", 20)
		return nil, nil
	}

	char.Gold -= cost
	char.TempBagSlots += 1

	if char.TempBagSlots > 5 {
		char.TempBagSlots = 5
		return map[string]interface{}{"success": false, "code": "ERR_MAX_SLOTS"}, nil
	}

	if err := h.charService.Update(ctx.Context, char); err != nil {
		h.logger.Error("Failed to update character slots", zap.Error(err))
		return nil, err
	}

	h.logger.Info("Temp Bag slot opened",
		zap.Int64("charID", characterID),
		zap.Int("newSize", char.TempBagSlots),
		zap.Int64("remainingGold", char.Gold))

	items, err := h.itemService.GetAllItems(ctx.Context, characterID)
	if err != nil {
		_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{"gold": char.Gold})
		return nil, err
	}

	tBagData := h.buildTBagData(char, items)
	_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{
		"gold":        char.Gold,
		"bankSlotNum": 1,
	})
	_ = ctx.Connection.SendCallback("updateTempBags", tBagData)

	return char.TempBagSlots, nil
}

func (h *Handler) MxOpenSlot(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, err
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	costArr := []int64{10, 50, 100, 200, 500}

	currentMxSlots := char.MxTempBagSlots
	if currentMxSlots < 0 {
		currentMxSlots = 0
	}

	if currentMxSlots >= 5 {
		return map[string]interface{}{"success": false, "code": "ERR_MAX_SLOTS"}, nil
	}

	cost := costArr[currentMxSlots]

	if char.Gold < cost {
		_ = ctx.Connection.SendCallback("onSystemMsgCode", 20)
		return nil, nil
	}

	char.Gold -= cost
	char.MxTempBagSlots += 1

	if char.MxTempBagSlots > 5 {
		char.MxTempBagSlots = 5
		return map[string]interface{}{"success": false, "code": "ERR_MAX_SLOTS"}, nil
	}

	if err := h.charService.Update(ctx.Context, char); err != nil {
		return nil, err
	}

	h.logger.Info("MX slot opened",
		zap.Int64("charID", characterID),
		zap.Int("newSize", char.MxTempBagSlots),
		zap.Int64("remainingGold", char.Gold))

	items, err := h.itemService.GetAllItems(ctx.Context, characterID)
	if err != nil {
		_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{"gold": char.Gold})
		return nil, err
	}

	tBagData := h.buildTBagData(char, items)
	_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{
		"gold":        char.Gold,
		"bankSlotNum": 1,
	})
	_ = ctx.Connection.SendCallback("updateTempBags", tBagData)

	return char.MxTempBagSlots, nil
}

func (h *Handler) buildTBagData(char *character.Character, items []*domainitem.Item) map[string]interface{} {
	return h.itemService.BuildTBagPayload(char, items)
}

func (h *Handler) OneKeyOpenAllMXTemp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, err
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	costArr := []int64{10, 50, 100, 200, 500}

	currentMxSlots := char.MxTempBagSlots
	if currentMxSlots < 0 {
		currentMxSlots = 0
	}

	if currentMxSlots >= 5 {
		return map[string]interface{}{"success": false, "code": "ERR_MAX_SLOTS"}, nil
	}

	var totalCost int64
	for i := currentMxSlots; i < 5; i++ {
		totalCost += costArr[i]
	}

	if char.Gold < totalCost {
		_ = ctx.Connection.SendCallback("onSystemMsgCode", 20)
		return nil, nil
	}

	char.Gold -= totalCost
	char.MxTempBagSlots = 5

	if err := h.charService.Update(ctx.Context, char); err != nil {
		return nil, err
	}

	h.logger.Info("OneKeyOpenAllMXTemp: All slots opened",
		zap.Int64("charID", characterID),
		zap.Int64("totalCost", totalCost),
		zap.Int64("remainingGold", char.Gold))

	items, err := h.itemService.GetAllItems(ctx.Context, characterID)
	if err != nil {
		_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{"gold": char.Gold})
		return nil, err
	}

	tBagData := h.buildTBagData(char, items)
	_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{
		"gold":        char.Gold,
		"bankSlotNum": 1,
	})
	_ = ctx.Connection.SendCallback("updateTempBags", tBagData)
	return tBagData, nil
}
