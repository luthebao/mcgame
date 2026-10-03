// Open-sourced by BaoLT

package magicweapon

import (
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const tableEquiptInstance = 18

func (h *Handler) QueryMWResetPropMax(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	itemID, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, pkgerrors.ErrUnauthorized
	}
	res, err := h.mwService.QueryMWResetPropMax(ctx.Context, charID, itemID)
	if err != nil {
		return nil, err
	}
	return map[string]interface{}{
		"succ":            res.Success,
		"maxMainPropNum1": res.MaxMainPropNum1,
		"maxMainPropNum2": res.MaxMainPropNum2,
	}, nil
}

func (h *Handler) MagicWeaponResetProp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	equipID, ok1 := parseFlexibleInt64(args[0])
	stoneID, ok2 := parseFlexibleInt64(args[1])
	if !ok1 || !ok2 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, pkgerrors.ErrUnauthorized
	}

	res, err := h.mwService.MagicWeaponResetProp(ctx.Context, charID, equipID, stoneID)
	if err != nil {
		h.logger.Warn("MW reset prop failed", zap.Error(err))
		return nil, err
	}
	if !res.Success || res.Preview == nil {
		return map[string]interface{}{"succ": false}, nil
	}

	preview := res.Preview
	ctx.Connection.SendCallback("onMagicWeaponResetProp", map[string]interface{}{
		"type":             tableEquiptInstance,
		"itemId":           preview.ItemID,
		"newMainPropNum1":  preview.NewMainPropNum1,
		"oldMainPropNum1":  preview.OldMainPropNum1,
		"newMainPropNum2":  preview.NewMainPropNum2,
		"oldMainPropNum2":  preview.OldMainPropNum2,
	})

	return map[string]interface{}{
		"succ": true,
		"num":  res.StoneRemaining,
	}, nil
}

func (h *Handler) ApplyMWResetProp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, pkgerrors.ErrUnauthorized
	}
	res, item, err := h.mwService.ApplyMWResetProp(ctx.Context, charID)
	if err != nil {
		h.logger.Warn("MW apply reset failed", zap.Error(err))
		return nil, err
	}
	if !res.Applied {
		return nil, nil
	}

	if item != nil {
		h.pushItemUpdate(ctx, item)
	}
	ctx.Connection.SendCallback("updateMWResetView", map[string]interface{}{
		"itemId": res.ItemID,
	})
	if res.WasEquipped {
		if char := h.reloadChar(ctx.Context, charID); char != nil {
			h.refreshStats(ctx, char)
		}
	}
	return nil, nil
}
