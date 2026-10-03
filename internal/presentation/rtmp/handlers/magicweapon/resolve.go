// Open-sourced by BaoLT

package magicweapon

import (
	"mcgame-server/internal/infrastructure/rtmp"
	"mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) MagicWeaponResolve(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	itemID, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	passwordHash, _ := args[1].(string)
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

	res, material, oldEquip, oldSID, err := h.mwService.ResolveMagicWeapon(ctx.Context, charID, itemID)
	if err != nil {
		h.logger.Warn("MW resolve failed", zap.Error(err))
		return nil, err
	}
	if !res.Success {
		return map[string]interface{}{"succ": false}, nil
	}

	if oldEquip != nil {
		h.pushItemDelete(ctx, oldSID)
	}
	h.finalizeItemMutation(ctx, charID, material, res.WasEquipped)

	return map[string]interface{}{
		"succ":         true,
		"type":         res.MaterialType,
		"giid":         res.MaterialTID,
		"stackNum":     res.StackNum,
		"temp_quality": res.TempQuality,
	}, nil
}
