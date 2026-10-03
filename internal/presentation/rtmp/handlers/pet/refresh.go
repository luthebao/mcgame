// Open-sourced by BaoLT

package pet

import (
	"fmt"

	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) FinalPraMagDefPet(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	h.logger.Debug("FinalPraMagDefPet called", zap.Int64("character_id", characterID))
	return h.followingPetPropValue(ctx, characterID, args, "finalPraMagDef")
}

func (h *Handler) GetFinalPraDefPet(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	h.logger.Debug("GetFinalPraDefPet called", zap.Int64("character_id", characterID))
	return h.followingPetPropValue(ctx, characterID, args, "finalPraDef")
}

func (h *Handler) followingPetPropValue(ctx *rtmp.RPCContext, characterID int64, args []interface{}, propKey string) (interface{}, error) {
	pet, err := h.petService.GetActivePet(ctx.Context, characterID)
	if err != nil {
		h.logger.Warn("Failed to get active pet stat",
			zap.Int64("character_id", characterID),
			zap.String("prop_key", propKey),
			zap.Error(err))
		return nil, err
	}
	if pet == nil {
		err = fmt.Errorf("active pet not found")
		fields := []zap.Field{
			zap.Int64("character_id", characterID),
			zap.String("prop_key", propKey),
			zap.Error(err),
		}

		pets, listErr := h.petService.GetPetList(ctx.Context, characterID)
		if listErr != nil {
			fields = append(fields, zap.Error(listErr))
		} else {
			fields = append(fields, zap.Any("pet_candidates", petFollowCandidates(pets)))
		}

		h.logger.Warn("Missing active pet stat source",
			fields...)
		return nil, err
	}

	pet.RecalculateStats()

	valueRaw, ok := pet.Property[propKey]
	if !ok {
		err = fmt.Errorf("pet property %s not found", propKey)
		h.logger.Warn("Missing pet property value",
			zap.Int64("character_id", characterID),
			zap.Int64("pet_id", pet.ID),
			zap.String("prop_key", propKey),
			zap.Error(err))
		return nil, err
	}

	value, ok := petPropFloatValue(valueRaw)
	if !ok {
		err = fmt.Errorf("pet property %s has invalid type %T", propKey, valueRaw)
		h.logger.Warn("Invalid pet property value",
			zap.Int64("character_id", characterID),
			zap.Int64("pet_id", pet.ID),
			zap.String("prop_key", propKey),
			zap.Any("value", valueRaw),
			zap.Error(err))
		return nil, err
	}

	if len(args) >= 1 {
		if key, ok := args[0].(string); ok && key != "" {
			return map[string]interface{}{"key": key, "value": value}, nil
		}
	}

	return value, nil
}

func petPropFloatValue(value interface{}) (float64, bool) {
	switch typed := value.(type) {
	case float64:
		return typed, true
	case float32:
		return float64(typed), true
	case int:
		return float64(typed), true
	case int64:
		return float64(typed), true
	case int32:
		return float64(typed), true
	default:
		return 0, false
	}
}

func petFollowCandidates(pets []*domainpet.Pet) []map[string]interface{} {
	candidates := make([]map[string]interface{}, 0, len(pets))
	for _, p := range pets {
		candidates = append(candidates, map[string]interface{}{
			"id":           p.ID,
			"is_following": p.IsFollowing,
			"state":        petPropertyIntValue(p.Property["state"]),
		})
	}
	return candidates
}

func petPropertyIntValue(value interface{}) interface{} {
	switch typed := value.(type) {
	case int:
		return typed
	case int32:
		return int(typed)
	case int64:
		return int(typed)
	case float64:
		return int(typed)
	default:
		return value
	}
}

func (h *Handler) DelPetByClient(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if err := requireArgs(args, 1); err != nil {
		return nil, err
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	argIndex := 0
	if args[0] == nil {
		if err := requireArgs(args, 2); err != nil {
			return nil, err
		}
		argIndex = 1
	}

	petID, err := parseInt64Arg(args[argIndex])
	if err != nil {
		h.logger.Warn("DelPetByClient: invalid petID type",
			zap.Any("arg", args[argIndex]),
			zap.String("type", fmt.Sprintf("%T", args[argIndex])))
		return nil, pkgerrors.ErrInvalidArgs
	}

	if argIndex+1 < len(args) {
		if password, ok := args[argIndex+1].(string); ok {
			if err := rtmputils.VerifySecondaryPassword(ctx.Context, h.accountRepo, ctx.AccountID, password); err != nil {
				h.logger.Warn("DelPetByClient: secondary password verification failed", zap.String("accountID", ctx.AccountID), zap.Error(err))
				if notifyErr := rtmputils.NotifySecondaryPasswordFailure(ctx.Connection); notifyErr != nil {
					h.logger.Error("DelPetByClient: failed to notify client about secondary password failure", zap.Error(notifyErr))
				}
				return nil, fmt.Errorf("Incorrect secondary password")
			}

			if err := rtmputils.CacheSecondaryPassword(ctx.Connection, password); err != nil {
				h.logger.Error("DelPetByClient: failed to sync client password", zap.Error(err))
			}
		}
	}

	h.logger.Info("Deleting pet",
		zap.Int64("character_id", characterID),
		zap.Int64("pet_id", petID))

	if err := h.petService.DeletePet(ctx.Context, characterID, petID); err != nil {
		h.logger.Error("Failed to delete pet", zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}

	if err := ctx.Connection.SendCallback("onDelPet", petID); err != nil {
		h.logger.Warn("Failed to send onDelPet callback", zap.Error(err))
	}

	return map[string]interface{}{"success": true}, nil
}
