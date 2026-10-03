// Open-sourced by BaoLT

package character

import (
	"strconv"

	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"
)

func (h *Handler) GetFinalPraDef(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	char, err := h.characterFromContext(ctx)
	if err != nil {
		return nil, err
	}

	value := h.aggregatedRateProp(ctx, char, "finalPraDef", char.FinalPraDef)
	if len(args) >= 1 {
		if key, ok := args[0].(string); ok && key != "" {
			return map[string]interface{}{"key": key, "value": value}, nil
		}
	}
	return value, nil
}

func (h *Handler) FinalPraMagDef(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	char, err := h.characterFromContext(ctx)
	if err != nil {
		return nil, err
	}

	value := h.aggregatedRateProp(ctx, char, "finalPraMagDef", char.FinalPraMagDef)
	if len(args) >= 1 {
		if key, ok := args[0].(string); ok && key != "" {
			return map[string]interface{}{"key": key, "value": value}, nil
		}
	}
	return value, nil
}

func (h *Handler) aggregatedRateProp(ctx *rtmp.RPCContext, char *domainchar.Character, key string, fallback float64) float64 {
	if h.itemService == nil {
		return fallback
	}
	h.itemService.ApplyCharacterElementState(ctx.Context, char)
	h.itemService.ApplyCharacterMakerSetState(ctx.Context, char)
	bonuses := h.itemService.AggregateEquipmentStats(ctx.Context, char.ID)
	props := h.charService.BuildViewPropertiesWithEquipment(char, bonuses)
	if v, ok := props[key]; ok {
		if f, ok := ratePropFloat(v); ok {
			return f
		}
	}
	return fallback
}

func ratePropFloat(v interface{}) (float64, bool) {
	switch typed := v.(type) {
	case float64:
		return typed, true
	case float32:
		return float64(typed), true
	case int:
		return float64(typed), true
	case int64:
		return float64(typed), true
	case string:
		f, err := strconv.ParseFloat(typed, 64)
		return f, err == nil
	}
	return 0, false
}

func (h *Handler) characterFromContext(ctx *rtmp.RPCContext) (*domainchar.Character, error) {
	charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	return h.charService.GetByID(ctx.Context, charID)
}
