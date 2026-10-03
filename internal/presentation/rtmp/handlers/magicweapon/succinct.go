// Open-sourced by BaoLT

package magicweapon

import (
	domainmw "mcgame-server/internal/domain/magicweapon"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) ShowMWInfo(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
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
	flag, err := h.mwService.ShowMWInfo(ctx.Context, charID, itemID)
	if err != nil {
		return nil, err
	}
	return map[string]interface{}{
		"flag": flagToMap(flag),
	}, nil
}

func (h *Handler) SucinctMW(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	itemID, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	lockArr := parseLockArr(args[1])
	autoBuy := false
	if len(args) >= 3 {
		if b, ok := args[2].(bool); ok {
			autoBuy = b
		}
	}

	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, pkgerrors.ErrUnauthorized
	}

	res, err := h.mwService.SucinctMW(ctx.Context, charID, itemID, lockArr, autoBuy)
	if err != nil {
		h.logger.Warn("MW succinct failed", zap.Error(err))
		return nil, err
	}
	return map[string]interface{}{
		"newPro":  flagToMap(res.NewProp),
		"lockArr": []interface{}{lockArr[0], lockArr[1], lockArr[2]},
	}, nil
}

func (h *Handler) OnSureSuccinctMW(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	confirm, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, pkgerrors.ErrUnauthorized
	}

	res, item, err := h.mwService.OnSureSuccinctMW(ctx.Context, charID, int(confirm))
	if err != nil {
		h.logger.Warn("MW sure succinct failed", zap.Error(err))
		return nil, err
	}
	if !res.HadPending {
		return nil, nil
	}

	h.finalizeItemMutation(ctx, charID, item, res.WasEquipped)

	return map[string]interface{}{
		"flag": flagToMap(res.Flag),
	}, nil
}

func (h *Handler) SucinctMWByVip(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		return nil, nil
	}
	itemID, ok := parseFlexibleInt64(args[0])
	if !ok {
		return nil, nil
	}
	lockArr := parseLockArr(args[1])
	autoBuy := false
	if len(args) >= 3 {
		if b, ok := args[2].(bool); ok {
			autoBuy = b
		}
	}
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, nil
	}
	res, err := h.mwService.SucinctMW(ctx.Context, charID, itemID, lockArr, autoBuy)
	if err != nil {
		h.logger.Warn("MW vip succinct failed", zap.Error(err))
		return nil, nil
	}
	ctx.Connection.SendCallback("onSureSuccinctMW", map[string]interface{}{
		"flag": flagToMap(res.NewProp),
	})
	return nil, nil
}

func parseLockArr(arg interface{}) [3]bool {
	var out [3]bool
	if arr, ok := arg.([]interface{}); ok {
		for i := 0; i < 3 && i < len(arr); i++ {
			if b, ok := arr[i].(bool); ok {
				out[i] = b
			}
		}
	}
	return out
}

func flagToMap(f *domainmw.SubFlag) map[string]interface{} {
	if f == nil {
		return map[string]interface{}{}
	}
	out := make(map[string]interface{})
	if f.Succ0 != nil {
		out["succ0"] = map[string]interface{}{"propType": f.Succ0.PropType, "propVal": f.Succ0.PropVal}
	}
	if f.Succ1 != nil {
		out["succ1"] = map[string]interface{}{"propType": f.Succ1.PropType, "propVal": f.Succ1.PropVal}
	}
	if f.Succ2 != nil {
		out["succ2"] = map[string]interface{}{"propType": f.Succ2.PropType, "propVal": f.Succ2.PropVal}
	}
	return out
}
