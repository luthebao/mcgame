// Open-sourced by BaoLT

package pet

import (
	"strconv"

	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func requireArgs(args []interface{}, size int) error {
	if len(args) < size {
		return pkgerrors.ErrInvalidArgs
	}
	return nil
}

func currentCharacterID(ctx *rtmp.RPCContext) (int64, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return 0, pkgerrors.ErrUnauthorized
	}
	return characterID, nil
}

func parseInt64Arg(arg interface{}) (int64, error) {
	switch v := arg.(type) {
	case float64:
		return int64(v), nil
	case int64:
		return v, nil
	case int:
		return int64(v), nil
	case string:
		parsed, err := strconv.ParseInt(v, 10, 64)
		if err != nil {
			return 0, pkgerrors.ErrInvalidArgs
		}
		return parsed, nil
	default:
		return 0, pkgerrors.ErrInvalidArgs
	}
}

func parseIntArg(arg interface{}) (int, error) {
	switch v := arg.(type) {
	case float64:
		return int(v), nil
	case int:
		return v, nil
	case int64:
		return int(v), nil
	default:
		return 0, pkgerrors.ErrInvalidArgs
	}
}

func parseBoolArg(arg interface{}) bool {
	switch v := arg.(type) {
	case bool:
		return v
	case float64:
		return v != 0
	case int:
		return v != 0
	case int64:
		return v != 0
	default:
		return false
	}
}

func parseInt64SliceArg(arg interface{}) []int64 {
	values := make([]int64, 0)
	items, ok := arg.([]interface{})
	if !ok {
		return values
	}

	for _, item := range items {
		if value, err := parseInt64Arg(item); err == nil {
			values = append(values, value)
		}
	}

	return values
}

func petDTOData(p *domainpet.Pet) map[string]interface{} {
	petDTO := p.ToDTO()
	if data, ok := petDTO["data"].(map[string]interface{}); ok {
		return data
	}
	return petDTO
}

func sendPetPropRefresh(ctx *rtmp.RPCContext, p *domainpet.Pet) {
	petDTO := petDTOData(p)
	if prop, ok := petDTO["property"]; ok {
		_ = ctx.Connection.SendCallback("onRefreshPetProp", map[string]interface{}{
			"id": p.ID,
			"s":  prop,
		})
	}
}

func sendPetAttributeRefresh(ctx *rtmp.RPCContext, p *domainpet.Pet) {
	if ctx == nil || ctx.Connection == nil || p == nil {
		return
	}

	petDTO := petDTOData(p)
	for _, key := range []string{"attLastPoint", "aptStrengthEx", "aptAgilityEx", "aptStaminaEx", "aptIntelligenceEx", "aptEnergyEx"} {
		value, ok := petDTO[key]
		if !ok {
			continue
		}
		_ = ctx.Connection.SendCallback("onUpdatePet", float64(p.ID), key, value)
	}

	if prop, ok := petDTO["property"]; ok {
		_ = ctx.Connection.SendCallback("onRefreshPetProp", map[string]interface{}{
			"id": p.ID,
			"s":  prop,
		})
	}
}

func (h *Handler) notifyPetHidden(ctx *rtmp.RPCContext, characterID int64) {
	h.sendPetSceneCallback(ctx, "onCancelPet", float64(characterID))
}

func (h *Handler) notifyPetShown(ctx *rtmp.RPCContext, p *domainpet.Pet) {
	if p == nil {
		h.logger.Warn("Skipping onCreatePet callback for nil pet")
		return
	}

	petData := p.ToSceneDTO()
	if _, ok := petData["resCode"]; !ok {
		h.logger.Warn("Pet scene payload missing resCode",
			zap.Int64("character_id", characterIDFromPet(p)),
			zap.Int64("pet_id", p.ID))
	}

	h.sendPetSceneCallback(ctx, "onCreatePet", map[string]interface{}{
		"cid":     float64(characterIDFromPet(p)),
		"petData": petData,
	})
}

func (h *Handler) sendPetSceneCallback(ctx *rtmp.RPCContext, callback string, args ...interface{}) {
	if ctx == nil || ctx.Connection == nil {
		return
	}

	mapID, _ := ctx.Connection.GetSceneInfo()
	channelID := ctx.Connection.GetChannelID()

	if h.sceneManager != nil && channelID > 0 && mapID > 0 {
		h.sceneManager.BroadcastToScene(channelID, mapID, 0, callback, args...)
		return
	}

	if err := ctx.Connection.SendCallback(callback, args...); err != nil {
		h.logger.Warn("Failed to send pet scene callback",
			zap.String("callback", callback),
			zap.Error(err))
	}
}

func characterIDFromPet(p *domainpet.Pet) int64 {
	if p == nil {
		return 0
	}
	return p.CharacterID
}
