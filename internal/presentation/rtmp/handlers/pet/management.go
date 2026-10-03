// Open-sourced by BaoLT

package pet

import (
	"fmt"
	"strconv"

	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/infrastructure/rtmp"
	"mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) InitViewPetMngP(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	pets, err := h.petService.GetPetList(ctx.Context, characterID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	petDTOs := make(map[string]interface{}, len(pets))
	for _, p := range pets {
		if p == nil {
			continue
		}
		petDTOs[strconv.FormatInt(p.ID, 10)] = p.ToDTO()
	}

	if activePet, err := h.petService.GetActivePet(ctx.Context, characterID); err == nil && activePet != nil {
		sendPetPropRefresh(ctx, activePet)
	}

	return petDTOs, nil
}

func (h *Handler) PetOpenSlot(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	newSlotCount, cost, currencyType, remaining, err := h.petService.OpenPetSlot(ctx.Context, characterID)
	if err != nil {
		h.logger.Error("Failed to open pet slot", zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}

	_ = ctx.Connection.SendCallback("onMinusMoney", float64(characterID), currencyType, float64(cost), float64(remaining))
	_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{"petMaxNum": newSlotCount})
	_ = ctx.Connection.SendCallback("onSystemSay", fmt.Sprintf("Mất %d kim phiếu", cost))

	h.logger.Info("Pet slot opened",
		zap.Int64("character_id", characterID),
		zap.Int("new_slots", newSlotCount))

	return map[string]interface{}{
		"success": true,
		"ps":      newSlotCount,
	}, nil
}

func (h *Handler) GetPetDetailData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if err := requireArgs(args, 2); err != nil {
		return nil, err
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	petID, err := parseInt64Arg(args[1])
	if err != nil {
		return nil, err
	}

	p, err := h.petService.GetPetDetail(ctx.Context, characterID, petID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Debug("Pet detail retrieved",
		zap.Int64("character_id", characterID),
		zap.Int64("pet_id", petID))

	return p.ToDetailDTO(), nil
}

func (h *Handler) StartPetFollow(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
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

	currentFollowID := int64(0)
	if len(args) >= 2 {
		if value, err := parseInt64Arg(args[1]); err == nil {
			currentFollowID = value
		}
	}

	p, err := h.petService.StartFollow(ctx.Context, characterID, petID, currentFollowID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Pet follow started",
		zap.Int64("character_id", characterID),
		zap.Int64("pet_id", petID))

	h.notifyPetHidden(ctx, characterID)
	h.notifyPetShown(ctx, p)
	sendPetPropRefresh(ctx, p)

	return map[string]interface{}{
		"success": true,
		"pet":     p.ToDTO(),
	}, nil
}

func (h *Handler) CancelPetFollow(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
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

	if petID <= 0 {
		return map[string]interface{}{"success": true}, nil
	}

	if err := h.petService.CancelFollow(ctx.Context, characterID, petID); err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Pet follow cancelled",
		zap.Int64("character_id", characterID),
		zap.Int64("pet_id", petID))

	h.notifyPetHidden(ctx, characterID)

	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) ChangePetName(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
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
	newName, ok := args[1].(string)
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	p, err := h.petService.ChangeName(ctx.Context, characterID, petID, newName)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Pet name changed",
		zap.Int64("character_id", characterID),
		zap.Int64("pet_id", petID),
		zap.String("new_name", newName))

	if err := ctx.Connection.SendCallback("onUpdatePet", petID, "petName", newName); err != nil {
		h.logger.Warn("Failed to send onUpdatePet callback", zap.Error(err))
	}

	return map[string]interface{}{
		"success": true,
		"pet":     p.ToDTO(),
	}, nil
}

