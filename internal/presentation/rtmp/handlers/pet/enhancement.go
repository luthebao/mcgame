// Open-sourced by BaoLT

package pet

import (
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"

	"go.uber.org/zap"
)

func (h *Handler) PetEat(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if err := requireArgs(args, 6); err != nil {
		return nil, err
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	mainPetID, err := parseInt64Arg(args[0])
	if err != nil {
		return nil, err
	}
	costPetID, err := parseInt64Arg(args[1])
	if err != nil {
		return nil, err
	}
	useLuckItem := parseBoolArg(args[2])
	luckNum, err := parseIntArg(args[3])
	if err != nil {
		luckNum = 0
	}
	aptValue, err := parseIntArg(args[4])
	if err != nil {
		return nil, err
	}
	aptType := domainpet.AptitudeType(aptValue)
	passHash, ok := args[5].(string)
	if !ok || passHash == "" {
		h.logger.Warn("PetEat: missing secondary password", zap.Int64("character_id", characterID))
		return map[string]interface{}{"success": false}, nil
	}

	if err := rtmputils.VerifySecondaryPassword(ctx.Context, h.accountRepo, ctx.AccountID, passHash); err != nil {
		h.logger.Warn("PetEat: secondary password verification failed", zap.Int64("character_id", characterID), zap.Error(err))
		if notifyErr := rtmputils.NotifySecondaryPasswordFailure(ctx.Connection); notifyErr != nil {
			h.logger.Error("PetEat: failed to notify client about secondary password failure", zap.Error(notifyErr))
		}
		return map[string]interface{}{"success": false}, nil
	}

	p, err := h.petService.PetEat(ctx.Context, characterID, mainPetID, costPetID, useLuckItem, luckNum, aptType)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Pet eat completed",
		zap.Int64("character_id", characterID),
		zap.Int64("main_pet_id", mainPetID),
		zap.Int64("cost_pet_id", costPetID))

	if err := rtmputils.CacheSecondaryPassword(ctx.Connection, passHash); err != nil {
		h.logger.Error("PetEat: failed to sync client password", zap.Error(err))
	}

	return map[string]interface{}{
		"success": true,
		"pet":     p.ToDTO(),
	}, nil
}

func (h *Handler) EnsurePetEat(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) PetStar(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if err := requireArgs(args, 1); err != nil {
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

	p, err := h.petService.UpgradeStar(ctx.Context, characterID, petID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Pet star upgraded",
		zap.Int64("character_id", characterID),
		zap.Int64("pet_id", petID),
		zap.Int("stars", p.UpgradeNum))

	return map[string]interface{}{
		"success": true,
		"pet":     p.ToDTO(),
	}, nil
}

func (h *Handler) ContractPet(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if err := requireArgs(args, 1); err != nil {
		return nil, err
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	templateID, err := parseIntArg(args[0])
	if err != nil {
		return nil, err
	}

	p, err := h.petService.ContractPet(ctx.Context, characterID, templateID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Pet contracted",
		zap.Int64("character_id", characterID),
		zap.Int("template_id", templateID),
		zap.Int64("pet_id", p.ID))

	return map[string]interface{}{
		"success": true,
		"pet":     p.ToDTO(),
	}, nil
}

func (h *Handler) PetStarClear(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if err := requireArgs(args, 1); err != nil {
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

	p, err := h.petService.ClearStars(ctx.Context, characterID, petID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Pet stars cleared",
		zap.Int64("character_id", characterID),
		zap.Int64("pet_id", petID))

	return map[string]interface{}{
		"success": true,
		"pet":     p.ToDTO(),
	}, nil
}

func (h *Handler) ToPetFeather(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if err := requireArgs(args, 1); err != nil {
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

	materialIDs := []int64{}
	if len(args) >= 2 {
		materialIDs = parseInt64SliceArg(args[1])
	}

	p, err := h.petService.FeatherUpgrade(ctx.Context, characterID, petID, materialIDs)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Pet feather upgrade started",
		zap.Int64("character_id", characterID),
		zap.Int64("pet_id", petID))

	return map[string]interface{}{
		"success": true,
		"pet":     p.ToDetailDTO(),
	}, nil
}

func (h *Handler) ToPetFeatherNextStep(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if err := requireArgs(args, 1); err != nil {
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

	p, err := h.petService.FeatherNextStep(ctx.Context, characterID, petID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Pet feather upgrade completed",
		zap.Int64("character_id", characterID),
		zap.Int64("pet_id", petID))

	return map[string]interface{}{
		"success": true,
		"pet":     p.ToDetailDTO(),
	}, nil
}

func (h *Handler) ToPetEnvolution(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if err := requireArgs(args, 1); err != nil {
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

	p, err := h.petService.EvolvePet(ctx.Context, characterID, petID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Pet evolved",
		zap.Int64("character_id", characterID),
		zap.Int64("pet_id", petID),
		zap.Int("evolution_level", p.EvolutionLv))

	return map[string]interface{}{
		"success": true,
		"pet":     p.ToDetailDTO(),
	}, nil
}
