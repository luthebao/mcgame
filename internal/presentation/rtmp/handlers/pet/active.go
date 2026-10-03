// Open-sourced by BaoLT

package pet

import (
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) ActivePet(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	pet, err := h.petService.GetActivePet(ctx.Context, characterID)
	if err != nil {
		h.logger.Warn("ActivePet: failed to load active pet",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, nil
	}

	if pet == nil {
		if ctx.Connection != nil {
			_ = ctx.Connection.SendCallback("updateActivatePetObj", nil)
		}
		return nil, nil
	}

	dto := pet.ToDTO()
	if ctx.Connection != nil {
		_ = ctx.Connection.SendCallback("updateActivatePetObj", dto)
	}

	return dto, nil
}
