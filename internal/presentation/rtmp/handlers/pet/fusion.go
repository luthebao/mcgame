// Open-sourced by BaoLT

package pet

import (
	"errors"

	apppet "mcgame-server/internal/application/pet"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) PetJoin(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if err := requireArgs(args, 2); err != nil {
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
	materialPetID, err := parseInt64Arg(args[1])
	if err != nil {
		return nil, err
	}

	p, err := h.petService.FusePets(ctx.Context, characterID, mainPetID, materialPetID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Pets fused",
		zap.Int64("character_id", characterID),
		zap.Int64("main_pet_id", mainPetID),
		zap.Int64("material_pet_id", materialPetID))

	return map[string]interface{}{
		"success": true,
		"pet":     p.ToDetailDTO(),
	}, nil
}

func (h *Handler) SeniorPetJoin(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if err := requireArgs(args, 2); err != nil {
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
	materialPetIDs := parseInt64SliceArg(args[1])

	p, err := h.petService.SeniorFusePets(ctx.Context, characterID, mainPetID, materialPetIDs)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Senior pet fusion completed",
		zap.Int64("character_id", characterID),
		zap.Int64("main_pet_id", mainPetID),
		zap.Int("material_count", len(materialPetIDs)))

	return map[string]interface{}{
		"success": true,
		"pet":     p.ToDetailDTO(),
	}, nil
}

func (h *Handler) PetXd(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
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
	cultivationType, err := parseIntArg(args[1])
	if err != nil {
		return nil, err
	}

	p, err := h.petService.Cultivate(ctx.Context, characterID, petID, cultivationType)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Pet cultivation performed",
		zap.Int64("character_id", characterID),
		zap.Int64("pet_id", petID),
		zap.Int("cultivation_type", cultivationType))

	return map[string]interface{}{
		"success": true,
		"pet":     p.ToDetailDTO(),
	}, nil
}

func (h *Handler) PetPzXsd(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
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
	itemID, err := parseIntArg(args[1])
	if err != nil {
		return nil, err
	}

	p, err := h.petService.UseCultivationItem(ctx.Context, characterID, petID, itemID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Pet cultivation item used",
		zap.Int64("character_id", characterID),
		zap.Int64("pet_id", petID),
		zap.Int("item_id", itemID))

	return map[string]interface{}{
		"success": true,
		"pet":     p.ToDetailDTO(),
	}, nil
}

func (h *Handler) PetXsd(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
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

	p, err := h.petService.PetXsd(ctx.Context, characterID, petID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Pet XSD performed",
		zap.Int64("character_id", characterID),
		zap.Int64("pet_id", petID))

	return map[string]interface{}{
		"success": true,
		"pet":     p.ToDetailDTO(),
	}, nil
}

func (h *Handler) PetBook(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if err := requireArgs(args, 2); err != nil {
		return map[string]interface{}{"f": apppet.PetSkillBookFailureInput}, nil
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	petID, err := parseInt64Arg(args[0])
	if err != nil {
		return map[string]interface{}{"f": apppet.PetSkillBookFailureInput}, nil
	}
	skillBookItemID, err := parseInt64Arg(args[1])
	if err != nil {
		return map[string]interface{}{"f": apppet.PetSkillBookFailureInput}, nil
	}

	result, err := h.petService.LearnSkillFromBook(ctx.Context, characterID, petID, skillBookItemID)
	if err != nil {
		var bookErr *apppet.PetSkillBookError
		if errors.As(err, &bookErr) {
			response := map[string]interface{}{
				"f": bookErr.Failure,
			}
			if bookErr.Failure == apppet.PetSkillBookFailureLearn {
				response["rf"] = false
			}
			if bookErr.Remaining >= 0 {
				response["n"] = bookErr.Remaining
			}
			return response, nil
		}
		return rtmp.ErrorToResponse(err), nil
	}

	_ = ctx.Connection.SendCallback("onUpdatePet", float64(result.Pet.ID), result.SlotKey, float64(result.SkillID))
	sendPetPropRefresh(ctx, result.Pet)

	h.logger.Info("Pet learned skill from book",
		zap.Int64("character_id", characterID),
		zap.Int64("pet_id", petID),
		zap.Int64("skill_book_item_id", skillBookItemID),
		zap.Int("skill_id", result.SkillID),
		zap.String("slot", result.SlotKey))

	return map[string]interface{}{
		"f":  1,
		"rf": true,
		"n":  result.RemainingStack,
	}, nil
}
