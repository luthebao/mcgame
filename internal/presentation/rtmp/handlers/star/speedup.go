// Open-sourced by BaoLT

// SpeedUpStarLvUp RPC handler.
// Args: starType (int), useItem (bool), numItems (int), itemID (int64).
// Consumes one speed-up item for the given star type and sets finishDate to
// now-1ms so Finish can be called immediately.
// Response: {"d": starsStateMap, "n": itemsConsumed} per onSpeedUpStarLvUp.
package star

import (
	appstar "mcgame-server/internal/application/star"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) SpeedUpStarLvUp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("SpeedUpStarLvUp called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	if h.service == nil {
		return errResponse("star service not configured"), nil
	}
	if len(args) < 1 {
		return errResponse("missing starType argument"), nil
	}
	starType, err := parseIntArg(args[0])
	if err != nil {
		return errResponse("invalid starType argument"), nil
	}
	charID, ok := characterID(ctx)
	if !ok {
		return errResponse("invalid character id"), nil
	}

	var itemID int64
	if len(args) >= 4 {
		itemID = parseInt64Arg(args[3])
	}

	state, err := h.service.SpeedUp(ctx.Context, charID, starType, itemID)
	if err != nil {
		h.logServiceError("speedUpStarLvUp", ctx, err)
		return false, nil
	}
	return map[string]interface{}{
		"d": appstar.StateToWire(state),
		"n": 1,
	}, nil
}
