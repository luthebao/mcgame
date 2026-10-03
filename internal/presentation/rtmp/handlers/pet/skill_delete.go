// Open-sourced by BaoLT

package pet

import (
	"errors"

	apppet "mcgame-server/internal/application/pet"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"

	"go.uber.org/zap"
)

func (h *Handler) BindedPetByPlayer(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
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

	p, err := h.petService.BindPet(ctx.Context, characterID, petID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	_ = ctx.Connection.SendCallback("onUpdatePet", float64(p.ID), "binded", float64(1))

	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) PetDelSkill(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if err := requireArgs(args, 3); err != nil {
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

	passHash, ok := args[2].(string)
	if !ok || passHash == "" {
		return map[string]interface{}{"success": false}, nil
	}

	petData, err := h.petService.GetPetDetail(ctx.Context, characterID, petID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}
	if !petData.IsBound() {
		_ = ctx.Connection.SendCallback("onSystemSay", "Phải khóa pet mới xóa được")
		return map[string]interface{}{"success": false}, nil
	}

	if err := rtmputils.VerifySecondaryPassword(ctx.Context, h.accountRepo, ctx.AccountID, passHash); err != nil {
		if notifyErr := rtmputils.NotifySecondaryPasswordFailure(ctx.Connection); notifyErr != nil && h.logger != nil {
			h.logger.Error("PetDelSkill: failed to notify client about secondary password failure", zap.Error(notifyErr))
		}
		return map[string]interface{}{"success": false}, nil
	}

	result, err := h.petService.DeletePetSkill(ctx.Context, characterID, petID, slot)
	if err != nil {
		if errors.Is(err, apppet.ErrPetMustBeBoundForSkillDelete) {
			_ = ctx.Connection.SendCallback("onSystemSay", "Phải khóa pet mới xóa được")
			return map[string]interface{}{"success": false}, nil
		}
		if errors.Is(err, apppet.ErrPetSkillDeleteItemRequired) {
			return map[string]interface{}{"success": false}, nil
		}
		return rtmp.ErrorToResponse(err), nil
	}

	if err := rtmputils.CacheSecondaryPassword(ctx.Connection, passHash); err != nil && h.logger != nil {
		h.logger.Error("PetDelSkill: failed to sync client password", zap.Error(err))
	}

	if result.ItemDeleted {
		_ = ctx.Connection.SendCallback("onDelCharactorSlot", float64(result.ConsumedItemID), float64(result.ConsumedItemSID))
	} else {
		_ = ctx.Connection.SendCallback("onUpChaSlotStackNum", float64(result.ConsumedItemID), float64(result.RemainingStack), float64(result.ConsumedItemSID))
	}
	_ = ctx.Connection.SendCallback("onUpdatePet", float64(result.Pet.ID), result.SlotKey, float64(0))
	sendPetPropRefresh(ctx, result.Pet)

	return map[string]interface{}{"success": true}, nil
}
