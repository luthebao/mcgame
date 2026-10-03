// Open-sourced by BaoLT

// Activity offline-exp handlers implement AutoExpPanel character and pet claims.
package activity

import (
	"errors"
	"fmt"
	"strconv"

	appactivity "mcgame-server/internal/application/activity"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/infrastructure/rtmp"
)

func (h *Handler) GetOfflineExp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "GetOfflineExp")
	if err != nil {
		return nil, err
	}
	if h.offlineService == nil {
		return float64(-1), nil
	}
	if len(args) < 2 {
		return float64(-1), nil
	}

	mode, ok := parseIntArg(args[0])
	if !ok {
		return float64(-1), nil
	}
	hours, ok := parseFloatArg(args[1])
	if !ok {
		return float64(-1), nil
	}

	result, err := h.offlineService.ClaimCharacterExp(ctx.Context, characterID, connectionOfflineSeconds(ctx), mode, hours)
	if err != nil {
		return mapOfflineDelegationError(err), nil
	}

	if ctx.Connection != nil {
		ctx.Connection.SetOfflineSeconds(result.RemainingSeconds)
	}
	h.sendOfflineCharacterExpRefresh(ctx, result.Character, result.LeveledUp)
	if result.LeveledUp && h.eventBus != nil && result.Character != nil {
		h.eventBus.EmitLevelUp(ctx.Context, characterID, result.OldLevel, result.Character.Level)
	}

	return float64(1), nil
}

func (h *Handler) GetPetOfflineExp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "GetPetOfflineExp")
	if err != nil {
		return nil, err
	}
	if h.offlineService == nil {
		return float64(-1), nil
	}
	if len(args) < 2 {
		return float64(-1), nil
	}

	mode, ok := parseIntArg(args[0])
	if !ok {
		return float64(-1), nil
	}
	hours, ok := parseFloatArg(args[1])
	if !ok {
		return float64(-1), nil
	}

	result, err := h.offlineService.ClaimPetExp(ctx.Context, characterID, connectionOfflineSeconds(ctx), mode, hours)
	if err != nil {
		return mapOfflineDelegationError(err), nil
	}

	if ctx.Connection != nil {
		ctx.Connection.SetOfflineSeconds(result.RemainingSeconds)
	}
	h.sendOfflineCurrencyRefresh(ctx, characterID, result.CurrencyKey, result.CurrencyDelta, result.CurrencyTotal)
	h.sendOfflinePetRefresh(ctx, result.Pet, result.LeveledUp)

	return float64(2), nil
}

func (h *Handler) sendOfflineCharacterExpRefresh(ctx *rtmp.RPCContext, char interface{ ToDTO() map[string]interface{} }, leveledUp bool) {
	if ctx == nil || ctx.Connection == nil || char == nil {
		return
	}
	dto := char.ToDTO()
	expSkill, ok := dto["expSkill"]
	if !ok {
		expSkill = dto["exp"]
	}
	_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{"expSkill": expSkill})
	if !leveledUp {
		return
	}

	level := 0
	switch typed := dto["level"].(type) {
	case int:
		level = typed
	case int64:
		level = int(typed)
	case float64:
		level = int(typed)
	}

	attrPoints := "0"
	switch typed := dto["attLastPoint"].(type) {
	case int:
		attrPoints = strconv.Itoa(typed)
	case int64:
		attrPoints = strconv.FormatInt(typed, 10)
	case float64:
		attrPoints = strconv.Itoa(int(typed))
	}

	id := ""
	switch typed := dto["id"].(type) {
	case int64:
		id = strconv.FormatInt(typed, 10)
	case int:
		id = strconv.Itoa(typed)
	case float64:
		id = strconv.FormatInt(int64(typed), 10)
	case string:
		id = typed
	}

	_ = ctx.Connection.SendCallback("onPlayerLevelUp", map[string]interface{}{
		"id":         id,
		"exp":        dto["exp"],
		"lp":         attrPoints,
		"maxMovePnt": 110,
		"maxAct":     1160,
		"maxVigor":   110,
		"level":      level,
	})
	_ = ctx.Connection.SendCallback("lvUp", map[string]interface{}{}, 1, nil)
}

func (h *Handler) sendOfflinePetRefresh(ctx *rtmp.RPCContext, pet *domainpet.Pet, leveledUp bool) {
	if ctx == nil || ctx.Connection == nil || pet == nil {
		return
	}

	_ = ctx.Connection.SendCallback("onUpdatePet", float64(pet.ID), "exp", fmt.Sprintf("%d", pet.ClientExperience()))
	if leveledUp {
		_ = ctx.Connection.SendCallback("onUpdatePet", float64(pet.ID), "level", fmt.Sprintf("%d", pet.Level))
	}

	petDTO := pet.ToDTO()
	if data, ok := petDTO["data"].(map[string]interface{}); ok {
		if prop, ok := data["property"]; ok {
			_ = ctx.Connection.SendCallback("onRefreshPetProp", map[string]interface{}{
				"id": pet.ID,
				"s":  prop,
			})
		}
	}
}

func (h *Handler) sendOfflineCurrencyRefresh(ctx *rtmp.RPCContext, characterID int64, currencyKey string, delta int64, total int64) {
	if ctx == nil || ctx.Connection == nil || currencyKey == "" {
		return
	}
	_ = ctx.Connection.SendCallback("onAddMoney", float64(characterID), currencyKey, float64(delta), float64(total))
	_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{currencyKey: total})
}

func mapOfflineDelegationError(err error) float64 {
	switch {
	case errors.Is(err, appactivity.ErrOfflineDelegationLevelTooLow):
		return float64(-2)
	case errors.Is(err, appactivity.ErrOfflineDelegationSilverMissing):
		return float64(-3)
	case errors.Is(err, appactivity.ErrOfflineDelegationGoldMissing):
		return float64(-4)
	case errors.Is(err, appactivity.ErrOfflineDelegationNoPet):
		return float64(-5)
	case errors.Is(err, appactivity.ErrOfflineDelegationPetTooHigh):
		return float64(-6)
	case errors.Is(err, appactivity.ErrOfflineDelegationPetNotBound):
		return float64(-8)
	case errors.Is(err, appactivity.ErrOfflineDelegationPetExpCapped):
		return float64(-9)
	default:
		return float64(-1)
	}
}

func connectionOfflineSeconds(ctx *rtmp.RPCContext) int64 {
	if ctx == nil || ctx.Connection == nil {
		return 0
	}
	return ctx.Connection.GetOfflineSeconds()
}

func parseFloatArg(arg interface{}) (float64, bool) {
	switch value := arg.(type) {
	case float64:
		return value, true
	case float32:
		return float64(value), true
	case int:
		return float64(value), true
	case int64:
		return float64(value), true
	default:
		return 0, false
	}
}
