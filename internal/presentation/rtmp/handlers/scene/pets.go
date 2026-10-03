// Open-sourced by BaoLT

package scene

import (
	"context"

	"go.uber.org/zap"
)

func (h *Handler) attachShowPetObject(ctx context.Context, characterID int64, playerData map[string]interface{}) {
	if h.petService == nil || playerData == nil {
		return
	}

	followingPet, err := h.petService.GetFollowingPet(ctx, characterID)
	if err != nil {
		h.logger.Warn("Failed to load following pet for scene payload",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return
	}
	if followingPet == nil {
		return
	}

	playerData["showPetId"] = followingPet.ID
	playerData["showPetObj"] = followingPet.ToSceneDTO()
}
