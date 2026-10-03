// Open-sourced by BaoLT

// PmStarExchage RPC handler (intentional typo matches Flash client call).
// Args: sid (int64 source item instance ID), giid (int target template ID),
// num (int quantity), tempFlag (bool temp-bag source flag, unused server-side).
// Response: {flag, finalNum, finalNme, slotId} per onStarExchage callback.
package star

import (
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) PmStarExchage(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("PmStarExchage called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	if h.service == nil {
		return errResponse("star service not configured"), nil
	}
	if len(args) < 3 {
		return errResponse("missing arguments"), nil
	}
	sourceItemID := parseInt64Arg(args[0])
	targetTemplateID, err := parseIntArg(args[1])
	if err != nil || targetTemplateID <= 0 {
		return errResponse("invalid target template id"), nil
	}
	num, err := parseIntArg(args[2])
	if err != nil || num <= 0 {
		return errResponse("invalid quantity"), nil
	}

	charID, ok := characterID(ctx)
	if !ok {
		return errResponse("invalid character id"), nil
	}

	result, err := h.service.Exchange(ctx.Context, charID, sourceItemID, targetTemplateID, num)
	if err != nil {
		h.logger.Warn("PmStarExchage exchange failed",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
		return map[string]interface{}{"flag": false}, nil
	}

	return map[string]interface{}{
		"flag":     true,
		"finalNum": result.FinalNum,
		"finalNme": result.FinalNme,
		"slotId":   result.SlotID,
	}, nil
}
