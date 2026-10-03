// Open-sourced by BaoLT

// PRS RPC action implementations.
package prs

import (
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) InitPanel(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return emptyPanel(), nil
	}
	data, err := h.service.GetPanel(ctx.Context, charID)
	if err != nil {
		h.logger.Error("initPRSPanel failed", zap.Int64("char_id", charID), zap.Error(err))
		return emptyPanel(), nil
	}
	return data, nil
}

func (h *Handler) AddSoulTreeLvl(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	data, err := h.service.AddSoulTreeLvl(ctx.Context, charID)
	if err != nil {
		h.logger.Warn("addSoulTreeLvl failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	h.push(ctx, "updatePRSPanel", data)
	return nil, nil
}

func (h *Handler) ReplaceShow(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	showID, ok := intArg(args, 1)
	if !ok {
		return nil, nil
	}
	prsUseID, err := h.service.ReplaceShow(ctx.Context, charID, showID)
	if err != nil {
		h.logger.Warn("replacePRSShow failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	h.push(ctx, "onReplacePRSShow", map[string]interface{}{"cid": charID, "prsUseId": prsUseID})
	return nil, nil
}

func (h *Handler) CancelShow(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	prsUseID, err := h.service.CancelShow(ctx.Context, charID)
	if err != nil {
		h.logger.Warn("cancelPRSShow failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	h.push(ctx, "onReplacePRSShow", map[string]interface{}{"cid": charID, "prsUseId": prsUseID})
	return nil, nil
}

func (h *Handler) ActiveShow(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	showID, ok := intArg(args, 1)
	if !ok {
		return nil, nil
	}
	data, err := h.service.ActiveShow(ctx.Context, charID, showID)
	if err != nil {
		h.logger.Warn("activePRSShow failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	h.push(ctx, "updatePRSPanel", data)
	return nil, nil
}

func (h *Handler) ActiveShowSpe(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	showID, ok := intArg(args, 1)
	if !ok {
		return nil, nil
	}
	data, err := h.service.ActiveShowSpe(ctx.Context, charID, showID)
	if err != nil {
		h.logger.Warn("activePRSShowSpe failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	h.push(ctx, "updatePRSPanel", data)
	return nil, nil
}

func (h *Handler) MoveChip(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	fromPos, ok1 := intArg(args, 1)
	toPos, ok2 := intArg(args, 2)
	direction, ok3 := intArg(args, 3)
	if !ok1 || !ok2 || !ok3 {
		return nil, nil
	}
	state, err := h.service.MoveChip(ctx.Context, charID, fromPos, toPos, direction)
	if err != nil {
		h.logger.Warn("movePRSChip failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	h.push(ctx, "updatePRSChipBag", state.ChipBagWire())
	h.push(ctx, "updatePRSExcBag", state.ExcBagWire())
	return nil, nil
}

func (h *Handler) ExchangeChip(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	chipID, ok := intArg(args, 1)
	if !ok {
		return nil, nil
	}
	state, reward, err := h.service.ExchangeChip(ctx.Context, charID, chipID)
	if err != nil {
		h.logger.Warn("exchangePRSChip failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	h.push(ctx, "updatePRSChipBag", state.ChipBagWire())
	if reward != nil {
		h.push(ctx, "onGetPRSChip", map[string]interface{}{"t": reward.TableID, "id": reward.ID, "num": reward.Num})
	}
	return nil, nil
}

func (h *Handler) UpdateActiveShow(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	if err := h.service.UpdateActiveShow(ctx.Context, charID, expiredShowIDs(args)); err != nil {
		h.logger.Warn("updateActivePRSShow failed", zap.Int64("char_id", charID), zap.Error(err))
	}
	return nil, nil
}

func (h *Handler) push(ctx *rtmp.RPCContext, method string, payload interface{}) {
	if ctx == nil || ctx.Connection == nil {
		return
	}
	if err := ctx.Connection.SendCallback(method, payload); err != nil {
		h.logger.Warn("prs push failed", zap.String("method", method), zap.Error(err))
	}
}
