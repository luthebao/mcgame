// Open-sourced by BaoLT

package magicweapon

import (
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) MagicWeaponStage(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	equipID, ok1 := parseFlexibleInt64(args[0])
	crystalID, ok2 := parseFlexibleInt64(args[1])
	if !ok1 || !ok2 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, pkgerrors.ErrUnauthorized
	}

	result, item, err := h.mwService.StageMagicWeapon(ctx.Context, charID, equipID, crystalID)
	if err != nil {
		h.logger.Warn("MW stage failed", zap.Error(err))
		return nil, err
	}
	if !result.Success {
		return map[string]interface{}{"msg": result.Message}, nil
	}

	h.finalizeItemMutation(ctx, charID, item, result.WasEquipped)

	return map[string]interface{}{
		"msg":      result.Message,
		"update":   true,
		"itemId":   result.ItemID,
		"flagStr":  result.FlagStr,
		"propNum1": result.NewPropNum1,
		"propNum2": result.NewPropNum2,
		"num":      result.StoneRemaining,
	}, nil
}
