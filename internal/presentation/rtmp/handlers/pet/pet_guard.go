// Open-sourced by BaoLT

package pet

import (
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) GetPetGuardData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	payload, err := h.petService.GetPetGuardData(ctx.Context, characterID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	if err := ctx.Connection.SendCallback("onUpdatePetGuardData", payload); err != nil {
		h.logger.Warn("Failed to send onUpdatePetGuardData callback", zap.Error(err))
	}

	return payload, nil
}

func (h *Handler) PutDownPet(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if err := requireArgs(args, 1); err != nil {
		return nil, err
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	sid, err := parseIntArg(args[0])
	if err != nil {
		return nil, err
	}

	payload, err := h.petService.PutDownPet(ctx.Context, characterID, sid)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	if err := ctx.Connection.SendCallback("onUpdatePetGuardData", payload); err != nil {
		h.logger.Warn("Failed to send onUpdatePetGuardData callback", zap.Error(err))
	}

	return payload, nil
}

func (h *Handler) UpGuardSid(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if err := requireArgs(args, 2); err != nil {
		return nil, err
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	sid, err := parseIntArg(args[0])
	if err != nil {
		return nil, err
	}
	costType, err := parseIntArg(args[1])
	if err != nil {
		return nil, err
	}

	result, err := h.petService.UpgradePetGuardSid(ctx.Context, characterID, sid, costType)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	if err := ctx.Connection.SendCallback("onUpdatePetGuardData", result.Payload); err != nil {
		h.logger.Warn("Failed to send onUpdatePetGuardData callback", zap.Error(err))
	}
	if err := ctx.Connection.SendCallback("onAddMoney", float64(characterID), "gold", float64(-result.GoldSpent), float64(result.NewGold)); err != nil {
		h.logger.Warn("Failed to send onAddMoney callback after pet guard upgrade", zap.Error(err))
	}

	return result.Payload, nil
}

func (h *Handler) MovePetToPetGuardSid(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
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
	sid, err := parseIntArg(args[1])
	if err != nil {
		return nil, err
	}

	payload, err := h.petService.MovePetToPetGuardSid(ctx.Context, characterID, petID, sid)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	if err := ctx.Connection.SendCallback("onUpdatePetGuardData", payload); err != nil {
		h.logger.Warn("Failed to send onUpdatePetGuardData callback", zap.Error(err))
	}

	return payload, nil
}
