// Open-sourced by BaoLT

package magicweapon

import (
	"strconv"

	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) GetMWSkills(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
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

	skills, err := h.mwService.GetMWSkills(ctx.Context, charID, itemID)
	if err != nil {
		return nil, err
	}
	out := make(map[string]interface{}, len(skills))
	for k, v := range skills {
		out[k] = v
	}
	return out, nil
}

func (h *Handler) MagicWeaponResetSkill(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 3 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	equipID, ok1 := parseFlexibleInt64(args[0])
	stoneID, ok2 := parseFlexibleInt64(args[1])
	if !ok1 || !ok2 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	pos, ok := parseSkillPosition(args[2])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, pkgerrors.ErrUnauthorized
	}

	result, item, err := h.mwService.ResetMagicWeaponSkill(ctx.Context, charID, equipID, stoneID, pos)
	if err != nil {
		h.logger.Warn("MW skill reset failed", zap.Error(err))
		return nil, err
	}
	if !result.Success {
		return map[string]interface{}{"succ": false}, nil
	}

	if result.WasEquipped {
		h.pushMWSkillUpdate(ctx, charID)
	}
	h.finalizeItemMutation(ctx, charID, item, result.WasEquipped)

	return map[string]interface{}{
		"succ": true,
		"num":  result.StoneRemaining,
		"sid":  result.NewSkillID,
	}, nil
}

func parseSkillPosition(arg interface{}) (int, bool) {
	if n, ok := parseFlexibleInt64(arg); ok {
		return int(n), true
	}
	if s, ok := arg.(string); ok {
		if n, err := strconv.Atoi(s); err == nil {
			return n, true
		}
	}
	return 0, false
}
