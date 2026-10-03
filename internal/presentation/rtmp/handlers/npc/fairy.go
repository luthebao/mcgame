// Open-sourced by BaoLT

// NPC-driven fairy adoption. The adopt_free_fairy dialog option grants the free
// angel fairy (no client RPC exists for adoption) and pushes onAddFairy so the
// client appends it to the roster without an initCharFairy re-fetch. A repeat adopt
// is reported as already-owned rather than minting duplicates.
package npc

import (
	"errors"
	"fmt"
	"strconv"

	appfairy "mcgame-server/internal/application/fairy"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

const fairyNpcID = 1637

func (h *Handler) adoptFreeFairy(ctx *rtmp.RPCContext) {
	if ctx == nil || ctx.Connection == nil {
		return
	}
	if h.fairyService == nil {
		ctx.Connection.SendCallback("onNpcMsg", fairyNpcID, "Tính năng đang phát triển")
		return
	}
	charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		ctx.Connection.SendCallback("onNpcMsg", fairyNpcID, "Nhận nuôi thất bại")
		return
	}
	dto, err := h.fairyService.Adopt(ctx.Context, charID, appfairy.FreeFairyTid)
	if err != nil {
		if errors.Is(err, appfairy.ErrFairyAlreadyOwned) {
			ctx.Connection.SendCallback("onNpcMsg", fairyNpcID, "Bạn đã sở hữu Tiểu Tinh Linh này rồi.")
			return
		}
		h.logger.Warn("adopt_free_fairy failed", zap.Int64("char_id", charID), zap.Error(err))
		ctx.Connection.SendCallback("onNpcMsg", fairyNpcID, "Nhận nuôi thất bại")
		return
	}
	ctx.Connection.SendCallback("onAddFairy", dto)
	ctx.Connection.SendCallback("onNpcMsg", fairyNpcID, "Bạn đã nhận nuôi 1 Tiểu Tinh Linh")
}

func (h *Handler) listBuyableFairies(ctx *rtmp.RPCContext) {
	if ctx == nil || ctx.Connection == nil {
		return
	}
	if h.fairyService == nil {
		ctx.Connection.SendCallback("onNpcMsg", fairyNpcID, "Tính năng đang phát triển")
		return
	}
	buyable := h.fairyService.PurchasableFairies()
	if len(buyable) == 0 {
		ctx.Connection.SendCallback("onNpcMsg", fairyNpcID, "Hiện chưa có Tinh Linh để mua.")
		return
	}
	options := make([]map[string]interface{}, 0, len(buyable)+1)
	for _, b := range buyable {
		options = append(options, map[string]interface{}{
			"label": fmt.Sprintf("%s ( %d vàng )", b.Name, b.Cost),
			"func":  fmt.Sprintf("buy_fairy_%d", b.Tid),
		})
	}
	options = append(options, map[string]interface{}{"label": "Đóng", "func": "close_dialog"})
	ctx.Connection.SendCallbackSync("onList", fairyNpcID, "Mua Tinh Linh", "Chọn Tinh Linh bạn muốn mua:", options)
}

func (h *Handler) buyFairy(ctx *rtmp.RPCContext, tid int) {
	if ctx == nil || ctx.Connection == nil {
		return
	}
	if h.fairyService == nil {
		ctx.Connection.SendCallback("onNpcMsg", fairyNpcID, "Tính năng đang phát triển")
		return
	}
	charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		ctx.Connection.SendCallback("onNpcMsg", fairyNpcID, "Mua thất bại")
		return
	}
	dto, err := h.fairyService.BuyFairy(ctx.Context, charID, tid)
	if err != nil {
		switch {
		case errors.Is(err, appfairy.ErrFairyAlreadyOwned):
			ctx.Connection.SendCallback("onNpcMsg", fairyNpcID, "Bạn đã sở hữu Tinh Linh này rồi.")
		case errors.Is(err, appfairy.ErrInsufficientGold):
			ctx.Connection.SendCallback("onNpcMsg", fairyNpcID, "Bạn không đủ vàng.")
		case errors.Is(err, appfairy.ErrFairyMissing):
			ctx.Connection.SendCallback("onNpcMsg", fairyNpcID, "Không tìm thấy Tinh Linh này.")
		default:
			h.logger.Warn("buy_fairy failed", zap.Int64("char_id", charID), zap.Int("tid", tid), zap.Error(err))
			ctx.Connection.SendCallback("onNpcMsg", fairyNpcID, "Mua thất bại")
		}
		return
	}
	ctx.Connection.SendCallback("onAddFairy", dto)
	ctx.Connection.SendCallback("onNpcMsg", fairyNpcID, "Mua Tinh Linh thành công")
}
