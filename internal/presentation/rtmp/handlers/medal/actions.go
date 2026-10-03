// Open-sourced by BaoLT

// Medal (Ấn Chương) RPC action implementations.
package medal

import (
	"strconv"

	appmedal "mcgame-server/internal/application/medal"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) GetInfo(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return emptyInfo(), nil
	}
	info, err := h.service.GetInfo(ctx.Context, charID)
	if err != nil {
		h.logger.Error("getMedalInfo failed", zap.Int64("char_id", charID), zap.Error(err))
		return emptyInfo(), nil
	}
	return info, nil
}

func (h *Handler) ArrangeBag(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return map[string]interface{}{}, nil
	}
	bag, err := h.service.ArrangeBag(ctx.Context, charID)
	if err != nil {
		h.logger.Warn("arrangeMedalBag failed", zap.Int64("char_id", charID), zap.Error(err))
		return map[string]interface{}{}, nil
	}
	return bag, nil
}

func (h *Handler) MoveMedal(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	fromSid, ok1 := intArg(args, 0)
	toSid, ok2 := intArg(args, 1)
	if !ok1 || !ok2 {
		return nil, nil
	}
	res, err := h.service.MoveMedal(ctx.Context, charID, fromSid, toSid)
	if err != nil {
		h.logger.Warn("moveMedal failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	payload := map[string]interface{}{
		"type":       res.Type,
		"joinTid":    res.JoinTid,
		"petJoinTid": res.PetJoinTid,
		"pa":         entriesToWire(res.ChangedPA),
		"ba":         entriesToWire(res.ChangedBA),
	}
	if res.HasDel {
		payload["del"] = res.Del
	}
	h.push(ctx, "onMoveMedal", payload)
	return nil, nil
}

func (h *Handler) UpMedal(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	index, ok := intArg(args, 0)
	if !ok {
		return nil, nil
	}
	res, err := h.service.UpMedal(ctx.Context, charID, index)
	if err != nil {
		h.logger.Warn("upMedal failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	h.push(ctx, "onUpMedal", opResultWire(res))
	return nil, nil
}

func (h *Handler) BreakMedal(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	index, ok1 := intArg(args, 0)
	count, ok2 := intArg(args, 1)
	breakType, ok3 := intArg(args, 2)
	if !ok1 || !ok2 || !ok3 {
		return nil, nil
	}
	res, err := h.service.BreakMedal(ctx.Context, charID, index, count, breakType)
	if err != nil {
		if err == appmedal.ErrRareProtected {
			return "ban", nil
		}
		h.logger.Warn("breakMedal failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	h.push(ctx, "onBreakMedal", opResultWire(res))
	return nil, nil
}

func opResultWire(res *appmedal.OpResult) map[string]interface{} {
	payload := map[string]interface{}{
		"medalExp": res.MedalExp,
		"ba":       entriesToWire(res.BA),
	}
	if res.HasDel {
		payload["del"] = res.Del
	}
	return payload
}

func entriesToWire(entries map[int]appmedal.BagEntry) map[string]interface{} {
	out := make(map[string]interface{}, len(entries))
	for slot, entry := range entries {
		if entry.T <= 0 || entry.N <= 0 {
			continue
		}
		out[strconv.Itoa(slot)] = map[string]interface{}{
			"i": entry.I,
			"t": entry.T,
			"n": entry.N,
		}
	}
	return out
}
