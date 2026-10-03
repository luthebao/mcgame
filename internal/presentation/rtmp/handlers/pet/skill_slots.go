// Open-sourced by BaoLT

package pet

import (
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) PetOpenSkill(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
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
	slot, err := parseIntArg(args[1])
	if err != nil {
		return nil, err
	}

	result, err := h.petService.OpenPetSkill(ctx.Context, characterID, petID, slot)
	if err != nil {
		h.logger.Error("Failed to open pet skill slot",
			zap.Int64("character_id", characterID),
			zap.Int64("pet_id", petID),
			zap.Int("slot", slot),
			zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}

	_ = ctx.Connection.SendCallback("onMinusMoney", float64(characterID), result.CurrencyType, float64(result.Cost), float64(result.Remaining))
	_ = ctx.Connection.SendCallback("onUpdatePet", float64(result.PetID), result.SlotKey, float64(0))

	h.logger.Info("Pet skill slot opened",
		zap.Int64("character_id", characterID),
		zap.Int64("pet_id", petID),
		zap.Int("slot", slot),
		zap.Int("cost", result.Cost),
		zap.String("currency_type", result.CurrencyType))

	return map[string]interface{}{
		"success": true,
		"petId":   result.PetID,
		"slot":    result.SlotKey,
	}, nil
}
