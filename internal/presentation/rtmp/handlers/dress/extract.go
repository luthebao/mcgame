// Open-sourced by BaoLT

// Recipe extract & transform handlers for the Dress Panel.
package dress

import (
	"context"

	appdress "mcgame-server/internal/application/dress"
	"mcgame-server/internal/infrastructure/rtmp"
)

func dropToPlanMap(d appdress.RecipeDrop) map[string]interface{} {
	return map[string]interface{}{
		"recipeId": d.RecipeID,
		"num":      d.Num,
	}
}

func planDropsToArr(drops []appdress.RecipeDrop) []interface{} {
	out := make([]interface{}, 0, len(drops))
	for _, d := range drops {
		out = append(out, dropToPlanMap(d))
	}
	return out
}

func dropToProduceMap(d appdress.RecipeDrop) map[string]interface{} {
	return map[string]interface{}{
		"recipeId":  d.RecipeID,
		"recipeNum": d.Num,
	}
}

func produceDropsToArr(drops []appdress.RecipeDrop) []interface{} {
	out := make([]interface{}, 0, len(drops))
	for _, d := range drops {
		out = append(out, dropToProduceMap(d))
	}
	return out
}

func (h *Handler) FreeExtractRecipe(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, nil
	}
	info, drop, _, err := h.service.FreeExtract(context.Background(), charID)
	if err != nil {
		return h.handleServiceError("freeExtractRecipe", charID, err)
	}
	return map[string]interface{}{
		"dressInfo": info,
		"recipeId":  drop.RecipeID,
		"recipeNum": drop.Num,
	}, nil
}

func (h *Handler) GoldExtractRecipe(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, nil
	}
	info, drop, spend, err := h.service.GoldExtract(context.Background(), charID)
	if err != nil {
		return h.handleServiceError("goldExtractRecipe", charID, err)
	}
	sendSpendNotices(ctx.Connection, spend)
	return map[string]interface{}{
		"dressInfo": info,
		"recipeId":  drop.RecipeID,
		"recipeNum": drop.Num,
	}, nil
}

func (h *Handler) TenExtractRecipe(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, nil
	}
	info, drops, spend, err := h.service.TenExtract(context.Background(), charID)
	if err != nil {
		return h.handleServiceError("tenExtractRecipe", charID, err)
	}
	sendSpendNotices(ctx.Connection, spend)
	return map[string]interface{}{
		"dressInfo": info,
		"planArr":   planDropsToArr(drops),
	}, nil
}

func (h *Handler) SsdExtractRecipe(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, nil
	}
	info, drop, err := h.service.SsdExtract(context.Background(), charID)
	if err != nil {
		return h.handleServiceError("ssdExtractRecipe", charID, err)
	}
	return map[string]interface{}{
		"dressInfo": info,
		"recipeId":  drop.RecipeID,
		"recipeNum": drop.Num,
	}, nil
}

func (h *Handler) LargeSsdExtractRecipe(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, nil
	}
	info, drops, err := h.service.LargeSsdExtract(context.Background(), charID)
	if err != nil {
		return h.handleServiceError("largessdExtractRecipe", charID, err)
	}
	return map[string]interface{}{
		"dressInfo": info,
		"planArr":   planDropsToArr(drops),
	}, nil
}

func (h *Handler) MakeAllChips(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, nil
	}

	info, converted, err := h.service.MakeAllChips(context.Background(), charID)
	if err != nil {
		return h.handleServiceError("makeAllChips", charID, err)
	}

	if converted > 0 && ctx != nil && ctx.Connection != nil {
		_ = ctx.Connection.SendCallback("onMidNote", "Ghép thành công")
	}

	return info, nil
}

func (h *Handler) TransformRecipe(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, nil
	}
	if len(args) < 1 {
		return nil, nil
	}
	ids := toIDArray(args[0])
	info, drop, err := h.service.TransformRecipe(context.Background(), charID, ids)
	if err != nil {
		return h.handleServiceError("transformRecipe", charID, err)
	}
	return map[string]interface{}{
		"dressInfo": info,
		"recipeId":  drop.RecipeID,
		"recipeNum": drop.Num,
	}, nil
}

func (h *Handler) TransformAllRecipe(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, nil
	}
	if len(args) < 1 {
		return nil, nil
	}
	ids := toIDArray(args[0])
	info, drops, err := h.service.TransformAllRecipe(context.Background(), charID, ids)
	if err != nil {
		return h.handleServiceError("transformAllRecipe", charID, err)
	}
	return map[string]interface{}{
		"dressInfo":  info,
		"produceArr": produceDropsToArr(drops),
	}, nil
}
