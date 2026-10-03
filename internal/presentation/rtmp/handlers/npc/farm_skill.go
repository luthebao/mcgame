// Open-sourced by BaoLT

package npc

import (
	"context"

	domainchar "mcgame-server/internal/domain/character"
)

func (h *Handler) farmPlantSkillLevelEnoughForCharacter(ctx context.Context, char *domainchar.Character, cropNPCID int) bool {
	requiredLevel, hasRequiredLevel := farmCropRequiredSkillLevel(cropNPCID, h.gameData)
	if !hasRequiredLevel || requiredLevel <= 0 {
		return true
	}

	currentLevel := 0
	if h.skillService != nil && char != nil {
		level, err := h.skillService.GetPlantSkillLevel(ctx, char.ID)
		if err == nil {
			currentLevel = level
		} else {
			derivedLevel, _ := farmCharacterPlantSkillLevel(char, h.gameData)
			currentLevel = derivedLevel
		}
	} else {
		derivedLevel, _ := farmCharacterPlantSkillLevel(char, h.gameData)
		currentLevel = derivedLevel
	}

	return currentLevel >= requiredLevel
}
