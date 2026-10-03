// Open-sourced by BaoLT

// Equipment maker handlers preserve the Flash changeName RPC contract.
package item

import (
	"errors"
	"strconv"

	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) ChangeName(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 3 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	equipmentID, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	materialRef, ok := parseFlexibleInt64(args[1])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	tempBagFlag := false
	switch v := args[2].(type) {
	case bool:
		tempBagFlag = v
	case float64:
		tempBagFlag = v != 0
	case int:
		tempBagFlag = v != 0
	case int64:
		tempBagFlag = v != 0
	default:
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	result, err := h.itemService.ChangeEquipmentMaker(ctx.Context, characterID, equipmentID, materialRef, tempBagFlag)
	if err != nil {
		if errors.Is(err, pkgerrors.ErrInvalidInput) || errors.Is(err, pkgerrors.ErrItemNotFound) || errors.Is(err, pkgerrors.ErrItemNotOwned) {
			return map[string]interface{}{"f": false}, nil
		}
		h.logger.Error("ChangeName: failed to update equipment maker",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", characterID),
			zap.Int64("equipment_id", equipmentID),
			zap.Int64("material_ref", materialRef),
			zap.Bool("temp_bag", tempBagFlag),
			zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}

	if result.ConsumedItemDeleted {
		ctx.Connection.SendCallback("onDelCharactorSlot", float64(result.ConsumedItem.ID), float64(result.ConsumedItem.CalculateSID()))
	} else {
		ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(result.ConsumedItem))
	}
	ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(result.Equipment))
	ctx.Connection.SendCallback("onUPP", map[string]interface{}{"money": result.NewMoney})

	if result.Equipment.IsEquipped() {
		if ch, chErr := h.charService.GetByID(ctx.Context, characterID); chErr == nil && ch != nil {
			ctx.Connection.SendCallback("onInitViewProp", h.getCharacterViewProps(ctx.Context, ch))
		}
	}

	h.logger.Info("ChangeName: equipment maker updated",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int64("equipment_id", equipmentID),
		zap.String("maker", result.Equipment.Properties["maker"].(string)),
		zap.Int("remaining_material", result.RemainingMaterialCount),
		zap.Int64("new_money", result.NewMoney))

	return map[string]interface{}{
		"f":  true,
		"ii": float64(result.MaterialResponseID),
		"n":  float64(result.RemainingMaterialCount),
	}, nil
}
