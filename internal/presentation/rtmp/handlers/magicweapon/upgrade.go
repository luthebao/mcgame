// Open-sourced by BaoLT

package magicweapon

import (
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) GetSpiritRequire(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
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

	val, err := h.mwService.GetSpiritRequire(ctx.Context, charID, itemID)
	if err != nil {
		return nil, err
	}
	return map[string]interface{}{"value": val}, nil
}

func (h *Handler) MWeaponUpgrade(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
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

	result, item, _, err := h.mwService.UpgradeMagicWeapon(ctx.Context, charID, itemID)
	if err != nil {
		h.logger.Warn("MW upgrade failed", zap.Error(err))
		return nil, err
	}
	if !result.Success {
		return map[string]interface{}{
			"succ":     false,
			"failType": result.FailType,
			"msg":      result.Message,
		}, nil
	}

	h.finalizeItemMutation(ctx, charID, item, item != nil && item.IsEquipped())

	resp := map[string]interface{}{
		"succ":  true,
		"level": result.NewLevel,
		"color": result.ColorCode,
	}
	if result.NextRequire > 0 {
		resp["require"] = result.NextRequire
	}
	return resp, nil
}
