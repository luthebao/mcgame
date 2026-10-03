// Open-sourced by BaoLT

// Equipment disassemble (phân giải) handler.
// Destroys equipment and returns crafting materials (all bound).
package item

import (
	"strconv"

	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) EquResolve(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	equipmentID, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	passHash, ok := args[1].(string)
	if !ok || passHash == "" {
		return nil, nil
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	if err := rtmputils.VerifySecondaryPassword(ctx.Context, h.accountRepo, ctx.AccountID, passHash); err != nil {
		if notifyErr := rtmputils.NotifySecondaryPasswordFailure(ctx.Connection); notifyErr != nil {
			h.logger.Error("EquResolve: failed to notify password failure", zap.Error(notifyErr))
		}
		return nil, nil
	}

	equipment, err := h.itemService.GetItemByID(ctx.Context, characterID, equipmentID)
	if err != nil || equipment == nil || equipment.ItemType != domainitem.ItemTypeEquipment {
		return nil, nil
	}

	if equipment.ColorCode < 1 {
		return nil, nil
	}

	if equipment.IsEquipped() {
		return nil, nil
	}

	equipTpl := h.itemService.GetEquipmentTemplate(equipment.TemplateID)
	if equipTpl == nil {
		return nil, nil
	}

	oldSID := equipment.CalculateSID()

	preNameType := domainitem.ResolveEquipmentPrefixType(
		equipment.Properties["preNameType"],
		equipment.ColorCode,
	)
	materialColor := equipment.ColorCode
	if preNameType != 5 {
		materialColor = equipment.ColorCode - 1
	}
	if materialColor < 0 {
		materialColor = 0
	}
	if materialColor > 5 {
		materialColor = 5
	}

	materials := []struct {
		templateID int
		num        int
	}{
		{int(equipTpl.RequireItem1), int(equipTpl.RequireNum1)},
		{int(equipTpl.RequireItem2), int(equipTpl.RequireNum2)},
		{int(equipTpl.RequireItem3), int(equipTpl.RequireNum3)},
	}

	for _, mat := range materials {
		if mat.templateID <= 0 || mat.num <= 0 {
			continue
		}
		addedItem, addErr := h.itemService.AddItemWithBindAndColor(ctx.Context, characterID, mat.templateID, domainitem.ItemTypeConsumable, mat.num, true, materialColor)
		if addErr != nil {
			h.logger.Error("EquResolve: failed to add material",
				zap.Int("template_id", mat.templateID),
				zap.Error(addErr))
			continue
		}
		ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(addedItem))
	}

	if _, err := h.itemService.DropItem(ctx.Context, characterID, equipmentID); err != nil {
		h.logger.Error("EquResolve: failed to delete equipment", zap.Error(err))
		return nil, nil
	}

	ctx.Connection.SendCallback("onDelCharactorSlot", float64(equipmentID), float64(oldSID))

	h.logger.Info("EquResolve: equipment disassembled",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int64("equipment_id", equipmentID),
		zap.Int("template_id", equipment.TemplateID))

	return true, nil
}
