// Open-sourced by BaoLT

package magicweapon

import (
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) ActivateMWPro(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	itemID, ok1 := parseFlexibleInt64(args[0])
	idx, ok2 := parseFlexibleInt64(args[1])
	if !ok1 || !ok2 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, pkgerrors.ErrUnauthorized
	}

	res, item, err := h.mwService.ActivateMWPro(ctx.Context, charID, itemID, int(idx))
	if err != nil {
		h.logger.Warn("MW activate failed", zap.Error(err))
		return nil, err
	}
	if res.Failed {
		return map[string]interface{}{"f": true, "index": res.Index}, nil
	}

	goldPayload := map[string]interface{}{}
	if res.UsedBound {
		goldPayload["goldBind"] = res.GoldBind
	} else {
		goldPayload["gold"] = res.Gold
	}
	ctx.Connection.SendCallback("onUPP", goldPayload)
	h.finalizeItemMutation(ctx, charID, item, res.WasEquipped)

	return map[string]interface{}{
		"index": res.Index,
		"flag": map[string]interface{}{
			"propType": res.Slot.PropType,
			"propVal":  res.Slot.PropVal,
		},
	}, nil
}
