// Open-sourced by BaoLT

package magicweapon

import (
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) MagicWeaponRepair(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
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

	result, item, err := h.mwService.RepairMagicWeapon(ctx.Context, charID, equipID, stoneID)
	if err != nil {
		h.logger.Warn("MW repair failed", zap.Error(err))
		return nil, err
	}
	if !result.Success {
		return map[string]interface{}{"succ": false}, nil
	}

	h.finalizeItemMutation(ctx, charID, item, result.WasEquipped)

	return map[string]interface{}{
		"succ": true,
		"num":  result.StoneRemaining,
	}, nil
}

func (h *Handler) MagicWeaponAllRepair(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, pkgerrors.ErrUnauthorized
	}
	if len(args) < 2 {
		return nil, nil
	}
	equipIDs := unwrapInt64Array(args[0])
	stoneIDs := unwrapInt64Array(args[1])
	if len(equipIDs) == 0 {
		return nil, nil
	}

	repaired, _, anyEquipped, err := h.mwService.AllRepairMagicWeapon(ctx.Context, charID, equipIDs, stoneIDs)
	if err != nil {
		h.logger.Warn("MW all-repair failed", zap.Error(err))
		return nil, err
	}

	for _, it := range repaired {
		h.pushItemUpdate(ctx, it)
	}
	if anyEquipped {
		if char := h.reloadChar(ctx.Context, charID); char != nil {
			h.refreshStats(ctx, char)
		}
	}
	return nil, nil
}

func unwrapInt64Array(arg interface{}) []int64 {
	if arg == nil {
		return nil
	}
	if arr, ok := arg.([]interface{}); ok {
		out := make([]int64, 0, len(arr))
		for _, v := range arr {
			if n, ok := parseFlexibleInt64(v); ok {
				out = append(out, n)
			}
		}
		return out
	}
	if m, ok := arg.(map[string]interface{}); ok {
		out := make([]int64, 0, len(m))
		for _, v := range m {
			if n, ok := parseFlexibleInt64(v); ok {
				out = append(out, n)
			}
		}
		return out
	}
	return nil
}
