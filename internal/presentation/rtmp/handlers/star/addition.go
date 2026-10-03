// Open-sourced by BaoLT

// AddStarAddition RPC handler.
// Args: starType (int), quantity (int), itemID (int64).
// Consumes `quantity` ITEM_TYPE_STAR_ADD (551) items, deducts bạc, rolls once
// against rate = min(BASIC_SUCCESS[tier]*quantity + ADD_SUCCESS[tier], 1.0).
// Mirrors StarAdditionPanel.as:651-700.
// On any outcome the server pushes onAddStarAddition with the consumed count
// so the client can decrement its bag stack.
package star

import (
	appstar "mcgame-server/internal/application/star"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) AddStarAddition(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("AddStarAddition called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	if h.service == nil {
		return errResponse("star service not configured"), nil
	}
	if len(args) < 3 {
		return errResponse("missing arguments"), nil
	}
	starType, err := parseIntArg(args[0])
	if err != nil {
		return errResponse("invalid starType argument"), nil
	}
	quantity, err := parseIntArg(args[1])
	if err != nil || quantity <= 0 {
		return errResponse("invalid quantity argument"), nil
	}
	if quantity > appstar.StarAdditionMaxQuantity {
		quantity = appstar.StarAdditionMaxQuantity
	}
	itemID := parseInt64Arg(args[2])
	if itemID <= 0 {
		return errResponse("invalid item id"), nil
	}
	charID, ok := characterID(ctx)
	if !ok {
		return errResponse("invalid character id"), nil
	}

	result, err := h.service.AddAddition(ctx.Context, charID, starType, quantity, itemID)
	if err != nil {
		h.logServiceError("addStarAddition", ctx, err)
		return false, nil
	}

	var slotRecord interface{}
	if result.Success {
		if slot := result.State[result.StarType]; slot != nil {
			slotRecord = map[string]interface{}{
				"tid":        slot.Tid,
				"finishDate": slot.FinishDate,
				"addition":   slot.Addition,
			}
		}
	}
	payload := map[string]interface{}{
		"t": result.StarType,
		"f": result.Success,
		"n": result.Consumed,
		"d": slotRecord,
	}
	_ = ctx.Connection.SendCallback("onAddStarAddition", payload)

	if result.Success {
		h.pushStatRefresh(ctx, charID)
	}

	return nil, nil
}
