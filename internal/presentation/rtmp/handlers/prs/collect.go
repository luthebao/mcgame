// Open-sourced by BaoLT

// PRS chip collect / swap RPC actions: freePRSCollect, goldPRSCollect (148 gold),
// goldPRSCollectThree (888 gold), swapPRSChip, swapPRSChipTimes. Each is a push-style
// RPC (client passes a null responder, sends only cid). On success they push
// updatePRSChipBag (the new bag) and one onGetPRSChip{t,id,num} per yielded chip; the
// swap variants additionally push updatePRSExcBag (the drained staging slots).
package prs

import (
	appprs "mcgame-server/internal/application/prs"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) FreeCollect(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	state, rewards, err := h.service.FreeCollect(ctx.Context, charID)
	if err != nil {
		h.logger.Warn("freePRSCollect failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	h.pushChipDraw(ctx, state, rewards)
	return nil, nil
}

func (h *Handler) GoldCollect(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	state, rewards, err := h.service.GoldCollect(ctx.Context, charID)
	if err != nil {
		h.logger.Warn("goldPRSCollect failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	h.pushChipDraw(ctx, state, rewards)
	return nil, nil
}

func (h *Handler) GoldCollectThree(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	state, rewards, err := h.service.GoldCollectThree(ctx.Context, charID)
	if err != nil {
		h.logger.Warn("goldPRSCollectThree failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	h.pushChipDraw(ctx, state, rewards)
	return nil, nil
}

func (h *Handler) SwapChip(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	state, rewards, err := h.service.SwapChip(ctx.Context, charID)
	if err != nil {
		h.logger.Warn("swapPRSChip failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	h.pushChipSwap(ctx, state, rewards)
	return nil, nil
}

func (h *Handler) SwapChipTimes(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	state, rewards, err := h.service.SwapChipTimes(ctx.Context, charID)
	if err != nil {
		h.logger.Warn("swapPRSChipTimes failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	h.pushChipSwap(ctx, state, rewards)
	return nil, nil
}

func (h *Handler) pushChipDraw(ctx *rtmp.RPCContext, state *appprs.State, rewards []appprs.ChipReward) {
	h.push(ctx, "updatePRSChipBag", state.ChipBagWire())
	h.pushChipRewards(ctx, rewards)
}

func (h *Handler) pushChipSwap(ctx *rtmp.RPCContext, state *appprs.State, rewards []appprs.ChipReward) {
	h.push(ctx, "updatePRSExcBag", state.ExcBagWire())
	h.push(ctx, "updatePRSChipBag", state.ChipBagWire())
	h.pushChipRewards(ctx, rewards)
}

func (h *Handler) pushChipRewards(ctx *rtmp.RPCContext, rewards []appprs.ChipReward) {
	for _, r := range rewards {
		h.push(ctx, "onGetPRSChip", map[string]interface{}{"t": r.TableID, "id": r.ID, "num": r.Num})
	}
}
