// Open-sourced by BaoLT

// Pet equipment handlers mirror the Flash pet panel contract for equip and unequip callbacks.
package pet

import (
	"fmt"

	"mcgame-server/internal/infrastructure/rtmp"
)

func (h *Handler) PetEquipOn(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if err := requireArgs(args, 2); err != nil {
		return nil, err
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	petID, err := parseInt64Arg(args[0])
	if err != nil {
		return nil, err
	}

	itemID, err := parseInt64Arg(args[1])
	if err != nil {
		return nil, err
	}

	result, err := h.petService.EquipPetItem(ctx.Context, characterID, petID, itemID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	slotKey := fmt.Sprintf("equ%d", result.Slot)
	_ = ctx.Connection.SendCallback("onUpdatePet", float64(result.Pet.ID), slotKey, float64(result.NewItemID))
	for _, move := range result.Moves {
		_ = ctx.Connection.SendCallback("onMoveItem", float64(move.FromSID), float64(move.ToSID), float64(move.ItemID))
	}
	sendPetPropRefresh(ctx, result.Pet)
	_ = ctx.Connection.SendCallback("onPetEquipOn", map[string]interface{}{
		"pid":    result.Pet.ID,
		"pos":    result.Slot,
		"oldSid": result.OldItemID,
		"newSid": result.NewItemID,
	})

	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) PetEquipOff(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if err := requireArgs(args, 2); err != nil {
		return nil, err
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	petID, err := parseInt64Arg(args[0])
	if err != nil {
		return nil, err
	}

	itemID, err := parseInt64Arg(args[1])
	if err != nil {
		return nil, err
	}

	result, err := h.petService.UnequipPetItem(ctx.Context, characterID, petID, itemID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	slotKey := fmt.Sprintf("equ%d", result.Slot)
	_ = ctx.Connection.SendCallback("onMoveItem", float64(result.Move.FromSID), float64(result.Move.ToSID), float64(result.Move.ItemID))
	_ = ctx.Connection.SendCallback("onUpdatePet", float64(result.Pet.ID), slotKey, float64(0))
	sendPetPropRefresh(ctx, result.Pet)
	_ = ctx.Connection.SendCallback("onPetEquipOff", map[string]interface{}{
		"pid": result.Pet.ID,
		"pos": result.Slot,
		"sid": result.ItemID,
	})

	return map[string]interface{}{"success": true}, nil
}
