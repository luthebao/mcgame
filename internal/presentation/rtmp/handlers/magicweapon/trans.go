// Open-sourced by BaoLT

package magicweapon

import (
	"mcgame-server/internal/infrastructure/rtmp"
	"mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) MWTrans(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 4 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	srcID, ok1 := parseFlexibleInt64(args[0])
	tgtID, ok2 := parseFlexibleInt64(args[1])
	stoneID, ok3 := parseFlexibleInt64(args[2])
	if !ok1 || !ok2 || !ok3 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	passwordHash, _ := args[3].(string)
	if passwordHash == "" {
		return nil, pkgerrors.ErrInvalidArgs
	}

	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, pkgerrors.ErrUnauthorized
	}
	if h.accountRepo != nil && ctx.AccountID != "" {
		if err := utils.VerifySecondaryPassword(ctx.Context, h.accountRepo, ctx.AccountID, passwordHash); err != nil {
			utils.NotifySecondaryPasswordFailure(ctx.Connection)
			return map[string]interface{}{"succ": false}, nil
		}
		utils.CacheSecondaryPassword(ctx.Connection, passwordHash)
	}

	res, tgt, src, srcSID, err := h.mwService.TransMagicWeapon(ctx.Context, charID, srcID, tgtID, stoneID)
	if err != nil {
		h.logger.Warn("MW trans failed", zap.Error(err))
		return nil, err
	}
	if !res.Success {
		return map[string]interface{}{"succ": false, "msg": res.Message}, nil
	}

	if src != nil {
		h.pushItemDelete(ctx, srcSID)
	}
	h.finalizeItemMutation(ctx, charID, tgt, res.WasEquipped)

	return map[string]interface{}{
		"succ": true,
		"msg":  res.Message,
		"num":  res.StoneRemaining,
	}, nil
}
