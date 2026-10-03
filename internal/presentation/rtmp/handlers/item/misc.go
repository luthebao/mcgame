// Open-sourced by BaoLT

// Miscellaneous item handlers for repair, equipment checks, dress visibility, bank close, and daily resets.
package item

import (
	"strconv"

	appitem "mcgame-server/internal/application/item"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) Repair(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	var itemID int64
	switch v := args[0].(type) {
	case float64:
		itemID = int64(v)
	case int64:
		itemID = v
	case int:
		itemID = int64(v)
	default:
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	result, err := h.itemService.RepairItem(ctx.Context, characterID, itemID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	if err := ctx.Connection.SendCallback("onUPP", map[string]interface{}{"money": result.NewMoney}); err != nil {
		h.logger.Warn("Failed to send repair money update",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	h.logger.Info("Item repaired",
		zap.Int64("character_id", characterID),
		zap.Int64("item_id", itemID),
		zap.Int64("cost", result.Cost),
		zap.Int64("new_money", result.NewMoney))

	return map[string]interface{}{
		"success": true,
		"cost":    result.Cost,
		"money":   result.NewMoney,
	}, nil
}

func (h *Handler) RepairAll(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	result, err := h.itemService.RepairAll(ctx.Context, characterID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	if err := ctx.Connection.SendCallback("onUPP", map[string]interface{}{"money": result.NewMoney}); err != nil {
		h.logger.Warn("Failed to send repair-all money update",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	h.logger.Info("All equipment repaired",
		zap.Int64("character_id", characterID),
		zap.Int64("total_cost", result.Cost),
		zap.Int64("new_money", result.NewMoney))

	return map[string]interface{}{
		"success":   true,
		"totalCost": result.Cost,
		"money":     result.NewMoney,
	}, nil
}

func (h *Handler) IsEquSid(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("IsEquSid called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))
	if len(args) < 1 {
		return false, nil
	}

	charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return false, nil
	}

	slotID := int64(args[0].(float64))
	isEquipped, err := h.itemService.IsEquippedBySlotID(ctx.Context, charID, slotID)
	if err != nil {
		h.logger.Warn("IsEquippedBySlotID failed", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
		return false, nil
	}

	return isEquipped, nil
}

func (h *Handler) SetDressHide(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	if len(args) < 1 {
		h.logger.Warn("SetDressHide: missing parameter",
			zap.Uint32("conn_id", ctx.ConnID))
		return nil, pkgerrors.ErrInvalidArgs
	}

	var isSelected bool
	switch v := args[0].(type) {
	case bool:
		isSelected = v
	case float64:
		isSelected = v != 0
	case int:
		isSelected = v != 0
	default:
		h.logger.Warn("SetDressHide: invalid parameter type",
			zap.Any("param", args[0]))
		return nil, pkgerrors.ErrInvalidInput
	}

	h.logger.Debug("SetDressHide: setting dress visibility",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Bool("hide", isSelected))

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	itemInterfaceSettings := map[string]interface{}{}
	if char.PMProcessData != nil {
		if existing, ok := char.PMProcessData["interfaceData"].(map[string]interface{}); ok {
			for key, value := range existing {
				itemInterfaceSettings[key] = value
			}
		}
	} else {
		char.PMProcessData = map[string]interface{}{}
	}
	if isSelected {
		itemInterfaceSettings["dressHide"] = 1
	} else {
		itemInterfaceSettings["dressHide"] = 0
	}
	char.PMProcessData["interfaceData"] = itemInterfaceSettings
	if err := h.charService.Save(ctx.Context, char); err != nil {
		return nil, err
	}
	if h.settingsRepo != nil {
		if err := h.settingsRepo.Upsert(ctx.Context, characterID, itemInterfaceSettings); err != nil {
			h.logger.Warn("SetDressHide: failed to persist interface settings",
				zap.Int64("character_id", characterID),
				zap.Error(err))
		}
	}

	appearance := appitem.CharacterAppearance{}
	if h.itemService != nil {
		appearance = h.itemService.BuildCharacterAppearance(ctx.Context, char.ID, char.Gender)
		appearance = h.itemService.ApplyDressStateToAppearance(appearance, char.Gender, char.DressInfo, isSelected)
	}
	h.sendResolvedDressAppearance(ctx, char, appearance)

	h.logger.Info("SetDressHide: dress visibility updated",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Bool("hide", isSelected))

	return isSelected, nil
}

func (h *Handler) CheckEquipEdit(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	mode := int64(0)
	if len(args) > 0 {
		parsedMode, ok := parseFlexibleInt64(args[0])
		if !ok {
			h.logger.Warn("CheckEquipEdit: invalid mode",
				zap.Uint32("conn_id", ctx.ConnID),
				zap.Any("args", args))
			return nil, nil
		}
		mode = parsedMode
	}

	h.logger.Debug("CheckEquipEdit: no saved equipment edit state",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int64("mode", mode))

	return nil, nil
}

func (h *Handler) CloseBank(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("CloseBank called", zap.Uint32("conn_id", ctx.ConnID))
	return nil, nil
}

func (h *Handler) CheckLimitWingEffect(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	h.logger.Debug("CheckLimitWingEffect: checking wing effects",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	response := map[string]interface{}{
		"hasWing": false,
	}

	h.logger.Info("CheckLimitWingEffect: wing effect check completed",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	return response, nil
}