func (h *Handler) ChangePetProperty(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
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

	obj := utils.NormalizeAMFMap(args[1])
	if obj == nil {
		h.logger.Warn("changePetProperty: invalid arg type", zap.Any("type", args[1]))
		return nil, pkgerrors.ErrInvalidArgs
	}

	addStr := utils.ParseStatString(obj["addStrength"])
	addAgi := utils.ParseStatString(obj["addAgility"])
	addSta := utils.ParseStatString(obj["addStamina"])
	addInt := utils.ParseStatString(obj["addIntelligence"])
	addEng := utils.ParseStatString(obj["addEnergy"])
	total := addStr + addAgi + addSta + addInt + addEng
	if total <= 0 {
		return nil, nil
	}

	p, err := h.petService.GetPetDetail(ctx.Context, characterID, petID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	if p.AllocateAttributePoints(addStr, addAgi, addSta, addInt, addEng) == 0 {
		h.logger.Warn("changePetProperty: not enough points",
			zap.Int64("pet_id", petID),
			zap.Int("requested", total),
			zap.Int("available", p.AttrPoints))
		if ctx.Connection != nil {
			_ = ctx.Connection.SendCallback("onSystemMidMsgOrNote", "Không đủ điểm thuộc tính!")
		}
		return nil, nil
	}

	if err := h.petService.Save(ctx.Context, p); err != nil {
		h.logger.Error("changePetProperty: failed to save", zap.Error(err))
		return nil, err
	}

	sendPetAttributeRefresh(ctx, p)

	h.logger.Info("changePetProperty applied",
		zap.Int64("character_id", characterID),
		zap.Int64("pet_id", petID),
		zap.Int("strength", addStr),
		zap.Int("agility", addAgi),
		zap.Int("stamina", addSta),
		zap.Int("intelligence", addInt),
		zap.Int("energy", addEng),
		zap.Int("remaining", p.AttrPoints))

	return nil, nil
}

func (h *Handler) ChangePetState(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
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
	newState, err := parseIntArg(args[1])
	if err != nil {
		return nil, err
	}

	h.logger.Info("ChangePetState called",
		zap.Int64("character_id", characterID),
		zap.Int64("pet_id", petID),
		zap.Int("new_state", newState))

	if newState != int(domainpet.PetStateBattle) && newState != int(domainpet.PetStateFollowing) && newState != int(domainpet.PetStateRest) {
		h.logger.Warn("Unknown pet state", zap.Int("state", newState))
		return nil, pkgerrors.ErrInvalidArgs
	}

	p, err := h.petService.ChangeState(ctx.Context, characterID, petID, newState)
	if err != nil {
		h.logger.Error("Failed to change pet state", zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}

	if p != nil {
		pets, listErr := h.petService.GetPetList(ctx.Context, characterID)
		if listErr != nil {
			h.logger.Warn("Failed to refresh pet list after ChangePetState",
				zap.Int64("character_id", characterID),
				zap.Error(listErr))
			pets = []*domainpet.Pet{p}
		}

		h.sendPetUpdates(ctx, buildPetStateUpdatesForChange(pets, p.ID))
		sendPetPropRefresh(ctx, p)
	}

	return nil, nil
}

type petUpdate struct {
	petID int64
	key   string
	value interface{}
}

func buildPetStateUpdatesForChange(pets []*domainpet.Pet, changedPetID int64) []petUpdate {
	updates := make([]petUpdate, 0, len(pets)+1)
	for _, candidate := range pets {
		if candidate == nil {
			continue
		}
		updates = append(updates, petUpdate{
			petID: candidate.ID,
			key:   "state",
			value: float64(candidate.ClientState()),
		})
		if candidate.ID == changedPetID && candidate.BindState() > 0 {
			updates = append(updates, petUpdate{
				petID: candidate.ID,
				key:   "binded",
				value: float64(candidate.BindState()),
			})
		}
	}
	return updates
}

func (h *Handler) sendPetUpdates(ctx *rtmp.RPCContext, updates []petUpdate) {
	for _, update := range updates {
		if err := ctx.Connection.SendCallback("onUpdatePet", float64(update.petID), update.key, update.value); err != nil {
			h.logger.Warn("Failed to send onUpdatePet callback",
				zap.Int64("pet_id", update.petID),
				zap.String("key", update.key),
				zap.Error(err))
		}
	}
}

func (h *Handler) BeginMounting(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
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

	p, err := h.petService.BeginMounting(ctx.Context, characterID, petID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	h.logger.Info("Pet mounting started",
		zap.Int64("character_id", characterID),
		zap.Int64("pet_id", petID))

	return map[string]interface{}{
		"success": true,
		"pet":     p.ToDTO(),
	}, nil
}
