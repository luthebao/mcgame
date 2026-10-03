// Open-sourced by BaoLT

package combat

import (
	"context"
	"math"
	"math/rand"
	"strconv"

	domaincombat "mcgame-server/internal/domain/combat"

	"go.uber.org/zap"
)

type combatCatchHandler struct {
	service *Service
}

func newCombatCatchHandler(service *Service) domaincombat.CatchHandler {
	return &combatCatchHandler{service: service}
}

func (h *combatCatchHandler) AttemptCatch(actorID string, creatureEntityID int64, creatureLevel int, currentHP int, maxHP int) domaincombat.CatchResult {
	if h == nil || h.service == nil || h.service.petService == nil || h.service.charRepo == nil {
		return domaincombat.CatchResult{}
	}

	charID, err := strconv.ParseInt(actorID, 10, 64)
	if err != nil {
		return domaincombat.CatchResult{}
	}

	char, err := h.service.charRepo.FindByID(context.Background(), charID)
	if err != nil || char == nil {
		return domaincombat.CatchResult{}
	}

	gm := h.service.getGameDataManager()
	if gm == nil {
		return domaincombat.CatchResult{}
	}

	creatureTpl := gm.GetCreature(int(creatureEntityID))
	if creatureTpl == nil {
		return domaincombat.CatchResult{}
	}

	baseResult := domaincombat.CatchResult{
		SelfCatch: maxCatchDisplayValue(char.Level),
	}

	if int(creatureTpl.Catchable) != 1 {
		return baseResult
	}

	if creatureLevel <= 0 {
		creatureLevel = int(creatureTpl.UseLv)
	}
	if creatureLevel > char.Level+5 {
		return baseResult
	}

	hasCapacity, err := h.service.petService.HasPetCapacity(context.Background(), charID, 1)
	if err != nil || !hasCapacity {
		return baseResult
	}

	rate := calculateCatchRate(char.Level, creatureLevel, currentHP, maxHP)
	baseResult.Rate = rate
	if rate <= 0 {
		return baseResult
	}
	if rand.Intn(100) >= rate {
		return baseResult
	}

	petEntity, err := h.service.petService.ContractPet(context.Background(), charID, int(creatureEntityID))
	if err != nil {
		if h.service.logger != nil {
			h.service.logger.Warn("Catch pet contract failed",
				zap.Int64("character_id", charID),
				zap.Int64("creature_id", creatureEntityID),
				zap.Error(err))
		}
		return baseResult
	}

	baseResult.Success = true
	baseResult.PetID = petEntity.ID
	return baseResult
}

func calculateCatchRate(characterLevel int, creatureLevel int, currentHP int, maxHP int) int {
	if maxHP <= 0 {
		return 0
	}

	hpRatio := float64(currentHP) / float64(maxHP)
	if hpRatio < 0 {
		hpRatio = 0
	}
	if hpRatio > 1 {
		hpRatio = 1
	}

	missingHPRatio := 1 - hpRatio
	baseRate := 20 + int(math.Round(missingHPRatio*65))

	levelDelta := characterLevel - creatureLevel
	switch {
	case levelDelta >= 0:
		baseRate += minCatchRateBonus(levelDelta)
	default:
		baseRate -= minCatchRateBonus(-levelDelta) * 2
	}

	if baseRate < 5 {
		return 5
	}
	if baseRate > 95 {
		return 95
	}
	return baseRate
}

func minCatchRateBonus(delta int) int {
	if delta <= 0 {
		return 0
	}
	if delta > 5 {
		return 5
	}
	return delta
}

func maxCatchDisplayValue(level int) int {
	if level <= 0 {
		return 1
	}
	return level
}
